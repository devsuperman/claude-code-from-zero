# 04 · Installation and first use

_Last reviewed: 2026-10 · Confirm the current steps in the [official documentation](https://docs.claude.com/en/docs/claude-code/setup)._

**Goal:** install, authenticate and ask your first question about the code.

## Install

Two common ways:

```bash
# Native installer (macOS, Linux, WSL)
curl -fsSL https://claude.ai/install.sh | bash

# Via npm (requires a recent Node.js)
npm install -g @anthropic-ai/claude-code
```

Confirm:

```bash
claude --version
```

## First session

```bash
cd my-project
claude
```

On first run it asks you to authenticate (Claude account or API key) and opens the browser. Afterwards, write in natural language and press Enter.

## Your first prompts

Start **read-only**, without asking for changes:

```
Explain the structure of this project: main folders, how to run it and how to test it.
```

```
Where is authentication done? Show the files and the flow.
```

## Interface essentials

| Action | How |
|------|------|
| Help | `/help` |
| Interrupt what it's doing | `Esc` |
| Exit | `Ctrl+C` twice, or `/exit` |
| Reference a file | `@path/file` |
| Run a shell command directly | prefix with `!` |
| Switch mode (normal / accept edits / plan) | `Shift+Tab` |
| Clear the context | `/clear` |
| Resume a previous conversation | `claude --continue` or `claude --resume` |

## Exercise

1. Install and authenticate.
2. Open a session in a project of your own (or clone any small open source project).
3. Ask for an explanation of the architecture. Then ask something specific, using `@` to point at a file.
4. Press `Esc` in the middle of an answer and redirect.
5. Exit and resume the session with `claude --continue`.

## Common problems

- **`claude: command not found`:** the binaries directory is not in your `PATH`. Reopen the terminal or check the installation.
- **Login doesn't open the browser:** copy the displayed URL and open it manually.
- **Ran in the wrong folder:** Claude Code works from the current directory. Go to the project root before starting.

## Checklist

- [ ] `claude --version` works
- [ ] I asked a question about the code and read the answer
- [ ] I used `@file`, `Esc` and resumed a session

**Next:** [05 · How Claude Code works](05-how-it-works.md)
