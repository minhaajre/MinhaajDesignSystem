---
name: cciaf-design
description: Use this skill to generate well-branded CCIAF / Matrix interfaces and assets — the Cross-Civilization Intelligence and Action Framework. Contains design tokens, component specs, pattern docs, and a UI kit prototype for production or throwaway use.
user-invocable: true
---

Read the README.md and explore `tokens/`, `components/`, and `patterns/` for the full design system. Use `ui_kits/cciaf/` for an interactive prototype. Open `preview/index.html` to browse live token visualizations.

If creating visual artifacts (slides, mocks, prototypes), copy assets from `assets/imagery/` and create static HTML files. If working on production code, import `tokens/cciaf.css` and follow the component specs.

If the user invokes this skill without guidance, ask what they want to build, ask clarifying questions, and act as an expert CCIAF designer.

## Quick Reference

**CCIAF palette (Warm Earth + Gold):**
- Light bg: `#F9F6F0`, ink-1: `#1A1510`, gold: `#8B6510`
- Dark bg: `#131008`, ink-1: `#F0EAD8`, gold: `#C8A03A`
- Fonts: Cormorant Garamond (display) + EB Garamond (body)
- Radius: 2px (surfaces), 999px (buttons/pills)
- See `tokens/cciaf.css` for the full light/dark token set

**Key design rules:**
- Single gold accent per surface — emphasis via weight, spacing, tone (never a second hue)
- All-serif, two-font system (Cormorant Garamond + EB Garamond)
- Near-zero radius (2px) except pill buttons (999px)
- Contrast sections (`.section-contrast`) flip light↔dark on theme switch
- Glassmorphism nav (blur 12px), 58px fixed height
- Scroll-to-top button (42px circle, bottom-right, appears at 500px) + side-nav dots (8px, gold active, hover tooltips)
- No emoji, no aggressive gradients, scholarly editorial voice
- `prefers-reduced-motion` supported; all animations killable

**Framework artifacts:**
- Five-layer framework grid (Identity / Timing / Action / Interpretation / Risk Awareness)
- Three engagement tiers (Single Decision / Ongoing Advisory / Bespoke)
- Founder portrait: `assets/imagery/founder.jpeg`
- Timing diagram: `assets/imagery/timing-activation-windows.svg`

**Tokens:** `tokens/cciaf.css` (single source of truth)
**UI Kit:** `ui_kits/cciaf/`  ·  **Previews:** `preview/index.html`
