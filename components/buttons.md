# Buttons

## CCIAF — Pill Buttons

Two base variants plus a book-row variant. All share pill shape and heading font.

### Shared base
```css
.btn-outline,
.btn-solid,
.book-row-btn {
  display: inline-flex; align-items: center; justify-content: center;
  min-height: 42px;
  padding: 10px 26px;
  border: 1px solid var(--gold-light);
  border-radius: 999px;
  font-family: var(--font-heading);
  font-size: .78rem; letter-spacing: .14em;
  line-height: 1.2; text-transform: uppercase;
  text-align: center; cursor: pointer;
  transition: color .2s, background .2s, border-color .2s, transform .2s;
}
```

### Variants

| Class | Default bg | Default text | Default border | Hover bg | Hover text | Hover transform |
|---|---|---|---|---|---|---|
| `.btn-outline` | Transparent | `var(--gold)` | `var(--gold-light)` | `var(--ink-1)` | `var(--bg)` | translateY(-1px) |
| `.btn-solid` | `var(--ink-1)` | `var(--bg)` | `var(--ink-1)` | `var(--gold)` | `var(--bg)` | translateY(-1px) |
| `.book-row-btn` | Transparent | `var(--gold)` | `var(--gold-light)` | `var(--ink-1)` | `var(--bg)` | translateY(-1px) |

### Notes
- All variants use `border-radius: 999px` (fully pill-shaped)
- Color transition: 0.2s
- Transform transition: 0.2s
- Uppercase text, 0.14em letter-spacing
- Font: Cormorant Garamond (CCIAF) or DM Sans (Psyda)

---

## Psyda — Fill-Sweep Buttons

Psyda uses a distinctive fill-sweep button with square edges (zero border-radius):

```css
.btn {
  display: inline-flex; align-items: center; gap: 0.9rem;
  padding: 1rem 1.8rem;
  font-family: var(--font-ui); font-size: var(--text-label); font-weight: 400;
  letter-spacing: var(--ls-label); text-transform: uppercase;
  color: var(--text-primary);
  border: 1px solid var(--text-primary); background: transparent;
  position: relative; overflow: hidden; cursor: pointer;
  transition: color var(--dur-base) var(--ease-out);
}
.btn::before {
  content: ''; position: absolute; inset: 0;
  background: var(--text-primary);
  transform: translateY(101%);
  transition: transform 0.45s var(--ease-out);
  z-index: -1;
}
.btn:hover { color: var(--white); }
.btn:hover::before { transform: translateY(0); }
```

### Fill-Sweep Animation
- On hover, a background layer sweeps up from the bottom (`translateY(101%)` → `translateY(0)`)
- Text color flips from `--text-primary` to `--white`
- Arrow glyph (SVG inline) shifts 4px right simultaneously

---

## Button Content Patterns

### CTAs
- Minimal text + arrow/directional cue
- `Our LinkedIn →`
- `Explore research →`
- `Read more →`
- `Buy on Amazon`
- `← Back`

### Buy / Action buttons
- On book details, `.btn-solid` + `.btn-outline` used in `.book-detail-actions`
- Display: `flex; flex-direction: column; gap: 12px`

---

## Accessibility

- `cursor: pointer` on all button elements
- Focus-visible outlines: `outline: 2px solid var(--gold); outline-offset: 3px`
- Color contrast checked on all states (hover text meets AA on filled backgrounds)
