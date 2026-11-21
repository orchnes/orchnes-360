# Payments by region — candidates to verify

Last reviewed: 2026-11-21. **Every entry is a starting point, not a guarantee.** Before recommending, verify on the provider's official site:
(1) merchant onboarding for the business's registration country, (2) buyer methods/currencies, (3) fees and payout terms, (4) restricted businesses.
Global providers often accept *buyers* from a country while not onboarding *merchants* registered there.

## Global / multi-region processors (check country lists)
Stripe, Adyen, Checkout.com, PayPal/Braintree, Worldpay, Square (limited countries), Shopify Payments (only in supported countries; otherwise third-party gateways).
Merchant-of-record for digital goods/SaaS: Paddle, Lemon Squeezy-class, FastSpring. Payout/cross-border receiving: Payoneer, Wise Business.

| Region | Local / regional providers (examples) | Methods buyers expect | Notes to check |
|---|---|---|---|
| **Türkiye** | iyzico, PayTR, Param, Sipay, bank virtual POS (sanal POS) from major banks | cards with **instalments (taksit)**, troy, bank transfer (havale/EFT), cash on delivery | Stripe and PayPal merchant availability for TR-registered businesses has historically been absent — verify current status; BDDK-licensed payment institutions; e-Fatura/e-Arşiv link |
| **EU** | Adyen, Mollie, Stripe, Klarna, Nexi, Worldline | cards, SEPA Direct Debit, iDEAL→Wero (NL), Bancontact (BE), BLIK (PL), Swish (SE), MobilePay (DK/FI), Satispay (IT), BNPL (Klarna) | PSD2/SCA (3-D Secure); local method coverage per country; VAT OSS |
| **UK** | Stripe, Adyen, Checkout.com, PayPal, Klarna, GoCardless | cards, Apple/Google Pay, Open Banking payments, BNPL | SCA; UK VAT |
| **US / Canada** | Stripe, PayPal/Braintree, Square, Adyen, Authorize.net, Moneris (CA) | cards, Apple/Google Pay, Shop Pay, PayPal/Venmo, BNPL (Affirm, Afterpay, Klarna), ACH | state sales tax nexus (tax engines), chargeback rules, Interac (CA) |
| **Latin America** | Mercado Pago, dLocal, EBANX, PagSeguro/PagBank, Conekta (MX), Kushki | **PIX** and boleto (BR), OXXO and SPEI (MX), cards with instalments (parcelado/cuotas), cash vouchers | local entity often needed; cross-border via dLocal/EBANX |
| **Middle East (GCC)** | Checkout.com, PayTabs, Tap Payments, HyperPay, Telr, Amazon Payment Services | cards, **mada** (SA), Apple Pay, BNPL (Tabby, Tamara), cash on delivery | local licensing and settlement currency |
| **Africa** | Paystack, Flutterwave, Ozow, PayFast/Peach (ZA), DPO | mobile money (**M-Pesa**, MTN MoMo), cards, bank transfer, USSD | FX and payout constraints vary widely |
| **India** | Razorpay, PayU, Cashfree, CCAvenue | **UPI**, RuPay, netbanking, wallets, EMI | RBI rules (recurring mandates, card tokenization), local entity |
| **China** | Alipay, WeChat Pay (via cross-border acquirers or local entity) | wallets dominate | cross-border acquiring partners; regulatory complexity |
| **Japan / Korea** | GMO, Komoju, PAY.JP (JP); Toss Payments, KG Inicis, NHN KCP (KR) | JCB, konbini, PayPay (JP); KakaoPay, Naver Pay, Toss (KR) | local language checkout |
| **Southeast Asia** | Xendit, 2C2P, Omise/Opn, PayMongo | GCash (PH), PromptPay (TH), DANA/OVO/GoPay (ID), GrabPay, bank QR codes | per-country methods differ a lot |
| **Oceania** | Stripe, Adyen, PayPal, Tyro, Windcave | cards, Afterpay, Zip, PayID/PayTo (AU), POLi (NZ) | GST registration thresholds |

## Choosing
1. Filter by merchant onboarding in the business country (hard constraint).
2. Coverage of the top 2–3 methods buyers use in each target market.
3. Total cost: transaction %, fixed fee, FX markup, instalment cost, chargeback fee, payout delay, reserves.
4. Platform fit (plugin for the store platform, API quality, sandbox, webhooks).
5. Two providers for resilience at higher volume (failover and better approval rates).
