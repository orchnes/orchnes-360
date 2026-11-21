# Extracting maps from real systems

Always cite the evidence (file:line or object name) for each element you draw.

| Map | Evidence sources | Techniques |
|---|---|---|
| Module/dependency graph | imports, manifests | language tools: `cargo tree`, `cargo modules` (Rust), `go mod graph`, `pydeps`/`import-linter` (Python), `madge`/`dependency-cruiser` (JS/TS), `jdeps` (Java); or `rg -n "^use |^import |require\("` and aggregate by directory |
| API surface | route definitions, OpenAPI specs | `rg -n "\.route\(|Router::new|@app\.(get|post)|router\.(get|post)|@(Get|Post)Mapping"`; render from OpenAPI when present |
| Data model (ERD) | migrations, schema, ORM models | `pg_dump --schema-only` (read-only role), migration files, ORM entity definitions; tools like SchemaSpy or `mermerd` can generate ERDs |
| Runtime topology | docker-compose, Kubernetes manifests, Helm charts | services, ports, volumes, `depends_on`, Services/Ingress objects |
| Infrastructure | Terraform/OpenTofu, CloudFormation, Pulumi | resources and references (`terraform graph` → Graphviz), networks, security groups |
| Message flows | queue/topic configs, producers/consumers in code | grep for publish/subscribe calls, topic names |
| Delivery pipeline | CI/CD config (`.github/workflows`, `.gitlab-ci.yml`) | jobs, stages, environments, approvals |
| Business process | SOPs, tickets, interviews | list steps, roles, decisions, hand-offs; confirm with the people who do the work |
| State machine | enums, transition functions, status columns | find allowed transitions in domain code, not just the enum |

## Process
1. Collect raw facts into a table: element, type, evidence.
2. Group into the abstraction level the diagram needs (e.g. directories → containers).
3. Draw; mark unverified parts dashed with `?`.
4. Ask an owner of the system (or the user) to confirm unclear edges.

## Large systems
Draw a context diagram first, then one diagram per container or flow. Generated full-dependency graphs are evidence, not communication — summarize them.
