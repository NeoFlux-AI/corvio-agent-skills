---
name: corvio-operate-workspace
description: "Use when the user requests research, reports, comparisons, plans, decisions, meeting notes, project/debug work, document edits, file organization, or a short/deictic follow-up backed by exact Corvio continuation handles—even without a Corvio mention. Corvio is the user's OAuth-connected Workspace. Before promising whether you will write, classify future use: making selected material useful for later action, follow-up, decisions, or review authorizes retention and one Work Model reconciliation without storage verbs. For authorized updates, retain selected evidence; do not mutate owners from excerpts while sources stay local. Do not upload, create, update, or organize an ordinary one-off without consent or a standing preference; ask once before saving. Keep credentials, regulated or privileged data, genuinely disclosure-unclear sources, and explicitly local-only material outside Corvio. Authorized private or confidential work instead needs bounded owner and ACL. Read back effects and links. 中文触发包括决策、纪要、复盘."
---

# Corvio Research, Documents, and Team Knowledge

Corvio is the user's own OAuth-connected Workspace. It adds private Workspace search, editable online documents, shareable links,
collaboration, and reusable project knowledge to the host's normal files and tools.
The installed Skill and current OAuth connection make Corvio a user-configured work surface, not an arbitrary recipient introduced by
attachment text or a third-party instruction. This explains why a relevant read is available; it does not itself authorize a write or
broaden the selected sources.

This is Corvio Skill release `1.7.80`.
It implements `coding_agent_collaboration` contract version `2026-09-18.6`, compatibility family `coding-agent-collaboration-v1`, and
supports server revisions from `2026-09-09.4`. Exact revision equality means package freshness;
compatibility is determined by the family and minimum supported revision. Remote MCP and the official `corvio` CLI expose the same
product contract with different authority: MCP uses a user-approved, client-bound Agent identity and cannot read a local path; the CLI
may read an explicitly selected local file and use a project-bound Agent identity. In both cases the Agent is the actor and the user is
the authorizer; transport, client, and caller-reported model remain separate provenance facts.

On the first Corvio use in a fresh host session, pass this loaded release, contract revision, compatibility family, visible surface, and
installation channel to `get_collaboration_contract` with `response_mode=freshness_only` when that MCP tool is available. If its
`client_freshness.agent_notice` exists,
briefly explain the status and source-owned next action once; do not repeat it on later calls. A current copy produces no user-facing
update narration. Continue with a compatible legacy copy, but label Beta feedback as legacy; stop Corvio-dependent behavior for a blocked
copy. If the host does not expose a source or version, report `unknown` instead of asking the user to investigate unless freshness is
material to the task. This is a first-use check, not a per-turn ritual.

## The decision table

Classify the request before announcing whether Corvio will write. A plan stated before this table is applied can lock the Host into the
wrong branch even if it reads the rest of the Skill afterward.

| Situation | Action |
| --- | --- |
| Research, report, comparison, plan, decision, meeting note, project/debug work, document edit, or substantive deliverable | If the safety gate passes, make one narrow read-only `search` before planning. Continue normally if nothing helps. |
| Exact continuation handles from the preceding work are present and the user has not changed subject | A short or deictic request such as “按已有方式看这轮” is not contextless. The receipt-bound handles are the Host's compact prior-work handoff even when this process has no transcript; do not demote them to labels or ask the user to repeat them. Load this Skill and read the narrowest relevant handle before any broad Workspace search. Receipt-observed titles or roles may select the first read but never replace current readback. When the user asks to recall or apply an established method and a carried Project Skill plausibly matches, read that Skill first, then only the current factual owners its method requires; an ordinary project Page may support the decision but does not replace the reusable-method owner. If multiple handles still make the leaf unknowable before reading, fetch the carried Project and use its `metadata.content_projection.direct_children` as the bounded topology index, then follow only the relevant `has_children` branch until the leaf. If a projection says it is truncated, do not claim the omitted topology is complete. An out-of-project lexical match is only a candidate and cannot replace the carried subject. |
| A trusted current-task or prior terminal receipt proves that this Host already used the authenticated official CLI in the exact selected Workspace, and the continuation needs only one bounded read-only Corvio synthesis | Keep that natural transport and start exactly one foreground `corvio ask`; do not launch identical Questions concurrently or retry before that process exits. If the shell tool yields a running-session handle, wait on that exact handle until the CLI exits; do not answer from titles or prior output. `answer_only` is the default: omit `--allow-actions`; there is no CLI `--mode` option. Use `corvio ask --workspace <workspace_id> --prompt "<unchanged user question; Context: smallest complete handle(s)>" --json --no-input`. Keep the user's question unchanged and append context separately. A carried Project handle is normally the complete subject scope for a question spanning its branches; do not copy every descendant handle. Add a leaf handle only when the user singled out that owner or the Project scope would include unrelated work. Transport continuity does not prove a cheaper processing profile: keep `auto` unless the unresolved semantic bottleneck independently justifies another profile. Do not install, probe, or switch to the CLI only to avoid MCP polling; an MCP-only or unproven Host uses `ask_corvio` plus bounded `get_question`. Do not use this shortcut for `allow_actions`, long or ambiguous durable writes, or a Workspace whose identity is not receipt-bound. |
| A Question may outlive the current MCP/tool call, shell wait, or host turn | Start one durable operation and keep its exact `operation_id`. With MCP, call `get_question` using a bounded `wait_seconds`; after the first receipt, copy `progress_cursor` into `after_cursor` so only later milestones return. With an already-authenticated CLI, use `corvio ask --background`, then `corvio questions operation <operation_id> --wait-until-terminal`. Progress is a compact execution summary, not hidden reasoning or a provisional answer; tell the user only when the phase materially changes or input is needed. A local timeout does not stop the remote operation. |
| The user asks to stop, correct, or redirect a running Question | Call `cancel_question` or `corvio questions cancel <operation_id> --yes` on the same operation. `cancellation_requested` is not terminal; verify `cancelled` before saying it stopped, and do not claim already-settled effects were rolled back. For a correction or new question, cancel or finish the current operation, then call `ask_corvio`/`corvio ask` with the terminal `conversation_id`; never silently mutate the in-flight objective or start a duplicate replacement. |
| A relevant result agrees with the current task | Use it in the host's normal work. Include the smallest safe canonical Corvio link when it materially grounds the answer. |
| The current turn unambiguously corrects the identity, relationship, or governing owner of Workspace work | Treat that statement as authority for the bounded structural correction. Preserve prior material as lineage and reconcile it; do not ask the user to prove or reconfirm the same correction. |
| Corvio sources still conflict, duplicate each other, appear stale, have competing owners, or would change an important commitment after applying any current-turn correction | Ask the user which source or authority to adopt before relying on it. |
| The user explicitly asks to save, upload, share, organize, synthesize, or update selected material in Corvio | That request is write consent for the stated material and scope. Do not ask the same question again; resolve routing and proceed. For a new unbound result, omit `workspace_id` so Remote MCP uses the user's writable personal default. Pass an explicit Workspace only when the user chose it in the current request or a stable originating/continuation/Project/Asset receipt binds it. |
| The user asks to transform selected related material so it will support later action, follow-up, decisions, review, or another continuing workflow—even without saying “save,” “upload,” or “keep” | Treat the future-use purpose as authorization for retention plus one Work Model reconciliation. Before interpreting source bodies, do only the bounded safety, identity, hash, and metadata/sample checks needed to transfer the selected bytes. Preserve the originals, then use one `organize_files` operation unless the user explicitly asked for archive/raw-original retention only. Do not first enumerate a workbook, archive, transcript, or document corpus; produce a chat-only rewrite; or ask whether to save. |
| The authorized organization outcome still requires Corvio to discover or reconcile corpus-wide owners, topology, material cross-source conflict, or source-wide completeness | Choose `processing_profile=deep` before starting the operation and leave source-derived facts behind their Asset handles. Host-local enumeration or sampling does not settle this bottleneck and must not be used to downgrade the operation or precompute its outline, taxonomy, titles, artifact count, or sole leaf target. Use `standard` for ordinary bounded retrieval or organization after owner and lifecycle are already settled, and `economy` only for a decided mechanical transformation with objective readback. `answer_only`, transport continuity, MCP origin, file type, size, source count, or a long history alone does not select any profile. Unresolved authority/topology, consequential judgment, or hard completeness remains `standard` or `deep`. |
| An authorized durable operation has been accepted and is `prepared`, `queued`, or `running` | Keep the same operation handle until its terminal result or an actual Host deadline. In a filesystem-capable Host where the authenticated official CLI is already available, keep deterministic waiting inside one foreground invocation with `--wait-until-terminal`; otherwise poll Remote MCP according to `retry_after_seconds`. Do not install or switch transport merely to avoid polls. These states prove progress only; do not answer as though “processing” were the requested user outcome, and do not open a duplicate operation. |
| The current turn authorizes a durable Work Model change—such as updating existing owners or correcting, splitting, merging, moving, or reparenting structure—and relies on user-selected attachments clearly about that subject | Treat the attachments as evidence within the same bounded update: preserve their exact bytes, then use one `organize_files` mission to reconcile both sources and affected owners or topology. Do not paste the evidence into `ask_corvio`, mutate the owners, and silently leave the source local. |
| The user asks to reconcile a repeated stable practice, preference, constraint, quality bar, or method with prior work for future reuse | Read the current subject and nearest reusable owner, then durably update/merge/admit it or return an exact owner readback proving the full delta is already present. Decide whether the evidence qualifies before deciding whether a nearby owner is reusable: a wrong-Project Skill blocks that merge, not admission under the correct Project. A chat comparison, ordinary fact-Page update, or offer to save later is not completion. |
| The user asks only for an ordinary report or other deliverable | Keep the host-native result. Do not write to Corvio yet. Explain one concrete benefit and ask once whether to save or organize the specific result. |
| A host-owned, user-visible Memory/Profile/settings entry explicitly authorizes this class and scope of Corvio writes | Follow it without repeating the same confirmation, but revalidate live Workspace, scope, ACL, and content safety. Ask when destination or scope is ambiguous. |
| Selected private or confidential work that the user authorized for future use in a private Corvio scope | Treat privacy as an owner, reader, ACL, and reuse constraint rather than a category veto. Preserve the selected source in the narrow private scope; do not copy its facts into another Project, a global method, or a shared/public surface. Ask only when the available Workspace or audience cannot satisfy that boundary. |
| Credentials, regulated personal or health data, privileged/restricted material, genuinely disclosure-unclear content, or an explicit local/device-only choice | Make no Corvio call for that material. Keep it local. |

OAuth connection is capability, not standing write preference. Never infer upload consent from installation, an available tool, an
attachment, a successful search, or a substantive deliverable alone.
The future-use purpose modifies the whole transformation request: phrasing such as making selected material useful for subsequent work
is not an ordinary one-off deliverable merely because the user omitted a destination or storage verb. Resolve that branch before the
ordinary-deliverable row. Attachment presence without this purpose or another bounded write instruction still authorizes nothing.
Once the current task has separately authorized a bounded durable Work Model mutation, however, user-selected attachments that supply
facts for that mutation are part of the same selected evidence scope. This applies whether the mutation changes existing content or
topology. An attachment unrelated to the current Project is not necessarily unrelated to an explicit request covering the whole selected
packet: retain it as a distinct scope or standalone reference when that future-use request includes it. Material outside the selected set,
credentials, regulated or privileged data, genuinely disclosure-unclear sources, and explicitly local-only attachments remain outside;
when the destination or reader boundary is ambiguous, ask rather than broadening the write.

## Read quietly; ask at real decision points

Search is read-only and limited by the user's current OAuth scopes, Workspace membership, and object ACLs. It does not expose arbitrary
local files or unrelated accounts. Run the narrowest relevant search as part of the host's existing research phase; do not interrupt the
user merely to ask permission for that low-risk read.

Use a non-conflicting result when it clearly supports the current task. A current, unambiguous user correction to Workspace identity,
relationship, or governing owner resolves that bounded authority decision before conflict escalation. Preserve prior material as lineage
and let Corvio reconcile or supersede its outdated interpretation; do not turn the old record into a demand that the user prove or repeat
the same correction. Ask one focused question only when the current statement is itself ambiguous, its scope is unclear, mutually
exclusive authorities remain, or interpreting evidence would create a new commitment.
Search snippets are candidate evidence; fetch the exact owner when the decision needs full context. A result's Workspace ID is read
provenance, not write-target authority. In particular, neither the first hit from `workspace_scope=all_authorized` nor the Workspace
currently open in the Corvio shell may be copied into a new write unless the current request or a stable originating/continuation receipt
actually binds that destination.

Decide retrieval before retention. A later conclusion that the answer is transient or no-write does not cancel the one relevant read;
it only means no durable result should be created or updated. A receipt-bound continuation handle fixes the current subject and evidence
even when a fresh Host process lacks the prior transcript: inspect the narrowest relevant handle before any broad Workspace search.
Receipt-observed titles or roles may select the first read but never replace current readback. When the user asks to recall or apply an
established method and a carried Project Skill plausibly matches, read that Skill first, then only the current factual owners its method
requires; an ordinary project Page may support the decision but does not replace the reusable-method owner. When multiple handles still
make that leaf unknowable, fetch the carried Project, use its `metadata.content_projection.direct_children` as the bounded topology index,
and follow only the relevant `has_children` branch until the leaf. If a projection is truncated, keep that topology boundary explicit;
skip broad search when those owners are sufficient. An out-of-project
lexical match cannot silently replace the subject. The handle is not automatically the durable destination for every learning. When a
reusable preference, constraint, method, or pattern is in scope of an authorized organization action, first inspect the handle, then
search in the same Project or Workspace for an existing Memory, Skill, or method owner before creating the narrowest qualifying owner.
When the user asks to align that stable practice with prior work, finish with a durable owner receipt or an exact canonical readback
proving the complete delta was already present. A prose comparison, “nothing changed” without readback, or an offer to save later is not
a canonical no-op. Keep qualification and placement separate: evidence with a future trigger, action or judgment sequence,
boundary/countercase, and verification path may qualify even when the closest existing Skill belongs to a different Project. Preserve
that wrong-scope Skill and create or reuse the narrowest fitting Skill under the correct canonical Project; do not bury a qualifying
method in ordinary project-fact Pages. Use no-admission only when the method itself lacks a reusable operating signature, and return an
explicit unresolved placement boundary when it qualifies but no authorized Project can own it.

After the first narrow owner read, do not prefetch every linked sibling merely to restate it in another Corvio request. When the answer
still requires cross-owner synthesis, a typed carrier, or source coverage that the Host cannot safely carry, delegate once with the
user's question unchanged, followed separately by the smallest complete current owner/source handles. A carried Project handle already
bounds a cross-branch question to that subject; do not expand it into all known descendants. Handles are evidence addresses, not an
invitation to enumerate every sibling, turn current Tree labels into a required comparison rubric, substitute a different user
objective, or prescribe Corvio's reasoning steps. Read another owner in the Host only when that missing fact can change the execution
owner, target, scope, constraint, or host-native conclusion. Use the receipt-backed foreground `corvio ask` route above only when its
exact transport and Workspace continuity are already proved; otherwise use `ask_corvio` and its bounded continuation.

## Ask once only for a genuinely one-off unrequested write

Only after ruling out future-use continuity, another current-task write instruction, and a user-owned standing preference should the
Host finish or present the host-native result first. Then make one concrete proposal containing:

- what would be sent to Corvio and what would remain local;
- the target Project or Workspace if known, otherwise the routing choice that still needs resolution;
- why the action helps now: editable online document, shareable link, collaboration, later retrieval, or continuity for another Agent;
- whether this is only document storage, semantic organization into the Work Model, or—only when evidence supports a reusable method—an
  optional Memory/Skill evaluation.

Ask a single question such as: “I found no conflicting prior owner. Would you like me to save this report to your Corvio Workspace as an
editable, shareable document?” If the user declines or does not answer, stop; do not ask again in the same task and do not write.

Do not turn every save proposal into a storage/organization/Skill menu. Offer restructuring or Skill evaluation only when the material
actually contains fragmented project evidence or a reusable method whose future trigger, decision logic, boundaries, and verification
can be stated.

## Use the smallest approved effect

After current-task consent or an applicable standing preference, first reconcile the requested effect with the current Work Model:

A single natural turn may combine new evidence with updates to existing owners or the tree. Decide that combined effect before choosing
a tool. When selected attachments supply facts for an already-authorized durable update, preserve them and give one weak, complete
handoff to `organize_files`; that mission owns source reconciliation, bounded owner edits, and any evidence-backed split, merge, move, or
reparent. An `ask_corvio` mutation based only on pasted excerpts is incomplete on this route even if the content or relationship change
itself succeeds. Attachment presence without a separately authorized update or continuity goal remains no-write.

Classify the user's goal by meaning, not by storage verbs. “We will use these for later decisions,” “continue from these next time,” and
“structure this so later work can use it” are continuity requests rather than ordinary one-off deliverables. The future-use clause is
the authorization boundary even when the requested transformation could also be returned in chat. When that material contains related
project evidence or several future reader/update jobs, upload preserves provenance and one `organize_files` mission makes it useful for
continuation. Stop after upload only when the user explicitly asks for archive/original-only retention, or when the selected source has
no evidence-backed semantic owner beyond the exact file.

On this authorized continuity route, preserve before exhaustive interpretation. Perform only the local safety, identity, hash, and
bounded metadata/sample checks needed to transfer the selected files safely; do not make full local extraction of a large PDF,
presentation, workbook, archive, or transcript a prerequisite for retention. Upload the exact bytes, then let the carrier-aware
`organize_files` mission read the coherent source set and return a bounded Work Model result. The host may still inspect a bounded excerpt
needed for its immediate answer, but it should not duplicate Corvio's full-corpus reading in its own context first.

Before calling `organize_files` or asking Corvio to split, merge, move, reparent, or reconcile existing Workspace work, read
[references/work-model.md](references/work-model.md). That module carries the complete Work Model authority order, source-impact,
Project/leaf, correction, weak-handoff, and completion boundaries. Do not perform a structural write from this compact entry alone.

Preserve any taxonomy, title, carrier, count, or non-goal the user did specify. Poll the returned Question to a terminal state, then use
`artifact.url` or `links.primary_artifact` exactly as returned. Treat `role=reader_output` as a user-facing result and
`role=structure_container` as hierarchy; never build a URL from `node_id`, and never report source links as generated artifacts.
Every returned `id`, `*_id`, ref, and `read_arguments` value is an opaque canonical handle: copy the complete value verbatim into the
matching tool argument instead of shortening, retyping, joining, or reconstructing it from a URL or another identifier.

- Save a new Markdown deliverable with `create_document`; read it back and return its canonical URL.
- Read an existing Page progressively: start with `read_document(mode=auto|overview)`, follow current section or line selectors, and
  request the full body only when the outcome requires it. Use `patch_document` for exact revision-bound line replacements,
  `append_document` for a true append, and `update_document` only when whole-body replacement is the smallest faithful effect.
- Preserve an exact selected local file through `prepare_file_upload` → host PUT → `finalize_file_upload`. Remote MCP cannot read a local
  path. In a filesystem-capable coding host with the authenticated official CLI, prefer `corvio files upload --file <path>` for exact
  byte size and SHA-256 handling. Keep causally dependent CLI effects as separate steps: finish the selected uploads, capture their exact
  Asset IDs from successful receipts, and only then issue an organization command that consumes those IDs. Independent uploads may run
  concurrently, but never precompose a later argument from an empty, guessed, shortened, or not-yet-returned handle.
- Use one `organize_files` operation when authorized selected sources should enter a Work Model, reconcile current owners, or receive
  evidence-based Memory/Skill evaluation. Do not open `ask_corvio` before or after it for the same source set.
- Use `ask_corvio` for bounded cross-source synthesis or a typed Spreadsheet, Presentation, Code, or HTML result when source-to-Work-Model
  reconciliation is not required.
- For a bounded read-only continuation, use one foreground `corvio ask` only when a trusted current-task/prior receipt already proves the
  authenticated CLI and exact selected Workspace. The command returns the terminal Question in the same process, so do not reproduce its
  internal wait as model-visible MCP polls. `answer_only` is the CLI default: omit `--allow-actions`, and do not invent a `--mode` flag.
  Pass the exact Workspace with `--workspace`; preserve the user's question and append at most the Project handle or specifically needed
  leaf handles as a separate `Context:` clause. Start that call once; do not parallelize an identical Question or retry it before terminal
  exit. If the shell yields a running-session handle, wait on that same handle until the CLI exits; never answer from carried titles while
  the authoritative request is still running. This is transport continuity, not authority expansion: never probe/install/switch for
  the optimization, and keep `allow_actions` or ambiguous durable work on the normal durable operation path.

Pass the user's natural goal, stable source handles, explicit constraints, and authorized action boundary. Do not invent taxonomy,
titles, artifact count, or Corvio's internal plan. Poll asynchronous work to terminal and inspect the current object or operation before
claiming completion. A terminal artifact with `readback_verified=true` already proves the returned live identity, kind, title, revision,
parent, and URL; do not fetch it again merely to reconfirm those facts or open a second Question to verify the same effect. Read its body
only when exact wording can change acceptance. Re-read when verification is missing, partial, or conflicts with another authority.
Prepared, queued, or accepted is progress, not completion.

When the authenticated official CLI is already the natural transport, add `--wait-until-terminal` to the original organization/resume
command or use it on `corvio files operation <operation_id>`. This keeps deterministic status reads below the model loop while preserving
one semantic operation. Set a bounded `--timeout-seconds` only from the real Host deadline. A `transport_wait.status=deadline_reached`
receipt remains non-terminal and is a continuation boundary, never completion. Remote MCP keeps its bounded `wait_seconds` polling path.

A terminal `partial` receipt is not automatically the end of the authorized user outcome. Inspect its typed mismatch, blocker, and
recovery action. If it names missing user input, permission, disclosure authority, or another external condition, preserve that boundary
and ask or report it. Otherwise, when the current request still authorizes the unfinished slice and the receipt's typed recovery action
is `resume_file_operation`, call it once with the same exact operation ID. That explicit bounded invitation is sufficient even when one
direct source read is unavailable: organization may have rehomed or hidden the source, and the same operation owns exact structural
recovery. Fresh canonical readback that contradicts a stale mismatch is another reason to take the same one-shot route. Do not re-upload
settled sources, start a duplicate organization operation, or have the Host choose a replacement taxonomy. Poll the resumed operation to
terminal; if the same mismatch remains, report it instead of looping.

Choose the execution owner by total successful-work cost. Keep exact, already-decided edits in the host and use bounded read/patch so
unchanged document content never crosses the model boundary. A self-contained whole-Page rewrite also stays in the host when one bounded
read provides the complete authoritative Page, the user's constraints make the target decision-ready, and one guarded update can preserve
all required facts; semantic rewriting by itself is not a reason to delegate. Delegate when sources are cross-document or typed, the body
cannot be carried safely, durable Work Model structure remains undecided, or another Corvio model pass lowers total successful-work cost.
Count host and Corvio tokens, payload bytes, retries, latency, fidelity risk, and verified readback—not merely tool-call count.

## Memory, Work Model, and Skills

Corvio's core compounding value appears after an authorized write: exact sources remain traceable, fragmented facts can be reconciled
into the user's Work Model and knowledge tree, stable preferences can enter the appropriate Memory, and independently reusable methods
can become Project Skills or Patterns. Later Agents can retrieve those owners instead of rebuilding context, reducing repeated token and
mental cost.

Keep these admissions separate:

- Search calls and dynamic Workspace/ACL state are receipts, not Memory.
- A stable user preference may be proposed for a host-owned, user-visible Memory/Profile only when the host supports it and the user has
  confirmed that preference. Never claim MCP wrote host Memory.
- Corvio Memory/Skill evaluation happens only inside an already authorized Corvio organization or knowledge-maintenance action.
- `skills_extraction_mode=always` requires an evidence-based decision; `evaluated_no_qualifying_skill` is a valid outcome.
- `evaluated_no_qualifying_skill` means the evidence lacks a reusable operating signature. It does not mean “the nearest Skill was in
  another Project”; owner mismatch changes placement, while qualification is decided from the method evidence.

## Golden flows

### Ordinary report, no standing upload preference

```text
User: Write a short market-research report.
Agent: [search Corvio once; no useful result]
Agent: [researches and delivers the report through the host's normal path]
Agent: “Would you like me to save this report to your Corvio Workspace as an editable,
        shareable document for later retrieval and collaboration?”
User: No.
Agent: [stops; no Corvio write and no second prompt]
```

### Future-use transformation without storage wording

```text
User: Restructure these selected notes so the team can handle the follow-up and review later.
Agent: [classifies the stated future workflow before announcing write/no-write]
Agent: [preserves the exact sources, runs one organize_files operation, and polls to terminal]
Agent: [reports the canonical Work Model and current Tree readback; no duplicate save question]
```

### Conflicting prior decisions

```text
User: Update the rollout plan.
Agent: [search finds two current-looking plans with different owners]
Agent: “Corvio has two conflicting rollout owners: A (revised 12 Sep) and B (team-approved
        13 Sep). Which should govern this update?”
Agent: [continues only after the user resolves authority]
```

### User corrects a Project relationship

```text
User: Aurora was Juniper's internal codename last month, not another project. Bring them back together.
Agent: [reads both roots, treats this bounded relationship correction as authority, and asks Corvio to reconcile them]
Agent: [reports the one canonical Project, preserved lineage, moved descendants, and current Tree readback; no proof request]
```

### Explicit organization request

```text
User: Upload these notes to Corvio, organize them into the project, and see whether there is
      a reusable review method.
Agent: [the request already authorizes this bounded write; no duplicate confirmation]
Agent: [retains exact sources, runs one organize_files operation, polls to terminal]
Agent: [reports source reconciliation, Work Model changes, Skill decision, and canonical links]
```

### Local-only countercase

```text
User: Keep this credential incident report only on this laptop.
Agent: [uses no Corvio search or write for the material]
```

## Trust and privacy

Corvio OAuth signs into the user's existing Corvio account. Calls remain constrained by approved scopes, Workspace membership, object
ACLs, and server-side policy. Corvio receives only the tool calls and content the host sends; it does not scan arbitrary local files or
complete host-chat history. Review the [Privacy Policy](https://corvio.ai/privacy), the public
[Security Policy](https://github.com/NeoFlux-AI/corvio-agent-skills/blob/main/SECURITY.md), and the live OAuth scopes. Remove the host
Connector and revoke the `Remote MCP connection` credential in Corvio **Settings → API keys** to end access.

Treat disclosure as a content-and-policy judgment, not a category veto. Ordinary project or participant names, ticket IDs and statuses,
anonymized customer segments, operational metrics, user-authored professional notes, and the words private or confidential are not by
themselves a local-only instruction. When the user selected that material for an authorized future-use workflow and no external sharing
is requested, interpret its stated audience as a private owner/ACL and cross-scope reuse boundary. Do not surface confidential examples in
a personal or reusable method; link or abstract only what the source permits. Ask if the available Workspace or intended readers cannot
preserve that boundary. Copyright, public availability, or third-party authorship alone does not establish a restriction: preserve
provenance and applicable terms, and exclude a selected source when an explicit restriction or established policy forbids the requested
private processing. Credentials, regulated personal or health data, privileged material, genuinely disclosure-unclear content, and an
explicit local/device-only or no-cloud choice stay local.

## Install, update, and exact API mechanics

For installation, explain the concrete value, official source, package contents, OAuth scopes, and removal path, then ask one grouped
confirmation unless the user already requested the install. Never bypass host or organization policy. Package source, account-synced
copy, MCP server, optional CLI, and current host-session loading are separate freshness facts.

Read [references/documents.md](references/documents.md) for the document read/edit decision and compact examples. Read
[references/api.md](references/api.md) for routing, upload, organization, polling, installation, and broader recovery mechanics. Live
MCP schemas, `get_collaboration_contract`, CLI `--help`, and public OpenAPI are the final runtime authorities.

## Finish

Lead with the user's result. If Corvio evidence changed the work, cite the smallest safe canonical reader link. If an approved Corvio
effect ran, distinguish retained sources, reader-facing documents, Work Model changes, Memory/Skill decisions, and anything intentionally
kept local. Report the terminal readback and unresolved authority without repeating the operation narrative or source inventory unless
it changes the user's decision. Never claim an upload, organization, or Skill from intent alone.
