#!/usr/bin/env bash
# Builds the course website with MkDocs Material.
#
# The Markdown files stay as they are. This script copies them into a
# staging folder (.site_src/), adapts them for the website, then builds
# the site into site/.
#
# Usage:
#   scripts/build-site.sh            # stage and build into site/
#   scripts/build-site.sh --serve    # stage and preview on http://127.0.0.1:8000
#
# Needs: pip install mkdocs-material
set -euo pipefail

cd "$(dirname "$0")/.."
SRC=.site_src
rm -rf "$SRC"
mkdir -p "$SRC"

# 1. Course content. README.md becomes the home page.
cp -r docs templates CHEATSHEET.md CLAUDE.md "$SRC/"
cp README.md "$SRC/index.md"

# Links to the README must point to the home page.
find "$SRC" -name '*.md' -print0 \
  | xargs -0 sed -i -E 's#\]\(((\.\./)*)README\.md#](\1index.md#g'

# Folder links in the home page point to each folder's index page.
sed -i -E 's#\]\((templates/[a-z]+/)\)#](\1index.md)#g' "$SRC/index.md"

# 2. Template pages. Readers copy these files, so show them verbatim
#    (front matter included) in a code block instead of rendering them.
FENCE='``````'

show_file() { # $1 = file under templates/, $2 = heading level
  local file=$1 name lang
  name=$(basename "$file")
  case "$name" in
    *.sh) lang=bash ;;
    *.md|*.example) lang=markdown ;;
    *) lang=text ;;
  esac
  printf '%s %s\n\n' "$2" "$name"
  printf '%s %s\n' "$FENCE" "$lang"
  cat "$file"
  printf '\n%s\n\n' "$FENCE"
}

while IFS= read -r -d '' f; do
  out="$SRC/$f"
  { printf '# %s\n\n' "$(basename "$f")"
    printf 'Copy this file into your project as described in the module that links here. '
    printf '[Download the raw file](%s).\n\n' "$(basename "$f").txt"
    show_file "$f" '##' | tail -n +3
  } > "$out.page"
  cp "$f" "$out.txt"
  mv "$out.page" "$out"
done < <(find templates -name '*.md' -print0)

# 3. One index page per template folder, listing every file in it.
write_index() { # $1 = folder, $2 = title, $3 = intro
  local dir=$1 f
  { printf '# %s\n\n%s\n\n' "$2" "$3"
    while IFS= read -r f; do show_file "$f" '##'; done \
      < <(find "$dir" -type f | sort)
  } > "$SRC/$dir/index.md"
}

write_index templates/agents 'Agent templates' \
  'Subagents for the AI workflows. Copy `simple/` or `complete/` into your project'"'"'s `.claude/agents/`.'
write_index templates/commands 'Command templates' \
  'Slash commands for the AI workflows. Copy them into your project'"'"'s `.claude/commands/`.'
write_index templates/hooks 'Hook templates' \
  'Hooks for the AI workflows. Keep them executable after copying (`chmod +x`).'

# 4. Build or preview.
if [ "${1:-}" = "--serve" ]; then
  mkdocs serve
else
  mkdocs build --strict
fi
