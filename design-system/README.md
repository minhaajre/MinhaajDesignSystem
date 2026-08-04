# Design System — Anti-Slop Stack

A composable design system for AI coding agents. Enforces distinctive, intentional UI across every project that consumes it.

**The problem:** Every AI model was trained on the same SaaS templates. Without explicit constraints, they produce the same handful of tells: Inter for everything, purple-to-blue gradients, cards nested in cards, gray text on colored backgrounds, rounded-square icon tiles above every heading.

**This system:** Four tools, five functions, one orchestration document that runs as the agent's design council.

---

## Quick Start

```bash
# Clone or add as submodule
git submodule add https://github.com/YOUR_ORG/design-system .design-system

# Bootstrap all skills into your project
bash .design-system/scripts/setup.sh

# Open your AI agent, then run:
/impeccable init
```

That last command writes `PRODUCT.md` and `DESIGN.md` for your specific project. Do it before any design work begins.

---

## The Stack

| Layer | Tool | Function |
|-------|------|----------|
| 1 | **impeccable** | Brief → context → 23 design commands → CI detector |
| 2 | **taste-skill v2** | Visual direction, design locks, anti-slop bans |
| 3 | **Anthropic frontend-design** | Token system, aesthetic judgment, two-pass critique |
| 4 | **Emil Kowalski skills** | Animation quality, motion vocabulary, Apple design principles |
| 5 | **impeccable detect** | 60 deterministic rules, CI enforcement, PR gate |

---

## Repo Structure

```
design-system/
├── CLAUDE.md                         ← Agent orchestration (read this first)
├── DESIGN.md                         ← Brand tokens template
├── PRODUCT.md                        ← Audience/surface context template
├── README.md
├── skills/
│   ├── frontend-design/SKILL.md      ← Anthropic: aesthetic judgment
│   ├── design-taste-frontend/        ← taste-skill v2: direction + bans
│   ├── emit-design-eng/              ← Emil: animation + design
│   ├── improve-animations/           ← Emil: animation audit
│   ├── apple-design/                 ← Emil: Apple design principles
│   └── output-skill/                 ← taste-skill: anti-lazy output
├── tokens/
│   └── _base.css                     ← CSS custom properties
├── scripts/
│   └── setup.sh                      ← Bootstrap installer
└── .github/
    └── workflows/
        └── design-check.yml          ← CI: impeccable detect gate
```

---

## Agent Instructions

The full orchestration document is in `CLAUDE.md`. It defines:
- The six-role agent council (Design Director, Art Director, Aesthetic Judge, Motion Lead, QA Gate)
- The loading sequence for greenfield, redesign, animation-only, and polish tasks
- The non-negotiables (pre-flight check, detect gate, easing rules, color lock)
- How to consume this system from another project

**Read `CLAUDE.md` before any design work. Every time.**

---

## CI Gate

The impeccable detector runs on every PR touching frontend files. It scans for 60 deterministic anti-patterns — side-tab borders, purple gradients, bounce easing, cramped padding, bad line length — and fails the PR if any are found.

Exit code 0 = clean. Exit code 2 = anti-patterns found. No merge on exit 2.

To run locally:
```bash
npx impeccable detect src/
npx impeccable detect src/ --json   # machine-readable
```

---

## Consuming From Another Project

Add to your project's `CLAUDE.md`:

```markdown
## Design System

Load agent instructions from: `.design-system/CLAUDE.md`

All skill files are in `.design-system/skills/`.
PRODUCT.md and DESIGN.md for this project are at the project root.
```

---

## Skills Installed

After running `setup.sh`, your AI harness has:

| Skill | Source | Purpose |
|-------|--------|---------|
| `frontend-design` | Anthropic | Aesthetic direction, token system |
| `design-taste-frontend` | taste-skill v2 | Visual direction, locks, anti-slop bans |
| `output-skill` | taste-skill | Anti-lazy output, no half-finished work |
| `redesign-skill` | taste-skill | Six-category audit for existing projects |
| `emil-design-eng` | Emil Kowalski | Animation + design (Vercel/Linear level) |
| `review-animations` | Emil Kowalski | Strict animation review |
| `improve-animations` | Emil Kowalski | Audit + prioritized fix plans |
| `apple-design` | Emil Kowalski | Apple's WWDC design principles for web |
| `find-animation-opportunities` | Emil Kowalski | Where to animate; what not to animate |
| `prototype` | Emil Kowalski | Multiple UI versions with a switcher |

---

## Updating Skills

```bash
# Update impeccable and its skills
npx impeccable skills update

# Update taste-skill
npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend"

# Update Emil's skills
npx skills@latest add emilkowalski/skills
```

---

## Security

Skills are markdown files executed as agent instructions. All skills in this repo have been manually reviewed. Before adding any third-party skill, review its SKILL.md content — a 2026 audit found 36.82% of public skills contained security flaws.

---

## Commands Reference

| Command | Description |
|---------|-------------|
| `/impeccable init` | Write PRODUCT.md + DESIGN.md for current project |
| `/impeccable plan` | UX/UI planning before code |
| `/impeccable build` | Implement with full design context |
| `/impeccable critique` | UX review: hierarchy, clarity, resonance |
| `/impeccable audit` | Technical: accessibility, performance, responsive |
| `/impeccable polish` | Final visual pass |
| `/impeccable bolder` | Push design toward more intensity |
| `/impeccable quieter` | Pull toward restraint |
| `/impeccable distill` | Strip complexity, increase clarity |
| `/impeccable delight` | Add surprise and personality |
| `/impeccable help` | List all 23 commands |
| `npx impeccable detect src/` | Run 60-rule anti-pattern detector |
| `npx impeccable skills update` | Update all installed skills |
