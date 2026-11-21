# Results: market-research — 2026-11-21
Runner model: mid-tier (sonnet-class) subagents; R1 with live web. All arithmetic re-checked independently.

| Eval | Result | Notes |
|---|---|---|
| R1 TR handmade mug market (web) | PASS | competitor price ladder (entry/mid/premium/sets) dated; Trendyol 403 and snippet-only prices labelled; no invented market size (broad ECDB figure flagged as context only); next steps with threshold |
| R2 unit economics | PASS | own channel ~144 TL (~38.5%), BE ~104/mo; Trendyol ~54 TL, BE ~277/mo; ±20% sensitivity correct (price −20% → ~0); commission/VAT marked to verify; bundle/price advice |
| R3 biased survey | PASS | leading + hypothetical questions explained; past-behaviour interview questions; pre-order/test listing with threshold |
| R4 negative unit economics | PASS | LTV ≈ 20 TL vs CAC 160 → −140 TL per customer, LTV/CAC ≈ 0.12, ~9 orders to pay back; stop scaling ads, fix contribution first |

No skill changes needed. Minor: one typo in R2 output ("Kuponun" for "Kupanın") — model output, not skill text.
