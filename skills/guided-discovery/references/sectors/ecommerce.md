# Sector pack: E-commerce / product brand

Last reviewed: 2026-11-21 — verify all regional, legal, fee and provider-availability details against current official sources before giving specifics.

## The map
| # | Component | Plain explanation | Who |
|---|---|---|---|
| 1 | Product & market | what you sell, who buys, who competes, at what price | AI researches → user decides |
| 2 | Numbers | product cost + shipping + fees + ads vs price → profit per order | AI calculates |
| 3 | Company & tax | the legal shop licence; tax and invoicing registration | AI prepares → **user + accountant** |
| 4 | Brand name & trademark | the sign over the door and the lock on it; domain + social handles | AI checks availability → **user files** |
| 5 | Visual identity | logo, colours, product photo style, packaging, templates | AI designs → user picks |
| 6 | Sales channels | own website (your own shop) and/or marketplaces (a stall in a big mall) | AI recommends |
| 7 | Store build | platform or custom site, product pages, checkout | AI builds |
| 8 | Payments | cards, local wallets, bank transfer, buy-now-pay-later per region | AI integrates → **user signs provider** |
| 9 | Shipping & returns | carriers, rates, packaging, return policy | AI compares/integrates |
| 10 | Inventory & suppliers | stock tracking, reorder, warehouse or fulfilment partner (3PL) | AI sets up |
| 11 | Legal pages & consumer law | terms, privacy policy, cookie consent, distance-selling/returns rules | AI drafts → **user approves (lawyer if needed)** |
| 12 | Hosting, security, backups | where the shop lives, locks, copies of everything | AI sets up |
| 13 | Marketing & CRM | social media, ads, email, SEO, customer list | AI runs → **user approves publishing/spend** |
| 14 | Support & automation | order notifications, FAQ assistant, review handling | AI builds |
| 15 | Analytics | sales, conversion, ad return, stock turnover | AI reports |

## Decisions that change the path
1. **What do you sell?** (physical / digital / print-on-demand / dropshipping) — changes inventory, shipping, tax.
2. **Where do you sell first?** (one country / region / worldwide) — changes payments, tax, language, shipping.
3. **Channel at start:** **marketplace + simple own store** (fast reach + own customer data) / own store only / marketplace only.
Defaults if no answer: own country, physical goods, marketplace + hosted store builder.

## Channel options
| Option | Good for | Watch |
|---|---|---|
| Hosted store builders (Shopify-class, Wix, Squarespace, Ikas-class local builders) | fast start, no ops | monthly + transaction fees, lock-in |
| Open source (WooCommerce, PrestaShop, Medusa, Saleor, Sylius) | control, low licence cost | you run hosting, updates, security |
| Custom (Rust/other backend + headless frontend) | unique needs, large scale | highest build cost; only when ready-made limits you |
| Marketplaces (Amazon, eBay, Etsy, regional ones like Trendyol/Hepsiburada/Allegro/Mercado Libre) | instant traffic | commissions, platform rules, no customer ownership |

## Payments — what to check per region
- Is the provider available **for a business registered in the user's country** (not only for buyers there)? Some global providers don't onboard businesses in every country (e.g. check Stripe/PayPal merchant availability; regional providers such as iyzico/PayTR for Türkiye, Razorpay for India, Mercado Pago for LatAm).
- Local methods customers expect (cards with instalments, wallets, bank transfer, cash on delivery).
- Fees, payout currency and timing, chargeback handling, 3-D Secure/SCA requirements, PCI DSS scope (prefer hosted checkout to keep scope minimal).

## Legal checklist (prepare, then human approval)
Company registration · tax/VAT registration (cross-border: EU OSS/IOSS, import duties) · e-invoicing obligations where they exist ·
distance-selling and right-of-withdrawal rules · privacy law (KVKK, GDPR, CCPA…) — privacy notice, consent, data processing agreements ·
cookie consent · product safety/labelling for regulated categories (cosmetics, food, toys, electronics) · trademark.

## Stages
| Stage | Setup |
|---|---|
| Start (0–100 orders/mo) | hosted builder or marketplace, managed payments, free design tools, manual fulfilment |
| Grow (100–5k/mo) | own store as main channel, marketplace sync, inventory system, email automation, CRM |
| Scale (5k+/mo, multi-region) | headless/custom where needed, 3PL/warehouses, multi-currency, dedicated infra with failover, compliance program |
