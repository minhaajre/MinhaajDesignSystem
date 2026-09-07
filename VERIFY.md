# VERIFY.md — CCIAF Byte-Identical Checklist (Design + Content-Origin)

Use before shipping any page built from the design system. Open `templates/cciaf-starter.html` and your candidate side-by-side (light + dark). Every box must pass honestly — no partial. Content and design gates are independent; both must pass.

## 5-line rationale (why this exists)

- Philosophy: editorial journal × luxury magazine; calm precision, not spectacle.
- Tokens: `templates/cciaf.css:12-63` warm earth `#F9F6F0/#131008` + single gold `#8B6510/#C8A03A`.
- Violation allowed: none for design; no CCIAF content may leak into non-CCIAF builds.
- Refused: multiple accents, Inter/Roboto, purple gradients, rounded cards, invented breakpoints, and any CCIAF prose in external-data builds.
- Supply: `templates/cciaf-starter.html` is the visual reference; `AGENTS.md` content-origin rule is the content contract.

## Visual gate — light mode (all builds)

- [ ] Header is `58px`, glass `blur(12px)`, brand `<em>` gold, nav links `ink-3` → `ink-1` hover, toggle `46×26` knob gold. (`templates/cciaf.css:88-131`)
- [ ] Hero `100vh` with eyebrow `13px 0.22em gold`, `h1 clamp(2.6rem,6vw,5rem) weight 300` with `<em>` ink-3, rule `50×1.5px gold`, prose `max 58ch lh1.8`, radial gradients behind hero only.
- [ ] Sections use `.sec{clamp(70px,9vw,120px) clamp(20px,8vw,120px)}`; any contrast section `background:var(--cs-bg)` is dark in light mode, inverts in dark.
- [ ] Grids (when used) have `border:1px solid var(--border)` outer + `border-right` dividers, hover `var(--bg-alt)`, collapse at correct breakpoints (layers 900→540, `tg` 620, `eg` 800).
- [ ] Buttons/pills only `999px`, inputs `border-radius:0` gold focus `box-shadow 3px rgba(139,101,16,.10)`.
- [ ] Reveal: `.r` fade up (55ms stagger), hero staggered `fu` keyframes. Scroll-top appears at `scrollY>500`, dot rail highlights at `innerHeight*.38`.
- [ ] Typography: Cormorant Garamond headings + EB Garamond body, Sentence case body, ALL CAPS only on `.s-eye`/`.h-eye`/`.et-eye` (0.18–0.22em). No Inter.
- [ ] No second accent color anywhere (only `--gold` `#8B6510` light / `#C8A03A` dark).

## Dark mode

- [ ] Toggle `#tog[role=switch aria-checked]` flips `<html data-theme>` and persists `localStorage:cciaf-theme`. Background cross-fades `.4s`, contrast section inverts to `#F5F0E8`.
- [ ] Gold `#C8A03A`, borders `#2E2918`, text `#F0EAD8/#C0B89E`.

## Accessibility & behavior

- [ ] `header nav[aria-label]`, sections `aria-labelledby`, dots `role=button tabindex0`, `hero-h1 id`.
- [ ] Focus `outline:2px solid var(--gold);outline-offset:3px` on all interactive.
- [ ] Reduced motion: with `prefers-reduced-motion: reduce`, reveals are immediate.
- [ ] Mobile ≤720px: dot rail hidden, top-nav hidden, hamburger shown, mob menu toggles `.open` and dismisses on outside click.

## Content-origin gate (external-data builds — e.g., karpathy.ai)

Every visible heading/paragraph/list item must be traceable to the fetch payload or user-provided text. No CCIAF sentence may survive unless it lexically appears in the source.

- [ ] No CCIAF-specific strings present:
```bash
! grep -qi "analytical layers\|calibrated decision logic\|single recommendation when traditions disagree\|Conflict Resolution Codex\|Risk Awareness\|Cross-Civilization Intelligence\|BaZi Four Pillars" your-project/index.html
! grep -qi "Five traditions\|Hellenistic and Persian Tradition\|Vedic Tradition\|Islamic Tradition" your-project/index.html
# Should print nothing = pass
```
- [ ] Headings use source verbatim (Sentence-case normalized) — e.g., scrape "featured talks" → `.s-h2` contains "Featured talks", not "Architecture".
- [ ] No synthetic "Layer I / Tier I" labels unless source actually contains 5/3 items that map to that grouping; otherwise that primitive is omitted.
- [ ] No CCIAF eyebrow reuse (`The Problem`, `Precedent`, `The Architecture`, `Engagement`) unless that word appears in the scrape.
- [ ] Emoji stripped and source links preserved.

## Automated lint (run locally)

```bash
# Visual/design lint — must return 0 failures
! grep -q "font-family.*Inter" your-project/index.html
! grep -q "#D97757\|rounded-2xl\|rounded-3xl" your-project/index.html
grep -q "data-theme" your-project/index.html && echo "theme attr ok"
grep -q "cciaf-theme" your-project/index.html && echo "storage key ok"
grep -q "Cormorant Garamond" your-project/index.html && echo "fonts ok"
grep -q "html{font-size:18px" your-project/index.html && echo "root 18px ok"

# Content-origin lint (external builds)
! grep -qi "analytical layers" your-project/index.html && echo "content-origin ok"
```

## Final step

Open two windows:
```
open templates/cciaf-starter.html
open your-project/index.html
```
Toggle theme in both. Scroll. Visual difference at a glance = fail. Content leakage per above greps = fail. Pass both gates before shipping.
