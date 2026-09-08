---
name: corvio-operate-workspace
description: Use Corvio as the user's authorized shared work context throughout non-trivial coding, debugging, research, planning, synthesis, or handoff—even when the user does not mention Corvio. Check the current project's connection, retrieve knowledge that can change the work, preserve authorized sources/results with continuing value, ask Corvio to organize coherent files and evaluate evidence-backed Skills, verify durable effects, and return them to the originating document or thread. Also use when installing or connecting Corvio. Skip trivial, transient, sensitive, or explicitly local-only work; never infer administrator, local-import, browser, or undisclosed-file authority.
---

# Operate Corvio Workspace

Use the live Corvio surface available in the host: Remote MCP for OAuth-delegated Workspace work, the official `corvio` CLI when the
host has local files or a project-bound Agent identity, and public Corvio `/v1` resources as the durable facts behind both. Continue from
returned IDs and receipts instead of reconstructing cloud state from titles or prompt text. The Skill decides when and why to use Corvio;
MCP/CLI provide the actual authority and effects.

This Skill implements `coding_agent_collaboration` contract version `2026-09-03.2`. The live
`corvio capabilities --json` response exposes the same collaboration contract plus `document_authoring`; Remote MCP derives its server
instructions from that backend owner. Treat a missing or contradictory contract as adapter drift, not permission to invent a different
workflow for one host.

## Why Corvio belongs in the work loop

A coding Agent is strong at the current local task, but useful context is easily stranded in one terminal, chat, checkout, or person's
memory. The user then has to restate settled background, repeat discovery, and explain why a decision was made. Corvio is the user's
authorized shared work context for closing that gap: it keeps sources, understanding, decisions, deliverables, edits, and feedback in a
Workspace that people and Agents can inspect, correct, and continue.

Treat Corvio as a collaborator, not a reporting sink:

- Corvio supplies current project knowledge, prior decisions, user preferences, source documents, Skills, and conversation continuity
  when they can improve today's judgment.
- The coding Agent returns selected sources, decisions, intermediate conclusions, and finished results when they will help a person or a
  later Agent continue.
- The user owns disclosure and important choices. Corvio owns durable Workspace identity, permissions, collaboration state, and receipts.
  The coding Agent owns local reasoning, implementation, and verification.

The objective is not more tool calls, uploads, or Skills. It is a better current result and a cheaper, more accurate continuation. For
meaningful connected work, completion includes both the useful local outcome and any valuable shared continuation point. When an exact
Corvio document or thread supplied the task or feedback, returning the verified result there is part of the work.

## Make every instruction earn its place

An instruction is valid only when its causal role is clear: what user result it protects, which stage needs it, what evidence or authority
supports the decision, how the action follows, and what observable receipt proves completion. A command list without that chain is only a
reference, not a work policy. Read [references/api.md](references/api.md) for install syntax, command forms, provider details, or error
recovery only when the current stage needs them; prefer live `--help`, `capabilities`, and returned receipts over memorized mechanics.

## Decide whether this task needs Corvio

Apply three questions at natural boundaries: before non-trivial work, after a meaningful result appears, and before completion.

1. Could authorized Workspace context change scope, constraints, prior decisions, current facts, or collaborator expectations?
2. Does a selected source, decision, method, intermediate result, or deliverable have clear handoff, reuse, or provenance value after this
   chat ends?
3. Did a Corvio document, comment, Conversation, or Agent event materially supply the task and therefore need a visible closeout?

A `yes` opens the corresponding branch of the loop below. A verified `no` closes it: finish self-contained typo fixes, one-line commands,
transient experiments, and answers already supported by authoritative local evidence without ceremonial searches, uploads, or documents.
The user does not need to repeat the word “Corvio,” and the Agent does not need to meet a call quota.

## Follow one causal loop

### 1. Ground — improve the decision before acting

Why: shared evidence is valuable only when it changes what the Agent will decide or do now.

- Authority: the exact Workspace, stable Conversation/document/resource handle, current revision, and authorized Corvio sources.
- Decision: identify the unresolved fact that could change the plan. Search when the target is unknown; read the exact object or continue
  the exact Conversation when a stable handle exists; use read-only `ask` when synthesis across authorized sources is the actual gap.
- Action: retrieve the smallest sufficient evidence and consume the result in the plan or answer.
- Completion: cite the stable source/handle and state what changed. Stop retrieving when the decision gap is closed; a successful tool call
  whose result does not affect the work is not grounding evidence.

### 2. Work — keep local execution local

Why: Corvio should improve the coding Agent's work without replacing the repository, native sandbox, or local verification loop.

- Authority: current project files, tests, host permissions, and any decision-grade Corvio evidence already retrieved.
- Decision: use ordinary local tools for local reading, editing, building, and testing. Keep exact Corvio IDs and revisions as continuity
  handles rather than copying cloud state into guessed local identities.
- Action: complete the requested work and record only evidence needed to verify or continue it.
- Completion: the local diff/result and focused checks are real. Hidden reasoning, dependency caches, temporary build output, and unrelated
  logs are never retention candidates.

### 3. Checkpoint — select what deserves continuity

Why: useful knowledge compounds only when the next reader can recover the evidence and decision without inheriting the entire chat.

- Authority: the user's disclosed task scope, source provenance, the current result, existing Project ownership, and any established
  retention policy.
- Decision: distinguish immutable sources, working results worth continuing, durable user deliverables, reusable methods, and unresolved
  gaps. Retain only items whose future handoff, reuse, or provenance value is concrete.
- Action: keep a small source/result ledger with exact IDs and intentional dispositions: retain, materialize, keep local, or unresolved.
- Completion: every meaningful candidate has a reasoned disposition. File count and the mere existence of output do not create value.

### 4. Materialize — create the continuation point a future reader needs

Why: an upload is only preserved bytes; the future reader needs the right canonical owner, useful carrier, and, when warranted, a reusable
method.

- Authority: current Workspace/Project structure, exact Asset/document identity, user disclosure authority, live capabilities, and the
  source evidence itself.
- Decision: reuse the existing owner and canonical document when the work continues them. Create a new carrier when the reader job and
  ownership evidence establish a genuinely new durable result; the user need not repeat “save this” after the value trigger is satisfied.
  Creating a new Workspace, changing visibility, or disclosing local bytes still requires its own explicit or established authority.
- Action: upload only selected authorized originals; organize a coherent source set in one mission when cross-source structure, a
  reader-ready derivative, or Skill evaluation matters; choose Page, Spreadsheet, Presentation, HTML Artifact, or source Asset according
  to the future reader's job.
- Completion: the original, placement, derived artifact, and knowledge disposition remain distinct effects with stable identities.

### 5. Verify — turn accepted work into durable truth

Why: queued or accepted work is progress, not a user result.

- Authority: the terminal operation, current durable object, current revision/tree placement, content/hash, and mission-scoped knowledge
  receipt.
- Decision: reconcile partial, failed, conflicted, or superseded effects from current state rather than optimistic prose.
- Action: poll every asynchronous organization to terminal with MCP `get_file_operation` or CLI
  `corvio files operation <operation_id>`, then read the output object identified by that receipt. If a follow-up edit or second
  organization occurs, repeat both checks against the latest operation and current object; an earlier readback does not verify a later
  effect.
- Completion: the latest terminal operation and current output content agree on stable ID, type, revision, hierarchy, URL, source
  reconciliation, and Skill evaluation. An empty artifact list, unchanged revision, or non-terminal operation cannot close the task.

### 6. Return — complete the human collaboration

Why: work that is locally correct but invisible at the shared handoff surface still forces people to reconstruct status.

- Authority: the exact Corvio source document/thread when one materially owned the task; otherwise the user's current request and the
  final durable result.
- Decision: return to the originating surface only when it was a real task/feedback owner. A document used only as a citation creates no
  comment debt.
- Action: give the useful result directly, attach exact links and receipts, and use `corvio agent closeout` for an originating document or
  thread. Resolve it only after verified completion; keep it open when a boundary remains.
- Completion: the user can inspect the result and continue from the same identity. Partial-effect recovery and intentional exclusions are
  explicit.

## Establish exact authority before an effect

Correct identity prevents useful work from becoming durable in the wrong place.

- If Remote MCP is available, use its preserved initialization instructions; when the host hides or drops them, call
  `get_collaboration_contract`. If the CLI/project Agent is the active surface, start with
  `corvio collaboration status --json --no-input`. Both expose the same shared contract; CLI readiness additionally checks local project
  binding and installed Skill state. A running inbound listener alone is never foreground collaboration readiness.
- Resolve one exact Workspace from explicit stable IDs, Conversation/event/operation continuity, project mapping, or a confirmed routing
  preference. Semantic ranking and recency are only fallback evidence. Ask when multiple plausible targets would change the result.
- Resolve documents, nodes, Assets, principals, and operations from returned stable IDs. Titles and display names locate candidates; they
  do not authorize mutation.
- Read current state before an update, share, archive, conflict resolution, or closeout. Use revision guards and stable idempotency keys.
- Treat effective permission as live Corvio membership/role and object ACL intersected with the host's local sandbox. A connection never
  grants administrator access, unrestricted host access, another Workspace, or arbitrary connector authority.

Installation and authentication are needed only when readiness is absent. Prefer a host plugin that bundles this Skill with Corvio's
OAuth Remote MCP. Where the host installs capabilities separately, install both the Skill and MCP; installing only MCP exposes actions but
may not make the collaboration loop discoverable, while installing only the Skill cannot create live Corvio effects. Add the reviewed
`@corvio/cli` beta when local-path, sync, download, or project-Agent authority is needed, then bind the intended Git project with
`corvio agents connect --project .`. Credentials never enter chat, command arguments, URLs, repositories, `.corvio/`, or Workspace
documents. See [references/api.md](references/api.md) for exact bootstrap, surface choice, provider, listener, and recovery procedures.

## Keep the installed surfaces current

Why: the Skill, CLI, and Remote MCP are three independently delivered surfaces. Updating one does not refresh the others, and an older
local Skill can keep teaching a superseded decision policy even while the live Corvio service has already changed.

- Treat a locally installed Skill as a static reviewed copy. Refresh it when the user asks for the latest Corvio setup, when
  `corvio collaboration status` reports `needs_skill` or `stale_skill`, or when a published Corvio notice says the official Skill package
  changed. Do not turn this into a per-turn download check.
- Treat the hosted manifest's content hash as the exact Skill package version. The collaboration-contract version proves shared
  Skill/CLI/MCP behavior compatibility, not byte-for-byte freshness; a `ready` collaboration receipt therefore does not prove that a
  content-only Skill revision is installed.
- Treat the CLI executable separately. `corvio update check --json --no-input` checks the reviewed npm release and never updates either
  the CLI or the Skill automatically.
- Treat Remote MCP behavior as server-delivered. A compatible server change normally needs no local package install, but the host may
  need a fresh session or tool refresh; newly requested OAuth scopes require explicit reauthorization.

After refreshing a Skill or bundled plugin, start a fresh host session and rerun `corvio collaboration status`. Completion is the new
session discovering the intended Skill scope and current collaboration contract, not merely a successful download. Exact refresh
commands and the direct-archive update boundary live in [references/api.md](references/api.md).

## Preserve disclosure boundaries

Connection authorizes use of scoped Corvio resources; it does not authorize undisclosed local bytes. Upload a local file only when the
user asked to retain/organize it, the task originated in Corvio and the selected result is within that disclosed collaboration scope, or
an established project policy authorizes that class of result. Otherwise ask at the disclosure decision, not at every harmless read.

Keep proprietary source code, personal interview details, unredacted logs, licensed third-party material, and any file with unclear
disclosure authority local. Never bulk-copy a repository, record arbitrary provider conversations, capture hidden reasoning, or treat a
listener as a background recorder. A sensitive or metadata-only Asset may be placed under its policy but must not be claimed as model-read.

Remote MCP never dereferences a host-local path. A local host that can read an explicitly selected file and issue HTTP requests may still
upload through MCP: call `prepare_file_upload`, PUT the exact bytes to the returned short-lived target using the returned method and
headers, then call `finalize_file_upload`, consume the durable Asset/hash receipt, and compare its SHA-256 with the local bytes when the
host can compute one. If the current Corvio question depends on that file, pass the finalized Asset ID in the same `ask_corvio` call's
`asset_ids`; a retained Asset is not automatically an input to an unrelated question. The CLI performs the same byte bridge, hash check,
and question binding through `corvio ask --file <path>`; use `--asset-ids` to ask with an already retained Asset. If the host has neither a local byte/HTTP capability nor the CLI, ask the user to attach or upload the file; never
pretend that a path string or successful preparation is a durable upload.

## Keep retention, organization, and Skill admission separate

Use plain upload when preserving or transferring the exact original is the whole outcome. Use one organization mission over the coherent
Asset set when future retrieval, semantic arrangement, a reader-ready derivative, or reusable methods matter. This separation protects
provenance and prevents “file retained” from being misreported as “knowledge organized.”

Skill extraction is an evidence admission decision, not a summary generator. A qualifying Skill must preserve a causal model that a later
Agent can execute:

- an independent future trigger or operating question;
- the evidence-backed why and decision axes that make the method appropriate;
- actions that actually change a decision or result;
- counter-boundaries, failure correction, and a stop condition;
- verification, provenance, and the conditions that should update the method.

A recipe containing commands or steps without that traceable why is not a qualifying Skill. Keep it in the reader artifact, merge it into
an existing Skill whose causal model already owns it, or return `evaluated_no_qualifying_skill`/unresolved. `auto` evaluates when evidence
suggests such a method; `always` requires a terminal admission decision but never a fabricated Skill; `off` forbids Skill creation for the
operation. For `ask`, `always` requires action mode because a qualifying decision may write; file organization is already an explicit
write operation.

## Match processing to the remaining judgment

Processing profiles express the unresolved reasoning bottleneck, not a provider model name or content-category classifier.

- `economy`: evidence and owner are already settled; the remaining transformation is mechanical and objectively read-backable.
- `standard`: ordinary retrieval, organization, or bounded semantic writing still requires judgment.
- `deep`: several independent sources conflict, completeness is hard to establish, or the consequence requires materially stronger
  synthesis.
- `auto`: Corvio selects the bounded default; `max_processing_profile` is a ceiling and never an upgrade.

Use `caller_model` only when the host knows its actual coding-model label. It is caller-reported observability, never Corvio execution,
billing, identity, or permission authority.

## Finish with evidence

The final response should let the user use the result now and resume later without reading an internal operation diary. Include:

- the useful conclusion or completed local result first;
- the exact selected Workspace and the continuity evidence used to choose it;
- relevant sources and what they changed in the work;
- retained/organized/changed stable IDs, typed carriers, revisions, links, and terminal receipts;
- the Skill admission outcome and its evidence-backed why when evaluated;
- anything intentionally kept local, unresolved, conflicted, blocked, or only partially committed.

Do not claim an entire coding-Agent run was captured because one Page was created. Complete handoff requires a recoverable source/result
ledger, useful durable carriers, visible collaboration trace when applicable, authoritative readback, and honest exclusions.

Read [references/api.md](references/api.md) when exact commands, scope requirements, provider behavior, sync mechanics, or error recovery
are needed. Use live `corvio <area> --help`, `corvio capabilities --json`, and public OpenAPI as the final command/schema authority.
