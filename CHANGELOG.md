# Changelog

All notable changes to the Minhaaj Design System are documented here.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [v0.1.0] — Original Snapshot (2026-05-10)

The initial export of design system artifacts extracted from live codebases and published sites. This is a static reference dump — no version control, no build pipeline, no changelog.

### Added

#### Token Files
- **`colors_and_type.css`** (395 lines) — Primary token file covering Psyda/Minhaaj.com and IbnArbi brands. Contains:
  - Warm Parchment palette (backgrounds, text, accents, borders, semantic colors)
  - Full type scale with `clamp()` values (hero through micro)
  - Complete spacing scale (`--space-1` through `--space-24`)
  - Layout tokens (`--nav-h`, `--max-w`, `--pad-x`, `--sec-py`, `--sidebar-w`)
  - Radii, shadows, easing curves, transition durations
  - IbnArbi light + dark HSL-based tokens
  - Semantic CSS variables (h1–h3, body, lede, labels, links, selection)
  - Base reset, utility classes, button styles, fade-up reveal

- **`cciaf_tokens.css`** (229 lines) — CCIAF brand tokens extracted from `cciaf.minhaaj.com`. Contains:
  - Full light/dark theme with `[data-theme]` selectors
  - Warm earth palette (bg, ink-1 through ink-4, gold trio, contrast section vars)
  - CCIAF typography (Cormorant Garamond + EB Garamond)
  - Utility classes (eyebrow, h1, h2, prose, blockquote, rule)
  - Component tokens (layer card grid, engagement tier card)

#### Preview HTMLs (20 files)
Visual playground files for design token inspection:
- `colors-brand.html`, `colors-semantic.html`, `colors-ibnarbi.html`, `colors-cciaf.html`
- `type-display.html`, `type-ui.html`, `type-scale.html`, `type-arabic.html`, `type-cciaf.html`
- `spacing-tokens.html`, `shadows-radii.html`
- `components-buttons.html`, `components-cards.html`, `components-nav.html`, `components-forms.html`, `components-editorial-list.html`, `components-cciaf.html`
- `brand-logos.html`, `brand-icons-islamic.html`, `brand-motion.html`

#### UI Kits (4 prototype sites)
- **`ui_kits/psyda/`** — Psyda editorial website prototype
  - `index.html` (692 lines): Full interactive prototype with 3-pillar hero, chapter grid, SVG figures, marquee
  - `style.css` (1,009 lines): Complete component CSS with scroll progress, side rail, responsive breakpoints
  - `main.js` (275 lines): Scroll progress, nav scroll state, IntersectionObserver, word-reveal, live tweaks panel
  - `README.md` (18 lines)

- **`ui_kits/minhaaj/`** — Minhaaj.com personal brand prototype
  - `index.html` (298 lines): Bio, coaching program with 4 pricing tiers, philanthropy, contact
  - `README.md` (18 lines)

- **`ui_kits/ibnarbi/`** — IbnArbi lunar mansion cosmology app prototype
  - `index.html` (444 lines): 28-mansion cycle, divine names, abjad, planetary hours, Arabic/RTL
  - `README.md` (20 lines)

- **`ui_kits/cciaf/`** — CCIAF advisory site prototype (extracted from live HTML)
  - `index.html` (639 lines): 5-layer framework grid, engagement tiers, contrast sections, scroll dots
  - `README.md` (17 lines)

#### Assets
- `assets/logos/` — Psyda logo variants (P., wordmark, dark, mark) as JPG files
- `assets/imagery/` — Editorial imagery (analytics.jpg, bulb.jpg, media.jpg)
- `images/` — Duplicate of above assets for convenience

#### Reference Material
- `uploads/` — CCIAF live site HTML capture (1,167 lines)
- `README.md` (244 lines) — Brand ecosystem overview, voice guidelines, visual foundations, file index
- `SKILL.md` (52 lines) — Claude agent skill definition (`minhaaj-design`)

### Design Coverage

| Brand | Source | Status |
|---|---|---|
| **Psyda** | `psyda.org` + PsydaOfficialWebsite repo | Full tokens, 1 UI kit |
| **Minhaaj.com** | Squarespace site archive | Partial tokens, 1 UI kit |
| **IbnArbi** | `ibnarbi.minhaaj.com` + React codebase | Full tokens (HSL), 1 UI kit |
| **CCIAF / Matrix** | `cciaf.minhaaj.com` + CCIAFmasterdata | Full tokens, 1 UI kit, 1 live capture |

### Design Rules Captured
- Psyda: zero border-radius, fill-sweep buttons, word-reveal animations, editorial SVG art, no photographs in UI
- CCIAF: near-zero radius (2px), gold accent, contrast sections flip light↔dark, 2px blockquote rule
- IbnArbi: glass-card backdrop-blur, rounded-xl (16px), shadcn/ui patterns, Arabic RTL with Amiri
- All brands: no emoji in UI, no aggressive gradients, scholarly editorial aesthetic

### Known Gaps (v0.1.0)
- No version control or changelog
- No build pipeline or package.json
- No self-hosted font files (all Google Fonts)
- No automated tests or linting
- Color tokens not unified across brands (CSS var naming discrepancy)
- No component API documentation — patterns embedded only in preview HTMLs
- No responsive behavior documented outside media query implementations

---

## [v1.0.0] — Comprehensive Restructure (2026-05-24)

### Changed
- **Complete repo restructure** — flat file dump replaced with clean hierarchy: `tokens/`, `components/`, `patterns/`, `preview/`, `assets/`, `ui_kits/`
- **`colors_and_type.css`** split into brand-specific token files: `tokens/psyda.css`, `tokens/ibnarbi.css`
- **`cciaf_tokens.css`** moved to `tokens/cciaf.css`
- **README.md** rewritten with clearer brand taxonomy, design philosophy, and usage guide
- **SKILL.md** updated to reflect new file structure

### Added
- `CHANGELOG.md` — full version history
- `tokens/psyda.css` — Psyda/Minhaaj.com tokens (consolidated from `colors_and_type.css`)
- `tokens/cciaf.css` — CCIAF tokens (moved from `cciaf_tokens.css`, enhanced with `--content-prose`, `--font-serif`, expanded shadow tokens)
- `tokens/ibnarbi.css` — IbnArbi tokens (extracted from `colors_and_type.css`, standalone)
- `patterns/typography.md` — full type scale, font roles, responsive clamp strategy
- `patterns/color.md` — color philosophy, brand palette relationships, contrast section strategy
- `patterns/spacing.md` — space scale, layout grid, responsive padding strategy
- `patterns/motion.md` — animation tokens, word-reveal, fade-up, marquee, reduced-motion
- `patterns/editorial.md` — SVG art style, word-reveal animation, bleed figures, marquee
- `patterns/branding.md` — logos, voice, naming conventions, usage rules
- `components/navigation.md` — nav structure, glassmorphism, scroll states, responsive
- `components/buttons.md` — btn-outline, btn-solid, fill-sweep, hover/active specs
- `components/hero.md` — hero layout, staggered animation, photo frame, lighting overlay
- `components/cards.md` — testimonial cards, book cards, glass cards, hover effects
- `components/forms.md` — inputs, theme toggle, focus states, form patterns
- `components/footer.md` — 3-column grid, social icons, contact patterns

### Fixed
- CSS token files now consistent with live implementation in `minhaaj-website/style.css`
- CCIAF tokens expanded with all `--cs-*` contrast section variables
- Shadow and transition tokens aligned with production values

---
