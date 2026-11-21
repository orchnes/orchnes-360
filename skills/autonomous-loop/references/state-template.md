# LOOP_STATE.md template

Copy into the project root (or a scratch dir) at Step 0. Keep it short; it is re-read every iteration.

```markdown
# LOOP_STATE
STATUS: RUNNING            # RUNNING | ESCALATED | DONE | STOPPED

## Goal
<one sentence>

## Done criteria
- [ ] `<command>` exits 0
- [ ] <metric> >= <threshold>

## Budget
iterations: 0 / 15
supervisor calls: 0 / 4

## Scope fence
allowed: src/feature/**, tests/feature/**
forbidden: migrations/**, CI config

## Plan (supervisor-approved)
1. ...
2. ...

## Log
#  | step                     | result | error signature
1  | add parser stub          | FAIL   | TypeError: x is undefined (parser.ts:42)
2  | init x in constructor    | PASS 3/5 | -

## Supervisor notes
- (#0) approved plan; watch for timezone handling
```
