# Shipping, invoicing and tax

Last reviewed: 2026-11-21 — verify carriers' services/APIs and all tax rules with official sources and an accountant.

## Shipping
- **Carriers (examples):** Türkiye — Yurtiçi, Aras, MNG/DHL eCommerce, PTT Kargo, Sürat, marketplace logistics (e.g. Trendyol Express, HepsiJet); Europe — DHL, DPD, GLS, UPS, PostNL, InPost (lockers);
  US — USPS, UPS, FedEx; global express — DHL Express, FedEx, UPS. Multi-carrier APIs/aggregators exist per region (e.g. Shippo, EasyPost, Sendcloud) — check coverage.
- Rate shopping by zone/weight/dimensions; volumetric weight rules; free-shipping thresholds priced into margins.
- Labels via API at fulfilment; tracking webhooks → customer notifications; delivery proof stored (helps with disputes).
- Returns: pre-paid return labels or codes, return reasons captured, inspection step, refund trigger.
- Address validation and formatting per country; pickup points/lockers where popular.
- Packaging for fragile goods (e.g. ceramics): drop-test, insurance options, damage-claim process with photos.

## Cross-border
HS codes on products · commercial invoice data via label APIs · Incoterms: DAP (buyer pays duties on delivery) vs **DDP** (you collect duties at checkout — better conversion) ·
EU IOSS for low-value imports · restricted/prohibited items per destination · customs-friendly product descriptions · landed-cost calculation at checkout.

**Product compliance in the destination market** (verify per product): EU General Product Safety Regulation (EU responsible person, labelling), CE marking where applicable,
food-contact material rules for tableware/kitchenware, packaging and WEEE/battery registrations (e.g. Germany's LUCID), local-language legal pages (imprint, withdrawal terms, privacy).

## Invoicing and e-invoicing
- **Türkiye:** e-Fatura (B2B between registered taxpayers) / e-Arşiv Fatura (B2C), typically through a GİB-authorized private integrator (özel entegratör) or GİB portal; e-İrsaliye for dispatch where required; obligations depend on turnover/sector thresholds — accountant confirms.
- **EU:** VAT invoices with required fields; growing e-invoicing mandates (e.g. Italy SDI, France and Belgium rollouts, ViDA reforms) — check the country.
- **Other regions:** e.g. Mexico CFDI, Brazil NF-e, India GST e-invoice — local integrators usually required.
- Invoice numbering sequential and immutable; credit notes for refunds; archive retention per law.

## Tax
- **EU VAT:** distance sales over the EU-wide threshold → destination-country VAT, report via **OSS**; digital services always destination VAT.
- **UK VAT**, **US sales tax** (economic nexus per state; marketplaces often collect as facilitators), **GST** (AU/NZ/IN/SG/CA) — registration thresholds vary.
- Use a tax engine (provider-native tax, Avalara-class, TaxJar-class) when selling across many jurisdictions; or a merchant-of-record for digital goods.
- Prices shown tax-inclusive where consumers expect it (EU, UK, TR, AU); tax breakdown on invoices.
