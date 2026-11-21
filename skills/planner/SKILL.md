---
name: planner
description: End-to-end software planning — from a vague idea to an executable, testable plan with scope, architecture choice, work breakdown, acceptance criteria, risks, test strategy and rollout. Use when the user asks to plan a feature, project, migration or refactor, says "how should we build", "make a plan", "roadmap", "break this down", or before any change touching many files.
license: MIT
---

# End-to-End Planner

A plan is good when someone else (or a cheaper model) can execute it without asking questions,
and every step has a way to prove it is done.

## Phase 1 — Frame (ask only what blocks you)
- **Goal:** the outcome in one sentence, and who benefits.
- **Success metric:** how we'll know it worked (test, metric, user-visible behavior).
- **Constraints:** stack, deadline, budget, compatibility, compliance.
- **Non-goals:** explicitly out of scope.
Resolve unknowns from the code/docs first; ask the user only for true decisions. Batch questions.

## Phase 2 — Discover
- Map the relevant parts of the system: entry points, data flow, modules touched, external deps.
- Find existing patterns to reuse; list them with file paths.
- Note what's tested today and what isn't.
(For large systems, produce a diagram — see a diagramming/mapping skill if installed.)

## Phase 3 — Decide
- List at most 2–3 viable approaches, each with: effort, risk, reversibility.
- **Recommend one** and state why in 2–3 sentences. Record it as a decision (ADR style).

## Phase 4 — Break down
Split into tasks that are each:
- small (≤ ~1 day of human work / one focused agent session),
- independently verifiable,
- ordered by dependency (mark which can run in parallel).

Each task gets: **ID, description, files, acceptance criteria, verification command, depends-on.**

## Phase 5 — De-risk
- Top risks with likelihood × impact, and a mitigation or early spike for each.
- Put the riskiest/most uncertain task first (fail fast).

## Phase 6 — Verify & ship
- Test strategy: unit / integration / e2e — what covers which acceptance criterion.
- Rollout: feature flag, migration order, backward compatibility, rollback plan.
- Observability: what to log/measure to confirm success in production.

## Output
Write the plan using `references/plan-template.md`. Keep it scannable: tables and checklists, no essays.
For execution, hand tasks to the `autonomous-loop` skill (each task's verification command = its done criteria).

## Anti-patterns
- Tasks without acceptance criteria ("improve X").
- Planning the easy parts in detail and hand-waving the risky part.
- More than one recommended approach.
- Plans that silently expand scope beyond the stated goal.
