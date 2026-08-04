# CCIAF UI Kit

Recreates **cciaf.minhaaj.com** — the Cross-Civilization Intelligence and Action Framework website. A scholarly, editorial site presenting a timing intelligence methodology for high-stakes decisions.

## Design System

- **Primary fonts:** EB Garamond (body prose) + Cormorant Garamond (display / headings / eyebrows)
- **Colors:** Warm off-white `#F9F6F0`, gold `#8B6510`, near-black `#1A1510` — light + dark mode
- **Style:** Extremely editorial, scholarly, near-zero radius (`border-radius: 2px` max), grid-border layouts, contrast sections that invert on theme switch
- **Key patterns:** Section eyebrow → rule → H2 → prose, five-layer framework grid (5-col), engagement tiers (3-col grid-border)

## Files

- `index.html` — Full interactive prototype with light/dark mode toggle

## Notes

- Extracted directly from the live CCIAF site HTML
- Light/dark mode fully functional via `data-theme` attribute (persisted to `localStorage` under `minhaaj-theme`)
- Scroll reveal, scroll dots, and scroll-to-top all implemented
- Tokens match `tokens/cciaf.css` exactly
