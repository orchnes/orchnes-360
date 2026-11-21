# Rust-first stack

Last reviewed: 2026-11-21 (all listed crates verified on crates.io that day) — crate ecosystems move; check crates.io activity, maintenance and licences before adopting. Prefer fewer, well-maintained crates.

## Backend defaults
| Concern | Default | Alternatives |
|---|---|---|
| Async runtime | tokio | — |
| Web framework | axum (+ tower middleware) | actix-web |
| DB access | sqlx (compile-time checked SQL) | SeaORM, diesel |
| Migrations | sqlx migrate | refinery |
| Serialization | serde, serde_json | — |
| Validation | garde or validator | hand-written newtypes |
| Errors | thiserror (libraries/domain), anyhow (binaries) | — |
| Config | config + env vars | figment (check activity — last release 2024) |
| Logging/tracing | tracing, tracing-subscriber, OpenTelemetry exporter | — |
| Password hashing | argon2 | — |
| Sessions/auth | tower-sessions, or JWT (jsonwebtoken) for APIs; oauth2/openidconnect crates for SSO | external IdP (Keycloak, Authentik, managed) |
| OpenAPI | utoipa | aide |
| HTTP client | reqwest | — |
| Background jobs | apalis, or a simple Postgres-backed queue | message broker (NATS, RabbitMQ) at scale |
| Money | integer minor units (i64) or rust_decimal | — |
| Time | time or chrono, always UTC | — |

## Workspace layout (modular monolith)
```
Cargo.toml            # [workspace]
crates/
  domain/             # entities, rules, ports (traits) — no framework, no I/O
  app/                # use cases, transactions, authorization
  infra/              # sqlx repositories, payment/shipping/email adapters
  api/                # axum routes, DTOs, OpenAPI
  worker/             # background jobs
bin/                  # server, worker, cli entry points
migrations/
tests/                # integration tests (testcontainers)
```

## Frontend options
| Option | When |
|---|---|
| Server-rendered Rust (askama or maud templates + htmx) | content/commerce sites, SEO, small team, minimal JS |
| Rust WASM frameworks (Leptos, Dioxus, Yew) | interactive apps, full-stack Rust teams; check SSR and ecosystem maturity |
| TypeScript (React/Next.js, SvelteKit, Vue/Nuxt) | rich ecosystem, large frontend hiring pool, complex UI libraries |
Pair any of them with a Rust API.

## Mobile and desktop
- Desktop (and mobile): Tauri 2 — Rust core + web UI, small binaries.
- Mobile cross-platform: Dioxus mobile (check maturity), Flutter, React Native; native Swift/Kotlin for platform-heavy apps — share business logic via a Rust core (UniFFI) when worthwhile.

## When not Rust (use the better tool)
Data science/ML training (Python) · existing PHP/WordPress/Shopify ecosystems where plugins save months · UI-heavy frontends with a TS team ·
quick scripts and glue (Python/shell) · native mobile UI (Swift/Kotlin). Integrate via HTTP/gRPC/queues, not shared databases.

## Quality tooling
`cargo fmt`, `cargo clippy -- -D warnings`, `cargo nextest`, `cargo deny` (licences/advisories), `cargo audit`, `cargo machete` (unused deps), `cargo llvm-cov` (coverage).
