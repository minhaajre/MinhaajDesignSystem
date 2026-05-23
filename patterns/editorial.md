# Editorial Art & Imagery

## Design Philosophy

Psyda and Minhaaj.com use **bespoke SVG editorial art** — not photographs or stock imagery. The aesthetic is archival, scientific, and figurative: data visualizations treated as art.

**CCIAF** uses photographs with warm editorial styling (banners, hero photos). **IbnArbi** uses no imagery — relies entirely on glass cards, typography, and Islamic iconography.

---

## Psyda / Minhaaj.com — SVG Editorial Art

### Art Styles
- **Scatter plots** — clusters of dots on warm parchment, representing data as visual texture
- **Concentric circles** — radar/ripple patterns for analytics metaphors
- **Waveforms** — undulating signal lines for AI/data-flow concepts
- **Grid overlays** — fine-line graphing paper grids with data points

### Color Palette for Art
- **Light panels:** `#EDE8DE` → `#C8BFAE` gradient (warm beige-to-stone)
- **Dark bleed panels:** `#14120F` → `#2A2620` gradient (near-black to dark grey)
- **Line/stroke colors:** `#6B6457` (warm grey), `#8C7355` (copper)
- **Dot/data colors:** `#8C7355` accent dots with varying opacity

### Implementation
- Embedded as inline SVG (not external files)
- 100% width, `aspect-ratio` constrained
- Used as full-bleed chapter separators and hero backgrounds
- Subtle parallax on scroll (~15% of position)

### What NOT to use
- No photographs in Psyda UI (hero art is always SVGs)
- No stock photography
- No gradient-rich illustrations
- No clip art or icon sets

---

## CCIAF — Photography

### Photo Treatment
- **Warm, archival, sepia-adjacent** color grading
- **Border:** 1px solid `rgba(26,21,16,.12)` (subtle warm dark border)
- **Shadow:** `--shadow-strong` (0 24px 70px) for depth
- **Radius:** 2px (near-square, minimal rounding)
- **Object-position:** top-aligned (hero photo: `50% 12%`, bio: `50% 30%`, philanthropy: `50% 34%`)

### Aspect Ratios
- **Hero photo:** 4/5 (portrait)
- **Book covers:** 3/4
- **Video thumbnails / media:** 16/9
- **Banners:** fluid height via `clamp(340px, 42vw, 560px)`

### Photo Frame (Hero)
Hero photo uses a decorative offset frame:
```css
.hero-photo-frame::after {
  content: '';
  position: absolute;
  width: min(400px, 72%);
  aspect-ratio: 4/5;
  transform: translate(16px, 16px);
  border: 1px solid var(--gold-light);
  z-index: -1;
}
```

### Banner Variants
- `.banner-bio img` — `object-position: 50% 30%`
- `.banner-phil img` — `object-position: 50% 34%`

---

## IbnArbi — Iconography

### Islamic Icon Set
Custom stroke icons (24×24 viewBox, 1.5px stroke, round caps/joins, no fills):
- Mosque, Crescent Moon, Crescent Star, Lantern, Prayer Beads
- Quran, Kaaba, Prayer Rug, Eight-Pointed Star, Dua Hands
- Sunrise, Minharah, Islamic Pattern, Dome, Tasbih
- Mihrab, Calligraphy, Zodiac Wheel
- Element Fire, Water, Air, Earth

### Library Icons
- **Lucide React** for generic UI icons (Info, standard interactions)

### Rules
- No emoji or Unicode symbols in UI
- All icons: pure stroke, no fills
- 1.5px stroke width
