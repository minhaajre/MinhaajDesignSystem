# VERIFY.md — CCIAF Byte-Identical Checklist

Use this before shipping any page built from the design system. Open `templates/cciaf-starter.html` and your candidate side-by-side (light + dark). Every box must pass honestly — no partial.

## 5-line rationale (why this exists)

- Philosophy: editorial journal × luxury magazine; calm precision, not spectacle.
- Tokens: `templates/cciaf.css:12-63` warm earth `#F9F6F0/#131008` + single gold `#8B6510/#C8A03A`.
- Violation allowed: none. The starter *is* the implementation; deviations are bugs.
- Refused: multiple accents, Inter/Roboto, purple gradients, rounded cards, invented breakpoints.
- Supply: `templates/cciaf-starter.html` is the contract; `tokens/cciaf.css` alone is not byte-identical.

## Visual gate — light mode

- [ ] Header is `58px`, glass `blur(12px)`, brand `CCIAF` with `<em>` gold, nav links `ink-3` → `ink-1` hover, toggle `46×26` knob gold. (`templates/cciaf.css:88-131`)
- [ ] Hero `100vh` with eyebrow `13px 0.22em gold`, `h1 clamp(2.6rem,6vw,5rem) weight 300` with `<em>` ink-3, rule `50×1.5px gold`, prose `max 58ch lh1.8`, radial gradients behind hero only.
- [ ] Sections use `.sec{clamp(70px,9vw,120px) clamp(20px,8vw,120px)}`; contrast `#gap` is dark in light mode, inverts in dark.
- [ ] Five-layer grid `repeat(5,1fr)` with `border-right` dividers, 2-up at 900px, 1-col at 540px, hover `bg-alt`. Engagement `repeat(3,1fr)` stack at 800px.
- [ ] Buttons/pills only `999px` (`templates/cciaf.css:86-98` in tokens), inputs `border-radius:0` gold focus `box-shadow 3px rgba(139,101,16,.10)`.
- [ ] Reveal: `.r` elements fade up on scroll (55ms stagger), hero has staggered `fu` keyframes. Scroll-top appears at `scrollY>500`, dot rail highlights at `innerHeight*.38`.
- [ ] Typography: Cormorant Garamond headings + EB Garamond body, sentence case, ALL CAPS only on `.s-eye/.h-eye/.lc-n/.et-eye` with 0.18–0.22em tracking. No Inter.
- [ ] No second accent color anywhere on page (check computed styles: only `--gold` `#8B6510`).

## Dark mode

- [ ] Toggle `#tog[role=switch aria-checked]` flips `<html data-theme>` and persists `localStorage:cciaf-theme`. Background `var(--bg)` cross-fades `.4s`, contrast section inverts `#gap` to `#F5F0E8`.
- [ ] Gold brightens `#C8A03A`, borders `#2E2918`, text `#F0EAD8/#C0B89E`. Inversions match `templates/cciaf.css:38-63`.

## Accessibility & behavior

- [ ] Skip not required but `header nav[aria-label]`, sections `aria-labelledby`, dots `role=button tabindex0`.
- [ ] Focus `outline:2px solid var(--gold);outline-offset:3px` on all interactive.
- [ ] Reduced motion: with `prefers-reduced-motion: reduce` in devtools, reveals are immediate, no transform jank.
- [ ] Mobile ≤720px: dot rail hidden, top-nav hidden, hamburger shown, mob menu toggles `.open` and dismisses on outside click.

## Automated lint (run locally)

```bash
# Quick grep gate — must return 0 failures
! grep -r "Inter\|Roboto\|#D97757\|rounded-2xl\|rounded-3xl\|glassmorphism" your-project/ --include="*.html" --include="*.css"
grep -q "data-theme" your-project/index.html && echo "theme attr ok"
grep -q "ccaf-theme\|cciaf-theme" your-project/index.html && echo "storage key ok"
grep -q "Cormorant Garamond" your-project/index.html && echo "fonts ok"
```

## Final step

Open two windows:
```
open templates/cciaf-starter.html
open your-project/index.html
```
Toggle theme in both. Scroll. If you can distinguish them at a glance, fix until you cannot. Sign this file's date in your PR description.
