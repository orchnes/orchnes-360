# UI / UX direction

## Choose a foundation (don't start from zero, don't look like the default either)
| Design system | Fits |
|---|---|
| Google Material Design | Android, cross-platform, data-dense apps |
| Microsoft Fluent | Windows, Microsoft 365 integrations, enterprise |
| Apple Human Interface Guidelines | iOS, macOS, visionOS native apps |
| IBM Carbon | enterprise, data, dashboards |
| Shopify Polaris | commerce admin tools |
| Atlassian Design System | productivity, collaboration tools |
| GOV.UK / USWDS | public-sector, accessibility-first services |
| Radix, shadcn/ui, Headless UI, Ark | accessible primitives to style in your own brand (web) |
Use the foundation for behaviour, accessibility and patterns; express the brand through tokens (colour, type, radius, motion) and imagery,
so the product doesn't look like a stock component library. Check each system's licence (most are open source).

## Process
1. Users and top 3 tasks → information architecture → user flows.
2. Low-fi wireframes (structure only) → test the flow → high-fi in brand style.
3. Components with all states: default, hover, focus, active, disabled, loading, empty, error, success.
4. Responsive: design mobile and desktop; touch targets ≥ 44×44 px.
5. Accessibility: semantic structure, keyboard navigation, visible focus, contrast, labels, reduced-motion option, screen-reader names.
6. Usability check with 3–5 real users or a heuristic review before build; hand off tokens + specs.

## "Make it like <site>"
1. Ask what they like about it (speed? calm? bold type? the checkout?).
2. Analyse principles: grid, spacing scale, type scale, hierarchy, interaction patterns, motion.
3. Rebuild those principles with the brand's own identity.
4. Code reuse only if licensed (open-source themes/components — follow their licence and attribution) or with written permission from the owner.
   Never copy logos, illustrations, photography, copy or distinctive trade dress.

## Trends
Annual colour announcements (e.g. Pantone Color of the Year) and current UI trends can inspire an accent or a campaign;
verify the current year's picks via research and use them only when they fit the brief. Trends date quickly; identity should not.
