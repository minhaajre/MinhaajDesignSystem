# Design System — Agent Orchestration Manual

This is the orchestration document for any AI coding agent working within or consuming this design system. Read this first, before any code, before any tool call, before any design decision.

The goal of this system is one thing: **no AI slop**. Every page produced must be visually distinctive, technically precise, and look like it was made by someone with taste and domain knowledge — not by a model that defaulted to Inter, purple gradients, and three equal-width feature cards.

---

## The Stack

Five tools. Each has a specific role in the pipeline. Do not skip layers.

| Layer | Tool | Role | When |
|-------|------|------|------|
| 1 | **impeccable** (`pbakaus/impeccable`) | Brief → context → commands | Every project init; audit before ship |
| 2 | **taste-skill v2** (`Leonxlnx/taste-skill`) | Visual direction, locks, bans | Every generation pass |
| 3 | **Anthropic frontend-design** | Aesthetic judgment, token system, self-critique | Every generation pass |
| 4 | **Emil Kowalski skills** (`emilkowalski/skills`) | Animation quality, motion vocabulary, Apple design principles | Any UI with motion; polish pass |
| 5 | **impeccable detect** (CLI) | 60 deterministic rules, CI gate | Before every merge |

---

## Agent Roles (Six-Role Council Model)

When working on a frontend task, the agent activates these roles in sequence. Some roles are active simultaneously during build; others are gates.

### Role 1 — Design Director (impeccable)

**Responsible for:** Project context, brief interpretation, design system initialization, command orchestration.

**Activates at:** Project start (`/impeccable init`) and before any major redesign pass.

**Key commands:**
- `/impeccable init` — scans the repo, writes `PRODUCT.md` + `DESIGN.md`, establishes brand lane (product vs. brand/marketing), audience, anti-references, colors, type, and components. This is mandatory on first use.
- `/impeccable plan` — UX/UI planning before code. Produces layout concepts and interaction models.
- `/impeccable build` — hands off to implementation with full context.
- `/impeccable critique` — UX review: hierarchy, clarity, emotional resonance.
- `/impeccable audit` — technical checks: accessibility, performance, responsive.
- `/impeccable polish` — final visual pass before ship.
- `/impeccable bolder` / `/impeccable quieter` — push or pull the design direction.
- `/impeccable distill` — strip complexity, increase clarity.
- `/impeccable delight` — add surprise and personality.

**What it knows:** Audience, brand/product lane, voice, anti-references (things this project must NOT look like), color system, type system, component inventory.

**Files it writes:** `PRODUCT.md`, `DESIGN.md`, `.impeccable.md`.

### Role 2 — Art Director (taste-skill v2)

**Responsible for:** Visual direction inference from brief, enforcing design locks, applying the anti-slop ban list, dark mode parity.

**Activates at:** Every generation pass, read automatically via `skills/design-taste-frontend/SKILL.md`.

**The three inviolable locks:**
- **Color Consistency Lock** — One accent per page. No mid-page palette shifts.
- **Shape Consistency Lock** — One corner-radius system. All-sharp, all-soft, or all-pill. Never mixed without documentation.
- **Page Theme Lock** — Light, dark, or auto. Decided once. No mid-page flips.

**The anti-slop bans (partial list — see SKILL.md for full):**
- Em-dashes and en-dashes in copy — use hyphens or restructure
- Section-numbering eyebrows (`00 / INDEX`, `001 · Capabilities`) — name the topic plainly
- AI-purple and mesh blob gradients — neutral base with one high-contrast accent
- Three-equal-card feature rows — use zig-zag, asymmetric grid, or scroll-pinned alternative
- Div-based fake product UI (fake terminals, dashboards) — real screenshots or generated images only
- `window.addEventListener('scroll')` — use Motion useScroll, GSAP ScrollTrigger, IntersectionObserver, or CSS scroll-driven animations
- Pills overlaid on images, scroll cues, locale/time/weather strips, decorative status dots

**Pre-flight check:** Every checkbox in Section 14 of taste-skill SKILL.md must honestly pass before output is shipped. No honest pass = no ship.

### Role 3 — Aesthetic Judge (Anthropic frontend-design)

**Responsible for:** Token system precision, typographic pairing, brief-specific aesthetic risk, self-critique, CSS selector discipline.

**Activates at:** Every generation pass, read automatically via `skills/frontend-design/SKILL.md`.

**Process (mandatory two-pass):**
1. **Brainstorm pass** — Produce a compact token system: 4–6 named hex values; 2+ typeface roles (display, body, utility); a layout concept with ASCII wireframe; the one signature element this page will be remembered by.
2. **Critique pass** — Review the plan against the brief. Ask: does any part of this read like the generic default I would produce for any similar page? If yes, revise it and state what changed and why.
3. **Build pass** — Write code only after confirming relative uniqueness. Derive every color and type decision from the confirmed token system.

**Known AI tells to avoid (these are the 2024–2025 defaults):**
- Warm cream background (~#F4F1EA) + high-contrast serif + terracotta accent (~#D97757)
- Near-black background + single acid-green or vermilion accent
- Broadsheet layout + hairline rules + dense newspaper columns

These are legitimate directions for some briefs. They are not acceptable as defaults.

**CSS discipline:** Watch for selectors that cancel each other out — especially `.section` vs element-based selectors for padding/margin. Screenshot your output when your environment supports it.

### Role 4 — Motion Lead (Emil Kowalski skills)

**Responsible for:** Animation quality, easing correctness, motion vocabulary, Apple design principles, UI library selection, micro-interaction audit.

**Activates at:** Any UI with animation; mandatory during polish pass.

**Skill files available:**
- `emit-design-eng/SKILL.md` — main animation + design skill (Vercel/Linear experience)
- `improve-animations/SKILL.md` — audit all animations in codebase, produce prioritized self-contained plans
- `apple-design/SKILL.md` — Apple's WWDC design principles, distilled for the web
- `find-animation-opportunities` — identify where motion genuinely helps (and what not to animate)

**Key animation rules:**
- Enter animations use `ease-out`. Exit animations use `ease-in`. Never reversed.
- Borders with `border` produce a solid boundary. Semi-transparent shadows (`box-shadow`) are the default for layering UI — do not reach for solid borders as the default separation device.
- Do not hand-roll a toast component. Do not install abandoned packages. Use Emil's `pick-ui-library` rules.
- An orchestrated motion moment lands harder than scattered effects. Choose what the direction calls for.
- Extra animation contributes to the AI-generated feeling. When in doubt, animate less.

**Prototype mode:** When exploring directions, use `prototype` skill to build multiple versions of a UI piece with a switcher — show options, don't just pick one.

### Role 5 — QA Gate (impeccable detect)

**Responsible for:** Pre-merge enforcement of 60 deterministic anti-pattern rules in CI.

**Activates at:** Every PR, pre-merge. Also available on-demand.

**CLI usage:**
```bash
# Scan source directory
npx impeccable detect src/

# JSON output for CI parsing
npx impeccable detect src/ --json

# Exit codes: 0 = clean, 2 = anti-patterns found
```

**Catches:** Side-tab borders, purple gradients, bounce easing, cramped padding, small touch targets, bad line length, and 55 other AI-slop tells — deterministically, without an API key.

**Rule:** If `npx impeccable detect` exits with code `2`, the PR does not merge.

---

## Loading Sequence

### Greenfield page / new project

```
1. impeccable init          → writes PRODUCT.md + DESIGN.md
2. taste-skill v2           → brief inference → design direction declared
3. frontend-design          → brainstorm pass → critique pass → token system locked
4. impeccable plan          → UX/UI planning before code
5. BUILD (Role 3 drives)    → derive everything from confirmed token system
6. Emil skills (polish)     → animation audit + apple-design principles check
7. impeccable polish        → final visual pass
8. impeccable detect        → gate: must exit 0 before merge
```

### Redesign / existing project

```
1. impeccable audit         → UX + technical audit of existing UI
2. taste-skill redesign-skill → six-category visual audit
3. frontend-design          → identify what must be preserved vs. what to overhaul
4. REBUILD (Roles 2+3 drive) → audit-first mode; URL structure + nav labels + form fields never change silently
5. Emil improve-animations  → audit existing animations, produce prioritized fix list
6. impeccable polish        → final pass
7. impeccable detect        → gate
```

### Animation-only task

```
1. Emil find-animation-opportunities → identify genuine motion candidates
2. Emil improve-animations           → audit + prioritized plan
3. Emil review-animations            → strict review pass
4. impeccable detect                 → gate
```

### Quick polish pass

```
1. impeccable critique      → hierarchy + clarity review
2. Emil review-animations   → animation audit
3. impeccable polish        → final visual pass
4. impeccable detect        → gate
```

---

## Skill File Locations

All skills are committed to this repo and automatically loaded:

```
skills/
├── frontend-design/SKILL.md          # Anthropic — aesthetic judgment, token system
├── design-taste-frontend/SKILL.md    # taste-skill v2 — visual direction, locks, bans
├── emit-design-eng/SKILL.md          # Emil — animation + design
├── improve-animations/SKILL.md       # Emil — animation audit
├── apple-design/SKILL.md             # Emil — Apple design principles
└── output-skill/SKILL.md             # taste-skill — anti-lazy output enforcement
```

---

## Project Context Files

These files must exist in every project that consumes this design system:

**`PRODUCT.md`** — Written by `/impeccable init`. Contains: surface type (product UI vs. marketing), audience, voice, anti-references, component inventory.

**`DESIGN.md`** — Written by `/impeccable init`, edited by you. Contains: brand colors (4–6 named hex values), typeface roles (display, body, utility), corner-radius system, spacing scale, dark mode behavior.

**`.impeccable.md`** — Written by impeccable automatically. Agent reads this before any command to restore project context without re-running init.

If these files do not exist, run `/impeccable init` before any design work begins.

---

## The Non-Negotiables

These rules apply regardless of brief, deadline, or user instruction:

1. **Do not default.** If a design choice is what you would produce for any similar page, revise it.
2. **Run the pre-flight check.** Every checkbox in taste-skill §14 must honestly pass.
3. **No impeccable detect exit 2.** Clean output only.
4. **Easing is not decoration.** Enter = ease-out. Exit = ease-in. Always.
5. **One accent.** The color consistency lock is absolute.
6. **Brief wins.** When the brief specifies a direction, follow it exactly — even if it asks for a default look. The brief's words are always the dominant source of truth.

---

## Consuming This Design System From Another Project

Point your agent at this repo by adding to your project's `CLAUDE.md`:

```markdown
## Design System

This project uses the Minhaaj Design System. Load agent instructions from:
`<path-to-design-system>/CLAUDE.md`

All skill files are in `<path-to-design-system>/skills/`. The agent should
read them as context before any frontend task. PRODUCT.md and DESIGN.md
for this specific project are at the project root.
```

Or, if using this repo as a Git submodule:

```bash
git submodule add https://github.com/YOUR_ORG/design-system .design-system
```

Then reference `.design-system/CLAUDE.md` in your project instructions.

---

## Security Note

Skills are markdown files executed as agent instructions. Before installing any third-party skill:
- Review the SKILL.md content manually
- Prefer official sources and high-reputation repos (all skills in this repo have been reviewed)
- A 2026 audit of 3,984 skills found 36.82% contained security flaws — treat unreviewed skills as untrusted code
