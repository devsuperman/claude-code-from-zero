# 24 · Complete workflow III: review gates

_Last reviewed: 2026-11_

**Goal:** check each ticket with three independent agents running in parallel (code, security and QA), and fix their findings with a limit on rounds.

## The three gates

| Agent | Question it answers | How |
|---|---|---|
| [code-reviewer](../templates/agents/complete/code-reviewer.md) | Is the code correct, tested and in scope? | Reads the diff, runs the tests, checks the tests weren't changed |
| [security-reviewer](../templates/agents/complete/security-reviewer.md) | Can this be abused? | Follows each new input to where it goes |
| [qa-verifier](../templates/agents/complete/qa-verifier.md) | Does it work for a real user? | Runs the app and tries the criteria and edge cases |

None of them can edit the project. Each starts with a clean context and gets the same three things: **the ticket path, the base commit and the test commit**.

## Why parallel and separate

- **Parallel:** they only read and don't depend on each other, so you wait for the slowest one, not the sum.
- **Separate:** one agent with a list of 30 items checks each item superficially. Three agents with 8 items each go deeper, and the security one doesn't get distracted by naming.
- **Different evidence:** the reviewers read code; QA sees the behavior. A bug can look fine in the diff and fail on `curl`.

## Step by step

### 1. Run the gates

```
Run the code-reviewer, security-reviewer and qa-verifier agents in parallel for tickets/link-expiration/03-delete-with-token.md. Base: main. Test commit: <hash>. Save the three answers in reviews/link-expiration/03.md.
```

### 2. Read the verdicts

Expected in ticket 03 (delete with token), for example:

| Gate | Verdict | Example finding |
|---|---|---|
| code | APPROVED | [low] `links.py:88`: name `tok` → `delete_token` |
| security | CHANGES REQUESTED | [high] `links.py:41`: token stored in plain text; compare with `==` (timing) |
| qa | FAILED | [medium] `DELETE` twice returns 500 instead of 404 |

### 3. Fix, at most 2 rounds

```
Use the implementer agent to fix the critical, high and medium findings in reviews/link-expiration/03.md. Don't change the tests.
```

Then run the gates again. **Low findings** don't start a new round: list them and fix them together, or leave them for later.

After **2 rounds** without everything passing, stop. A loop usually means:

- the agents disagree (e.g. code-reviewer wants simpler, security wants more checks): **you** decide;
- the requirement is unclear: go back to the spec;
- the finding is wrong: record why you're ignoring it in the review file.

### 4. A finding that should become a test

A real bug found by QA or security means a test was missing. Ask the **test-writer** for a test that reproduces it (and fails), then the implementer fixes it. This way the bug never comes back.

### 5. Commit

All gates passed? Commit the ticket (`feat: 03 delete links with token`) with its review file, and move to the next ticket.

## Is the gate trustworthy?

The agents can be wrong in both directions. Calibrate them:

- **Approves everything:** check that it ran the tests; require `file:line` and evidence in every finding.
- **Invents problems:** ask for the evidence; reinforce "write No findings when there are none".
- **Plant a bug** from time to time (e.g. remove a validation) and see whether the gates catch it.

The gates reduce what reaches you; they don't replace your review in module 25.

## Exercise

1. Run the three gates on the ticket you implemented in module 23.
2. Fix the findings in at most 2 rounds, turning at least one bug into a test.
3. Plant a bug (e.g. remove an input validation) and check which gate catches it.

## Checklist

- [ ] The three gates ran in parallel with the same ticket, base and test commit
- [ ] Each verdict has evidence (`file:line`, command, result)
- [ ] I stopped at 2 rounds or less
- [ ] Every real bug found became a test
- [ ] I tested the gates with a planted bug

**Next:** [25 · Complete workflow IV: end to end](25-complete-workflow-end-to-end.md)
