# Branding & Voice

## Brand Ecosystem

The Minhaaj ecosystem spans four distinct brands, each with a unique visual dialect but a shared underlying DNA:

| Brand | Tagline / Purpose | Person | Voice |
|---|---|---|---|
| **Psyda** | AI-enabled research and analytics | Third-person | Authoritative, analytical, editorial |
| **Minhaaj.com** | Personal brand — author, coach, speaker | First-person ("I", "my") | Warm, conversational, reflective |
| **CCIAF** | Cross-Civilization Intelligence Framework | Third-person | Scholarly, framework-oriented, precise |
| **IbnArbi** | Islamic lunar mansion cosmology | Neutral | Contemplative, spiritual, educational |
| **Matrix** | CCIAF Identity Module (BaZi + Numerology) | Second-person ("you") | Personal, diagnostic, insightful |

---

## Voice & Tone

### Universal Principles
- **Intellectual yet warm** — rigorous academic precision with spiritual/humanist depth
- **Calm confidence** — nothing shouts; everything is precise
- **Editorial** — think a beautifully typeset academic journal crossed with a luxury magazine layout

### Casing
- **Sentence case** for body copy and most headings
- **ALL CAPS** (spaced tracking 0.14–0.28em) for:
  - Labels and eyebrows
  - Metadata and category tags
  - Button text
  - Section superheads
- **Title Case** — avoided except for proper nouns (book titles, organization names)

### Punctuation
- **Em dashes** — used freely for emphasis and parenthetical asides
- **Ellipsis…** — for contemplative pauses
- **Oxford comma** — required in all lists
- **Dots** — dot-separated triplets for labels: `Data · Insights · Impact`

### Emoji
- **Never used** in UI, marketing copy, or any brand communications

---

## Copy Patterns

### Eyebrows / Labels
Short, dot-separated triplets in ALL CAPS:
- `Data · Insights · Impact`
- `Visual · Digital · Interactive`
- `Layer · Question · Method`

### Headlines
- Short, punchy, often two-line
- Italic emphasis on a key word using `<em>` or italic font style
- Example: `Bringing *Analytics* to Life.`

### Body Copy
- One measured sentence per paragraph in hero areas
- No bullet lists in hero sections
- Max ~440–580px wide prose columns

### CTAs
- Minimal text + arrow or directional cue
- `Our LinkedIn →`
- `Explore research →`
- `Read more →`

### Pull Quotes
- Italicized serif, in quotation marks
- Narrative voice, not header-like
- `"Data is a language. We translate it into something you can feel."`

### Metadata Tags
Archival-style annotation format:
- `ISSUE N°03 · SPREAD`
- `FIG. 01 · TIME SERIES`
- `03°42′N  030°03′E`

---

## Numbers in UI

| Context | Style | Example |
|---|---|---|
| List indices | Roman numerals | i. ii. iii. |
| Data | Arabic numerals | n=412, σ = 0.94 |
| Chapter numbers | Large italic serif | V, X, XII |
| Pricing | Arabic, formatted | $2,998 |
| Coordinates | Degree/minute marks | 03°42′N 030°03′E |

---

## Logos

### Psyda
- **P. logo mark** — Bold sans-serif "P" with a small circular period/dot. Charcoal `#3D3C38` on white. Favicon use.
- **Nav logo** — SVG circle with "P"-like interior path (circle + two strokes). Rendered at 30px.
- **Wordmark** — Full "Psyda" wordmark in brand typography.

### Files
All logo variants in `assets/logos/`:
- `psyda-logo.jpg` — Default P. logo
- `psyda-logo-dark.jpg` — Dark variant for light backgrounds
- `psyda-logo-mark.jpg` — Logo mark only (no wordmark)
- `psyda-logo-wordmark.jpg` — Wordmark only

---

## Color Vibe of Imagery

Warm, archival, sepia-adjacent. Nothing cool-toned or blue-shifted.

- **Light panels:** beige-to-stone gradients (`#EDE8DE` → `#C8BFAE`)
- **Dark bleed panels:** near-black to dark grey (`#14120F` → `#2A2620`)
- **Photo grading:** Warm-toned, slightly desaturated, archival feel
- **IbnArbi dark mode:** Subtle radial gradient overlays at page level (`hsl(260 40% 10%)` → transparent) for atmospheric depth

---

## Iconography Conventions

| Brand | Icon Source | Style |
|---|---|---|
| Psyda / Minhaaj.com | Custom inline SVG only | No icon library. Arrow glyphs, simple geometric shapes |
| IbnArbi | Custom Islamic SVG icons + Lucide React | 1.5px stroke, round caps, no fills, 24×24 |
| CCIAF | Font Awesome 6.5.1 (self-hosted) | Solid and regular styles via `assets/fa/all.min.css` |
