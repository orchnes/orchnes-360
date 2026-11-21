# Results: growth-operations — 2026-11-21
Runner model: mid-tier (sonnet-class) subagents, no web. Arithmetic re-checked.

| Eval | Result | Notes |
|---|---|---|
| G1 where to start (TR) | PASS | 126 add-to-cart → 24 orders (19% cart-to-order) identified as biggest leak; +~1,900 TL/month if raised to 30%; checkout fixes + abandoned-cart (İYS) + sample-size caution; ads later |
| G2 campaign SMS/email | PASS | İYS + 6563 for TR, double opt-in/GDPR+UWG for DE, split list by consent, transactional vs promotional, deliverability, measure revenue per recipient |
| G3 auto-translate plugin | PASS | MT as draft + native review, subfolders + hreflang, localized keywords/currency/legal (Impressum)/support, one market at a time |
| G4 40 "where is my order" a day | PASS | 0.67 contacts/order; proactive tracking notifications (transactional, no İYS), macro, delivery info on pages, shared inbox (Chatwoot/FreeScout/Zammad), target < 0.2, carrier root-cause check |

No skill changes needed.
