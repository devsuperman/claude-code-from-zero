---
description: Complete AI workflow - spec, tickets, tests, code, review gates, PR
argument-hint: <feature request or path to a request file>
---
Run the complete AI workflow for this feature: $ARGUMENTS

You are the orchestrator. Delegate each step to its agent, hand over FILE PATHS (never
summaries), and stop at every approval point. Don't commit to main, push or merge.

1. SPEC: use the analyst agent. Save its answer in `specs/<feature>.md`. Show me the
   business rules and the open questions, then STOP. When I answer, update the spec
   (ask the analyst again if the answers change rules) and wait for "spec approved".

2. TICKETS: use the ticket-writer agent with the spec path. Show me the ticket table,
   then STOP and wait for "tickets approved".

3. For EACH ticket, in order, on the feature branch:
   a. TESTS: use the test-writer agent with the ticket path. Check that the new tests
      fail for the right reason, then commit them: `test: <ticket> failing tests`.
   b. CODE: use the implementer agent with the ticket path. It must not change the tests.
   c. GATES: run the code-reviewer, security-reviewer and qa-verifier agents IN PARALLEL,
      giving each the ticket path, the base commit and the test commit. Save their
      answers in `reviews/<feature>/<ticket>.md`.
   d. If any verdict is CHANGES REQUESTED or FAILED: give the implementer the high,
      medium and critical findings and repeat c. Maximum 2 rounds; after that, STOP and
      show me what is still open.
   e. When all gates pass, commit: `feat: <ticket title>`. Show me a one-line status and
      move to the next ticket.

4. PR: use the pr-writer agent with the spec, tickets and review files. Show me the
   description and STOP. Open the PR only after I say "open the PR". Never merge it.
