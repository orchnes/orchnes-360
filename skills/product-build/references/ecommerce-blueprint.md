# E-commerce / platform blueprint

## Modules
| Module | Core responsibilities | MVP? |
|---|---|---|
| Catalog | products, variants (size/colour), media, categories, attributes | ✅ |
| Pricing | price lists, currency, tax-inclusive/exclusive display | ✅ |
| Inventory | stock per variant/location, reservations, low-stock alerts | ✅ |
| Cart | guest + logged-in carts, merge on login, expiry | ✅ |
| Checkout | address, shipping method, totals, terms acceptance | ✅ |
| Payments | hosted payment page/redirect or provider SDK (`commerce-integrations`); webhooks; refunds | ✅ |
| Orders | state machine, history, cancellations, returns | ✅ |
| Shipping | rates, labels, tracking, carrier integration | ✅ (basic) |
| Tax & invoicing | VAT rules, e-invoice/e-archive where required | ✅ (per country) |
| Customers & auth | accounts, addresses, consent records, GDPR/KVKK rights | ✅ |
| Notifications | order emails/SMS, templates, preferences | ✅ |
| Admin | see roles.md (RBAC, audit log) | ✅ |
| Search | full-text + filters (start in Postgres) | ✅ (basic) |
| CMS pages | about, policies, landing pages | ✅ (basic) |
| Promotions | coupons, rules, free shipping thresholds | later |
| Reviews | moderation, verified-purchase badge | later |
| Marketplace sync | channels (`commerce-integrations`) | later |
| Analytics | funnel, revenue, cohorts (`analysis`) | later |
| AI assistant | (`ai-integration`) | later |

## Rules that prevent expensive bugs
- **Money:** integer minor units or decimal; rounding rule defined once; currency stored with every amount.
- **Order state machine:** `created → payment_pending → paid → fulfilling → shipped → delivered`, branches `cancelled`, `refunded`, `partially_refunded`, `returned`;
  transitions only via domain functions; every transition logged.
- **Idempotency:** payment webhooks and order creation keyed by provider event/idempotency key; re-delivery has no extra effect.
- **Stock:** reserve at checkout start (with expiry) or at payment, decide explicitly; prevent overselling with row locks or atomic updates.
- **Prices are re-validated server-side** at checkout; never trust client totals.
- **Card data never touches your servers** (hosted payment fields/pages) to minimize PCI DSS scope.
- **Consent and legal acceptance** stored with timestamp and version (terms, privacy, marketing).
- **Audit log** for admin changes to prices, stock, orders, refunds.

## Typical API surface (REST, versioned)
`GET /products`, `GET /products/{slug}`, `POST /carts`, `POST /carts/{id}/items`, `POST /checkout`, `POST /payments/webhook`, `GET /orders/{id}` (owner only),
`POST /returns`, admin under `/admin/*` with RBAC.

## MVP cut
One country, one currency, one payment provider, one carrier, basic search, essential emails, admin for products/orders/refunds.
Everything else waits for real customer demand.
