---
name: product-build
description: Build an e-commerce site, platform, SaaS or app end to end — build-vs-buy decision, then every role in order (business analyst, data/DB analyst, architect, backend, frontend, admin panel, QA/test, DevOps, security, docs) with concrete artifacts and checklists, Rust-first by default with other languages where they clearly fit, test layers from unit to e2e/performance/security, and a minimal, no-bloat codebase. Use when the user wants to build or rebuild an online store, marketplace, platform, web/mobile/desktop app, admin panel, or asks what steps, roles, stack or tests a software product needs.
license: MIT
---

# Product Build

Ship the smallest product that solves the core problem, built so it can grow. Every role leaves an artifact the next role can use.

## 0. Build vs buy (decide first)
| Situation | Choice |
|---|---|
| Standard store/site, small team, speed matters | ready SaaS (hosted store builder/CMS) — no custom build |
| Standard needs + control/low licence cost | open-source platform, customized (themes/plugins) |
| Unique workflow, scale, integration depth, or the software *is* the product | custom build (this skill) |
| Mixed | SaaS/open-source core + custom services around it |
State the trade-off (cost, time, lock-in, maintenance) and recommend one. Custom code is a liability until it earns its keep.

## 1. Roles and artifacts (run in this order; one agent per role works well — see `agent-orchestra`)
Details and checklists: `references/roles.md`.

| # | Role | Artifact |
|---|---|---|
| 1 | Business analyst | goals, personas, user stories with acceptance criteria, process maps, MVP scope, non-goals |
| 2 | Data / DB analyst | domain model, ERD, data dictionary, constraints, indexes, retention and privacy classification |
| 3 | Architect | architecture sketch, ADRs (stack, boundaries, integrations), NFRs (performance, availability, security) |
| 4 | Backend | API (OpenAPI), domain logic, persistence, jobs, integrations |
| 5 | Frontend / mobile | UI built on the design system (`visual-design`), accessibility, performance budgets |
| 6 | Admin panel | RBAC, audit log, operational screens (orders, products, users, refunds) |
| 7 | QA / test | test strategy and automated suites per layer (`references/testing.md`) |
| 8 | DevOps | CI/CD, environments, IaC, observability, backups (`infrastructure-planning`) |
| 9 | Security | threat model, secure defaults, scans in CI, pre-launch review (`security-operations`) |
| 10 | Docs | README, runbook, API docs, user help content (feeds `ai-integration` knowledge base) |

## 2. Stack — Rust-first
Default to Rust for backend services, CLIs, workers, performance-critical and security-sensitive parts; use other languages where they're clearly better
(team skills, ecosystem, UI platforms). Concrete crates, layouts and the "when not Rust" list: `references/rust-stack.md`.

## 3. Domain blueprint
E-commerce/platform modules, rules (money, idempotency, order state machine, stock reservation) and MVP cut: `references/ecommerce-blueprint.md`.
For other products, derive modules from the BA's user stories the same way.

## 4. Build rules
- Follow `software-engineering` (layers, dependency direction, tests with every change).
- **Minimalism:** before writing code check the standard library, existing crates/libraries and existing code; no speculative abstractions, no unrequested features;
  every dependency justified in one line. The reviewer rejects bloat.
- Vertical slices: deliver one user story end to end (DB → API → UI → tests) before starting the next.
- Feature flags for risky changes; migrations backward-compatible.

## 5. Definition of done (per story)
Acceptance criteria pass in automated tests · code reviewed · lint/format/type checks clean · security scans clean · accessible (keyboard, contrast) ·
docs updated · deployed to staging and verified · observability (logs/metrics) for the new path.

## 6. Launch checklist
Load test at expected peak ×2 · backup restore tested · security review done · legal pages (privacy, terms, cookies, distance-selling where applicable) ·
analytics and error tracking live · rollback plan · support channel ready · monitoring alerts routed to a person.
