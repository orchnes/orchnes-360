# Code bugs: crashes, wrong results, failing/flaky tests, build/CI failures

## Crash / exception
1. Read the full stack trace top to bottom; find the first frame in *your* code.
2. Identify the bad value at that frame, then trace **backwards** to where it was created — the cause is usually upstream.
3. Check the boundary where data entered (API, file, DB, user input): was it validated?
Common causes: null/undefined, off-by-one, wrong type/unit, unhandled error path, resource already closed, missing await.

## Wrong result (no error)
1. Build a minimal input with a known correct output.
2. Assert intermediate values along the flow; find the first step where the value is wrong.
Common causes: floating point/rounding, timezone/locale, integer overflow, mutation of shared objects, wrong operator precedence,
stale cache, wrong branch due to truthy/falsy checks, character encoding.

## Failing test
- Did the code change or the test change? `git log -p` both.
- Does the test fail alone and in the suite? Fails only in the suite → shared state/order dependency.
- Is the test asserting correct behavior? Sometimes the test is the bug — confirm requirements before changing it.

## Flaky test (intermittent)
Run it many times to measure the rate: `for i in $(seq 50); do <cmd> || echo FAIL; done | grep -c FAIL`.
Vary one factor: order (random seed), parallelism, timing (slow machine/CPU limit), time of day/date, network.
Common causes: race conditions, sleeps instead of waiting on a condition, test order dependency, shared DB/files,
real clock/timezone, random data without seed, external services, unordered collections compared as ordered.
Never "fix" with retries or longer sleeps.

## Concurrency bugs
Symptoms: rare, load-dependent, disappear under the debugger.
Tools: thread/race sanitizers (TSan, `go test -race`), stress tests, logging with thread ids and timestamps.
Look for: unsynchronized shared mutable state, check-then-act, lock ordering (deadlock), async callbacks touching UI state.

## Build / CI failures
- Read the **first** error; later ones are cascades.
- "Works locally, fails in CI" → differential diagnosis: tool/runtime versions, lockfile honored?, env vars/secrets,
  OS/case-sensitive paths, caches, network access, parallelism, timezone.
- Dependency break: check what changed in the lockfile; pin and bisect versions.

## Tools
Debugger with conditional breakpoints · `git bisect run` · sanitizers (ASan/UBSan/TSan) · core dumps · property-based tests to find minimal failing inputs.
