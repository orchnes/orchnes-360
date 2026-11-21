# CRM and lifecycle

## CRM setup
- One customer record across channels (store, marketplaces where data is allowed, support, email) with consent status and source per channel.
- Tools: store platform's built-in CRM/email, or dedicated (open-source options such as Mautic, listmonk for email; HubSpot/Klaviyo/Brevo-class SaaS) — check data residency and cost per contact.
- Segments: new, first-time buyers, repeat, VIP (top 10–20% by spend), at-risk (past expected repurchase window), lapsed, wholesale/B2B.
- Store consent with timestamp, channel, wording version and source; honour unsubscribes everywhere within legal limits.

## Core automations (start with these)
| Flow | Trigger | Content | Goal |
|---|---|---|---|
| Welcome | sign-up / first opt-in | brand story, best sellers, care guide, optional first-order incentive | first purchase |
| Abandoned cart / checkout | cart left 1–4 h | reminder with the items, answer common objections (shipping, returns, breakage guarantee) | recovery |
| Order & shipping updates | order events | confirmation, shipped with tracking, delivered | trust, fewer "where is my order" tickets |
| Post-purchase care | delivered + 2–5 days | how to use/care for product, support contact | satisfaction, fewer returns |
| Review request | delivered + 7–14 days | simple review link, photo prompt | social proof |
| Replenish / next purchase | expected repurchase window | complementary items, sets | repeat |
| Win-back | no purchase in N× usual interval | what's new, personal note, optional offer | reactivation |
| VIP | top segment | early access, thank-you, invitations | loyalty |
Transactional messages (order, shipping) don't need marketing consent; promotional content does — keep them separate.

## Metrics
Open/click rates as hints only; judge by revenue per recipient, conversion, unsubscribe and complaint rates, repeat purchase rate, time between orders.

## Deliverability
Authenticated sending domain (SPF/DKIM/DMARC — see `security-operations` email guide), clean lists (no purchased lists), gradual warm-up for new domains,
low complaint rates, plain unsubscribe link, consistent sender name.
