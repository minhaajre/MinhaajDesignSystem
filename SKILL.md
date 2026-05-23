---
name: minhaaj-design
description: Use this skill to generate well-branded interfaces and assets for the Minhaaj / Psyda / IbnArbi / CCIAF ecosystem. Contains design tokens, component specs, pattern docs, and UI kit prototypes for production or throwaway use.
user-invocable: true
---

Read the README.md and explore `tokens/`, `components/`, and `patterns/` for the full design system. Use `ui_kits/` for interactive prototypes.

If creating visual artifacts (slides, mocks, prototypes), copy assets from `assets/` and create static HTML files. If working on production code, import the relevant token CSS and follow the component specs.

If the user invokes this skill without guidance, ask what they want to build, ask clarifying questions, and act as an expert designer.

## Quick Reference

**Psyda / Minhaaj.com palette:**
- Background: `#F7F3EC` (parchment), `#EDE8DE` (linen), `#E3DCCE` (ecru)
- Text: `#1E1C18` (primary), `#6B6457` (secondary), `#9A9383` (muted)
- Accent: `#8C7355` (copper), `#B89A78` (soft), `#6B5538` (deep)
- Dark panels: `#14120F`
- Fonts: Cormorant Garamond (display) + DM Sans (UI) + Inter (body)
- Radius: 0 (square editorial), inline `0.25rem`

**CCIAF palette:**
- Light: `#F9F6F0` bg, `#8B6510` gold, `#1A1510` ink-1
- Dark: `#131008` bg, `#C8A03A` gold, `#F0EAD8` ink-1
- Fonts: Cormorant Garamond (display) + EB Garamond (body)
- Radius: 2px (surfaces), 999px (buttons/pills)
- See `tokens/cciaf.css` for full light/dark token set

**IbnArbi palette:**
- Light: `hsl(40,30%,96%)` bg, `hsl(35,85%,35%)` primary, `hsl(260,25%,82%)` accent
- Dark: `hsl(240,30%,4%)` bg, `hsl(45,90%,60%)` primary, `hsl(260,50%,30%)` accent
- Fonts: Lora (serif) + Source Sans 3 (sans) + Amiri (Arabic)
- Radius: 0.5rem base, glass cards with backdrop-blur

**Key design rules:**
- Psyda: zero border-radius, fill-sweep buttons, word-reveal animations, editorial SVG art, no photographs in UI
- CCIAF: near-zero radius (2px), gold accent, contrast sections flip light↔dark, glassmorphism nav
- IbnArbi: glass-card backdrop-blur, rounded-xl, shadcn/ui patterns, Arabic RTL
- All brands: no emoji in UI, no aggressive gradients, scholarly editorial aesthetic, prefers-reduced-motion supported

**Assets:** `assets/logos/` (Psyda logos), `assets/imagery/` (editorial photos)
**Token files:** `tokens/psyda.css`, `tokens/cciaf.css`, `tokens/ibnarbi.css`
**UI Kits:** `ui_kits/psyda/`, `ui_kits/minhaaj/`, `ui_kits/ibnarbi/`, `ui_kits/cciaf/`
