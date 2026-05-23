# Spacing & Layout

## Spacing Scale

All brands share a common spacing scale for consistency:

| Token | Rem | Pixels | Use |
|---|---|---|---|
| `--space-1` | 0.25rem | 4px | Micro spacing |
| `--space-2` | 0.5rem | 8px | Tight gaps |
| `--space-3` | 0.75rem | 12px | Button padding |
| `--space-4` | 1rem | 16px | Base spacing |
| `--space-5` | 1.25rem | 20px | Labels to content |
| `--space-6` | 1.5rem | 24px | Section gap, footer |
| `--space-8` | 2rem | 32px | Headings to body |
| `--space-10` | 2.5rem | 40px | CTA margin, nav gap |
| `--space-12` | 3rem | 48px | Section padding |
| `--space-16` | 4rem | 64px | Large section padding |
| `--space-20` | 5rem | 80px | Very large gaps |
| `--space-24` | 6rem | 96px | Section vertical spacing |

---

## Layout Tokens

| Token | Psyda | CCIAF | IbnArbi |
|---|---|---|---|
| Nav height | 76px | 58px | 64px |
| Nav height (mobile) | 64px | — | — |
| Max content width | 1280px | 1180px | 1200px |
| Prose width | — | 760px | — |
| Sidebar width | 280px | — | — |
| Horizontal padding | `clamp(1.5rem, 5vw, 3.5rem)` | `clamp(20px, 8vw, 120px)` | `clamp(1rem, 4vw, 2.5rem)` |
| Section vertical padding | `clamp(6rem, 14vw, 12rem)` | `clamp(70px, 9vw, 120px)` | — |

---

## Section Padding Pattern (CCIAF)

All sections use `clamp()` for vertical padding:
- Standard section: `clamp(70px, 9vw, 120px)`
- Books list: `clamp(72px, 8vw, 112px)`
- Bio text: `clamp(66px, 8vw, 104px)`
- Testimonials: `clamp(70px, 8vw, 110px)`

Horizontal padding: `clamp(20px, 8vw, 120px)` — tight on mobile, generous on desktop.

---

## Content Widths (CCIAF)

- **Full width (`--content-wide`):** 1180px — hero, book rows, podcast, media cards
- **Prose width (`--content-prose`):** 760px — biography text, contact copy
- **Section H2 max-width:** 700px (standard), 860px (page headers)
- **Prose column max-width:** 60ch (~660px at 18px)
- **Blockquote max-width:** 600px

---

## Grid Patterns

### CCIAF Hero
`grid-template-columns: minmax(0, 1.03fr) minmax(300px, .72fr)` — text content takes slightly more room
- Gap: `clamp(42px, 7vw, 92px)`
- Collapses to single-column at 980px

### CCIAF Book Row
`grid-template-columns: minmax(230px, .72fr) minmax(0, 1fr)` — cover on left
- Gap: `clamp(34px, 7vw, 86px)`
- Cover max-width: 360px

### CCIAF Book Detail
`grid-template-columns: minmax(220px, 320px) minmax(0, 760px)` — cover sidebar + content
- Gap: `clamp(38px, 7vw, 76px)`

### CCIAF Media Card
`grid-template-columns: 1fr 1fr`
- Gap: `clamp(34px, 6vw, 68px)`
- `.reverse` class swaps order on alternate cards

### CCIAF Testimonials
`grid-template-columns: 84px 1fr` — avatar + text
- Gap: 26px
- Collapses to single-column at 760px

### CCIAF Footer
`grid-template-columns: 1fr auto 1fr` — brand / socials / contact
- Gap: 28px
- Collapses to single-column at 760px

### Psyda Chapter
`280px sticky sidebar + 1fr content`
- Sidebar sticky at `top: nav-h + 3rem`
- Gap: `clamp(2rem, 6vw, 6rem)`

### CCIAF Layers (Framework)
`grid-template-columns: repeat(5, 1fr)` — five equal columns
- Each column: `padding: 26px 20px`, separated by `border-right`

---

## Responsive Breakpoints

| Breakpoint | Behavior |
|---|---|
| `980px` | All multi-column grids → single column (hero, book row, book detail, podcast, media cards) |
| `760px` | Mobile nav (hamburger visible), footer → single column, testimonials → single column, reduced padding to 24px |
| `720px` | Psyda hamburger nav active |
| `1100px` | Psyda grid collapse |

---

## Navigation Height

Navigation height is critical for `padding-top` offsets on all pages:

- **Psyda:** 76px desktop / 64px mobile
- **CCIAF:** 58px (fixed, no mobile variant)
- **IbnArbi:** 64px

All page containers offset by `calc(var(--nav-h) + [additional padding])`.
