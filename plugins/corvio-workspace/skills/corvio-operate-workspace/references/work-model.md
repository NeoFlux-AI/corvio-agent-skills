# Work Model reconciliation

Read this module before `organize_files` or any Corvio operation that may split, merge, move, reparent, or reconcile Workspace work. It
contains the structural decision spine; it does not authorize a write. Return to `SKILL.md` for consent, safety, tool choice, polling, and
final reporting.

## Start from the enduring work, not the incoming event

Before a new organization mission, search for the enduring subject and inspect the narrowest plausible current Project(s), not only a
same-title Page. A meeting, slogan change, postmortem, code task, or uploaded file is an event or source, not automatically a new durable
owner. If the new evidence may extend, split, move, or consolidate existing work, keep the handoff natural: state that Corvio should
reconcile it with the current Work Model and include only proven Project handles or relationship facts. Do not prescribe the resulting
titles or hierarchy. If later evidence or an unambiguous current user correction establishes that one root Project belongs inside another,
ask Corvio to reconcile the relationship. Because Projects cannot nest, Corvio may preserve the canonical root, create or reuse a
non-Project branch, move descendants, and retire an empty duplicate shell. The Host should not simulate this by creating a fresh summary
or by issuing a blind series of CLI moves.

A current-turn report, plan, analysis, meeting note, or other Markdown body composed by the Host is likewise an input event, not proof of
one new root Page. When the user authorized future use and any lasting owner, reader/update lifecycle, topology, Memory, or Skill decision
or semantic incorporation remains, pass the complete body as typed `inline_materials` to one `ask_corvio(mode=allow_actions)` operation.
A known destination owner does not turn the Host body into prompt prose: the handle is routing evidence and the typed body remains source
evidence while Corvio reads the live Work Model and plans the durable effect. Do not first create the Page
and ask another run to repair it. If the body is already one decision-ready standalone Page, use direct create and stop; a later cleanup
run would add cost and race a settled effect. Original local files still require Asset retention because inline text does not preserve
their exact bytes or provenance. For an Asset-only Work Model intake, use one `organize_files` mission. When one coherent authorized
outcome combines finalized original Assets with Host-generated Markdown, pass both the exact `asset_ids` and typed `inline_materials` to
one `ask_corvio(mode=allow_actions)` operation so Corvio reads and reconciles both source kinds once. Do not precede or follow that mixed
Question with `organize_files` for the same packet.

Classify a mixed packet item by item before choosing that operation. A current Workspace owner exported only to compare or update it is
existing-owner evidence, not a newly selected source to re-upload. A genuinely new local source may require Asset provenance, while an
ordinary Host-local result remains local unless its own carrier is authorized. A search miss proves only that discovery found no current
owner; it does not authorize retaining any of those bytes or results. `asset_ids` and `inline_materials` admit sources to the semantic
effect, so never use them merely to give a learning review more context.

Treat conversational continuity and Project identity as separate evidence. Phrases such as “also add these,” “continue,” or “look at
these together” authorize the current processing or retention effect, but do not by themselves prove that a newly selected source belongs
to the Project from the previous receipt. When the source presents a different stable business subject and no explicit alias, lineage, or
current-user correction links it, do not pin the old Project merely because its handle is available. Pass the new sources, the prior
handle, and the known or unresolved relationship boundary to Corvio so its semantic lanes can decide whether to preserve siblings, relate
them, or later consolidate them. Conversely, when the source continues the same subject without contrary identity evidence, reuse the
receipt-backed continuation instead of manufacturing a Project for each artifact.

When one bounded discovery returns multiple plausible current owners and no exact receipt or current user statement selects one, this is
a user-authority gap rather than a harder semantic classification problem. Stop before `ask_corvio(mode=allow_actions)`,
`organize_files`, or any direct write and ask the user to choose among the concrete candidates. Do not repeat the search with synonyms or
delegate the choice to a write-capable Question; neither creates authority for the destination.

Owner discovery and semantic execution are different phases, not two Questions. Use `search`, `fetch`, or `read_document` to establish
the current owner and the decision-grade facts needed for the effect. Do not open an `answer_only` Question to look up or preview that
owner before a second `allow_actions` Question; `answer_only` is terminal only when the user's outcome is itself a read-only semantic
answer. `search.content_complete=true` closes the discovery result set; it does not make a returned title or snippet the owner's complete
current body. Fetch before an effect that updates that same content-bearing Page, Memory, or Skill when its wording can change
preservation, removal, ordering, or merge. This does not relax exact continuation: fetch a carried Project when its receipt lacks the
current body or topology needed for handoff. Do not fetch a Project newly selected by complete search merely to route new current-turn
material or reconfirm an archive/non-merge boundary already established there. A bare stable handle proves binding but not
current contents. When discovery identifies both the selected target and a stale,
archived, wrong-scope, or non-merge owner that constrains the update, carry both exact handles and their roles into the one semantic
effect so negative scope remains verifiable.

## Infer Project and leaf boundaries from operating lifecycles

Distinguish a source's subject from the user's work subject. Merely selecting a heterogeneous packet together, asking to review it
together, or continuing the same host action is a correctable shared-scope prior: pass that context without pre-splitting external papers,
methods, inspiration, examples, or industry references, while allowing source evidence of separately operated user subjects to change the
final scope. A shared company, product, domain, portfolio, corpus, history, audience, navigation label, strategy, or broad objective is
also only context. Do not force independently operated scopes into one Project unless exact evidence establishes one concrete operational
closure—the same durable project state and the decision/acceptance loop that plans and closes the worklines together. If one scope can be
replanned, accepted, completed, paused, or archived while another continues without changing its project-level state, pass that
independence to Corvio even when both serve the same product. Calling inputs one record, history, export, packet, archive, batch, upload,
conversation, or set of files only describes the source container; do not turn that wording into same-work authority.

A current user statement that the underlying initiatives are the same work, different facets of one operated workline, or in a stated
containment relationship is stronger relationship authority. Preserve that semantic relationship in the natural `organize_files` goal
and do not weaken it with a generic “unless the topics differ” caveat. Corvio still designs the tree, and different source topics,
readers, update rhythms, or acceptance paths may require independently maintained branches, but they do not reopen the common ancestor.
Separate root Projects despite that statement only when the user explicitly requires separate roots or a hard owner, ACL, disclosure,
or incompatible-governance boundary prevents co-location; pass a real unresolved conflict explicitly instead of silently overriding the
relationship.

Do not turn a complex source into one catch-all working document in the handoff. Keep the instruction weak and leave titles and hierarchy
to Corvio, but preserve evidence that later reader questions, update events, action/authority paths, or acceptance checks differ. A frozen
source carrier owns provenance only; it does not replace independently continued timeline, evidence, decision, status/action, hypothesis,
method, or verification owners.

Before handing selected material to Corvio, preserve the fact that one source may change several different parts of the Work Model. Do
not reduce a meeting, long conversation, report, workbook, or mixed packet to one topic label or one requested deliverable. Keep the
handoff weak, but state any evidenced action-changing impacts and any genuine uncertainty: each impact should reach its existing/new
owner or remain explicitly unresolved, while an impact-free source may stay provenance/context only. The Host must not invent the
destination tree; Corvio owns that planning and must not silently omit an impact merely because its Project identity is unclear.

Preserve impact boundaries before grouping by theme. If two source-grounded changes can be maintained, accepted, paused, completed, or
archived independently, keep them as separate candidate impacts even when they share a broad topic, reader, vocabulary, or nearby
existing Project. An explicitly named program, initiative, customer, incident, product surface, or other stable work subject remains a
separate owner hypothesis until current Workspace evidence proves the same canonical owner and one coupled reader/update/action/
acceptance lifecycle. A nearest adjacent Project is a search lead, not merge authority; when no existing owner matches, a new sibling
Project or an explicit unresolved owner may be the correct result. The Host preserves these distinctions without prescribing titles or
tree shape, and Corvio must test them against the live Work Model before co-location.

A Project root is the durable work identity and a compact project-wide navigation/current-state/control surface, not the default body
for all of those owners. One genuinely shared project-level control question may stay on the root. If the material will later reopen
history, decisions, responsibilities/actions, evidence, methods, risks, or verification independently, ask Corvio for the natural work
outcome and let it create or reuse non-Project branches/leaves in the first plan; do not treat sections in a long Project body as
equivalent. This is a semantic boundary, not a minimum-child or depth rule.

When handing Corvio an existing Project handle, describe it as the durable work scope or continuation hint, not as the presumed content
destination. Corvio must still read its bounded current topology and choose the actual existing/new non-Project carriers for independently
maintained worklines. Keep this instruction weak: preserve the scope-versus-carrier boundary and user authority, but do not prescribe
titles, counts, or a host-invented hierarchy.

The retained source carrier is provenance, not a spare Project container. When one heterogeneous source informs several independently
governed Projects, keep that source as one document-level standalone reference and let Corvio write or update the semantic units in the
separate owners. Do not ask Corvio to promote the source Page itself into an umbrella Project merely because it must remain at Docs root.
When the source itself proves one enduring Project, Corvio may create that separate Project and place the retained carrier beneath it.

## Apply corrections across the affected neighborhood

When selected evidence is presented as the latest or corrected fact set and the user asks to check, align, reconcile, or continue the
related Workspace surfaces, that request authorizes the bounded evidence-backed update. Preserve the exact source, reconcile the
canonical owner and only proven dependents, and return which surfaces changed or remained current. Do not reinterpret an informal verb
as inspect-only or ask for the same edit authority again. Stay read-only when the user explicitly asked for inspection, a proposal, or
approval before changes, or when source authority, subject identity, or affected scope remains genuinely unresolved.

Do not infer durable organization from language that only describes the condition of a source or a Host transformation. “These files are
messy,” “normalize the formatting,” “rewrite,” and “compare” remain Host-native result requests unless the object of the user's action is
future use, Workspace organization, or a durable owner update. A learning-only closeout for such work carries natural candidate signals
without the source/result body and cannot create an ordinary Page or Project.

For externally consequential material, a user-requested risk, authority, or messaging review that precedes drafting is a real stage gate.
When the review exposes an unresolved approval or responsibility that changes permitted claims or commitments, stop at the assessment
and return the owner decision needed next. Do not use placeholders to draft or persist a near-final artifact before that authority exists.

An unambiguous correction need not be restated in chat when the user selected a governing source and asked the Host to process it. If
that source names the existing subject, approved authority, exact replacement, and facts that must remain unchanged, those source facts
plus the user's current processing instruction authorize the bounded correction and provenance retention. Read the current owner and use
one organization operation; do not ask whether to apply or save the same correction again. This boundary does not resolve an uncertain
source authority, ambiguous subject, mutually exclusive current authorities, or an unstated propagation scope; ask only for that real
choice. The Host's decision to be cautious is execution strategy, not user/source evidence and never a Team Memory candidate.

When the user explicitly corrects an identity, hierarchy, same-item, or cross-Project relationship, pass that correction, the known
canonical handles, and any still-unresolved locator as facts in the natural goal. Do not require the Host to rediscover an exact old title
or preselect Corvio's leaf. The correction is authority for the stated relationship, not for unrelated technical status; Corvio must read
the affected owners, preserve that boundary, and materialize a missing projection when no lexical match already exists.

When the correction changes the governing owner or enduring subject of a branch already inside another Project, include that old Project
handle in the bounded handoff and let Corvio reassess its remaining branches. Moving only the child named in the user's sentence is not a
complete reconciliation. Branches that are existing projections of the same corrected workline should move under the canonical Project
and leave the emptied shell retired; a sibling Project remains only with direct independent state, ownership, cadence, acceptance, or an
explicit user boundary. The user not repeating the old root's name is not evidence that it should stay independent. If the bounded reads
still support materially different mutations, return the named conflict or ask rather than reporting two locally correct roots as done.

A read-only `search` or `fetch` that shows the named child already under the requested owner settles only that edge; it does not settle the
correction while the old Project still exists with unclassified branches. In that state, pass the user's natural correction plus the old
and requested-owner handles to one Corvio semantic organization operation: use `ask_corvio` to reconcile existing Workspace work, or the
source organization path when newly selected files are part of the same authorized effect. A canonical no-op is valid only when the
terminal Corvio result and current Tree prove the old Project retired, or direct independent-lifecycle evidence justifies keeping it.

## Completion

An organization operation is complete only after its terminal result and current readback identify the canonical Project, reader
outputs, affected owners, and any topology change that actually occurred. The terminal operation's embedded owner/topology readback is
that evidence when it returns those fields; do not fetch the resulting Page merely because the work has detailed facts or several owners.
Read an exact content owner afterward only when the user's acceptance requires body wording or a named-fact exclusion that the receipt
does not return. A successful upload, queued mission, or newly created Page is not proof that the prior tree was searched, duplicates
were reconciled, or the right leaves were updated. Tell the user what durable entry now owns the work and return the canonical link; when
the result reports unresolved overlap or missing authority, preserve that boundary instead of announcing a merge. When the terminal
receipt verifies owner and topology, do not reopen that decision or ask the user to recheck it merely because Corvio selected a title
different from the user's descriptive phrase.

The same completion check covers durable learning without turning the Host into the Memory/Skill router. For each coherent source,
document, or decision module, pass the natural preference, identity/context, active-goal, Workspace-operation, collaboration, or reusable-
procedure evidence and its stable handles to Corvio while that evidence is fresh. Corvio decides canonical personal/Team Memory leaves
and Project Skill ownership. Co-close independent effects in one operation when possible. Only a host-owned/direct edit with no existing
semantic operation may use its terminal document receipt as bounded successor context; an `organize_files` mission or write-capable Question
already owns its packet and exposes the learning receipt itself. Consume `execution.durable_learning`, and leave residual lanes only as the
late/missed-candidate safety net.

Closing the result or Skill lane does not automatically close the other learning lanes. “This output/event will not be reused” can make
the ordinary artifact transient and may show that no reusable procedure qualifies, but it is not a no-learning instruction: still review
any substantive Personal Memory or Workspace-goal/Team Memory evidence. Conversely, an explicitly local/no-record boundary applies to
the material and its derived facts and blocks that remote review. When the packet's sole semantic owner is already terminal, consume its
learning receipt; if an older server omitted the field, report the freshness gap rather than opening a second semantic operation.

Do not collapse this checkpoint into the current-result or provenance decision. A local/chat deliverable can still yield Memory or Skill;
a retained source can remain only provenance with no ordinary derivative Page; and a reusable method may require only its Skill plus the
minimum real Project owner. Descriptions of audience, tone, polish, or shareability do not authorize a Workspace artifact. If a durable
owner mutation depends on selected local evidence, retain the exact bytes; a learning-only pass may receive only natural candidate facts
and safe handles, never the source or ordinary output as a disguised artifact. `unresolved` leaves the candidate open, while `no_write`
requires an evidence-based terminal disposition.

Canonical reuse of a selected local source is likewise a provenance judgment, not a topical one. A title, lexical match, similar Page, or
matching rendered content does not prove that exact source is retained. Reuse it without upload only when a current Asset receipt from
`list_files(content_sha256=...)` or `get_file` reports the same `content_sha256` as the locally computed hash; otherwise preserve and
reconcile the selected bytes through the normal source path.
