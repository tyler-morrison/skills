#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SKILLS_DIR="$HOME/.claude/skills"

for skill_path in "$REPO_DIR"/*/; do
  [[ -f "${skill_path}SKILL.md" ]] || continue

  skill_name="$(basename "$skill_path")"
  canonical_path="${skill_path%/}"
  target="$SKILLS_DIR/$skill_name"

  if [[ -L "$target" ]]; then
    resolved="$(readlink "$target")"
    [[ "$resolved" == "$canonical_path" ]] || \
      echo "CONFLICT: ~/.claude/skills/$skill_name is a symlink to $resolved (not this repo). Skipping."
  elif [[ -d "$target" ]]; then
    echo "CONFLICT: ~/.claude/skills/$skill_name is a real directory. Confirm overwrite to replace with symlink to repo."
  else
    ln -s "$canonical_path" "$target"
    echo "Linked: ~/.claude/skills/$skill_name → $canonical_path"
  fi
done
