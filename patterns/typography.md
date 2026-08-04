# Typography

CCIAF is an **all-serif, two-font system**. Display and body share the same typographic family lineage (Garalde serifs) for a quiet, scholarly, editorial voice.

## Font roles

| Role | Font | Weights | Usage |
|---|---|---|---|
| Display / headings | **Cormorant Garamond** | 300, 400, 500 + italic | Hero titles, section headings, eyebrows, brand, blockquotes, buttons |
| Body / prose | **EB Garamond** | 400, 500, 600 + italic | Paragraphs, body copy, nav links, testimonial text, form inputs |

Fonts are loaded from Google Fonts (no self-hosted files required):

```css
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&family=EB+Garamond:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&display=swap');
```

## Type scale

| Token | Size | Weight | Line height | Letter-spacing | Context |
|---|---|---|---|---|---|
| `--text-hero` | `clamp(2.6rem, 6vw, 5rem)` | 300 | 1.08 | -0.01em | Hero title |
| `--text-h2` | `clamp(1.7rem, 3vw, 2.6rem)` | 300 | 1.15 | 0 | Section H2 |
| `--text-h3` | `clamp(1.2rem, 2vw, 1.5rem)` | 400 | — | 0 | Subsection H3 |
| `--text-body` | 1.1rem (~20px) | 400 | 1.82 | 0 | Prose body |
| `--text-small` | 0.85rem (~15px) | — | — | — | Labels, captions |
| `--text-eyebrow` | 0.72rem (~13px) | 300 | — | 0.22em | Section eyebrow |
| `--text-nav` | 15px | 400 | — | 0.04em | Nav links |
| `--text-label` | 12px | 300 | — | 0.18em | Layer labels |

Blockquote: `clamp(1.2rem, 2.4vw, 1.65rem)` / Cormorant Garamond / italic / weight 300 / line-height 1.42.

## Typographic conventions

- **Sentence case** for all body copy and headings (not Title Case)
- **ALL CAPS** + spaced tracking (0.14–0.28em) for labels, eyebrows, metadata, brand wordmark
- **Italic** for emphasis within headings (Cormorant Garamond italic) and for lead prose, testimonials, and pull quotes (EB / Cormorant italic)
- **Max-width:** 58–60ch for prose columns; 700–900px for headings
- **Line height:** 1.75–1.82 for prose (generous), 1.08–1.18 for headings (tight)
- **Base font-size:** `html { font-size: 18px }`
- **Font smoothing:** `-webkit-font-smoothing: antialiased` on all surfaces

## Responsive clamp strategy

All major type sizes use `clamp(MIN, PREFERRED, MAX)` for fluid scaling without media queries:

```
clamp(2.6rem, 6vw, 5rem)
         ^       ^    ^
        min   preferred max
        26px   6vw      80px
```
