# Minhaaj Design System

A unified design system for the Minhaaj brand ecosystem — covering **Psyda**, **IbnArbi**, **CCIAF/Matrix**, and **minhaaj.com**.

---

## Sources

| Source | Type | Notes |
|---|---|---|
| `github.com/minhaajre/PsydaOfficialWebsite` | Codebase | Full HTML/CSS/JS — primary design baseline |
| `github.com/minhaajre/MinhaajPersonalWebsite` | Content repo | Copy archive for minhaaj.com (Squarespace site) |
| `github.com/minhaajre/IbnArbi` | Codebase | React 19 + Tailwind + shadcn/ui — ibnarbi.minhaaj.com |
| `cciaf.minhaaj.com` | Live site | Inaccessible to automated fetch; CCIAFmasterdata repo also not yet installed |
| `matrix.minhaaj.com` | Live site | CCIAF Identity Module (BaZi + Numerology) — minimal meta only |
| `psyda.org` | Live site | Psyda editorial redesign — primary visual baseline |

> **Note:** The `minhaajre/CCIAFmasterdata` repo was not accessible (GitHub App not installed). The design system is built from Psyda + IbnArbi codebases as the definitive sources, with CCIAF treated as a stylistic sibling.

---

## About the Brand

**Minhaaj Rehman** is CEO & Chief Data Scientist of **Psyda Solutions** — an AI-enabled academic and industrial research agency focused on psychographic profiling and machine learning. He is also an author, podcaster, Harvard Business Review Advisory Council member, and philanthropist based in Kigali, Rwanda.

### Products / Sites

| Product | URL | Description |
|---|---|---|
| **Psyda** | psyda.org | AI analytics agency — editorial flagship site |
| **minhaaj.com** | minhaaj.com | Personal brand — bio, coaching, books, podcast |
| **IbnArbi** | ibnarbi.minhaaj.com | Islamic lunar mansion cosmology app (React SPA) |
| **CCIAF / Matrix** | cciaf.minhaaj.com / matrix.minhaaj.com | Cross-Civilization Intelligence and Action Framework |
| **Psyda web interface** | webinterface (repo) | Big Five NEO IPIP 300-item personality test |

---

## CONTENT FUNDAMENTALS

### Voice & Tone
- **Voice:** Intellectual yet warm. Authoritative but not cold. Combines rigorous academic precision with a spiritual/humanist depth.
- **Person:** First-person singular ("I", "my") for Minhaaj.com and coaching content. Third-person for Psyda agency copy. Second-person ("you") for coaching offers and CTAs.
- **Casing:** Sentence case for body copy and most headings. ALL CAPS (spaced tracking) for labels, eyebrows, metadata, and category tags (e.g. `DATA · INSIGHTS · IMPACT`). Title Case avoided except for proper nouns.
- **Punctuation:** Em dashes used freely for emphasis. Ellipsis for contemplative pauses. Oxford comma used.
- **Emoji:** Not used in UI or marketing copy. Absent from all codebases examined.
- **Numbers in UI:** Roman numerals for list indices (i. ii. iii.) in editorial contexts. Arabic numerals for data. `n=412`, `σ = 0.94` style for statistical annotation.

### Copy Patterns
- **Eyebrows/labels:** Short dot-separated triplets — `Data · Insights · Impact`, `Visual · Digital · Interactive`
- **Headlines:** Short, punchy, often two-line. Italic emphasis on a key word. `Bringing *Analytics* to Life.`
- **Sub-copy:** One measured sentence. No bullet lists in hero. Max ~440px wide prose column.
- **CTAs:** Minimal text + arrow glyph. `Our LinkedIn →`, `Explore research →`
- **Pull quotes:** Italicized, serif, in quotation marks. Narrative voice. `"Data is a language. We translate it into something you can feel."`
- **Metadata tags:** Archival-style. `ISSUE N°03 · SPREAD`, `FIG. 01 · TIME`, `03°42′N  030°03′E`

### Vibe
Editorial. Scholarly. Calm confidence. Think: *a beautifully typeset academic journal, crossed with a luxury magazine layout.* Nothing shouts. Everything is precise.

---

## VISUAL FOUNDATIONS

### Color Palette
Two distinct palettes coexist in the ecosystem:

**Psyda / minhaaj.com — Warm Parchment (primary)**
| Token | Hex | Use |
|---|---|---|
| `--bg` | `#F7F3EC` | Page background |
| `--bg-alt` | `#EDE8DE` | Alternating section bg |
| `--bg-deep` | `#E3DCCE` | Footer, contact bg |
| `--text-primary` | `#1E1C18` | Headings, primary text |
| `--text-secondary` | `#6B6457` | Body, subtitles |
| `--text-muted` | `#9A9383` | Labels, captions |
| `--accent` | `#8C7355` | Copper/tan — links, underlines, highlights |
| `--accent-soft` | `#B89A78` | Soft accent, hover states |
| `--border` | `#D6CFC3` | Dividers, card borders |
| `--white` | `#FAFAF7` | Selection bg, button fill |

**IbnArbi — Warm Parchment Light / Deep Navy Dark**
- Light: `hsl(40 30% 96%)` background, `hsl(240 25% 12%)` foreground, `hsl(35 85% 35%)` primary (gold-brown)
- Dark: `hsl(240 30% 4%)` background, `hsl(210 20% 90%)` foreground, `hsl(45 90% 60%)` primary (bright gold)
- Accent: `hsl(260 25% 82%)` (lavender-grey)

### Typography
**Psyda / minhaaj.com:**
- `--font-display: 'Cormorant Garamond'` — Display serif. Used for all major headings, pull quotes, chapter numbers, editorial figures. Weights 300–600, italic essential.
- `--font-ui: 'DM Sans'` — UI sans. Nav links, labels, eyebrows, metadata. Letter-spacing 0.2–0.28em on uppercase labels.
- `--font-body: 'Inter'` — Body text. Weight 300–400. Line-height 1.55–1.75.

**IbnArbi:**
- `--font-serif: 'Lora'` — Section headers
- `--font-sans: 'Source Sans 3'` — Body/UI
- `--font-arabic: 'Amiri'` — Arabic text (RTL)

**Type Scale (Psyda):**
- Hero headline: `clamp(3.4rem, 8.5vw, 7.5rem)` weight 300, line-height 0.95
- Chapter title: `clamp(2.2rem, 4.2vw, 3.6rem)` weight 300
- Section headline: `clamp(3rem, 8vw, 6.5rem)` weight 300
- Chapter number: `clamp(5rem, 10vw, 8rem)` italic, accent color
- Nav links: `0.68rem` / letter-spacing `0.22em` / uppercase
- Body: `1rem` / line-height `1.7` / weight 300
- Labels/eyebrows: `0.62–0.68rem` / letter-spacing `0.24–0.28em` / uppercase
- Captions: `0.95rem` italic serif

### Spacing
- `--nav-h: 76px` (desktop), `64px` (mobile)
- `--max-w: 1280px`
- `--pad-x: clamp(1.5rem, 5vw, 3.5rem)`
- `--sec-py: clamp(6rem, 14vw, 12rem)`
- Chapter grid: `280px sidebar + 1fr content`, gap `clamp(2rem, 6vw, 6rem)`
- Editorial list items: `1.8rem 0` padding, border-bottom divider

### Backgrounds & Imagery
- **Background:** Flat warm parchment — no gradients on page backgrounds. Very subtle linear gradients only in hero SVG art panels.
- **Full-bleed bands:** Dark editorial SVG compositions (dark `#14120f` bg with light data-vis curves) used as chapter separators. Treated like magazine spreads, not photos.
- **No photographs in UI** — hero art is bespoke SVG "scientific figures" (scatter plots, concentric circles, waveforms). Archival/editorial aesthetic.
- **IbnArbi dark mode:** Radial gradient overlays at page level (`hsl(260 40% 10%)` → transparent) for atmospheric depth.

### Animation & Motion
- **Easing:** `cubic-bezier(0.22, 1, 0.36, 1)` (ease-out snap) and `cubic-bezier(0.65, 0.05, 0.36, 1)` (ease-in-out)
- **Reveal on scroll:** Words split into `.word > span` wrappers, `translateY(105%)` → `0`. Duration 0.9s with 50ms staggered delay.
- **Fade-up:** `opacity: 0` + `translateY(28px)` → visible. Duration 0.8s.
- **Marquee:** Continuous horizontal scroll, `38s linear infinite`
- **Parallax:** Bleed-figure SVGs shift ~40px on scroll. Implemented via `getBoundingClientRect`.
- **Nav scroll state:** `background: rgba(247,243,236,0.78)` + `backdrop-filter: blur(18px)` on scroll past 40px.
- **Reduced motion:** Full `prefers-reduced-motion` support — all durations set to `0.001ms`.

### Hover & Press States
- **Links:** Underline that grows `right: 100%` → `right: 0` on hover (0.5s ease-out). Color changes to `--text-primary`.
- **Buttons (hero):** Fill sweep from bottom (`translateY(101%)` → `0`) fills with `--text-primary`; text turns `--white`. Arrow shifts 4px right.
- **Editorial list items:** `padding-left: 1rem` slide on hover (0.5s ease).
- **Media rows:** `padding-left: 1.25rem` + semi-transparent bg on hover.
- **Nav active:** Underline persists in `--accent` color.

### Borders & Shadows
- **Borders:** 1px solid `--border` or `--border-soft (rgba(30,28,24,0.08))`. No thick borders, no colored left-border accents.
- **Cards (IbnArbi):** `glass-card` — `backdrop-blur-xl`, `bg-card/40`, `border-border/50`, `shadow-lg`. Subtle gradient overlay `from-primary/5`.
- **No outer box shadows on Psyda** — depth comes from background tone changes, not shadows.
- **Scroll progress bar:** 3px top-fixed, accent color, `box-shadow: 0 0 8px rgba(140,115,85,0.25)`.

### Corner Radii
- Psyda: No border-radius on major sections. Square-edged editorial aesthetic.
- IbnArbi: `--radius: 0.5rem` base. Cards use `rounded-xl` (12px) or `rounded-2xl` (16px).

### Layout
- **Fixed nav:** Height 76px, `position: fixed`, transparent → frosted glass on scroll.
- **Side rail:** Fixed right column, vertical section dots, hidden on mobile.
- **Chapter grid:** `280px` sticky sidebar + `1fr` content. Sidebar is sticky `top: nav-h + 3rem`.
- **Container:** `max-width: 1280px`, centered, `padding: 0 clamp(1.5rem, 5vw, 3.5rem)`.
- **Mobile-first:** Collapses to single column below 1100px. Hamburger nav at 720px.

### Color Vibe of Imagery
Warm, archival, sepia-adjacent. The SVG art panels use a `#EDE8DE` → `#C8BFAE` gradient. Dark bleed sections use near-black `#14120f`–`#2a2620`. Nothing cool-toned or blue-shifted.

---

## ICONOGRAPHY

### Psyda / minhaaj.com
- **No icon library.** All iconography is custom inline SVG.
- **P. logo mark:** Bold sans-serif "P" with a small circular period/dot. Used as favicon and logo mark. Charcoal `#3D3C38` on white.
- **Nav logo:** SVG circle with a "P"-like interior path (circle + two strokes). Rendered at 30px.
- **Arrow icons:** Simple `M0 6 H22 M16 1 L22 6 L16 11` (right-pointing arrow) used in CTAs.
- **Side rail:** 6px dots, `border: 1px solid accent`, filled on active.

### IbnArbi
- **Lucide React** for generic UI icons (`Info`, standard UI).
- **Custom Islamic icon set** (`client/src/components/icons/IslamicIcons.tsx`): `MosqueIcon`, `CrescentMoonIcon`, `CrescentStarIcon`, `LanternIcon`, `PrayerBeadsIcon`, `QuranIcon`, `KaabaIcon`, `PrayerRugIcon`, `EightPointedStarIcon`, `DuaHandsIcon`, `SunriseIcon`, `MinharahIcon`, `IslamicPatternIcon`, `DomeIcon`, `TasbihIcon`, `MihrabIcon`, `CalligraphyIcon`, `ZodiacWheelIcon`, `ElementFireIcon`, `ElementWaterIcon`, `ElementAirIcon`, `ElementEarthIcon`.
- **Style:** 1.5px stroke, round linecap/linejoin, 24×24 viewBox. No fills — pure stroke icons.
- **Emoji/Unicode:** Not used in UI.

### Copied Assets
- `assets/logos/` — Psyda logo variants (P., wordmark, dark)
- `assets/icons/` — IbnArbi Islamic icon set (SVG extracted from TSX)
- `images/` — Psyda photo assets (analytics.jpg, media.jpg, bulb.jpg)

---

## File Index

```
/
├── README.md                    ← This file (you are here)
├── SKILL.md                     ← Agent skill definition
├── colors_and_type.css          ← CSS custom properties — all tokens
├── assets/
│   ├── logos/                   ← Psyda logo variants
│   └── icons/                   ← IbnArbi Islamic SVG icons
├── images/                      ← Psyda photo assets (from repo)
├── fonts/                       ← Google Fonts note (not self-hosted)
├── preview/                     ← Design system card HTMLs
│   ├── colors-brand.html
│   ├── colors-semantic.html
│   ├── colors-ibnarbi.html
│   ├── type-display.html
│   ├── type-ui.html
│   ├── type-scale.html
│   ├── type-arabic.html
│   ├── spacing-tokens.html
│   ├── spacing-layout.html
│   ├── shadows-radii.html
│   ├── components-buttons.html
│   ├── components-nav.html
│   ├── components-cards.html
│   ├── components-forms.html
│   ├── components-editorial-list.html
│   ├── brand-logos.html
│   ├── brand-icons-islamic.html
│   └── brand-motion.html
└── ui_kits/
    ├── psyda/                   ← Psyda editorial website UI kit
    │   ├── README.md
    │   ├── index.html
    │   ├── Nav.jsx
    │   ├── Hero.jsx
    │   ├── ChapterSection.jsx
    │   └── Footer.jsx
    ├── minhaaj/                 ← minhaaj.com personal site UI kit
    │   ├── README.md
    │   ├── index.html
    │   ├── HeroSection.jsx
    │   ├── AcceleratorSection.jsx
    │   └── Footer.jsx
    └── ibnarbi/                 ← IbnArbi Islamic app UI kit
        ├── README.md
        ├── index.html
        ├── SectionCard.jsx
        ├── MansionCard.jsx
        └── Footer.jsx
```

---

## Font Note
All fonts are loaded from Google Fonts (no self-hosted files in repos):
- **Cormorant Garamond** — `wght@300;400;500;600` + italic variants
- **DM Sans** — `opsz,wght@9..40,300;9..40,400;9..40,500`
- **Inter** — `wght@300;400;500`
- **Lora** — IbnArbi serif
- **Source Sans 3** — IbnArbi sans
- **Amiri** — IbnArbi Arabic

No TTF/WOFF files are included. See `colors_and_type.css` for `@import` declarations.
