# Minhaaj Design System

A unified design system for the Minhaaj brand ecosystem — covering **Psyda**, **Minhaaj.com**, **IbnArbi**, and **CCIAF / Matrix**.

Four brands, four visual dialects. One underlying design philosophy: editorial warmth, scholarly precision, calm confidence.

---

## Brand Ecosystem

| Brand | URL | Role | Aesthetic |
|---|---|---|---|
| **Psyda** | psyda.org | AI analytics agency — editorial flagship | Zero radius, SVG art, word-reveal, dark editorial panels |
| **Minhaaj.com** | minhaaj.com | Personal brand — bio, books, podcast, coaching | Warm parchment, copper accent, 3-font system |
| **CCIAF** | cciaf.minhaaj.com | Cross-Civilization Intelligence and Action Framework | Gold accent, 2px radius, contrast section inversion |
| **IbnArbi** | ibnarbi.minhaaj.com | Islamic lunar mansion cosmology app (React SPA) | HSL tokens, glass cards, Arabic RTL, shadcn/ui |
| **Matrix** | matrix.minhaaj.com | CCIAF Identity Module (BaZi + Numerology) | Shares CCIAF tokens (minimal) |

---

## Design Philosophy

> **Editorial. Scholarly. Calm confidence.**
> A beautifully typeset academic journal, crossed with a luxury magazine layout. Nothing shouts. Everything is precise.

- **Voice:** Intellectual yet warm. Authoritative but not cold. Combines rigorous academic precision with spiritual/humanist depth.
- **Person:** First-person ("I", "my") for Minhaaj.com. Third-person for Psyda. Second-person ("you") for coaching CTAs.
- **Casing:** Sentence case for body copy. ALL CAPS (spaced tracking) for labels, eyebrows, metadata. Title Case only for proper nouns.
- **Punctuation:** Em dashes for emphasis. Ellipsis for contemplative pauses. Oxford comma required.
- **Emoji:** Never used in UI or marketing copy.

---

## Repository Structure

```
/
├── CHANGELOG.md              # Full version history
├── README.md                 # This file — ecosystem overview
├── SKILL.md                  # Claude agent skill definition
│
├── tokens/                   # CSS custom properties per brand
│   ├── psyda.css             # Psyda/Minhaaj.com — Warm Parchment palette
│   ├── cciaf.css             # CCIAF — Warm earth + gold (light/dark)
│   └── ibnarbi.css           # IbnArbi — HSL-based (light/dark)
│
├── components/               # Component specifications
│   ├── navigation.md
│   ├── buttons.md
│   ├── hero.md
│   ├── cards.md
│   ├── forms.md
│   └── footer.md
│
├── patterns/                 # Design pattern documentation
│   ├── typography.md         # Type scale, font roles, responsive
│   ├── color.md              # Color philosophy, tokens, accessibility
│   ├── spacing.md            # Space scale, layout grid, responsive
│   ├── motion.md             # Animation tokens, reveals, reduced-motion
│   ├── editorial.md          # SVG art, word-reveal, bleed figures
│   └── branding.md           # Logos, voice, naming, usage rules
│
├── preview/                  # Token visualization HTMLs
│
├── assets/                   # Logos, imagery, icons
│   ├── logos/                # Psyda logo variants (JPG)
│   └── imagery/              # Editorial photos (JPG)
│
└── ui_kits/                  # Full prototype implementations
    ├── psyda/                # Psyda editorial site
    ├── minhaaj/              # Minhaaj.com personal site
    ├── ibnarbi/              # IbnArbi lunar mansion app
    └── cciaf/                # CCIAF advisory site
```

---

## Quick Reference

### Psyda / Minhaaj.com — Warm Parchment
- **Background:** `#F7F3EC` (parchment), `#EDE8DE` (linen), `#E3DCCE` (ecru)
- **Text:** `#1E1C18` (primary), `#6B6457` (secondary), `#9A9383` (muted)
- **Accent:** `#8C7355` (copper), `#B89A78` (soft), `#6B5538` (deep)
- **Dark panels:** `#14120F`
- **Fonts:** Cormorant Garamond (display) + DM Sans (UI) + Inter (body)
- **Radius:** 0 (square editorial) — inline elements `0.25rem`
- **Shadow:** none on surfaces — depth from tone shifts

### CCIAF — Warm Earth + Gold
- **Light bg:** `#F9F6F0`, **ink-1:** `#1A1510`, **gold:** `#8B6510`
- **Dark bg:** `#131008`, **gold:** `#C8A03A`, **ink-1:** `#F0EAD8`
- **Fonts:** Cormorant Garamond (display) + EB Garamond (body)
- **Radius:** 2px (surfaces), 999px (buttons/pills)
- **Shadow:** dual-layer subtle shadow on surfaces

### IbnArbi — Warm Parchment / Deep Navy (HSL)
- **Light:** `hsl(40 30% 96%)` bg, `hsl(35 85% 35%)` primary (gold-brown)
- **Dark:** `hsl(240 30% 4%)` bg, `hsl(45 90% 60%)` primary (bright gold)
- **Fonts:** Lora (serif) + Source Sans 3 (sans) + Amiri (Arabic)
- **Radius:** 0.5rem base, 0.75–1rem for cards
- **Cards:** Glass with backdrop-blur, translucent bg

---

## Usage

### Web (CSS)
```css
@import url('tokens/psyda.css');
/* or tokens/cciaf.css, tokens/ibnarbi.css */
```

All tokens are CSS custom properties — use directly in your styles:
```css
.my-component {
  background: var(--bg);
  color: var(--text-primary);
  font-family: var(--font-display);
}
```

### Prototyping
Use the UI kits in `ui_kits/` as starting points. Each is a standalone HTML file with embedded CSS/JS — open directly in a browser.

### Design Reference
See `patterns/` for design rationale and `components/` for component specs. The `preview/` HTMLs visualize every token category.

---

## Font Loading

All fonts are loaded from Google Fonts (no self-hosted files):

| Font | Brands | Weights |
|---|---|---|
| Cormorant Garamond | Psyda, Minhaaj, CCIAF | 300, 400, 500, 600 + italic |
| EB Garamond | CCIAF | 400, 500, 600 + italic |
| DM Sans | Psyda, Minhaaj | 300, 400, 500 |
| Inter | Psyda, Minhaaj | 300, 400, 500 |
| Lora | IbnArbi | 400, 500, 600, 700 |
| Source Sans 3 | IbnArbi | 300, 400, 500, 600 |
| Amiri | IbnArbi (Arabic) | 400, 700 |

---

## Cross-Brand Conventions

All brands share these rules:
- **No emoji in UI**
- **No aggressive gradients** — flat warm backgrounds only
- **Sentence case** for body copy
- **ALL CAPS** for labels, eyebrows, metadata (spaced tracking 0.14–0.28em)
- **Em dashes** freely used; Oxford comma required
- **Copper/gold** as single accent color per brand
- **Dark mode** support where applicable (CCIAF, IbnArbi)
- **`prefers-reduced-motion`** respected — all animations killable
- **Focus-visible** outlines for accessibility on interactive elements
- **Skip links** for keyboard users on all pages

---

## Versioning

See [CHANGELOG.md](./CHANGELOG.md) for full history.

| Version | Date | Summary |
|---|---|---|
| v1.0.0 | 2026-05-24 | Comprehensive restructure with token/component/pattern hierarchy |
| v0.1.0 | 2026-05-10 | Original snapshot from live codebases |
