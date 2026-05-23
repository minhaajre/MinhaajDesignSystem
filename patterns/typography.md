# Typography

## Font Roles

### Psyda / Minhaaj.com — 3-font system

| Role | Font | Weights | Usage |
|---|---|---|---|
| Display | **Cormorant Garamond** | 300, 400, 500, 600 + italic | Major headings, pull quotes, chapter numbers, editorial figures, navigation brand |
| UI | **DM Sans** | 300, 400, 500 | Nav links, labels, eyebrows, metadata, buttons |
| Body | **Inter** | 300, 400, 500 | Paragraphs, prose, body copy |

### CCIAF — 2-font system (all serif)

| Role | Font | Weights | Usage |
|---|---|---|---|
| Display / headings | **Cormorant Garamond** | 300, 400, 500 + italic | Hero titles, section headings, eyebrows, brand, blockquotes, buttons |
| Body / prose | **EB Garamond** | 400, 500, 600 + italic | Paragraphs, body copy, nav links, testimonial text |

### IbnArbi — 3-font system

| Role | Font | Weights | Usage |
|---|---|---|---|
| Serif (headings) | **Lora** | 400, 500, 600, 700 | Section headers, titles |
| Sans (body/UI) | **Source Sans 3** | 300, 400, 500, 600 | Body text, UI elements, navigation |
| Arabic (RTL) | **Amiri** | 400, 700 | Arabic text and passages |

---

## Type Scale (Psyda/Minhaaj.com)

| Token | Size | Weight | Line Height | Letter Spacing | Context |
|---|---|---|---|---|---|
| `--text-hero` | `clamp(3.4rem, 8.5vw, 7.5rem)` | 300 | 0.95 | -0.01em | Hero headline |
| `--text-display` | `clamp(3rem, 8vw, 6.5rem)` | 300 | 0.95 | -0.015em | Section/media headline |
| `--text-h1` | `clamp(2.2rem, 4.2vw, 3.6rem)` | 300 | 1.1 | -0.015em | Chapter title |
| `--text-chapter-num` | `clamp(5rem, 10vw, 8rem)` | 300 italic | — | — | Chapter numerals |
| `--text-h2` | `clamp(1.8rem, 3vw, 2.4rem)` | 300 | 1.1 | 0 | Section title |
| `--text-h3` | 1.8rem | 400 | — | 0 | List item headings |
| `--text-lede` | 1.25rem | 300 italic | 1.55 | 0 | Lead paragraph |
| `--text-body` | 1rem | 300 | 1.7 | 0 | Body text |
| `--text-small` | 0.95rem | — | — | — | Captions, footnotes |
| `--text-label` | 0.68rem | 500 | — | 0.22em | Eyebrows, labels |
| `--text-micro` | 0.62rem | — | — | 0.28em | Fine print, corner meta |

---

## Type Scale (CCIAF)

| Token | Size | Weight | Line Height | Letter Spacing | Context |
|---|---|---|---|---|---|
| `--text-hero` | `clamp(2.6rem, 6vw, 5rem)` | 300 | 1.08 | -0.01em | Hero title |
| `--text-h2` | `clamp(1.7rem, 3vw, 2.6rem)` | 300 | 1.15 | 0 | Section H2 |
| `--text-body` | 1.1rem (~20px) | 400 | 1.82 | 0 | Prose body |
| `--text-eyebrow` | 0.72rem (~13px) | 300 | — | 0.22em | Section eyebrow |
| `--text-nav` | 15px | 400 | — | 0.04em | Nav links |
| `--text-label` | 12px | 300 | — | 0.18em | Layer labels |

Blockquote: `clamp(1.2rem, 2.4vw, 1.65rem)` / Cormorant Garamond / italic / weight 300 / line-height 1.42

---

## Type Scale (IbnArbi)

| Size | Font | Usage |
|---|---|---|
| `clamp(2rem, 5vw, 3.5rem)` | Lora 500 | Page titles |
| `1.5rem` | Lora 500 | Section headings |
| `1.15rem` | Source Sans 3 400 | Body / prose |
| `0.95rem` | Source Sans 3 400 | Labels, metadata |
| `1.15rem` | Amiri 400 | Arabic RTL body |

---

## Typographic Conventions

- **Sentence case** for all body copy and headings (not Title Case)
- **ALL CAPS** + spaced tracking (0.14–0.28em) for labels, eyebrows, metadata
- **Italic** for emphasis within headings (Cormorant Garamond italic or EB Garamond italic)
- **Max-width:** 58–60ch for prose columns; 700–900px for headings
- **Line height:** 1.7–1.82 for prose (generous), 0.95–1.15 for headings (tight)
- **Body font-size:** 16–18px base (varies by brand)
- **Font smoothing:** `-webkit-font-smoothing: antialiased` on all brands

## Responsive Clamp Strategy

All major type sizes use `clamp(MIN, PREFERRED, MAX)` for fluid scaling without media queries. The preferred value uses `vw` units to scale with viewport:

```
clamp(2.6rem, 6vw, 5rem)
         ^       ^    ^
        min   preferred max
        26px   6vw      80px
```
