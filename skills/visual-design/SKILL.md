---
name: visual-design
description: Original visual design that escapes generic AI aesthetics — brand identity (logo, colour, typography), brand guide, presentation and social templates, UI/UX direction and design-system choices (Material, Fluent, Apple HIG, Carbon, Polaris and more), with tool paths for local GPU, cloud (Adobe, Figma, Canva…) or free/open-source software. Adapts reference sites only within licences and permissions. Use when the user asks for a logo, brand identity, colours, fonts, design, UI/UX, landing page look, presentation template, "make it look like X", "it looks too AI/generic", or design tool advice.
license: MIT
---

# Visual Design

Good design comes from the brand's own story and constraints. Generic design comes from defaults.
Every choice must have a reason you can say in one sentence.

## 1. Brief (infer first, ask ≤ 3)
Brand story and personality (3 adjectives, plus 3 it must *not* be) · audience and context of use · competitors (to differ from) ·
must-keep assets · where it will live (screen, print, packaging, signage, app icon) · budget and tools available.
Save the brief to memory (`.memory/brand.md`).

## 2. Research
- Competitor and category scan: what everyone does → the visual space left open.
- Real-world references from the brand's own world (materials, places, craft, history) — not other AI images.
- Trends (e.g. colour-of-the-year announcements, current UI patterns) are inputs, not mandates; verify current ones with `research`.

## 3. Directions — distinct, not variants
Present **2–3 genuinely different concepts**, each: name, idea in one sentence, colour + type + form choices with reasons, one mockup in context.
Recommend one. Run each through the anti-generic check (`references/anti-generic.md`) before showing.

## 4. Produce
- Identity system: `references/identity.md` (logo construction and tests, colour tokens with contrast, type pairing, brand guide, templates, file deliverables).
- UI/UX: `references/ui-ux.md` (design-system choice, layout, components, states, accessibility, reference-site adaptation rules).
- Tools: `references/tools.md` — pick by the user's hardware and budget: local GPU / cloud apps / free open source, with step-by-step setup.

## 5. Critique before delivering
1. Anti-generic checklist passes.
2. Works small (16 px favicon), in one colour, on dark and light, in black-and-white print.
3. Accessibility: text contrast ≥ WCAG AA (4.5:1 body, 3:1 large); not relying on colour alone.
4. Consistent with the brief's adjectives — and clearly not the "must not be" ones.
5. Legally clean: fonts and assets licensed for commercial use; no resemblance to existing marks (quick trademark/visual search; formal check via `brand-ip`).

## 6. Deliver
Source files + exports in the needed formats, a one-page brand guide, and templates (presentation, social, documents).
State what is final and what is a placeholder.

## Rules
- AI image generation is for exploration and mood; **final logos are human-refined vectors** (clean geometry, ownable, and AI-only output may not be protectable in some jurisdictions).
- "Make it look like <site>": analyse *principles* (hierarchy, spacing, rhythm, type scale) and rebuild in the brand's own style.
  Reuse code or assets only when the licence allows (e.g. open-source themes) or with written permission; never copy logos, illustrations, photos or distinctive trade dress.
- Free/open-source option always offered alongside paid tools, with honest trade-offs.
