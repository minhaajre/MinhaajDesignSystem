# Changelog

All notable changes to the CCIAF Design System.

## [2.1.0] — 2026-08-05

**Integrated the anti-slop orchestration layer (`design-system/`).**

### Added
- `design-system/` — the anti-slop agent stack: council `CLAUDE.md`, CCIAF-populated `DESIGN.md` and `PRODUCT.md`, base tokens, skills (Anthropic frontend-design), setup script, CI workflow.
- Root `CLAUDE.md` — loads the council, documents CCIAF overrides to the anti-slop bans (em dashes, side-nav dots, cream+gold brand tell).
- `components/scroll-to-top.md` + `components/side-navigation.md` — specs for the two floating scroll fixtures.
- `preview/components-scroll.html` — live preview page, linked from the gallery.
- `frontend-design` skill installed into `~/.agents/skills/`.

### Changed
- Scroll-to-top and side-nav dots migrated from `window.addEventListener('scroll')` to `IntersectionObserver` (top sentinel at y=500px; 0–38% viewport band for active dot tracking) in `ui_kits/cciaf/index.html`, the previews, and both component specs.

## [2.0.0] — 2026-08-05

**Rebuilt as a CCIAF-only design system.**

The repository previously bundled four brands (Psyda, Minhaaj.com, CCIAF, IbnArbi). It has been rebuilt to cover **CCIAF** exclusively, derived from the production CCIAF source (`cciaf.minhaaj.com/index.html` and the `cciaf-report-engine` report stylesheet) so tokens, components, and patterns match the live site exactly.

### Added
- Comprehensive `tokens/cciaf.css` — full light/dark token set with contrast-section inversion, report/semantic aliases (layer badges, confidence grades, callouts, code), typography ladder, spacing scale, layout tokens, radii, shadows, easing, and CCIAF utility classes (`.eye`, `.h1`, `.h2`, `.prose`, `.blockquote`, `.rule`, `.layers`, `.tier`, `.btn-*`, `.section-contrast`, `.fade-up`).
- Component specs rebuilt for CCIAF: `navigation`, `buttons`, `hero`, `cards`, `forms`, `footer`.
- Pattern docs rebuilt for CCIAF: `typography`, `color`, `spacing`, `motion`, `editorial`, `branding`.
- CCIAF-only token previews: `preview/index.html` gallery plus `colors-cciaf`, `type-cciaf`, `spacing-tokens`, `shadows-radii`, `components-cciaf`, `components-buttons`, `components-cards`, `components-forms`, `components-nav`.
- `assets/imagery/` populated with authentic CCIAF assets (`founder.jpeg`, `timing-activation-windows.svg`) copied from the report engine.
- `download-fonts.sh` rewritten to fetch only CCIAF fonts (Cormorant Garamond + EB Garamond).
- `design-system-reference.html` rewritten as a CCIAF-only single-page reference.

### Removed
- All Psyda, Minhaaj.com, and IbnArbi brand material: `tokens/psyda.css`, `tokens/ibnarbi.css`, `ui_kits/psyda`, `ui_kits/minhaaj`, `ui_kits/ibnarbi`.
- Psyda logos and editorial imagery from `assets/`.
- Non-CCIAF fonts (DM Sans, Inter, Lora, Source Sans 3, Amiri) from `fonts/`.
- Multi-brand preview files (brand logos, Islamic icons, moodboard, cross-brand color/type/spacing previews).

## [1.0.0] — 2026-05-24

Initial multi-brand snapshot: Psyda / Minhaaj.com / CCIAF / IbnArbi with shared token, component, pattern, and UI-kit hierarchy.

## [0.1.0] — 2026-05-10

Original snapshot from live codebases.
