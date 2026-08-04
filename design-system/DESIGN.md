# DESIGN.md — Brand Identity Tokens

> Initialized by `/impeccable init` and edited by you.
> This file is the source of truth for all color, type, and layout decisions.
> Every design choice made by the agent must derive from this file.
> Do not override this file mid-project without versioning the change.
> CCIAF values below are populated from `tokens/cciaf.css` (the live source of truth) and the component specs in `/components`.

---

## Color System

Warm earth base, one gold accent, no second hue anywhere.

| Token | Light | Dark | Role |
|-------|-------|------|------|
| `--color-bg` | `#F9F6F0` | `#131008` | Page background |
| `--color-surface` | `#FFFFFF` | `#1E1A10` | Cards, inputs, tooltips |
| `--color-text-primary` | `#1A1510` | `#F0EAD8` | Headings (ink-1) |
| `--color-text-secondary` | `#3D3830` | `#C0B89E` | Body copy (ink-2) |
| `--color-accent` | `#8B6510` | `#C8A03A` | The one gold accent |
| `--color-border` | `#DDD8CE` | `#2E2918` | Dividers, borders |

**Supporting tokens (same names as `tokens/cciaf.css`):** `--bg-alt` (`#F2EDE3` / `#1B170D`), `--ink-3` (`#6B6358` / `#7A7260`), `--ink-4` (`#A09890` / `#4A4438`), `--gold-mid` (`#B8922A` / `#A07818`), `--gold-light` (`#D4AE60` / `#E0BC70`).

**Dark mode:** Driven by a `data-theme` attribute on `<html>` (not `prefers-color-scheme`), persisted to `localStorage`. Never pure `#000`; light `--surface` is pure `#FFF` by brand decision. Contrast sections (`.section-contrast`) invert their background/ink pair on theme switch — this inversion *is* the signature behavior.

---

## Typography

| Role | Family | Weights | Usage |
|------|--------|---------|-------|
| Display | **Cormorant Garamond** | 300, 400, 500 + italic | Hero, section headings |
| Body | **EB Garamond** | 400, 500, 600 + italic | Paragraphs, descriptions |
| Utility | **Cormorant Garamond** | 400, uppercase | Labels, eyebrows, metadata — tracking 0.14–0.28em, gold or ink-3 |

**Type scale (root 18px, fluid):**

```
--text-hero:  clamp(2.6rem, 6vw, 5rem)    /* hero H1, weight 300 */
--text-h2:    clamp(1.7rem, 3vw, 2.6rem)   /* section H2, weight 400 */
--text-h3:    clamp(1.2rem, 2vw, 1.5rem)   /* subsection, weight 400 */
--text-body:  1.1rem, line-height 1.82     /* prose */
--text-eyebrow: 0.72rem, 0.22em uppercase  /* gold label above H2 */
--text-meta:  0.75rem–0.85rem, caps        /* footers, captions */
```

---

## Shape System

**All-sharp, one documented exception.** Surfaces use 2px; only buttons and pills use full radius. Never introduce a third value.

```css
--radius-sm:  2px;     /* surfaces, inputs, cards, tooltips */
--radius-full: 9999px; /* pill buttons ONLY — never cards */
```

---

## Spacing Scale

Base unit: 4px. Same scale as `tokens/cciaf.css`.

```
--space-1:  0.25rem   (4px)      --space-8:   2rem    (32px)
--space-2:  0.5rem    (8px)      --space-10:  2.5rem  (40px)
--space-3:  0.75rem   (12px)     --space-12:  3rem    (48px)
--space-4:  1rem      (16px)     --space-16:  4rem    (64px)
--space-5:  1.25rem   (20px)     --space-20:  5rem    (80px)
--space-6:  1.5rem    (24px)     --space-24:  6rem    (96px)
```

Grids use `border-right` dividers between columns (`:last-child { border-right: none }`), not gap-based separation, on layer/tier cards.

---

## Motion

| Property | Value | Note |
|----------|-------|------|
| Easing | `cubic-bezier(0.22, 1, 0.36, 1)` | single ease-out curve everywhere |
| Fast | `0.2s` | hover color/border, dot fills |
| Base | `0.35s` | toggles, general UI |
| Slow | `0.4s` | theme background/color cross-fade |
| Reveal | `0.7s` | scroll reveal (IntersectionObserver-driven, 55ms stagger) |
| Reduced motion | `prefers-reduced-motion: reduce` | all durations → 0.001ms, `scroll-behavior: auto` |

---

## Layout

**Max content width:** `1180px` (`--content-wide`); prose `760px` (`--content-prose`), blockquote 600px.

**Breakpoints:**
- Mobile: `< 760px` (hamburger nav, single-column grids)
- Desktop: `≥ 760px`

**Grid:** No 12-column system. Purpose-built grids: footer `1.4fr 1fr 1fr` (36px), layer grid 5 columns, engagement tiers 3 columns — all collapsing to single column ≤760px. Alignment comes from `clamp(20px, 5vw, 72px)` page padding.

---

## The Signature Element

> What is the one thing this brand/product will be remembered by?

**Contrast-section inversion.** Deep-ink sections (`.section-contrast`) that flip to light and back with the theme switch — a scholarly editorial page that *inverts* rather than dims, paired with the five-layer framework grid (Identity / Timing / Action / Interpretation / Risk Awareness) divided by hairline rules. Every page must carry at least one contrast section and the grid-border discipline.

---

## Anti-References

What CCIAF must NOT look like:

- Not: generic AI SaaS (Inter everywhere, purple-to-blue gradients, rounded-square icon tiles above every heading, three equal feature cards)
- Not: the Claude tell (cream + terracotta `#D97757`) — CCIAF is cream + **gold** `#8B6510`; the accent hue is the differentiator
- Not: astrology or occult kitsch (no zodiac glyphs, no purple/starfield, no mysticism imagery — the subject is timing intelligence, presented institutionally)
- Not: corporate consultancy template (blue headers, stock hero photos, "Partner with us" CTAs)
- Not: a default broadsheet — hairline rules exist, but layouts are airy editorial, not dense newspaper columns

---

## Notes & Versioning

| Date | Change | Reason |
|------|--------|--------|
| 2026-08-05 | Initial CCIAF population | v2.1.0 — integrated anti-slop orchestration into the CCIAF design system; values lifted from `tokens/cciaf.css` + `/components` specs |
