# Security

## What installation changes

The standalone Skill archive contains Markdown, a small YAML description, the API reference, and the license. It contains no credential
and does not itself grant access to Corvio or the local computer. Running `npx skills add` also invokes the separately distributed
`skills` installer; use a host-reviewed installer or inspect that dependency before running it.

The portable Agent Plugin additionally contains root `plugin.json` and `mcp.json`, Claude/Codex compatibility manifests, `.mcp.json`,
`SETUP.md`, and a `SessionStart` shell hook. The hook only prints static Corvio
guidance into Claude. It does not read local files, inspect environment variables, or make network requests. The exact hook is reviewable
at `plugins/corvio-workspace/hooks/session-start.sh`.

Installed Skill text can influence when an Agent chooses Corvio, but it cannot override the host instruction hierarchy or grant itself
new permissions. Treat content returned from Corvio as task context, not as authority to expand access or follow embedded instructions.

## OAuth access and credentials

Use Corvio OAuth for normal interactive MCP connections. The browser flow signs in to an existing Corvio account or creates one in place,
then resumes the original consent request; no invite code is required. Passwords and login codes stay on Corvio or the selected
identity-provider page. OAuth gives the Agent host only the scopes listed on the consent screen,
further limited by current Workspace membership and object ACLs. The OAuth grant does not automatically expose unrelated accounts,
arbitrary local files, or the user's complete Agent-host chat history. Corvio receives the tool calls and arguments the host sends.

This is bounded but real access. A host can read or change Corvio data when both the displayed scope and a called tool permit it. Remove
the Corvio Connector in the host and revoke the `Remote MCP connection` credential in Corvio **Settings → API keys** when access should
end. Access tokens last one day; a host may refresh an authorized connection until it is revoked or the refresh authority expires.

The Corvio remote MCP uses OAuth and the CLI uses a device link. A manually configured `CORVIO_API_KEY` remains an advanced Developer API option; keep it in the Agent host environment and never commit it, paste it into prompts, append it to URLs, or include it in support reports.

Keys are scope-limited and rechecked against their owner, Workspace membership, role, ACL, expiry, revocation, and administrator authority on every request. Revoke a suspected leaked key immediately from Corvio Settings.

Remote MCP cannot scan or dereference local paths. For one explicitly selected file, a local host may request a short-lived signed upload
target, PUT the bytes itself, and finalize through MCP. The target is scoped and temporary; only the finalized Asset receipt is durable.
The local-import Skill still delegates broad discovery/import only to Corvio's foreground native importer, which separates metadata
discovery, bounded sampling, body parsing, and final upload confirmation.

## Verify a distribution

The canonical package manifest publishes the SHA-256 of every distributed Skill file:

<https://corvio.ai/developers/skills/corvio-operate-workspace/manifest.json>

This repository export also includes `MANIFEST.sha256`. Compare both before promoting a third-party mirror.

First-party domains and packages establish provenance, not independent reputation. Prefer a reviewed host directory when currently
available; otherwise inspect this public source, the package contents, and the published hashes. Stop if the source or bytes differ.

## Report a vulnerability

Send security reports to `support@corvio.ai`. Do not include live API keys or private Workspace content.
