# Color

## Design Philosophy

The Minhaaj ecosystem uses warm earth tones across all brands. Nothing is cool-toned or blue-shifted. Colors evoke parchment, leather, copper, gold, and aged paper — an archival, scholarly warmth.

**Key principle:** Each brand has a *single* accent color (copper or gold). There are no secondary accent colors. Emphasis comes from weight, spacing, and texture, not from color variety.

---

## Psyda / Minhaaj.com — Warm Parchment Palette

| Token | Hex | Name | Use |
|---|---|---|---|
| `--bg` | `#F7F3EC` | Warm Parchment | Page background |
| `--bg-alt` | `#EDE8DE` | Linen | Alternating section bg |
| `--bg-deep` | `#E3DCCE` | Ecru | Footer, contact section |
| `--bg-dark` | `#14120F` | Editorial Dark | Full-bleed dark panels |
| `--bg-dark-alt` | `#2A2620` | Dark Parchment | Dark panel gradient end |
| `--text-primary` | `#1E1C18` | Near Black | Headings, primary text |
| `--text-secondary` | `#6B6457` | Warm Grey | Body, subtitles |
| `--text-muted` | `#9A9383` | Dusty | Labels, captions |
| `--text-on-dark` | `#FAFAF7` | Off-White | Text on dark panels |
| `--accent` | `#8C7355` | Copper | Primary accent |
| `--accent-soft` | `#B89A78` | Warm Sand | Hover states |
| `--accent-deep` | `#6B5538` | Sienna | Pressed states |
| `--border` | `#D6CFC3` | Stone | Dividers |
| `--border-soft` | `rgba(30,28,24,0.08)` | Transparent Stone | Subtle borders |
| `--white` | `#FAFAF7` | Off-White | Button fill, selection |

### Semantic Colors (Psyda)

| Token | Hex | Name |
|---|---|---|
| `--color-success` | `#3A5A40` | Forest |
| `--color-error` | `#8B2E2E` | Crimson |
| `--color-warning` | `#8C7355` | Copper (same as accent) |
| `--color-info` | `#4A6B8A` | Slate Blue |

---

## CCIAF — Warm Earth + Gold

### Light Mode

| Token | Hex | Name | Use |
|---|---|---|---|
| `--bg` | `#F9F6F0` | Warm Off-White | Page bg |
| `--bg-alt` | `#F2EDE3` | Warm Cream | Alternate bg |
| `--bg-contrast` | `#1A1510` | Near Black | Contrast sections |
| `--surface` | `#FFFFFF` | White | Cards |
| `--surface-soft` | `rgba(255,255,255,.58)` | Translucent White | Glass cards |
| `--border` | `#DDD8CE` | Light Stone | Dividers |
| `--ink-1` | `#1A1510` | Near Black | Headings |
| `--ink-2` | `#3D3830` | Warm Dark Grey | Body |
| `--ink-3` | `#6B6358` | Medium Warm Grey | Secondary |
| `--ink-4` | `#A09890` | Light Warm Grey | Muted |
| `--gold` | `#8B6510` | Deep Gold/Ochre | Primary accent |
| `--gold-mid` | `#B8922A` | Mid Gold | Mid accent |
| `--gold-light` | `#D4AE60` | Light Gold | Borders, underlines |

### Dark Mode

| Token | Hex | Name |
|---|---|---|
| `--bg` | `#131008` | Very Dark Warm |
| `--bg-alt` | `#1B170D` | Dark Warm |
| `--bg-contrast` | `#0D0B06` | Almost Black |
| `--surface` | `#1E1A10` | Dark Surface |
| `--border` | `#2E2918` | Dark Stone |
| `--ink-1` | `#F0EAD8` | Warm Cream |
| `--ink-2` | `#C0B89E` | Warm Light Grey |
| `--ink-3` | `#7A7260` | Medium Warm |
| `--ink-4` | `#4A4438` | Dark Warm |
| `--gold` | `#C8A03A` | Bright Gold |
| `--gold-mid` | `#A07818` | Mid Gold |
| `--gold-light` | `#E0BC70` | Light Gold |

### Contrast Section Inversion (CCIAF)

CCIAF contrast sections (`.section-contrast`) invert the palette on theme switch. In light mode, the bg is dark (`#1A1510`). In dark mode, it becomes light (`#F5F0E8`). This maintains visual contrast hierarchy regardless of theme.

| Token | Light | Dark |
|---|---|---|
| `--cs-bg` | `#1A1510` | `#F5F0E8` |
| `--cs-h` | `#F5F0E8` | `#1A1510` |
| `--cs-body` | `rgba(245,240,232,.70)` | `rgba(26,21,16,.68)` |
| `--cs-border` | `rgba(245,240,232,.15)` | `rgba(26,21,16,.14)` |
| `--cs-gold` | `#D4AE60` | `#7A5810` |

---

## IbnArbi — Warm Parchment / Deep Navy (HSL)

### Light Mode

| Token | HSL | Description |
|---|---|---|
| `--ib-bg` | `hsl(40, 30%, 96%)` | Warm parchment |
| `--ib-bg-card` | `hsl(40, 25%, 92%)` | Card surface |
| `--ib-fg` | `hsl(240, 25%, 12%)` | Near black text |
| `--ib-primary` | `hsl(35, 85%, 35%)` | Gold-brown |
| `--ib-accent` | `hsl(260, 25%, 82%)` | Lavender |
| `--ib-border` | `hsl(40, 20%, 80%)` | Light border |

### Dark Mode

| Token | HSL | Description |
|---|---|---|
| `--ib-dark-bg` | `hsl(240, 30%, 4%)` | Deep navy |
| `--ib-dark-card` | `hsl(240, 25%, 6%)` | Dark card |
| `--ib-dark-fg` | `hsl(210, 20%, 90%)` | Light text |
| `--ib-dark-primary` | `hsl(45, 90%, 60%)` | Bright gold |
| `--ib-dark-accent` | `hsl(260, 50%, 30%)` | Deep purple |

---

## Accessibility

- **Color contrast:** All text/background combinations meet WCAG AA minimum (4.5:1 for body, 3:1 for large text)
- **Gold accent:** Gold is used for decorative/emphasis elements only — never as the sole conveyor of meaning
- **Focus outlines:** `outline: 2px solid var(--gold)` + `outline-offset: 3px` on all focusable elements across all brands
- **Selection:** `background: var(--accent)` / `color: var(--white)` for selected text
