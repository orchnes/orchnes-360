# One agent per job

## Typical platform agents
| Agent | Job | Tools (least privilege) | Approval needed for |
|---|---|---|---|
| Support | answer questions from knowledge base, track orders | search_kb, get_order_status | refunds, compensation |
| Shopping assistant | find products, compare, recommend | search_catalog, get_stock | — (read-only) |
| Order operations | address changes, cancellations | update_order (scoped) | every write, per policy |
| Content | product descriptions, posts, emails | draft-only store | publishing (see `content-social`) |
| Analytics | answer staff questions on sales/customers | read-only reporting DB | — (staff only) |
| Ops monitor | watch errors, stock, payments, uptime | metrics/logs read | any remediation beyond safe actions |
| Security watcher | anomalies in logins, fraud signals | logs read, flag | blocking accounts |

## Supervisor
- Routes each request to the right agent (classifier + rules), passes only needed context.
- Checks outputs against contracts (correct, sourced, in scope); retries or escalates; logs decisions, sources, cost.
- Coordinates multi-step tasks; one agent never calls another's tools directly.
- Patterns and contracts: `agent-orchestra` skill.

## Memory
- Per-customer memory only with consent and a clear purpose (e.g. preferences, open issues); retention limits; viewable and deletable.
- Shared business memory = the knowledge base and state files (`memory` skill), not chat logs.

## Documentation of every decision
Store: request, agent, sources retrieved, tool calls with results, decision rationale (short), approvals, outcome, cost, latency.
Redact PII; keep for audit per policy.

## 24/7 operation
Health checks per agent, queue-based processing, timeouts, circuit breakers to fallback models, alerts to on-call humans,
daily summary of what agents did and what needs human attention (see `workflow-automation`).
