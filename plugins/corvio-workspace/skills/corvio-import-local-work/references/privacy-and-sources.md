# Local import privacy and source reference

## Reviewed source roots

| Source | macOS/Linux | Windows | Notes |
|---|---|---|---|
| Codex | `~/.codex/sessions` | `%USERPROFILE%\.codex\sessions` | Allowlisted rollout JSONL shapes only. |
| Claude Code | `~/.claude/projects` | `%USERPROFILE%\.claude\projects` | Allowlisted project JSONL shapes only. |
| Cursor Beta | platform Cursor `User` directory | `%APPDATA%\Cursor\User` | Native CLI only; uses a Run-scoped SQLite Online Backup and fails closed on unknown schemas. |

The importer does not traverse the full Home directory. A user-selected custom root is source-specific and stays local; Corvio receives an opaque source identifier rather than an absolute path.

## Stage boundaries

| Stage | May read locally | May upload |
|---|---|---|
| detect | directory entries and file metadata | source kind, counts, availability, errors |
| sample | bounded recent local text | statistics only; no bodies |
| parse/redact | selected full bodies in the foreground process | locally redacted complete user-to-assistant turns after confirmation |
| finalize | no new source scope | manifest/chunk receipts and final report state |

Never upload raw JSONL or SQLite databases, absolute paths, system/developer prompts, hidden reasoning, tool calls/results, media, cookies, private keys, database URLs, or cloud credentials. High-risk credentials block the complete turn.

## Current distribution boundary

- Development may use the repository source build.
- Signed internal candidates use the isolated Staging channel and explicit Staging API/App bases.
- A draft release or Staging installer is not a Production publication.
- Production `cli.corvio.ai` and production capability flags remain unavailable until release, legal, signing/notarization, and real-device acceptance gates complete.

When the distribution state is unclear, point the user to Corvio Help Center rather than inventing an installer URL.
