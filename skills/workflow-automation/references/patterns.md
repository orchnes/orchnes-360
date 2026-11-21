# Common automation patterns

Each line: trigger → steps → human gate → notifications. Adapt; keep reliability rules from SKILL.md.

| Pattern | Flow | Human gate |
|---|---|---|
| Lead capture | form/ad lead → validate + dedupe by email → CRM contact → welcome email → notify sales | none (template pre-approved) |
| Order processing | new order → check payment captured → invoice (e-invoice where required) → shipping label → customer notification → stock update | refunds and cancellations |
| Low stock | daily stock check → items below threshold → draft purchase order → supplier email | sending the PO |
| Content calendar | approved row in calendar → generate/attach media → schedule post via official API → collect metrics next day | publishing (or pre-approved calendar) |
| Customer support triage | new ticket/email → classify + priority → route to queue → auto-reply with ETA → escalate if VIP/urgent | refunds, legal/medical topics |
| Reports | schedule → query sources → build summary/chart → send to channel | none |
| Monitoring & alerts | metric/uptime check → threshold crossed → alert with context + runbook link → auto-ticket | auto-remediation beyond safe actions |
| Backups | schedule → dump DB/files → encrypt → copy to second location → verify restore sample weekly → report | deleting old backups beyond policy |
| Document intake | new file in folder/email attachment → extract fields → validate → write to system → archive original | low-confidence extractions |
| Meeting follow-up | meeting ends → transcript → summary + action items → send to attendees → create tasks | sending externally |
| Security hygiene | daily → check new CVEs for your dependencies, expiring certificates/domains, failed logins spikes → alert | any blocking action |

## Notifications
Match urgency to channel: failures that need action now → push/chat mention; routine → daily digest; never spam success messages.
