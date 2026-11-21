# Database: choice, administration, security, backup, tiers, failover

## Choose
| Need | Default |
|---|---|
| Business data (orders, users, money) | PostgreSQL (or MySQL/MariaDB if the stack expects it) |
| Cache, sessions, rate limits, queues (light) | Redis/Valkey |
| Full-text search at scale | PostgreSQL FTS first; OpenSearch/Meilisearch when needed |
| Analytics / logs at volume | ClickHouse or a warehouse |
| Files and media | object storage (S3-compatible), not the database |
Managed DB service when the team lacks a DBA; self-managed only with tested backup/failover automation.

## Administration
- Separate roles: owner (migrations only), application (CRUD on its schema), read-only (reporting), no shared superuser use.
- Migrations versioned and reviewed (tools such as sqlx/refinery for Rust, Flyway, Liquibase, framework migrators); backward-compatible deploys (expand → migrate → contract).
- Connection pooling; statement timeouts; slow-query log reviewed weekly; indexes for real query patterns; vacuum/analyze (PostgreSQL) monitored.
- Capacity alerts: disk 70/85%, connections, replication lag, long transactions.

## Security
Never exposed to the internet (private network/VPN/bastion) · TLS for connections · encryption at rest · least-privilege roles ·
secrets in a vault and rotated · audit logging for admin actions and sensitive tables · PII minimized, masked in non-production copies ·
patch minor versions regularly; plan major upgrades before end-of-life.

## Backup — the 3-2-1-1-0 rule
**3** copies, on **2** different media/services, **1** off-site, **1** offline or immutable (protects against ransomware and admin mistakes), **0** errors in restore tests.
- Full/base backups daily + continuous WAL/binlog archiving for **point-in-time recovery (PITR)**.
- Encrypt backups; store keys separately; retention policy that meets legal requirements.
- **Restore test** at least monthly (automate: restore to a scratch instance, run integrity checks, record duration = your real RTO).
Tools: managed PITR, pgBackRest/WAL-G/Barman (PostgreSQL), Percona XtraBackup (MySQL), restic/borg for files.

## Storage tiers (hot → warm → cold → archive)
| Tier | Data | Medium |
|---|---|---|
| Hot | active records, current indexes | primary DB on fast SSD/NVMe |
| Warm | recent history, reporting | replicas, partitioned tables, cheaper SSD |
| Cold | old records kept for compliance | object storage, compressed exports |
| Archive | legal retention, rarely accessed | archive-class object storage / offline media |
Use table partitioning and lifecycle policies to move data automatically; document how to bring cold data back.

## Local + cloud combination
Examples: primary on a local/on-prem server with encrypted off-site backups in cloud object storage; or primary in cloud with a local backup copy
for fast restores and sovereignty. Test both restore paths.

## Replication and failover
| Level | Setup | Typical RPO / RTO (~) |
|---|---|---|
| Single instance + backups | daily backups + PITR | minutes of data / hours to restore |
| Primary + standby (async) | streaming replica, manual or automatic promotion | seconds of data / minutes |
| Primary + synchronous standby | commit waits for replica | ~0 data loss / minutes; higher write latency |
| Multi-zone managed HA | provider-managed failover | seconds / ~1–2 min |
| Multi-region | cross-region replica + DR runbook | depends on design; complex |
Automatic failover tooling: managed HA, Patroni (PostgreSQL), orchestrator/Group Replication (MySQL). Avoid split-brain (fencing, quorum).
**Run failover drills**; an untested failover is a hope, not a plan.
