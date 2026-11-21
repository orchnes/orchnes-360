# Email security

## Domain authentication (check with DNS lookups — read-only)
```bash
dig +short TXT example.com | grep spf            # SPF
dig +short TXT _dmarc.example.com                # DMARC
dig +short TXT <selector>._domainkey.example.com # DKIM (selector from a sent email's DKIM-Signature header)
dig +short TXT _mta-sts.example.com; curl -s https://mta-sts.example.com/.well-known/mta-sts.txt
dig +short TXT _smtp._tls.example.com            # TLS-RPT
```
No `dig`? Use `host -t TXT <name>`, `nslookup -type=TXT <name>`, or a DNS-over-HTTPS query (`curl -s 'https://dns.google/resolve?name=_dmarc.example.com&type=TXT'`).

| Record | Good state |
|---|---|
| SPF | single record, includes only real senders, ends `-all` (or `~all` while testing), under 10 DNS lookups |
| DKIM | 2048-bit keys for every sending service, rotated |
| DMARC | progress `p=none` (with `rua` reports) → `quarantine` → `reject`; `adkim/aspf` alignment |
| MTA-STS + TLS-RPT | enforce TLS for inbound mail |
| BIMI (optional) | brand logo after DMARC enforcement |
| Parked domains | `v=spf1 -all`, DMARC `p=reject`, null MX — prevents spoofing of unused domains |

## Mailbox and user protection
MFA on all mailboxes; disable legacy auth (POP/IMAP basic); external sender tags; attachment/link sandboxing;
alerts on forwarding rules to external addresses (common after account takeover); phishing reporting button; awareness training.

## Phishing response
Report → pull similar messages from all mailboxes → block sender/domain/URL → check who clicked/entered credentials → reset + revoke sessions → hunt for forwarding rules and OAuth app grants.
