---
name: minhaaj-design
description: Use this skill to generate well-branded interfaces and assets for the Minhaaj / Psyda / IbnArbi ecosystem, either for production or throwaway prototypes/mocks/etc. Contains essential design guidelines, colors, type, fonts, assets, and UI kit components for prototyping across all Minhaaj properties.
user-invocable: true
---

Read the README.md file within this skill, and explore the other available files.

If creating visual artifacts (slides, mocks, throwaway prototypes, etc), copy assets out and create static HTML files for the user to view. If working on production code, you can copy assets and read the rules here to become an expert in designing with this brand.

If the user invokes this skill without any other guidance, ask them what they want to build or design, ask some questions, and act as an expert designer who outputs HTML artifacts _or_ production code, depending on the need.

## Quick Reference

**Psyda / Minhaaj.com palette:**
- Background: `#F7F3EC` (parchment), `#EDE8DE` (linen), `#E3DCCE` (ecru)
- Text: `#1E1C18` (primary), `#6B6457` (secondary), `#9A9383` (muted)
- Accent: `#8C7355` (copper), `#B89A78` (soft), `#6B5538` (deep)
- Dark panels: `#14120F`

**IbnArbi palette:**
- Light: `hsl(40,30%,96%)` bg, `hsl(35,85%,35%)` primary (gold-brown), `hsl(260,25%,82%)` accent (lavender)
- Dark: `hsl(240,30%,4%)` bg, `hsl(45,90%,60%)` primary (bright gold), `hsl(260,50%,30%)` accent

**Fonts:**
- Display: `Cormorant Garamond` (Psyda/Minhaaj) or `Lora` (IbnArbi)
- UI: `DM Sans` (Psyda/Minhaaj) or `Source Sans 3` (IbnArbi)
- Body: `Inter` (Psyda/Minhaaj)
- Arabic: `Amiri` (IbnArbi)

**Assets available:**
- `assets/logos/` — Psyda P. logo variants
- `assets/imagery/` — analytics.jpg, media.jpg, bulb.jpg
- `colors_and_type.css` — all CSS custom properties

**UI Kits:**
- `ui_kits/psyda/index.html` — Psyda editorial site
- `ui_kits/minhaaj/index.html` — Minhaaj personal brand site
- `ui_kits/ibnarbi/index.html` — IbnArbi Islamic cosmology app
- `ui_kits/cciaf/index.html` — CCIAF advisory site (extracted from live HTML)

**CCIAF palette (distinct from Psyda):**
- Light bg: `#F9F6F0`, ink-1: `#1A1510`, gold: `#8B6510`, border: `#DDD8CE`
- Dark bg: `#131008`, gold (dark): `#C8A03A`, ink-1 (dark): `#F0EAD8`
- Fonts: EB Garamond (body prose) + Cormorant Garamond (display/eyebrow/brand)
- `cciaf_tokens.css` — full token file for CCIAF

**Key design rules:**
- Psyda: zero border-radius, fill-sweep buttons, word-reveal animations, editorial SVG art
- CCIAF: near-zero radius (2px), grid-border layouts, gold accent rule, contrast sections flip light↔dark, scroll dots nav
- IbnArbi: glass-card backdrop-blur, rounded-xl (16px), shadcn/ui patterns, Arabic RTL support
- All sites: no emoji in UI, no aggressive gradients, scholarly editorial aesthetic throughout
