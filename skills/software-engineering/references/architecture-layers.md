# Architecture Layers — shared vocabulary

Used by all skills (planner, codebase-analysis, root-cause-analysis, diagrams-mapping).

## Four lenses on "how software is divided"

### 1. Logical layers (inside the code)
| # | Layer | Responsibility | Must not know about |
|---|---|---|---|
| 1 | Presentation / Interface | show output, accept input (UI, CLI, HTTP handlers, sensors as input) | DB, business rules |
| 2 | Application / Use case | orchestrate a user/system action, transactions, authorization | UI widgets, SQL |
| 3 | Domain / Business | rules, entities, invariants — the core | frameworks, I/O |
| 4 | Persistence / Data access | load and store state (repositories) | UI |
| 5 | Infrastructure | DB drivers, queues, email, external APIs, OS, hardware | business rules |

Cross-cutting concerns: security, logging/observability, error handling, caching, configuration, i18n.

### 2. Architectural styles
- **Layered (n-tier):** each layer calls the one below.
- **Clean / Hexagonal / Onion:** domain at the center; outer code plugs in via ports (interfaces) and adapters. Dependencies point inward.
- **MVC / MVVM / MVP:** presentation-layer patterns for UI code.
- **Event-driven:** components communicate through events/messages.
- **Pipeline (pipes & filters):** data flows through ordered stages (compilers, ETL, ML).
- **ECS (entity-component-system):** data-oriented, common in games.

### 3. Deployment topology
Monolith → modular monolith → services/microservices → serverless functions.
Physical tiers: client ↔ server ↔ data store. Start with a modular monolith unless there is a proven need to split.

### 4. System stack (below the code)
Hardware → OS/firmware/RTOS → runtime (JVM, Node, CPython, browser) → framework → application.

### 5. Lifecycle (SDLC)
Requirements → analysis → design → implementation → testing → deployment → operation & maintenance.

## Layer-violation quick reference
| Smell | Violation | Fix |
|---|---|---|
| SQL/ORM calls in a UI component or HTTP handler | presentation → persistence | move to repository, call via use case |
| Domain entity imports HTTP/framework types | domain → infrastructure | define a port in domain, adapter outside |
| Business rule duplicated in frontend and backend | rule leaked to presentation | single source in domain; UI only pre-validates for UX |
| Use case formats HTML/JSON strings | application → presentation | return data; presenter formats |
| Hardware register access spread across app logic | app → hardware | HAL/driver layer |
