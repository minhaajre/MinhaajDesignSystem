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

## Byte-identical contract for agents

Every AI agent must read `AGENTS.md` before any frontend work — it is the replication contract that makes new projects render byte-identical to `cciaf.minhaaj.com` by copying `templates/cciaf-starter.html` verbatim. Also see `VERIFY.md` for the visual gate.

**For agents:**
```
Read: AGENTS.md (mandatory first)
Copy: templates/cciaf-starter.html → your index.html
Verify: VERIFY.md (light + dark side-by-side)
```

## Repository Structure

```
/
├── AGENTS.md              # ★ Byte-identical replication contract — agents read this first
├── VERIFY.md              # Visual verification gate (ship only on pass)
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
├── templates/
│   ├── cciaf-starter.html # ★ Byte-identical starter — exact live site copy (copy this)
│   ├── cciaf.css          #   Extracted CSS from starter (for split imports)
│   └── cciaf.js           #   Extracted JS from starter (for split imports)
│
├── tokens/
│   └── cciaf.css          # Single source of truth — all CSS custom properties (also inlined in starter)
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

## Usage — byte-identical (agents must follow AGENTS.md)

### Plain HTML — copy starter (recommended, zero drift)

```bash
cp templates/cciaf-starter.html my-project/index.html
# Edit text inside existing .h-h1/.h-p/.prose/.lc/.tc/.et only — keep every class/id/wrapper.
```

`templates/cciaf-starter.html` already contains all tokens, layout, and JS inline — no import needed.

### Split CSS/JS (when you must separate files)

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400;0,500;0,600;1,400;1,500&family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="tokens/cciaf.css">
<link rel="stylesheet" href="templates/cciaf.css">
<script defer src="templates/cciaf.js"></script>
```

HTML must keep `<html data-theme="light">` and `html{font-size:18px}` at root. Theme persists to `localStorage:cciaf-theme`.

### Tokens-only (for non-CCIAF extensions)

```css
@import url('tokens/cciaf.css');
.my-component { background: var(--bg); color: var(--ink-1); }
```

### Fonts

Fonts load from Google Fonts by default (no self-hosted files required). To self-host, run:

```bash
./download-fonts.sh
```

This fetches Cormorant Garamond + EB Garamond into `fonts/`.

### Prototyping

Use `templates/cciaf-starter.html` as the byte-identical starting point (exact live copy). Legacy `ui_kits/cciaf/index.html` remains as a secondary reference.

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
