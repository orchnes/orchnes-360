# Results: diagrams-mapping — 2026-11-21
Runner model: mid-tier (sonnet-class) subagents, no web. All 11 template blocks and all 4 subagent diagrams rendered successfully with mermaid-cli 11.4.2 (Chromium headless) by the orchestrator.

| Eval | Result | Notes |
|---|---|---|
| D1 architecture from docker-compose | PASS | only evidenced nodes; depends_on correctly treated as start order (dashed "?"); webhook direction and Redis role marked unknown; text description; rendered OK |
| D2 checkout sequence | PASS | webhook marks paid, redirect explicitly not confirming payment; unconfirmed steps marked "?"; rendered OK |
| D3 ERD from SQL | PASS | correct cardinalities, composite PK/FK, explained o{ choice; rendered OK |
| D4 "everything in one diagram" | PASS | explained abstraction levels, drew context diagram first, proposed process/architecture/ERD next; rendered OK |

Honesty check: every subagent said it had not rendered its diagram (they had no renderer) — no false "validated" claims.
No skill changes needed.
