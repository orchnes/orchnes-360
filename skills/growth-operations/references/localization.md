# Localization and new markets

## Decide the market first
Use `market-research` (demand, competitors, price level) and `commerce-integrations` (payments, shipping, tax) before translating anything.
Enter one market at a time; measure; then the next.

## Internationalization (i18n) in the product
- All UI strings externalized (no hard-coded text); ICU message format for plurals/gender; Fluent or gettext-style tooling (in Rust: e.g. fluent-rs).
- Locale-aware formatting: dates, numbers, currency (symbol position, decimal separator), addresses, phone numbers, sizes/units.
- Unicode everywhere; Turkish casing (İ/i, I/ı) handled correctly in search and uppercase transforms; right-to-left support if Arabic/Hebrew is planned.
- Multi-currency prices set per market (rounded, psychologically sensible), not just converted live; taxes shown as locals expect.

## Content localization
- Professional or carefully reviewed translation for product pages, checkout, emails, legal pages; machine translation only as a draft, reviewed by a native speaker.
- Adapt, don't just translate: units, sizing, examples, holidays, imagery, tone (formality levels like sen/siz, du/Sie, tu/vous).
- Local legal pages (imprint, withdrawal terms, privacy) — see `company-setup`.

## SEO for multiple languages
Separate URLs per language (subfolders `/de/`, `/nl/` are simplest), **hreflang** tags with x-default, localized keyword research (people search differently, not just in another language),
localized metadata and structured data; don't auto-redirect by IP without letting users choose.

## Support in the new market
Support hours covering the market's time zone, local-language macros and help articles, local return address or clear international returns process.

## Launch checklist per market
Payments with local methods · shipping and duties at checkout · prices in local currency · translated and reviewed site, emails, legal pages · hreflang live ·
support ready · marketplace listings (optional) · local reviews/social proof plan · measurement split by market.
