# RCA techniques

## 5 Whys
Ask "why?" repeatedly from the symptom until you reach a fixable cause. Each answer must be backed by evidence.
```
Symptom: checkout returns 500
Why? NullPointerException in PriceService.total()        (stack trace)
Why? item.discount is null                                (debugger)
Why? new import job writes items without discount         (git log: job added last week)
Why? schema allows null and job has no default            (schema)
Why? no validation at the import boundary                 ← root cause (fix: validate + NOT NULL + default)
```
Stop when the fix prevents the class of failure. Branch if a "why" has several valid answers.

## Bisection (binary search)
Cut the search space in half each step:
- **Commits:** `git bisect start; git bisect bad; git bisect good <sha>; git bisect run <test-cmd>`
- **Input:** halve the failing input until minimal (delta debugging).
- **Code path:** log/assert at the midpoint of the flow; is state already wrong there?
- **Config/deps:** toggle half the differences between a working and a broken environment.
log2(n) steps: 1000 commits → ~10 tests.

## Differential diagnosis
Compare working vs broken: version, environment, data, user, region, time, hardware.
Make a table of differences; each one is a candidate. Eliminate by swapping one at a time.

## Fishbone (Ishikawa) — for incidents and recurring problems
Brainstorm causes in categories so nothing is missed:
Code · Configuration · Data · Infrastructure · Dependencies/third parties · Process (deploy, review, tests) · People/knowledge.

## Fault tree
Start from the failure at the top; below it list conditions joined by AND/OR that produce it.
Useful when the failure needs several things to go wrong at once (typical in outages).

## Scientific debugging log
Keep a running log to avoid circling:
```
H1: cache returns stale value     test: disable cache   result: still fails → refuted
H2: race between writer threads   test: run with 1 thread → passes → supported
```

## Timeline (incidents)
Order events with timestamps: change → first error → detection → mitigation → recovery.
Gaps between them reveal detection and response weaknesses, not just the technical cause.
