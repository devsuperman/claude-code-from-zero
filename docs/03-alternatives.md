# 03 · Alternatives to Claude Code

_Last reviewed: 2026-10 · This market changes fast. Prices, models, limits and features are **deliberately not** in this module: check the official pages linked below._

**Goal:** know what kinds of tools exist, what they have in common and when each makes sense.

## Four categories

| Category | Idea | Examples |
|---|---|---|
| **Terminal agent** | You give a goal; it reads, edits and runs commands in your project | Claude Code, [Codex CLI](https://github.com/openai/codex), [Gemini CLI](https://github.com/google-gemini/gemini-cli), [Aider](https://aider.chat/docs) |
| **IDE with built-in AI** | Its own editor with chat and agent mode built in | [Cursor](https://cursor.com/docs) |
| **IDE extension** | Agent inside the editor you already use | [Cline](https://docs.cline.bot), [GitHub Copilot](https://docs.github.com/en/copilot) |
| **Cloud agent** | You assign a task (issue) and get a pull request | Copilot coding agent, Claude Code on the web |

Chat (pasting code) and autocomplete (line suggestions) are the basic level and remain useful, but they don't do the work for you.

## What they have in common

- They use large language models (LLMs) to understand and change code.
- They read project files and propose or apply edits.
- They ask permission for sensitive actions, to varying degrees.
- They depend on **good context, a success criterion and your review**.

Everything you learn in this course about prompts, context and verification applies to any of them.

## How they differ

| Axis | Question to ask |
|---|---|
| **Where it runs** | Terminal, IDE, cloud or all of them? |
| **Autonomy** | Does it suggest and wait, or execute and iterate on its own? |
| **Models** | Fixed to one vendor, or can you choose (including local ones)? |
| **Open source** | Is the tool open and auditable? |
| **Extensibility** | Does it support plugging in tools, hooks, commands and automation? |
| **Automation/CI** | Does it run without interaction (scripts, pipelines)? |
| **Price** | Subscription, pay per use or your own API key? |
| **Privacy** | Where does your code go? Are there enterprise options? |

## General profile of Claude Code

- **Terminal first**, with IDE, desktop and web versions.
- Uses Anthropic's models.
- Focused on the autonomous agent: reads, edits, executes, iterates.
- Extensible (`CLAUDE.md`, commands and skills, subagents, hooks, MCP) and usable in automation (headless mode).

This is the profile the course assumes. See current details and limits in the [official documentation](https://docs.claude.com/en/docs/claude-code/overview).

## When to consider another option

| If you... | Consider |
|---|---|
| Live in the editor and want everything there | AI IDE (e.g. Cursor) or extension (e.g. Cline, Copilot) |
| Want to choose or switch models, or use your own models | Open, multi-model tools (e.g. Aider, Cline) |
| Already pay for an ecosystem and want native integration | That vendor's tool (e.g. Copilot on GitHub, Codex CLI, Gemini CLI) |
| Want to delegate tasks and only review the PR | Cloud agent |
| Want a terminal agent with extensibility and automation | Claude Code |

It isn't an exclusive choice. It's common to use an IDE for day-to-day editing and a terminal agent for bigger tasks.

## How to evaluate in practice

Run **the same real task** in two tools, with the same prompt, and compare:

1. Did the result pass the tests?
2. How much did you have to fix?
3. Was the diff easy to review?
4. How much time and cost?

Decide based on your project, not on rankings or marketing.

## Exercise

1. Pick a small task from your backlog.
2. Run it in Claude Code and in an alternative of your choice.
3. Fill in the table of 4 questions above for each one.

## Checklist

- [ ] I can name the four categories and one example of each
- [ ] I know three things they have in common and three differences
- [ ] I know how to compare tools on my project

**Next:** [04 · Installation and first use](04-installation.md)
