# Results: commerce-integrations — 2026-11-21
Runner model: mid-tier (sonnet-class) subagents; M1 with live web.

| Eval | Result | Notes |
|---|---|---|
| M1 TR payments (web) | PASS | opened stripe.com/global (TR not listed, dated), paytr.com details verified; iyzico pricing page 404 reported honestly; unverified rows labelled; no invented fees; integration notes |
| M2 TR brand → DE/NL | PASS | merchant-onboarding filter, iDEAL/Wero + PayPal/invoice expectations, DDP + IOSS, fragile packaging, accountant decisions; added EU product compliance (GPSR, food-contact, LUCID) → folded into skill |
| M3 unpaid / double charge | PASS | return-URL state, re-capture in webhook, no dedupe/signature/idempotency key, no reconciliation; prioritized fixes + sandbox replay tests |
| M4 Trendyol + Etsy stock | PASS | single source of truth, buffer for 1–3 stock items, idempotent order import, seller SLAs, plugin/integrator over direct API at this scale |

Change after run: destination-market product compliance added to shipping-invoicing.md.
