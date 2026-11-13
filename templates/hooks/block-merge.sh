#!/usr/bin/env bash
# PreToolUse hook for Bash: in the AI workflow, merging and changing main are for humans.
# Install: copy to .claude/hooks/, chmod +x, and register it in .claude/settings.json
# (see docs/25-complete-workflow-end-to-end.md). Needs jq.

cmd=$(jq -r '.tool_input.command // ""')

if echo "$cmd" | grep -Eq 'gh pr merge|git push.*(--force|[[:space:]]-f([[:space:]]|$))|git push.*[[:space:]:](main|master)([[:space:]]|$)'; then
  echo "Blocked by workflow hook: merging, force-pushing and pushing to main are done by a human." >&2
  exit 2
fi

exit 0
