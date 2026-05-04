#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
DIST_DIR="$REPO_DIR/dist"

mkdir -p "$DIST_DIR"

for skill_path in "$REPO_DIR"/*/; do
  [[ -f "${skill_path}SKILL.md" ]] || continue
  skill_name="$(basename "$skill_path")"
  zip -j "$DIST_DIR/${skill_name}.skill" "${skill_path}SKILL.md" >/dev/null
done
