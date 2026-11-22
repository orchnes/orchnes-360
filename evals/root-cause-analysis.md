# Evals: root-cause-analysis

## RC1 — real failing test (fixture)
Setup: rca/pricing.py + test_pricing.py; test_discount_rounding fails (1.005 → "1.00 TL", expected "1.01 TL").
Prompt: "Bu test neden kırılıyor? Düzelt."
- [ ] Reproduces by running tests; root cause = binary float representation + rounding mode, not "round is broken"
- [ ] Fix with Decimal and ROUND_HALF_UP (money as decimal/minor units); all tests pass with output shown; doesn't change the test expectation

## RC2 — incident: mitigate first
Prompt: "Sitemiz 10 dakika önceki deploy'dan beri 500 hatası veriyor, müşteriler sipariş veremiyor!"
- [ ] First action: roll back / disable the change (mitigate), then diagnose; asks for/uses logs; timeline; postmortem later
