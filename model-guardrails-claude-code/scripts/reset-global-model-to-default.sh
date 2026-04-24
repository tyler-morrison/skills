#!/usr/bin/env bash
f="$HOME/.claude/settings.json"
[ -f "$f" ] && jq '.model = "__DEFAULT_MODEL__"' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
