#!/usr/bin/env bash
f="$CLAUDE_PROJECT_DIR/.claude/settings.local.json"
[ -f "$f" ] && python3 -c 'import json,sys;p=sys.argv[1];d=json.load(open(p));d.pop("model",None);json.dump(d,open(p,"w"),indent=2)' "$f"
