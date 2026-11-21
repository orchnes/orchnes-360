# Roles: inputs, outputs, checklists

## 1. Business analyst
In: goals, interviews, competitors (`market-research`). Out:
- Personas and top jobs-to-be-done.
- User stories: "As a <role> I want <action> so that <outcome>" + acceptance criteria (Given/When/Then).
- Process maps for key flows (purchase, return, onboarding) — BPMN-lite or Mermaid.
- MVP scope (must) vs later (should/could) vs non-goals.
- Business rules list (pricing, discounts, tax, shipping, cancellation).
Check: every story testable; every rule has an owner; edge cases listed (out of stock, partial refund, failed payment).

## 2. Data / DB analyst
In: stories, rules. Out:
- Domain model (entities, relationships, aggregates) and ERD.
- Data dictionary: field, type, constraint, example, PII class (none/personal/special), retention.
- Normalized schema (3NF by default; denormalize with a reason), constraints in the DB (NOT NULL, FK, CHECK, UNIQUE).
- Index plan from real query patterns; partitioning for large time-series tables.
- Migration plan; seed and anonymized test data strategy.
Check: money as integer minor units or DECIMAL; timestamps in UTC with time zone; soft-delete only where needed; audit columns; no PII in logs.

## 3. Architect
Out: context diagram, component/module boundaries, ADRs (stack, monolith vs services — default modular monolith, sync vs async, integration approach),
NFRs with numbers (p95 latency, availability, RPO/RTO, max load), security architecture (authn/z, secrets), observability plan.
Check: every external integration behind an interface; single points of failure listed; cost estimate per stage.

## 4. Backend
Out: OpenAPI spec first, then implementation; domain logic independent of the framework; repositories; background jobs/queue; integrations with retries and idempotency.
Check: validation at the edge; authorization on every endpoint; consistent error format; pagination; rate limits; structured logs with request IDs.

## 5. Frontend / mobile
Out: screens from the design system; state management (server state vs UI state); forms with validation; i18n; SEO for public pages (SSR/SSG); PWA if useful.
Check: WCAG AA, keyboard paths, Core Web Vitals budget (e.g. LCP < 2.5 s), image optimization, error and empty states, works on slow networks.

## 6. Admin panel
Out: role-based access (owner, manager, support, warehouse, read-only), 2FA required, audit log of every admin action, dashboards, bulk actions with previews,
safe refund/cancel flows with reason codes, customer view without exposing secrets, impersonation only with logging and consent policy.
Check: no admin action without authorization check server-side; destructive actions confirmable and reversible where possible.

## 7. QA / test
Out: test strategy per layer, automated suites in CI, test data management, UAT plan with business owners, bug triage rules. See `testing.md`.

## 8. DevOps
Out: repo structure, CI (build, test, scan, migrate), CD with staging → production and rollback, IaC, secrets management, monitoring/alerting, backups.

## 9. Security
Out: threat model (STRIDE on key flows), secure defaults checklist, dependency/secret/SAST scans in CI, pre-launch review, incident contacts.

## 10. Docs
Out: README (setup in < 15 min), architecture overview, runbooks, API docs from OpenAPI, admin guide, customer help articles, changelog.
