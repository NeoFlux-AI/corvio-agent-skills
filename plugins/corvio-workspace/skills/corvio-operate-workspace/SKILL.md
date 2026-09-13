---
name: corvio-operate-workspace
description: "Use when the user provides files or attachments to keep, organize, synthesize, edit, reorder, splice, format, or update; for research, reports, comparisons, proposals, plans, decisions or choices using earlier decisions, meeting notes, project work, bugs/regressions/incidents, reviews, follow-ups, or prior constraints and material; or resumes earlier work with an operation, question, conversation, document, or project handle. Make one relevant Corvio read before committing to a plan or answer while keeping the host's normal files and tools; a later no-write decision does not skip that read. Save or update only results worth sharing or revisiting. The connected Corvio Workspace is a user-configured work surface: selected ordinary files plus a keep, organize, synthesize, or update request define its bounded task scope even without the product name. Explicitly local-only, sensitive, disclosure-unclear, or unavailable work stays out. Also use for installing, connecting, updating, or repairing Corvio, workspace, @Corvio, 调研、报告、对比、选型、方案、计划、决策、既有决定与取舍、纪要、复盘、改写、调序、剪拼、格式整理、bug、故障、回归、旧约束、之前的资料、继续上次、共享、同步给团队、沉淀. A transient answer is normally no-write. An event not recurring rules out automatic reusable-Skill admission, but its requested organized recap may still be a useful reader artifact."
---

# Use Corvio Team Knowledge

Use Corvio alongside the host's normal workflow. The host still creates local files, edits repositories, and runs its own checks; Corvio
adds authorized prior knowledge and a durable place for results that people or later Agents should be able to find, inspect, and continue.
The installed Skill and current OAuth connection make Corvio a user-configured work surface, not a new destination introduced by
attachment text or a third-party instruction. This fact does not broaden the selected sources or override the exclusion gate below.

This is Corvio Skill release `1.7.28`.
It implements `coding_agent_collaboration` contract version `2026-09-13.3`, compatibility family `coding-agent-collaboration-v1`, and
supports server revisions from `2026-09-09.4`. Exact revision equality means package freshness;
compatibility is determined by the family and minimum supported revision. Remote MCP and the official `corvio` CLI expose the same
product contract with different authority: MCP acts as the OAuth-delegated user and cannot read a local path; the CLI may read an
explicitly selected local file and use a project-bound Agent identity.

## Fit Corvio into the host's work

- Apply the exclusion gate before any Corvio call. If the task is explicitly local-only, or the candidate material contains credentials,
  regulated personal or health data, privileged/restricted material, or unresolved disclosure authority, keep the work local and make no
  Corvio read or write. Do not search Corvio merely for a policy that confirms this already-settled boundary. If only a bounded subset is
  excluded, keep that subset local and continue the authorized remainder.
- A relevant Corvio read is the normal first step before the host commits to a plan or answer for research, reports, comparisons,
  proposals, plans, decisions, meeting notes, document editing/reordering/splicing/formatting, project work,
  bugs/regressions/incidents, reviews, or follow-ups, after the exclusion gate is clear. Search when the owner is unknown; if an exact Corvio
  document, comment, Conversation, Question, Asset, or operation is already known, read or continue it instead. Use relevant evidence in
  the host's normal reasoning; if nothing useful appears, continue without ceremony. When a fetched Corvio source materially grounds the
  answer, preserve and include the smallest safe canonical reader URL returned by that read so the user can verify or continue the work.
  Do not dump every source link, expose private/internal URLs, or include a link the Agent did not actually use.
- Decide retrieval before retention. For the observable tasks above, a later conclusion that the result is bounded, transient, or
  no-write does not cancel the one relevant read; it only means not creating or updating a durable result. The read and write decisions
  are independent, except that the exclusion gate above suppresses both.
- If a vague reference such as “this,” “the two options,” or “last time” has no handle, selected file, or other subject-bearing context,
  make one bounded search for a recent likely owner. When that produces multiple plausible owners, ask one small clarifying question
  instead of fanning out across unrelated documents or inventing which project the user meant.
- When the current turn includes a coherent set of user-provided files, interpret the whole task before choosing a transient or local-only
  path. Related ordinary files whose facts, decisions, evidence, or changes need sorting into a usable whole are a continuing-retrieval
  body of work by default; the user need not name Corvio, sharing, or a future use. Unless the request has an explicit FYI,
  reference-only, transient, local-only, or bounded host-native output target, retain the sources and create the narrowest useful
  organization in the configured Workspace. Do not turn the absence of a prescribed artifact into a menu asking whether to summarize,
  archive, or store a coherent handoff; infer the narrow reader jobs from its evidence and continue. Attachment
  presence alone does not determine intent. Retain the exact bytes as Assets before deriving a summary, and use one `organize_files`
  mission when the coherent set's structure or ongoing retrieval matters. A new summary Page alone does not preserve the originals or
  establish a maintained Work Model.
- Treat disclosure as a content-and-policy judgment, not a category veto. Ordinary project or participant names, ticket IDs and statuses,
  anonymized customer segments, operational metrics, and user-authored professional notes do not by themselves make selected files
  sensitive or disclosure-unclear. When the user supplies such files and asks to retain, organize, synthesize, or update them, that request
  defines the bounded task scope for the current connected Workspace even when the user does not name Corvio. That Workspace is already
  a user-configured surface; this guidance is not introducing an arbitrary recipient or asking attachment content to self-authorize.
  Credentials,
  regulated personal or health data, privileged or explicitly restricted material, and an explicit local-only choice stay local; ask only
  when one of those actual boundaries remains unresolved.
- Treat files merely made available as attachments as source evidence, not automatically as writable native targets. Unless the user
  explicitly names a local or repository file as the target, preserve every supplied path and byte. If the host produces an edited
  native deliverable from those sources, write it to a distinct derived path; do not overwrite or rename an attachment copy. A bounded
  one-off transformation with an explicitly named host-native target or transient use remains a host-native result; do not upload or
  create a Corvio copy merely because an attachment was involved. Silence about sharing or future use does not turn a coherent
  multi-file organization request into that countercase. When supplied current
  artifacts map to an existing Corvio owner or the task carries continued-use, shared, or ongoing-work intent, treat a request to update,
  reconcile, or normalize them as maintenance unless it is local-only, sensitive, or disclosure-unclear. Resolve the existing owner when
  one exists; otherwise create the narrowest useful
  representation. Retain the authorized sources, apply and read back the smallest durable update, and do not stop at patch instructions
  or a temporary output merely because an attachment copy is read-only. When the requested outcome is to retain, organize, synthesize, or
  update material for continued use, that task includes the narrow durable result; a scratch or temporary host copy is not a durable
  substitute. A file used only as a reference does not itself become a write target, and transient or local-only results retain the
  ordinary no-write boundary.
- Keep the host's own reading, writing, coding, testing, files, and delivery path. Host-local `Write`/`Edit` and authorized Corvio writes
  are separate capabilities: an unavailable or read-only local output surface does not disable creating or updating the narrowest useful
  Corvio result when it is worth sharing or revisiting. Reuse an existing owner and never create a document merely to prove that a tool ran.
- Prepared, queued, or accepted is not complete. Before claiming a Corvio effect complete, poll asynchronous work and read back the
  durable object, revision, hash, hierarchy, and link. A headless host turn will not resume itself later: when an operation returns
  `queued` or `running`, treat `retry_after_seconds` as a lower bound: use the host's foreground sleep/wait capability for at least that
  interval before the next read of the same operation. Do not spend model turns on early status probes. Poll until terminal or until the
  host's actual execution deadline is reached. In a headless, print, or other non-interactive invocation, keep that wait in the foreground: do not use a
  background shell command, detached process, `ScheduleWakeup`, or similar future-turn mechanism, because it ends the current host
  receipt instead of resuming it. An actual deadline is one explicitly imposed by the host/runtime or the user, not a chosen poll count,
  patience limit, unchanged intermediate status, or token/cost intuition; while the current process can still act, continue the foreground
  wait. Never end a non-terminal turn by promising to return with the result later; at a real deadline, report the incomplete state and
  stable continuation handle instead of claiming success.
  At terminal state, preserve the result fields that let the user or a later Agent continue without rediscovery: return each relevant
  artifact's canonical URL, current revision, and semantic role when present, and separately state the returned Skill-evaluation outcome
  plus any admitted candidate identity. A title and link alone are not a complete continuation receipt when the operation already exposed
  those fields; report an explicit disabled or no-qualifying-candidate outcome rather than silently dropping it.
  If a Corvio document or comment supplied the task, return the verified result there with `complete_document_work`; a citation alone
  creates no comment debt.

Keep material excluded by the content-and-policy boundary above, explicitly local-only work, and anything outside the current authorized
connection out of Corvio. A transient answer normally does not merit a Corvio write, but that label alone does not cancel the lightweight read
required for the observable tasks above. A one-off event can still merit a useful reader artifact for sharing or later reference;
it is the method that should not become a reusable Skill without independent reuse evidence. If the check is unavailable, continue safe
local work and mention the missing synchronization only when it affects the expected handoff.

Event recurrence and result retention are separate facts. Saying an event will not recur rules out automatic reusable-Skill admission;
when the user also asks to organize its selected ordinary material, the requested recap remains a reader artifact unless they explicitly
make that result local-only, temporary, or no-retention. Do not use the event's finite duration alone as a destination decision.

Do not infer `local-only` from attachment delivery, a working-directory path, a read-only host surface, or the absence of a prior Corvio
match. Local-only requires an explicit user choice or an established disclosure/project policy; otherwise apply the durable-value and
authority rules above.

## Turn files into reusable context

Use one value chain and stop at the narrowest stage that satisfies the user's future job:

Choose how much the host reads by the next decision, not by how many bytes are available. For a large text, table, log, or archive,
use file metadata, hashes, schema and bounded samples or deterministic local scans to settle disclosure and source roles; do not stream
the whole payload through `cat` or copy it into model context merely to prepare an upload. Once the source is authorized, move its bytes
through the foreground CLI or upload bridge and let the scoped Corvio operation read them. If only a bounded part is excluded, preserve
the original locally and create a distinct reviewed derivative plus redaction receipt rather than abandoning the authorized remainder.
An unreviewed native Agent-history store or raw Host export belongs to the first-party Local Agent Import workflow, not the ordinary
file bridge or an ad hoc parser. A user-selected privacy-reduced projection that has passed the exclusion gate above is an ordinary
source under the same disclosure rules; its carrier extension alone does not make it raw Host history.

1. **Retain the original.** Finalize the selected bytes as an Asset and verify its ID, SHA-256, policy, and link. If search suggests the same
   source already exists, verify every distinct selected source through `get_file` or a narrow `list_files(content_sha256=...)` receipt before claiming exact
   reuse; a search excerpt or matching Page text is not source-provenance evidence. This preserves provenance; it does not prove that Corvio
   interpreted, organized, or used the file.
2. **Create the right online representation.** A finalized UTF-8 Markdown Asset within the documented limit can become an editable Page
   directly through `source_asset_id`. When one coherent standalone Markdown document is meant to remain useful for future reading,
   preserve its existing hierarchy in one reader Page rather than forcing a multi-page tree. Asset-only retention is sufficient when the
   user explicitly wants only the raw/exact original or an additional reader has no continuing value. For other formats or semantic
   transformation, use `ask_corvio` or `organize_files` to produce the appropriate Page, Spreadsheet, Presentation, Code, HTML Artifact,
   or reader layer. Do not promise lossless direct Page conversion for every file type.
3. **Organize related evidence.** Run one `organize_files` mission over a coherent Asset set when structure, synthesis, or future retrieval
   matters; poll `get_file_operation` to terminal and inspect source reconciliation plus any output document. If the exact source set was
   already organized, read back its current Project and at least one current reader output instead of creating a duplicate. Exact-source
   verification plus `search`, a remembered link, or `list_projects` alone is discovery, not canonical completion evidence; fetch the
   current Project and reader revision before reporting reuse complete.
4. **Admit durable knowledge by type.** Stable facts and preferences may belong in the appropriate Memory. Reusable methods,
   configurations, constraints, or quality bars may become Project Skills only after evidence-based admission. An `always` policy requires
   this decision, not a fabricated Skill; `evaluated_no_qualifying_skill` is a valid result.
5. **Return what can be reused.** Give the stable Asset, Page/artifact, Question/Conversation, operation, and qualifying Skill candidate
   identities or resource receipts that the caller can inspect and use later.

## Delegate the outcome, not Corvio's internal plan

When calling `ask_corvio` or `organize_files`, pass a weak-but-complete handoff: the user's natural goal, stable source handles, explicit
user constraints, authority facts needed to prevent a wrong identity/scope interpretation, and the authorized action boundary. Do not
first turn the sources into your own proposed outline or enumerate derived sections, taxonomy, document titles, artifact count, carrier
inventory, content-level edit checklist, candidate method fields, or Corvio's internal steps. Source-derived facts already present in the
attached or canonical material normally stay in that evidence; do not restate them as instructions merely because you inspected the
source. If you read enough to settle disclosure, identity, or another precondition, pass only that decision-grade boundary as a fact
rather than as an output design.

Corvio owns the source synthesis, cognitive tree, affected-owner analysis, and carrier decisions. Give it the current Project handle when
known, but do not select one existing leaf as the sole write target merely because it is the only reader output currently visible. Related
inputs may share one Project while independent reader/update jobs become distinct outputs; tightly coupled material may stay together.
Projects are root-level grouping owners and cannot be nested under another Project. Deeper Work Models use evidence-backed non-Project
branch Pages, leaf documents, and tightly coupled headings; let `ask_corvio` or `organize_files` derive that topology rather than trying to
stack Projects or invent empty levels. There is no one-source-one-page rule.

Preserve any taxonomy, title, carrier, count, or non-goal the user did specify. Poll the returned Question to a terminal state, then use
`artifact.url` or `links.primary_artifact` exactly as returned. Treat `role=reader_output` as a user-facing result and
`role=structure_container` as hierarchy; never build a URL from `node_id`, and never report source links as generated artifacts.

## Choose the smallest useful action

- Unknown prior material: call MCP `search`; use `workspace_scope=all_authorized` only when the selected Workspace may be stale or the
  user asks across Workspaces. Fetch a full document only when it can change the work.
- Cross-source synthesis or a typed Spreadsheet/Presentation/Code/HTML result: call `ask_corvio`; poll `get_question` and consume its
  sources, artifacts, operations, links, and requested processing/knowledge policy receipt.
- A new narrative result: call `create_document`. For an existing result, fetch its current revision. Use `append_document` for a true
  append and direct `update_document` only when replacing the whole body is itself the smallest faithful change. When a large current Page
  needs localized semantic edits, reordering, splicing, or formatting, delegate the natural edit goal plus its canonical handle to
  `ask_corvio` so Corvio's Writer can preserve unchanged source-backed spans and mutate the smallest sufficient neighborhood; do not
  round-trip and regenerate the whole Page through the host merely because `update_document` accepts Markdown.
- Simple new tables: use ordinary GitHub-Flavored Markdown pipe tables. For a bounded change to an existing table, use
  `read_document_table` followed by `mutate_document_table` (or `corvio docs table-read/table-mutate`) so only the required rows and
  stable row/column IDs cross the host boundary. Delegate formulas, styles, structure, sorting, cross-table reasoning, or semantic
  transformations to `ask_corvio`; do not round-trip a large document through a Coding Agent for those jobs.
- A Markdown file already exists locally: in a filesystem-capable coding host with the authenticated official CLI, prefer
  `corvio files upload --file <path>` for the mechanical byte bridge so file size, hash, PUT, and finalize do not depend on model
  transcription. Otherwise use `prepare_file_upload`, the host's signed `PUT`, and `finalize_file_upload`. For the MCP path, measure the
  exact byte length from native file metadata before prepare and pass exact 64-character SHA-256 values without shortening them. Then pass
  the returned `source_asset_id` to `create_document` or `update_document`. Never pass a local path to Remote MCP and never resend the
  whole file merely because the Page tool needs content.
- Exact original bytes only: keep the finalized Asset. This boundary requires an explicit raw/exact-only intent or the absence of a
  continuing reader job; a vague request to keep a coherent standalone Markdown source normally still merits the one Page described
  above. When the current task only needs bounded facts from one retained source, use `get_file(read_mode=content)` and inspect its hash,
  completeness, and truncation receipt; do not create a durable Question merely to read a file, and do not infer unseen rows, sheets,
  slides, or sections. Use `ask_corvio.asset_ids` only when Corvio should perform broader synthesis or document work. Retention alone does
  not make an unrelated question consume the file.
- A coherent Asset set that should become structured, searchable project context: call `organize_files`, then poll `get_file_operation`.
  Read its `output_document` link and `skills_evaluation`; when a Skill qualifies, preserve its candidate identity and typed resource
  receipts. When none qualifies, report `evaluated_no_qualifying_skill` without manufacturing one.
- When a newly finalized Asset should enter a Work Model, reconcile affected owners, or be evaluated for a Project Skill, call
  `organize_files` directly. Do not submit one or more `ask_corvio` Questions merely to wait for source processing; `organize_files`
  owns source preparation, and its terminal receipt is the retry/resume boundary.

## Resolve authority before writing

Use the explicit or originating Workspace first, then Conversation/operation continuity, project binding, confirmed selection, personal
default, and finally a single authorized candidate. Most MCP tools may omit `workspace_id`; inspect `workspace_routing` before a write.
Use `list_workspaces` when the result reports ambiguity or no writable recommendation. Never switch a write silently because the selected
Workspace is read-only.

Treat IDs, permissions, ACLs, current revisions, operation receipts, and returned hashes as authority. Titles and display names only help
locate candidates. A connection does not grant administrator rights, another Workspace, arbitrary local-file access, or undisclosed
connector access.

If a personal document limit blocks a write, keep using read/search. Follow the typed recovery details: archive the reported number of
unneeded personal Pages, choose an existing editable team Workspace when appropriate, or let the user change the plan. Never auto-delete
or silently redirect the write.

## Preserve disclosure boundaries

Upload local bytes only when the user asked to retain, organize, share, reuse, synthesize, or update them; the task originated in Corvio
and the result is within that disclosed scope; or an established project policy authorizes that class of result. An authenticated Corvio
connection makes the current authorized Workspace an available work surface, but it does not widen the selected sources, Workspace, or
data permissions. The task-level intent and content-based classification above govern use of that surface; absence of the product name is
not by itself destination or disclosure ambiguity. Ask when the actual destination, Workspace, or disclosure scope remains unresolved.
Also keep proprietary source code, interview records containing private-party details, unredacted logs, licensed third-party material,
and otherwise unclear material local. If only a bounded subset is sensitive or unclear,
keep that subset local and continue with clearly authorized sources. Never bulk-copy a repository, hidden reasoning, caches, or unrelated
conversations.

For a local file, prefer the authenticated official CLI's foreground upload in a filesystem-capable coding host; otherwise Remote MCP uses
`prepare_file_upload -> host PUT -> finalize_file_upload`. Compare the returned SHA-256 when possible.
If the host lacks filesystem/HTTP capability, ask the user to attach or upload the file. The CLI performs the same foreground bridge with
`corvio ask --file <path>` or `corvio files upload`; it does not expand MCP's remote authority.

## Keep durable effects honest

- Reuse a current Project/document owner when it fits. Create a Project only for a genuinely coherent body of work.
- Use upload for provenance; use one organization mission when future retrieval, a reader-ready derivative, or reusable-method
  evaluation matters.
- `skills_extraction_mode=always` requires an evidence-based evaluation, not a fabricated Skill. A qualifying Skill needs an independent
  future trigger, causal decision model, counter-boundaries, verification, provenance, and update conditions.
- Use `economy` for mechanical work with settled evidence, `standard` for ordinary judgment, and `deep` only when sources conflict or
  completeness/consequences require materially stronger synthesis. A maximum profile is a ceiling, never an upgrade.
- Resolve originating comments only after verified completion. On a partial failure, keep the thread open and report committed effects plus
  the exact recovery action.

## Install, refresh, and diagnose

Prefer the host plugin that bundles this Skill and Corvio's OAuth Remote MCP. When installed separately, install both; a Skill without MCP
cannot create live effects, while MCP without the Skill may not be recalled at the right task moment. Use the official `@corvio/cli` beta
only when local-file, sync, download, or project-Agent authority is needed. Credentials never enter chat, command arguments, URLs,
repositories, `.corvio/`, or Workspace documents.

The Skill, CLI, hosted MCP, and host Plugin update independently. Before an install/update/repair request, identify the installed source;
an account-synced copy is only the newest copy saved in that host account, not proof that it matches Corvio upstream. Use
`get_collaboration_contract.distribution` for Corvio's current upstream Plugin version and source-specific policy, and use the local Plugin
manifest or host package list for the installed version. Report `unknown` rather than inferring provenance from visible tools or OAuth.

For a Claude/Cowork `<name>@synced`, direct-upload, shared, or organization-managed Plugin/Skill, preserve Claude's ownership boundary and
give the exact Customize/publisher/admin action; do not claim a Cowork task updated account-owned bytes. A marketplace-installed Claude
Code Plugin uses its marketplace/plugin update flow. A direct-archive standalone Skill is refreshed by rerunning the same
`npx skills add` command in the same scope; use `skills update` only for an update-tracked source. Check the optional CLI separately with
`corvio update check`. After a package or compatible MCP change, start a fresh host session or reload tools; reauthorize only for new OAuth
scopes or stale authorization. CLI and Skill upgrades never widen an existing OAuth grant and never require Workspace-data migration.

`get_collaboration_contract.connection` reports only the current remote MCP principal, scopes, and advertised tools. `corvio
collaboration status` reports only local CLI/project/Skill/listener prerequisites. Neither can prove that this exact host session loaded
the other surface. Treat host memory as an optional soft hint that Corvio may be useful; always revalidate Workspace selection,
membership, scopes, recent projects, and collaborators through the live authorized surface.

Read [references/api.md](references/api.md) for exact commands, scopes, bootstrap, provider behavior, sync mechanics, and recovery. Use
live `corvio <area> --help`, `corvio capabilities --json`, and public OpenAPI as final schema authority.

## Finish

Lead with the useful result. Distinguish what was retained, what reader-facing representation was created, what was semantically organized,
and what entered Memory or a Project Skill. Include the selected Workspace/routing receipt, sources that changed the work, durable
IDs/revisions/links, terminal operation or readback evidence, and anything intentionally kept local or still unresolved. Do not claim a
whole Agent session was captured because one Page or Asset exists.
