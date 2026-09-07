# AGENTS.md — MinhaajDesignSystem (CCIAF Byte-Identical Design Shell)

This repo is a **design shell, not a content system**. Every page built from it must be *visually* indistinguishable from `https://cciaf.minhaaj.com` (byte-identical design) while content is **exclusively** from the external source — `webfetch` result or user-provided text. CCIAF content carries no authority into new projects; only its design tokens, layout primitives, and behavior do.

## Canonical source — read first, always

- `templates/cciaf-starter.html` (1380 lines, exact live copy 2026-09-07) — **visual reference only** for CSS/JS/layout. Do not copy its sentences as content.
- `templates/cciaf.css` (639 lines) — extracted `<style>`; `templates/cciaf.js` (142 lines) — extracted `<script>`.
- `tokens/cciaf.css:16-392` — CSS custom properties (also inlined in starter).

**Mandatory read order:** `templates/cciaf.css` + `templates/cciaf.js` → `patterns/editorial.md` + `patterns/motion.md` → starter *as layout reference* (copy structure/classes, never its text).

## Content-origin rule (absolute)

- Every visible string in the generated page must be traceable verbatim (or minimal Sentence-case normalization) to the `webfetch` payload or explicit user text. No CCIAF sentence, heading, or label may survive unless it lexically appears in the source. This includes but is not limited to: "Five analytical layers", "calibrated decision logic", "single recommendation when traditions disagree", "Cross-Civilization Intelligence…", "The Problem", "Traditions", "Codex", "Risk Awareness", etc.
- If no analogue exists in the source for a starter block, delete that block — do not synthesize CCIAF-themed filler. Derive labels/headings verbatim from the scrape's own headings (e.g., scraped "featured talks" → `.s-h2` "Featured talks", not "Architecture").
- Emoji banned per design system; also must not re-introduce emoji if scrape contains it — drop or replace with text.

## How to use

### Plain HTML — content-derived build (correct)
```bash
# 1. Fetch source
# 2. Parse its H1/H2 hierarchy into sections
# 3. Copy starter's <head> CSS/JS + <header>/<div.sn>/<button.st>/<footer> shell
# 4. For each scraped heading, emit one .sec using its verbatim heading + body paras
# 5. Choose layout primitive per content shape (see catalog below)
```

### Framework (Next/React/Vue)
```js
import 'MinhaajDesignSystem/tokens/cciaf.css'
import 'MinhaajDesignSystem/templates/cciaf.css'
import 'MinhaajDesignSystem/templates/cciaf.js' // or inline before </body>
```
Preserve `html {font-size:18px}` and `<html data-theme="light">` (persist key `cciaf-theme`).

## Non-negotiables — 12 design rules (visual fidelity)

1. **Palette — one gold accent only.** Light `--bg:#F9F6F0` `--ink-1:#1A1510` `--ink-2:#3D3830` `--gold:#8B6510`; Dark `--bg:#131008` `--ink-1:#F0EAD8` `--gold:#C8A03A` (`templates/cciaf.css:12-63`). No second hue, no purple/blue gradient, no `#D97757`.
2. **Typography — two fonts, all-serif.** `Cormorant Garamond 300/400/500+italic` (display/eyebrow) + `EB Garamond 400/500/600+italic` (body) via `templates/cciaf.css:9`. Root `18px`. `clamp(2.6rem,6vw,5rem)` hero, `clamp(1.7rem,3vw,2.6rem)` h2, body `1.1rem` lh `1.82`. Sentence case body, ALL CAPS only on `.s-eye`/`.h-eye`/`.et-eye` (0.18–0.22em tracking).
3. **Radii — one system.** `2px` surfaces/cards/inputs/details, `999px` pills/buttons only. Never `4px/8px/12px/2xl`.
4. **Header — fixed glass, 58px.** `header{height:58px;padding:0 clamp(20px,5vw,72px);backdrop-filter:blur(12px);border-bottom:1px solid var(--border)}` (`templates/cciaf.css:88-95`). Brand `.brand em{color:var(--gold)}` 15px 0.20em uppercase.
5. **Section rhythm (primitive, not semantics).** `.sec{padding:clamp(70px,9vw,120px) clamp(20px,8vw,120px)}` → `.s-eye 12px 0.22em gold` → `.s-h2` → `.prose max 60ch lh1.82`. `.div 1px var(--border)` between sections. Contrast `#gap` (any section may be contrast by adding `id` + `background:var(--cs-bg)`; it inverts dark↔light on theme switch).
6. **Grids — border dividers, not gaps (optional utilities).** `.layers:repeat(5,1fr)` (`templates/cciaf.css:313-354`), `.tg:1fr 1fr` (`358-373`), `.eg:repeat(3,1fr)` (`376-423`), `.f-grid:1.4fr 1fr 1fr` (`621-626`). `1px solid var(--border)` outer + `border-right` between cols, `:last-child{border-right:none}`, hover `var(--bg-alt)`. Use only when source data shape matches; otherwise omit.
7. **Breakpoints — no new values.** 900px (layers 2-up), 800px (tiers stack), 760px (footer stack), 720px (hide dot rail, show hamburger), 620px (traditions stack), 540px (layers single col).
8. **Motion — calm only.** `ease cubic-bezier(0.22,1,0.36,1)` or `ease`. Durations `0.2s` hover, `0.35s` toggle, `0.4s` theme cross-fade, `0.7s` reveal. Hero staggered `fu` entrance `0.15s→0.9s` (`templates/cciaf.css:257-260`). Respect `prefers-reduced-motion`.
9. **Reveal & scroll.** `.r{opacity:0;transform:translateY(22px)}` → `.r.on` via IntersectionObserver threshold `0.06` with 55ms stagger (`templates/cciaf.js:65-74`). Scroll-top `.st.on` at `scrollY>500`. Dot rail `updateDots` uses `mid=innerHeight*.38` (`templates/cciaf.js:52-62`), clicked dot `scrollIntoView({behavior:'smooth'})`.
10. **Forms — square.** `input,textarea{border-radius:0;border:1px solid var(--border);padding:12px 15px}` focus `border-color:var(--gold-mid);box-shadow:0 0 0 3px rgba(139,101,16,.10)` (`templates/cciaf.css:460-484`). Button `.cf-btn{background:var(--gold)}` hover `var(--gold-mid)`.
11. **Accessibility skeleton (preserve).** `header nav[aria-label]` `mobMenu[aria-label]` `sn[role=navigation]` `section[aria-labelledby]` `sn-d[role=button tabindex0 aria-label]` `hero-h1 id`. Focus `outline:2px solid var(--gold);outline-offset:3px` (`templates/cciaf.css:77-78`).
12. **Theme — data-attr, not media query.** `<html data-theme="light">` toggled via `#tog[role=switch]` storing `localStorage:cciaf-theme` (`templates/cciaf.js:5-14`). Never `prefers-color-scheme` auto.

## Layout primitive catalog — optional utilities (use only when source shape fits)

All primitives share the same tokens/borders/hover/radii intent; none are mandatory.

| Primitive | CSS | When to use | Source → markup |
|---|---|---|---|
| `.sec` + `.s-eye` + `.s-h2` + `.prose` | `templates/cciaf.css:254-287` | Every scraped heading gets this; body paras become `.prose p` | heading verbatim → `.s-eye`/`.s-h2`; paras → `.prose` |
| `.gap-q` blockquote | `templates/cciaf.css:288-310` | Only if source has a pull-quote/sentence that stands as a quote | source sentence → `.gap-q p` (keeps `2px solid var(--cs-gold)` left border) |
| `.layers` 5-col | `templates/cciaf.css:312-346` | **Only** when source has 5 homogeneous items with a shared label | item label → `.lc-n`, title → `.lc-t`, quote → `.lc-q`, desc → `.lc-s`; otherwise omit |
| `.tg` 2-col | `templates/cciaf.css:348-373` | N=2–6 items (pet projects, talks, writing groups) | title → `.tc-n`, provenance → `.tc-o`, prose → `.tc-r` |
| `.eg` 3-col | `templates/cciaf.css:367-423` | **Only** when source has 3 parallel tracks/tiers | tier label → `.et-eye`, title → `.et-n`, desc → `.et-w`, list → `.et-l li` |
| `.orn` divider | `templates/cciaf.css:512-526` | Between major movements if source has ≥4 sections | literal `· · ·` |
| `.refs-detail` collapsible | `templates/cciaf.css:534-618` | Only if source has a long reference/publication list | heading verbatim → `.refs-trad-name`, entries → `.refs-trad li` (dot gold via `::before`) |
| `#hero` | `templates/cciaf.css:198-260` | One hero derived from scrape's H1/tagline; keeps dual radial gradients `78% 35%`/`15% 75%` | top-level title → `.h-h1`, tagline → `.h-eye`, lead paras → `.h-p`, meta → `.h-note` |

If no analogue exists for a primitive, delete that block — do not retain themed CCIAF labels (e.g., "Layer I", "Tier I").

## Deriving sections from scraped hierarchy

1. Parse fetched markdown: top H1 → hero `.h-h1`; next H1 tagline → `.h-eye` or `.h-p`; H2s in order → successive `.sec` blocks preserving verbatim heading text (normalized to Sentence case per `patterns/typography.md:35`).
2. For each H2's following paras/bullets/images, emit `.prose p` (keep links intact, drop emoji). Lists of homogeneous items become one `tg`/`eg`/`layers` only if item count matches primitive; otherwise render as `.prose` or simple `<ul>` styled as `.prose`.
3. Generate `header` nav_links, `mobMenu` links, and `.sn` dots **from the derived sections** (not from starter's 7 links). `sn-d[data-t]` must equal generated `section id` (kebab of heading), `data-lbl` equals heading text.
4. No additional CCIAF section may appear (record/framework/trad/about/engage as semantics) unless the source heading lexically contains that word.

## Banned — any of these fails

- **Content leakage:** any CCIAF-specific string (`analytical layers`, `calibrated decision logic`, `single recommendation when traditions disagree`, `BaZi`, `Conflict Resolution Codex`, `Risk Awareness` unless present in source) surviving into output.
- Invented tokens, magic hex, ad-hoc spacing beyond `templates/cciaf.css` vars.
- `Inter/Roboto/system-sans`, purple gradients, mesh blobs, `rounded-2xl/3xl`, glassmorphism beyond nav.
- Emoji, lorem ipsum, stock photos, pills over images, scroll cues beyond `.st`/`.sn`.
- Changing section padding, header height, grid `gap` vs `border-right`, or removing `role/listitem` on grids.

## Stack & paths

- Tokens: `tokens/cciaf.css`
- Starter (visual ref): `templates/cciaf-starter.html` or split `templates/cciaf.css` + `templates/cciaf.js`
- Editorial rhythm: `patterns/editorial.md:14-32`; motion: `patterns/motion.md`

## Run commands

```bash
open templates/cciaf-starter.html          # byte-identical visual reference (light/dark toggle)
open design-system-reference.html           # token swatches
open preview/index.html                     # token gallery
```

## Gotchas

- `localStorage` key is `cciaf-theme` (not `minhaaj-theme`).
- `html font-size 18px` is load-bearing — all `clamp()` and `1.1rem` depend on it.
- `hero` dual radial gradients at `78% 35%` and `15% 75%` — flat backgrounds elsewhere.

Verification: `VERIFY.md` (content-origin + visual). Ship only on both passing.
