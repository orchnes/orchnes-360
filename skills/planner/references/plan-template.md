# Plan template

```markdown
# Plan: <title>

## 1. Frame
- Goal:
- Success metric:
- Constraints:
- Non-goals:

## 2. Current system (relevant parts)
- Entry points: `path/...`
- Data flow: A → B → C
- Reusable patterns: `path/...` (why)
- Test coverage gaps:

## 3. Decision
| Option | Effort | Risk | Reversible |
|---|---|---|---|
| A | M | low | yes |
| B | S | high | no |
**Chosen:** A — because ...

## 4. Tasks
| ID | Task | Files | Acceptance criteria | Verify | Depends |
|---|---|---|---|---|---|
| T1 | Spike: ... | | | `cmd` | – |
| T2 | ... | | | `cmd` | T1 |

Parallelizable: T3, T4

## 5. Risks
| Risk | L | I | Mitigation |
|---|---|---|---|

## 6. Ship
- Tests: unit (...), integration (...), e2e (...)
- Rollout: flag `...`, order: ..., rollback: ...
- Monitoring: ...

## Open questions (need user decision)
1.
```
