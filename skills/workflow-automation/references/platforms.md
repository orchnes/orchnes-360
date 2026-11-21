# Choosing a platform

Last reviewed: 2026-11-21 — verify current pricing, licences and connector availability before recommending.

| Option | Best for | Cost model | Watch |
|---|---|---|---|
| n8n (self-hosted) | multi-app workflows, many connectors, code nodes | free self-hosted (check licence terms for your use), paid cloud | you run hosting, updates, backups |
| Node-RED | IoT, event streams, local/edge | free, open source | fewer SaaS connectors |
| Activepieces | Zapier-like UX, self-hostable | open-source core + paid cloud | younger ecosystem |
| Windmill | scripts as workflows (Python/TS/Go/Rust-friendly), internal tools | open source + paid | more developer-oriented |
| Temporal / durable workflow engines | long-running, mission-critical, code-first | open source + paid cloud | engineering effort |
| Power Automate | Microsoft 365 / Teams / SharePoint shops | included in some M365 plans; premium connectors paid | licensing complexity |
| Google Apps Script | Google Workspace automations | free within quotas | quotas, JS only |
| Zapier / Make | fastest setup, non-technical owners | per task/operation | cost grows with volume, data leaves your infra |
| Code (Rust service, script + cron, CI scheduled jobs, serverless) | complex logic, high volume, full testing and versioning | infra cost only | needs engineering and monitoring |

## Rules of thumb
- < ~10 simple steps, few hundred runs/day, non-technical owner → low-code (self-hosted if budget is zero).
- Complex branching, heavy data processing, strict reliability, or > ~10k runs/day → code with a queue.
- Sensitive data (health, finance, personal) → self-hosted or code in the user's own infrastructure; check where a SaaS processes data.
- Prefer webhooks over polling; prefer official APIs over browser automation (RPA only when no API exists).
- Keep workflow definitions exportable and in version control regardless of platform.
