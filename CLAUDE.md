# Minhaaj Design System — Agent Orchestration

This repository is the **CCIAF Design System** — both the brand artifacts (tokens, components, patterns, previews, ui_kit) and the anti-slop orchestration layer that governs how agents produce them.

## Load Order (read in this sequence, every session)

1. `design-system/CLAUDE.md` — the agent council (Design Director / Art Director / Aesthetic Judge / Motion Lead / QA Gate), loading sequences, non-negotiables
2. `design-system/DESIGN.md` — CCIAF brand identity tokens (populated from `tokens/cciaf.css`)
3. `design-system/PRODUCT.md` — audience, surface, voice
4. `SKILL.md` — CCIAF-specific brand rules (the brief; its words always win per council non-negotiable #6)
5. `tokens/cciaf.css` — single source of truth for every CSS custom property

Skills live in `design-system/skills/` and are mirrored to the user's agent harness (`~/.agents/skills/frontend-design`).

## CCIAF Overrides to the Anti-Slop Bans

These decisions are already resolved. Do not re-litigate them, do not "fix" the production code to match a ban it deliberately breaks.

| Anti-slop rule | CCIAF status | Resolution |
|---|---|---|
| Em/en dashes banned in copy | **Overridden** | Em dashes are the brand's mandated emphasis device (see README design philosophy + SKILL.md). Brand voice is a lock, not slop. |
| `window.addEventListener('scroll')` banned | **Compliant** | All scroll listeners migrated to `IntersectionObserver` (sentinel at page y=500px for scroll-to-top; 0–38% viewport band for side-nav dots). Specs: `components/scroll-to-top.md`, `components/side-navigation.md`. |
| "Decorative status dots / scroll cues" banned | **Intentional feature** | The side-nav dot rail is a documented component (labels, active-state tracking). Observer-driven, not decorative animation. |
| Cream bg + serif + warm accent (AI tell #1) | **Waived tell** | Cream + **gold** (not terracotta) + all-serif is the deliberate, shipped brand. Documented in `design-system/DESIGN.md` anti-references. |
| One corner-radius system | **Documented exception** | All-sharp 2px surfaces + 9999px pills only. No third value. |
| Nav height max 80px | **Passes** | CCIAF nav is 58px — below the ceiling. |
| One accent per page | **Passes** | Single gold accent is absolute; emphasis via weight, spacing, tone. |

## Gates

- **impeccable detect:** not wired into CI by decision. Run `npx impeccable detect <dir>` manually before shipping new UI; the established production files are an approved baseline.
- **Pre-flight checklist** (taste-skill §14) applies to all *new* work.

## Working Here

- Token changes land in `tokens/cciaf.css`, then propagate to `design-system/DESIGN.md` and previews.
- Component behavior changes must update both the markdown spec (`components/`) and the ui_kit + preview HTML.
- No emoji in any file, no AI-slop phrasing, brief wins.
