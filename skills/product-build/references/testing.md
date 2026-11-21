# Test layers

| Layer | What | Tools (examples) | When it runs |
|---|---|---|---|
| Static | formatting, lint, types, licences, advisories | cargo fmt/clippy/deny/audit, ESLint/TypeScript | every commit |
| Unit | domain rules, pure functions (prices, tax, state machine) | cargo test/nextest, Vitest/Jest | every commit |
| Property-based | invariants (totals never negative, stock never below zero) | proptest, quickcheck | every commit |
| Snapshot | API responses, rendered templates | insta | every commit |
| Integration | repositories against real Postgres/Redis, adapters against sandboxes | testcontainers, provider sandboxes | every PR |
| Contract | API matches OpenAPI; consumer expectations | schemathesis, Pact | every PR |
| End-to-end | critical journeys: browse → cart → pay (sandbox) → order email; admin refund | Playwright | every PR (smoke) / nightly (full) |
| Accessibility | WCAG checks on key pages | axe-core with Playwright, manual keyboard pass | every PR / release |
| Visual regression | key screens across breakpoints and dark mode | Playwright screenshots | release |
| Performance | peak ×2 load on checkout and search | k6, Locust | before launch, before big campaigns |
| Security | SAST, secrets, dependencies, DAST on staging | Semgrep, gitleaks, cargo audit, OWASP ZAP | every PR / weekly |
| Backup/restore & failover | restore drill, failover drill | scripts | monthly/quarterly |
| UAT | business owners verify stories in staging | checklist from acceptance criteria | before release |

## Admin-specific tests
Each role can do exactly what it should (positive) and nothing more (negative tests per endpoint) · audit log entry for every admin write ·
destructive actions require confirmation · 2FA enforced.

## Test data
Factories/builders for entities; anonymized production-like datasets for staging; never real customer data in tests without masking.

## CI gates
Merge blocked on: static + unit + integration + contract + e2e smoke + security scans. Coverage is a signal, not a target — focus on rules and critical paths.
Flaky tests are fixed or quarantined within a day (see `root-cause-analysis`).
