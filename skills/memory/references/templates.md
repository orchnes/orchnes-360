# Memory templates

## Index file (AGENTS.md / CLAUDE.md) — ≤ 80 lines
```markdown
# <Project>
<one-line purpose>

## Commands
- install: `...`   run: `...`   test: `...`   lint: `...`

## Key facts
- Stack: ...
- Architecture: see `.memory/facts.md`

## Memory
- Current state and next step: `.memory/state.md` — read first
- Decisions: `.memory/decisions.md`
- User preferences: `.memory/user.md`

## Rules
- <project-specific rules the agent must always follow>
```

## .memory/state.md
```markdown
# State — updated 2026-11-21 14:30 [agent]

## Goal
<one sentence>

## Done
- [x] Repo scaffold, CI validate (commit abc123)
- [x] Payment provider chosen → D4

## In progress
- [ ] Checkout API — [worker] since 14:10 — tests 3/5 passing

## NEXT
1. Fix currency rounding in `checkout/total.rs:42` (failing test `total_with_vat`)
2. Then: webhook handler

## Blocked on
- Payment provider sandbox key — user must create (asked 2026-11-21)

## Notes for next session
- Staging DB resets nightly at 03:00 UTC
```

## .memory/decisions.md
```markdown
# Decisions

| ID | Date | Decision | Reason | Status |
|---|---|---|---|---|
| D1 | 2026-11-02 | Rust (axum) backend | performance, user preference | active |
| D3 | 2026-11-10 | Host on a single VPS | < 1k users expected in year 1 | superseded by D7 |
| D7 | 2026-11-20 | Managed Postgres + VPS app server | backups/failover without ops burden | active |
```

## .memory/facts.md
```markdown
# Facts (verified)
- Build needs `protoc` installed (`build.rs` fails otherwise) — 2026-11-05
- Tests require `DATABASE_URL` pointing to a disposable DB; see `.env.example`
- `legacy/` is dead code, scheduled for removal (D5)
```

## .memory/user.md
```markdown
# User preferences
- Language: Turkish in chat, English in code and docs
- Level: expert in IT/security; explain business/legal topics simply
- Style: short answers, no recap summaries, evidence for "done"
- Tech: Rust-first, free/open-source first
```
