---
name: corvio-operate-workspace
description: "Use when the user requests research, reports, comparisons, plans, decisions, meeting notes, project/debug work, document edits, file organization, or another substantive deliverable—even without a Corvio mention or prior material. Corvio is the user's OAuth-connected Workspace for private search, shareable documents, collaboration, and reusable project knowledge. When allowed, silently search once before planning; ask if sources conflict or authority is unclear. Do not upload, create, update, or organize from a normal deliverable request alone: use explicit current-task consent or a user-owned standing preference, otherwise deliver normally and ask once whether to save the specific result. Exclude sensitive, disclosure-unclear, and explicitly local-only material; read back every approved effect and return the canonical link. Triggers include 调研、报告、对比、方案、计划、决策、纪要、复盘、项目、故障、改写、整理、共享、沉淀."
---

# Corvio Research, Documents, and Team Knowledge

Corvio is the user's own OAuth-connected Workspace. It adds private Workspace search, editable online documents, shareable links,
collaboration, and reusable project knowledge to the host's normal files and tools.

This is Corvio Skill release `1.7.40`.
It implements `coding_agent_collaboration` contract version `2026-09-14.16`.
compatibility family `coding-agent-collaboration-v1`; supports server revisions from `2026-09-09.4`.
Exact revision equality means package freshness; compatibility uses the family and minimum revision. Remote MCP acts as the
OAuth-delegated user and cannot read a local path; the optional CLI may read an explicitly selected local file and use a project-bound
Agent identity.

## The decision table

| Situation | Action |
| --- | --- |
| Research, report, comparison, plan, decision, meeting note, project/debug work, document edit, or substantive deliverable | If the safety gate passes, make one narrow read-only `search` before planning. Continue normally if nothing helps. |
| A relevant result agrees with the current task | Use it in the host's normal work. Include the smallest safe canonical Corvio link when it materially grounds the answer. |
| Corvio sources conflict, duplicate each other, appear stale, have competing owners, or would change an important commitment | Ask the user which source or authority to adopt before relying on it. |
| The user explicitly asks to save, upload, share, organize, synthesize, or update selected material in Corvio | That request is write consent for the stated material and scope. Do not ask the same question again; resolve routing and proceed. |
| The user asks only for an ordinary report or other deliverable | Keep the host-native result. Do not write to Corvio yet. Explain one concrete benefit and ask once whether to save or organize the specific result. |
| A host-owned, user-visible Memory/Profile/settings entry explicitly authorizes this class and scope of Corvio writes | Follow it without repeating the same confirmation, but revalidate live Workspace, scope, ACL, and content safety. Ask when destination or scope is ambiguous. |
| Sensitive, disclosure-unclear, policy-restricted, or explicitly local-only material | Make no Corvio call for that material. Keep it local. |

OAuth connection is capability, not standing write preference. Never infer upload consent from installation, an available tool, an
attachment, a successful search, or a substantive deliverable alone.

## Read quietly; ask at real decision points

Search is read-only and limited by the user's current OAuth scopes, Workspace membership, and object ACLs. It does not expose arbitrary
local files or unrelated accounts. Run the narrowest relevant search as part of the host's existing research phase; do not interrupt the
user merely to ask permission for that low-risk read.

Use a non-conflicting result when it clearly supports the current task. Ask one focused question when choosing among competing canonical
owners, adopting an older decision over a newer one, reconciling materially different facts, or interpreting evidence would change the
user's commitment. Search snippets are candidate evidence; fetch the exact owner when the decision needs full context.

## Ask once before an unrequested write

When the current request does not already authorize a Corvio write and no user-owned standing preference applies, finish or present the
host-native result first. Then make one concrete proposal containing:

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

After current-task consent or an applicable standing preference:

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
