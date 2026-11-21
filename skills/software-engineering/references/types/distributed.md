# Distributed / cloud-native systems

## Layers
| Layer | Contents |
|---|---|
| Edge | CDN, API gateway, load balancer, auth at the edge |
| Services | each service internally layered (see web.md backend) and owning its data |
| Communication | sync (HTTP/gRPC) and async (queues, event streams) |
| Data | per-service databases, caches, object storage |
| Platform | containers/orchestration, service mesh, secrets, IaC |
| Observability | logs, metrics, traces with correlation ids |

Rules: assume every network call can fail, be slow or happen twice — timeouts, retries with backoff + jitter,
idempotent handlers, circuit breakers; no shared databases between services; prefer async events for cross-service workflows (sagas/outbox pattern);
infrastructure as code; services are stateless, state lives in data stores; split a service only along a clear domain boundary.
Watch: distributed transactions, clock skew, eventual consistency surfacing in UX, cascading failures,
cost (egress, idle resources), blast radius of deploys, least-privilege IAM.

## Typical tests
Unit and integration per service; consumer-driven contract tests between services; end-to-end in a staging environment;
load tests; chaos/failure-injection tests; deployment via canary or blue-green with automated rollback.
