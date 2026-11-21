---
name: software-engineering
description: Core software engineering discipline for any project type (web, backend, mobile, desktop, embedded/IoT, CLI/library, data/ML, games, distributed/cloud) — architecture layers and dependency rules, cross-cutting concerns, change workflow, testing and code quality checklists. Use when writing, changing, reviewing or structuring code, deciding where code belongs, designing modules, or when the user asks about architecture, layers, clean code, best practices or "is this the right way".
license: MIT
---

# Software Engineering

## 1. Identify the project type first
Detect from manifests and structure (package.json, pubspec.yaml, Cargo.toml, CMakeLists/platformio.ini,
pyproject + notebooks, Unity/Godot files, Dockerfile/k8s manifests …).
Then read **only** the matching file in `references/types/`:

| Type | File |
|---|---|
| Web frontend + backend/API | `references/types/web.md` |
| Mobile (iOS, Android, cross-platform) | `references/types/mobile.md` |
| Desktop | `references/types/desktop.md` |
| Embedded / IoT / firmware | `references/types/embedded.md` |
| CLI tools & libraries/SDKs | `references/types/cli-library.md` |
| Data pipelines & ML | `references/types/data-ml.md` |
| Games | `references/types/game.md` |
| Distributed / cloud-native | `references/types/distributed.md` |

Mixed projects: read each relevant file. Shared vocabulary for all types: `references/architecture-layers.md`.

## 2. Universal rules
1. **Dependencies point inward.** Business/domain logic never imports UI, framework, DB or network code.
   Outer layers depend on inner ones through interfaces (ports/adapters).
2. **One reason to change per module.** Split when a file mixes layers or concerns.
3. **Follow the codebase's existing patterns** before introducing new ones. Consistency beats personal taste.
4. **Make the change easy, then make the easy change.** Refactor in a separate step from behavior change.
5. **Boundaries validate; the core trusts.** Validate and convert input at the edge (API, UI, sensor, file);
   inside, use typed, already-valid data.
6. **Errors are part of the design.** Decide per layer: recover, translate, or propagate. Never swallow silently.
7. **No hidden global state.** Pass dependencies explicitly; this is what makes code testable.

## 3. Change workflow
1. Understand: locate the code, read its tests, find callers.
2. Decide the layer the change belongs in (section 1 file).
3. Write/adjust a failing test that captures the requirement (or the bug).
4. Smallest change to pass. Then refactor while green.
5. Run linters, type checks and the relevant test suite.
6. Review your own diff: scope creep, debug leftovers, missing error paths, secrets.

## 4. Testing pyramid
- **Unit** (many, fast): domain rules, pure functions.
- **Integration** (some): adapters against real DB/queue/filesystem or faithful fakes.
- **End-to-end** (few): critical user journeys only.
Test behavior, not implementation details. Each bug fix ships with a regression test.

## 5. Cross-cutting checklist (every change)
- [ ] Security: input validation, authz checks, no secrets in code/logs, dependencies pinned
- [ ] Errors: handled at the right layer, useful messages, no silent catch
- [ ] Observability: meaningful logs/metrics at boundaries, no noisy logs in hot paths
- [ ] Performance: no N+1 queries, no unbounded loops/memory, work off the hot/UI thread
- [ ] Config: environment-specific values externalized, sane defaults
- [ ] Compatibility: public APIs, data formats and migrations stay backward compatible or are versioned
- [ ] Accessibility & i18n (user-facing code)
- [ ] Docs: public interfaces and non-obvious decisions documented

## 6. Code review smells
Layer violations (SQL in UI, HTTP in domain) · god classes/files · duplicated logic · boolean-flag parameters ·
deep nesting · magic numbers · comments that restate code · dead code · tests that mock everything.
