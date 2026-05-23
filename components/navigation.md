# Navigation

## Structure

### CCIAF (`--nav-h: 58px`)
```
.site-nav (fixed, z-index: 500)
├── .nav-brand (left — uppercase, gold em)
├── .nav-links (center — flex, gap: 28px)
│   ├── a.active (current page — ink-1 color)
│   └── a (other pages — ink-3 color)
└── .nav-right (right)
    ├── .theme-tog (theme switch toggle)
    └── .nav-toggle (hamburger, hidden on desktop)

.mob-menu (fixed below nav, z-index: 490)
├── a × N (stacked, bottom borders)
└── .open class toggles display
```

### Psyda (`--nav-h: 76px`)
```
.site-nav (fixed, z-index: 100)
├── .nav-brand (SVG logo 30px)
├── .nav-links (centered, flex)
└── .nav-right (hamburger on mobile)
```

---

## Glassmorphism Effect

The nav uses a translucent background with backdrop blur:
```css
.site-nav {
  background: var(--nav-bg);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border);
}
```

### CCIAF nav-bg values
- Light: `rgba(249,246,240,.95)`
- Dark: `rgba(19,16,8,.95)`

### Psyda scroll state
- Default: transparent background
- Past 40px scroll: `rgba(247,243,236,0.78)` + `backdrop-filter: blur(18px)`

---

## Typography

| Token | Brand | Size | Weight | Letter-spacing | Transform |
|---|---|---|---|---|---|
| `.nav-brand` | CCIAF | 15px | 300 | 0.20em | uppercase |
| `.nav-links a` | CCIAF | 15px | 400 | 0.04em | none |
| `.nav-brand` | Psyda | varies | — | 0.22em | uppercase |
| `.nav-links` | Psyda | 0.68rem | — | 0.22em | uppercase |

---

## States

| State | Visual |
|---|---|
| Default link | `color: var(--ink-3)` / `color: var(--text-secondary)` |
| Hover | `color: var(--ink-1)` / `color: var(--text-primary)` |
| Active page | `color: var(--ink-1)` (no underline by default) |
| Mobile hover | `background: var(--bg-alt)` |

---

## Theme Toggle (CCIAF)

Custom toggle switch with slider knob:
```css
.theme-tog {
  width: 46px; height: 26px; border-radius: 13px;
  background: var(--tog-bg);
  border: 1px solid var(--border);
  cursor: pointer; position: relative;
}
.theme-tog::after {
  content: ''; position: absolute; top: 3px; left: 3px;
  width: 18px; height: 18px; border-radius: 50%;
  background: var(--tog-knob);
  transition: transform .3s ease;
}
[data-theme="dark"] .theme-tog::after { transform: translateX(20px); }
```

- ARIA: `role="switch"`, `aria-checked`
- Theme persisted to `localStorage` under key `minhaaj-theme`

---

## Mobile Menu

- Hidden by default (`display: none`)
- Toggled via `.open` class (`display: flex`)
- Same glassmorphism backdrop blur as nav
- Dismisses on click-outside via JavaScript
- Links have `border-bottom: 1px solid var(--border)`, last item has none

---

## Responsive

| Brand | Breakpoint | Behavior |
|---|---|---|
| CCIAF | 760px | `.nav-links` hidden, `.nav-toggle` shown |
| Psyda | 720px | Hamburger menu shown |
| Psyda | <1100px | Side rail hidden |

---

## Accessibility

- `aria-controls` on mobile toggle referencing menu id
- `aria-expanded` state managed via `.open` class
- `role="switch"` + `aria-checked` on theme toggle
- Skip link before nav: `<a href="#main-content" class="skip-link">`
