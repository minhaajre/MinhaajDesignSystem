# Side Navigation

A fixed rail of scroll dots on the right edge of the viewport — one dot per page section. The active section is highlighted as the user scrolls; clicking a dot smooth-scrolls to that section, and hovering shows a label tooltip.

## Structure

```
.sn (fixed rail, right: 20px, vertically centered, z-index: 400)
└── .sn-d × N (8×8px dots, gap: 12px)
    ├── data-t    → target section id
    ├── data-lbl  → tooltip label
    ├── .on       → active section
    └── ::before  → tooltip (hover)
```

```html
<div class="sn">
  <div class="sn-d" data-t="hero"      data-lbl="Introduction"></div>
  <div class="sn-d" data-t="framework" data-lbl="The Framework"></div>
  <div class="sn-d" data-t="about"     data-lbl="About"></div>
</div>
```

## CSS

```css
.sn {
  position: fixed; right: 20px; top: 50%; transform: translateY(-50%); z-index: 400;
  display: flex; flex-direction: column; gap: 12px;
}
.sn-d {
  width: 8px; height: 8px; border-radius: 50%;
  background: var(--border); cursor: pointer; position: relative;
  transition: background .25s, transform .25s;
}
.sn-d:hover, .sn-d.on { background: var(--gold); }
.sn-d.on { transform: scale(1.35); }
.sn-d::before {
  content: attr(data-lbl); position: absolute; right: 18px; top: 50%;
  transform: translateY(-50%);
  font-family: var(--font-body); font-size: 13px; color: var(--ink-3);
  white-space: nowrap; background: var(--surface); border: 1px solid var(--border);
  padding: 3px 9px; border-radius: 4px;
  opacity: 0; pointer-events: none; transition: opacity .2s;
}
.sn-d:hover::before { opacity: 1; }
```

| Token | Role |
|---|---|
| `--border` | Idle dot fill |
| `--gold` | Hover + active dot fill |
| `--surface` / `--border` | Tooltip background / ring |
| `--ink-3` | Tooltip label color |

## Behavior

```js
const secs = ['hero','framework','about'];   // page section ids, in order
const dots = document.querySelectorAll('.sn-d');
dots.forEach(d =>
  d.addEventListener('click',
    () => document.getElementById(d.dataset.t)?.scrollIntoView({behavior:'smooth'})));

const active = new Set();
const dotObs = new IntersectionObserver(entries => {
  entries.forEach(e => e.isIntersecting ? active.add(e.target.id) : active.delete(e.target.id));
  const cur = secs.filter(id => active.has(id)).pop() ?? secs[0];
  dots.forEach(d => d.classList.toggle('on', d.dataset.t === cur));
}, {rootMargin:'0px 0px -62% 0px', threshold:0});
secs.forEach(id => { const el = document.getElementById(id); if (el) dotObs.observe(el); });
```

- The observer's root band is **0–38% of viewport height** (`rootMargin: -62%` on the bottom) — a section is active when its top edge has crossed that line; the **last** intersecting section in DOM order wins, exactly like the old scroll-position check
- Click target is the section `id` (guard with `?.` — section may be absent)
- Fires immediately on observe — no initial-state call needed
- No `scroll` listeners — entirely `IntersectionObserver`-driven, which the design system's taste rules require

## States

| State | Visual |
|---|---|
| Idle | 8×8px, `background: var(--border)` |
| Hover | `background: var(--gold)` + tooltip label |
| Active (current section) | `background: var(--gold)`, `scale(1.35)` |

## Responsive

The rail persists across all breakpoints in the current implementation. On short viewports the 12px gap keeps the stack compact; omit sections or hide the rail (`display: none` under a narrow breakpoint) if a long section list overflows.

## Accessibility

- Each dot is a `div` with a `data-lbl` tooltip — use real buttons or `role="button"` + `tabindex="0"` when keyboard support is required
- Tooltips appear on hover only; never the sole identifier (sections carry their own headings)
- `aria-label` per dot (`data-lbl` content) recommended
- z-index **400** — below the fixed nav (500), matches the scroll-to-top button
