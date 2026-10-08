# 07 · Starting on an existing project

_Last reviewed: 2026-10_

**Goal:** use Claude Code safely in a repository that already exists, from the first command to the first committed change.

## Step by step

### 1. Prepare the ground

```bash
cd my-project
git status            # clean tree?
git switch -c claude/first-task
claude
```

Own branch + clean tree = any mistake is undone with `git restore` / `git switch`.

### 2. Ask for a map (read-only)

```
Explain the architecture of this project: main folders, the flow of a typical request/execution, how to run it and how to test it. Don't change anything.
```

Check two or three points you know. If it gets wrong what you know, distrust the rest and ask for sources (`show me the files`).

### 3. Generate the `CLAUDE.md`

```
/init
```

Then **review and trim**. Keep only what the agent would get wrong without knowing: build/test/lint commands, non-obvious conventions, pitfalls. Use the [template](../templates/CLAUDE.md.example) as a guide. Commit the file.

### 4. Confirm that verification works

```
Run the test suite and the linter and tell me the result.
```

Without a verification command that works, the agent works blind. If the tests already fail, note that in the `CLAUDE.md` so the new change doesn't get blamed.

### 5. Do a small first task

Pick something small, low-risk and verifiable: a simple bug, a missing test, a small tweak. Use the 4 elements from [module 06](06-good-prompts.md):

```
In @src/utils/date.ts, the formatDate function breaks with null dates. Reproduce with a failing test, fix the root cause and run the suite. Don't change the public signature.
```

### 6. Review and commit

```bash
git diff
```

Read the diff as if it were someone else's. Only then `git commit`. If you didn't understand a part, ask the agent before accepting.

## Common situations

| Situation | What to do |
|---|---|
| Large repository | Point at the relevant folder (`@src/billing/`) and ask for maps per area, not of the whole repo |
| No tests | First task: ask for characterization tests for the code you're about to change |
| Confusing legacy code | Ask for an explanation and a plan first; change in small steps |
| Agent ignores conventions | Write the convention in the `CLAUDE.md` |
| Monorepo | `CLAUDE.md` at the root + one per package, with what is specific to it |

## Exercise

Repeat steps 1 to 6 on a project of your own. At the end, answer: would the generated `CLAUDE.md` have prevented any mistake the agent made? If so, what was missing from it?

In the running project, use the [URL shortener](../examples/README.md) as a base.

## Checklist

- [ ] I worked on my own branch, with a clean tree
- [ ] I reviewed and committed a lean `CLAUDE.md`
- [ ] I confirmed that tests/lint run with one command
- [ ] I did a small task with a success criterion and read the diff before committing

**Next:** [08 · Starting a project from scratch](08-new-project.md)
