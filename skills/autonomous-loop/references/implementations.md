# Implementations

The skill is tool-agnostic. Below are ways to wire the worker/supervisor split.

## Claude Code

- The main session acts as **worker** on a mid-tier model.
- Escalate by spawning a subagent with a tier-1 model override and passing only the escalation packet.
  The subagent must answer in the supervisor reply format.
- Use a `/loop` command or a Stop hook to keep iterating until `STATUS: DONE`.
- Long test suites: run in the background and continue when they finish instead of polling.

## Direct API orchestration (any provider)

```text
state = load(LOOP_STATE.md)
supervisor_approve(plan)
while state.iterations < budget:
    result = worker_step(state)            # cheap model, tool use
    state.log(result)
    if done_criteria_pass(): break
    if stalled(state.log): advice = supervisor(escalation_packet(state)); apply(advice)
supervisor_signoff(final_diff, test_output)
```

`stalled()` = same error signature ×3, oscillating diff, or no test-count progress ×3.

## Other agents (Cursor, Copilot agent, Codex-style CLIs, Gemini CLI, Aider, ...)

If the tool can't switch models mid-session, run two sessions:
the worker session iterates; paste the escalation packet into a tier-1 session and paste
the supervisor reply back. The protocol and reply format stay the same.
