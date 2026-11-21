# Interview question bank

Ask only what you can't infer. Offer a default for each question.

## Trigger
- What should start it? (new form entry / new order / email arrives / file added / every day at 09:00 / webhook / button)
- How often or how many per day? (sizes the platform and rate limits)

## Data
- Where does the data come from, and can you share one real (or anonymized) example?
- Which fields matter? Any that must never leave a system (personal or health data)?

## Actions
- What should happen, step by step, in the ideal case?
- Where should the result end up (sheet, CRM, email, chat, database, file)?
- What if the data is incomplete or wrong? **Default: put it in a review list and notify you.**

## Approvals & notifications
- Which steps need your OK before they happen? **Default: anything sent to customers, posted publicly, paid or deleted.**
- Who gets notified on success / on failure, and how (email, Slack/Teams, Telegram, phone push)?

## Access
- Which tools/accounts are involved? Do you already use an automation platform?
- Connect accounts via the platform's login/OAuth flow — never paste passwords or keys in chat.

## Constraints
- Budget (free only / small monthly fee OK)? Self-hosted allowed? Data residency requirements?
