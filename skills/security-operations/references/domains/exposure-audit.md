# Exposure audit — checklist for your own systems

Read-only commands; run on systems you administer. Each area: **check → pass criterion**. Adapt commands to the OS.

## 1. Installed software, versions, updates, end-of-life
```bash
dpkg -l | wc -l; apt list --upgradable 2>/dev/null            # Debian/Ubuntu
rpm -qa | wc -l; dnf check-update -q                         # RHEL/Fedora
brew outdated                                                # macOS (Homebrew)
winget upgrade                                               # Windows (PowerShell)
docker images --format '{{.Repository}}:{{.Tag}}'; trivy image <img>   # containers
syft dir:/ -o cyclonedx-json > sbom.json; grype sbom:sbom.json         # full inventory → CVEs
```
Pass: no pending security updates older than SLA; no end-of-life OS/runtime/app (check endoflife.date or vendor lifecycle); every installed app known and needed.

## 2. Ports and services
```bash
ss -tulpn || netstat -tulpn                 # what listens locally, which process
nmap -sV <your-public-ip-or-domain>         # what the internet sees — run from OUTSIDE your network, on your own assets
```
Pass: only intended ports exposed; admin panels, databases (3306, 5432, 27017, 6379, 9200), RDP/SSH not open to the world (VPN/zero-trust/allow-list);
no unexpected listeners; banners don't leak versions; UPnP off on routers.

## 3. Passwords & credentials
- Default credentials changed on every device/app (routers, cameras, NAS, printers, CMS, DB admin tools) — compare against the vendor's documented defaults; no brute forcing.
- SSH: `sshd -T | grep -Ei 'passwordauthentication|permitrootlogin|pubkeyauthentication'` → passwords off, root login off, keys on.
- Secrets on disk/repos: `gitleaks detect` / `trufflehog filesystem <path>` → none; `.env`, keys, dumps not world-readable.
- Policy, MFA, hashing algorithms and breach checks: see `identity.md`.
- Service accounts and API keys: owner known, scoped, rotated, unused ones revoked.

## 4. Modules, plugins, extensions
| Where | Check |
|---|---|
| Kernel | `lsmod` — unneeded modules (e.g. uncommon filesystems, firewire, bluetooth on servers) blacklisted |
| Web server | `apachectl -M` / `nginx -V` — unused modules disabled |
| Language runtimes | `php -m`, Python/Node packages — unused removed, vulnerable updated |
| CMS | WordPress/Drupal/Joomla plugins & themes: updated, maintained, unused deleted (not just disabled) |
| Browsers / IDEs | extensions reviewed; remove unknown or abandoned ones (common malware vector) |
| Package install hooks | review postinstall scripts of new dependencies; lockfiles committed |
Pass: everything installed is needed, maintained and current.

## 5. Users & privileges
`getent passwd`, `getent group sudo wheel`, `sudo -l`, `cat ~/.ssh/authorized_keys`, `find / -perm -4000 -type f 2>/dev/null` (SUID) →
no stale or shared accounts, minimal sudo, every SSH key has an owner, no unexpected SUID binaries.

## 6. Persistence & scheduled tasks
`crontab -l; ls /etc/cron.*; systemctl list-timers; systemctl list-unit-files --state=enabled`, Windows Task Scheduler / startup items →
every job known and owned.

## 7. TLS & certificates
`testssl.sh <host>` → TLS 1.2+ only, strong ciphers, valid chain, HSTS, auto-renewal, expiry alerts.

## 8. Data exposure
Public buckets/blobs, databases without auth, exposed `.git/`, `.env`, backup files (`.zip`, `.sql`, `.bak`) in web roots, directory listing,
dangling DNS records (subdomain takeover) → none.

## 9. Configuration baseline
CIS Benchmark / Lynis score; debug modes off; default pages removed; security headers; firewall default-deny; egress filtering for servers.

## 10. Logging, backups, recovery
Auth and admin logs collected centrally with alerts; backups encrypted with an offline/immutable copy; a restore tested in the last quarter.

## 11. Network & devices
Router/firewall/IoT firmware current; guest and IoT networks segmented; management interfaces not on the internet; Wi-Fi WPA2/WPA3 with strong keys.

## 12. Third parties & SaaS
OAuth app grants reviewed; vendor access time-limited; offboarded staff removed from all SaaS; SaaS admin accounts with MFA.

## Output
Checklist table (area · status · evidence · fix · priority) using `../report-template.md`; schedule the audit monthly (automate with `workflow-automation`).
