#!/usr/bin/env bash
f="$HOME/.claude/settings.json"
[ -f "$f" ] && python3 -c 'import json,sys;p,m=sys.argv[1],sys.argv[2];d=json.load(open(p));d["model"]=m;json.dump(d,open(p,"w"),indent=2)' "$f" "__DEFAULT_MODEL__"
