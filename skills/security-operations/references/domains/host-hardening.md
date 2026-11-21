# Host & kernel hardening

Baselines: CIS Benchmarks, DISA STIGs, vendor security guides. Audit read-only first; change with approval and a rollback path.

## Linux — kernel and system checks (read-only)
```bash
uname -r; cat /etc/os-release                     # kernel & distro version → compare with vendor security advisories
grep . /sys/devices/system/cpu/vulnerabilities/*  # CPU side-channel mitigations status
sysctl kernel.kptr_restrict kernel.dmesg_restrict kernel.unprivileged_bpf_disabled \
       kernel.yama.ptrace_scope kernel.randomize_va_space fs.protected_symlinks fs.protected_hardlinks \
       net.ipv4.conf.all.rp_filter net.ipv4.conf.all.accept_redirects net.ipv4.tcp_syncookies
cat /proc/sys/kernel/modules_disabled; lsmod | head -50          # loaded modules; unneeded ones are attack surface
mokutil --sb-state 2>/dev/null                    # Secure Boot
needs-restarting -r 2>/dev/null || ls /var/run/reboot-required 2>/dev/null   # pending kernel reboot
ss -tulpn || netstat -tulpn                       # listening services (netstat if ss is missing)
sudo lynis audit system --quick                   # broad hardening audit (if installed)
```
A missing sysctl key ("cannot stat") means the feature isn't built into that kernel — report it, don't treat it as a failure of the check.

Recommended direction (verify per distro/workload): kernel and packages patched (livepatch where available), unneeded modules blacklisted,
`kptr_restrict=2`, `dmesg_restrict=1`, `unprivileged_bpf_disabled=1`, `ptrace_scope>=1`, ASLR=2, SELinux/AppArmor enforcing,
auditd with rules for privileged commands and auth files, SSH keys only (no root login, no passwords), firewall default-deny,
automatic security updates, time sync, file integrity monitoring for critical paths.

## Windows
Security baselines (Microsoft Security Compliance Toolkit / Intune), Defender/EDR on, ASR rules, Credential Guard, LAPS for local admin passwords,
SMBv1 off, BitLocker, PowerShell logging, least-privilege users, patching via WSUS/Intune.

## Servers & services
Remove unused services; TLS configuration (modern ciphers, valid certs, auto-renewal); databases not internet-exposed; admin panels behind VPN/zero-trust access;
backups encrypted, immutable/offline copy, restore tested.
