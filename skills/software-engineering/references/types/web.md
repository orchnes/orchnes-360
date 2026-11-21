# Web (frontend + backend/API)

## Frontend layers
| Layer | Contents |
|---|---|
| Routes / pages | URL → screen composition, data loading entry |
| Components | UI only: render props/state, emit events |
| State | server-state cache (query libs), client UI state, URL state — keep them separate |
| Services / API client | typed calls to backend, error mapping |
| Domain helpers | pure validation/formatting shared logic |

Rules: no fetch calls inside leaf components; server state ≠ global store; URL is state too (filters, tabs).
Watch: bundle size, hydration mismatches, layout shift, accessibility (semantic HTML, keyboard, contrast), XSS (never inject raw HTML).

## Backend/API layers
| Layer | Contents |
|---|---|
| Transport | routes/controllers: parse, validate, authN, map to DTO |
| Application | use cases/services: authZ, transactions, orchestration |
| Domain | entities, rules |
| Persistence | repositories, migrations |
| Integrations | payment, email, queues, third-party APIs (behind interfaces) |

Rules: controllers are thin; validate at the edge with a schema; one transaction per use case;
idempotency keys for retries/payments; paginate every list endpoint; version public APIs.
Watch: N+1 queries, missing indexes, SQL injection, SSRF, CSRF, rate limiting, secrets in env not code.

## Typical tests
Frontend: component tests with user-centric queries; a few e2e browser tests for critical flows.
Backend: unit for domain; integration against a real DB (containers); contract tests for public APIs.
