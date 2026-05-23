# IbnArbi UI Kit

Recreates **ibnarbi.minhaaj.com** — an Islamic lunar mansion cosmology app built with React 19 + Vite + Tailwind + shadcn/ui.

## Design System
- Fonts: Lora (serif headers), Source Sans 3 (UI), Amiri (Arabic/RTL)
- Colors: Warm parchment (light) / Deep navy (dark), gold-brown primary
- Style: Glass cards with backdrop-blur, rounded corners (12–16px), shadcn/ui components
- Features: Light/dark mode, Arabic RTL text, Lucide icons + custom Islamic icon set

## Files
- `index.html` — Full interactive prototype (home page with sections)
- `SectionCard.jsx` — Glass card chrome shared by all sections
- `MansionCard.jsx` — Lunar mansion display card
- `Footer.jsx` — Disclaimer + links

## Notes
- Dark mode is the primary/intended experience
- Arabic text requires `font-family: Amiri` and `direction: rtl`
- This kit approximates the shadcn/ui glass-card aesthetic; actual app uses Tailwind utilities
