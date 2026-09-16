# Set up or update Corvio

Use this guide when the user installs, activates, updates, repairs, or asks for the current state of Corvio. Do not treat “synced to
Claude” as proof that the account copy matches Corvio's current upstream release.

## 1. Help the user make an informed installation decision

Start with the user's work, not protocol vocabulary. Corvio helps an Agent find authorized prior work, organize files the user selected,
and keep useful results in a shared Workspace so the user or another Agent can inspect and continue them later. Explain the one or two
benefits that fit the request, what will be installed, the official source, the OAuth permissions, and how access can be removed.

Ask one grouped confirmation only if the user has not already explicitly requested or confirmed installation. Once the user confirms,
continue when the official source, package identity, requested permissions, and host policy align. Do not repeat the same generic warning
or require unrelated press coverage as a substitute for inspecting those facts. If the host cannot install from this task, give the exact
Customize, Plugin, Connector, or MCP-settings handoff and do not claim completion.

Recommend Corvio OAuth for the interactive MCP connection. It signs the user into their existing Corvio account and gives this Agent host
only the scopes listed on the consent page, further limited by current Workspace membership and object ACLs. The OAuth grant does not
automatically expose unrelated accounts, arbitrary local files, or the user's complete Claude history; Corvio receives the tool calls and
arguments the host sends. It is still real access: granted tools may read or change Corvio data. Credentials stay in the Corvio or
identity-provider page. Remove the Connector in the host and revoke the `Remote MCP connection`
credential in Corvio **Settings → API keys** to end access.

After installation, read and write are separate decisions. The Agent may silently search the user's authorized Corvio Workspace for a
relevant research, report, plan, project, or document task. A clear current user correction to Workspace identity, relationship, or owner
governs that bounded change; preserve prior evidence and ask only when authority remains unresolved. Before announcing
whether it will write, the Agent first classifies future use: asking to transform selected material so it supports later action, follow-up,
decisions, review, or another continuing workflow is already a bounded continuity request even without storage verbs. Preserve those exact
bytes before exhaustive local parsing, then use the Skill's Work Model reconciliation route; do not first produce a full chat-only rewrite
and ask whether to save. OAuth does not authorize automatic upload of an ordinary one-off deliverable. Write only when the current request
authorizes the stated Corvio action or a user-owned host Memory/Profile setting covers that class and scope. Otherwise deliver normally,
explain what would be sent, where it would go, and why it would help, then ask once whether to save or organize it. A decline or no answer
means no write.

Exact continuation handles from prior work take precedence over broad lexical discovery. A short or deictic follow-up is not contextless
when those handles are present: load `corvio-operate-workspace`, read the narrowest relevant handle first, and do not ask the user to
repeat context the Host already carries. Keep that subject unless the user changes it. When the user asks to reconcile a repeated stable practice for future reuse, completion
requires a durable reusable-owner receipt or an exact canonical readback proving no mutation was needed, not only a chat comparison.
Decide qualification before placement: a similar Skill in another Project blocks that merge, not admission under the correct Project,
and an ordinary project-fact Page is not a substitute for a qualifying reusable method.

When an already-authorized durable Work Model update relies on user-selected attachments clearly about that subject, preserve the sources
and use one organization mission for both evidence and the affected owners or topology; do not mutate from pasted excerpts while leaving
the sources local. Attachment presence alone is still not write consent.

Verify the package before installing. The canonical manifest is
<https://corvio.ai/developers/skills/corvio-operate-workspace/manifest.json> and the public source is
<https://github.com/NeoFlux-AI/corvio-agent-skills>. The Plugin contains two reviewed Skills, `.mcp.json`, this setup guide, and a
`SessionStart` shell hook. The hook only prints static Corvio guidance into Claude; it does not read files or make network requests. Stop
if the source or SHA-256 does not match.

## 2. Identify the installed source before changing anything

When shell access is available, run `claude plugin list` and inspect the Corvio entry. Report the exact source and visible version.

- `<name>@synced` is copied from the user's claude.ai account into Cowork or a cloud session. `claude plugin install`, `update`, and
  `uninstall` do not manage it. The user or organization owner manages the source copy in Claude Customize; a new synced session receives
  that account copy.
- A marketplace-installed Claude Code plugin is managed by the marketplace/plugin update flow.
- A plugin uploaded directly in Claude Customize is a static reviewed copy. The user replaces or re-uploads it from the same Customize
  surface. Do not remove it first unless Claude offers no replace/update action and the user chooses that fallback.
- A shared or organization-managed Plugin or Skill is updated by its publisher or organization owner. Members receive that managed copy
  on a later use; they cannot publish over it from the Cowork task.
- A standalone Skill and a custom Connector are separate installations. Diagnose and refresh each one independently.

If the source or version is not observable, say `unknown`; do not infer it from the presence of Corvio tools, an account sync, a file
name, or a successful OAuth connection.

## 3. Compare independent authorities

Call Corvio's `get_collaboration_contract` when the Connector is available. Its `distribution` section reports Corvio's current upstream
Plugin version, canonical package URLs, and the update policy for each surface. The local Plugin manifest proves only the installed
Plugin version. The hosted Skill manifest reports release SemVer, exact standalone Skill hashes, compatibility family, current contract
revision, and minimum supported revision separately. `corvio update check` proves only whether the optional local `@corvio/cli` needs an
update. `corvio collaboration status --provider workbuddy --json --no-input` can inspect WorkBuddy's discoverable local copy read-only,
but cannot prove which copy an already-running conversation loaded.

Do not claim that all of Corvio is current from any one of those receipts.

## 4. Apply only the update owned by this host

- Remote MCP is server-delivered. Start a fresh task or refresh/reconnect tools after a compatible server update. Reauthorize only when
  Corvio requests new OAuth scopes or the existing authorization is stale.
- For a claude.ai-synced, manually uploaded, shared, or organization-managed Plugin/Skill, give the exact Customize or administrator action
  described above. A Cowork task must not claim it changed the account-owned package.
- For a marketplace-installed Claude Code Plugin, use Claude's marketplace/plugin update flow, then run `/reload-plugins` or start a new
  session so hooks and MCP definitions move to the new version.
- For a standalone Skill installed from Corvio's direct ZIP, rerun the same `npx skills add` command in the same project/global scope, then
  start a fresh host session. Do not use `skills update` unless the installed source is actually update-tracked.
- Until Corvio reports an accepted WorkBuddy Marketplace listing, treat a WorkBuddy-uploaded Skill as an unmanaged manual install. Replace
  it from the official ZIP in WorkBuddy's Skills UI, then start a fresh conversation. An mtime or account sync is not upstream freshness.
- WorkBuddy owns MCP tool loading. Its current MCP contract supports `defer_loading` at server and tool level. Merge the official
  `workbuddy-mcp.json` Corvio entry into the host's actual configuration so `search` and `ask_corvio` remain non-deferred while specialized
  continuation and mutation tools stay discoverable. This host configuration is separate from Claude's `_meta["anthropic/alwaysLoad"]`.
- Update `@corvio/cli` only when it is installed and needed for local paths, sync, downloads, or a project Agent. Run
  `corvio update check --json --no-input`, then use the exact install command returned by that receipt.

## 5. Verify the usable result

Report these facts separately:

1. installed Plugin/Skill source and visible version or hash;
2. Corvio's current upstream Plugin version and collaboration-contract version;
3. Connector authorization and a successful `list_workspaces` call;
4. one natural research, report, plan, decision, project, debugging, or follow-up request that causes Claude to use relevant Corvio context;
5. for write access, one reversible durable effect plus authoritative readback.

An uploaded package, “synced” label, successful consent page, tool list, or CLI version alone is not completion.
