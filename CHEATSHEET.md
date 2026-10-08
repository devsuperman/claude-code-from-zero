# Cheatsheet

> Quick summary. For the full, current list, use `/help` and the [official documentation](https://docs.claude.com/en/docs/claude-code/overview).

## Terminal

| Command | What it does |
|---------|--------------|
| `claude` | Starts an interactive session |
| `claude "prompt"` | Starts with a prompt already given |
| `claude -p "prompt"` | Non-interactive mode: answers and exits |
| `claude --continue` | Resumes the last conversation |
| `claude --resume` | Pick a previous conversation |
| `claude --version` | Shows the version |

## Inside the session

| Command | What it does |
|---------|--------------|
| `/help` | Help and command list |
| `/init` | Generates a `CLAUDE.md` for the project |
| `/clear` | Resets the context |
| `/compact` | Summarizes the history to free up context |
| `/context` | Shows context window usage |
| `/cost` | Shows the session's consumption |
| `/model` | Switches the model |
| `/permissions` | Views and edits permission rules |
| `/resume` | Resumes a previous conversation |
| `/exit` | Exits |

## Shortcuts

| Shortcut | What it does |
|----------|--------------|
| `Esc` | Interrupts the current action |
| `Shift+Tab` | Cycles mode: normal, accept edits, plan |
| `@file` | References a file |
| `!command` | Runs a shell command directly |
| `Ctrl+C` | Cancels input / exits (twice) |

## First steps

**Existing project** ([module 07](docs/07-existing-project.md))

1. `git switch -c claude/task` (clean tree) and `claude`
2. "Explain the architecture and how to test it. Don't change anything."
3. `/init` → review and trim the `CLAUDE.md`
4. Run tests/lint; small task with a success criterion
5. `git diff` → commit

**New project** ([module 08](docs/08-new-project.md))

1. `git init` and `claude`
2. Plan mode: scope, stack, endpoints, slices
3. Minimal skeleton + test + README with commands
4. Initial `CLAUDE.md` → first commit
5. Slices: feature → test → commit

## Which tool? ([module 03](docs/03-alternatives.md))

| I need... | Category |
|---|---|
| To delegate tasks in the repo, with automation | Terminal agent |
| Everything inside the editor | AI IDE / extension |
| To assign an issue and get a PR | Cloud agent |

## Rules of thumb

1. One session, one topic. Changed task? `/clear`.
2. Explore and plan before implementing.
3. Always give a verifiable success criterion.
4. Read the diffs.
5. Wrong 3 times in a row? Start over with a better prompt.
