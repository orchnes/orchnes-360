# Modernizing existing infrastructure

## 1. Assess (read-only)
Inventory servers, apps, versions (end-of-life?), dependencies between systems, data stores and sizes, backup state (tested?),
manual steps, incidents of the last year, costs. Use `codebase-analysis` for application code and `security-operations` exposure audit for risk.

## 2. Decide per system (the "R" options)
| Option | Meaning | When |
|---|---|---|
| Retire | switch it off | unused or duplicated |
| Retain | leave as is for now | stable, low value to change |
| Rehost | move as-is (lift and shift) | data-centre exit, quick wins |
| Replatform | small changes for a managed platform (managed DB, containers) | reduce ops burden |
| Refactor / rebuild | change architecture or rewrite (e.g. performance-critical parts in Rust) | clear business case, high change rate |
| Repurchase | replace with SaaS | commodity function (email, CRM, ticketing) |
Prioritize by risk (end-of-life, no backups, security exposure) and value (cost saving, speed of change).

## 3. Migrate safely
- Strangler-fig pattern: route a slice of traffic/functionality to the new system, grow it, retire the old part.
- Data migration: rehearse in staging, measure duration, verify with counts/checksums, keep a rollback path, freeze window if needed.
- Dual-run critical systems briefly; compare outputs.
- Observability in place **before** cutover.

## 4. Quick wins that usually pay off
Off-site + immutable backups with restore tests · managed database · IaC for what exists · CI/CD replacing manual deploys ·
CDN and caching · upgrading end-of-life OS/runtimes · central logging and alerting · rightsizing idle resources.
