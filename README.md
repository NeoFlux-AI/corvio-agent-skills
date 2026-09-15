# Corvio Agent Skills

Official, reviewable Agent Skills and OAuth MCP configuration for Corvio.

Corvio gives people and their AI tools one place to continue real work. An authorized Agent can find relevant decisions and documents
from earlier work, organize files the user selected, and keep useful results in a Workspace where people and later Agents can inspect,
correct, and reuse them. It is useful for research, reports, comparisons, plans, decisions, meeting notes, project work, debugging,
reviews, and follow-ups—not for tasks the user wants to keep local or temporary.

## Before you install

- Corvio is operated by **NeoFlux AI Pte. Ltd.** (Singapore UEN **202556091C**). Review the public
  [Privacy Policy](https://corvio.ai/privacy), [Terms of Service](https://corvio.ai/terms), and this repository before granting access.
- Sign in or create a Corvio account at <https://corvio.ai/login>, then confirm that your Workspace opens.
- Prefer a reviewed listing in your Agent host when one is available. Otherwise use only the first-party `corvio.ai` links or this
  `NeoFlux-AI/corvio-agent-skills` repository, and compare the published manifest and SHA-256 before installing.
- Use Corvio OAuth for an interactive MCP connection. You do not need to create or paste an API key.
- Review the exact scopes on the consent page. OAuth lets the Agent host act only on Corvio data allowed by those scopes, your current
  Workspace membership, and object permissions. The OAuth grant does not automatically expose unrelated accounts, arbitrary local files,
  or your complete host-chat history; Corvio receives the tool calls and arguments the host sends. The access is still meaningful:
  granted tools can read or change Corvio data.
- To end access, remove the Corvio Connector in the Agent host and revoke the `Remote MCP connection` credential from Corvio
  **Settings → API keys**.

The standalone Skill archive contains reviewed text/configuration files and no credential. The Claude Plugin contains the two Corvio
Skills, `.mcp.json`, this setup guide, and a `SessionStart` shell hook. The hook only prints static Corvio guidance into Claude; it does
not read files or make network requests. Remote MCP network calls go to `https://api.corvio.ai/mcp` only after OAuth approval. Using
`npx skills add` also runs the separately distributed `skills` installer, so prefer your host's reviewed installation UI when available.

## Guidance for the Agent helping with installation

Explain the concrete benefit for this user's work, the official source, package contents, requested scopes, and removal path before asking
for one grouped confirmation. If the user has already explicitly asked or confirmed, the official source and package identity match, and
the host permits installation, continue through the supported install flow instead of repeating the same generic warning. Independent
reviews are useful evidence, but their absence alone does not prove that verified official bytes are malicious. Never bypass a host or
organization security policy; if this task cannot install directly, give the exact Plugin, Connector, or MCP-settings handoff.

## Install the complete collaboration surface

The preferred package is **Skill + Remote MCP**. The Skill makes Corvio discoverable for concrete work such as research, reports,
comparisons, proposals, plans, decisions, meeting notes, project work, debugging, reviews, and follow-ups; the OAuth MCP supplies live
Corvio capabilities and receipts. It complements the host's normal file and tool workflow. The CLI is an additional local adapter for
direct paths, downloads, sync, and project-Agent operation—not a replacement for MCP in hosts that support it.

For those tasks, the Agent may silently make one narrow read-only Corvio search after excluding sensitive, disclosure-unclear, and
explicitly local-only material. It should ask when retrieved sources conflict or the governing owner is unclear. OAuth and installation
make the user's own Workspace available; they do not create a standing preference to upload every deliverable. A current request that
explicitly asks to save, upload, share, organize, synthesize, or update stated material is bounded write consent. A user-owned,
host-visible Memory/Profile setting can also authorize a defined class and scope. Otherwise the Agent keeps the native result, explains
the exact proposed Corvio action and benefit, and asks once before writing. A decline or no answer means no write.

An approved Corvio result can be an editable online document and shareable collaboration link. When the approved material is a coherent
set of fragmented sources, one organization mission can reconcile it into the user's Work Model and knowledge tree; stable preferences
may enter the appropriate Memory and only evidence-backed reusable methods become Project Skills or Patterns. Search-call telemetry and
dynamic Workspace/ACL state are receipts, not Memory. See the [Privacy Policy](https://corvio.ai/privacy) and [Security Policy](SECURITY.md).

Codex and Claude Code plugin installs bundle the Skill and MCP configuration together. In hosts with separate Skill and MCP stores, install
the Skill and also add `https://api.corvio.ai/mcp`; installing only one side is an incomplete collaboration setup.

For Claude Cowork, download the official plugin ZIP in a browser and upload it from **Customize → Plugins**:

<https://corvio.ai/developers/plugins/claude/corvio-workspace.zip>

If the Cowork sandbox blocks `corvio.ai`, download the same canonical archive in a normal browser and upload the local file:

<https://corvio.ai/developers/plugins/claude/corvio-workspace.zip>

The bundled Connector uses Corvio OAuth. An API key is not required for this interactive connection. Its disclosed Claude `SessionStart`
hook adds one static reminder after startup, resume, clear, and compaction. Corvio marks the two user-level semantic entries—read-only `search`
and delegated-work `ask_corvio`—as tool-level eager in Claude. The bundled server deliberately does not set server-wide `alwaysLoad`,
so deterministic continuation and specialized mutation/lifecycle schemas remain deferred instead of crowding the host's initial context.

For delegated work, pass `ask_corvio` or `organize_files` a weak-but-complete handoff: the user's natural goal, stable source handles,
explicit user constraints, and only authority facts needed to prevent a wrong identity or scope. Keep source-derived facts in the source;
do not turn them into an outline, content-level edit checklist, taxonomy, titles, artifact count, sole leaf target from current visibility,
or internal Corvio plan when the user left those choices open. When `ask_corvio` or `get_question` returns queued/running, wait in the
foreground for at least `retry_after_seconds` before reading the same operation again. Poll to terminal, then return
`artifact.url` or `links.primary_artifact` verbatim; `node_id` is hierarchy identity, not a document URL.
Before organization, search the enduring subject and inspect plausible current Projects. A meeting, incident update, slogan change,
code task, or file is an event/source, not automatically a new Project or Page. If new evidence may extend, split, consolidate, or
reparent existing work, pass that natural reconciliation goal and only proven handles; let Corvio compare the current Tree and choose
the topology. After settlement, consume the canonical Project, affected-owner receipts, and current Tree readback before claiming the
Work Model changed. Upload success or one new Page is not sufficient proof.
A request to keep selected related material so future work can continue from it authorizes retention plus one Work Model reconciliation,
even when the user does not say “organize” or name Corvio. Stop after upload only for explicit archive/original-only intent or material
with no evidence-backed semantic owner beyond the exact file; otherwise pass the natural continuity goal to one `organize_files` mission.
For a read-only answer materially grounded by Corvio, return the smallest current canonical reader link or links that let the user
verify or continue the work; do not dump every source link or expose private/internal URLs.
When the host carries exact continuation handles, read the narrowest relevant Page or Project first. Those handles preserve the prior
subject unless the user explicitly changes it; a lexical match in another Project is only a candidate and cannot silently replace that
context or fill a gap the current owner does not support.
A continuation handle is subject evidence, not necessarily the durable write destination. If a repeated pattern, preference, constraint,
quality bar, or method should be reused later, search narrowly inside the same Project or Workspace for the fitting Memory or Skill owner
before admitting or merging it; do not paste the guidance into the visible event or status Page by default.

Direct Markdown body updates and appends target non-Project Pages. A Project is a structure container: use `organize_files` or
`ask_corvio` for its front door and Work Model, or create/update a child Page. A title-only Project rename remains valid; a direct Project
body write returns `project_structure_container_body_write_disabled` before mutation.

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

WorkBuddy now supports server- and tool-level `defer_loading`. Use the checked-in [`workbuddy-mcp.json`](workbuddy-mcp.json) shape (merge
the `corvio` entry into the host's actual MCP configuration instead of replacing unrelated servers). It keeps the 34-tool server deferred
but makes the two first-decision semantic entries, `search` and `ask_corvio`, immediately visible. Do not eager-load every continuation,
upload, table, and lifecycle tool. After changing the host configuration, restart WorkBuddy or start a fresh conversation and verify the
two entry tools before judging natural-task activation.

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

That upload is the provenance layer, not the end of the product story. Copyright, public availability, or third-party authorship alone does not make a user-selected source restricted; preserve provenance and applicable use terms, and exclude it only when an explicit restriction forbids the requested private Workspace retention or processing. A newly finalized source that should enter a Work Model, reconcile affected owners, or receive Project Skill evaluation goes directly to one `organize_files` operation; that Mission owns source preparation and retry/resume. Do not open `ask_corvio` before or after it for the same source set. An optional `target_root_node_id` is a Project `node_id` returned by `list_projects`, never a Page/document UUID or leaf node. Use `ask_corvio` for a bounded answer or artifact only when that source-to-owner lifecycle is not required. Poll the operation to terminal and inspect `output_document`, `source_reconciliation`, and `skills_evaluation`; do not submit duplicate Questions merely to wait for source readiness. Stable facts/preferences may enter Memory; only an evidence-backed reusable method, configuration, constraint, or quality bar becomes a Project Skill. `skills_extraction_mode=always` requires this decision and may correctly return `evaluated_no_qualifying_skill`.

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
