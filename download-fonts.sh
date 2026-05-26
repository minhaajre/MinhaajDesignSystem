#!/bin/bash
# Download all Minhaaj Design System fonts for self-hosting
set -e

BASE_URL="https://fonts.gstatic.com"

# ── Cormorant Garamond (8 variants) ──
CG_DIR="fonts/cormorant-garamond"
declare -A CG_FONTS
CG_FONTS["cormorantgaramond-v21-italic-300"]="s/cormorantgaramond/v21/co3smX5slCNuHLi8bLeY9MK7whWMhyjYrGFEsdtdc62E6zd5rDDOjw.ttf"
CG_FONTS["cormorantgaramond-v21-italic-400"]="s/cormorantgaramond/v21/co3smX5slCNuHLi8bLeY9MK7whWMhyjYrGFEsdtdc62E6zd58jDOjw.ttf"
CG_FONTS["cormorantgaramond-v21-italic-500"]="s/cormorantgaramond/v21/co3smX5slCNuHLi8bLeY9MK7whWMhyjYrGFEsdtdc62E6zd5wDDOjw.ttf"
CG_FONTS["cormorantgaramond-v21-italic-600"]="s/cormorantgaramond/v21/co3smX5slCNuHLi8bLeY9MK7whWMhyjYrGFEsdtdc62E6zd5LDfOjw.ttf"
CG_FONTS["cormorantgaramond-v21-normal-300"]="s/cormorantgaramond/v21/co3umX5slCNuHLi8bLeY9MK7whWMhyjypVO7abI26QOD_qE6GnM.ttf"
CG_FONTS["cormorantgaramond-v21-normal-400"]="s/cormorantgaramond/v21/co3umX5slCNuHLi8bLeY9MK7whWMhyjypVO7abI26QOD_v86GnM.ttf"
CG_FONTS["cormorantgaramond-v21-normal-500"]="s/cormorantgaramond/v21/co3umX5slCNuHLi8bLeY9MK7whWMhyjypVO7abI26QOD_s06GnM.ttf"
CG_FONTS["cormorantgaramond-v21-normal-600"]="s/cormorantgaramond/v21/co3umX5slCNuHLi8bLeY9MK7whWMhyjypVO7abI26QOD_iE9GnM.ttf"

echo "Downloading Cormorant Garamond..."
for name in "${!CG_FONTS[@]}"; do
  url="$BASE_URL/${CG_FONTS[$name]}"
  curl -s -o "$CG_DIR/${name}.ttf" "$url"
  echo "  ✓ ${name}.ttf"
done

# ── DM Sans (3 variants) ──
DS_DIR="fonts/dm-sans"
declare -A DS_FONTS
DS_FONTS["dmsans-v17-normal-300"]="s/dmsans/v17/rP2tp2ywxg089UriI5-g4vlH9VoD8CmcqZG40F9JadbnoEwA_JxhTg.ttf"
DS_FONTS["dmsans-v17-normal-400"]="s/dmsans/v17/rP2tp2ywxg089UriI5-g4vlH9VoD8CmcqZG40F9JadbnoEwAopxhTg.ttf"
DS_FONTS["dmsans-v17-normal-500"]="s/dmsans/v17/rP2tp2ywxg089UriI5-g4vlH9VoD8CmcqZG40F9JadbnoEwAkJxhTg.ttf"

echo "Downloading DM Sans..."
for name in "${!DS_FONTS[@]}"; do
  url="$BASE_URL/${DS_FONTS[$name]}"
  curl -s -o "$DS_DIR/${name}.ttf" "$url"
  echo "  ✓ ${name}.ttf"
done

# ── Inter (3 variants) ──
INT_DIR="fonts/inter"
declare -A INT_FONTS
INT_FONTS["inter-v20-normal-300"]="s/inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuOKfMZg.ttf"
INT_FONTS["inter-v20-normal-400"]="s/inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuLyfMZg.ttf"
INT_FONTS["inter-v20-normal-500"]="s/inter/v20/UcCO3FwrK3iLTeHuS_nVMrMxCp50SjIw2boKoduKmMEVuI6fMZg.ttf"

echo "Downloading Inter..."
for name in "${!INT_FONTS[@]}"; do
  url="$BASE_URL/${INT_FONTS[$name]}"
  curl -s -o "$INT_DIR/${name}.ttf" "$url"
  echo "  ✓ ${name}.ttf"
done

# ── EB Garamond (6 variants) ──
EB_DIR="fonts/eb-garamond"
declare -A EB_FONTS
EB_FONTS["ebgaramond-v32-italic-400"]="s/ebgaramond/v32/SlGFmQSNjdsmc35JDF1K5GRwUjcdlttVFm-rI7e8QI96.ttf"
EB_FONTS["ebgaramond-v32-italic-500"]="s/ebgaramond/v32/SlGFmQSNjdsmc35JDF1K5GRwUjcdlttVFm-rI7eOQI96.ttf"
EB_FONTS["ebgaramond-v32-italic-600"]="s/ebgaramond/v32/SlGFmQSNjdsmc35JDF1K5GRwUjcdlttVFm-rI7diR496.ttf"
EB_FONTS["ebgaramond-v32-normal-400"]="s/ebgaramond/v32/SlGDmQSNjdsmc35JDF1K5E55YMjF_7DPuGi-6_RUAw.ttf"
EB_FONTS["ebgaramond-v32-normal-500"]="s/ebgaramond/v32/SlGDmQSNjdsmc35JDF1K5E55YMjF_7DPuGi-2fRUAw.ttf"
EB_FONTS["ebgaramond-v32-normal-600"]="s/ebgaramond/v32/SlGDmQSNjdsmc35JDF1K5E55YMjF_7DPuGi-NfNUAw.ttf"

echo "Downloading EB Garamond..."
for name in "${!EB_FONTS[@]}"; do
  url="$BASE_URL/${EB_FONTS[$name]}"
  curl -s -o "$EB_DIR/${name}.ttf" "$url"
  echo "  ✓ ${name}.ttf"
done

# ── Lora (6 variants: 2 italic + 4 normal) ──
LORA_DIR="fonts/lora"
declare -A LORA_FONTS
LORA_FONTS["lora-v37-italic-400"]="s/lora/v37/0QI8MX1D_JOuMw_hLdO6T2wV9KnW-MoFkqg.ttf"
LORA_FONTS["lora-v37-italic-500"]="s/lora/v37/0QI8MX1D_JOuMw_hLdO6T2wV9KnW-PgFkqg.ttf"
LORA_FONTS["lora-v37-normal-400"]="s/lora/v37/0QI6MX1D_JOuGQbT0gvTJPa787weuyJG.ttf"
LORA_FONTS["lora-v37-normal-500"]="s/lora/v37/0QI6MX1D_JOuGQbT0gvTJPa787wsuyJG.ttf"
LORA_FONTS["lora-v37-normal-600"]="s/lora/v37/0QI6MX1D_JOuGQbT0gvTJPa787zAvCJG.ttf"
LORA_FONTS["lora-v37-normal-700"]="s/lora/v37/0QI6MX1D_JOuGQbT0gvTJPa787z5vCJG.ttf"

echo "Downloading Lora..."
for name in "${!LORA_FONTS[@]}"; do
  url="$BASE_URL/${LORA_FONTS[$name]}"
  curl -s -o "$LORA_DIR/${name}.ttf" "$url"
  echo "  ✓ ${name}.ttf"
done

# ── Source Sans 3 (4 variants) ──
SS_DIR="fonts/source-sans-3"
declare -A SS_FONTS
SS_FONTS["sourcesans3-v19-normal-300"]="s/sourcesans3/v19/nwpBtKy2OAdR1K-IwhWudF-R9QMylBJAV3Bo8Kzm61EN.ttf"
SS_FONTS["sourcesans3-v19-normal-400"]="s/sourcesans3/v19/nwpBtKy2OAdR1K-IwhWudF-R9QMylBJAV3Bo8Ky461EN.ttf"
SS_FONTS["sourcesans3-v19-normal-500"]="s/sourcesans3/v19/nwpBtKy2OAdR1K-IwhWudF-R9QMylBJAV3Bo8KyK61EN.ttf"
SS_FONTS["sourcesans3-v19-normal-600"]="s/sourcesans3/v19/nwpBtKy2OAdR1K-IwhWudF-R9QMylBJAV3Bo8Kxm7FEN.ttf"

echo "Downloading Source Sans 3..."
for name in "${!SS_FONTS[@]}"; do
  url="$BASE_URL/${SS_FONTS[$name]}"
  curl -s -o "$SS_DIR/${name}.ttf" "$url"
  echo "  ✓ ${name}.ttf"
done

# ── Amiri (4 variants) ──
AM_DIR="fonts/amiri"
declare -A AM_FONTS
AM_FONTS["amiri-v30-italic-400"]="s/amiri/v30/J7afnpd8CGxBHpUrtLY.ttf"
AM_FONTS["amiri-v30-italic-700"]="s/amiri/v30/J7aanpd8CGxBHpUrjAo9zps.ttf"
AM_FONTS["amiri-v30-normal-400"]="s/amiri/v30/J7aRnpd8CGxBHqUp.ttf"
AM_FONTS["amiri-v30-normal-700"]="s/amiri/v30/J7acnpd8CGxBHp2VkZY4.ttf"

echo "Downloading Amiri..."
for name in "${!AM_FONTS[@]}"; do
  url="$BASE_URL/${AM_FONTS[$name]}"
  curl -s -o "$AM_DIR/${name}.ttf" "$url"
  echo "  ✓ ${name}.ttf"
done

echo ""
echo "✅ All 34 font files downloaded successfully!"
ls -lh fonts/*/*.ttf | wc -l | xargs echo "Total files:"
