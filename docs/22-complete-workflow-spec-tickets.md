# 22 · Complete workflow I: from idea to tickets

_Last reviewed: 2026-11_

**Goal:** turn a request written by a non-developer into an approved spec and small tickets with acceptance criteria, before any code exists.

Example in modules 22 to 25: **expiring links that their owner can delete** in the shortener from the [running project](../examples/README.md). It meets the [signals](20-ai-workflows.md#which-one-to-use) for the complete workflow: rules come from product, there are several tickets and it touches a public endpoint with a secret token.

## The two agents

| Agent | Job | Tools | Output |
|---|---|---|---|
| [analyst](../templates/agents/complete/analyst.md) | Business rules, examples, edge cases, open questions | Read-only | `specs/<feature>.md` |
| [ticket-writer](../templates/agents/complete/ticket-writer.md) | Small, ordered tickets with Given/When/Then | Writes only in `tickets/` | `tickets/<feature>/*.md` |

Install all 8 agents of the complete workflow at once:

```bash
mkdir -p .claude/agents
cp templates/agents/complete/*.md .claude/agents/
```

## Step by step

### 1. Save the request as it came

Create `requests/link-expiration.md` with the original text, without "fixing" it:

> Links should be able to expire. People who create a link should be able to delete it later. Free users can't keep links forever.

The original text is the reference when someone asks "who decided this?".

### 2. Run the analyst

```
Use the analyst agent on requests/link-expiration.md. Save its answer in specs/link-expiration.md.
```

A good spec lists rules **and** doubts. The analyst should ask things like:

- Expire by date, by number of clicks, or both? What is the maximum ("forever" = ?)
- What does an expired link return: 404 or 410? Is the code freed for reuse?
- How does the owner prove they own the link if there is no login? (a delete token?)
- What happens to links created before this feature?

### 3. Answer the open questions (approval point 1)

Subagents can't talk to you; the main session brings you the questions. Answer them in the chat:

```
Answers: Q1 date only, maximum 30 days, default 30. Q2 410, the code is never reused. Q3 a delete token returned once at creation. Q4 old links get expires_at = migration date + 30 days. Update the spec.
```

Read the final spec as if you were the product owner: **every rule must be testable**. "Links should be fast" isn't a rule; "redirect responds in under 100 ms" is. Commit the spec.

### 4. Generate the tickets

```
Use the ticket-writer agent with specs/link-expiration.md.
```

Expected result, something like:

| Ticket | Title | Rules |
|---|---|---|
| 01 | Links have `expires_at` (default and maximum 30 days) | R1, R2 |
| 02 | Expired links return 410 | R3, R4 |
| 03 | Delete with token returned at creation | R5, R6, R7 |
| 04 | Migration for existing links | R8 |

### 5. Review the tickets (approval point 2)

| Check | Bad sign |
|---|---|
| Size | A ticket you couldn't review in about 15 minutes |
| Vertical slice | "Create the table" with no behavior to test |
| Criteria | "Works correctly" instead of Given/When/Then |
| Coverage | A rule from the spec that is in no ticket |
| Order | Ticket 01 depends on something that comes later |

Ask for fixes in the chat ("split 03 into create token and delete") and commit the tickets.

## Optional: tickets as GitHub issues

If the team works with issues, connect GitHub (via the `gh` CLI or an MCP server, module 17) and ask: _"Create one issue per file in tickets/link-expiration/, with the content as the body."_ Keep the files: the next agents read them.

## Exercise

1. Write a vague 3-line request for a feature in your project, like the one above.
2. Run the analyst, answer its questions and approve the spec.
3. Generate the tickets and fix at least one problem from the table in step 5.

## Checklist

- [ ] The original request is saved without edits
- [ ] Every rule in the spec is testable and has an example
- [ ] I answered every open question, and the spec shows the answers
- [ ] Every rule appears in at least one ticket
- [ ] Each ticket is small, vertical and has Given/When/Then criteria

**Next:** [23 · Complete workflow II: tests and code](23-complete-workflow-tests-code.md)
