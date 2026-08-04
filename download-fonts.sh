#!/bin/bash
# Download CCIAF Design System fonts for self-hosting.
# Fetches Cormorant Garamond (display) + EB Garamond (body) from Google Fonts.
set -e

BASE_URL="https://fonts.gstatic.com"

# ── Cormorant Garamond (display / headings / eyebrows) ──
CG_DIR="fonts/cormorant-garamond"
declare -A CG_FONTS
CG_FONTS["cormorantgaramond-v21-italic-300"]="s/cormorantgaramond/v21/co3smX5slCNuHLi8bLeY9MK7whWMhyjYrGFEsdtdc62E6zd5rDDOjw.ttf"
CG_FONTS["cormorantgaramond-v21-italic-400"]="s/cormorantgaramond/v21/co3smX5slCNuHLi8bLeY9MK7whWMhyjYrGFEsdtdc62E6zd58jDOjw.ttf"
CG_FONTS["cormorantgaramond-v21-italic-500"]="s/cormorantgaramond/v21/co3smX5slCNuHLi8bLeY9MK7whWMhyjYrGFEsdtdc62E6zd5wDDOjw.ttf"
CG_FONTS["cormorantgaramond-v21-normal-300"]="s/cormorantgaramond/v21/co3umX5slCNuHLi8bLeY9MK7whWMhyjypVO7abI26QOD_qE6GnM.ttf"
CG_FONTS["cormorantgaramond-v21-normal-400"]="s/cormorantgaramond/v21/co3umX5slCNuHLi8bLeY9MK7whWMhyjypVO7abI26QOD_v86GnM.ttf"
CG_FONTS["cormorantgaramond-v21-normal-500"]="s/cormorantgaramond/v21/co3umX5slCNuHLi8bLeY9MK7whWMhyjypVO7abI26QOD_s06GnM.ttf"

echo "Downloading Cormorant Garamond..."
for name in "${!CG_FONTS[@]}"; do
  url="$BASE_URL/${CG_FONTS[$name]}"
  curl -s -o "$CG_DIR/${name}.ttf" "$url"
  echo "  ✓ ${name}.ttf"
done

# ── EB Garamond (body / prose / nav links) ──
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

echo ""
echo "✅ CCIAF fonts downloaded successfully!"
ls -1 fonts/*/*.ttf | wc -l | xargs echo "Total files:"
