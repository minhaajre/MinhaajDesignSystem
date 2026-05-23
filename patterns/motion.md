# Motion & Animation

## Easing Curves

| Token | Value | Use |
|---|---|---|
| `--ease-out` | `cubic-bezier(0.22, 1, 0.36, 1)` | Reveal animations, hover states |
| `--ease-in-out` | `cubic-bezier(0.65, 0.05, 0.36, 1)` | Theme transitions |
| `--ease-spring` | `cubic-bezier(0.34, 1.56, 0.64, 1)` | Bouncy micro-interactions |

## Transition Durations

| Token | Value | Use |
|---|---|---|
| `--dur-fast` | 0.2s | Hover states, active states |
| `--dur-base` | 0.35s | Theme toggle, border changes |
| `--dur-slow` | 0.4–0.5s | Color/background transitions |
| `--dur-reveal` | 0.7–0.9s | Scroll reveal animations |

---

## Scroll Reveal (CCIAF)

### Fade-up (`.r`)
Used across all CCIAF pages for content reveal on scroll:
```css
.r { opacity: 0; transform: translateY(22px); transition: opacity .7s ease, transform .7s ease; }
.r.on { opacity: 1; transform: none; }
```
- Triggered by IntersectionObserver at `threshold: 0.1`
- `.on` class added when element enters viewport
- All elements revealed on first load via `fallback` (no animation if observer is unsupported)

### Fade-up keyframe (`.hero` staggered entries)
```css
@keyframes fu {
  from { opacity: 0; transform: translateY(16px); }
  to   { opacity: 1; transform: none; }
}
```
Applied to hero elements with staggered delays:
- `.hero-eye`: 0.15s
- `.hero-title`: 0.3s
- `.hero-photo`: 0.35s
- `.hero-rule`: 0.5s
- `.hero-body`: 0.6s (subsequent bodies: +0.12s each)
- `.hero-note`: 0.9s

---

## Scroll Reveal (Psyda)

### Word-split reveal
Words split into `.word > span` wrappers via JavaScript:
```css
.word span { display: block; transform: translateY(105%); transition: transform 0.9s var(--ease-out); }
.word span.revealed { transform: translateY(0); }
```
- Staggered delay: 50ms per word

### Fade-up (general)
```css
.fade-up { opacity: 0; transform: translateY(28px); transition: opacity 0.8s var(--ease-out), transform 0.8s var(--ease-out); }
.fade-up.visible { opacity: 1; transform: none; }
```

---

## Hover States

### CCIAF

| Element | Effect | Duration |
|---|---|---|
| Buttons (outline) | Fills to `--ink-1` bg, `--bg` text, translateY(-1px) | 0.2s |
| Buttons (solid) | Fills to `--gold` bg, translateY(-1px) | 0.2s |
| Social icons | translateY(-2px), fills to `--ink-1` | 0.2s |
| Book covers (book row) | scale(1.025) | 0.45s ease |
| Video thumbnails | scale(1.025), opacity 0.82→1 | 0.45s ease |
| Links | color change to `--ink-1` | 0.2s |
| Contact link | bottom-border underline appears | 0.2s |

### Psyda

| Element | Effect | Duration |
|---|---|---|
| Links | Underline grows `right: 100%` → `right: 0` | 0.5s ease-out |
| Buttons (fill-sweep) | `translateY(101%)` → `0` sweep fill from bottom | 0.45s ease-out |
| Editorial list items | `padding-left: 1rem` slide | 0.5s ease |
| Media rows | Left padding + semi-transparent bg | 0.5s ease |

---

## Theme Transitions

- **Body:** `background .4s, color .4s` — smooth theme switch
- **All themed elements:** individual `transition: background .4s, color .4s, border-color .4s`
- **Theme toggle knob:** `translateX(20px)` — 0.3s ease (dark mode)
- **Theme toggle track:** `background .35s, border-color .35s`

---

## Marquee (Psyda)

```css
@keyframes marquee {
  from { transform: translateX(0); }
  to   { transform: translateX(-50%); }
}
.marquee-inner { animation: marquee 38s linear infinite; }
```
- Continuous horizontal scroll
- Duplicate content for seamless loop
- Pauses on interaction

---

## Parallax (Psyda)

Bleed-figure SVGs shift ~40px on scroll:
```javascript
const offset = rect.top * 0.15;
figure.style.transform = `translateY(${offset}px)`;
```
- Implemented via `getBoundingClientRect` in scroll handler
- Subtle effect (~15% of scroll position)

---

## Nav Scroll State

| Brand | Past scroll threshold | Effect |
|---|---|---|
| Psyda | 40px | bg → `rgba(247,243,236,0.78)` + `backdrop-filter: blur(18px)` |
| CCIAF | Always | bg → `var(--nav-bg)` with `backdrop-filter: blur(12px)` |

---

## Reduced Motion

All brands respect `prefers-reduced-motion: reduce`:
```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: .01ms !important;
    animation-iteration-count: 1 !important;
    scroll-behavior: auto !important;
    transition-duration: .01ms !important;
  }
}
```

- All animations killed; elements appear in final state
- All transitions set to near-instant duration
- Scroll behavior set to `auto`
