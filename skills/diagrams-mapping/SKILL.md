---
name: diagrams-mapping
description: Create accurate, legible diagrams and maps as code — system context and architecture (C4-style), data flow, sequence, entity-relationship, state machines, deployment/infrastructure, business processes, user journeys, timelines, dependency and knowledge maps — derived from real evidence (code, configs, schemas, conversations), in Mermaid by default (also PlantUML, D2, Graphviz), validated by rendering. Use when the user asks for a diagram, schema, şema, map, haritalama, flowchart, architecture drawing, ERD, sequence diagram, process map, mind map, or "show me how this works"; and whenever another skill needs a diagram.
license: MIT
---

# Diagrams & Mapping

A diagram is a claim about how something works. Every box and arrow must be true, traceable, and readable in ten seconds.

## 1. Decide the question
Who reads it and what must they understand? ("How does an order flow from checkout to warehouse?", "What talks to the database?")
One diagram answers one question. Several questions → several diagrams at different zoom levels.

## 2. Pick the type
| Question | Type |
|---|---|
| What is the system and who/what uses it? | context (C4 level 1) |
| What are the main parts and how do they talk? | container/component (C4 level 2–3) |
| What happens step by step between actors? | sequence |
| How does work/data move through stages and decisions? | flowchart / data flow |
| What data exists and how is it related? | ER diagram |
| What states can a thing be in? | state machine |
| Where does it run? | deployment / infrastructure |
| How does a business process work across roles? | swimlane process |
| What does the customer experience? | user journey |
| When does what happen? | timeline / Gantt |
| What depends on what? | dependency graph |
| How do ideas/topics relate? | mind map / knowledge map |
Syntax templates for each: `references/diagram-types.md`.

## 3. Gather evidence (don't draw from imagination)
For existing systems, extract structure from the source of truth — code imports, routes, DB schema/migrations, docker-compose, Kubernetes manifests,
Terraform, CI files, queue/topic configs, process documents, interview notes. Commands and techniques: `references/from-code.md`.
Note the evidence per element (file path, table name, document). Unknown parts are drawn dashed and labelled `?` — never invented.

## 4. Draw — diagrams as code
- Default **Mermaid** (renders in GitHub, GitLab, many docs and chat tools). Use PlantUML/D2/Graphviz when Mermaid can't express it well.
- Store the source next to the code or doc (`docs/diagrams/*.mmd`); export SVG/PNG only as build artefacts.
- Follow `references/style.md`: ≤ ~12 nodes per diagram, left-to-right or top-down consistently, labelled edges (verb + data), consistent shapes, a title and a legend when colours/shapes carry meaning.

## 5. Validate
1. **Render it** (Mermaid CLI, live editor, or the target platform) — fix syntax errors before showing.
2. Check every element against the evidence list; remove anything you can't back up.
3. Read it as the target reader: can they answer the question in ten seconds?
4. Provide a short text summary or alt text for accessibility.

## 6. Keep it alive
Diagrams in version control, reviewed with code changes; date and owner in the caption; regenerate from code where tooling allows; delete stale diagrams.

## Rules
- Accurate beats pretty; simple beats complete.
- No unlabeled arrows; direction always meaningful.
- Don't mix abstraction levels in one diagram (no database tables inside a context diagram).
- Sensitive details (internal hostnames, IPs, secrets, personal data) stay out of diagrams meant for wide audiences.
