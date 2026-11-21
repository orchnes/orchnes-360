# Resilience, DR and automation

## Targets in money terms
- **RPO** (how much data can we lose?) and **RTO** (how long can we be down?) per system. Ask: "What does one hour of downtime cost? One hour of lost orders?"
- Availability math (per ~30-day month): 99% ≈ 7.3 h down · 99.5% ≈ 3.7 h · 99.9% ≈ 43.8 min · 99.95% ≈ 21.9 min · 99.99% ≈ 4.4 min.
- Each extra "9" roughly multiplies cost and complexity; choose the lowest target that the business accepts.

## Redundancy ladder
1. Backups + rebuild from IaC (cheapest; RTO hours).
2. Redundant app instances behind a load balancer; managed DB with standby.
3. Multi-zone everything (survives a data-centre failure).
4. Multi-region active-passive (survives a region failure).
5. Multi-region active-active (complex data consistency; rarely needed by SMBs).

## Remove single points of failure
DNS (reliable provider, low TTL for failover records) · load balancer · app servers · database · cache (app must survive cache loss) ·
queue · object storage · secrets store · CI/CD · the one person who knows how it works (document it).

## DR runbook (per critical system)
Trigger conditions · who decides · step-by-step restore/failover with commands · verification checks · communication templates · failback steps.
Store it outside the systems it describes (printed/offline copy too).

## Drills
Quarterly: restore a backup end-to-end; fail over the database in staging (production when mature); recover from "deleted the production bucket" scenario.
Record actual RTO/RPO and fix the gaps.

## Automation
- **IaC:** OpenTofu/Terraform or Pulumi for cloud resources; Ansible for servers; everything reviewed in Git.
- **CI/CD:** build once, deploy the same artifact to staging then production; health checks; automatic rollback on failed checks; blue-green or canary when traffic justifies.
- **Config & secrets:** environment config in Git (no secrets); secrets from a vault/secret manager.
- **Routine jobs:** patching windows, certificate renewal, backup verification, cost reports — automated and alerting on failure (see `workflow-automation`).
- **GitOps** for Kubernetes setups.
