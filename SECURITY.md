# Security policy

Orchnes 360 is a library of instructions (Markdown skills) that AI agents follow. Security issues here usually mean
**a skill that could lead an agent to do something unsafe** — for example skipping an approval gate, leaking secrets,
obeying instructions embedded in untrusted content, or giving dangerous advice in health, finance or legal topics.

## Reporting
Please **do not open a public issue** for security problems. Use GitHub's private reporting:
**Security → Report a vulnerability** on this repository.

Include: the skill and file, the prompt or scenario that triggers the unsafe behaviour, the agent/model you used, and what you expected instead.
We aim to acknowledge reports within 7 days and to publish a fix or mitigation as soon as it is verified.

## Scope
- In scope: skill text that causes unsafe agent behaviour, prompt-injection weaknesses in skill guidance, secrets or personal data committed to this repo.
- Out of scope: vulnerabilities in third-party agents or models themselves (report those to their vendors).

The `security-operations` skill is for **defensive** work on systems you own or are authorized to test. Reports asking to extend it for unauthorized access will be closed.
