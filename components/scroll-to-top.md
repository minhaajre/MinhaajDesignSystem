# Scroll to Top

A floating circular button, fixed to the bottom-right corner, that appears after the page is scrolled and returns the user to the top on click.

## Structure

```
.pt (1×1px sentinel, fixed at page y=500px, aria-hidden)
.st (fixed button, z-index: 400, 42×42px)
├── svg (18×18 chevron-up, stroke-width 1.8)
└── .on (class — visible only when the sentinel leaves the viewport)
```

Placed at the end of the body, alongside `.sn` (side navigation dots):

```html
<div class="pt" id="pt" aria-hidden="true"></div>

<button class="st" id="st" aria-label="Scroll to top">
  <svg width="18" height="18" viewBox="0 0 18 18" fill="none"
       stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
    <path d="M9 15V3M4 8l5-5 5 5"/>
  </svg>
</button>
```

## CSS

```css
.pt {
  position: absolute; top: 500px; left: 0;
  width: 1px; height: 1px; pointer-events: none;
}
.st {
  position: fixed; bottom: 28px; right: 22px; z-index: 400;
  width: 42px; height: 42px; border-radius: 50%;
  background: var(--surface); border: 1px solid var(--border);
  display: flex; align-items: center; justify-content: center;
  cursor: pointer; box-shadow: var(--shadow);
  opacity: 0; pointer-events: none;
  transition: opacity .3s, background .2s, border-color .4s;
}
.st.on { opacity: 1; pointer-events: all; }
.st:hover { background: var(--bg-alt); }
.st svg { stroke: var(--ink-3); transition: stroke .2s; }
.st:hover svg { stroke: var(--gold); }
```

| Token | Role |
|---|---|
| `--surface` | Button background |
| `--border` | 1px ring |
| `--shadow` | Elevation (`box-shadow: 0 6px 24px rgba(0,0,0,.08)`) |
| `--bg-alt` | Hover background |
| `--ink-3` → `--gold` | Icon stroke, default → hover |

## Behavior

```js
const st = document.getElementById('st');
new IntersectionObserver(([e]) =>
  st.classList.toggle('on', !e.isIntersecting), {threshold:0})
  .observe(document.getElementById('pt'));
st.addEventListener('click', () => window.scrollTo({top:0, behavior:'smooth'}));
```

- Threshold: the 1×1px sentinel sits at **page y = 500px**; the button appears the moment the sentinel scrolls out of view (i.e., `scrollY > 500`)
- Reveal: opacity fade, `pointer-events` restored on `.on`
- Scroll: smooth, honors `scroll-behavior: smooth` on `<html>`
- z-index **400** — sits below the fixed nav (500), above content
- No `scroll` listeners — visibility is observer-driven (sentinel + `IntersectionObserver`), which the design system's taste rules require

## States

| State | Visual |
|---|---|
| Hidden (sentinel in view) | `opacity: 0`, `pointer-events: none` |
| Visible (`scrollY > 500`) | `.on` — full opacity, interactive |
| Hover | `background: var(--bg-alt)`, icon `stroke: var(--gold)` |

## Accessibility

- `aria-label="Scroll to top"` on the button
- Visible only via `.on` class — never removed from the DOM
- Focusable only when `.on` is applied (consistent with `pointer-events`)
- Theme transitions applied via the shared `border-color .4s` token pattern
