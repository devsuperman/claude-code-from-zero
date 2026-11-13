---
description: Simple AI workflow - plan, build, review a feature
argument-hint: <feature description>
---
Run the simple AI workflow for this feature: $ARGUMENTS

1. PLAN: use the planner agent to create a plan for the feature. Save its answer in
   `plans/<short-feature-name>.md`. Then STOP: show me the business rules, open questions
   and steps, and wait for my approval. Don't write code before I approve.

2. BUILD (after my approval): for each step in the plan, in order:
   - write the tests for the acceptance criteria first and run them (they must fail);
   - implement until they pass;
   - run the full test suite and the linter.

3. REVIEW: use the reviewer agent, giving it the plan file path. If the verdict is
   CHANGES REQUESTED, fix the high and medium findings and call the reviewer again.
   Maximum 2 review rounds; after that, stop and show me what is still open.

4. FINISH: show me a summary: steps done, test results, the reviewer's final verdict and
   any low findings left. Don't commit; I review the diff and commit myself.
