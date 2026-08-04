# Editorial

CCIAF's editorial language is a beautifully typeset academic journal crossed with a luxury magazine. Precision over spectacle.

## Voice

- **Person:** Third-person, institutional. Authoritative but not cold.
- **Casing:** Sentence case for body copy. ALL CAPS (spaced tracking 0.14–0.28em) for labels, eyebrows, metadata.
- **Punctuation:** Em dashes for emphasis. Ellipsis for contemplative pauses. Oxford comma required.
- **Emoji:** Never used in UI or copy.

## Section anatomy

Every content section follows the same rhythm:

```
eyebrow (gold, uppercase, 0.22em)   → .eye
rule (50px × 1.5px gold)            → .rule   (optional)
H2 (Cormorant Garamond, weight 300) → .h2
prose (EB Garamond, max 60ch)       → .prose
```

```css
.eye  { font-family: var(--font-heading); font-size: var(--text-eyebrow);
        font-weight: 300; letter-spacing: var(--ls-eyebrow);
        text-transform: uppercase; color: var(--gold); }
.rule { width: 50px; height: 1.5px; background: var(--gold); }
.h2   { font-family: var(--font-heading); font-size: var(--text-h2);
        font-weight: 300; line-height: var(--lh-h2); color: var(--ink-1); }
.prose{ font-family: var(--font-serif); font-size: var(--text-body);
        color: var(--ink-2); line-height: var(--lh-body); max-width: 60ch; }
```

## Contrast sections

The "gap" / problem sections flip to a dark-on-light (light mode) or light-on-dark (dark mode) treatment to interrupt the reading rhythm. See [color.md](./color.md) for the inversion tokens.

```css
.section-contrast { background: var(--cs-bg); }
.section-contrast .eye { color: var(--cs-gold); }
.section-contrast .h2  { color: var(--cs-h); }
.section-contrast .prose { color: var(--cs-body); }
```

Blockquotes within use a 2px gold left border:

```css
.blockquote { border-left: 2px solid var(--cs-gold); padding-left: 28px;
  font-family: var(--font-heading); font-size: clamp(1.2rem, 2.4vw, 1.65rem);
  font-style: italic; font-weight: 300; line-height: var(--lh-quote);
  color: var(--cs-h); }
```

## Ornament

A centered ornamental divider (a spaced middot or fleuron) separates major movements:

```css
.orn { font-family: var(--font-heading); font-size: 1.8rem;
  color: var(--border); text-align: center; padding: 28px 0;
  letter-spacing: .5em; user-select: none; }
```

## Founder portraiture

The framework is personified by the founder. Use `assets/imagery/founder.jpeg` (84px circular avatar in testimonials; larger in about/bio contexts). Pair with an italic Cormorant Garamond attribution.

## Timing diagram

`assets/imagery/timing-activation-windows.svg` visualizes activation windows — embed inline or as an `<img>` within a bordered surface (`border-radius: 2px`).

## Layer & tier grids

The framework is presented as a five-column layer grid and a three-column engagement grid (see [cards.md](./../components/cards.md)). These are the signature editorial artifacts of the system.
