# Forms & Interactive Elements

## Theme Toggle (CCIAF)

Custom `role="switch"` for light/dark mode:

```css
.theme-tog {
  width: 46px; height: 26px; border-radius: 13px;
  background: var(--tog-bg);
  border: 1px solid var(--border);
  cursor: pointer; position: relative;
  -webkit-appearance: none;
  transition: background .35s, border-color .35s;
}
.theme-tog::after {
  content: ''; position: absolute; top: 3px; left: 3px;
  width: 18px; height: 18px; border-radius: 50%;
  background: var(--tog-knob);
  transition: transform .3s ease, background .35s;
}
[data-theme="dark"] .theme-tog::after { transform: translateX(20px); }
```

### Behavior
- Toggles `data-theme` on `<html>` between `"light"` / `"dark"`
- Persisted to `localStorage` key `minhaaj-theme`
- Defaults to system `prefers-color-scheme`

---

## Hamburger Toggle

```css
.nav-toggle {
  display: none; background: none;
  border: 1px solid var(--border); border-radius: 5px;
  padding: 6px 10px; cursor: pointer;
  font-size: 14px; color: var(--ink-3);
}
.nav-toggle:hover { color: var(--ink-1); }
```
- Visible only on mobile (≤760px)
- Toggles `.open` class on `.mob-menu`
- Dismisses on outside click

---

## Focus States

```css
a:focus-visible, button:focus-visible,
input:focus-visible, textarea:focus-visible,
select:focus-visible {
  outline: 2px solid var(--gold);
  outline-offset: 3px; border-radius: 2px;
}
```

---

## Skip Link

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
