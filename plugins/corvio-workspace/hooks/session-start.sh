#!/usr/bin/env bash
set -euo pipefail

if [[ -n "${PLUGIN_ROOT:-}" ]]; then
  host_freshness='loaded_surface=codex_plugin and installation_channel=codex_marketplace'
else
  host_freshness='loaded_surface=claude_plugin and installation_channel=claude_code_marketplace'
fi

printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"The official Corvio Workspace Plugin is active with Skill release 1.7.87, collaboration contract 2026-09-28.2, and compatibility family coding-agent-collaboration-v1. Before interpreting source material or choosing a Corvio action for research, reports, plans, decisions, project/debug work, document edits, future-use material, or receipt-bound follow-ups, explicitly load and follow the $corvio-operate-workspace Skill; this hook is only its activation spine, not a substitute for that Skill. On first Corvio use, call get_collaboration_contract with response_mode=freshness_only and '"${host_freshness}"'. The official Plugin MCP transport already reports package release, contract revision, and compatibility family outside model-authored arguments. Show client_freshness.agent_notice once if returned and stay quiet when current. Corvio OAuth is capability, not standing write consent. Keep credentials, regulated or privileged data, disclosure-unclear sources, and explicitly local-only material out. Exact continuation handles are compact prior-work context: read the narrowest current owner instead of asking the user to repeat it. Future-use material authorizes one Work Model reconciliation after the Skill safety gate; an ordinary one-off still needs consent or a standing preference. Preserve selected source bytes through a Host-native file or resource carrier when available, then consume typed receipts and canonical links. Do not infer detailed routing from this hook; the Skill and live tool contracts own those decisions."}}'
