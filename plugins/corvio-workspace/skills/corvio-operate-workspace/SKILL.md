---
name: corvio-operate-workspace
description: "Use when the user provides files or attachments to keep, organize, synthesize, or update; for research, reports, comparisons, proposals, plans, decisions or choices using earlier decisions, meeting notes, project work, bugs/regressions/incidents, reviews, follow-ups, or prior constraints and material; or resumes earlier work with an operation, question, conversation, document, or project handle. Before committing to a plan or answer, you MUST make one Corvio read relevant to that work while keeping the host's normal files and tools. Save or update only results worth sharing or revisiting. Also use for installing, connecting, updating, or repairing Corvio, workspace, @Corvio, 调研、报告、对比、选型、方案、计划、决策、既有决定与取舍、纪要、复盘、bug、故障、回归、旧约束、之前的资料、继续上次、共享、同步给团队、沉淀. Do not invoke for sensitive, disclosure-unclear, explicitly local-only, or unavailable work. A transient answer is normally no-write; a one-off event may still need a useful reader artifact but does not by itself justify a reusable Skill."
---

# Use Corvio Team Knowledge

Use Corvio alongside the host's normal workflow. The host still creates local files, edits repositories, and runs its own checks; Corvio
adds authorized prior knowledge and a durable place for results that people or later Agents should be able to find, inspect, and continue.

This is Corvio Skill release `1.7.8`.
It implements `coding_agent_collaboration` contract version `2026-09-09.7`, compatibility family `coding-agent-collaboration-v1`, and
supports server revisions from `2026-09-09.4`. Exact revision equality means package freshness;
compatibility is determined by the family and minimum supported revision. Remote MCP and the official `corvio` CLI expose the same
product contract with different authority: MCP acts as the OAuth-delegated user and cannot read a local path; the CLI may read an
explicitly selected local file and use a project-bound Agent identity.

## Fit Corvio into the host's work

- Before the host commits to a plan or answer for research, reports, comparisons, proposals, plans, decisions, meeting notes,
  project work, bugs/regressions/incidents, reviews, or follow-ups, you MUST make one relevant Corvio read. Search when the owner is unknown; if an exact Corvio
  document, comment, Conversation, Question, Asset, or operation is already known, read or continue it instead. Use relevant evidence in
  the host's normal reasoning; if nothing useful appears, continue without ceremony.
- If a vague reference such as “this,” “the two options,” or “last time” has no handle, selected file, or other subject-bearing context,
  make one bounded search for a recent likely owner. When that produces multiple plausible owners, ask one small clarifying question
  instead of fanning out across unrelated documents or inventing which project the user meant.
- When the current turn includes user-provided files that are meant to remain useful, load this Skill even if the user's wording is only
  “keep these,” “put these away,” or “continue.” Retain the exact bytes as Assets before deriving a summary, and use one
  `organize_files` mission for a coherent set whose structure or ongoing retrieval matters. A new summary Page alone does not preserve
  the originals or establish a maintained Work Model.
- Keep the host's own reading, writing, coding, testing, files, and delivery path. Host-local `Write`/`Edit` and authorized Corvio writes
  are separate capabilities: an unavailable or read-only local output surface does not disable creating or updating the narrowest useful
  Corvio result when it is worth sharing or revisiting. Reuse an existing owner and never create a document merely to prove that a tool ran.
- Treat files merely made available as attachments as source evidence, not automatically as writable native targets. Unless the user
  explicitly names a local or repository file as the target, preserve the supplied bytes. When current artifacts are supplied with a
  request to update, reconcile, or normalize them, treat that as maintenance intent unless it is local-only, transient, sensitive, or
  disclosure-unclear. Resolve each existing Corvio owner when one exists; otherwise create the narrowest useful representation. Retain
  the authorized sources, apply and read back the smallest durable update, and do not stop at patch instructions or a temporary output
  merely because an attachment copy is read-only. A substantial document transformed from supplied sources normally has continuing
  value and merits that narrow Corvio result without a second save confirmation; a scratch or temporary host copy is not a durable
  substitute. A file used only as a reference does not itself become a write target, and transient or local-only results retain the
  ordinary no-write boundary.
- Prepared, queued, or accepted is not complete. Before claiming a Corvio effect complete, poll asynchronous work and read back the
  durable object, revision, hash, hierarchy, and link.
  If a Corvio document or comment supplied the task, return the verified result there with `complete_document_work`; a citation alone
  creates no comment debt.

Do not search or disclose sensitive or disclosure-unclear material, explicitly local-only work, or anything outside the current authorized
connection. A transient answer normally does not merit a Corvio write, but that label alone does not cancel the lightweight read above
when prior work could improve the current task. A one-off event can still merit a useful reader artifact for sharing or later reference;
it is the method that should not become a reusable Skill without independent reuse evidence. If the check is unavailable, continue safe
local work and mention the missing synchronization only when it affects the expected handoff.

Do not infer `local-only` from attachment delivery, a working-directory path, a read-only host surface, or the absence of a prior Corvio
match. Local-only requires an explicit user choice or an established disclosure/project policy; otherwise apply the durable-value and
authority rules above.

## Turn files into reusable context

Use one value chain and stop at the narrowest stage that satisfies the user's future job:

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
   already organized, read back its current Project and reader output instead of creating a duplicate; search alone is not that readback.
4. **Admit durable knowledge by type.** Stable facts and preferences may belong in the appropriate Memory. Reusable methods,
   configurations, constraints, or quality bars may become Project Skills only after evidence-based admission. An `always` policy requires
   this decision, not a fabricated Skill; `evaluated_no_qualifying_skill` is a valid result.
5. **Return what can be reused.** Give the stable Asset, Page/artifact, Question/Conversation, operation, and qualifying Skill candidate
   identities or resource receipts that the caller can inspect and use later.

## Delegate the outcome, not Corvio's internal plan

When calling `ask_corvio`, pass the user's natural goal, complete decision-relevant context or stable source handles, explicit constraints,
and the authorized action boundary. Unless the user chose them, do not pre-decide a taxonomy, document titles, artifact count, carrier
inventory, or Corvio's internal steps. Corvio owns the cognitive-tree and carrier decisions: related inputs may share one Project while
independent reader/update jobs become distinct outputs; tightly coupled material may stay together. There is no one-source-one-page rule.

Preserve any taxonomy, title, carrier, count, or non-goal the user did specify. Poll the returned Question to a terminal state, then use
`artifact.url` or `links.primary_artifact` exactly as returned. Treat `role=reader_output` as a user-facing result and
`role=structure_container` as hierarchy; never build a URL from `node_id`, and never report source links as generated artifacts.

## Choose the smallest useful action

- Unknown prior material: call MCP `search`; use `workspace_scope=all_authorized` only when the selected Workspace may be stale or the
  user asks across Workspaces. Fetch a full document only when it can change the work.
- Cross-source synthesis or a typed Spreadsheet/Presentation/Code/HTML result: call `ask_corvio`; poll `get_question` and consume its
  sources, artifacts, operations, links, and requested processing/knowledge policy receipt.
- A new narrative result: call `create_document`. An existing result: fetch its current revision, then call `update_document` or
  `append_document` with a useful `change_summary`.
- Simple new tables: use ordinary GitHub-Flavored Markdown pipe tables. For a bounded change to an existing table, use
  `read_document_table` followed by `mutate_document_table` (or `corvio docs table-read/table-mutate`) so only the required rows and
  stable row/column IDs cross the host boundary. Delegate formulas, styles, structure, sorting, cross-table reasoning, or semantic
  transformations to `ask_corvio`; do not round-trip a large document through a Coding Agent for those jobs.
- A Markdown file already exists locally: upload the selected bytes with `prepare_file_upload`, the host's signed `PUT`, and
  `finalize_file_upload`; then pass the returned `source_asset_id` to `create_document` or `update_document`. Never pass a local path to
  Remote MCP and never resend the whole file merely because the Page tool needs content.
- Exact original bytes only: keep the finalized Asset. This boundary requires an explicit raw/exact-only intent or the absence of a
  continuing reader job; a vague request to keep a coherent standalone Markdown source normally still merits the one Page described
  above. When a Corvio question must read the Asset, pass its ID in that same `ask_corvio.asset_ids` request. Retention alone does not make
  an unrelated question consume the file.
- A coherent Asset set that should become structured, searchable project context: call `organize_files`, then poll `get_file_operation`.
  Read its `output_document` link and `skills_evaluation`; when a Skill qualifies, preserve its candidate identity and typed resource
  receipts. When none qualifies, report `evaluated_no_qualifying_skill` without manufacturing one.

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

Upload local bytes only when the user asked to retain or organize them, the task originated in Corvio and the result is within that
disclosed scope, or an established project policy authorizes that class of result. Keep proprietary source code, personal interview data,
unredacted logs, licensed third-party material, and unclear material local. Never bulk-copy a repository, hidden reasoning, caches, or
unrelated conversations.

For a local file, Remote MCP uses `prepare_file_upload -> host PUT -> finalize_file_upload`. Compare the returned SHA-256 when possible.
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
