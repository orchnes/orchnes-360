---
name: codebase-analysis
description: End-to-end source code analysis of any repository, any language or size — architecture map (modules, layers, data flow, dependencies), code quality and technical-debt report, security review (vulnerabilities, leaked secrets, risky dependencies) and onboarding guide ("how does this project work"). Token-efficient recon first, then deep dives only where needed; every finding cites file:line evidence. Use when the user says "analyze this repo/codebase", "explain this project", "audit the code", "tech debt", "security scan", "how does X work here", or opens an unfamiliar project.
license: MIT
---

# Codebase Analysis

Rule: **every claim cites evidence** (`path/file.ext:line` or a command output). No evidence → mark it as an assumption.

## 1. Pick the mode(s), load only those guides
| User wants | Mode file |
|---|---|
| How it is built: modules, layers, data flow, dependencies | `references/modes/architecture.md` |
| Code health: complexity, duplication, dead code, tests, debt | `references/modes/quality.md` |
| Security: vulnerabilities, secrets, dependencies, config | `references/modes/security.md` |
| Learning the project: setup, key flows, where to change things | `references/modes/onboarding.md` |

"Full analysis" = all four, in that order (architecture feeds the others). Recon is always first.

## 2. Phase 1 — Recon (cheap, always)
Goal: a mental model in a few thousand tokens. Commands: `references/recon.md`.
1. **Shape:** file tree (excluding vendored/generated), languages, size per directory.
2. **Identity:** README, manifests (package.json, pyproject, go.mod, Cargo.toml, pom.xml, …), build/CI config, Dockerfiles.
3. **Project type:** classify (web, mobile, embedded, …) and use the matching layer guide from the
   `software-engineering` skill if installed (its per-type reference files).
4. **Entry points:** main functions, servers/routes, CLI commands, app bootstrap, job schedulers.
5. **Activity:** recent commits, most-changed files (churn), contributors — churn × complexity marks hotspots.
Write a 10-line recon summary before going deeper.

## 3. Phase 2 — Targeted deep dives
- Follow the 2–3 most important flows end to end (e.g. a request, a job, a user action) from entry point to storage.
- Read hotspots and boundaries (API, DB, external calls, auth) — not every file.
- Large repos (> ~2k files): analyze per top-level module; delegate broad searches to sub-agents or cheaper models
  and keep only their conclusions; sample representative files instead of reading all.
- Prefer real tools over reading: linters, type checkers, test runners, dependency auditors, secret scanners, complexity tools —
  run what's available and cite their output.

## 4. Phase 3 — Synthesize
- Group findings; rank by **impact × likelihood** (security/quality) or importance (architecture/onboarding).
- Each finding: what, where (file:line), why it matters, recommended action, effort (S/M/L).
- Separate facts from opinions. Note what was **not** analyzed (scope limits).
- Diagrams: Mermaid for structure and flows (see `diagrams-mapping` skill if installed).

## 5. Output
Use the report template inside each mode file. Combined analysis = one document:
1. Executive summary (5 bullets max) → 2. Architecture → 3. Quality → 4. Security → 5. Onboarding → 6. Prioritized action list.
Save as a file in the repo or scratch area when long; give the user the summary in chat.

## 6. Anti-patterns
Reading the whole repo file by file · generic advice not tied to this code ("add more tests") ·
findings without locations · reporting linter noise as insights · guessing behavior instead of running it ·
judging style choices that are consistent within the project.
