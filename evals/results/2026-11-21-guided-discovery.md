# Results: guided-discovery — 2026-11-21
Runner model: mid-tier (sonnet-class) subagent, skill files read from disk, no web.

| Eval | With skill | Notes |
|---|---|---|
| E1 | PASS | 11-item map, who-does-it on every item, 3 decisions with defaults, NEXT, Turkish, verify note on legal items |
| E1 baseline (no skill) | FAIL | 8 generic steps, 4 open questions without defaults, no "who", waits for answers |
| E2 | PASS | expert terms (DPA, data residency, NIS2), saas pack used |
| E3 | PASS | classified as SaMD, professional approvals marked, no diagnostic content |
| E4 | PASS | universal map adapted (licence, airspace, insurance); gave an unlabelled budget figure → fixed by `~estimate` rule |
| E5 | PASS | no map regeneration, one-line status, honoured decision D3; used a non-existent hand-off name → fixed |

Fixes applied after run: item-count merge rule, `~estimate` label rule, hand-off names must come from universal-map.
