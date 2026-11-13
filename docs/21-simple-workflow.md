# 21 · Simple workflow: plan, build, review

_Last reviewed: 2026-11_

**Goal:** deliver a feature with 3 agents (planner, builder and reviewer) and approve at two points: after the plan and before the commit.

Example throughout the module: adding **custom aliases** to a URL shortener API (`POST /links` accepts an optional `alias`). In the exercise, use a feature from your own project.

## The three agents

| Agent | Where it runs | Job | Can edit? |
|---|---|---|---|
| **planner** | Subagent | Business rules, edge cases, steps with acceptance criteria | No |
| **builder** | Main session | Tests first, then code | Yes |
| **reviewer** | Subagent | Checks the diff against the plan and runs the tests | No |

The builder is the main session on purpose: it's where you watch, interrupt (`Esc`) and correct.

## Step by step

### 1. Install the agents

```bash
mkdir -p .claude/agents .claude/commands
cp templates/agents/simple/*.md .claude/agents/
cp templates/commands/quick-feature.md .claude/commands/
```

Templates: [planner](../templates/agents/simple/planner.md), [reviewer](../templates/agents/simple/reviewer.md), [/quick-feature](../templates/commands/quick-feature.md). Run `/agents` to confirm that they appear. Commit them: the whole team uses the same agents.

### 2. Plan

```
Use the planner agent to plan this feature: POST /links accepts an optional "alias" to use as the short code. Save the answer in plans/custom-alias.md.
```

**Approval point 1.** Read the plan. The planner should raise things like: allowed characters? case sensitive? alias already taken? reserved words (`health`, `links`)? Answer the open questions, edit the file and only then move on. A wrong rule here costs one line; after the code it costs a rewrite.

### 3. Build

```
Implement step 1 of plans/custom-alias.md. Write the tests for the acceptance criteria first and show me that they fail. Then implement until they pass and run the full suite.
```

One step at a time. If a step goes wrong, `git restore` and redo it with a better prompt.

### 4. Review

```
Use the reviewer agent to review the diff against plans/custom-alias.md.
```

The reviewer didn't write the code, starts with a clean context and **can't edit**: it only reports. If the verdict is `CHANGES REQUESTED`, ask the builder to fix the high and medium findings and call the reviewer again. **Two rounds at most**; after that, you decide.

### 5. Commit

**Approval point 2.** Read `git diff` yourself (the reviewer helps, but it doesn't replace you), check that the tests are green and commit the code together with the plan.

## All at once: `/quick-feature`

After you've done it by hand once, use the command, which chains the steps and stops at your approval points:

```
/quick-feature POST /links accepts an optional "alias" to use as the short code
```

## Common problems

| Symptom | Fix |
|---|---|
| The plan is too long or vague | The feature is too big: ask the planner to split it |
| The reviewer approves everything | Check that it ran the tests; require `file:line` in every finding |
| The reviewer invents problems | Reinforce in its file: "write No findings when there are none" |
| Endless fix loop | Respect the 2-round limit; the problem is probably in the plan |
| The builder changes things outside the plan | Add to the prompt: "only the files in step N" |

## Exercise

1. Install the agents and the command in a project of your own.
2. Deliver one feature by hand following steps 2 to 5, then another one with `/quick-feature`.
3. Write down one thing the reviewer caught that you would have missed, and one it missed. Improve its file accordingly.

## Checklist

- [ ] The planner and the reviewer appear in `/agents` and are committed
- [ ] I approved the plan before any code was written
- [ ] The tests were written before the implementation
- [ ] The reviewer ran the tests and gave a verdict with `file:line`
- [ ] I read the diff myself before committing

**Next:** [22 · Complete workflow I: from idea to tickets](22-complete-workflow-spec-tickets.md)
