---
name: model-guardrails-claude-code
description: >
  Set up Claude Code with two `SessionEnd` hooks that clear model overrides in a session.
  Use when user wants to prevent model selection drift, auto-reset their Claude Code model between sessions, or install model guardrails.
---

# Setup Model Guardrails

Installs two `SessionEnd` hooks that run automatically when a Claude Code session ends:

1. **Delete locally-pinned models** — removes `.model` from the current project's `.claude/settings.local.json` so a one-off `/model` pick doesn't persist.
2. **Reset global default model** — rewrites `.model` in `~/.claude/settings.json` back to a chosen Anthropic default (e.g. `sonnet`).

Together these prevent accidental drift to a more expensive model across sessions.

## Steps

### 1. Ask the default model

Ask which Anthropic model should be the global default.
Remember the choice as `$DEFAULT_MODEL` for Step 3.

### 2. Install the scripts

Copy both scripts from this skill's `scripts/` directory to `~/.claude/hooks/`:

- `scripts/delete-locally-pinned-models.sh` → `~/.claude/hooks/delete-locally-pinned-models.sh`
- `scripts/reset-global-model-to-default.sh` → `~/.claude/hooks/reset-global-model-to-default.sh`

Create `~/.claude/hooks/` if it doesn't exist. Make both executable with `chmod +x`.

Before saving the reset script, substitute the placeholder `__DEFAULT_MODEL__` with `$DEFAULT_MODEL` from step 1.

### 3. Add hooks to global settings

Merge the following into `~/.claude/settings.json` (do **not** overwrite other settings; merge into existing `hooks.SessionEnd` array if present):

```json
{
  "hooks": {
    "SessionEnd": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "$HOME/.claude/hooks/delete-locally-pinned-models.sh"
          },
          {
            "type": "command",
            "command": "$HOME/.claude/hooks/reset-global-model-to-default.sh"
          }
        ]
      }
    ]
  }
}
```

`SessionEnd` hooks have no `matcher` field — they fire on every session end.

### 4. Verify

Confirm the scripts run cleanly:

```bash
bash ~/.claude/hooks/delete-locally-pinned-models.sh && echo OK
bash ~/.claude/hooks/reset-global-model-to-default.sh && echo OK
```

Then check `~/.claude/settings.json` shows `"model": "<chosen default>"` and the current project's `.claude/settings.local.json` (if it exists) no longer has a `model` key.

### 5. Dependency check

Both scripts use `jq`. Confirm it's installed (`command -v jq`). If missing, tell the user to `brew install jq`.

## Notes

- The delete script relies on `$CLAUDE_PROJECT_DIR`, which Claude Code sets automatically for hooks. It's a no-op in projects without a `.claude/settings.local.json`.
- Installing globally (`~/.claude/settings.json`) ensures the reset runs regardless of which project the session was in.
