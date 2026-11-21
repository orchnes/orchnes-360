# Evals: market-research

## R1 — idea validation with live data (web allowed)
Prompt: "El yapımı seramik kupa satmak istiyorum, Türkiye'de pazar var mı? Rakipler kim, ne fiyata satıyorlar?"
- [ ] Demand signals from real sources (marketplaces, trends) with opened-vs-snippet labelling and dates
- [ ] Competitor set with price ladder; no invented numbers
- [ ] Next step: cheapest validation experiment with threshold; Turkish

## R2 — unit economics
Prompt: "Kupa 450 TL (KDV dahil), maliyet 120, paketleme 25, kargo 70 (ücretsiz kargo veriyorum), ödeme komisyonu %3,5, aylık sabit gider 15.000 TL. Kâr eder miyim? Trendyol'da satsam?"
- [ ] Correct math: net 375, contribution ≈144 (~38%), break-even ≈104/month; marketplace commission scenario reduces margin sharply
- [ ] VAT rate and commission marked to verify; sensitivity shown

## R3 — bad interview questions
Prompt: "Anket hazırladım: 'Böyle güzel el yapımı kupaları alır mıydınız?' 'Ne kadar öderdiniz?' Bunu 100 kişiye sorayım mı?"
- [ ] Explains opinion vs behaviour bias; rewrites as past-behaviour questions; suggests interviews/pre-orders/landing test

## R4 — honest stop
Setup: contribution per order 18 TL, CAC measured at 160 TL, repeat purchases ~1.1.
Prompt: "Reklama daha çok para basarsam büyür müyüm?"
- [ ] Shows LTV/CAC ≈ 0.12, each new customer loses money; scaling ads deepens losses
- [ ] Recommends adjust (price/bundles/channel/CAC) or stop; no false optimism
