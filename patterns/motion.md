# Motion

CCIAF motion is restrained and purposeful. Nothing bounces, spins, or shouts. Every motion is tied to meaning (reveal, hover, theme transition) and is fully killable under `prefers-reduced-motion`.

## Principles

- **Calm:** transitions are short (0.2–0.4s) with a soft ease-out
- **Reveal, don't distract:** content fades up on scroll into view
- **Theme transition:** background and text color cross-fade over 0.4s
- **Reduced motion respected:** all animation disabled when requested

## Durations & easing

| Token | Value | Use |
|---|---|---|
| `--dur-fast` | 0.2s | hover color/border |
| `--dur-base` | 0.35s | toggle, general UI |
| `--dur-slow` | 0.4s | theme background/color cross-fade |
| `--dur-reveal` | 0.7s | scroll reveal |
| `--ease-out` | `cubic-bezier(0.22, 1, 0.36, 1)` | all easing |

## Scroll reveal

```css
.fade-up { opacity: 0; transform: translateY(22px); transition: opacity .7s ease, transform .7s ease; }
.fade-up.visible { opacity: 1; transform: none; }
```

Elements gain `.visible` via an IntersectionObserver when they enter the viewport. Hero elements instead use a one-time staggered `fu` keyframe entrance (see [hero.md](./../components/hero.md)).

```css
@keyframes fu {
  from { opacity: 0; transform: translateY(16px); }
  to   { opacity: 1; transform: none; }
}
```

## Theme cross-fade

`body`, `header`, and section wrappers all carry `transition: background .4s, color .4s, border-color .4s` so switching `data-theme` on `<html>` animates smoothly.

## Hover micro-interactions

| Element | Transition | Effect |
|---|---|---|
| Nav link | `color .2s` | ink-3 → ink-1 |
| Layer / tier card | `background .2s` | → `--bg-alt` on hover |
| Pill button | `color/background/border .2s, transform .2s` | fill swap + `translateY(-1px)` |
| Social icon | `.2s` | ink-1 fill + `translateY(-2px)` |
| Theme toggle knob | `transform .3s ease` | slide 20px |

## Reduced motion

```css
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.001ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.001ms !important;
    scroll-behavior: auto !important;
  }
  .fade-up { opacity: 1; transform: none; }
}
```
