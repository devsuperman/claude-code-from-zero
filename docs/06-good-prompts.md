# 06 · Writing good prompts

_Last reviewed: 2026-10_

**Goal:** write clear prompts: what to do, where, and how to know it's finished.

## The 4 elements

1. **Goal:** the expected outcome, not just the action.
2. **Scope:** where to make changes (and where not to).
3. **References:** files and existing patterns to follow (`@file`).
4. **Success criterion:** how to verify (test, command, behavior).

## Before and after

**1. Vague → specific**

❌ `Add tests for foo.py`

✅ `Write tests for @src/foo.py covering the case where the user is logged out. Follow the style of @tests/test_bar.py and avoid mocks. Run the suite at the end.`

**2. No criterion → verifiable**

❌ `Fix the login bug`

✅ `Users with uppercase emails can't log in. Reproduce with a failing test, fix the root cause (not the symptom) and confirm the test passes and the rest of the suite stays green.`

**3. No reference → following a pattern**

❌ `Create a calendar widget`

✅ `Look at how @components/HomeWidget.tsx is implemented and create a calendar widget following the same pattern. Only what's needed, no new libraries.`

**4. Implementing blind → exploring first**

❌ `Implement caching on the queries`

✅ `Before coding, read how queries are done today and propose 2 caching approaches with pros and cons. Don't change anything yet.`

## Techniques that work

- **Ask for a plan first** on non-trivial tasks (plan mode with `Shift+Tab`).
- **Split** big tasks into steps you can review.
- **Give examples** of the desired format or style.
- **Say what NOT to do** when there is risk (_"don't change the public API"_).
- **Let it ask:** _"If anything is ambiguous, ask before starting."_
- **Paste the full error**, not a paraphrase.
- **Correct early:** if the direction is wrong, `Esc` and redirect instead of waiting for it to finish.

## Pitfalls

- Correcting the same thing 3 times in the same session: the context is polluted. Use `/clear` and rewrite the prompt incorporating what you learned.
- Huge prompts with everything at once. Prefer stages.
- Accepting without reading. Review is your part of the work.

## Exercise

Take a real task from your backlog.

1. First write the "lazy" prompt and **don't** send it.
2. Rewrite it with the 4 elements.
3. Run it in plan mode, read the plan and adjust.
4. Run the implementation and check the success criterion.

Compare the result with what you would have gotten from the lazy prompt.

## Checklist

- [ ] My prompt has a goal, scope, reference and success criterion
- [ ] I used plan mode on a non-trivial task
- [ ] I know when to press `Esc` or `/clear` instead of insisting

**Next:** [07 · Starting on an existing project](07-existing-project.md)
