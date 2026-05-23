# Footer

## CCIAF Footer

Three-column grid: brand / socials / contact.

```css
.site-footer {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  align-items: center;
  gap: 28px;
  padding: 28px clamp(22px, 8vw, 120px);
  border-top: 1px solid var(--border);
  color: var(--ink-4);
  background: var(--nav-bg);
}
```

### Columns

| Position | Class | Content |
|---|---|---|
| Left | `.footer-brand` | "Minhaaj Rehman" — uppercase, 0.18em spacing, weight 300 |
| Center | `.footer-socials` | Social icon circles |
| Right | `.footer-contact` | Email link |

### Social Icons

```css
.social-icon {
  width: 38px; height: 38px;
  border: 1px solid var(--border);
  border-radius: 50%;
  display: grid; place-items: center;
  color: var(--ink-3);
  font-size: .86rem;
  transition: color .2s, background .2s, border-color .2s, transform .2s;
}
.social-icon:hover {
  color: var(--bg); background: var(--ink-1);
  border-color: var(--ink-1); transform: translateY(-2px);
}
```

### Contact Link

```css
.footer-contact a {
  color: var(--gold);
  border-bottom: 1px solid transparent;
}
.footer-contact a:hover { border-bottom-color: var(--gold-light); }
```

### Responsive
- **≤760px:** Single column, text-align center, gap 18px
