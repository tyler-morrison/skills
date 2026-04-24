#!/usr/bin/env bash
f="$CLAUDE_PROJECT_DIR/.claude/settings.local.json"
[ -f "$f" ] && jq 'del(.model)' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
