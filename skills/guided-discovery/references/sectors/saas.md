# Sector pack: SaaS / software product / platform

Last reviewed: 2026-11-21 — verify regional tax, privacy and provider details against current official sources.

## The map
| # | Component | Plain explanation | Who |
|---|---|---|---|
| 1 | Problem & customer | whose pain you remove and how they solve it today | AI researches → user decides |
| 2 | Pricing & numbers | free tier? per seat / per usage? cost per customer vs price | AI models |
| 3 | Company & legal | entity, terms of service, privacy policy, DPA for business customers | AI drafts → **user + lawyer** |
| 4 | Name, brand, domain | name, trademark check, domain, handles | AI checks → **user files** |
| 5 | Visual identity & UI system | logo, colours, component library, product UI style | AI designs |
| 6 | MVP scope | the smallest version that solves the core pain | AI plans (planner skill) |
| 7 | Build | backend (Rust-first), frontend, auth, admin panel, tests | AI builds |
| 8 | Billing | subscriptions, invoices, taxes, dunning (failed payment retries) | AI integrates → **user signs provider** |
| 9 | Infrastructure | hosting, database tiers, backups, monitoring, scaling plan | AI sets up |
| 10 | Security & compliance | auth hardening, secrets, vulnerability scanning; later SOC 2 / ISO 27001 for enterprise buyers | AI hardens |
| 11 | Launch & growth | landing page, docs, onboarding, SEO, content, communities, CRM | AI runs → **user approves publishing** |
| 12 | Support & feedback | help docs, in-app assistant, feedback loop | AI builds |
| 13 | Metrics | activation, retention, MRR, churn, CAC/LTV | AI reports |

## Decisions that change the path
1. **Who is the customer?** **Small businesses/individuals (self-serve)** / enterprises (sales-led) — changes pricing, compliance, onboarding.
2. **Where are customers?** — changes tax (VAT/sales tax), privacy law, data residency, languages.
3. **Build approach:** **modular monolith, managed services** / microservices / no-code first.
Default: self-serve, global English + home market, modular monolith.

## Billing options — check
Merchant-of-record providers (handle global sales tax for you: Paddle, Lemon Squeezy-class) vs payment processors (Stripe-class, regional) —
check business-country availability, tax handling, fees, payout currency.

## Stages
| Stage | Setup |
|---|---|
| Start (≤ 1k users) | single VPS or PaaS + managed Postgres, daily backups, error tracking, free tiers |
| Grow (1k–100k) | separate DB tier, read replicas/caching, CI/CD, staging env, on-call alerts, status page |
| Scale (100k+ / enterprise) | multi-AZ/region failover, SSO/SAML, audit logs, compliance certification, data residency options |
