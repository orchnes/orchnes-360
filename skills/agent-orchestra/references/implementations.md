# Implementations

Verify current features in each tool's docs; this file describes patterns, not guarantees.

## Claude Code
- Main session = orchestrator. Spawn subagents per task with a model override (cheaper models for T2/T3) and pass the task contract as the prompt.
- Custom subagent definitions (`.claude/agents/*.md`) can fix a role's tools and model — e.g. a read-only `researcher` on a small model.
- Run independent subagents in parallel; use git worktrees to isolate parallel builders.
- Keep the run log and task board in `.memory/`.

## Codex and other coding agents
- Orchestrator session writes contracts to `.memory/tasks/T*.md`; worker sessions (possibly on cheaper models) pick a task, mark it claimed, write output and evidence back.
- Same contract and verdict formats, so tools can be mixed (e.g. Claude orchestrating, Codex building, a local model summarizing).

## Direct API orchestration (any provider)
- Use a model gateway to reach many providers through one API (e.g. LiteLLM, OpenRouter) and local runtimes (e.g. Ollama, llama.cpp, vLLM) for free/private T3 work.
- Minimal loop:
```text
plan = orchestrator.decompose(goal)
for task in plan.ready_tasks():               # parallel where independent
    model = route(task)                       # routing-matrix + acceptance history
    out = run(model, contract(task))
    verdict = review(task, out)               # automated checks, then T1
    log(task, model, verdict, cost)
    handle(verdict)                           # accept / revise / reassign up a tier
report(user)
```
- This loop is what the planned Rust runtime (see ROADMAP) implements as a 24/7 service with queues, budgets, notifications and audit logs.
