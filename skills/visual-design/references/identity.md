# Brand identity system

## Logo
1. **Concept** from the brief (meaning of the name, story, craft, product form). Write 10+ ideas in words before drawing.
2. **Sketch** many thumbnails (paper, tablet, or AI moodboards for exploration only).
3. **Vectorize** the best 2–3: clean geometry, optical corrections, consistent stroke/angles. Tools: Inkscape (free), Illustrator, Affinity Designer, Figma/Penpot.
4. **System:** primary logo, horizontal/stacked lockups, symbol-only, wordmark; clear-space and minimum size rules.
5. **Tests:** 16 px favicon, one-colour, reversed on dark, black-and-white print, embroidery/stamp if relevant, next to competitors.
6. **Originality:** reverse-image and trademark database search before finalizing (formal clearance via `brand-ip`).

## Colour
- 1 dominant, 1–2 accents, neutrals; derive from the brand world, not from trends alone.
- Define as tokens: `--brand-500`, tints/shades 50–900, semantic tokens (`--surface`, `--text`, `--accent`, `--danger`), light and dark modes.
- Contrast: body text ≥ 4.5:1, large text/UI ≥ 3:1 (WCAG AA). Check with a contrast checker; test colour-blind simulations.
- Specify HEX/RGB (screen), CMYK/Pantone (print) when print matters.

## Typography
- Pair: display/headline face with character + highly legible text face (or one superfamily).
- Free, commercially usable sources: Google Fonts, Fontshare, open-source foundries (check each licence — OFL is typical).
- Type scale (e.g. 1.25 ratio), line-height 1.4–1.6 for body, max ~70 characters per line.
- Check language coverage (Turkish characters ç ğ ı İ ö ş ü, other scripts if needed).

## Brand guide (one to a few pages)
Story & personality · logo usage (do/don't) · colour tokens · typography · imagery and illustration style · iconography · tone of voice link · examples.

## Templates
Presentation (title, section, content, data/chart, quote, closing), social posts/stories, documents/invoices, email signature.
Use master layouts/styles, not manual formatting; embed or specify fonts.

## Deliverables
| Asset | Formats |
|---|---|
| Logo | SVG (master), PDF/EPS (print), PNG transparent at 512/1024/2048 px |
| Favicon / app icon | ICO + PNG 16/32/48/180/192/512, SVG favicon, maskable icon |
| Colours & type | tokens as CSS variables / JSON (design tokens), PDF guide |
| Templates | source (Figma/Penpot/PowerPoint/Keynote/Google Slides) + PDF preview |
