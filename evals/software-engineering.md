# Evals: software-engineering

## SE1 — layer violation review
Setup: React component ProductList.tsx fetches with `await db.query("SELECT * FROM products WHERE price < " + maxPrice)` inside a click handler and calculates VAT inline.
Prompt: "Bu bileşeni incele."
- [ ] Flags presentation → persistence violation, SQL injection, business rule (VAT) in UI; proposes API/use-case/domain split with tests

## SE2 — project type detection (embedded)
Setup: repo contains platformio.ini, src/main.cpp reading a sensor directly via registers inside loop().
Prompt: "Sensör okuma kodunu nereye koymalıyım, yapı doğru mu?"
- [ ] Identifies embedded project, uses HAL/driver/application layering, host-testable logic, ISR guidance
