# Corvio document reads and edits

## Publish decided source files and maintain keyed regions

When source, carrier, page boundaries and target are already decided, use the shared source-publication contract rather than repeating
per-page uploads or semantic Questions. Read `get_publication_contract` (CLI `files publication-contract`) for the exact manifest schema.
Create a ZIP with `corvio-publication.json` and its relative files. The advertised transport capacities are bounded; larger corpora can
use multiple caller-selected bundles sharing stable namespace/page/region keys. Cross-bundle links use already verified canonical URLs or
explicit existing Page declarations; capacity is not permission to omit required records. Keep sources in the Host byte plane; MCP arguments contain the
finalized Asset ID and operation key. Local CLI can package and transfer the actual files directly:

```bash
corvio files publish --manifest ./corvio-publication.json --operation-key sync-2026-10-23 --wait-until-terminal --timeout-seconds 600 --json --no-input
corvio files publication <workspace_id/operation_id> --detail full --json --no-input
corvio files bundle --manifest ./corvio-publication.json --output ./publication.zip --json --no-input
```

For MCP-only work, the Host packages files with its native filesystem tools, prepares that ZIP with `visibility=private`, PUTs its exact
bytes using the returned short-lived headers, finalizes with the same private choice, then calls `publish_source_bundle`. Remote MCP
does not open Host-local paths. The original is private. New Pages/images default to private; `new_resource_visibility=workspace` is an explicit caller choice and does not change existing ACLs. Embedded use never grants access to other Page readers; sharing is separate.

The manifest uses stable `namespace`, Page `key` and per-Page region `key` identities. Each region names one UTF-8 Markdown `file`;
an ordinary whole source body can be one region. For incremental notes/highlights, give each external record its own region key.
Images name a local `file` or explicit public HTTPS `url`; URL adoption validates redirects/byte capacity and optional expected hash,
then retains immutable bytes. No site-specific admission list. Reference other manifest entries with `corvio://page/<key>` and
`corvio://image/<key>` in Markdown regions, including forward and reciprocal links. Static HTML uses relative bundle files or HTTPS links. Parents use `parent_key` or current `parent_node_id`.

`include_child_index=true` requests the existing live directory block, which follows current tree order and reader ACL; it never
duplicates a table of children or resurrects an index the user removed. `kind=static_html` plus `html_file` and optional `html_files`
publishes a script-free HTML Artifact through the existing immutable builder/sandbox; it creates no Question or model-credit charge.
Scripts, event handlers, executable URLs and unsupported network dependencies are rejected. Presentation and executable HTML editing
retain their own capabilities.

Source bindings preserve stable Block IDs and canonical baselines. Exact unchanged content keeps its identity through insertion and unambiguous reorder. Mixed insertion/edit gaps or duplicate identities can conflict; separate stable source regions provide record identity, and a current-hash CAS alone cannot resolve ambiguous correspondence. Reordering around independent human blocks requires separate review. Unchanged source is no-op; omitted regions remain. Incoming changes
to human-edited/deleted source blocks or a shrinking region conflict and preserve the current content/comments. Do not replace the
whole Page to bypass such a conflict. Independent human blocks remain untouched. For an explicitly reconciled region, include the returned exact `expected_block_hashes` in a new bundle/operation; a stale or incomplete set conflicts again. Static HTML merging uses `expected_source_sha256` with the same current-source CAS boundary. Embedded uses remain attached to their Page history;
archiving/deleting a Page does not authorize deleting an original or a shared Asset.

The operation is checkpointed across storage and Docs transactions. `in_progress`/`partial` and reserved Pages are intermediate facts.
Resume using the returned source Asset and same operation key; reuse with different bytes conflicts. Compact results preserve confirmed aggregate counts, caller-declared entry Pages in source order,
failures and canonical handles. A completed closed publication plus its source hash and entry address proves that decided batch at the
recorded revisions; loading every identifier is only needed for inventory or a specific diagnosis. Select exact `page_keys`/`image_keys`
(CLI `--page-keys`/`--image-keys`) for those evidence gaps; `get_publication_operation(detail=full)` retrieves the full ledger. Only completed item/readback facts
prove delivery at the reported revision; a later human edit does not invalidate that historical receipt or get certified as its old body.
The foreground CLI can wait/resume within its explicit deadline; timeout retains the operation rather than claiming completion. Capability/schema checks and closed-effect readback do not open a semantic-learning review; new interpretation or
user-model/method evidence still follows the ordinary learning loop. Open owner, topology or synthesis decisions use one semantic
operation and its existing terminal receipt.

Use this reference when the task already targets a Corvio Page. It exposes a coding-Agent-shaped interface—overview first, then exact
sections or lines—without requiring the host to learn Corvio's internal Writer schema, block model, or conversion contracts.

## Images already retained as Assets

For an authorized image insertion, copy `document_image.markdown` from `finalize_file_upload` or `get_file` onto its own line in the
Page body. This references retained bytes; it is not another upload or organization operation. Use the shared
`get_document_authoring_contract` for the optional structured `corvio` image carrier and supported fields.

`links.content` is the API download endpoint, not a browser image URL: API OAuth authorization and the webpage reader's identity are
different transports. The document image reference carries a durable Workspace content locator that the webpage reads through its
authenticated media path. Each reader still needs current access to the Asset; inserting a cross-Workspace reference neither copies
the bytes nor grants access. A successful Page write is not proof of pixel visibility; use the appropriate browser/read evidence when
the requested outcome includes visual verification. Do not replace the stable reference with a signed or public blob URL.

## Audio already retained as Assets

For authorized audio insertion, copy `document_audio.markdown` from `finalize_file_upload` or `get_file`. The shared authoring contract
describes its structured `corvio` carrier. Asset identity survives Page readback, editing and clipboard; the browser fetches retained bytes
under the reader's current identity, not a public or expiring URL. Playback still depends on the browser supporting the uploaded codec.

Playback does not imply transcription. Existing page-owned audio uses its authenticated Page source path; an MCP audio reference alone
does not authorize or create a transcription job. Source access and AI-read policy are checked again when an authorized retained-audio
transcription request executes. A Page write or `ready` receipt is not proof of decoded audio or a completed transcript.

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

## Schema-checked document call examples

The UUIDs, revisions and line anchors below are illustrative. Copy actual returned identities, anchors and revisions for the current operation. These examples calibrate legal shapes; they do not prescribe a fixed tool sequence. Existing source/learning/permission gates above still apply.

Known section: read only the requested section; an unknown section can start with auto/overview.

```json
{"name":"read_document","arguments":{"id":"11111111-1111-4111-8111-111111111111/22222222-2222-4222-8222-222222222222","mode":"section","heading":"Delivery","max_chars":3000}}
```

New decided Page: create directly; choose only the user-authorized location.

```json
{"name":"create_document","arguments":{"title":"Delivery note","markdown":"Ready for review.","idempotency_key":"delivery-create-1"}}
```

A supplied Project/Page node selects a creation destination through `parent_node_id`; it is not a readable Page ID. If the body and location are already decided, create there directly. Corvio validates the parent and permissions; reading the parent body cannot improve this fixed write.

```json
{"name":"create_document","arguments":{"workspace_id":"11111111-1111-4111-8111-111111111111","parent_node_id":"44444444-4444-4444-8444-444444444444","title":"Delivery child","markdown":"Ready for review.","idempotency_key":"delivery-child-1"}}
```

An exact typed Page handle goes into `handle`, with its complete workspace/page identity. Reads do not take `workspace_id`, `node_id`, `content_revision` or `snapshot_id`. If the user supplied a Page UUID and its Workspace separately, those known facts form the canonical `id`; a node UUID cannot be substituted for a Page UUID.

```json
{"name":"read_document","arguments":{"handle":"page:11111111-1111-4111-8111-111111111111/22222222-2222-4222-8222-222222222222","mode":"auto"}}
```

Known read window: start_line/end_line belong to read_document(mode=line_range). Copy the returned revision and writable L# anchors.

```json
{"name":"read_document","arguments":{"id":"11111111-1111-4111-8111-111111111111/22222222-2222-4222-8222-222222222222","mode":"line_range","start_line":40,"end_line":42}}
```

Exact edit: replacements uses line_ref, not start_line/end_line or an invented section argument.

```json
{"name":"patch_document","arguments":{"id":"11111111-1111-4111-8111-111111111111/22222222-2222-4222-8222-222222222222","expected_content_revision":7,"operation_id":"delivery-edit-1","change_summary":"Update the agreed delivery date.","replacements":[{"line_ref":"L40-L42","replacement_markdown":"Delivery: 24 October."}]}}
```

Revision conflict: no body effect was applied. Reread the current affected location, retaining new concurrent facts.

```json
{"name":"read_document","arguments":{"id":"11111111-1111-4111-8111-111111111111/22222222-2222-4222-8222-222222222222","mode":"search","query":"Delivery:","context_lines":2}}
```

Only if that fresh result now reports revision 8 and L41, generate a new guarded operation. Never reuse a stale revision or guess this example anchor.

```json
{"name":"patch_document","arguments":{"id":"11111111-1111-4111-8111-111111111111/22222222-2222-4222-8222-222222222222","expected_content_revision":8,"operation_id":"delivery-edit-2","change_summary":"Reapply the date against the current owner revision.","replacements":[{"line_ref":"L41","replacement_markdown":"Delivery: 24 October."}]}}
```

document_updated_comment_failed: the document receipt proves the body changed. Repair only the missing comment; do not repeat update/append/patch.

```json
{"name":"comment_document","arguments":{"id":"11111111-1111-4111-8111-111111111111/22222222-2222-4222-8222-222222222222","body":"Update the agreed delivery date."}}
```

Read the repaired comments to verify the missing collaboration effect.

```json
{"name":"list_document_comments","arguments":{"id":"11111111-1111-4111-8111-111111111111/22222222-2222-4222-8222-222222222222"}}
```

Delegate when cross-source/typed/structural judgment remains. ask_corvio may require Host Approval; a Host denial occurs before MCP execution and must not trigger duplicate writes.

```json
{"name":"ask_corvio","arguments":{"workspace_id":"11111111-1111-4111-8111-111111111111","prompt":"Reconcile the delivery plan, risks and responsibilities. Context: 11111111-1111-4111-8111-111111111111/22222222-2222-4222-8222-222222222222","mode":"allow_actions"}}
```

Copy the actual ask operation_id; queued/running is progress. Poll the same producer to terminal, respect retry_after_seconds, consume real artifacts/readback, and use returned progress_cursor as after_cursor when available.

```json
{"name":"get_question","arguments":{"operation_id":"33333333-3333-4333-8333-333333333333","wait_seconds":30}}
```

For update_document/append_document, response_mode=compact preserves committed body identity, revision/hash and verified comment facts without echoing the full comment. The default remains full. Check only the content evidence required by the user; a missing/partial readback is never completion. A timeout or approval denial does not authorize another semantic job.
