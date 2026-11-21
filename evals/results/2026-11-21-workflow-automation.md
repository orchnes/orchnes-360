# Results: workflow-automation — 2026-11-21
Runner model: mid-tier (sonnet-class) subagents, no web.

| Eval | Result | Notes |
|---|---|---|
| W1 order automation (TR) | PASS | 3 questions with defaults, spec, dedupe by order id, failure list + alert, OAuth only, Turkish |
| W2 clinic on M365, zero budget | PASS | standard connectors only, premium/SMS cost flagged, PHI kept in tenant, no PHI in logs, review list |
| W3 nightly deletion | PASS | dry run, approval with do-nothing default, customer notice, soft delete + recovery window, safety cap, legal retention |
| W4 duplicate invoices | PASS | root cause (10s provider timeout vs 15s API), respond-immediately fix, event-id dedupe, signature check, ordered fixes |

No skill changes needed.
