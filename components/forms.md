# Forms & Interactive Elements

CCIAF forms are quiet and editorial: square (radius 0) inputs with a single gold focus ring, no heavy borders. Interactive controls share the focus and motion conventions of the rest of the system.

## Contact form

```css
.ct-form { margin: 36px auto 0; max-width: 540px; text-align: left; }
.cf-field { margin-bottom: 20px; }
.cf-field input,
.cf-field textarea {
  width: 100%; border: 1px solid var(--border);
  padding: 12px 15px;
  font-family: var(--font-serif); font-size: 16px; color: var(--ink-2);
  background: var(--field-bg, var(--surface));
  border-radius: 0; outline: none;
  transition: border-color .2s, box-shadow .2s, background .4s, color .4s;
  -webkit-appearance: none; appearance: none;
}
.cf-field input:focus,
.cf-field textarea:focus {
  border-color: var(--gold-mid);
  box-shadow: 0 0 0 3px rgba(139,101,16,.10);
}
[data-theme="dark"] .cf-field input:focus,
[data-theme="dark"] .cf-field textarea:focus {
  box-shadow: 0 0 0 3px rgba(200,160,58,.10);
}
.cf-field textarea { min-height: 120px; resize: vertical; }
.cf-err { display: none; font-size: 13px; color: #B84040; margin-top: 5px; }
.cf-err.show { display: block; }
```

| Part | Font | Size | Notes |
|---|---|---|---|
| label | Cormorant Garamond | 12px | 0.18em uppercase, gold |
| input / textarea | EB Garamond | 16px | radius 0, 1px border |
| `.cf-btn` | Cormorant Garamond | 14px | 0.16em uppercase, solid gold → gold-mid |
| error | EB Garamond | 13px | `#B84040` |

On success, `#ct-success` (a bordered surface) replaces the form with a confirmation eyebrow + body.

## Theme toggle

See [navigation.md](./navigation.md) for the `.tog` switch. Persists to `localStorage` key `minhaaj-theme`; defaults to `prefers-color-scheme`.

## Hamburger

```css
.hbg {
  display: none; background: none;
  border: 1px solid var(--border); border-radius: 5px;
  padding: 6px 10px; cursor: pointer;
  font-family: var(--font-serif); font-size: 14px; color: var(--ink-3);
}
.hbg:hover { color: var(--ink-1); border-color: var(--ink-3); }
```

Visible only ≤760px; toggles `.open` on `.mob-menu`; dismisses on outside click.

## Focus states

```css
a:focus-visible, button:focus-visible,
input:focus-visible, textarea:focus-visible,
select:focus-visible {
  outline: 2px solid var(--gold);
  outline-offset: 3px; border-radius: 2px;
}
```

## Skip link

```css
.skip-link {
  position: fixed; top: -100%; left: 18px; z-index: 9999;
  background: var(--ink-1); color: var(--bg);
  padding: 9px 16px; font-family: var(--font-heading);
  font-size: .82rem; letter-spacing: .08em; text-transform: uppercase;
  border-radius: 0 0 4px 4px;
}
.skip-link:focus { top: 0; }
```

## Reduced motion

All reveal/transition animations are neutralized under `prefers-reduced-motion: reduce`.
