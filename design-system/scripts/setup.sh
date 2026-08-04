#!/usr/bin/env bash
# ============================================================
# Design System — Anti-Slop Stack Bootstrap
# ============================================================
# Run from your project root (not the design system root).
# This installs all skills into your AI harness and wires
# the impeccable detector into your project.
#
# Usage:
#   bash .design-system/scripts/setup.sh
#   bash .design-system/scripts/setup.sh --provider=claude
#   bash .design-system/scripts/setup.sh --ci-only
# ============================================================

set -e

# ---- Parse args ----
PROVIDER="claude"    # default: claude code
CI_ONLY=false

for arg in "$@"; do
  case $arg in
    --provider=*)  PROVIDER="${arg#*=}" ;;
    --ci-only)     CI_ONLY=true ;;
    --help)
      echo "Usage: setup.sh [--provider=claude|cursor|codex|all] [--ci-only]"
      exit 0 ;;
  esac
done

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║        Design System — Anti-Slop Stack Setup            ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# ---- Prerequisite check ----
check_command() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "  ✗  $1 is required but not found. Install it and retry."
    exit 1
  }
}

echo "Checking prerequisites..."
check_command node
check_command npx

NODE_MAJOR=$(node -e "process.stdout.write(process.version.replace('v','').split('.')[0])")
if [ "$NODE_MAJOR" -lt 22 ]; then
  echo "  ✗  Node.js >=22 required (impeccable detect requires >=22). Found: $(node -v)"
  exit 1
fi
echo "  ✓  Node $(node -v)"
echo ""

# ---- Layer 1: impeccable ----
if [ "$CI_ONLY" = false ]; then
  echo "━━━  Layer 1: impeccable (design director + CI detector)  ━━━"
  echo "Installing impeccable skills into AI harness (provider: $PROVIDER)..."

  if [ "$PROVIDER" = "all" ]; then
    npx impeccable skills install -y --providers=claude,cursor,codex --scope=project
  else
    npx impeccable skills install -y --providers="$PROVIDER" --scope=project
  fi

  echo "  ✓  impeccable skills installed"
  echo ""

  # ---- Layer 2: taste-skill v2 ----
  echo "━━━  Layer 2: taste-skill v2 (visual direction + anti-slop bans)  ━━━"
  npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend"
  npx skills add https://github.com/Leonxlnx/taste-skill --skill "output-skill"
  npx skills add https://github.com/Leonxlnx/taste-skill --skill "redesign-skill"
  echo "  ✓  taste-skill v2, output-skill, redesign-skill installed"
  echo ""

  # ---- Layer 3: Anthropic frontend-design ----
  echo "━━━  Layer 3: Anthropic frontend-design (aesthetic judgment)  ━━━"
  # Copy from design system repo into project skills directory
  SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  DS_ROOT="$(dirname "$SCRIPT_DIR")"
  TARGET_SKILLS_DIR=".claude/skills"   # adjust if your agent uses a different dir

  mkdir -p "$TARGET_SKILLS_DIR/frontend-design"
  cp "$DS_ROOT/skills/frontend-design/SKILL.md" "$TARGET_SKILLS_DIR/frontend-design/SKILL.md"
  echo "  ✓  Anthropic frontend-design skill installed"
  echo ""

  # ---- Layer 4: Emil Kowalski skills ----
  echo "━━━  Layer 4: Emil Kowalski skills (motion lead)  ━━━"
  npx skills@latest add emilkowalski/skills
  echo "  ✓  emil-design-eng, improve-animations, apple-design, review-animations installed"
  echo ""
fi

# ---- Layer 5: CI detector ----
echo "━━━  Layer 5: impeccable detect (CI gate)  ━━━"
echo "Running detector on src/ to establish baseline..."

if [ -d "src" ]; then
  npx impeccable detect src/ --json > /dev/null 2>&1 && \
    echo "  ✓  Baseline clean — 0 anti-patterns detected" || \
    echo "  ⚠  Anti-patterns detected. Run 'npx impeccable detect src/' to review."
else
  echo "  ⚠  No src/ directory found. Run 'npx impeccable detect <your-dir>' manually."
fi
echo ""

# ---- Next steps ----
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  Setup complete. Next steps:"
echo ""
echo "  1. Open your AI agent (Claude Code, Cursor, etc.)"
echo "  2. Run: /impeccable init"
echo "     This writes PRODUCT.md + DESIGN.md for this specific project."
echo "     Do this before any design work."
echo ""
echo "  3. Wire the CI gate into your PR pipeline:"
echo "     See .github/workflows/design-check.yml"
echo ""
echo "  4. Before shipping any UI:"
echo "     npx impeccable detect src/"
echo "     Must exit 0. If it exits 2, fix the anti-patterns first."
echo ""
echo "  5. Refresh skill context after any code change:"
echo "     npx impeccable skills update"
echo ""
echo "  Full orchestration instructions: CLAUDE.md"
echo ""
