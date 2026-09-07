# AGENTS.md — MinhaajDesignSystem (CCIAF Byte-Identical Contract)

This is a **byte-identical replication system**. Any page built by pointing to this repo must render indistinguishable from `https://cciaf.minhaaj.com` without iterative debugging. Copy, don't invent.

## Canonical source — read first, always

**Single source of truth:** `templates/cciaf-starter.html` (1380 lines, exact copy of live site 2026-09-07). It contains the production HTML structure, all CSS (tokens + layout), and all JS in one file.

- `templates/cciaf.css` — extracted `<style>` from starter (638 lines). Use when you need separate CSS import.
- `templates/cciaf.js` — extracted `<script>` (142 lines). Use when you need separate JS.
- `tokens/cciaf.css:16-392` — CSS custom properties (light/dark). Starter already inlines these; import `tokens/cciaf.css` only for framework builds that split CSS.

**Mandatory read order for every task:** `templates/cciaf-starter.html` → `tokens/cciaf.css` → `components/*.md` + `patterns/*.md` (only if you must extend, never to override).

## How to use

### Plain HTML (zero-config, byte-identical)
```bash
cp templates/cciaf-starter.html your-project/index.html
# Replace text content only. Keep every class, id, wrapper, and data-attr.
```

### Framework (Next/React/Vue)
```js
import 'MinhaajDesignSystem/tokens/cciaf.css'
import 'MinhaajDesignSystem/templates/cciaf.css'
import 'MinhaajDesignSystem/templates/cciaf.js' // or copy script inline before </body>
```
Preserve `html {font-size:18px}` at root. Set `<html data-theme="light">` (persist key `cciaf-theme`).

## Non-negotiables — 12 rules that make it CCIAF

Every violation is a bug. No exceptions, no "close enough."

1. **Palette — one gold accent only.** Light `--bg:#F9F6F0` `--ink-1:#1A1510` `--ink-2:#3D3830` `--gold:#8B6510`; Dark `--bg:#131008` `--ink-1:#F0EAD8` `--gold:#C8A03A` (`templates/cciaf.css:12-63`). No second hue, no purple/blue gradient, no `#D97757` terracotta.
2. **Typography — two fonts, all-serif.** `Cormorant Garamond 300/400/500+italic` (display/heading/eyebrow) + `EB Garamond 400/500/600+italic` (body). Import via `templates/cciaf.css:9`. Root `18px`. `clamp(2.6rem,6vw,5rem)` hero, `clamp(1.7rem,3vw,2.6rem)` h2, body `1.1rem` lh `1.82`. Sentence case body, ALL CAPS spaced labels only.
3. **Radii — one system.** `--radius-sm:2px` surfaces/cards/inputs/details, `999px` pills/buttons only. Never `4px/8px/12px/2xl` on cards.
4. **Header — fixed glass, 58px.** `header{height:58px;padding:0 clamp(20px,5vw,72px);backdrop-filter:blur(12px);border-bottom:1px solid var(--border)}` (`templates/cciaf.css:88-95`). Brand `.brand em{color:var(--gold)}` 15px 0.20em uppercase.
5. **Section rhythm.** `.sec{padding:clamp(70px,9vw,120px) clamp(20px,8vw,120px)}` `.s-eye 12px 0.22em gold` → `.s-h2` → `.prose max 60ch lh1.82`. `.div 1px var(--border)` between sections. Contrast `#gap{background:var(--cs-bg)}` inverts dark↔light on theme switch.
6. **Grids — border dividers, not gaps.** `.layers:repeat(5,1fr)` (`templates/cciaf.css:313-354`), `.tg:1fr 1fr` (`358-373`), `.eg:repeat(3,1fr)` (`376-423`), `.f-grid:1.4fr 1fr 1fr` (`621-626`). `1px solid var(--border)` outer + `border-right` between cols, `:last-child{border-right:none}`, hover `var(--bg-alt)`.
7. **Breakpoints — no new values.** 900px (layers 2-up), 800px (tiers stack), 760px (footer stack), 720px (hide dot rail, show hamburger), 620px (traditions stack), 540px (layers single col).
8. **Motion — calm only.** `ease cubic-bezier(0.22,1,0.36,1)` or `ease`. Durations `0.2s` hover, `0.35s` toggle, `0.4s` theme cross-fade, `0.7s` reveal. Hero staggered `fu` entrance `0.15s→0.9s` (`templates/cciaf.css:257-260`). Respect `prefers-reduced-motion`.
9. **Reveal & scroll.** `.r{opacity:0;transform:translateY(22px)}` → `.r.on` via IntersectionObserver threshold `0.06` with 55ms stagger (`templates/cciaf.js:65-74`). Scroll-top `.st.on` at `scrollY>500`. Dot rail `updateDots` uses `mid=innerHeight*.38` on scroll (`templates/cciaf.js:52-62`), clicked dot `scrollIntoView({behavior:'smooth'})`.
10. **Forms — square.** `input,textarea{border-radius:0;border:1px solid var(--border);padding:12px 15px}` focus `border-color:var(--gold-mid);box-shadow:0 0 0 3px rgba(139,101,16,.10)` (`templates/cciaf.css:460-484`). Button `.cf-btn{background:var(--gold);border:1px solid var(--gold)}` hover `var(--gold-mid)`.
11. **Accessibility skeleton (keep verbatim).** `skip` not needed (aria labels suffice in starter): `header nav[aria-label]` `mobMenu[aria-label]` `sn[role=navigation]` `section[aria-labelledby]` `sn-d[role=button tabindex0 aria-label]` `hero-h1 id`. Focus `outline:2px solid var(--gold);outline-offset:3px` (`templates/cciaf.css:77-78`).
12. **Theme — data-attr, not media query.** `<html data-theme="light">` toggled via `#tog[role=switch]` storing `localStorage:cciaf-theme` (`templates/cciaf.js:5-14`). Never `prefers-color-scheme` auto without explicit opt-in.

## Page assembly — copy this skeleton

From `templates/cciaf-starter.html:652-1380`:

```
<html data-theme="light">
<header> .brand + .top-nav + .hdr-right(.hbg + .tog) </header>
<nav#mobMenu.mob-menu> 7 links with onclick="cm()" </nav>
<div.sn> 8 × .sn-d[data-t][data-lbl] </div>
<button.st#st> → </button>
<section#hero> .h-eye + .h-h1 + .h-rule + .h-p×2 + .h-note </section>
<div.div>
<section#gap.sec> .s-eye.r + .s-h2.r + .prose.r× + .gap-q </section>
<div.div>
<section#record.sec> .s-eye.r + .s-h2.r + .prose.r </section>
<div.div>
<section#framework.sec> .s-eye.r + .s-h2.r + .prose.r + .layers.r(5×.lc) + .prose.r </section>
<section#trad.sec> .s-eye.r + .s-h2.r + .prose.r + .tg(.tc×5) </section>
<div.orn.r>· · ·
<section#about.sec> .s-eye.r + .s-h2.r + .prose.r </section>
<div.div>
<section#engage.sec> .s-eye.r + .s-h2.r + .prose.r + .eg(3×.et) </section>
<section#contact.sec> .ct-eye.r + .s-h2.r + .ct-p.r + #ct-form-wrap(.ct-form) + #ct-success + .ct-note.r </section>
<section#references.refs> .refs-h + .refs-h2 + details.refs-detail(summary.refs-summary + .refs-body) </section>
<footer> .f-grid(3 cols) + .f-bottom + .f-disc OR legacy footer </footer>
<script> templates/cciaf.js inline before </body>
```

Replace content inside `.h-h1`, `.h-p`, `.prose p`, `.lc-t/.lc-q/.lc-s`, `.tc-n/.tc-o/.tc-r`, `.et-*`, etc. Never rename those classes or remove the wrapper.

## Banned — any of these fails byte-identical

- Invented tokens, magic hex, or ad-hoc spacing beyond `templates/cciaf.css` vars.
- `Inter/Roboto/system-sans`, purple gradients, mesh blobs, `rounded-2xl/3xl`, glassmorphism beyond the nav.
- Three-equal-card feature rows without hairline rules, centered-everything layouts, `window.addEventListener('scroll')` for reveal (reveal must be IntersectionObserver).
- Emoji, lorem ipsum, stock photos, pills over images, scroll cues beyond `.st`/`.sn`.
- Changing `section` padding, `header` height, grid `gap` vs `border-right`, or removing `role/listitem` on `.layers/.eg`.

## Stack & paths

- Tokens: `tokens/cciaf.css`
- Starter: `templates/cciaf-starter.html` (single file) or split `templates/cciaf.css` + `templates/cciaf.js`
- Components: `components/navigation.md:24-33` etc — reference only, don't re-implement from them alone
- Patterns: `patterns/editorial.md`, `patterns/motion.md` — rhythm/behavior supplements
- Design docs: `design-system/DESIGN.md`, `design-system/PRODUCT.md`

## Run commands

```bash
open templates/cciaf-starter.html          # byte-identical reference (light/dark toggle)
open design-system-reference.html           # token swatches
open preview/index.html                     # token gallery
```

## Gotchas

- `localStorage` key is `cciaf-theme` (not `minhaaj-theme`). Migrating from `tokens/cciaf.css` alone misses this — use starter key.
- Fonts load via Google Fonts `@import` in CSS; no self-host needed unless offline — then `./download-fonts.sh`.
- `html font-size 18px` is load-bearing — all `clamp()` and `1.1rem` body depends on it.
- `hero` uses dual radial gradients at `78% 35%` and `15% 75%` — flat backgrounds elsewhere. Don't spread gradients.

Verification: `VERIFY.md` (next to this file) contains the 5-line rationale + visual checklist. Open starter and candidate side-by-side, run checklist, ship only on pass.
