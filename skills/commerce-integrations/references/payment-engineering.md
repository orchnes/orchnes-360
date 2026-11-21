# Payment integration engineering

## Architecture
- **Hosted checkout / hosted fields / drop-in components** so card data goes browser → provider (keeps PCI DSS scope minimal, typically SAQ A).
- Server creates a payment intent/session with the amount computed server-side; the client never sets the price.
- Order state changes are driven by **verified webhooks**, not by the browser return URL (users close tabs).

## Webhooks
1. Verify the signature with the provider secret against the **raw body**; check timestamp tolerance.
2. Respond 2xx fast; process asynchronously (queue) — slow handlers cause provider retries and duplicates.
3. **Idempotency:** store processed event IDs (unique constraint); a re-delivered event changes nothing.
4. Handle out-of-order events (e.g. `refund` before your `paid` handler finished) using the provider's object state, not event order.
5. Reconcile missed events with a periodic poll of recent payments.

## Outgoing calls
Idempotency keys on create/capture/refund requests; timeouts; retries only on safe errors; log provider request IDs.

## 3-D Secure / SCA
Use provider flows that trigger 3DS when required (EU/UK SCA, Türkiye 3D-secure norms, India AFA); handle `requires_action` states in the UI.

## Instalments
Show instalment options and total cost from the provider's BIN/instalment API; store the chosen plan with the order; refunds of instalment payments follow provider rules.

## Refunds, cancellations, disputes
- Refund only through authorized admin flows with reason codes; partial refunds can't exceed captured amount; refund status from webhooks.
- Chargebacks/disputes: alert immediately, collect evidence (order, delivery proof, communications, 3DS result), respond before the deadline; track dispute rate (card schemes penalize high rates).
- Fraud: provider risk tools, velocity limits, address/CVV checks, manual review queue for high-risk orders.

## Reconciliation (daily, automated)
orders ↔ captured payments ↔ refunds ↔ fees ↔ payouts ↔ bank statement ↔ accounting entries. Flag: paid without order, order without payment,
amount mismatch, payout shortfall. Export to accounting (see `workflow-automation`).

## Testing
Provider sandbox with test cards for success, decline, 3DS challenge, insufficient funds, expired card; webhook replay tests (duplicate, out-of-order, bad signature);
refund and partial refund; currency rounding; a live low-value test transaction after go-live, refunded.

## Go-live checklist
KYC/onboarding approved (user action) · live keys in secret store · webhook endpoint live and verified · statement descriptor set · receipts/invoices sending ·
reconciliation job running · monitoring on payment error rate and webhook failures · support knows the refund process.
