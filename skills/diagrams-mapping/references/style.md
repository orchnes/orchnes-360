# Style and legibility

## Rules
- **One question per diagram;** title states it.
- **≤ ~12 nodes;** split or zoom if larger.
- **Consistent direction:** left-to-right for flows and architectures, top-down for hierarchies and decisions.
- **Label every edge** with verb + payload ("sends order JSON", "reads stock"); dashed edges for async/optional/unverified.
- **Shapes with meaning:** people `([ ])`, services `[ ]`, databases `[( )]`, queues `[[ ]]`, external systems clearly marked (subgraph or note).
- **Group** with subgraphs for trust boundaries (internet / your cloud / third parties) — security reviewers need these.
- **Colour sparingly** and never as the only signal; add a legend if colour or line style carries meaning; check contrast in light and dark themes.
- **Names from the domain** (what users and code call things), not internal jargon or class names in high-level views.
- **Caption:** date, owner, source of truth ("generated from docker-compose.yml on 2026-11-21").

## Anti-patterns
Spaghetti diagrams with crossing arrows everywhere · mixed abstraction levels · unlabeled arrows · boxes with no evidence ·
decorative icons that hide meaning · diagrams nobody updates · screenshots of diagrams instead of source.

## Accessibility
Provide a 2–4 sentence text description of what the diagram shows; ensure text in exported images is large enough; don't rely on colour alone.
