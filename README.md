# CCIAF Design System

A focused design system for **CCIAF** — the Cross-Civilization Intelligence and Action Framework (cciaf.minhaaj.com) and its sister product **Matrix** (CCIAF Identity Module).

One brand. One palette. One accent. Warm earth tones, a single gold accent, and an all-serif editorial voice — a beautifully typeset academic journal crossed with a luxury magazine.

This repository was rebuilt from the production CCIAF source (`cciaf.minhaaj.com/index.html` and the `cciaf-report-engine` report stylesheet) so the tokens, components, and patterns match the live site exactly.

---

## Design Philosophy

> **Editorial. Scholarly. Calm confidence.**

- **Voice:** Third-person, institutional, authoritative but not cold.
- **Casing:** Sentence case for body copy. ALL CAPS (spaced tracking) for labels, eyebrows, metadata.
- **Punctuation:** Em dashes for emphasis. Ellipsis for contemplative pauses. Oxford comma required.
- **Emoji:** Never used in UI or marketing copy.
- **One accent rule:** A single gold accent per surface. Emphasis comes from weight, spacing, and tone — never a second hue.

---

## Brand Snapshot

| Field | Value |
|---|---|
| Brand | CCIAF |
| Full name | Cross-Civilization Intelligence and Action Framework |
| Sister product | Matrix (BaZi + Numerology identity module) |
| Domain | cciaf.minhaaj.com |
| Discipline | Timing intelligence for high-stakes decisions |
| Founder | Minhaaj Rehman |

---

## Palette — Warm Earth + Gold

| Token | Light | Dark | Role |
|---|---|---|---|
| `--bg` | `#F9F6F0` | `#131008` | Page background |
| `--bg-alt` | `#F2EDE3` | `#1B170D` | Alternate section bg |
| `--surface` | `#FFFFFF` | `#1E1A10` | Cards, inputs |
| `--border` | `#DDD8CE` | `#2E2918` | Dividers |
| `--ink-1` | `#1A1510` | `#F0EAD8` | Headings |
| `--ink-2` | `#3D3830` | `#C0B89E` | Body |
| `--ink-3` | `#6B6358` | `#7A7260` | Secondary |
| `--ink-4` | `#A09890` | `#4A4438` | Muted |
| `--gold` | `#8B6510` | `#C8A03A` | Primary accent |
| `--gold-mid` | `#B8922A` | `#A07818` | Hover / fills |
| `--gold-light` | `#D4AE60` | `#E0BC70` | Underlines, borders |

Contrast sections invert on theme switch (`--cs-bg` dark in light mode, light in dark mode).

---

## Typography — All-Serif, Two-Font

| Role | Font | Weights |
|---|---|---|
| Display / headings | **Cormorant Garamond** | 300, 400, 500 + italic |
| Body / prose | **EB Garamond** | 400, 500, 600 + italic |

Root size `18px`. Type scale uses `clamp()` for fluid scaling:

- Hero: `clamp(2.6rem, 6vw, 5rem)`
- Section H2: `clamp(1.7rem, 3vw, 2.6rem)`
- Body: `1.1rem`, line-height `1.82`
- Eyebrow: `0.72rem`, 0.22em uppercase, gold

---

## Repository Structure

```
/
├── CLAUDE.md              # Agent orchestration — loads design-system/ council + CCIAF overrides
├── README.md              # This file
├── SKILL.md               # Agent skill definition
├── CHANGELOG.md           # Version history
├── design-system-reference.html  # Single-page full reference
├── download-fonts.sh      # Fetch CCIAF fonts for self-hosting
│
├── design-system/         # Anti-slop orchestration layer (agent council, bans, CI gate)
│   ├── CLAUDE.md          #   Six-role agent council + non-negotiables
│   ├── DESIGN.md          #   CCIAF brand identity tokens (mirrors tokens/cciaf.css)
│   ├── PRODUCT.md         #   Audience, surface, voice
│   ├── tokens/_base.css   #   Generic starting tokens (overridden per project)
│   ├── skills/            #   Bundled agent skills (frontend-design, …)
│   ├── scripts/setup.sh   #   Bootstrap installer for consuming projects
│   └── .github/           #   Optional CI design-check workflow (not wired by default)
│
├── tokens/
│   └── cciaf.css          # ★ Single source of truth — all CSS custom properties
│
├── components/            # Component specifications
│   ├── navigation.md
│   ├── buttons.md
│   ├── hero.md
│   ├── cards.md
│   ├── forms.md
│   ├── footer.md
│   ├── scroll-to-top.md
│   └── side-navigation.md
│
├── patterns/              # Design pattern documentation
│   ├── typography.md
│   ├── color.md
│   ├── spacing.md
│   ├── motion.md
│   ├── editorial.md
│   └── branding.md
│
├── preview/               # Token visualization HTMLs (open in browser)
│   ├── index.html         # Gallery linking all previews
│   ├── colors-cciaf.html
│   ├── type-cciaf.html
│   ├── spacing-tokens.html
│   ├── shadows-radii.html
│   ├── components-cciaf.html
│   ├── components-buttons.html
│   ├── components-cards.html
│   ├── components-forms.html
│   ├── components-nav.html
│   └── components-scroll.html
│
├── assets/
│   └── imagery/           # founder.jpeg, timing-activation-windows.svg
│
├── fonts/                 # Cormorant Garamond + EB Garamond (self-host)
│   ├── cormorant-garamond/
│   └── eb-garamond/
│
└── ui_kits/
    └── cciaf/             # Standalone interactive prototype (index.html)
```

---

## Usage

### Web (CSS)

All tokens are CSS custom properties. Import and use directly:

```css
@import url('tokens/cciaf.css');

.my-component {
  background: var(--bg);
  color: var(--ink-1);
  font-family: var(--font-heading);
}
```

Light/dark mode is driven by a `data-theme` attribute on `<html>`:

```html
<html data-theme="light">   <!-- or "dark" -->
```

The theme toggle persists to `localStorage` under `minhaaj-theme` and defaults to `prefers-color-scheme`.

### Fonts

Fonts load from Google Fonts by default (no self-hosted files required). To self-host, run:

```bash
./download-fonts.sh
```

This fetches Cormorant Garamond + EB Garamond into `fonts/`.

### Prototyping

Use `ui_kits/cciaf/index.html` as a starting point — a standalone, interactive prototype with working light/dark mode. Open it directly in a browser.

### Token previews

Open `preview/index.html` to browse every token category rendered live.

---

## Cross-Brand Conventions

These rules apply to every CCIAF surface:

- **No emoji** in UI or copy
- **No aggressive gradients** — flat warm backgrounds only (decorative radial tints <8% opacity behind heroes are permitted)
- **Sentence case** for body copy
- **ALL CAPS** for labels, eyebrows, metadata (tracking 0.14–0.28em)
- **Em dashes** freely; Oxford comma required
- **Single gold accent** per surface
- **Dark mode** supported (contrast sections invert)
- **`prefers-reduced-motion`** respected — all animations killable
- **Focus-visible** outlines: `2px solid var(--gold); outline-offset: 3px`
- **Skip links** for keyboard users on all pages

---

## Versioning

| Version | Date | Summary |
|---|---|---|
| v2.1.0 | 2026-08-05 | Integrated anti-slop orchestration (`design-system/`); scroll fixtures migrated to IntersectionObserver |
| v2.0.0 | 2026-08-05 | Rebuilt as CCIAF-only design system from production CCIAF source |
| v1.0.0 | 2026-05-24 | Original multi-brand snapshot (Psyda / Minhaaj / CCIAF / IbnArbi) |
