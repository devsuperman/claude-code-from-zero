# 23 · Complete workflow II: tests and code

_Last reviewed: 2026-11_

**Goal:** implement each ticket with two separate agents: one writes failing tests from the criteria, the other writes the code to make them pass, without touching the tests.

## Why two agents

When the same agent writes the code and the tests, the tests tend to confirm **what the code does**, bugs included. Splitting the roles gives you:

| Test-writer | Implementer |
|---|---|
| Reads the ticket, **not** the solution | Reads the ticket **and** the failing tests |
| Tests behavior through the public interface | Free to choose how to build it |
| Only edits test files | **Never** edits the tests |
| Success: tests fail for the right reason | Success: tests pass, full suite green |

Templates: [test-writer](../templates/agents/complete/test-writer.md) and [implementer](../templates/agents/complete/implementer.md).

In the simple workflow the builder was the main session. Here the implementer is a **subagent**: with 4 or more tickets, the main session would fill up with logs. It stays clean and only coordinates.

## Step by step (for each ticket)

### 1. Write the failing tests

```
Use the test-writer agent with tickets/link-expiration/02-expired-returns-410.md.
```

Check its table: one test per criterion, each failing **for the right reason**:

| Failure | OK? |
|---|---|
| `assert 302 == 410` | Yes, the behavior is missing |
| `ImportError`, `fixture not found` | No, the test is broken |
| Test passes already | No, it tests nothing new (or the feature already exists) |

### 2. Commit the tests

```bash
git add tests/ && git commit -m "test: 02 failing tests for expired links"
```

This commit is a **reference point**: anyone can check later whether the implementer changed the tests (`git diff <test-commit> -- tests/`). The code-reviewer in module 24 does exactly that.

### 3. Implement

```
Use the implementer agent with tickets/link-expiration/02-expired-returns-410.md. The tests are in commit <hash>.
```

Read its answer, especially **"decisions the ticket didn't specify"**. A decision there that changes behavior (e.g. "expired links are deleted from the database") is a gap in the spec: go back to the analyst, don't accept it silently.

### 4. Check before the gates

```bash
git diff <test-commit> -- tests/   # must be empty
```

Then run the tests yourself. Green? The ticket goes to the review gates ([module 24](24-complete-workflow-review-gates.md)).

## When the implementer says a test is wrong

The implementer is told to **stop** instead of changing a test. Then you decide:

- The test is wrong (it doesn't match the criterion): ask the **test-writer** to fix it, commit again.
- The criterion is wrong: fix the **ticket** (and the spec, if a rule changes), then the tests.
- The test is right and hard to pass: the implementer keeps trying, maybe with a hint from you.

The rule: tests change because the **requirement** changed, never because the code couldn't pass them.

## Common problems

| Symptom | Fix |
|---|---|
| Tests copy the implementation's details (mocks of private functions) | Reinforce "test through the public interface" in the test-writer |
| Implementer changes a test "just a little" | Step 4 catches it; reject and run again |
| Implementer refactors half the project | Reinforce "only what the ticket needs"; reject the diff |
| A ticket takes many rounds | The ticket is too big; split it with the ticket-writer |

## Exercise

1. Take the first ticket from module 22 and run steps 1 to 4.
2. Make the test-writer produce a test that fails for the wrong reason (e.g. a ticket that names a function that doesn't exist yet) and see how it fixes it.
3. Check with `git diff <test-commit> -- tests/` that the implementer didn't touch the tests.

## Checklist

- [ ] Every acceptance criterion has a test, and every test failed before the code
- [ ] The failing tests have their own commit
- [ ] The implementer didn't change the tests (checked with `git diff`)
- [ ] I read the implementer's unspecified decisions
- [ ] The full suite and the linter are green

**Next:** [24 · Complete workflow III: review gates](24-complete-workflow-review-gates.md)
