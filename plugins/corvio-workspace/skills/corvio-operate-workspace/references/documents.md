# Corvio document reads and edits

Use this reference when the task already targets a Corvio Page. It exposes a coding-Agent-shaped interface—overview first, then exact
sections or lines—without requiring the host to learn Corvio's internal Writer schema, block model, or conversion contracts.

## Choose the execution owner

Optimize total successful-work cost, not just the number of tool calls:

| Remaining work | Preferred path | Why |
| --- | --- | --- |
| The host already knows the exact replacement text and current lines | `read_document` then `patch_document`, or CLI `docs read` then `docs patch` | No second semantic model pass; unchanged content stays server-side; response is a compact verified delta |
| The host already has the complete authoritative source and can produce the complete final Markdown within its context | `update_document`, or CLI `docs update` | A guarded full replacement can be the lowest total-cost faithful effect; compact mutation output avoids echoing the body |
| The host just composed new Markdown for authorized future use, but its durable owner, lifecycle, Work Model structure, Memory, or Skill outcome is still undecided | `ask_corvio(mode=allow_actions, inline_materials=[...])`, or CLI `ask --allow-actions --inline-material-file` | One semantic operation receives the body as source evidence, reads current owners, and chooses the durable effect before writing |
| One authorized outcome combines finalized original Assets with Host-generated Markdown and their joint durable effect remains semantic | `ask_corvio(mode=allow_actions, asset_ids=[...], inline_materials=[...])`, or CLI `ask --allow-actions --asset-ids ... --inline-material-file ...` | One Question preserves original provenance, carries the Host result as a different typed source, and owns the joint reconciliation without a second organization run |
| Source material is Workspace-resident, cross-source or typed; the body is too large to carry safely; or Corvio must still decide the durable structure | `ask_corvio(mode=allow_actions)` | Corvio has the relevant source/carrier context and owns semantic writing plus durable readback |
| Existing ordinary Page table needs exact cell edits or row appends | `read_document_table` then `mutate_document_table` | Stable row/column IDs avoid replaying the table through host context |

Include host input/output tokens, Corvio model/runtime cost, request/result bytes, retry risk, latency, and canonical verification in the
comparison. A smaller request that causes repeated discovery or a lossy rewrite is not cheaper. A complex Corvio write is worthwhile
when it avoids transferring or reconstructing context the Corvio Agent already owns.

For a full rewrite, compare both viable routes instead of treating semantic complexity alone as an automatic delegation rule. Direct host
writing is appropriate when one complete Page is already in context, the host can preserve every required fact, and one guarded update plus
verified receipt finishes the outcome. Delegate when another Corvio model pass replaces larger source transfer/reconstruction, typed-carrier
knowledge, Work Model reconciliation, or risky host-side truncation. Do not split one coherent rewrite between both Agents.
A rewrite request does not become a Corvio delegation merely because the host must rephrase or reorganize prose; unresolved source scope,
carrier semantics, durable structure, or unsafe context transfer is the deciding boundary.
For a newly composed body, “complete in host context” does not by itself prove that a new Page is the right durable owner. Use direct
create only when the user-facing Page and its owner are already decided. If later continuation, independent reader/update duties,
Memory, Skill, topology, or semantic incorporation remain, send the body once as `inline_materials` before any durable write. A known
destination owner does not turn the Host body into prompt prose or remove that typed-source requirement. Never implement this as
`create_document` followed by an automatic low-cost cleanup run; that duplicates effects and races the first receipt.
For a Host-local Markdown file, prefer CLI `--inline-material-file`: it preserves the exact UTF-8 text, computes SHA-256 outside the
model-visible body, and the API rejects a mismatch before opening the Question. This closes file-carrier integrity, not arbitrary chat
message binding or source authorship.
For a direct create, pass the body as `markdown`, never `content_markdown`. A successful compact response includes the canonical body's
SHA-256, character length, and `readback_verified=true`; that is terminal evidence. Do not open a Question, read, update, or create again
merely because the receipt avoids echoing the full body.
If inline-material admission is rejected, blocked, or fails before acceptance, the owner remains unresolved. Follow typed recovery or
report the unresolved effect; do not fall back to a direct Page or synthetic Asset unless a later user instruction independently fixes it.
If the same future-use outcome includes original files, finalize them first and attach their exact Asset IDs to that one Question alongside
the inline body. Do not call `organize_files` as a separate semantic pass for the same mixed packet. Asset-only Work Model intake still
uses `organize_files`; inline text never replaces the original bytes.
When stable Workspace source and target handles already make a cross-source or typed task decision-ready, pass them directly to one
`ask_corvio` operation. Do not pre-read the target merely to restate its title, revision, or contents to Corvio; read first only when a
missing fact could change the execution owner, target, scope, or constraint.
A handle proves identity, not current contents. Treat an owner receipt as complete only when it also carries every current revision,
topology, content, and constraint fact needed by the decision. Use `search`, `fetch`, or `read_document` for missing owner evidence;
`answer_only` is a terminal semantic-answer route, not an owner reader or a preview before a later `allow_actions` Question. When one
search distinguishes the write target from a stale, archived, wrong-scope, or non-merge owner, preserve both exact handles in the single
effect handoff so the execution owner can verify both the positive and negative boundary.

## Progressive read loop

1. Resolve the canonical `workspace_uuid/page_uuid` handle from continuation context, `search`, or `list_documents`.
2. First classify the read purpose. For one read-only current fact or no-op check, use `mode=auto` even when the prompt names an expected
   value or uses a localized field label; do not open an `ask_corvio` Question or translate/synonymize the label into a guessed literal
   search. Small Pages return the complete body and large Pages return bounded navigation. Reserve explicit `overview` for outline discovery.
3. For an active exact replacement that supplies the current literal, a request asking where a supplied phrase appears, or a request asking
   which sections discuss that exact term, start with `mode=search` and do not read `auto`/`overview` first. It returns writable `L#` anchors,
   while a complete `auto`/`full` body is content evidence but not a line locator for `patch_document`. `match_count` plus
   `matches_truncated=false` is exhaustive for that literal, so do not fan out into speculative synonym searches unless broader semantic
   recall is actually requested. Otherwise call `read_document` with `mode=auto` (or CLI `corvio docs read <id> --mode auto`).
4. Follow one returned selector with `mode=section` or `mode=line_range`. Use `mode=search` for a literal in-document locator when the
   outline is insufficient.
5. Continue only while the result says the requested projection is incomplete. Request `mode=full` only when the whole body is actually
   needed for the user outcome.
6. Carry `content_revision`, `snapshot_id`, completeness, and any continuation field into the next decision. Never reuse `S#` or `L#`
   aliases after the revision changes.

MCP `fetch` and CLI `docs get` remain compatibility full-body readers. `corvio docs get <id> --output <path>` writes the body to the
selected local file and returns only metadata/hash on stdout, so the model does not receive a second copy. A successful full-body result is
complete; never repeat an identical fetch.

## Exact line patch

Use `patch_document` only when the host can state the final replacement text. Supply 1–20 non-overlapping ordinary-prose ranges from one
current revision, one stable operation ID, and a concise visible change summary. Never patch lines inside a serialized `corvio-table`
carrier; use its stable table/row/column IDs with `read_document_table` and `mutate_document_table`.

MCP shape:

```json
{
  "id": "<workspace_uuid>/<page_uuid>",
  "expected_content_revision": 12,
  "operation_id": "rename-owner-2026-09-16",
  "change_summary": "Corrected the owner in the rollout section.",
  "replacements": [
    {
      "line_ref": "L40-L42",
      "replacement_markdown": "Owner: Platform"
    }
  ]
}
```

CLI shape (`patch.json` contains `expected_content_revision` and `replacements`):

```bash
corvio docs patch <workspace_id/document_id> \
  --input patch.json \
  --operation-id rename-owner-2026-09-16 \
  --change-summary "Corrected the owner in the rollout section." \
  --yes --json --no-input
```

The server applies every range against the same immutable snapshot, rejects overlap or a stale revision, preserves untouched lines,
verifies canonical readback, and returns revision/hash plus a small changed context. A replay of the same operation is read-only. If a
multi-range edit changes distant locations, `changed_line_ranges` and the returned context keep those windows separate instead of
replaying the intervening body. When `readback_verified=true`, that compact receipt is completion evidence; do not issue a redundant full
read only to confirm it. If a
receipt says the Page changed but its collaboration comment was not verified, do not repeat the patch; read the Page/comments and add
the missing comment once if needed.

For Page-table writes, copy `read_document_table.table_id` and `content_revision` to `table_id` and `expected_content_revision`, send a
stable `operation_id` plus a concise required `change_summary`, and put cell changes under `cell_updates`, for example
`[{"row_id":"row-id","column_id":"column-id","content_markdown":"new value"}]` (not `changes` or `value`). For appends, use
`append_rows: [{"cells": {"column_id": "value"}}]`; the nested `cells` value is an object keyed by stable column ID, not the array shape
returned by a table read. `readback_verified` is result evidence, not a request field. A successful `readback_verified=true` mutation receipt is
sufficient; do not reread the table solely to confirm it.

Do not use line patching to emulate semantic editing. Delegate when the host still needs to decide what the document should say, how
sections should be reorganized, how formatting should be interpreted, or how multiple sources should be reconciled.

## Public API equivalents

- `GET /v1/documents/{id}/content?mode=auto|overview|line_range|section|search|full`
- `PATCH /v1/documents/{id}/content`
- `POST /v1/documents?response_mode=compact`
- `PUT /v1/documents/{id}?response_mode=compact`

The live MCP schemas, CLI `--help`, and public OpenAPI are field-level authority. Project roots remain structure containers: direct body
updates and line patches target non-Project Pages. Typed Spreadsheet, Presentation, Code, and HTML carriers remain semantic Agent work.
