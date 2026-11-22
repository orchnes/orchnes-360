# Task contract, review verdict, run log

## Task contract (orchestrator → specialist)
```yaml
id: TASK-7
role: build            # research | build | test | security | docs | content | data
tier: T2
goal: Add VAT calculation to checkout totals
inputs:
  - "src/checkout/total.rs (lines 1-80)"
  - "decision D4: VAT rates come from config, not hardcoded"
constraints:
  - Rust, no new dependencies
  - do not touch src/payments/**
acceptance:
  - "cargo test checkout:: passes"
  - new tests cover 0%, 10%, 20% rates and rounding to 2 decimals
output: unified diff + test output
size_budget: ~60 changed lines
playbooks: [rust-money-handling]
budget: 30k tokens
```

## Review verdict (reviewer → orchestrator)
```
TASK: TASK-7   VERDICT: ACCEPT | REVISE | REASSIGN
EVIDENCE: <test output / check results>
ISSUES: <numbered, specific, with file:line>
BLOAT: <unrequested or unnecessary parts, if any>
TEACH: <rule to add to a playbook, if a pattern error>
```

## Run log line (append-only)
```
2026-11-21T14:32Z | TASK-7 | build | model=<id> T2 | REVISE→ACCEPT | tests 12/12 | 18.4k tok | $0.04 | why T2: standard feature, low risk
```
