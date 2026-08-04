# Branding

## Identity

| Field | Value |
|---|---|
| Brand | CCIAF |
| Full name | Cross-Civilization Intelligence and Action Framework |
| Sister product | Matrix (CCIAF Identity Module — BaZi + Numerology) |
| Domain | cciaf.minhaaj.com |
| Discipline | Timing intelligence for high-stakes decisions |
| Voice | Third-person, institutional, scholarly, calm confidence |

## Wordmark

CCIAF has no image logo — the identity is the wordmark itself. Render `CCIAF` in Cormorant Garamond, weight 300, 0.20em uppercase tracking, with the letters wrapped in `<em>` so the gold accent lands on the wordmark:

```css
.brand {
  font-family: var(--font-heading);
  font-size: 15px; font-weight: 300;
  letter-spacing: .20em; text-transform: uppercase;
  color: var(--ink-1);
}
.brand em { color: var(--gold); font-style: normal; }
```

```html
<a class="brand" href="#hero"><em>CCIAF</em></a>
```

## Tagline patterns

- "Every serious decision has a *when*."
- "Five analytical layers. One calibrated decision logic."
- "Strategic consultancies map what to do. We map *when*."

## Color & asset rules

- Single gold accent per surface — never introduce a second hue
- No aggressive gradients; flat warm backgrounds only (atmospheric radial tints behind heroes are decorative, <8% opacity)
- No emoji in UI or marketing copy
- Sentence case for body; ALL CAPS + tracking for labels/eyebrows
- Em dashes freely used; Oxford comma required

## Imagery

| Asset | Path | Use |
|---|---|---|
| Founder portrait | `assets/imagery/founder.jpeg` | 84px circular avatar; about/bio |
| Timing diagram | `assets/imagery/timing-activation-windows.svg` | activation-window explainer |

CCIAF uses **no arbitrary stock photography** in the UI. Imagery is limited to the founder portrait and framework diagrams.

## Naming & usage

- Brand spoken as letters: "C-C-I-A-F", never "see-af"
- Full name used once per page (footer or about), acronym thereafter
- Matrix shares the CCIAF token set and should be treated as a sub-product, not a separate brand

## Author attribution

Founder and principal: **Minhaaj Rehman**. Use in footer brand line and about sections.
