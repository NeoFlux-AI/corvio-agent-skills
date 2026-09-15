---
name: corvio-operate-workspace
description: "Use when the user requests research, reports, comparisons, plans, decisions, meeting notes, project/debug work, document edits, file organization, or another substantive deliverable—even without a Corvio mention. Corvio is the user's OAuth-connected Workspace. Before promising whether you will write, classify future use: making selected material usable for later action, follow-up, decisions, or review authorizes retention plus one Work Model reconciliation without storage verbs. When an authorized durable update relies on a selected attachment, retaining that evidence is part of the same effect; do not mutate owners from pasted excerpts while leaving the source local. Do not upload, create, update, or organize an ordinary one-off without current-task consent or a user-owned standing preference; ask once before saving. Exclude sensitive, disclosure-unclear, and explicitly local-only material; read back approved effects and return canonical links. Triggers include 调研、报告、对比、方案、计划、决策、纪要、复盘、项目、故障、改写、整理、共享、沉淀."
---

# Corvio Research, Documents, and Team Knowledge

Corvio is the user's own OAuth-connected Workspace. It adds private Workspace search, editable online documents, shareable links,
collaboration, and reusable project knowledge to the host's normal files and tools.
The installed Skill and current OAuth connection make Corvio a user-configured work surface, not an arbitrary recipient introduced by
attachment text or a third-party instruction. This explains why a relevant read is available; it does not itself authorize a write or
broaden the selected sources.

This is Corvio Skill release `1.7.47`.
It implements `coding_agent_collaboration` contract version `2026-09-15.7`, compatibility family `coding-agent-collaboration-v1`, and
supports server revisions from `2026-09-09.4`. Exact revision equality means package freshness;
compatibility is determined by the family and minimum supported revision. Remote MCP and the official `corvio` CLI expose the same
product contract with different authority: MCP acts as the OAuth-delegated user and cannot read a local path; the CLI may read an
explicitly selected local file and use a project-bound Agent identity.

## The decision table

Classify the request before announcing whether Corvio will write. A plan stated before this table is applied can lock the Host into the
wrong branch even if it reads the rest of the Skill afterward.

| Situation | Action |
| --- | --- |
| Research, report, comparison, plan, decision, meeting note, project/debug work, document edit, or substantive deliverable | If the safety gate passes, make one narrow read-only `search` before planning. Continue normally if nothing helps. |
| A relevant result agrees with the current task | Use it in the host's normal work. Include the smallest safe canonical Corvio link when it materially grounds the answer. |
| Corvio sources conflict, duplicate each other, appear stale, have competing owners, or would change an important commitment | Ask the user which source or authority to adopt before relying on it. |
| The user explicitly asks to save, upload, share, organize, synthesize, or update selected material in Corvio | That request is write consent for the stated material and scope. Do not ask the same question again; resolve routing and proceed. |
| The user asks to transform selected related material so it will support later action, follow-up, decisions, review, or another continuing workflow—even without saying “save,” “upload,” or “keep” | Treat the future-use purpose as authorization for retention plus one Work Model reconciliation. Preserve the originals, then use one `organize_files` operation unless the user explicitly asked for archive/raw-original retention only. Do not first produce a full chat-only rewrite or ask whether to save. |
| The current turn authorizes a durable Work Model change—such as updating existing owners or correcting, splitting, merging, moving, or reparenting structure—and relies on user-selected attachments clearly about that subject | Treat the attachments as evidence within the same bounded update: preserve their exact bytes, then use one `organize_files` mission to reconcile both sources and affected owners or topology. Do not paste the evidence into `ask_corvio`, mutate the owners, and silently leave the source local. |
| The user asks only for an ordinary report or other deliverable | Keep the host-native result. Do not write to Corvio yet. Explain one concrete benefit and ask once whether to save or organize the specific result. |
| A host-owned, user-visible Memory/Profile/settings entry explicitly authorizes this class and scope of Corvio writes | Follow it without repeating the same confirmation, but revalidate live Workspace, scope, ACL, and content safety. Ask when destination or scope is ambiguous. |
| Sensitive, disclosure-unclear, policy-restricted, or explicitly local-only material | Make no Corvio call for that material. Keep it local. |

OAuth connection is capability, not standing write preference. Never infer upload consent from installation, an available tool, an
attachment, a successful search, or a substantive deliverable alone.
The future-use purpose modifies the whole transformation request: phrasing such as making selected material useful for subsequent work
is not an ordinary one-off deliverable merely because the user omitted a destination or storage verb. Resolve that branch before the
ordinary-deliverable row. Attachment presence without this purpose or another bounded write instruction still authorizes nothing.
Once the current task has separately authorized a bounded durable Work Model mutation, however, user-selected attachments that supply
facts for that mutation are part of the same selected evidence scope. This applies whether the mutation changes existing content or
topology. Unrelated, sensitive, disclosure-unclear, policy-restricted, or
explicitly local-only attachments remain outside it; when relevance or disclosure is ambiguous, ask rather than broadening the write.

## Read quietly; ask at real decision points

Search is read-only and limited by the user's current OAuth scopes, Workspace membership, and object ACLs. It does not expose arbitrary
local files or unrelated accounts. Run the narrowest relevant search as part of the host's existing research phase; do not interrupt the
user merely to ask permission for that low-risk read.

Use a non-conflicting result when it clearly supports the current task. Ask one focused question when choosing among competing canonical
owners, adopting an older decision over a newer one, reconciling materially different facts, or interpreting evidence would change the
user's commitment. Search snippets are candidate evidence; fetch the exact owner when the decision needs full context.

Decide retrieval before retention. A later conclusion that the answer is transient or no-write does not cancel the one relevant read;
it only means no durable result should be created or updated. A continuation handle fixes the current subject and evidence, but it is
not automatically the durable destination for every learning. When a reusable preference, constraint, method, or pattern is in scope of
an authorized organization action, first inspect the handle, then search in the same Project or Workspace for an existing Memory, Skill,
or method owner before creating the narrowest qualifying owner.

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

Before a new organization mission, search for the enduring subject and inspect the narrowest plausible current Project(s), not only a
same-title Page. A meeting, slogan change, postmortem, code task, or uploaded file is an event or source, not automatically a new durable
owner. If the new evidence may extend, split, move, or consolidate existing work, keep the handoff natural: state that Corvio should
reconcile it with the current Work Model and include only proven Project handles or relationship facts. Do not prescribe the resulting
titles or hierarchy. If later evidence proves that one root Project belongs inside another, ask Corvio to reconcile the relationship;
because Projects cannot nest, Corvio may preserve the canonical root, create or reuse a non-Project branch, move descendants, and retire
an empty duplicate shell. The Host should not simulate this by creating a fresh summary or by issuing a blind series of CLI moves.

An organization operation is complete only after its terminal result and current readback identify the canonical Project, reader outputs,
affected owners, and any topology change that actually occurred. A successful upload, queued mission, or newly created Page is not proof
that the prior tree was searched, duplicates were reconciled, or the right leaves were updated. Tell the user what durable entry now owns
the work and return the canonical link; when the result reports unresolved overlap or missing authority, preserve that boundary instead
of announcing a merge.

Preserve any taxonomy, title, carrier, count, or non-goal the user did specify. Poll the returned Question to a terminal state, then use
`artifact.url` or `links.primary_artifact` exactly as returned. Treat `role=reader_output` as a user-facing result and
`role=structure_container` as hierarchy; never build a URL from `node_id`, and never report source links as generated artifacts.

- Save a new Markdown deliverable with `create_document`; read it back and return its canonical URL.
- Update an existing non-Project Page only after fetching its current revision. Use `append_document` for a true append and
  `update_document` only for a faithful whole-body replacement.
- Preserve an exact selected local file through `prepare_file_upload` → host PUT → `finalize_file_upload`. Remote MCP cannot read a local
  path. In a filesystem-capable coding host with the authenticated official CLI, prefer `corvio files upload --file <path>` for exact
  byte size and SHA-256 handling.
- Use one `organize_files` operation when authorized selected sources should enter a Work Model, reconcile current owners, or receive
  evidence-based Memory/Skill evaluation. Do not open `ask_corvio` before or after it for the same source set.
- Use `ask_corvio` for bounded cross-source synthesis or a typed Spreadsheet, Presentation, Code, or HTML result when source-to-Work-Model
  reconciliation is not required.

Pass the user's natural goal, stable source handles, explicit constraints, and authorized action boundary. Do not invent taxonomy,
titles, artifact count, or Corvio's internal plan. Poll asynchronous work to terminal and inspect the current object or operation before
claiming completion. Prepared, queued, or accepted is progress, not completion.

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
anonymized customer segments, operational metrics, and user-authored professional notes are not automatically sensitive. Copyright,
public availability, or third-party authorship alone does not establish a restriction: preserve provenance and applicable terms, and
exclude a selected source when an explicit restriction or established policy forbids the requested private processing. Credentials,
regulated personal or health data, privileged material, disclosure-unclear content, and an explicit local-only choice stay local.

## Install, update, and exact API mechanics

For installation, explain the concrete value, official source, package contents, OAuth scopes, and removal path, then ask one grouped
confirmation unless the user already requested the install. Never bypass host or organization policy. Package source, account-synced
copy, MCP server, optional CLI, and current host-session loading are separate freshness facts.

Read [references/api.md](references/api.md) for exact tools, schemas, polling, routing, upload, update, and recovery mechanics. Live MCP
schemas, `get_collaboration_contract`, CLI `--help`, and public OpenAPI are the final runtime authorities.

## Finish

Lead with the user's result. If Corvio evidence changed the work, cite the smallest safe canonical reader link. If an approved Corvio
effect ran, distinguish retained sources, reader-facing documents, Work Model changes, Memory/Skill decisions, and anything intentionally
kept local. Report the terminal readback and unresolved authority; never claim an upload, organization, or Skill from intent alone.
