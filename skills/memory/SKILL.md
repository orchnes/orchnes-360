---
name: memory
description: Persistent, token-cheap memory across sessions, agents and models — what was decided, what is done, where work stopped, what the next step is, and stable facts about the project and the user. Agents resume from the last open point instead of restarting or re-asking. Use at the start and end of every multi-session task, when the user says "remember", "continue", "where were we", "we already decided this", "don't start over", or when a session may be interrupted.
license: MIT
---

# Memory

Memory exists so no agent ever starts from zero, re-asks a settled question, or redoes finished work.

## 1. Layout (plain Markdown files, any tool can read them)
```
AGENTS.md / CLAUDE.md      # always-loaded index: ≤ 80 lines, stable facts + pointers (tool reads it automatically)
.memory/
├── state.md               # where we are: goal, done, in progress, NEXT step, blockers   ← most important
├── decisions.md           # settled decisions with date and reason (append, supersede — never silently edit)
├── facts.md               # verified project facts: commands, architecture, environments, conventions
└── user.md                # user preferences: language, level, tone, constraints (only what they shared)
```
Templates: `references/templates.md`. Tool-specific locations (Claude Code, Codex, others): `references/integrations.md`.
Create only the files you need; small projects may need just `state.md`.

## 2. Session start (always, before other work)
1. Read the index file and `.memory/state.md`. Read other memory files only when relevant to the task.
2. State in one line where things stand and what you'll do next — then do it. Don't ask the user to re-explain.
3. If memory conflicts with what you observe (code, files, outputs), **observation wins**; fix the memory.

## 3. Checkpoint (during work — don't wait for the end)
Update `state.md` after each meaningful step: task finished, decision made, blocker hit, before any long or risky operation.
Sessions can die at any moment; the last checkpoint is all the next agent gets.

## 4. What to save
Save only what is **durable, verified and not cheaply re-derivable**:
- Decisions and their reasons ("chose Postgres over MongoDB: relational orders, team knows SQL").
- Progress: done / in progress / next / blocked-on.
- Facts discovered with effort: the working build command, a non-obvious gotcha, an environment quirk.
- User preferences they expressed ("answers in Turkish", "Rust-first", "no long summaries").

## 5. What never to save
- Secrets: passwords, tokens, keys, connection strings with credentials. Store *where* a secret lives, never its value.
- Raw logs, full outputs, large code excerpts — summarize to the essential line with a file path.
- Things obvious from the code or the conversation that will be re-read anyway.
- Guesses. Unverified items are marked `(unverified)` or left out.
- Sensitive personal data (health, finances, identity) unless the user explicitly asks to store it.

## 6. Writing rules
- **Update, don't append duplicates.** One fact, one place. Rewrite stale lines.
- **Date entries** that can go stale (`2026-11-21`). Prune what's obsolete when you touch a file.
- **Short lines, scannable.** Memory is read every session — every line costs tokens forever.
- **Decisions are never silently changed.** A new decision supersedes an old one with a reference: `D7 supersedes D3`.
- Keep the index file small; move detail into `.memory/` and point to it.

## 7. Multiple agents
- One shared `state.md`; each entry tagged with the agent/role (`[worker]`, `[supervisor]`, `[research]`).
- Claim a task before working on it (`in progress — [agent] since <time>`) to avoid duplicate work.
- Only the coordinating agent (or the user) edits `decisions.md`; others propose.

## 8. User control
The user can read, edit or delete any memory file. When they say "forget X", remove it everywhere and confirm.
Ask before storing anything personal they didn't clearly intend to be remembered.

## Self-check at session end
- Would a fresh agent know exactly what to do next from `state.md` alone?
- Is anything secret, stale or duplicated in memory? Remove it.
