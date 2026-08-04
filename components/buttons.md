# Buttons

CCIAF uses a single button shape — the **pill** (`border-radius: 999px`) — in two variants. Both use Cormorant Garamond, uppercase text with 0.14em tracking.

## Shared base

```css
.btn-outline,
.btn-solid {
  display: inline-flex; align-items: center; justify-content: center;
  min-height: 42px; padding: 10px 26px;
  border: 1px solid var(--gold-light);
  border-radius: 999px;
  font-family: var(--font-heading);
  font-size: .78rem; letter-spacing: .14em;
  line-height: 1.2; text-transform: uppercase;
  text-align: center; cursor: pointer;
  transition: color .2s, background .2s, border-color .2s, transform .2s;
}
```

## Variants

| Class | Default bg | Default text | Default border | Hover bg | Hover text | Hover transform |
|---|---|---|---|---|---|---|
| `.btn-outline` | Transparent | `var(--gold)` | `var(--gold-light)` | `var(--ink-1)` | `var(--bg)` | translateY(-1px) |
| `.btn-solid` | `var(--ink-1)` | `var(--bg)` | `var(--ink-1)` | `var(--gold)` | `var(--bg)` | translateY(-1px) |

## Notes

- All variants use `border-radius: 999px` (fully pill-shaped)
- Color transition: 0.2s; transform transition: 0.2s
- Uppercase text, 0.14em letter-spacing
- Font: Cormorant Garamond (display)
- The contact-form submit button (`.cf-btn`) is a solid gold variant: `background: var(--gold); color: var(--surface); border: 1px solid var(--gold)` → hover `var(--gold-mid)`

## CTA content patterns

- Minimal text + directional cue
  - `Our LinkedIn →`
  - `Explore research →`
  - `Read more →`
  - `← Back`
- Buy / action buttons use `.btn-solid` + `.btn-outline` stacked (`flex; flex-direction: column; gap: 12px`)

## Accessibility

- `cursor: pointer` on all button elements
- Focus-visible outlines: `outline: 2px solid var(--gold); outline-offset: 3px`
- Hover text meets AA on filled backgrounds (`--ink-1` on `--bg`, `--gold` on `--bg`)
