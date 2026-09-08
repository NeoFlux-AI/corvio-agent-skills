---
name: corvio-import-local-work
description: Safely discover and import selected local Codex, Claude Code, or Cursor histories into Corvio with the first-party foreground CLI. Use when a user asks to scan, preview, migrate, upload, or organize local Agent chats, Skills, Memory, or supported files; when they ask what Corvio can read locally; or when a remote MCP host needs to hand local work to a local Agent. Do not use for ordinary Corvio Workspace search, remote connector setup, or arbitrary home-directory crawling.
---

# Import local Agent work into Corvio

Use Corvio's reviewed local-import path to turn selected local Agent history into a revocable Corvio source library and report. The signed/native CLI owns local discovery, bounded sampling, parsing, local redaction, and upload. This Skill owns user guidance and consent sequencing; it does not implement a second scanner.

## Establish the boundary first

1. State that remote MCP and hosted Connectors cannot scan the user's computer.
2. Confirm that the work is running in a local Agent or terminal controlled by the user.
3. Check the current Corvio importer distribution status. Production installers remain unavailable until Corvio publishes the signed release; use a reviewed Staging/internal candidate or repository source build only when appropriate.
4. Never request a password, API key, refresh token, browser profile, credential store, private key, or full Home directory.
5. Read [privacy-and-sources.md](references/privacy-and-sources.md) before proposing commands for a new source or operating system.

## Run the consented workflow

### 1. Authenticate locally

Run `corvio auth status`. If no scoped Local Agent Import credential exists, run `corvio auth login` and let the user approve the device link in Corvio. Do not copy tokens into chat, command arguments, logs, or documents.

### 2. Discover metadata only

Run:

```text
corvio agent-history detect
```

Detection may inspect only allowlisted source roots and file metadata. Present a discovery receipt containing source kind, availability, item counts, time range when available, unsupported sources, and errors. Do not claim that bodies were read or uploaded.

### 3. Ask the user to select sources

Ask for an explicit selection when more than one supported source exists or when a custom root is involved. The current reviewed adapters are Codex, Claude Code, and gated Cursor Beta; their availability depends on the server capability response and signed build.

For a custom root, use the narrow source-specific command and repeat the resolved source kind and path for confirmation. Never replace a missing adapter with recursive Home-directory search.

### 4. Review the bounded sample receipt

Start the interactive import:

```text
corvio agent-history import
```

The importer may read a bounded local sample but uploads statistics only. Summarize candidate conversations/turn counts, approximate size and time range, sensitive/blocked counts, exclusions, and the next operation. Ask before continuing to full body parsing.

### 5. Confirm body parsing and upload separately

Full parsing must stay inside the foreground CLI. It converts only complete user-to-assistant turns, redacts locally, blocks high-risk credentials, and never uploads raw JSONL/SQLite files, absolute paths, system/developer prompts, hidden reasoning, tool output, or media.

Do not add `--confirm-upload` or approve the Web review step unless the user explicitly approved the selected sources and upload in the current interaction. Non-interactive use requires both `--non-interactive` and `--confirm-upload`; automation convenience is not consent.

### 6. Verify durable completion

Report completion only when the server returns the terminal import receipt. Preserve:

- Run/session ID and final status;
- selected-source manifest;
- discovery and sample receipts;
- uploaded/blocked/skipped turn counts;
- Corvio report URL or durable resource handle;
- retry or rollback guidance.

Imported history remains a revocable source library. Do not promote it into Memory unless the user separately confirms that durable Memory action.

## Web-created run

When Corvio gives the user a one-time claim code, run exactly the displayed scoped command:

```text
corvio agent-history import --code XXXX-XXXX
```

The Web surface owns source selection and final confirmation. Poll the same Run; do not create a parallel CLI-initiated import when the current Run is still active.

## Stop conditions

Stop and ask rather than scanning or uploading when source ownership is unclear, the target Workspace is ambiguous, a path is outside the reviewed adapter boundary, the capability endpoint disables the source, the schema is unknown, sensitive-item blocking is material, or the user has not separately approved the upload.

For unsupported sources, offer a source-tool export or Corvio manual file upload. Preserve the same authority, privacy, and receipt boundaries.
