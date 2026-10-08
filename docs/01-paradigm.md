# 01 · Before × After: the paradigm shift

_Last reviewed: 2026-10_

**Goal:** understand what changes in your daily work, and what doesn't, when you start programming with an agent.

## In one sentence

Before, the bottleneck was **typing and searching**. Now it is **specifying clearly and verifying**.

## The workflow, side by side

| Step | Before | After (with Claude Code) |
|---|---|---|
| Understanding new code | Read files by hand, `grep`, follow calls | Ask: "how does the X flow work?" and check the files cited |
| Writing | Type, consult docs and Stack Overflow | Describe the goal, review the plan, review the diff |
| Debugging | Reproduce, log, search the error | Paste the error, ask for a reproduction test and a root-cause fix |
| Testing | Write tests afterwards (or never) | Tests as the success criterion: the agent iterates until they pass |
| Refactoring | Edit file by file | Describe the rule and review the changes in bulk |
| Documenting | Postponed task | Generated along with the change, under your review |
| Code review | You review other people's code | You review other people's code **and the agent's** |

## Your role changes

| Before | After |
|---|---|
| Typist and executor | The one who sets the goal, delegates and reviews |
| Value in knowing syntax by heart | Value in design, judgment and taste |
| Feedback in minutes or hours | Feedback in seconds; short iterations |
| One thing at a time | Several attempts and approaches explored quickly |

## Same work, two ways

Task: **validate the URL in the shortener before saving**.

**Before**
1. Open the handler and find where the URL is received.
2. Look up how to validate a URL in the language.
3. Write the validation and the error cases.
4. Write the tests, run them, adjust.
5. Review your own change and commit.

**After**
```
Validate the URL in @src/shorten.py before saving. Accept only http/https with a host,
reject everything else with a 400 error. Follow the style of @tests/test_shorten.py, write
the tests first and run the suite at the end.
```
You read the plan, approve it, read the diff, confirm the tests pass and commit.

The typing work shrank. The work of **thinking about what is right** and **checking** did not.

## What doesn't change

- Fundamentals: architecture, data structures, protocols, databases. Without them you can't review.
- **The responsibility is yours.** What goes into the commit is yours, whether you or the agent wrote it.
- Git, tests, review and good practices remain the safety net.

## Where the new workflow fails

| Risk | Defense |
|---|---|
| Confident but wrong answer | Require tests to run; read the diff |
| Accepting without understanding | If you can't explain the change, don't commit it |
| Change too big to review | Slice it into small steps |
| Polluted context, worse results | One session per topic; `/clear` |
| Your own skills atrophying | Keep reading code, asking for explanations and writing what matters |

## Exercise

1. Pick a small task from your backlog.
2. Write down how you would do it without the agent (steps and estimated time).
3. Do it with Claude Code, using a prompt with a goal and a success criterion.
4. Compare: where did you save time? Where did you have to correct the agent?

## Checklist

- [ ] I can say where the bottleneck moved
- [ ] I know what remains my responsibility
- [ ] I know three risks of the new workflow and the defense for each

**Next:** [02 · AI Native](02-ai-native.md)
