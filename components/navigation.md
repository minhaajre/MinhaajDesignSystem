# Navigation

CCIAF uses a fixed, glassmorphic top nav (58px) with a wordmark brand, centered primary links, a theme toggle, and a mobile hamburger menu.

## Structure

```
.site-nav (fixed, z-index: 500, height: 58px)
├── .brand (left — uppercase, gold em)
├── .top-nav (center — flex, gap: 28px)
│   ├── a (other pages — ink-3)
│   └── a:hover (ink-1)
└── .hdr-right (right)
    ├── .hbg (hamburger, hidden on desktop)
    └── .tog-label → .tog (theme switch)

.mob-menu (fixed below nav, z-index: 490)
└── a × N (stacked, bottom borders, toggled via .open)
```

## Glassmorphism

```css
.site-nav {
  position: fixed; top: 0; left: 0; right: 0; z-index: 500;
  height: 58px; padding: 0 clamp(20px, 5vw, 72px);
  background: var(--nav-bg);            /* rgba(249,246,240,.95) light */
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border);
  display: flex; align-items: center; justify-content: space-between; gap: 16px;
}
```

| Token | Light | Dark |
|---|---|---|
| `--nav-bg` | `rgba(249,246,240,.95)` | `rgba(19,16,8,.95)` |
| `--nav-h` | `58px` | `58px` (no mobile variant) |

## Typography

| Element | Font | Size | Weight | Letter-spacing | Transform |
|---|---|---|---|---|---|
| `.brand` | Cormorant Garamond | 15px | 300 | 0.20em | uppercase |
| `.top-nav a` | EB Garamond | 15px | 400 | 0.04em | none |

The brand wordmark renders `CCIAF` with the letters wrapped in `<em>` so the gold accent lands on the wordmark: `<a class="brand"><em>CCIAF</em></a>`.

## States

| State | Visual |
|---|---|
| Default link | `color: var(--ink-3)` |
| Hover | `color: var(--ink-1)` |
| Mobile menu link | `border-bottom: 1px solid var(--border)` |
| Mobile menu link hover | `background: var(--bg-alt); color: var(--ink-1)` |

## Theme Toggle

```css
.tog {
  width: 46px; height: 26px; border-radius: 13px;
  background: var(--tog-bg); border: 1px solid var(--border);
  cursor: pointer; position: relative;
  -webkit-appearance: none; appearance: none;
}
.tog::after {
  content: ''; position: absolute; top: 3px; left: 3px;
  width: 18px; height: 18px; border-radius: 50%;
  background: var(--tog-knob); transition: transform .3s ease;
}
[data-theme="dark"] .tog::after { transform: translateX(20px); }
```

- ARIA: `role="switch"`, `aria-checked`
- Theme persisted to `localStorage` under key `minhaaj-theme`
- Defaults to system `prefers-color-scheme`

## Mobile Menu

- Hidden by default (`display: none`), toggled via `.open` (`display: flex`)
- Same glassmorphism backdrop as nav
- Dismisses on click-outside
- Links carry `border-bottom: 1px solid var(--border)`, last item none

## Responsive

| Breakpoint | Behavior |
|---|---|
| 760px | `.top-nav` hidden, `.hbg` shown, mobile menu active |

## Accessibility

- `skip-link` before nav: `<a href="#main" class="skip-link">Skip to content</a>`
- `aria-controls` on hamburger referencing menu id
- `aria-expanded` managed via `.open`
- `role="switch"` + `aria-checked` on theme toggle
- `focus-visible` outline: `2px solid var(--gold); outline-offset: 3px`
