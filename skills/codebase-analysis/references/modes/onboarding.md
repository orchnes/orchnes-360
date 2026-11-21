# Mode: Onboarding guide

Audience: a new developer (or a new agent session) who must make a first change within a day.

## Questions to answer
1. What does this project do and for whom? (2–3 sentences)
2. How do I install, configure, run, test and build it? (verified commands)
3. How is the code organized? (map with one line per top-level dir)
4. How does one typical request/action flow through the code?
5. Where do I change X? (common tasks → files)
6. What are the conventions? (naming, error handling, testing, commit/PR style)
7. What are the gotchas? (surprising behavior, fragile areas, required env vars, slow tests)

## How
- **Run the setup yourself** where possible; record exact commands and what failed. Unverified commands are marked as such.
- Derive conventions from the code and config (linters, formatters, CI), not personal preference.
- Pick a real, small recent commit/PR and explain it as a worked example of "how a change looks here".

## Report template
```markdown
# <Project> — Developer Guide

## What it is
...

## Quick start (verified ✔ / unverified ?)
```bash
<install>   # ✔
<run>       # ✔
<test>      # ✔
```
Required env vars: `DATABASE_URL` (see `.env.example`), ...

## Code map
| Path | What lives here |
|---|---|

## How a request flows
`routes/orders.ts:14` → `services/order.ts:52` → `repo/order.ts:30` → DB

## Where to change things
| Task | Files |
|---|---|
| Add an API endpoint | ... |
| Add a DB column | migration in ..., model in ... |

## Conventions
...

## Gotchas
...
```
This guide is a good candidate for the project's persistent memory file (e.g. `CLAUDE.md`, `AGENTS.md`) — keep a short version there.
