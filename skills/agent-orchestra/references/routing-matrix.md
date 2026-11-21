# Routing matrix

Tiers — always written T1/T2/T3; task ids are written TASK-n to avoid confusion (see also `autonomous-loop` model tiers): **T1** top-ranked · **T2** strong mid-cost · **T3** small/free/local.
Rankings change — check a current leaderboard (LMArena, Artificial Analysis, SWE-bench, domain benchmarks) and your own acceptance-rate data.

## Score the task (1 = low, 3 = high)
| Factor | 1 | 2 | 3 |
|---|---|---|---|
| Complexity | mechanical | standard | novel / multi-step reasoning |
| Risk if wrong | easily caught, reversible | costly to fix | security, legal, medical, financial, data loss |
| Context needed | one file / short text | a module | whole system / long documents |
| Capability | text transform | code / analysis | expert reasoning, multimodal |

**Max factor = 3 → T1. Otherwise (all factors ≤ 2, sum 4–8): sum ≤ 6 → T3, 7–8 → T2.** Privacy-sensitive → restrict to local or compliant providers regardless of tier.

## Typical routing
| Task | Tier | Review |
|---|---|---|
| File search, grep, summarizing logs/docs | T3 | spot-check |
| Formatting, translation, boilerplate, test scaffolding | T3 | automated checks |
| Feature implementation in known patterns | T2 | tests + T1 diff review for risky areas |
| Writing tests from a spec | T2 | mutation/coverage check or T1 sample |
| Research synthesis with sources | T2 | T1 verifies key claims and citations |
| Content drafts (social, marketing) | T2/T3 | T1 tone/brand check, user approves publishing |
| Architecture, data model, API design | T1 | user approval for big decisions |
| Security review, threat model | T1 | tools + T1 |
| Legal/medical/financial preparation | T1 | qualified professional + user |
| Final sign-off on any deliverable | T1 | — |

## Cost discipline
- Target: T1 ≤ 15% of total tokens. Above 30% → contracts too large or routing too conservative.
- Cache shared context; send references (paths, ids), not whole documents, when the agent can fetch them.
- Batch small T3 tasks.
