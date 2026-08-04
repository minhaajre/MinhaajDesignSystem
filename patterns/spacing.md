# Spacing & Layout

CCIAF uses a consistent spacing scale and generous, clamp-based section rhythm. Everything is built on an 18px root with fluid horizontal padding.

## Spacing scale

| Token | Rem | Pixels | Use |
|---|---|---|---|
| `--space-1` | 0.25rem | 4px | Micro spacing |
| `--space-2` | 0.5rem | 8px | Tight gaps |
| `--space-3` | 0.75rem | 12px | Button padding |
| `--space-4` | 1rem | 16px | Base spacing |
| `--space-5` | 1.25rem | 20px | Labels to content |
| `--space-6` | 1.5rem | 24px | Section gap, footer |
| `--space-8` | 2rem | 32px | Headings to body |
| `--space-10` | 2.5rem | 40px | CTA margin |
| `--space-12` | 3rem | 48px | Section padding |
| `--space-16` | 4rem | 64px | Large section padding |
| `--space-20` | 5rem | 80px | Very large gaps |
| `--space-24` | 6rem | 96px | Section vertical spacing |

## Layout tokens

| Token | Value | Notes |
|---|---|---|
| `--nav-h` | 58px | fixed nav height (no mobile variant) |
| `--content-wide` | 1180px | hero, grids, full-width sections |
| `--content-prose` | 760px | biography, contact, long-form copy |
| `--pad-x` | `clamp(20px, 8vw, 120px)` | horizontal page padding |
| `--sec-py` | `clamp(70px, 9vw, 120px)` | vertical section padding |

## Section padding pattern

All sections use `clamp()` for vertical padding: `clamp(70px, 9vw, 120px)`. Horizontal padding is `clamp(20px, 8vw, 120px)` — tight on mobile, generous on desktop.

## Content widths

- **Full width (`--content-wide`):** 1180px — hero, layer grid, engagement tiers
- **Prose width (`--content-prose`):** 760px — biography, contact copy
- **Section H2 max-width:** 700px (standard), 860px (page headers)
- **Prose column max-width:** 60ch (~660px at 18px)
- **Blockquote max-width:** 600px

## Grid patterns

| Pattern | Columns | Gap | Collapse |
|---|---|---|---|
| Hero | `minmax(0,1.03fr) minmax(300px,.72fr)` | `clamp(42px,7vw,92px)` | ≤980px → 1 col |
| Five-layer framework | `repeat(5, 1fr)` | border-separated | ≤900px → 2-up; ≤540px → 1 col |
| Engagement tiers | `repeat(3, 1fr)` | border-separated | ≤800px → 1 col |
| Traditions | `1fr 1fr` | 40px 72px | ≤620px → 1 col |
| Footer (rebuilt) | `1.4fr 1fr 1fr` | 36px | ≤760px → 1 col |
| Testimonial | `84px 1fr` | 26px | ≤760px → 1 col |
| Footer (slim) | `1fr auto 1fr` | 28px | ≤760px → 1 col |

Layer and tier grids use `border-right` dividers with `:last-child { border-right: none }` and `:hover { background: var(--bg-alt) }` instead of gaps.

## Responsive breakpoints

| Breakpoint | Behavior |
|---|---|
| 980px | Multi-column grids (hero, etc.) → single column |
| 800px | Engagement tiers → single column |
| 760px | Mobile nav (hamburger), footer → single column, reduced padding |
| 620px | Traditions → single column |
| 540px | Layer grid → single column |

## Navigation height

Nav is a fixed 58px bar on all viewports. Page containers offset by `calc(var(--nav-h) + [additional padding])`. The hero uses `min-height: 100vh` with top padding `calc(58px + clamp(40px,8vw,80px))`.
