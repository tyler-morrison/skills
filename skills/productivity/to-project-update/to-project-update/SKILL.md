---
name: to-project-update
description: Draft engaging Atlassian Project updates. Use when the user wants to write, draft, or polish a status update, learning, risk, or decision for an Atlassian Project.
arguments: [type]
argument-hint: "[status | learning | risk | decision]"
disable-model-invocation: true
---

This skill takes the current conversation context and codebase understanding and produces an Atlassian Project update.
Do NOT interview the user — just synthesize what you already know.

# Project Updates
 
Posting Project updates isn't supported through the Rovo MCP, so the skill drafts and you paste into the composer. The `$type` argument helps users specify specific update formatting; the rest of `$ARGUMENTS` is topical context for what the update should cover.
 
## Process
 
### 1. Pick the type and load its rules
 
<important if="$type is set">Load `{$type}-FORMAT.md` and follow it for the type-specific rules.</important>
<important if="$type is empty">Ask which type they want and what it should cover, then load its `<TYPE>-FORMAT.md`. Fall back to a short status update (`STATUS-FORMAT.md`) if the type can't be inferred from prior context.</important>
 
### 2. Output the draft
 
Run `/edit-copy` before presenting the final draft. If you made a judgment call (picked the type, trimmed for length), add one line after the draft flagging it.
 
## Style guide
 
- **Audience**: this posts to a shared feed visible to all users — write for a broad cross-team reader who lacks your context, not just your team.
- **Tone**: educational and curious — learning in public. Frame posts around teaching and discovery, not selling.
- **Purpose**: share a clear, accountable record of project progress made over the last week or what’s expected in the week ahead.