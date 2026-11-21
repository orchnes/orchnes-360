# Detection & incident response

Framework: NIST SP 800-61 (prepare → detect/analyse → contain/eradicate/recover → lessons learned). For technical root cause see `root-cause-analysis` (incidents guide).

## Prepare
Contact list (internal, legal, hosting/cloud, insurer, authorities) · runbooks for top scenarios (ransomware, account takeover, data leak, web defacement, DDoS) ·
centralized logs with retention · backups tested · decision authority defined.

## Detect — log sources and alerts
Auth logs (failed/successful logins, MFA changes), admin actions, cloud audit logs, EDR, DNS/proxy, email (forwarding rules), application errors and unusual data exports.
Alert on: impossible travel, new admin, disabled logging, mass downloads, new OAuth grants, crypto-mining cost spikes, outbound to rare destinations.

## Respond
1. **Triage:** what, which assets/data, since when, still active? Assign severity and an incident lead.
2. **Preserve evidence** before changing things: logs export, snapshots/memory capture where feasible, timeline with UTC timestamps, chain of custody.
3. **Contain:** isolate hosts, disable compromised accounts, revoke sessions/tokens, rotate secrets, block indicators — prefer reversible actions.
4. **Eradicate:** remove persistence (accounts, keys, scheduled tasks, web shells), patch the entry point.
5. **Recover:** restore from known-good backups, monitor closely, staged return to service.
6. **Notify (human + legal decision):** personal-data breaches often have short deadlines (e.g. GDPR 72 h to the authority; KVKK requires notification "without delay", interpreted as 72 h by the Board — verify current rules), plus customers/partners/insurer as required.
7. **Lessons learned:** blameless postmortem, prevention actions with owners.

## Never
Pay ransoms or contact attackers without legal/executive decision · wipe systems before evidence is preserved · tell the public before legal review.
