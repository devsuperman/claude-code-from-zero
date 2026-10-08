# 08 · Starting a project from scratch

_Last reviewed: 2026-10_

**Goal:** create a new project with Claude Code from the first commit, in small, verifiable slices.

Example throughout the module: the **URL shortener** from the [running project](../examples/README.md). Swap the stack for yours.

## Step by step

### 1. Create the folder and the repository

```bash
mkdir shortener && cd shortener
git init
claude
```

Use git from minute zero: each slice becomes a commit and you can go back.

### 2. Define the scope in plan mode

Switch to plan mode (`Shift+Tab`) and talk before generating anything:

```
I want a URL shortener: it receives a long URL, returns a short code, and redirects the code to the original URL. Stack: Python + FastAPI + SQLite. No authentication for now.

Propose: folder structure, endpoints, data model and the order of implementation slices. Ask about anything ambiguous. Don't create files.
```

Read, adjust and only then move on. This is where bad decisions are cheapest.

### 3. Generate the minimal skeleton

```
Create only the skeleton: folder structure, dependencies, a /health endpoint and a test that calls it. Include a short README with the commands to install, run and test.
```

Run the README commands yourself. If they don't work, fix it now.

### 4. Create the initial `CLAUDE.md`

```
Create a lean CLAUDE.md with the commands to install, run, test and lint, and the conventions we agreed on.
```

Review and make the first commit (skeleton + `CLAUDE.md` + passing test).

### 5. Evolve in slices

Each slice follows the same cycle: **one feature → test → commit**.

```
Slice 1: POST /links receives {"url": "..."} and returns {"code": "..."}. Write the test first, then the implementation. Run the suite at the end.
```

```
Slice 2: GET /{code} redirects (302) to the original URL; 404 if the code doesn't exist. Same cycle.
```

Before each commit: `git diff`, green tests.

### 6. Feed back into the `CLAUDE.md`

When the agent gets something wrong that will repeat (e.g. using a library outside what was agreed), add a line to the `CLAUDE.md`. It gets better with each slice.

## Best practices for new projects

- **Small slices:** if you can't review the diff in a few minutes, the slice is too big.
- **Test first** whenever possible: it is the agent's success criterion.
- **Decide the stack yourself.** Ask for options and pros/cons, but the choice is yours.
- **Don't generate everything at once.** A "complete app" in a single prompt becomes code nobody understands.
- **Secrets out of the repo:** `.env` in `.gitignore` from the first commit.

## Existing × new: what changes

| | Existing project | New project |
|---|---|---|
| First step | Understand what's there | Define what to build |
| `CLAUDE.md` | Generated from the code, then trimmed | Written along with the decisions |
| Main risk | Breaking what works | Growing without direction |
| Safety net | Existing tests (if any) | Tests you create from slice 1 |

## Exercise

1. Create a new project following steps 1 to 5 (use the shortener or another of your choice).
2. Deliver at least two slices, each with its own test and commit.
3. Record in the `CLAUDE.md` at least one correction learned along the way.

## Checklist

- [ ] I planned in plan mode before generating code
- [ ] The skeleton runs and tests with the README commands
- [ ] Each slice has its own test and commit
- [ ] The `CLAUDE.md` reflects what I learned

**Next:** module 09 (coming soon)
