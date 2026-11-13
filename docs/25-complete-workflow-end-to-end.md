# 25 · Complete workflow IV: end to end

_Last reviewed: 2026-11_

**Goal:** close the workflow with the PR, run all of it with one command, protect the merge with a hook, and control the cost.

## 1. The PR writer

The [pr-writer](../templates/agents/complete/pr-writer.md) reads the spec, tickets, commits and review files and writes a description a reviewer can understand without having followed the work. It **doesn't** open or merge anything.

```
Use the pr-writer agent with specs/link-expiration.md, tickets/link-expiration/ and reviews/link-expiration/. Base: main.
```

Read it (approval point 3), then open the PR yourself or ask: _"Open the PR with this description."_

## 2. Everything with one command: `/feature`

```bash
mkdir -p .claude/commands
cp templates/commands/feature.md .claude/commands/
```

```
/feature requests/link-expiration.md
```

The [command](../templates/commands/feature.md) makes the main session the **orchestrator**: it calls each agent, hands over file paths, runs the gates in parallel and stops at your approval points:

| Stop | You say |
|---|---|
| Spec with open questions | Answers, then "spec approved" |
| Ticket table | "tickets approved" |
| 2 review rounds without passing | A decision |
| PR description | "open the PR" |

Do the steps by hand (modules 22 to 24) at least once before using the command: you need to know what each step should produce to notice when one goes wrong.

## 3. Guard the merge with a hook

Instructions in a prompt can be ignored; a **hook** can't. This one blocks `gh pr merge`, force pushes and pushes to `main`, so the final merge is always human:

```bash
mkdir -p .claude/hooks
cp templates/hooks/block-merge.sh .claude/hooks/ && chmod +x .claude/hooks/block-merge.sh
```

In `.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [{ "type": "command", "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/block-merge.sh" }]
      }
    ]
  }
}
```

The [script](../templates/hooks/block-merge.sh) receives the command as JSON and exits with code 2 to block it. Module 17 (coming soon) and the [official docs](https://docs.claude.com/en/docs/claude-code/hooks) cover hooks in depth.

## 4. The gates in CI (headless)

The review gates also work without a human in front of the terminal, for example on every PR:

```bash
claude -p "Run the code-reviewer and security-reviewer agents on the diff against origin/main. Print their verdicts and findings." \
  --allowedTools "Read,Grep,Glob,Bash(git diff:*),Bash(git log:*)"
```

Post the result as a PR comment and fail the job on `CHANGES REQUESTED` if you want a hard gate. Give CI **only read tools**: nobody is there to approve anything. Module 18 (coming soon) covers headless mode.

## 5. Cost and model per agent

8 agents × several tickets × up to 2 rounds is a lot of tokens. Control it:

- **Model per agent:** add `model:` to the frontmatter (`haiku`, `sonnet`, `opus` or `inherit`). Use a stronger model where judgment matters (analyst, security-reviewer, implementer) and a cheaper one for mechanical work (ticket-writer, pr-writer).
- **Measure:** compare `/cost` for a feature with the simple workflow and with the complete one.
- **Scale down:** skip QA on a change with no behavior, skip the analyst when the rules are already clear. If most features skip half the agents, use the [simple workflow](21-simple-workflow.md).

## 6. Improve the agents

Each agent is a file in git: treat it like code. When a gate misses a bug or an agent repeats a mistake, add one line to its instructions and commit it. Review the agents every few features, as you do with the `CLAUDE.md`.

## Exercise

1. Install the command and the hook, and deliver a full feature with `/feature`.
2. Ask Claude to merge the PR and confirm that the hook blocks it.
3. Run the CI command from section 4 locally on your branch.
4. Write down the feature's cost and one change you'll make to an agent.

## Checklist

- [ ] I delivered a feature with `/feature`, stopping at every approval point
- [ ] The hook blocks merges and pushes to `main`
- [ ] I know how to run the gates headless with only read tools
- [ ] I chose a model for each agent based on the kind of work
- [ ] I improved at least one agent from what I learned

**Next:** back to the [course index](../README.md)
