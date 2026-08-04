# Color

## Philosophy

CCIAF uses warm earth tones — parchment, leather, ochre, and aged paper. The palette is **monochromatic-warm with a single gold accent**. There are no cool or blue-shifted hues anywhere in the system.

**Key principle:** One accent color per surface — gold. Emphasis comes from weight, spacing, and tone, never from a second hue. Gold is used for decorative/emphasis elements only and is never the sole conveyor of meaning.

## Light mode

| Token | Hex | Name | Use |
|---|---|---|---|
| `--bg` | `#F9F6F0` | Warm Off-White | Page background |
| `--bg-alt` | `#F2EDE3` | Warm Cream | Alternate section bg |
| `--bg-contrast` | `#1A1510` | Near Black | Contrast sections |
| `--surface` | `#FFFFFF` | White | Cards, inputs |
| `--surface-soft` | `rgba(255,255,255,.58)` | Translucent White | Glass / nav |
| `--border` | `#DDD8CE` | Light Stone | Dividers, card borders |
| `--ink-1` | `#1A1510` | Near Black | Headings |
| `--ink-2` | `#3D3830` | Warm Dark Grey | Body text |
| `--ink-3` | `#6B6358` | Medium Warm Grey | Secondary text |
| `--ink-4` | `#A09890` | Light Warm Grey | Muted, captions |
| `--ink-5` | `#C0BAB0` | Fine Warm Grey | Finest print |
| `--gold` | `#8B6510` | Deep Gold / Ochre | Primary accent |
| `--gold-mid` | `#B8922A` | Mid Gold | Hover / fills |
| `--gold-light` | `#D4AE60` | Light Gold | Underlines, borders |
| `--gold-pale` | `#F5F0E5` | Palest Gold Tint | Callout fills |

## Dark mode

| Token | Hex | Name |
|---|---|---|
| `--bg` | `#131008` | Very Dark Warm |
| `--bg-alt` | `#1B170D` | Dark Warm |
| `--bg-contrast` | `#0D0B06` | Almost Black |
| `--surface` | `#1E1A10` | Dark Surface |
| `--surface-soft` | `rgba(30,26,16,.72)` | Dark Glass |
| `--border` | `#2E2918` | Dark Stone |
| `--ink-1` | `#F0EAD8` | Warm Cream |
| `--ink-2` | `#C0B89E` | Warm Light Grey |
| `--ink-3` | `#7A7260` | Medium Warm |
| `--ink-4` | `#4A4438` | Dark Warm Muted |
| `--ink-5` | `#2E2918` | Darkest Muted |
| `--gold` | `#C8A03A` | Bright Gold |
| `--gold-mid` | `#A07818` | Mid Gold |
| `--gold-light` | `#E0BC70` | Light Gold |
| `--gold-pale` | `#2A2410` | Dark Gold Tint |

## Contrast-section inversion

CCIAF contrast sections (`.section-contrast`) invert the palette on theme switch. In light mode the bg is dark (`#1A1510`); in dark mode it becomes light (`#F5F0E8`). This preserves contrast hierarchy in either theme.

| Token | Light | Dark |
|---|---|---|
| `--cs-bg` | `#1A1510` | `#F5F0E8` |
| `--cs-h` | `#F5F0E8` | `#1A1510` |
| `--cs-body` | `rgba(245,240,232,.70)` | `rgba(26,21,16,.68)` |
| `--cs-border` | `rgba(245,240,232,.15)` | `rgba(26,21,16,.14)` |
| `--cs-gold` | `#D4AE60` | `#7A5810` |

## Semantic / report colors

| Token | Light | Dark | Use |
|---|---|---|---|
| `--callout-bg` | `#F5F0E5` | `#211C10` | Callout / note fills |
| `--note-bg` | `#F9F6F0` | `#16130B` | Note surfaces |
| `--crc-bg` / `--crc-border` | `#FFFDF5` / `#8B6510` | `#2A2410` / `#C8A03A` | CRC badge |
| `--code-bg` / `--code-fg` | `#1A1510` / `#F5F0E5` | `#0D0B06` / `#F0EAD8` | Inline code |
| Layer badges (L1–L5) | quiet, paper-friendly tints | dark-translated | framework layer tags |
| Confidence grades (high/mod/low/none) | green / amber / red / grey tints | dark-translated | confidence tags |

## Accessibility

- **Contrast:** All text/background combinations meet WCAG AA (≥4.5:1 body, ≥3:1 large text)
- **Gold accent:** decorative/emphasis only — never the sole conveyor of meaning
- **Focus outlines:** `outline: 2px solid var(--gold)` + `outline-offset: 3px` on all focusable elements
- **Selection:** `background: var(--gold); color: var(--cs-h)`
