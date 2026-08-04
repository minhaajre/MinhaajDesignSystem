# Cards

CCIAF cards share a restrained, grid-bordered editorial language. Surfaces are flat (no drop shadows on content cards) with depth coming from tone shifts and 1px borders. Radius is 2px on surfaces, 999px on pills.

## Five-Layer Framework Grid

```css
.layers {
  display: grid; grid-template-columns: repeat(5, 1fr);
  border: 1px solid var(--border); margin: 44px 0;
}
.layer-card {
  padding: 26px 20px; border-right: 1px solid var(--border);
  transition: border-color .4s, background .2s;
}
.layer-card:last-child { border-right: none; }
.layer-card:hover { background: var(--bg-alt); }
```

| Part | Font | Size | Color | Notes |
|---|---|---|---|---|
| `.layer-num` | Cormorant Garamond | 12px | `var(--gold)` | 0.18em uppercase |
| `.layer-title` | Cormorant Garamond | 1.15rem | `var(--ink-1)` | weight 400 |
| `.layer-question` | EB Garamond italic | 14px | `var(--ink-3)` | the layer's driving question |
| `.layer-sub` | EB Garamond | 13px | `var(--ink-4)` | traditions / methods |

### Responsive

- **≤900px:** `grid-template-columns: 1fr 1fr` (2-up), bottom borders between rows
- **≤540px:** single column

## Engagement Tier Cards

```css
.eg { display: grid; grid-template-columns: repeat(3, 1fr); border: 1px solid var(--border); }
.tier { padding: 30px 26px; border-right: 1px solid var(--border); }
.tier:last-child { border-right: none; }
.tier:hover { background: var(--bg-alt); }
```

| Part | Font | Size | Color |
|---|---|---|---|
| `.tier-eye` | Cormorant Garamond | 12px | `var(--gold)` — 0.20em uppercase |
| `.tier-name` | Cormorant Garamond | 1.3rem | `var(--ink-1)` |
| `.tier-desc` | EB Garamond italic | 14px | `var(--ink-3)` |
| `.tier-list li` | EB Garamond | 15px | `var(--ink-2)` — dashed bottom border |

- **≤800px:** single column

## Testimonial Card

Two-column grid (avatar + text) on a translucent glass surface.

```css
.testimonial {
  display: grid; grid-template-columns: 84px 1fr; gap: 26px; align-items: start;
  padding: 30px; border: 1px solid var(--border);
  background: rgba(255,255,255,.42); box-shadow: 0 1px 2px rgba(26,21,16,.04);
}
[data-theme="dark"] .testimonial { background: rgba(30,26,16,.72); }
```

- **Avatar:** 84px, `border-radius: 50%`, gold-light border
- **Quote:** Cormorant Garamond, `clamp(1.12rem, 1.7vw, 1.32rem)`, italic, weight 300
- **Author:** 0.78rem, uppercase, 0.14em, gold

## Book Cards (report / publications)

- **Cover:** `width: min(360px,100%)`, `aspect-ratio: 3/4`, radius 2px, soft shadow
- **Title:** `clamp(2rem, 4vw, 3.35rem)`, weight 300, lh 1.08, with `'Published Work'` gold eyebrow via `::before`
- **Actions:** column flex, gap 12px (`.btn-solid` + `.btn-outline`)

## Glass Card (general)

```css
.glass {
  background: var(--surface-soft);
  backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px);
  border: 1px solid var(--border); border-radius: 2px;
}
```

## Radii reference

| Token | Value | Use |
|---|---|---|
| `--radius-sm` | 2px | surface cards, detail boxes |
| `--radius-md` | 4px | tooltip labels |
| `--radius-full` | 999px | pills, buttons |
| `--radius-pill` | 13px | theme toggle |
