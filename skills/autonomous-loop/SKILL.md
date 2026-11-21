---
name: autonomous-loop
description: Run an agent autonomously in a goal-driven loop until measurable done-criteria pass, using a cheap/fast worker model for the iterations and escalating to a top-ranked supervisor model only for analysis, correct patterns and test design. Use when the user asks to "keep going until it works", "run until tests pass", "work autonomously", "loop until done", or wants to cut cost by letting a strong model supervise a cheaper one. Includes stop conditions and no-progress detection so the loop can never spin forever.
license: MIT
---

# Autonomous Loop (Worker + Supervisor)

Goal: reach a verifiable outcome with minimal expensive-model tokens.
The **worker** does all the typing. The **supervisor** only thinks, at checkpoints.

## Roles

| Role | Model tier | Does | Never does |
|---|---|---|---|
| Worker | cheap/fast (tier 2–3) | edits, runs commands, runs tests, updates state file | redefines the goal, declares done without proof |
| Supervisor | top-ranked (tier 1) | approves plan, diagnoses stalls, shows the correct pattern, designs tests, signs off | writes the bulk of the code, runs long iterations |

Map tiers to concrete models in `references/model-tiers.md`. If only one model is available, play both roles but keep the supervisor checkpoints as explicit, separate review passes.

## Step 0 — Contract (before any loop)

Write `LOOP_STATE.md` (template: `references/state-template.md`) with:
1. **Goal** — one sentence.
2. **Done criteria** — machine-checkable: a command that exits 0, tests that pass, a metric threshold. No vague criteria ("looks good").
3. **Budget** — max iterations (default 15), max supervisor calls (default 4), time/token cap if known.
4. **Scope fence** — files/dirs the worker may touch.

If the done criteria are not checkable, ask the supervisor to write the test first. **No test, no loop.**

## Step 1 — Supervisor checkpoint: plan approval

Send the supervisor only: goal, done criteria, relevant file list, and a ≤15-line worker plan.
Supervisor replies in the fixed format below. Worker proceeds only after approval.

## Step 2 — Worker iteration (repeat)

Each iteration is small and ends with verification:
1. Pick the next single step from the plan.
2. Make the change (smallest diff that could work).
3. Run the done-criteria command (or the fastest relevant subset).
4. Append one line to the log in `LOOP_STATE.md`: `#n | step | result | error signature`.
5. Done criteria pass → go to Step 4. Otherwise continue.

Keep iterations cheap: read only what the step needs, never re-read unchanged files, summarize long output to the error signature.

## Step 3 — Stall detection → escalate

Escalate to the supervisor immediately when **any** is true:
- Same error signature in 3 consecutive iterations.
- A diff is reverted or re-applied (oscillation A→B→A).
- 3 iterations with no change in passing-test count.
- Worker is about to touch files outside the scope fence.
- Worker is unsure *why* something works or fails.

Escalation packet (keep it short — this is where tokens are saved):
- Goal + done criteria
- Last 5 log lines
- The failing output, trimmed to the essential 20–40 lines
- The smallest relevant code excerpt(s)
- What has already been tried

## Supervisor reply format (always)

```
DIAGNOSIS: <root cause in 1–3 sentences, with evidence>
CORRECT PATTERN: <the idiom/approach to use; short code sketch if needed>
TEST: <test to add or change that proves the fix>
NEXT STEPS: <1–3 concrete worker steps>
STOP?: continue | change approach | abort (reason)
```

The supervisor must not produce a full implementation unless the worker failed twice on the same pattern.

## Step 4 — Done verification (supervisor sign-off)

Before declaring success:
1. Worker runs the full done-criteria command fresh and pastes the result.
2. Supervisor reviews the final diff for: shortcuts (skipped/deleted tests, hardcoded outputs, disabled checks), scope violations, obvious regressions.
3. Only then mark `STATUS: DONE` in `LOOP_STATE.md`.

## Hard stop conditions

Stop and report to the user (never silently continue) when:
- Iteration budget or supervisor-call budget is exhausted.
- Supervisor says `abort`.
- The fix requires credentials, destructive actions, or decisions only the user can make.

Final report: status, what passed, what did not, log summary, recommended next step.

## Anti-patterns

- Deleting or weakening tests to make the loop "pass".
- Calling the supervisor every iteration (defeats the cost model).
- Sending whole files or full logs to the supervisor.
- Changing the done criteria mid-loop without user approval.
- Retrying the identical action after a failure.

For tool-specific setup (Claude Code subagents, API orchestration, other agents) see `references/implementations.md`.
