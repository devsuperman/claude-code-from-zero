# Claude Code from Zero

A free, hands-on course in English for **programmers** who want to use [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) with a method: less trial and error, more reliable results.

**Read it as a website:** https://devsuperman.github.io/claude-code-from-zero/

> **Source of truth:** Claude Code changes fast. This material explains *how to think and work*; for exact flags, commands and settings, the [official documentation](https://docs.claude.com/en/docs/claude-code/overview) rules. Each module states the date of its last review.

## Who it's for

For people who already program and are comfortable with the terminal and git. We don't teach programming; we teach how to delegate, guide and review the work of a coding agent.

## Learning path

### Core (start here)

| # | Module | You learn |
|---|--------|-----------|
| 00 | [Before you start](docs/00-before-you-start.md) | What Claude Code is and how it differs from chat and autocomplete |
| 01 | [Before × After: the paradigm shift](docs/01-paradigm.md) | How we programmed before and after Claude Code, and your new role |
| 02 | [AI Native](docs/02-ai-native.md) | What it is, what changes, why it matters and how to adopt it |
| 03 | [Alternatives to Claude Code](docs/03-alternatives.md) | Tool categories, similarities, differences and when to choose each |
| 04 | [Installation and first use](docs/04-installation.md) | Install, authenticate, first session |
| 05 | [How Claude Code works](docs/05-how-it-works.md) | Tools, context, permissions and the agent loop |
| 06 | [Writing good prompts](docs/06-good-prompts.md) | Specificity, success criteria, before/after examples |
| 07 | [Starting on an existing project](docs/07-existing-project.md) | Map it, generate the `CLAUDE.md` and make the first change safely |
| 08 | [Starting a project from scratch](docs/08-new-project.md) | Plan, generate the skeleton and evolve in slices |

### AI workflows (one agent per job)

| # | Module | You learn |
|---|--------|-----------|
| 20 | [AI workflows: the map](docs/20-ai-workflows.md) | Why separate agents, simple × complete workflow and when to use each |
| 21 | [Simple workflow](docs/21-simple-workflow.md) | Plan, build and review a feature with 3 agents and 2 approval points |
| 22 | [Complete workflow I: from idea to tickets](docs/22-complete-workflow-spec-tickets.md) | Analyst and ticket-writer: an approved spec and small tickets |
| 23 | [Complete workflow II: tests and code](docs/23-complete-workflow-tests-code.md) | Test-writer and implementer: failing tests first, code that can't change them |
| 24 | [Complete workflow III: review gates](docs/24-complete-workflow-review-gates.md) | Code, security and QA gates in parallel, with a limit on fix rounds |
| 25 | [Complete workflow IV: end to end](docs/25-complete-workflow-end-to-end.md) | PR writer, `/feature`, a merge-blocking hook, CI and cost |

### Coming soon

09 Explore → plan → implement · 10 Managing context · 11 CLAUDE.md · 12 Permissions and security · 13 Verification · 14 Git and GitHub · 15 Slash commands and skills · 16 Subagents · 17 Hooks and MCP · 18 Headless mode · 19 Anti-patterns

## Supporting material

- [CHEATSHEET.md](CHEATSHEET.md): commands and shortcuts on one page
- [templates/CLAUDE.md.example](templates/CLAUDE.md.example): starting point for your `CLAUDE.md`
- [CLAUDE.md](CLAUDE.md): this repository's own `CLAUDE.md`, a real example of a lean one
- [templates/agents/](templates/agents/), [templates/commands/](templates/commands/) and [templates/hooks/](templates/hooks/): ready-to-use subagents, slash commands and hooks for the AI workflows

## How to study

1. Read the module (5 minutes).
2. Do the **exercise** on a project of your own (work or personal), on a separate branch.
3. Check the **checklist** at the end. If you can't tick every item, repeat the exercise.

## Contributing

Corrections and suggestions are welcome via issue or pull request. When writing or changing a module:

- Follow the pattern: **Goal** (1 line), short concept (tables and lists), **exercise** and **checklist**.
- Be concise: about 60 to 100 lines, answer first, real examples instead of theory.
- State the review date and avoid data that ages fast (prices, versions); link to the official source.

The full conventions, and the link check to run before committing, are in [CLAUDE.md](CLAUDE.md). Claude Code reads that file too, so you can ask it to write or review a module and it will follow the same rules.
