---
name: workflow-automation
description: Design, build, test and run business automations from a plain-language request — the agent interviews the user briefly (trigger, data, destination, approvals, credentials), writes a workflow spec, picks the right platform (free/self-hosted first, or code), builds it with retries, idempotency, error alerts and human approval steps, tests it with sample data, and documents it. Covers n8n/Node-RED/Activepieces/Windmill, Zapier/Make/Power Automate, and code (Rust, scripts, schedulers, CI). Use when the user says "automate", "every time X happens do Y", "connect A to B", "workflow", "zap", "n8n", "Power Automate", "send me a notification when", or describes a repetitive task.
license: MIT
---

# Workflow Automation

An automation is done when it runs unattended, survives failures, tells someone when it can't, and never does
an irreversible thing without approval.

## 1. Interview — few questions, then build
Infer what you can from the request and context; ask only what's missing (max 5, with defaults). Question bank: `references/interview.md`.
The essentials:
1. **Trigger** — what starts it (event, schedule, webhook, new file/email/row, manual)?
2. **Data** — what information moves, from where, in what shape?
3. **Actions & destination** — what should happen, where does the result go?
4. **Approvals** — which steps need a human yes (publishing, payments, emails to customers, deletions)?
5. **Access** — which accounts are involved? Request credentials through the platform's credential store/OAuth, never in chat.

## 2. Spec before build
Write the workflow spec (`references/spec-template.md`): trigger → steps → conditions → actions → approvals →
error handling → notifications → volume/limits → owner. Show it to the user in compact form; build after confirmation
(or immediately if the user pre-approved and nothing is irreversible).

## 3. Choose the platform
Decision guide: `references/platforms.md`. Default order:
1. **What the user already uses** (Microsoft 365 → Power Automate; Google Workspace → Apps Script; existing n8n…).
2. **Free / self-hosted** (n8n self-hosted, Node-RED, Activepieces, Windmill) for multi-app workflows.
3. **Code** (Rust or a small script + scheduler / CI / serverless) when logic is complex, volume is high, or you need tests and version control.
4. **Paid SaaS** (Zapier, Make, Power Automate premium) when speed matters more than cost — state the cost.

## 4. Build it reliable
Every workflow gets:
- **Idempotency** — re-running the same event must not duplicate orders, emails or posts (dedupe key per event).
- **Retries with backoff** for transient errors; **no retry** for validation errors.
- **Timeouts** on every external call; respect API rate limits.
- **Dead-letter / failed-items list** — failures are kept with the reason, not dropped.
- **Validation** of incoming data at the trigger (webhook signatures verified, required fields checked).
- **Alerts** to a named channel/person on failure (email, Slack/Teams, Telegram, push).
- **Human approval steps** where the spec says so — the workflow pauses and waits, with a timeout and a default (usually: do nothing).
- **Least privilege** — OAuth scopes and API keys limited to what the workflow needs.
- **Logs** — each run: trigger, inputs (minus secrets/PII), steps, result, duration.
Patterns for common automations: `references/patterns.md`.

## 5. Test before going live
1. Run with sample payloads, including bad data and an upstream failure.
2. Dry-run / test mode for anything that sends, posts, pays or deletes (send to yourself, sandbox APIs).
3. Verify idempotency: trigger the same event twice → one effect.
4. Show the user the evidence (run logs, test outputs). Then enable.

## 6. Hand over
Short runbook: what it does, where it runs, how to pause it, where failures appear, how to change it, credentials used (names, not values), owner.
Store the spec and runbook with the project (see `memory`), and export the workflow definition (JSON/YAML/code) to version control.

## 7. Operate
Review failures and run stats periodically; alert on silence (a workflow that should run daily but didn't).
Propose improvements when patterns emerge (repeated manual approvals → rule; frequent failures → fix root cause, see `root-cause-analysis`).

## Anti-patterns
Building before knowing the trigger and approvals · credentials pasted into workflow nodes or chat · no error path ("it just stops") ·
silent duplicates on retry · polling every minute when a webhook exists · one giant workflow doing everything ·
automating a broken manual process without fixing it first.
