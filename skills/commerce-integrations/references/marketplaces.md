# Marketplaces

Last reviewed: 2026-11-21 — commissions, programmes, seller requirements and API access change; verify on each seller centre.

## Examples by region (verify seller eligibility for the business country)
| Region | Marketplaces |
|---|---|
| Türkiye | Trendyol, Hepsiburada, n11, Amazon.com.tr, Çiçeksepeti, Pazarama |
| Europe | Amazon (EU stores), eBay, Etsy, Zalando (fashion), Allegro (PL/CEE), bol (NL/BE), Cdiscount (FR), Otto (DE), Fruugo |
| North America | Amazon, Walmart Marketplace, eBay, Etsy, Target Plus (invite) |
| Latin America | Mercado Libre, Amazon (BR/MX) |
| Middle East | Amazon (AE/SA), Noon |
| Africa | Jumia, Takealot (ZA) |
| Asia | Amazon (IN/JP), Flipkart (IN), Rakuten (JP), Coupang (KR), Shopee, Lazada, Tokopedia (SEA), Tmall Global/JD (CN cross-border) |
| Handmade / niche | Etsy, Amazon Handmade, specialty marketplaces per category |

## Evaluate a channel
Buyer fit for the product · commission + fixed fees + payment fees · logistics programme (fulfilled-by-marketplace vs self-ship) and its cost ·
payout schedule · listing rules, brand registry, category approvals · return policy obligations · API availability for automation · competition and price pressure.

## Integration model
| Option | When |
|---|---|
| Native marketplace apps/plugins of the store platform | SaaS stores, few channels |
| Channel-management integrators (multi-channel tools common per region) | several channels, small team |
| Direct marketplace APIs | custom platform, high volume, special logic |

## What to sync
| Data | Direction | Rules |
|---|---|---|
| Catalog | store → channel | category and attribute mapping per channel; barcodes (GTIN/EAN) where required; images to spec |
| Stock | store → channel | single source of truth; near-real-time; safety buffer to prevent overselling; zero out on sync failure if risk is high |
| Price | store → channel | per-channel price rules (commission-aware), floor prices, currency |
| Orders | channel → store | import with channel order ID (idempotent), reserve stock immediately |
| Fulfilment & tracking | store → channel | push tracking numbers within channel SLA |
| Returns & cancellations | both | status sync, refund triggers per channel rules |
| Messages & reviews | channel → store | route to support; respond within SLA |

## Engineering
Respect rate limits and batch endpoints; queue and retry with backoff; reconcile stock and orders daily; alert on sync lag; log channel API request IDs;
store channel credentials in a secret store; monitor seller-performance metrics (late shipment, cancellation rate) because breaches can suspend accounts.
