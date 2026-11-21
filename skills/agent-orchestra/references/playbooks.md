# Playbooks — teaching cheaper models

A playbook is a short, domain-specific file of rules learned from corrections. It is how a T1 orchestrator
"trains" T2/T3 models without fine-tuning: the lesson travels in every relevant contract.

## Location
`.memory/playbooks/<domain>.md` (project) or a shared playbooks repo for reuse across projects.

## Format (keep each under ~60 lines)
```markdown
# Playbook: rust-money-handling
Last updated: 2026-11-21

## Rules
1. Store money as integer minor units (i64 cents) or a decimal type — never f64.
   ✗ `let total: f64 = price * 1.2;`
   ✓ `let total = price_cents * (100 + vat_pct) / 100;` (with explicit rounding rule)
2. Rounding happens once, at the end, using the rule in config (half-up).
3. ...

## Common mistakes seen
- (TASK-7, 2026-11-21) rounded per line item → totals off by 1 cent
```

## Lifecycle
1. Reviewer emits `TEACH:` in a verdict → orchestrator adds/edits a rule (dedupe, keep it short).
2. Contracts for that task type list the playbook; specialists read it first.
3. Track acceptance rate per playbook; rules that don't reduce errors get rewritten or removed.
4. When enough high-quality accepted examples exist, they can later feed real fine-tuning in the runtime layer.
