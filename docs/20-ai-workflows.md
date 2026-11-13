# 20 · AI workflows: the map

_Last reviewed: 2026-11_

**Goal:** understand why splitting work between specialized agents gives better results, and choose between a simple workflow and a complete one.

## In one sentence

Instead of one agent doing everything in one long conversation, each **agent** has one job, the tools it needs and a written result that it hands to the next one, and **you approve at defined points**.

## Subagents in 1 minute

A **subagent** is a Markdown file in `.claude/agents/` with instructions and a list of allowed tools. The main session hands it a task; it works in its **own context** and returns only its result.

```markdown
---
name: reviewer
description: Reviews the current diff. Use after implementing, before committing.
tools: Read, Grep, Glob, Bash
---
You review only the current diff... (instructions)
```

Create and list them with `/agents`. Call one by name: _"Use the reviewer agent to review the diff."_ Module 16 (coming soon) goes deeper; the [official docs](https://docs.claude.com/en/docs/claude-code/sub-agents) have every field.

## Why separate agents

| Problem with one agent | How separation fixes it |
|---|---|
| The context fills with logs and dead ends | Each agent starts clean and returns only its result |
| It checks its own work and sees what it expects | **The agent that checks never wrote the code** |
| It has every permission all the time | Each agent gets only the tools it needs (the reviewer can't edit) |
| Decisions get lost in the chat | Each step hands over a **file** (plan, tickets, findings) |

## Two levels

**Simple workflow (3 agents)**, module [21](21-simple-workflow.md):

```
Idea ─▶ planner ─▶ plan ─▶ [you approve] ─▶ builder ─▶ diff + green tests ─▶ reviewer ─▶ [you approve: merge]
```

**Complete workflow (8 agents)**, modules [22](22-complete-workflow-spec-tickets.md) to [25](25-complete-workflow-end-to-end.md): each simple agent splits into specialists.

| Simple | Complete |
|---|---|
| planner | analyst (business rules) + ticket-writer |
| builder | test-writer + implementer |
| reviewer | code-reviewer + security-reviewer + qa-verifier |
| *(you)* | + pr-writer |

## Which one to use

Start with the **simple** one. Move up to the **complete** one when two or more of these apply:

- the business rules are unclear or come from people who aren't developers;
- the feature needs more than about 3 tickets or several days of work;
- it touches authentication, payments, personal data or public endpoints;
- several people review or share the work;
- a bug in production is expensive.

For a typo or a one-line fix, use neither: a normal session is enough.

## Rules for both levels

1. **The checker never wrote it.** Review and QA are always done by another agent, and finally by you.
2. **Hand over files, not chat.** Each agent reads the previous agent's file, never a summary of a summary.
3. **Approve at fixed points:** after the plan and before the merge, at least.
4. **Cap the fix rounds.** Two review rounds without converging? Stop and decide yourself.
5. **Start small and split later.** Split an agent only when it becomes a bottleneck.

## Exercise

1. Pick three recent tasks of yours. For each one, decide: normal session, simple workflow or complete workflow? Justify with the list above.
2. Run `/agents` and look at the screen for creating an agent (don't create one yet).

## Checklist

- [ ] I can explain why the checker shouldn't be the agent that wrote the code
- [ ] I know what a subagent is and where its file lives
- [ ] I can map each simple agent to its specialists in the complete workflow
- [ ] I know the signals for moving up from simple to complete

**Next:** [21 · Simple workflow](21-simple-workflow.md)
