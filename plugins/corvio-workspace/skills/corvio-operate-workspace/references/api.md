# Corvio Workspace MCP, CLI, and API authority

## Contents

- [Authority links](#authority-links)
- [Resolve read and write authority](#resolve-read-and-write-authority)
- [Current owner coverage](#current-owner-coverage)
- [Choose a surface](#choose-a-surface)
- [Bootstrap and readiness](#bootstrap-and-readiness)
- [Refresh and version boundaries](#refresh-and-version-boundaries)
- [Workspace and operation recipes](#workspace-and-operation-recipes)
- [Delegated Agent availability](#delegated-agent-availability)
- [Error decisions](#error-decisions)

## Authority links

- CLI package target: `https://www.npmjs.com/package/@corvio/cli`
- CLI product guide target: `https://corvio.ai/developers/cli`
- Public discovery: `https://api.corvio.ai/v1`
- Public OpenAPI: `https://api.corvio.ai/v1/openapi.json`
- Human API guide: `https://corvio.ai/developers/api`
- Interactive API reference: `https://corvio.ai/developers/api/reference`

The CLI's `--help` and `capabilities --json` output are the command authority. The live OpenAPI is the HTTP method, path, field, scope, and error authority. Do not copy an endpoint catalog into `SKILL.md`.

Remote MCP endpoint: `https://api.corvio.ai/mcp`. Its `initialize.instructions`, `get_collaboration_contract`, `tools/list`, and returned
structured receipts are the MCP authority. A host plugin should bundle this Skill and MCP configuration when supported. If a host has
separate installers, install both: the Skill supplies discovery/decision policy and MCP supplies live OAuth-scoped actions. Add the CLI
when the Agent needs direct local-path, sync, download, or project-Agent authority.

For ordinary connected work, Remote MCP callers may omit `workspace_id` from Workspace-scoped discovery, question, file-intake,
organization, Page-create, and Project-create calls. Read/navigation calls resolve explicit/originating context first, then confirmed
account selection, personal default, or a single authorized candidate. A new external-Agent write with no object binding instead resolves
explicit current-task choice or originating/continuation/Project/Asset receipt first, then the user's writable personal default, then a
single writable candidate. The shell's ambient selection is not task-local write intent. Every route returns `workspace_routing`, and
real ambiguity fails closed with candidates. MCP also owns routine `request_id` / `idempotency_key` generation; callers supply an
explicit key only when they need to coordinate a deliberate retry across invocations. Exact-resource follow-ups keep the stable Workspace
embedded in their handles, and upload finalization keeps the Workspace from the preparation receipt. `list_workspaces` returns
caller-relative default/selection flags, disambiguated labels, and a writable recommendation without silently redirecting a write.
`search(workspace_scope=all_authorized)` is an explicit bounded read fallback when the saved selection may be stale; the Workspace on a
search hit is provenance and must never be promoted to a new write target.

## Resolve read and write authority

The user's OAuth connection authorizes the listed Corvio capabilities within current scopes, Workspace membership, and object ACLs. It
does not create a standing preference to upload or mutate data. A normal request for a report or other deliverable authorizes the host
result, not a Corvio write.

- Read-only search may run silently after excluding credentials, regulated or privileged data, genuinely disclosure-unclear sources,
  and explicitly local-only material. A private or confidential label is an owner/ACL constraint when private Workspace use is
  authorized; it is not by itself a local-only instruction. If results are clear
  and non-conflicting, use them in the normal host loop. Ask the user before choosing among competing owners, stale decisions, or
  materially conflicting sources.
- A current request that explicitly says to save, upload, share, organize, synthesize, or update stated material in Corvio is bounded
  write consent. So is a request to transform selected material so it supports later action, follow-up, decisions, review, or another
  continuing workflow, even when it omits storage words. Resolve this future-use branch before treating the request as an ordinary
  deliverable, and do not repeat the same confirmation.
- A host-owned, user-visible Memory/Profile/setting may encode a standing preference for a defined result class and scope. Revalidate
  live Workspace routing, OAuth scopes, ACLs, and content safety every time; dynamic Workspace state and search calls are not Memory.
- Without either authority, deliver the host-native result first. Then explain the exact proposed content, destination if known, and
  concrete benefit, and ask once whether to save or organize it. A decline or no answer means no write.
- Work Model reconciliation and Memory/Skill evaluation are optional depths within an already authorized Corvio action. Do not offer a
  generic menu or manufacture a Skill when the evidence contains no reusable method.

Corvio uses the user's own account and authorized Workspace. It cannot scan arbitrary local paths or complete host-chat history. See
the [Privacy Policy](https://corvio.ai/privacy) and public
[Security Policy](https://github.com/NeoFlux-AI/corvio-agent-skills/blob/main/SECURITY.md).

## Choose a surface

| Need | Preferred surface | Why |
| --- | --- | --- |
| Search/read/write authorized Workspace state in a connected host | Remote MCP | OAuth-delegated live tools and structured receipts |
| Read bounded facts from one retained Asset without creating a Question | MCP `get_file(read_mode=content)`, or CLI `files get <id> --content` | Returns a hash-bound AI-safe projection with explicit completeness/truncation |
| Ask Corvio about an explicitly selected local file | MCP prepare → host PUT → finalize → `ask_corvio(asset_ids=[...])`, or CLI `ask --file` | The host reads bytes; Corvio binds the finalized Asset to that exact question |
| Retain an explicitly selected local file without asking about it | MCP `prepare_file_upload` → host PUT → `finalize_file_upload`, or CLI `files upload` | Retention creates an Asset in intake; it does not silently create a root document or a question input |
| Continue one bounded read-only synthesis after a trusted receipt already proves this Host used the authenticated CLI in the exact Workspace | One foreground CLI `ask`; answer-only is the default, so omit `--allow-actions` and do not pass `--mode` | Preserves transport and returns the terminal Question without model-visible polling; never install, probe, or switch solely for this optimization |

For `ask_corvio` or foreground CLI `ask`, keep the user's question unchanged and append the smallest complete decision-relevant context
or stable handles as a separate context clause. A carried Project handle is normally the complete scope for a cross-branch question;
do not expand it into every descendant handle. Handles are evidence addresses, not a reason to enumerate sibling labels, substitute a
different objective, invent a comparison rubric, or prescribe reasoning steps. Do not turn an open semantic delegation into an invented
taxonomy, title list, artifact count, or internal task plan. Explicit user constraints remain authoritative.
Receipt-bound continuation handles are compact prior-work context even when a fresh process has no transcript. Read an identifiable leaf
before broad search; if multiple unlabeled handles make the leaf unclear, fetch the carried Project, use its
`metadata.content_projection.direct_children` as the bounded topology index, and follow only the relevant `has_children` branch until the leaf. Preserve an explicit incomplete
boundary when that projection is truncated. A lexical match in another Project is only a candidate. If the user asks to reconcile a repeated stable practice for future reuse, the terminal effect must include
a durable reusable-owner receipt or an exact readback proving the full delta was already present, not only a chat comparison.
Judge method qualification before owner reuse. A similar Skill under the wrong Project is read-only negative evidence for that merge,
not proof that the method is unqualified; use the narrowest correct Project Skill when the evidence includes a future trigger,
action/judgment sequence, boundary or countercase, and verification path. Ordinary fact-Page updates do not close that Skill duty.
After terminal completion, consume `artifact.url` or `links.primary_artifact` verbatim. `node_id` is a hierarchy identity, not a Page URL;
`reader_output` artifacts are deliverables, `structure_container` artifacts are hierarchy, and `sources` remain evidence.

| Upload/download by local path, sync Markdown, or run a project Agent | CLI | Foreground local/project authority |
| Use a host without a bundled plugin | Install Skill + MCP separately; add CLI only when needed | Keeps discovery, remote actions, and local authority distinct |

A newly finalized Asset that should enter a Work Model, reconcile affected owners, or receive Project Skill evaluation goes directly to
one `organize_files` operation. That Mission owns source preparation, affected-owner updates and retry/resume; do not submit an
`ask_corvio` Question before or after it for the same source set. `target_root_node_id` accepts only a Project `node_id` returned by
`list_projects` or fetch metadata with `doc_type=project`; omit it rather than substituting a Page/document UUID or leaf node. Keep
`ask_corvio` for a bounded answer or artifact when no source-to-owner reconciliation is required.

A request to transform selected related material so later action, follow-up, decisions, review, or another continuing workflow can use
it is a Work Model intent, not a chat-only rewrite or raw retention. After finalizing the exact bytes, start one `organize_files`
operation unless the user explicitly asked for archive/original-only storage or the material has no evidence-backed semantic owner
beyond the file itself. The Host still passes only the natural continuity goal and proven handles; Corvio decides the topology.

When the current turn authorizes a bounded durable Work Model change—updating existing owners or correcting, splitting, merging, moving,
or reparenting structure—and relies on user-selected files clearly about that subject, retain those files and send one `organize_files`
mission for the combined effect. Do not paste their facts into an `ask_corvio` mutation and leave the source evidence behind. This
composition rule does not turn attachment presence into consent. A selected file unrelated to the current Project still belongs to an
explicit whole-packet future-use request and needs a distinct-scope or standalone-reference decision. Material outside the selected set,
credentials, regulated or privileged data, genuinely disclosure-unclear sources, explicitly local-only files, and destinations whose
reader boundary is still ambiguous remain outside scope.

Before choosing `target_root_node_id`, search the enduring work subject and read the narrowest plausible current Projects. An event-shaped
input such as a meeting, incident update, slogan change, or code task is not itself evidence for a new Project. When the relation remains
unclear, omit the target and pass the natural reconciliation goal; do not guess a title or taxonomy. When later evidence proves that two
roots overlap or that one belongs under the other, pass the proven relationship and existing handles to one organization mission. Corvio
owns the semantic comparison and may create a non-Project branch, move descendants, and retire an empty duplicate root; Remote MCP and
CLI only transport explicit identities and effects and do not infer the hierarchy.

For a governing-owner correction, include the old Project that currently contains the named branch, not only the branch and proposed new
owner. Corvio must check whether the old root's remaining children are same-subject projections or independently operated work. Absence
from the user's short correction is not independence evidence; do not accept a terminal result that moves one child while silently
leaving a second same-subject root.

Finding the named child under the requested owner with read-only `search` or `fetch` proves only that local edge. If the old Project still
exists and its remaining branches are not classified, call one semantic organization operation with the natural correction and both
Project handles: `ask_corvio` for existing Workspace reconciliation, or `organize_files` when newly selected sources belong to the same
authorized effect. Return no-op only after the terminal result and current Tree prove the old Project retired or direct evidence proves an
independent Project lifecycle.

After terminal settlement, inspect the operation's canonical Project, reader outputs, affected-owner receipts, and current Tree readback.
Only then report whether the source established a new scope, extended current owners, split an overloaded owner, consolidated duplicate
roots, or left topology unchanged. Upload/finalize success alone proves source retention, not Work Model completion.

Do not encode file bytes as base64 in an MCP JSON call. Do not pass a local path and expect a remote server to read it. A prepared signed
target is temporary capability, not a durable result; completion is the finalized Asset receipt and, when needed, current Asset readback.

## Current owner coverage

The public Developer API already owns:

- an environment-key path plus a separate single-use Developer Platform device authorization that yields a user-level `cvu_` principal;
- explicit Workspace discovery/selection and effective capabilities for that user principal;
- idempotent user-level Workspace creation, Project list/create, and Tree-owned document moves;
- durable questions, history, conversations, sources, artifacts, operations, and usage;
- Workspace search;
- active/archived Page list, read/create/update/recoverable archive/restore, and private-link share;
- progressive narrative Page reads (`auto`, overview, section, line range, literal search, or full) plus revision-bound exact line
  patches with operation identity, canonical readback, and compact receipts;
- bounded stable-ID table reads plus revision- and operation-guarded cell updates/clears or row appends; complex table structure,
  formulas, styles, sorting, and semantic rewrites remain delegated to Corvio's internal document Agent;
- immutable Workspace Asset upload/finalize, ACL-filtered list/read/download, bounded hash-bound content projection, and Agentic organization receipts;
- one semantic organization mission over 1-50 existing Assets, with request-local `auto|economy|standard|deep` processing,
  optional maximum profile, `scan_mode`, and evidence-based `skills_extraction_mode`; `always` requires an admission decision but
  does not force a low-value Skill;
- foreground Local Markdown source/status/plan/pull/push/commit/conflict resolution over the shared Sync owner;
- CLI distribution policy in discovery, plus npm `beta` dist-tag comparison through `corvio update check`;
- typed document readback, with Presentation and HTML action settlement available through the Agentic question path when advertised.
- user-managed delegated Agent identities with independent `cvg_` credentials, bounded read/comment/edit permission envelopes,
  document comment identity, and stable `@handle` mentions;
- account-owned project Agents with explicit per-Workspace grants/overrides, one default identity, provider/device/project runtime
  bindings, current-and-future scope policy, live membership/role intersection, secure multi-binding CLI credential capture,
  provider readiness, and truthful configured/listening/offline lifecycle facts;
- a durable at-least-once Agent event mailbox with claim/lease/renew/retry/dead-letter receipts, plus Agent comment read/reply/status
  operations, a document-scoped human/Agent mention directory, and Query-owned document mutation;
- Agent-authenticated `docs update` with a required change summary and a returned document-comment receipt.
- `corvio collaboration status`, which separately inspects the local project Agent binding, live shared collaboration contract, installed
  host guidance, and inbound-listener state. It cannot prove that the current host task loaded the Skill or Remote MCP; `Listening` alone
  is not host-session readiness.
- `corvio agent closeout`, which returns a verified result to the Corvio document or thread that supplied the task and reads the current
  document/comment state back before reporting completion.
- a bounded iterative Agent Runner that returns each Query/Writer result to the same provider task, continues through the same Corvio
  Conversation when more evidence or a complex edit is needed, and records every question ID in the completion receipt;
- remote MCP `ask_corvio` continuation in `answer_only` or explicitly authorized `allow_actions` mode for complex Workspace editing.
- remote MCP question/conversation history discovery through `list_conversations`, `get_conversation`, `list_questions`, and
  `get_saved_question`, so a fresh host session can recover stable continuation handles instead of depending on prompt memory.
- remote MCP comment list/create/reply/status plus `complete_document_work` through explicit `comments:read` / `comments:write` OAuth
  scopes; writes use the authorizing user's delegated identity and stable document/thread IDs rather than inventing a project-Agent
  identity. `complete_document_work` combines reply/create, optional verified resolution, and document/thread readback.
- remote MCP revision-guarded `update_document` / `append_document` with required `change_summary`; a successful change creates and
  reads back a visible document-level comment. Page Markdown is only the deterministic direct-write carrier—typed Spreadsheet,
  Presentation, Code, and HTML Artifact work remains available through `ask_corvio(mode=allow_actions)`.
- remote MCP staged upload (`prepare_file_upload` → host-native signed PUT → `finalize_file_upload`) plus exact Question binding through
  `ask_corvio(asset_ids=[...])`, and Asset list/get/organization/operation readback. `get_file(read_mode=content)` projects one retained
  source through a bounded, hash-checked, non-mutating read and reports incomplete/truncated coverage explicitly. The host or CLI reads selected local bytes; the remote
  server never reads a host path. A finalized UTF-8 Markdown Asset may be passed as `source_asset_id` to `create_document` or
  `update_document`, avoiding a second full-text tool argument while preserving ACL, sensitivity, hash, and source receipts.
- direct Page conversion accepts ordinary GitHub-Flavored Markdown pipe tables; the detailed `corvio-table` contract is reserved for
  rich behavior such as stable cell identity, select options, widths, sticky layout, and merged-cell intent.
- file-organization operation readback exposes typed blockers plus explicit resume/cancel actions over the same durable Mission.
- Run-level origin snapshots that distinguish Workspace CLI, project-Agent CLI, Remote MCP and direct Developer API while keeping an
  optional caller-reported host model separate from Corvio's actual execution model and cost.

`GET /v1` exposes the versioned `coding_agent_collaboration` and `document_authoring` contracts consumed by the official Skill/CLI and
Remote MCP. A change to materialization, file upload, hierarchy, typed carriers, readback, rich-table authoring, or originating-document closeout is incomplete until these adapters
still agree with that shared owner.

An MCP Question's `completed` status is settlement of that request, not proof that the user's outcome is complete. Callers must inspect
`sources`, `artifacts`, `operations`, capability/error facts and authoritative resource readback. Deferred execution rechecks the current
API-key state, user audience, expiry, `questions:write`, live Workspace membership/document view, and `documents:write` plus document edit
authority for `allow_actions`; losing any authority after submission fails closed before model/tool execution.

The remaining capability gaps are:

- explicit create/update operations for every typed document family.
- a host-neutral hook that can add Corvio at the right decision points inside every third-party Agent's existing loop. The official Claude
  plugin now supplies a bounded `SessionStart` reminder, while other hosts still depend on Skill discovery or preserved MCP initialization
  guidance. Corvio deliberately does not capture arbitrary private turns or bulk-upload repositories in the background;
  `corvio collaboration status` makes that boundary explicit instead of calling a listener-only connection ready.

Never emulate a missing owner with browser-internal `/api/v1`, cookies, Local Agent tokens, title matching, or client-only state.

## Bootstrap and readiness

These commands establish package identity, human authority, project binding, and foreground guidance. They are not a per-turn ritual:
start with the aggregate collaboration receipt and use the narrower commands only to diagnose a missing dimension.

```bash
node --version
CLI_VERSION="$(npm view @corvio/cli dist-tags.beta)"
npm view "@corvio/cli@$CLI_VERSION" version --json
npm install --global "@corvio/cli@$CLI_VERSION"
corvio --version

npx --yes skills@1.5.23 add https://corvio.ai/developers/skills/corvio-operate-workspace/corvio-operate-workspace.zip --agent codex --skill corvio-operate-workspace --yes
corvio auth status --json --no-input || corvio auth login --no-input
corvio agents connect --provider codex --project . --json --no-input
corvio collaboration status --json --no-input
```

Node.js must be `>=20.11`. The official `@corvio/cli` package is pure JavaScript; native build tools, administrator/root access, Apple
notarization, or a postinstall binary download indicate the wrong package. Resolve the reviewed beta before installing rather than using
an unpinned replacement. In an ephemeral run, invoke that same exact version with `npx --yes "@corvio/cli@$CLI_VERSION"`.

Use an existing host secret-store injection when available. An interactive user may approve the single-use device link. Never request a
key in chat, echo it, pass it as an argument, place it in a URL/document, or commit it. A user `cvu_` principal owns connect/control;
ordinary project operations use the securely stored project Agent `cvg_` when available. Browser JWTs, administrator `cva_`, and
import-only Local Agent tokens are not substitutes. Do not retry credentials against another environment.

When `collaboration status` is incomplete, diagnose only the reported gap:

```bash
corvio auth status --json --no-input
corvio workspaces current --json --no-input
corvio workspaces list --json --no-input
corvio capabilities --json --no-input
corvio update check --json --no-input
```

`update check` reports the exact reviewed install command but never mutates the running executable. `CLI Ready`, `Listening`, and
`Foreground collaboration ready` remain separate facts. A missing/stale Skill requires installation plus a fresh host session.

## Refresh and version boundaries

Skill, CLI, and MCP freshness are independent:

On the first Corvio use in a fresh host session, call `get_collaboration_contract` once with `response_mode=freshness_only` and any loaded
package facts the host already exposes: `loaded_surface`, `loaded_release_version`, `loaded_contract_revision`, `loaded_compatibility_family`, and
`installation_channel`. These are host-reported facts, not proof that Remote MCP inspected local files. Surface
`client_freshness.agent_notice` once when present; a current copy stays quiet. Do not spend user turns discovering an unavailable version,
and do not repeat the check or notice during the same session.

| Surface / installed source | Version authority | User-side refresh |
| --- | --- | --- |
| Claude/Cowork Plugin from the public Directory | Installed Plugin manifest plus `manifest.json.claude_plugin.version` | Publisher updates the GitHub source; Claude ingests the reviewed update. Start a fresh synced session after it arrives |
| Claude/Cowork Plugin uploaded in Customize | Installed Plugin manifest plus `manifest.json.claude_plugin.version` | Replace or re-upload the official archive in Customize, then start a fresh Cowork task |
| Claude `<name>@synced`, shared, or organization-managed Plugin/Skill | The source copy in claude.ai plus its publisher/admin | Manage the source copy in Customize or ask its publisher/admin. `claude plugin update` does not mutate an `@synced` copy |
| Claude Code marketplace Plugin | Installed Plugin manifest plus marketplace source/version | Use Claude's marketplace/plugin update flow, then `/reload-plugins` or start a fresh session |
| Codex marketplace Plugin | Installed Plugin manifest plus the Git-backed marketplace source/version | Refresh the marketplace/plugin, then start a fresh Codex task |
| WorkBuddy manually uploaded Skill | `manifest.json.release_version`, file SHA-256, compatibility family and minimum revision | Until a reviewed marketplace listing is live, replace the official ZIP through WorkBuddy's Skills UI and start a fresh conversation |
| WorkBuddy marketplace Skill | Marketplace receipt plus package release/hash | Use only after Corvio reports external acceptance; then follow the host-managed update flow |
| Standalone official Skill | `manifest.json.version`, a SHA-256 derived from every packaged file | Reinstall the same package in the same project/global scope; use `skills update` only for an update-tracked source |
| Workspace CLI | npm `beta` dist-tag joined with the reviewed `/v1` compatibility policy | Run `corvio update check --json --no-input`, then execute its exact install command when an update is available |
| Remote MCP | Live server contract and the host's current tool/session projection | Usually no local install; refresh/reconnect the host session, and reauthorize only when new OAuth scopes are required |

For Claude/Cowork, run `claude plugin list` when the host exposes shell access. An entry under `Synced from claude.ai` proves the session
received the account copy; it does not prove that the account copy matches Corvio upstream. If source or installed version is not
observable, report it as unknown and give the source-specific inspection step instead of guessing.

The current canonical website install is a direct archive. Agent Skills CLI `1.5.23` installs that archive as a local copy but does not
record it as an update-tracked package, so `npx skills update` cannot be relied on for this distribution path. Refresh with the exact
provider-scoped command returned by `corvio collaboration status --provider <host> --json --no-input`; it pins the verified installer,
selects one host, and preserves the original project/global scope. Do not update every host or scope by assumption.

`corvio collaboration status` reports package freshness, compatibility, discoverable copies and update ownership separately. It hashes
each local `SKILL.md`, reads release/revision/family markers, and detects conflicting copies. Use `--provider workbuddy` for the manual
`~/.workbuddy/skills/corvio-operate-workspace/SKILL.md` surface. It deliberately reports `host_loading_unverified`, because local bytes
cannot prove which copy a running cloud task loaded. A successful download is not the last step: start a new host session and rerun the
status command.

Do not couple unrelated updates. Audit the shared contract, Skill, Plugin, MCP, CLI, Help, and acceptance projections together, but publish
only the artifacts whose bytes, behavior contract, compatibility, or public instructions changed. A Skill-only wording release does not
require a CLI reinstall or OAuth reauthorization. A compatible
server-only MCP fix does not require reinstalling the Skill or CLI. A CLI release does not refresh a local Skill copy. When a host plugin
bundles Skill + MCP, use that host's plugin update flow and still start a fresh session; plugin-cache discovery proves only the version
present in that cache.

## Workspace and operation recipes

The recipes below execute decisions already justified by the Skill's causal loop. They do not choose a Workspace, infer disclosure
authority, decide whether a new carrier is valuable, or prove completion on their own.

### Ground and continue

```bash
corvio workspaces current --json --no-input
corvio workspaces list --json --no-input
corvio workspaces use <workspace_id> --json --no-input
corvio search "quarterly launch risks" --limit 10 --json --no-input
corvio ask --prompt "Which launch risks recur?" --sources workspace,memory --json --no-input
corvio ask --prompt "Prioritize them" --conversation-id <conversation_id> --json --no-input
corvio ask --workspace <workspace_id> --prompt "<unchanged question>; Context: project:<workspace_id>/<project_id>" --json --no-input
corvio ask --background --prompt "Reconcile the launch evidence." --json --no-input
corvio questions operation <operation_id> --after-cursor <progress_cursor> --wait-until-terminal --json --no-input
corvio questions cancel <operation_id> --yes --json --no-input
```

The last form is only for the receipt-proven bounded continuation above. Start it once; do not launch an identical Question concurrently
or retry before that foreground process exits. If the shell yields a running-session handle, wait on that exact handle until the CLI
exits; do not answer from prior output. Answer-only is the default; the CLI intentionally has no `--mode` option. Add
`--allow-actions` only when a durable action is separately authorized. Transport continuity does not prove a cheaper processing profile;
leave profile selection on `auto` unless the unresolved semantic bottleneck independently justifies another profile.

For work that may outlive a host turn, `--background` returns a durable Question operation immediately. The equivalent Remote MCP flow
is `ask_corvio` followed by bounded `get_question` calls. Preserve one `operation_id`; copy each `progress_cursor` into the next MCP
`after_cursor` or CLI `--after-cursor` so Corvio returns only later milestones. Progress reports stable phase changes and safe status
messages, never hidden reasoning, raw tool output, or provisional answer text. Surface only meaningful changes to the user; no new event
is a normal state, not a reason to open another Question. `--wait-until-terminal` keeps deterministic waiting inside the CLI process, and
its deadline receipt does not cancel the remote work.

To stop work, use MCP `cancel_question` or `corvio questions cancel <operation_id> --yes`. The request is idempotent. Treat
`cancellation_requested` as non-terminal and verify `cancelled` before claiming the operation stopped; effects that settled before the
stop remain durable. To correct or redirect the objective, cancel or finish the current operation and then start a successor Question
with the terminal `conversation_id`. Do not edit an in-flight objective or retry it under a new identity. Terminal completion still
requires the canonical Question, source/operation/artifact receipts, and any requested durable readback.

Keep the exact Workspace from the original Conversation/operation. A persisted selection is only a candidate; do not try a Conversation
ID across Workspaces or inspect every Workspace merely to choose one.

### Create or change a Page

```bash
corvio projects list --json --no-input
corvio projects create --title "Launch Research" --json --no-input
corvio docs create --title "Decision brief" --parent-node-id <project_node_id> \
  --file decision-brief.md --json --no-input
corvio docs read <workspace_id/document_id> --mode auto --json --no-input
corvio docs read <workspace_id/document_id> --mode line-range \
  --start-line 40 --end-line 52 --json --no-input
corvio docs patch <workspace_id/document_id> --input page-patch.json \
  --operation-id <stable_operation_id> --change-summary "Corrected the requested lines." --yes --json --no-input
corvio docs get <workspace_id/document_id> --output launch-plan.md --json --no-input
corvio docs table-read <workspace_id/document_id> --limit 50 --json --no-input
corvio docs table-mutate <workspace_id/document_id> --input table-change.json \
  --operation-id <stable_operation_id> --change-summary "Updated the requested rows." --yes --json --no-input
corvio docs update <workspace_id/document_id> --file launch-plan.md \
  --expected-revision <revision> --change-summary "Updated launch risks." --json --no-input
corvio docs move <workspace_id/document_id> --parent-node-id <project_node_id> \
  --json --no-input
corvio docs list --lifecycle archived --json --no-input
corvio docs restore <workspace_id/document_id> --yes --json --no-input
```

Reuse a proven Project before creating another owner. Preserve both Page and Tree node identity. Read before mutation and after settlement;
on revision conflict, reconcile current content instead of overwriting. Agent-authored updates require `change_summary` and a visible
comment receipt. First-party CLI document commands accept the canonical `workspace_id/document_id` handle returned by Corvio as
well as a bare document ID. Prefer the canonical handle for continuation; the CLI validates its Workspace prefix locally and must not
recover from a mismatch by listing unrelated documents or probing another Workspace.
Direct body writes target non-Project Pages. A Project is a structure container: use `files organize` or `ask --allow-actions` for its
front door / Work Model maintenance, or create/update a child Page; a title-only Project rename remains valid. Direct Page writes use
canonical Markdown and ordinary pipe tables by default; inspect `document_authoring` only before
a rich-table write, and never flatten
Spreadsheet, Presentation, Code, or HTML Artifact state into Markdown as if lossless.
For the progressive read algorithm, exact patch payload, ROI boundary, and partial-effect recovery, read
[documents.md](documents.md). The live tool schema remains field-level authority.

Projects are root-level grouping owners and cannot be moved under another Project. `docs move` accepts a non-Project document and a
Project destination; a Project source fails with `project_nesting_disabled`. For a deeper Work Model, delegate the natural organization
goal to `files organize` or `ask --allow-actions` so Corvio can create evidence-backed branch Pages and leaves without empty hierarchy.

For an originating task/feedback surface, use `corvio agent closeout --document-id <id> [--thread-id <id>] --body <verified_result>
[--status open|resolved] --json --no-input`. Mentioned people/Agents must first be resolved through
`corvio agent mentions --document-id <id>`; display text, email addresses, and package names are not stable principals.

### Retain, organize, and read back files

When Remote MCP and host-local file/HTTP tools are available, keep byte authority in the host:

1. inspect the explicitly selected file locally and determine its exact name, MIME type, and byte size;
2. call `prepare_file_upload` with that metadata;
3. use the returned `upload_method`, `upload_url`, and `upload_headers` to PUT the exact local bytes before the target expires;
4. call `finalize_file_upload` with the unchanged preparation receipt and metadata;
5. consume the returned stable Asset ID, SHA-256, sensitivity/read policy, and links; compare the hash with the local bytes when the host
   can compute one, and call `get_file` when another readback is needed.
6. if the current question depends on the file, call `ask_corvio` with the finalized ID in `asset_ids`; verify the returned Question and
   Conversation rather than assuming the retained Asset entered model context.

If the finalized file is UTF-8 Markdown and should become a Page, pass its Asset ID as `source_asset_id` to MCP `create_document` or
`update_document`. Do not also provide `markdown`. Corvio resolves the Asset in the same Workspace, rejects blocked/sensitive or non-Markdown
content, and returns the source hash/revision with the Page receipt.

If the host cannot perform the PUT, use the foreground CLI journey below. Never paste the signed URL into chat or a document, and never
report the prepare response or raw PUT as a completed Corvio upload.

```bash
corvio ask --prompt "Summarize the decision risks in this file." --file ./research.pdf --json --no-input
corvio ask --prompt "Compare these retained sources." --asset-ids <asset_id_1>,<asset_id_2> --json --no-input
corvio files upload --file ./research.pdf --json --no-input
corvio files upload --file ./research.pdf --organize \
  --instruction "Organize this source for future use and evaluate reusable methods." \
  --skills-extraction-mode auto --processing-profile standard --yes \
  --wait-until-terminal --timeout-seconds 1200 --json --no-input
corvio files organize <asset_id> --additional-asset-ids <asset_id_2>,<asset_id_3> \
  --instruction "Organize this coherent evidence set and evaluate reusable methods." \
  --scan-mode always --skills-extraction-mode auto --processing-profile standard \
  --yes --wait-until-terminal --timeout-seconds 1200 --json --no-input
corvio files operation <operation_id> --wait-until-terminal --timeout-seconds 1200 --json --no-input
corvio files resume <operation_id> --yes --wait-until-terminal --timeout-seconds 1200 --json --no-input
corvio files cancel <operation_id> --yes --json --no-input
```

Upload and organization are separate effects even when one command composes them. Preserve the upload receipt, then wait on the operation
by its exact ID until a terminal state or the current wait budget is exhausted. When the authenticated official CLI is already available,
`--wait-until-terminal` keeps deterministic polling inside that one foreground process; it does not create, resume, or semantically alter
the operation. `--timeout-seconds` is a bounded local deadline from 1 to 7200 seconds and defaults to 1200. On deadline the CLI returns the
latest ordinary non-terminal operation plus `transport_wait.status=deadline_reached`; continue the same operation later and never call
that receipt completion. Without the flag, `files operation` remains one immediate status read. Do not install or switch to the CLI only
to avoid MCP polls; Remote MCP instead uses bounded `wait_seconds` reads. Interrupting the foreground process stops only the local wait;
it does not cancel the durable operation, which requires the explicit cancel command. Completion requires all source Asset IDs, source
reconciliation, `output_document` or other derived artifacts, processing policy, Skill admission outcome, and final links. A qualifying
`skills_evaluation` returns stable candidate identities and typed `page:` / `node:` resource receipts when exposed by the durable write;
`evaluated_no_qualifying_skill` is an equally valid evidence-based result. Stable facts/preferences belong to the appropriate Memory,
while independently reusable methods, configurations, constraints, and quality bars may become Project Skills. If a terminal receipt is
blocked, resolve the named condition and resume the same operation; cancel it explicitly when the user no longer wants the effect. For a
partial receipt, inspect its typed mismatch and recovery action. If the current request still authorizes the unfinished slice and no
named user, permission, disclosure, or external condition is missing, an explicit `resume_file_operation` recovery action is sufficient
to resume that exact operation once—even when one direct source read is unavailable. Fresh canonical readback that contradicts a stale
mismatch is another reason to take that route. Do not re-upload settled sources or start a duplicate organization operation. If the same
mismatch survives the resumed terminal readback, report the exact
boundary. Never use an unbounded shell retry loop.

When an organization command needs Asset IDs created by earlier uploads, keep the causal boundary explicit: complete each upload (parallel
is fine for independent files), record every successful receipt, and only then construct the organization command from those exact IDs.
Do not chain a later command whose arguments depend on shell variables or placeholders that the earlier commands have not populated yet.
If a later shell step fails after earlier JSON receipts were emitted, preserve and verify those durable Assets, report the failed step,
and retry only the missing effect instead of uploading the successful sources again.

Remote MCP intentionally keeps queued/running `get_file_operation` responses small: provisional artifacts and summaries are omitted
until terminal readback. Use only the operation identity, phase, processing receipt, `retry_after_seconds`, and recovery links while it is
non-terminal; do not infer or announce a user-visible result from those progress facts. The terminal response restores the complete
artifact, source-reconciliation, Skill-evaluation, and link payload.

### Foreground Markdown sync

```bash
corvio sync init --dir ./knowledge --root-node-id <node_id> --json --no-input
corvio sync plan --dir ./knowledge --json --no-input
corvio sync pull --dir ./knowledge --json --no-input
corvio sync push --dir ./knowledge --yes --json --no-input
corvio sync resolve --dir ./knowledge --conflict-id <conflict_id> \
  --strategy use-remote --yes --json --no-input
```

Plan before pull/push because local path, remote revision, and last-common hash jointly own conflict safety. Only Markdown below
`corvio_docs/` participates. `.corvio/` contains credential-free identity/revision receipts, never secrets. Symlink crossings and hash
mismatches are hard failures; a missing side is unresolved, not implicit deletion.

## Delegated Agent availability

Use a user `cvu_` principal only to connect, authorize, update, pause/revoke, or recover an Agent. Run `corvio agents connect --project .`
from the intended project. It stores the one-time `cvg_` outside the project and starts a provider listener without printing or
exporting the secret. The server keeps an opaque binding ID, project label/fingerprint and capability summary; the local registry
keeps the absolute root and credential. Repeating the same provider/device/project is idempotent; a different project creates a
separate Agent. Ordinary Workspace commands choose the binding for the current project, then the active/default Agent. The Agent
runtime intentionally has no fallback to `CORVIO_API_KEY`. A mention remains durable while the recipient computer is asleep or
offline. Nothing remotely powers on a personal computer: when its listener returns, it claims pending work and resumes through the
lease contract. Provider-native session messaging is an execution adapter, not the cross-vendor mailbox authority.

After connect, run `corvio collaboration status --json --no-input`. A complete local-prerequisite receipt requires a current project
binding, the live server contract version, and a discoverable official Skill carrying that same version. Listener state is reported
separately; a fresh host task must still prove that it loaded the Skill and Remote MCP.
For a task originating in a document/thread, finish with `corvio agent closeout --document-id <id> [--thread-id <id>] --body <evidence>
--status open|resolved`; use `resolved` only after the requested outcome is verified.

The `cvg_` runtime-ready call may attest CLI/provider versions and liveness only against the project identity and policies previously
authorized by user-level connect. A provider, binding, project, host-profile, or trigger-policy mismatch returns `409`; an Agent
credential cannot use readiness reporting to modify its own authorization.

Keep direction in `instruction`; keep the exact comment, document locator/revision, anchor, actor, and event ID in structured
context/resources. The Runner keeps the lease token out of provider input and Query context while sending it in protected HTTP
binding headers. For an inbound comment, the server derives the source from that event and exposes only origin-document context;
it does not let the owner's account Agent search another Workspace. A read-only provider planning pass selects local project,
Corvio document, or reply-only execution. Query/Writer owns complex online document mutation. The provider can consume a result, ask
Corvio for another evidence/edit/verification pass in the same Conversation, and continue until it can finish or identify the unresolved
boundary. Local project execution consumes the Query result inside the selected provider's native sandbox and returns accumulated claimed
files/checks plus observed Git working-tree state in the event receipt. The server rechecks the comment author's live document ACL and the
Agent owner's live grant intersection on every pass.

The runtime permission axes are independent. `owner_only` is the default trigger policy and removes the Agent from other users'
picker results; forged stable targets are stored as not delivered. `workspace_members` requires explicit `--yes`. The local
`workspace_write` profile is project-scoped by provider-native controls; unrestricted host access requires a separate `--yes`.
Unavailable provider authentication, sandbox enforcement, or non-interactive approval fails connection/execution instead of
producing a false `CLI Ready` or completion receipt.

Mailbox events carry causal chain/parent/hop/route facts. Event-derived replies require the exact source event and live lease and
are one-per-event idempotent. Repeated directed routes and hard hop/chain/fanout budgets leave a visible stopped mention without a
runnable event. Only an explicit `start_new_chain` may create a standalone Agent-to-Agent root; do not use it to evade a stop.

Each Runner Question uses a deterministic event/round idempotency identity. If the Agent process fails after a Question settles, a later
lease may recover that completed Question even when a fresh provider planning pass changes its prompt wording; it must not issue a second
Workspace effect under a new key. The event completion receipt roots at the first Question and may list bounded follow-ups, all of which
must validate as completed external-comment Runs in the same event-bound Thread. Provider diagnostics are bounded before `:fail` so the
failure receipt itself cannot be rejected for size.

The public mention directory is document-scoped and returns both human and Agent principals with stable IDs, unique aliases, display
names, relationship and availability. Comment/reply mutations accept a caller-stable idempotency key. Text parsing supports Unicode names
and mentions adjacent to CJK text, but intentionally excludes email addresses and scoped package paths; absent or ambiguous targets fail
before the comment is written. Human mentions create Inbox activity and Agent mentions create mailbox events from the same structured
principal authority.

## Error decisions

- Package/version lookup failure: stop rather than substituting another `corvio` binary.
- Update available: report `latest_published_version` and `install_command`; never mutate a running installation implicitly.
- `401`: key is invalid, revoked, or expired; do not request it in chat. An interactive user may run `corvio auth login`; an Agent should repair its injected secret authority.
- `400 workspace_selection_required`: login succeeded but no authorized Workspace can be resolved; list/select one exact Workspace before retrying.
- `409 workspace_selection_ambiguous`: multiple authorized Workspaces remain after selection/default routing; choose one candidate explicitly before retrying.
- `403`: scope, Workspace role, ACL, or current authority is insufficient; report the exact required capability.
- A `read_only` Workspace blocks write/run even for a member or owner; use the projected status/restriction reason instead of attributing it to role.
- `404`: resource is absent or deliberately hidden; do not infer it from a title.
- `409`: idempotency, revision, in-progress conflict, or legacy `cvk_` Workspace mismatch; reread the canonical resource before retry and never widen a legacy key.
- `429`: honor `Retry-After`.
- Unknown `5xx` or a transport failure without a response: use the CLI retry-safety receipt. Reuse the exact idempotency key when it is safe; otherwise read the resource before retrying.
- `request_timeout` / `upload_timeout`: the bounded request elapsed; preserve the same retry identity and follow `retry_safety`. Do not increase the timeout past the CLI's ten-minute ceiling or add an unbounded outer retry.
- `download_integrity_mismatch`, `upload_integrity_mismatch`, `sync_integrity_mismatch`, or `admin_skill_integrity_mismatch`: no local success may be claimed; retain the request ID and reread the authoritative receipt/package manifest.

Preserve `X-Request-Id` and the CLI's normalized error code in the final result.

`workspace_context` is aggregate routing provenance (titles/bounded outlines), while `workspace_doc` is a document-level source. Neither should be inferred when absent.
