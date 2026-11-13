# Claude Code from Zero

A free, hands-on course for programmers on using Claude Code with a method. It is plain Markdown: no app, no build, no package manager.

## Layout

- `README.md`: course index. Each module appears in a learning-path table; unwritten modules (09–19) are under "Coming soon".
- `docs/NN-slug.md`: one module per file. 00–08 are the core track, 20–25 are AI workflows. The numbers 09–19 are reserved for the "Coming soon" modules.
- `CHEATSHEET.md`: one-page summary of commands, shortcuts and workflow steps.
- `templates/`: files readers copy into their own projects (`CLAUDE.md.example`, `agents/simple`, `agents/complete`, `commands/`, `hooks/`). These are **not** config for this repo, and there is no `.claude/` folder here.

## Writing a module

Every module follows this shape:

1. `# NN · Title`
2. `_Last reviewed: YYYY-MM_` (update it whenever you change the module)
3. `**Goal:**` in one line
4. A short concept section: tables and lists, the answer first
5. `## Exercise` on **the reader's own project** (there is no sample project in the repo)
6. `## Checklist` with `- [ ]` items
7. `**Next:**` linking to the next module, or "(coming soon)"

Keep it to about 60–100 lines. The running example is a small URL-shortener API: it illustrates ideas but never ships as code.

## Style

- English only, US spelling. The repo was translated from Portuguese, so don't add Portuguese text back.
- Short sentences, second person ("you"), practical examples rather than theory.
- Don't include prices, version numbers, model names or plan limits: they go stale. Link to the official docs (`https://docs.claude.com/en/docs/claude-code/...`) instead.
- Use relative links between files (`../templates/...`, `07-existing-project.md`).
- Forward references to unwritten modules say "Module NN (coming soon)", without a link.

## When you add or rename something

- New module: add it to the right `README.md` table, remove it from "Coming soon", and fix the `**Next:**` link in the module before it.
- New template: link it from the module that uses it, from `README.md` → Supporting material and, if it adds a step, from `CHEATSHEET.md`.
- Agent templates need YAML front matter (`name`, `description`, `tools`); `name` must match the file name.
- Hook scripts must stay executable and must exit with code 2 to block.

## Verify before committing

Check for broken relative links:

```bash
for f in $(git ls-files '*.md'); do d=$(dirname "$f"); grep -oE '\]\([^)#: ]+(#[^)]*)?\)' "$f" | sed -E 's/^\]\(//; s/\)$//; s/#.*//' | while read -r l; do [ -n "$l" ] && [ ! -e "$d/$l" ] && echo "$f -> $l"; done; done
```

No output means every link resolves. For hooks, run `bash -n templates/hooks/*.sh`.
