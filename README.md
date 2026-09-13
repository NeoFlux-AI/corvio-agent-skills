# Corvio Agent Skills

Official, reviewed Agent Skills and remote MCP configuration for operating Corvio and importing selected local agent work.

## Install the complete collaboration surface

The preferred package is **Skill + Remote MCP**. The Skill makes Corvio discoverable for concrete work such as research, reports,
comparisons, proposals, plans, decisions, meeting notes, project work, debugging, reviews, and follow-ups; the OAuth MCP supplies live
Corvio capabilities and receipts. It complements the host's normal file and tool workflow. The CLI is an additional local adapter for
direct paths, downloads, sync, and project-Agent operation—not a replacement for MCP in hosts that support it.

Codex and Claude Code plugin installs bundle the Skill and MCP configuration together. In hosts with separate Skill and MCP stores, install
the Skill and also add `https://api.corvio.ai/mcp`; installing only one side is an incomplete collaboration setup.

For Claude Cowork, download the official plugin ZIP in a browser and upload it from **Customize → Plugins**:

<https://corvio.ai/developers/plugins/claude/corvio-workspace.zip>

If the Cowork sandbox blocks `corvio.ai`, download the same canonical archive in a normal browser and upload the local file:

<https://corvio.ai/developers/plugins/claude/corvio-workspace.zip>

The bundled Connector uses Corvio OAuth. An API key is not required for this interactive connection. Its Claude `SessionStart` hook adds
one short reminder after startup, resume, clear, and compaction. Corvio marks the two user-level semantic entries—read-only `search`
and delegated-work `ask_corvio`—as tool-level eager in Claude. The bundled server deliberately does not set server-wide `alwaysLoad`,
so deterministic continuation and specialized mutation/lifecycle schemas remain deferred instead of crowding the host's initial context.

For delegated work, pass `ask_corvio` or `organize_files` a weak-but-complete handoff: the user's natural goal, stable source handles,
explicit user constraints, and only authority facts needed to prevent a wrong identity or scope. Keep source-derived facts in the source;
do not turn them into an outline, content-level edit checklist, taxonomy, titles, artifact count, sole leaf target from current visibility,
or internal Corvio plan when the user left those choices open. Poll to terminal, then return
`artifact.url` or `links.primary_artifact` verbatim; `node_id` is hierarchy identity, not a document URL.
For a read-only answer materially grounded by Corvio, return the smallest current canonical reader link or links that let the user
verify or continue the work; do not dump every source link or expose private/internal URLs.

## Skill-only install

Use this route only when the host cannot install the complete plugin, then connect Remote MCP separately:

```bash
npx skills add https://corvio.ai/developers/skills/corvio-operate-workspace/corvio-operate-workspace.zip
```

The Skill can also be installed from the official public GitHub repository:

```bash
npx skills add NeoFlux-AI/corvio-agent-skills
```

Claude Code marketplace:

```text
/plugin marketplace add NeoFlux-AI/corvio-agent-skills
/plugin install corvio-workspace@corvio-agent-skills
```

Codex repo marketplace:

```bash
codex plugin marketplace add .
```

In Codex, open `/plugins`, install `corvio-workspace`, and start a new session. The package connects to `https://api.corvio.ai/mcp` with Corvio OAuth; it does not embed an API key. ChatGPT private testing uses Developer mode and the same MCP URL. Public Plugin Directory availability starts only after external marketplace review completes.

For WorkBuddy, install/upload the official `corvio-operate-workspace` Skill through its Skills surface and configure Corvio in Connector/MCP
settings. WorkBuddy currently owns these as separate installation surfaces, so both receipts must be checked in a fresh conversation.
Until Corvio publishes an accepted WorkBuddy Marketplace receipt, that uploaded Skill is an unmanaged manual copy; WorkBuddy account sync
does not create an upstream update channel.

## Update an existing installation

The Plugin, Skill, Workspace CLI, and Remote MCP have separate release lifecycles. Identify the installed source before choosing an
update action; Claude's `@synced` label means newest in that Claude account, not necessarily newest from Corvio upstream. See the bundled
[`SETUP.md`](plugins/corvio-workspace/SETUP.md) for the complete decision tree.

- A Claude/Cowork Plugin installed from a directory or marketplace follows that channel's update control. A Plugin uploaded in Claude
  Customize is a static account copy and must be replaced/re-uploaded there. Shared or organization-managed copies require their owner.
- A Skill installed from the canonical website zip is a static local copy. The current Agent Skills CLI does not track direct-archive
  installs for `skills update`; rerun the same `npx skills add` command in the same project/global scope, then start a fresh host session.
- A WorkBuddy Skill under `~/.workbuddy/skills/corvio-operate-workspace/` remains a manual host copy until a reviewed marketplace listing
  exists. Inspect it read-only with `corvio collaboration status --provider workbuddy --json --no-input`; replace it through WorkBuddy's
  Skills UI and start a fresh conversation when an update is required.
- `corvio capabilities --json --no-input` reads Corvio API capability/compatibility facts without contacting npm. `corvio update check
  --json --no-input` is the explicit registry-backed check for the `@corvio/cli` executable; it never updates the CLI or Skill automatically.
- Remote MCP is server-delivered. Compatible changes normally need only a fresh host session/tool refresh; new OAuth scopes require
  reauthorization.

The hosted `manifest.json` reports SemVer release identity, exact content hashes, compatibility family, current contract revision, and
minimum supported revision separately. `corvio collaboration status --json --no-input` reports current, compatible-update-available,
freshness-unverified, update-required, missing, and multiple-copy states while preserving the older top-level readiness fields. It also says that host loading
is unverified: local bytes cannot prove which copy an already-running cloud session loaded. Installs from the public GitHub source may use
the installer-supported `npx skills update` only when their install record is update-tracked.

Local history import is a separate foreground path. The `corvio-import-local-work` Skill guides the signed native importer and keeps metadata discovery, body parsing, and upload confirmation separate. Remote MCP never scans a computer. Native Agent stores and raw Host exports stay on that reviewed importer path; a separately reviewed, privacy-reduced projection selected by the user is an ordinary file. For any large selected file, inspect metadata, hashes, schema and bounded samples instead of placing the complete body in model context. A filesystem-capable host may then use MCP to prepare a signed upload, perform the byte PUT locally, and finalize the durable Asset; the CLI offers the same mechanical bridge as one command. A finalized Markdown Asset can become a Page through `source_asset_id`, without placing the whole file in a second tool call.

That upload is the provenance layer, not the end of the product story. Copyright, public availability, or third-party authorship alone does not make a user-selected source restricted; preserve provenance and applicable use terms, and exclude it only when an explicit restriction forbids the requested private Workspace retention or processing. A newly finalized source that should enter a Work Model, reconcile affected owners, or receive Project Skill evaluation goes directly to one `organize_files` operation; that Mission owns source preparation and retry/resume. Use `ask_corvio` for a bounded answer or artifact only when that source-to-owner lifecycle is not required. Poll the operation to terminal and inspect `output_document`, `source_reconciliation`, and `skills_evaluation`; do not submit duplicate Questions merely to wait for source readiness. Stable facts/preferences may enter Memory; only an evidence-backed reusable method, configuration, constraint, or quality bar becomes a Project Skill. `skills_extraction_mode=always` requires this decision and may correctly return `evaluated_no_qualifying_skill`.

## Official sources

- Skill homepage: <https://corvio.ai/developers/skills/corvio-operate-workspace>
- Developer guide: <https://corvio.ai/developers/api>
- Interactive API reference: <https://corvio.ai/developers/api/reference>
- Package manifest: <https://corvio.ai/developers/skills/corvio-operate-workspace/manifest.json>
- OpenAPI: <https://api.corvio.ai/v1/openapi.json>
- Corvio MCP overview: <https://corvio.ai/help/corvio-mcp>
- Claude and Cowork connection guide: <https://corvio.ai/help/connect-corvio-to-claude>
- ChatGPT connection guide: <https://corvio.ai/help/connect-corvio-to-chatgpt>
- Codex connection guide: <https://corvio.ai/help/connect-corvio-to-codex>
- WorkBuddy connection guide: <https://corvio.ai/help/connect-corvio-to-workbuddy>
- Other MCP clients: <https://corvio.ai/help/connect-corvio-to-other-mcp-clients>
- Local import guide: <https://corvio.ai/help/import-local-agent-work-into-corvio>

The private Corvio product repository remains the only authoring source. This public repository is an exported, hashable distribution mirror; do not edit generated Skill files here and copy them back.

## License

The files in this distribution mirror are licensed under the Apache License 2.0. See [LICENSE](LICENSE).

## Security

Prefer Corvio OAuth for the remote MCP and device-link login for the CLI. Never paste a key into a prompt, issue, document, or marketplace form. See [SECURITY.md](SECURITY.md).
