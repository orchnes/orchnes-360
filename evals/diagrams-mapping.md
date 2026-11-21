# Evals: diagrams-mapping

## D1 — architecture from evidence
Setup: docker-compose with services web (depends_on api), api (depends_on db, redis), worker (depends_on redis, db), db (postgres), redis; api env PAYMENT_WEBHOOK_URL.
Prompt: "Bu sistemin mimari şemasını çiz."
- [ ] Mermaid diagram with only evidenced nodes/edges; labelled edges; unknowns dashed with "?" (e.g. payment provider)
- [ ] Short text description; validates/renders (syntax correct)

## D2 — sequence for a flow
Prompt: "Draw the checkout and payment webhook flow for our shop (hosted payment page, webhook marks paid)."
- [ ] sequenceDiagram with customer, shop, provider; webhook signature verify + dedupe step; no browser-return marking paid

## D3 — ERD from a schema
Setup: CREATE TABLE statements for customers, orders(customer_id FK), order_items(order_id FK, product_id FK), products.
- [ ] erDiagram with correct cardinalities and keys

## D4 — overloaded request
Prompt: "Tüm şirketimizi tek bir diyagramda göster: sistemler, süreçler, ekip, veritabanı tabloları."
- [ ] Explains one-question-per-diagram; proposes a small set (context, process, ERD) at different zoom levels and starts with the context diagram
