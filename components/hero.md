# Hero

The CCIAF hero is a full-viewport section with a staggered fade-up entrance, an eyebrow, a large display headline (with an italic em emphasis), a 50px gold rule, lead prose, and a contemplative italic note. Atmospheric gold radial gradients sit behind the text (decorative only).

## Layout

```css
#hero {
  min-height: 100vh;
  padding: calc(58px + clamp(40px, 8vw, 80px)) clamp(20px, 8vw, 120px) clamp(60px, 8vw, 100px);
  position: relative; overflow: hidden;
  background: var(--bg);
}
#hero::before {
  content: ''; position: absolute; inset: 0; pointer-events: none;
  background:
    radial-gradient(ellipse 60% 50% at 78% 35%, rgba(184,146,42,.07) 0%, transparent 65%),
    radial-gradient(ellipse 35% 60% at 15% 75%, rgba(139,101,16,.04) 0%, transparent 60%);
}
```

## Staggered entry

Each hero child fades up with `animation: fu .8s ease <delay> forwards` (opacity 0 → 1, translateY 16px → 0):

| Element | Delay | Duration |
|---|---|---|
| `.h-eye` | 0.15s | 0.8s |
| `.h-h1` | 0.3s | 0.9s |
| `.h-rule` | 0.5s | 0.8s |
| `.h-p` (first) | 0.6s | 0.8s |
| `.h-p` (second) | 0.72s | 0.8s |
| `.h-note` | 0.9s | 0.8s |

## Typography

| Element | Size | Weight | Color | Spacing |
|---|---|---|---|---|
| `.h-eye` | 13px | 300 | `var(--gold)` | 0.22em uppercase |
| `.h-h1` | `clamp(2.6rem, 6vw, 5rem)` | 300 | `var(--ink-1)` | -0.01em, lh 1.08 |
| `.h-h1 em` | — | italic | `var(--ink-3)` | — |
| `.h-rule` | 50px × 1.5px | — | `var(--gold)` | — |
| `.h-p` | `clamp(1rem, 1.8vw, 1.2rem)` | 400 | `var(--ink-2)` | lh 1.8, max 58ch |
| `.h-note` | 14px italic | — | `var(--ink-4)` | Cormorant Garamond |

```css
@keyframes fu {
  from { opacity: 0; transform: translateY(16px); }
  to   { opacity: 1; transform: none; }
}
```

If `prefers-reduced-motion: reduce`, the entrance animation is disabled and all elements render visible immediately.

## Responsive

- Horizontal padding `clamp(20px, 8vw, 120px)` tightens naturally on mobile
- Headline scales fluidly via `clamp()` — no layout breakpoint required
