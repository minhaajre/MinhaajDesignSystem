# Cards

## CCIAF Testimonial Cards

Two-column grid (avatar + text) with semi-transparent glass surface.

```css
.testimonial {
  display: grid;
  grid-template-columns: 84px 1fr;
  gap: 26px; align-items: start;
  padding: 30px; margin-bottom: 22px;
  border: 1px solid var(--border);
  background: rgba(255,255,255,.42);
  box-shadow: 0 1px 2px rgba(26,21,16,.04);
}
[data-theme="dark"] .testimonial { background: rgba(30,26,16,.72); }
```

- **Avatar:** 84px, `border-radius: 50%`, gold-light border
- **Text:** Cormorant Garamond, `clamp(1.12rem, 1.7vw, 1.32rem)`, italic, weight 300
- **Author:** `.78rem`, uppercase, 0.14em spacing, gold
- **Container:** `--bg-alt`, top/bottom borders, max-width 920px

### Responsive
- **≤760px:** Single column, padding 24px, avatar 74px

---

## CCIAF Book Cards

### Book Row (list)
```css
.book-row {
  display: grid;
  grid-template-columns: minmax(230px,.72fr) minmax(0,1fr);
  gap: clamp(34px, 7vw, 86px);
  align-items: center;
  padding-bottom: clamp(48px, 7vw, 82px);
  border-bottom: 1px solid var(--border);
}
```
- **Cover:** `width: min(360px,100%)`, `aspect-ratio:3/4`, radius 2px, shadow
- **Cover hover:** `scale(1.025)` — 0.45s
- **Title:** `clamp(2rem,4vw,3.35rem)`, weight 300, lh 1.08
- **Title `::before`:** `'Published Work'` — gold eyebrow

### Book Detail
```css
.book-detail {
  grid-template-columns: minmax(220px,320px) minmax(0,760px);
  gap: clamp(38px, 7vw, 76px);
}
```
- **Cover:** Full width, `--shadow-strong`, radius 2px
- **Title:** `clamp(2.15rem,4.6vw,3.9rem)`, lh 1.06
- **Actions:** Column flex, gap 12px

---

## IbnArbi Glass Cards

```css
.ib-glass-card {
  background: var(--ib-bg-card);
  backdrop-filter: blur(20px);
  border: 1px solid var(--ib-border);
  border-radius: var(--ib-radius-lg);
  box-shadow: var(--ib-shadow-sm);
}
```
- **Dark mode:** `background: var(--ib-dark-card)`, `border: var(--ib-dark-border)`
- **Radius:** 0.5rem base, 0.75rem cards, 1rem large cards
- **Contents:** Mansion name, favorability gauge, divine names, tags
