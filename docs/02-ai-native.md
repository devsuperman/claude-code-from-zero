# 02 · AI Native

_Last reviewed: 2026-10_

**Goal:** understand what working in an AI-native way means, what it changes and why it matters.

## What it is

**AI native** means designing the way you work (and sometimes the product) assuming AI is present from the start, not bolted on afterwards.

| | Using AI | Being AI native |
|---|---|---|
| Starting point | Old workflow + a new tool | Workflow designed for human + agent |
| Where AI comes in | Isolated moments (an autocomplete, a question) | The whole cycle: explore, plan, implement, test, review |
| What you prepare | Nothing special | Context, tests and specs the agent can use |
| Typical question | "Can the AI do this?" | "How do I structure the work so the AI does this well?" |

## What changes

- **The repository becomes an interface.** `CLAUDE.md`, tests, build scripts and clear commit messages become input for the agent, not just for the team.
- **Specification gains value.** Whoever describes the problem and the success criterion well gets more out of it.
- **Tests become the contract.** Without automatic verification, the agent works blind and you review everything by hand.
- **Review becomes the center of the work.** Generating code is cheap; making sure it is right is not.
- **Iteration gets short.** Trying two approaches costs minutes, so it's worth comparing before deciding.
- **Valued skills:** systems design, critical code reading, business domain knowledge, precise communication.

## Why it matters

- **Speed:** repetitive and exploratory tasks drop from hours to minutes.
- **Cost of experimenting:** prototypes and refactorings that were impractical become feasible.
- **Competitiveness:** those who learn to delegate well deliver more with the same team.
- **Quality, if done well:** tests and documentation stop being what gets "left for later".

## The risks

| Risk | How to handle it |
|---|---|
| Technical debt from code accepted without understanding | Mandatory review; small changes |
| Overconfidence | Verifiable criteria; tests running |
| Security and data leaks | Minimal permissions, no secrets in the directory, review commands |
| Dependence on one tool | Know the [alternatives](03-alternatives.md); keep knowledge in the repository |

## Adoption levels

| Level | How you work |
|---|---|
| 0 | No AI |
| 1 | Autocomplete |
| 2 | Chat: you paste code and copy the answer |
| 3 | Interactive agent (this course): you delegate and review |
| 4 | Agents in parallel or in automation (CI, headless mode), with you supervising |

Almost nobody needs level 4 on day one. Move up one level at a time, once the previous one feels comfortable.

## How to start

1. Pick a real project and ask the agent to explain the architecture.
2. Create a `CLAUDE.md` with commands and conventions.
3. Make sure the tests run with one command.
4. Delegate small tasks with a success criterion.
5. Note what the agent got wrong and carry the fix into the `CLAUDE.md`.

## Exercise

Assess a project of your own:

1. Do the tests run with a single command?
2. Can a stranger (or an agent) figure out how to run the project by reading only the repository?
3. Are the conventions written down somewhere?

Each "no" is an improvement that makes the project more AI native. Fix the first one.

## Checklist

- [ ] I can tell using AI from being AI native
- [ ] I know three practical changes to the way I work
- [ ] I know which adoption level I'm at

**Next:** [03 · Alternatives to Claude Code](03-alternatives.md)
