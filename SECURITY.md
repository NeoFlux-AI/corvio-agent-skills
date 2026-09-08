# Security

## Credentials

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

## Report a vulnerability

Send security reports to `support@corvio.ai`. Do not include live API keys or private Workspace content.
