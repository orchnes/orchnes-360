# Performance: latency, CPU, memory, cost

## Rule zero: measure, don't guess
Define the metric (p50/p95/p99 latency, throughput, peak memory, cost/request) and a target.
Reproduce under representative load and data size. Profile **before** optimizing. Re-measure after every change.

## Locate the bottleneck (USE / RED)
- Resources (USE): Utilization, Saturation, Errors for CPU, memory, disk, network, connection pools, threads.
- Services (RED): Rate, Errors, Duration per endpoint/operation.
- Tracing: which span dominates the request time?
Then classify: **CPU-bound · I/O-bound (DB, network, disk) · contention (locks, pools) · memory/GC.**

## Slowness / high latency
Common causes: N+1 queries, missing index (check the query plan: `EXPLAIN ANALYZE`), unbounded result sets,
synchronous calls in series that could be parallel/batched, chatty network calls, cache misses or no cache,
serialization of large payloads, lock contention, pool exhaustion (waiting for a connection), cold starts,
regex backtracking, O(n²) algorithms on growing data.

## High CPU
Profile with a sampling profiler / flame graph; the widest frames are the target.
Look for hot loops, repeated parsing/serialization, logging in hot paths, busy-wait/polling, excessive GC.

## Memory growth / leak
1. Confirm it's a leak: memory keeps growing under steady load and doesn't drop after GC.
2. Take heap snapshots at two points; diff them; find which object type grows and **what retains it.**
Common causes: unbounded caches/maps, listeners/subscriptions never removed, closures capturing large objects,
global collections, unclosed resources (files, sockets, DB cursors), timers/intervals never cleared, detached DOM nodes.

## Frontend / mobile performance
Large bundles, render-blocking resources, unnecessary re-renders, layout thrashing, main-thread work,
oversized images, long lists without virtualization. Use browser/OS performance profilers.

## Cost spikes
Correlate billing with traffic and deploys: retries storms, log volume, egress, over-provisioning, missing autoscale-down,
runaway jobs, unbounded LLM/API calls.

## Proving the fix
Benchmark or load test before/after with the same data and environment; report the metric change (e.g. p95 820 ms → 140 ms).
Add a performance regression check where feasible (benchmark in CI, query count assertion, alert threshold).
