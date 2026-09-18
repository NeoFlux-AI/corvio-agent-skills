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

Treat conversational continuity and Project identity as separate evidence. Phrases such as “also add these,” “continue,” or “look at
these together” authorize the current processing or retention effect, but do not by themselves prove that a newly selected source belongs
to the Project from the previous receipt. When the source presents a different stable business subject and no explicit alias, lineage, or
current-user correction links it, do not pin the old Project merely because its handle is available. Pass the new sources, the prior
handle, and the known or unresolved relationship boundary to Corvio so its semantic lanes can decide whether to preserve siblings, relate
them, or later consolidate them. Conversely, when the source continues the same subject without contrary identity evidence, reuse the
receipt-backed continuation instead of manufacturing a Project for each artifact.

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
outputs, affected owners, and any topology change that actually occurred. A successful upload, queued mission, or newly created Page is
not proof that the prior tree was searched, duplicates were reconciled, or the right leaves were updated. Tell the user what durable
entry now owns the work and return the canonical link; when the result reports unresolved overlap or missing authority, preserve that
boundary instead of announcing a merge.
