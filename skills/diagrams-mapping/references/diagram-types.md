# Diagram templates (Mermaid)

Each block is valid Mermaid — all rendered with mermaid-cli 11.4.2 on 2026-11-21. Replace names; keep the structure.

## Context (C4 level 1, as flowchart)
```mermaid
flowchart LR
  customer([Customer]) -- "browses, orders" --> shop[Online shop]
  admin([Shop owner]) -- "manages products, orders" --> shop
  shop -- "payment requests" --> psp[(Payment provider)]
  shop -- "labels, tracking" --> carrier[(Carrier API)]
  shop -- "e-invoices" --> einv[(E-invoice integrator)]
```

## Containers / components
```mermaid
flowchart LR
  subgraph shop[Online shop]
    web[Web frontend] -- "REST/JSON" --> api[API service]
    api -- "SQL" --> db[(PostgreSQL)]
    api -- "jobs" --> q[[Job queue]]
    q --> worker[Worker]
  end
  worker -- "webhooks in, refunds out" --> psp[(Payment provider)]
```

## Sequence
```mermaid
sequenceDiagram
  actor C as Customer
  participant S as Shop API
  participant P as Payment provider
  C->>S: Checkout (cart)
  S->>P: Create payment session (amount from server)
  P-->>C: Hosted payment page
  C->>P: Pays (3-D Secure)
  P-->>S: Webhook payment.succeeded (signed)
  S->>S: Verify signature, dedupe event, mark order paid
  S-->>C: Order confirmation email
```

## Flowchart with decisions
```mermaid
flowchart TD
  start([Return request]) --> within{Within 14 days?}
  within -- No --> reject[Explain policy, offer help]
  within -- Yes --> damaged{Arrived damaged?}
  damaged -- Yes --> photo[Ask for photo] --> replace[Send replacement, free return]
  damaged -- No --> label[Send return label] --> inspect[Inspect on arrival] --> refund[Refund]
```

## ER diagram
```mermaid
erDiagram
  CUSTOMER ||--o{ ORDER : places
  ORDER ||--|{ ORDER_ITEM : contains
  PRODUCT ||--o{ ORDER_ITEM : "appears in"
  ORDER ||--o{ PAYMENT : "paid by"
  ORDER {
    bigint id PK
    bigint customer_id FK
    text status
    bigint total_minor
    char currency
    timestamptz created_at
  }
```

## State machine
```mermaid
stateDiagram-v2
  [*] --> created
  created --> payment_pending
  payment_pending --> paid
  payment_pending --> cancelled
  paid --> fulfilling
  fulfilling --> shipped
  shipped --> delivered
  paid --> refunded
  delivered --> returned
  delivered --> [*]
```

## Deployment / infrastructure
```mermaid
flowchart LR
  users([Users]) --> cdn[CDN]
  cdn --> lb[Load balancer]
  subgraph region[Cloud region]
    lb --> app1[App instance 1]
    lb --> app2[App instance 2]
    app1 & app2 --> dbp[(DB primary)]
    dbp -. "streaming replication" .-> dbs[(DB standby)]
  end
  dbp -. "WAL + nightly backups" .-> backup[(Object storage, immutable)]
```

## Swimlane process (as subgraphs)
```mermaid
flowchart LR
  subgraph Customer
    a[Places order]
  end
  subgraph Shop
    b[Confirms payment] --> c[Packs order]
  end
  subgraph Carrier
    d[Picks up] --> e[Delivers]
  end
  a --> b
  c --> d
```

## User journey
```mermaid
journey
  title Buying a handmade mug
  section Discover
    Sees Instagram post: 4: Customer
    Visits product page: 3: Customer
  section Buy
    Checks shipping cost: 2: Customer
    Pays with instalments: 4: Customer
  section After
    Receives well-packed mug: 5: Customer
```

## Timeline / Gantt
```mermaid
gantt
  title Launch plan
  dateFormat YYYY-MM-DD
  section Setup
  Company and tax registration :a1, 2026-12-01, 14d
  Brand and logo               :a2, 2026-12-01, 21d
  section Build
  Store and payments           :b1, after a1, 21d
  section Launch
  Soft launch                  :milestone, after b1, 0d
```

## Mind map / knowledge map
```mermaid
mindmap
  root((Online ceramics brand))
    Product
      Mugs
      Plates
    Channels
      Own site
      Marketplaces
    Operations
      Packaging
      Shipping
    Compliance
      KVKK
      Distance selling
```

## Other tools
PlantUML (rich UML, C4-PlantUML library) · D2 (clean layouts, good for architecture) · Graphviz DOT (large generated dependency graphs) ·
Excalidraw/draw.io (hand-drawn or free-form, keep the source file in the repo).
