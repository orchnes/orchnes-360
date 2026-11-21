# Tools by hardware and budget

Last reviewed: 2026-11-21 — versions, prices, licences and hardware needs change; verify before recommending. Numbers marked ~ are estimates.

## Decide the path
1. Ask (or detect): OS, GPU model and VRAM, RAM, budget, whether files must stay local.
2. Vector/layout work runs on any modern computer — GPU matters only for local AI image generation and 3D.

## A. Free & open source (default offer)
| Need | Tool |
|---|---|
| Vector / logo | Inkscape |
| UI design, prototypes, design systems | Penpot (open source, self-hostable); Figma free tier (proprietary) |
| Raster editing | GIMP, Krita (painting), Photopea (browser) |
| Layout / print | Scribus |
| 3D / mockups | Blender |
| Presentations | LibreOffice Impress, Google Slides |
| Local AI images | ComfyUI, InvokeAI, Fooocus-style UIs with open-weights models (check each model's licence for commercial use) |

## B. Local GPU for AI image generation
| VRAM | What's realistic (~) |
|---|---|
| none / < 6 GB | use cloud or CPU (very slow); stick to vector tools |
| ~8 GB | SDXL-class models at moderate resolution, quantized larger models |
| ~12–16 GB | most current open image models comfortably, upscaling, LoRA use |
| ~24 GB+ | largest models at full precision, training small LoRAs |
Apple Silicon: works via Metal-backed apps; unified memory acts as VRAM, slower than comparable NVIDIA cards. AMD: support improving (ROCm on Linux) — check the app.

### Step-by-step (ComfyUI example, verify current install docs)
1. Update GPU drivers (NVIDIA: recent driver; check CUDA support of the app).
2. Install the app's portable build or follow its official install guide (Python environment).
3. Download a model from its official page; read and keep the licence.
4. Start with a basic text-to-image workflow; use it for moodboards and exploration.
5. Bring chosen directions into a vector tool and redraw — don't ship raw generations as a logo.

## C. Cloud / paid
| Tool | Strong for | Watch |
|---|---|---|
| Adobe Creative Cloud (Illustrator, Photoshop, InDesign, Express, Firefly) | industry standard, print, commercially-safe generative features (check terms) | subscription cost |
| Figma | UI/UX, collaboration, design systems | paid seats for teams |
| Canva | fast social/presentation templates for non-designers | template look — customize heavily |
| Affinity (Designer/Photo/Publisher) | pro tools, check current pricing model | — |
| Hosted image generators (Midjourney-class, others) | fast exploration | licence/commercial terms, data privacy, not ownable as final logo |

## Licence checks (always)
Fonts (desktop vs web vs app embedding), stock images, icons, AI model and output terms, templates' redistribution rules.
