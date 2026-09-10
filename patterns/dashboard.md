# Dashboards — decision instruments, not data dumps

A dashboard's one job is **decision support**: the reader must reach a choice
(adopt, avoid, investigate) without scrolling through raw tables or decoding
internal vocabulary. A beautifully typeset data instrument — same editorial
precision, same tokens — but its measure of success is *decisions made per
scroll*, not data shown.

## Data model first, chrome second

- **Dedup to the entity the reader decides about.** One row per entity, one
  per category, one per whatever "a choice" means in the domain. The route,
  channel, provider, or pipeline instance that delivers the entity is
  plumbing, never a headline row. Internal bleed — the same entity appearing
  N times under different routes — is the single most common dashboard
  failure and the first thing to check.
- **Pool, don't cherry-pick.** When collapsing N routes into one row, pool
  *every* observation into the score. Taking each entity's best route
  launders failures and misranks. A score must survive the question "does
  this count the bad attempts?"
- **Normalize vocabulary at load time.** Real data accretes key drift: the
  same concept recorded under two names across eras of the dataset.
  Canonicalize once in the storage/loading layer so every consumer —
  ranking, rendering, routing — sees one key per concept. Never let two
  internal names for one thing render as two columns.
- **Config is the source of truth for classifications** — tiers, weights,
  thresholds, groupings. The dashboard reads them; it never hardcodes a
  second copy.
- **Internal jargon never reaches the page.** Column names, enum keys, event
  codes — translate to human language. A dashboard is human-facing; the
  internal schema is not the interface.

## Structure — decision order, not data order

1. **Verdict strip** — 4–6 stat pills at the very top: volume, entity count,
   health pulse, validity share. Each pill carries an infotip defining itself
   and stating the trap ("this measure is not that measure").
2. **The answer** — winner per category as compact cards with a value, a
   bar, and a runner-up line. The reader's decision must land on the first
   screen.
3. **Explorer** — one compact row per entity with per-category bars; hover
   carries depth (route detail, observation counts, margins).
4. **Interpretation** — 3–6 data-backed narrative cards. Written claims with
   evidence, not adjectives.
5. **Evidence** — logs, raw rows, full ledgers go into `<details>`
   collapsibles, collapsed by default. Nothing that requires scrolling to
   reach a decision lives below a collapse.

Charts are the exception, not the default: a many-series line chart answers
no question. A bar inside a row answers "how good per category" better than
any canvas. Reach for a chart library only when the shape of the question
demands it.

## Honesty mechanics

- **Show uncertainty next to every rate.** A ±95% Wilson (or equivalent)
  margin in the infotip, and a minimum-observation gate on rankability with
  provisional marking below it. Calibration to internalize: at n=3 only
  extremes are readable (±29pts); differences under ~10pts need n≈15+.
  Where margins overlap, say so — do not rank.
- **Failures stay visible.** Errored attempts count as observations with
  zero quality. Dead or degraded routes appear in a visible place, never
  deleted — longitudinal evidence is the point of a ledger.
- **Every aggregate is explainable in one hover line.** Each computed score
  needs an infotip naming its inputs ("all 105 observations across 6 routes").

## Tiered ecosystems

When offerings differ in restriction (unlimited / limited / paid, or any
analogous ladder), render the pyramid: the excluded top tier as a static
banner restating the exclusion rule, then **one collapsible section per
tier**, ordered most-restricted first. Tier is a property of the *route*,
recorded in config; an entity sits in the least-restricted tier it can
reach, with a hover note explaining mixed-tier pools. An entity offered
through two tiers is one entity, not two.

## Engineering guardrails

- **The script-parse regression test is mandatory for inline-script pages.**
  One broken template edit — a single eaten function declaration — can blank
  an entire dashboard silently, because one JS syntax error kills the whole
  inline script. The test suite must generate the page, extract the inline
  script, and **execute it in node against a stub DOM**; parsing alone is
  not enough.
- **Self-contained page:** no CDN dependency for anything the decision
  depends on. Data inlined as JSON through a single placeholder; assert the
  placeholder was substituted.
- **Verify rendered output, not the generator's exit code.** Reload the
  payload from the produced HTML and assert entity counts and that no
  internal keys leaked into user-visible strings.

## Instrument rules (system dialect)

- Same tokens as every other surface: one neutral base, one accent used as a
  scalpel, near-zero surface radius with pill radius for pills, the system's
  two-font serif pairing.
- Stat pills use the pill radius; winners use cards; both carry infotips —
  depth on hover, silence at rest.
- Color encodes state and nothing else: status backgrounds for badges and
  chips, accent for emphasis and bars. Never decorate data.
- Sentence case body, ALL CAPS spaced eyebrows and tier labels, no emoji, no
  gradients. Numbers set tabular (`font-variant-numeric:tabular-nums`).
