---
name: root-cause-analysis
description: Evidence-driven root cause analysis for any software problem — code bugs (crashes, wrong results, failing or flaky tests), performance problems (slowness, memory leaks, high CPU/cost) and production incidents (outages, error spikes, data issues). Finds the true cause instead of patching symptoms, proves it with a reproduction and a test, and writes a short report. Use when the user says "why does this fail", "debug", "find the cause", "it's slow", "memory leak", "outage", "postmortem", "RCA", or when a fix didn't hold.
license: MIT
---

# Root Cause Analysis

A root cause is found when you can **explain the failure mechanism, reproduce it on demand,
and make it disappear by changing exactly that cause.** Anything less is a hypothesis.

## 1. Classify, then load only the matching guide
| Problem | File |
|---|---|
| Crash, exception, wrong output, failing/flaky test, build/CI failure | `references/types/bugs.md` |
| Slowness, latency, high CPU, memory growth/leak, cost spike | `references/types/performance.md` |
| Production outage, error-rate spike, degraded service, data corruption | `references/types/incidents.md` |

Production incident? **Mitigate first** (rollback, feature flag off, scale up), analyze second.
Techniques (5 Whys, bisection, fishbone, fault tree, differential diagnosis): `references/techniques.md`.

## 2. The core loop (all problem types)

### Step 1 — Define the symptom precisely
Expected vs actual, exact error text, where (env, version, input), when it started, how often, who is affected.
Write it as one sentence. A vague symptom produces a vague cause.

### Step 2 — Reproduce
Get a reliable reproduction, then shrink it to the minimum (smallest input, fewest steps, single test).
Cannot reproduce? Gather more evidence (logs, traces, core dumps, metrics) or add targeted instrumentation — do not guess-fix.

### Step 3 — Collect evidence before theorizing
- What changed? (deploys, commits, dependencies, config, data, traffic, infrastructure) — `git log`, deploy history.
- Where does it diverge? Last point where state was correct vs first point where it is wrong.
- Read the actual error and stack trace fully; the first error is usually the real one, later ones cascade.

### Step 4 — Hypotheses, ranked
List 2–4 candidate causes. For each: the evidence for it, the evidence against it, and a **cheap test that would refute it.**
Run the cheapest discriminating test first. Change one variable at a time.

### Step 5 — Find the cause behind the cause
When the immediate cause is confirmed, ask "why was this possible?" until you reach something fixable in
code, process or design (see 5 Whys). Stop at the level where a fix prevents the whole class of failure,
not only this instance.

### Step 6 — Fix and prove
1. Write a test/check that fails because of the root cause.
2. Fix the root cause (not the symptom). Keep the diff minimal.
3. Test passes; original reproduction no longer fails; related suites still pass.
4. Add a guard against recurrence where cheap: assertion, validation, alert, lint rule, type.

### Step 7 — Report
Use `references/report-template.md`. Short: symptom, root cause, evidence, fix, prevention.

## 3. Rules
- **No fix without a reproduction or conclusive evidence.**
- **Correlation is not cause.** "It started after deploy X" narrows the search; it doesn't name the cause.
- **Distrust your assumptions first.** Verify the code you think runs is the code that runs (version, branch, cache, config, env vars).
- **Don't stack changes.** If a fix attempt fails, revert it before trying the next.
- **Two failed fixes on the same hypothesis → the hypothesis is wrong.** Go back to Step 3.
- In long debugging sessions, escalate to a stronger model with a compact evidence packet (see `autonomous-loop` skill).

## 4. Anti-patterns
Retry/sleep to hide races · catching and ignoring the exception · raising timeouts without knowing why it's slow ·
deleting or skipping the failing test · "works on my machine" closure · fixing the line in the stack trace when the bad data came from upstream.
