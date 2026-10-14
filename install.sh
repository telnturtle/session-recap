#!/bin/sh
# Install the session-recap skill for Claude Code (and Codex, if present).
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/telnturtle/session-recap/main/install.sh | sh
#
# Default targets:
#   ~/.claude/skills/session-recap      (always)
#   ~/.codex/skills/session-recap       (only if ~/.codex exists)
# Pass skills directories as arguments to choose targets yourself:
#   curl -fsSL .../install.sh | sh -s -- ~/.claude/skills ~/some/other/skills
#
# An existing installation is left untouched. Set FORCE=1 to overwrite it:
#   curl -fsSL .../install.sh | FORCE=1 sh

set -eu

BASE="${SESSION_RECAP_BASE_URL:-https://raw.githubusercontent.com/telnturtle/session-recap/main}"
NAME="session-recap"

if [ "$#" -gt 0 ]; then
  TARGETS="$*"
else
  TARGETS="$HOME/.claude/skills"
  [ -d "$HOME/.codex" ] && TARGETS="$TARGETS $HOME/.codex/skills"
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
curl -fsSL "$BASE/SKILL.md" -o "$tmp/SKILL.md"
curl -fsSL "$BASE/agents/openai.yaml" -o "$tmp/openai.yaml"

for skills_dir in $TARGETS; do
  dest="$skills_dir/$NAME"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ "${FORCE:-0}" != "1" ]; then
      echo "skipped: $dest already exists (set FORCE=1 to overwrite)" >&2
      continue
    fi
    rm -rf "$dest"
  fi
  mkdir -p "$dest/agents"
  cp "$tmp/SKILL.md" "$dest/SKILL.md"
  cp "$tmp/openai.yaml" "$dest/agents/openai.yaml"
  echo "installed: $dest"
done
