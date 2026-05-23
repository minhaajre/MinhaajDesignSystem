# Hero

## CCIAF Hero

Full-viewport height hero with two-column grid, atmospheric lighting, staggered reveal animations, and offset photo frame.

### Layout
```css
.hero {
  min-height: 100vh;
  padding: calc(var(--nav-h) + clamp(40px, 8vw, 80px)) clamp(20px, 8vw, 120px) clamp(60px, 8vw, 100px);
  position: relative; overflow: hidden;
}

.hero-inner {
  display: grid;
  grid-template-columns: minmax(0, 1.03fr) minmax(300px, .72fr);
  gap: clamp(42px, 7vw, 92px);
  align-items: start;
}
```

### Atmospheric Lighting
Subtle gold-tinted radial gradients behind text (purely decorative, no content impact):
```css
.hero::before {
  content: ''; position: absolute; inset: 0; pointer-events: none;
  background:
    radial-gradient(ellipse 60% 50% at 78% 35%, rgba(184,146,42,.07) 0%, transparent 65%),
    radial-gradient(ellipse 35% 60% at 15% 75%, rgba(139,101,16,.04) 0%, transparent 60%);
}
```

### Staggered Entry Animation
Each hero child element fades up with a staggered delay:

| Element | Delay | Duration |
|---|---|---|
| `.hero-eye` | 0.15s | 0.8s |
| `.hero-title` | 0.3s | 0.9s |
| `.hero-photo` | 0.35s | 0.8s |
| `.hero-rule` | 0.5s | 0.8s |
| `.hero-body` (first) | 0.6s | 0.8s |
| `.hero-body` (second) | 0.72s | 0.8s |
| `.hero-note` | 0.9s | 0.8s |

### Typography

| Element | Size | Weight | Color | Spacing |
|---|---|---|---|---|
| `.hero-eye` | 13px | 300 | `--gold` | 0.22em uppercase |
| `.hero-title` | `clamp(2.6rem, 6vw, 5rem)` | 300 | `--ink-1` | -0.01em, lh 1.08 |
| `.hero-rule` | 50px × 1.5px | — | `--gold` | — |
| `.hero-body` | `clamp(1rem, 1.8vw, 1.2rem)` | 400 | `--ink-2` | lh 1.8, max 58ch |
| `.hero-note` | 14px italic | — | `--ink-4` | Cormorant Garamond |

### Photo
- Position: right column, `padding-top: 38px`
- Size: `width: min(400px, 100%)`, `aspect-ratio: 4/5`
- Object-position: `50% 12%` (top-aligned portrait)
- Border: `1px solid rgba(26,21,16,.12)`
- Shadow: `--shadow-strong` (0 24px 70px)
- Radius: 2px

### Photo Frame
Offset decorative border trick:
```
.hero-photo-frame::after
  width: min(400px, 72%)
  aspect-ratio: 4/5
  transform: translate(16px, 16px)
  border: 1px solid var(--gold-light)
  z-index: -1
```

### Responsive
- **≤980px:** Single-column grid, photo moves to top (order: -1)
- **≤760px:** Padding reduced to 24px, bottom padding reduced to 58px

---

## Psyda Hero

Three-pillar scroll-linked hero (Analytics / Research / Media) with:
- Pillar indicator dots on side rail
- Full-bleed SVG art backgrounds (not photos)
- Word-reveal animation on headline
- Chapter grid layout below fold

### Hero Content
```css
.hero-headline {
  font-size: var(--text-hero);  /* clamp(3.4rem, 8.5vw, 7.5rem) */
  font-weight: 300; line-height: var(--lh-tight);  /* 0.95 */
  letter-spacing: var(--ls-heading);  /* -0.015em */
  max-width: 1000px;
}
```

### Side Rail
Fixed right column with vertical section dots:
- 6px dots, `border: 1px solid var(--accent)`
- Filled on active section
- Hidden on mobile
