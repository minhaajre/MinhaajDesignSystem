# Footer

CCIAF uses two footer treatments: a slim single-row footer (brand / socials / contact) and a richer three-column "rebuilt" footer with link groups.

## Slim footer

```css
.site-footer {
  display: grid; grid-template-columns: 1fr auto 1fr;
  align-items: center; gap: 28px;
  padding: 28px clamp(22px, 8vw, 120px);
  border-top: 1px solid var(--border);
  color: var(--ink-4);
  background: var(--nav-bg);
}
```

| Position | Class | Content |
|---|---|---|
| Left | `.footer-brand` | "Minhaaj Rehman" — uppercase, 0.18em, weight 300 |
| Center | `.footer-socials` | Social icon circles |
| Right | `.footer-contact` | Email link (gold, underline on hover) |

### Social icons

```css
.social-icon {
  width: 38px; height: 38px; border: 1px solid var(--border);
  border-radius: 50%; display: grid; place-items: center;
  color: var(--ink-3); font-size: .86rem;
  transition: color .2s, background .2s, border-color .2s, transform .2s;
}
.social-icon:hover {
  color: var(--bg); background: var(--ink-1);
  border-color: var(--ink-1); transform: translateY(-2px);
}
```

### Responsive

- **≤760px:** single column, text-align center, gap 18px

## Rebuilt three-column footer

```css
.f-grid {
  display: grid; grid-template-columns: 1.4fr 1fr 1fr;
  gap: 36px; align-items: flex-start;
  max-width: 1200px; margin: 0 auto; padding: 0 0 22px;
}
.f-col h4 {
  font-family: var(--font-heading); font-size: 13px;
  letter-spacing: .18em; text-transform: uppercase;
  color: var(--ink-3); font-weight: 400; margin-bottom: 14px;
}
.f-col ul { list-style: none; }
.f-col li { padding: 4px 0; font-size: 14px; }
.f-col a { color: var(--ink-2); }
.f-col a:hover { color: var(--gold); }
.f-bottom {
  border-top: 1px solid var(--border); padding-top: 18px;
  display: flex; justify-content: space-between; gap: 24px; flex-wrap: wrap;
  font-size: 12.5px; color: var(--ink-4);
}
```

- **≤760px:** `.f-grid` → single column

## References (collapsible)

Long reference lists are presented in a `<details>` block with a `+` / `−` marker.

```css
.refs { border-top: 1px solid var(--border); padding: 64px clamp(20px,8vw,120px) 80px; background: var(--bg-alt); }
.refs-detail { max-width: 920px; margin: 0 auto; border: 1px solid var(--border); background: var(--surface); border-radius: 2px; }
.refs-summary {
  list-style: none; cursor: pointer; padding: 18px 26px;
  font-family: var(--font-serif); font-size: 1rem; color: var(--ink-1);
  display: flex; align-items: center; justify-content: space-between;
}
.refs-summary::-webkit-details-marker { display: none; }
.refs-summary::after { content: '+'; font-size: 24px; color: var(--gold); font-weight: 300; }
.refs-detail[open] .refs-summary::after { content: '−'; }
.refs-trad { padding: 18px 0; border-bottom: 1px solid var(--border); }
.refs-trad-name { font-family: var(--font-heading); font-size: 1.05rem; font-weight: 500; color: var(--ink-1); }
.refs-trad li { font-size: 14.5px; color: var(--ink-2); line-height: 1.6; padding: 3px 0; position: relative; padding-left: 14px; }
.refs-trad li::before { content: '·'; position: absolute; left: 0; color: var(--gold); }
```
