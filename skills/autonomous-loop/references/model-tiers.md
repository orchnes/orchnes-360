# Model Tiers

Tiers are defined by role, not by vendor. Rankings change often — check a current
public leaderboard (e.g. LMArena, Artificial Analysis, SWE-bench) and update this table.

| Tier | Use for | Selection rule |
|---|---|---|
| 1 — Supervisor | plan approval, root-cause diagnosis, correct patterns, test design, final sign-off | highest-ranked reasoning/coding model you can afford |
| 2 — Worker | normal iterations: edits, test runs, refactors | strong but clearly cheaper than tier 1 |
| 3 — Scout | file search, log summarizing, boilerplate | fastest/cheapest model available |

## Cost rule of thumb

Target: supervisor tokens ≤ 15% of total loop tokens.
If supervisor share exceeds ~30%, the escalation packets are too large or escalation is too frequent.

## Example mapping (edit for your stack)

| Tier | Example |
|---|---|
| 1 | your provider's top "opus/pro/ultra"-class model |
| 2 | the provider's mid "sonnet/flash"-class model |
| 3 | the provider's small "haiku/mini/lite"-class model or a local model |

Mixing vendors is fine: e.g. a local open-weights worker with a hosted tier-1 supervisor.
