# Domains, handles, licences, trade secrets

## Domains
- Register the main domain plus key variants (country TLD of the main market, .com, common typos if budget allows); defensive registrations for high-value brands.
- Registrar account: company-owned (not a freelancer's), 2FA, registrar lock, auto-renew with a valid card, renewal alerts, WHOIS privacy where allowed, DNSSEC.
- Country rules vary (e.g. .com.tr registration rules were liberalised under TRABIS — verify current requirements).
- Disputes: UDRP (gTLDs) or country procedures for cybersquatting; act early and keep evidence of your rights.

## Social handles and app names
Reserve the same handle across relevant platforms early; business accounts owned by the company with role-based access (see `security-operations` identity guide);
app store names and developer accounts in the company's name; impersonation reporting channels bookmarked.

## Marketplace brand registries
Enrol registered (or pending, where accepted) trademarks in marketplace brand-protection programmes (e.g. Amazon Brand Registry; check each marketplace's programme)
to control listings, report counterfeits and access brand tools.

## Open-source and third-party licences
| Licence family | Typical obligations when distributing |
|---|---|
| Permissive (MIT, BSD, Apache-2.0) | keep copyright/licence notices; Apache-2.0 adds NOTICE file and patent terms |
| Weak copyleft (LGPL, MPL-2.0) | share changes to the licensed files/library; linking rules |
| Strong copyleft (GPL) | distributing combined software requires releasing source under GPL |
| Network copyleft (AGPL) | offering it as a network service can trigger source-sharing |
Keep an SBOM with licences (`cargo deny`, license scanners); approve new licences against a policy; fonts, icons, images and AI models have licences too.
This repository itself is MIT — keep the LICENSE file and copyright notice with copies.

## Trade secrets
Identify what's secret (recipes, glaze formulas, supplier terms, customer lists, unreleased code) · limit access · NDAs with partners and manufacturers ·
confidentiality clauses in employment/freelance contracts · mark documents confidential · offboarding: revoke access, return materials.
