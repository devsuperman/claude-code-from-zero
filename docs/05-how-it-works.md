# 05 · How Claude Code works

_Last reviewed: 2026-10_

**Goal:** understand the mechanism (loop, tools, context, permissions) to avoid most usage mistakes.

## The agent loop

```
You ask → Claude decides on an action → uses a tool → reads the result → decides the next step → ... → answers
```

It repeats until done. Every step is visible and you can interrupt with `Esc`.

## Tools

The model only generates text; the **tools** are what act:

| Type | Examples | Asks permission? |
|------|----------|------------------|
| Reading | read a file, list folders, search text | Usually not |
| Editing | create and change files | Yes, by default |
| Execution | shell commands (tests, build, git) | Yes, by default |
| External | web, MCP servers | Depends on configuration |

## Context: the scarce resource

Messages, files read and command outputs go into the **context window**, which is limited.

- The fuller it gets, the **worse the model's attention** to details and the **higher the cost**.
- Large files and long logs consume a lot.
- `/context` shows usage; `/clear` resets it; `/compact` summarizes the history.

**Rule of thumb:** one session, one topic. Changed task? `/clear`.

## Permissions

By default Claude Code **asks before** editing or executing. You choose:

- **Approve once**
- **Always approve** for that type of action
- **Deny** and explain what you prefer

`Shift+Tab` cycles between modes:

1. **Normal:** asks about everything that modifies something
2. **Accept edits:** edits without asking, but still asks about commands
3. **Plan:** only reads and proposes a plan, changing nothing

> Start in normal mode to learn what it does. Gradually allow what is safe (for example, `npm test`). A future security module goes deeper on this.

## Project memory: CLAUDE.md

The model doesn't remember previous sessions. What persists is the **`CLAUDE.md`** at the project root, read at the start of each session: build/test commands, conventions and warnings. Create it with `/init` and use [this template](../templates/CLAUDE.md.example) as a base. Modules [07](07-existing-project.md) and [08](08-new-project.md) show how to create it.

## Does it make mistakes? Yes

It can invent an API, assume something wrong or "finish" without verifying. So:

- ask it to run the tests and show you the result;
- read the diffs before accepting;
- be wary of confident-sounding answers about code it hasn't read.

## Exercise

1. On a project of your own, ask: _"Run the tests and tell me what fails."_ Observe which permissions it asks for.
2. Run `/context` and see how much of the window has been used.
3. Switch to plan mode with `Shift+Tab` and ask: _"Plan adding an endpoint/function X."_ Note that nothing is changed.
4. Run `/init` and read the generated `CLAUDE.md`. Is anything wrong or missing?

## Checklist

- [ ] I can describe the agent loop and the role of tools
- [ ] I know why context is limited and how to manage it
- [ ] I can switch between permission modes
- [ ] I know that `CLAUDE.md` is the project's persistent memory

**Next:** [06 · Writing good prompts](06-good-prompts.md)
