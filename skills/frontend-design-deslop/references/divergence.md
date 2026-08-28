# Escaping the model's default: generating genuine variance

Everything else in this skill describes _what_ slop looks like. This file describes _why_ a model reaches for it in the first place, and what to do instead. Source: a measured research campaign on getting genuine design variance out of a one-shot coding model (~200 sampled concepts, human-graded), not intuition — the mechanism is worth understanding, not just the fix.

## Contents

1. The core finding: it's variance, not creativity
2. Rejection advances a queue, it does not generate
3. A model cannot pick its own diverse output
4. Ground borrowed forms in something specific, not a mood
5. Commit fully before you soften — not the reverse
6. A committed skin can hide a template underneath
7. Write the direction down, then have someone else check it
8. Applying this in Phase 0 and the self-audit

## 1. The core finding: it's variance, not creativity

Asking a model to "be creative," "think differently," or "avoid the obvious" through a dozen different framings (a pep talk, an impossible client, taste vocabulary, a world-building metaphor) still converges on the same concept almost every time. The model is not short on ideas; it is short on **variance between attempts**. Exhortation prose changes the wording of the answer, not the answer. Do not spend effort rephrasing "be original" — spend it on a mechanism that forces a different output.

## 2. Rejection advances a queue, it does not generate

"Write your first three ideas, discard them unseen, build the fourth" reliably escapes the model's single most-probable concept — but it lands on its _second_ most-probable one, every time. A model's concept prior for a given brief is roughly two ideas deep. Telling it to avoid something produces the runner-up rut, not fresh thinking. Use rejection to escape idea #1, not as a general-purpose creativity instruction, and do not expect a second round of rejection to keep paying off the same way.

## 3. A model cannot pick its own diverse output

Forcing a real derivation procedure — seven candidate directions, each with a written rationale, genuinely different from each other — works: the _list_ is diverse. Then asking the model to pick "the most resonant one" from its own list collapses back to the same winner every run. Diversity lives in generation and dies at selection, because one model scoring its own candidates is one deterministic function (argmax), regardless of how the prompt is worded. Handing the shortlist to a simulated persona, a veto rule, or "pick what a user would like" does not fix this — it still reverts to the model's own taste function most of the time.

**What works:** separate generation from selection. The model derives a grounded shortlist of candidate directions (with rationale for each, so the candidates are real, not decorative). Something outside the model's own judgment — a die roll, a fixed index, a coin flip — picks which one gets built. This is not about literal randomness; it is about removing the model's argmax from the selection step. If no external picker is available, a cheap proxy works: ask for the shortlist in one pass, then in a _fresh_ pass (no memory of ranking them) ask only "build candidate #3" with no discussion of the others.

## 4. Ground borrowed forms in something specific, not a mood

When deriving candidate directions, the depth of the list is bounded by how much cultural material the brief actually contains. A brief rooted in a specific, textured domain (a regional TV culture, a niche hobby, a historic print medium) yields a deep, specific candidate list. A generic brief (another SaaS dashboard, another admin panel) yields a shallow one — terminals and postmortems, again — no matter how hard the model tries.

When the brief itself is thin, do not force the model to invent depth it does not have. Instead, deliberately borrow a **specific, produced graphic system** from outside the product's own domain — a naturalist's field guide, a broadsheet sports section, a teletext service, a transit map — and adapt it. A world is a graphic system with real production history (palette, type, composition, a topology), never a vague material, mood, or place. "1950s Blue Note sleeve," not "record covers." Weigh a borrowed form on two axes before committing: does the audience recognize or identify with it, and does it make the product clearer, not just decorated.

## 5. Commit fully before you soften — not the reverse

An instinct to add an "anti-gimmick" guard — "if a visitor would notice the borrowed form before the product, reject it" — sounds responsible but is usually the actual ceiling on the work. A fully-committed borrowed form (a page built entirely as teletext, entirely as a terminal session) is _supposed_ to be noticed; that is what makes it memorable, and it still works because the underlying task stays easy to complete. Every hedge, caveat, and "keep it professional" instruction in a brief is a brake; every "commit," "go all the way," "own it" instruction is an accelerator. If the brakes outnumber the accelerators, the output lands timid, and timid reads as bland regardless of the underlying idea.

**Sequence matters more than the words used.** Land the concept fully committed first — that is the hard, high-variance part. Only in a later pass check legibility, restraint, and whether it still serves the artifact's job (see `references/artifact-types.md`). Committing-then-clarifying consistently outperforms clarifying-while-committing; asking for both at once produces neither.

## 6. A committed skin can hide a template underneath

Concept, palette, composition, and motion each converge toward the default independently. Fixing one (a distinctive palette) does not fix the others (a completely standard hero-cards-testimonials grid underneath it). The failure mode is invisible to a judge — including the model itself — that only looks at the styled render: every surface detail speaks the committed direction, but the skeleton is the category's default template.

**The check:** strip color, texture, and type in your head (or literally, with a quick grayscale/wireframe pass) and compare the bare structure against the category's standard layout for this artifact type. If the wireframe is indistinguishable from the default, the direction only reached the surface — go back to Phase 2 layout, not Phase 1 color. Borrow the form's _skeleton_ (its composition, hierarchy, rhythm), not just its clothes (palette and iconography).

## 7. Write the direction down, then have someone else check it

Models describe ambitious direction convincingly and then build the conservative default anyway, because nothing forces a comparison between the stated intent and the shipped result. A generic "does this look good?" self-critique in the same pass makes this worse, not better — a rubric invites additions, so output gets busier without getting more distinctive, and a thread grading its own work has every incentive to rubber-stamp it.

**What works:** write the committed direction as a short, explicit contract before or alongside building — what this page uniquely is, the category default it refuses, the first-viewport composition, the chosen form and why. `references/design-md.md`'s DESIGN.md already captures most of this (aesthetic commitment, signature move); treat those fields as the contract, not just documentation. Then audit the _render_ against the _contract_, promise by promise, from a fresh vantage point — a separate self-audit pass, a sub-agent with no memory of the build reasoning, or at minimum a deliberate re-read after stepping away from the generation context — rather than the same pass that just finished building rubber-stamping itself.

## 8. Applying this in Phase 0 and the self-audit

- **Phase 0 (discovery):** when the brief is generic (another dashboard, another SaaS landing page), deliberately widen the reference search past the product's own category (§4) instead of asking the model to "be more creative" about the same category (§1).
- **Phase 1 (aesthetic commitment):** derive 2-3 real candidate directions with a one-line rationale each before picking one, rather than jumping straight to the first idea (§2-3). If genuinely stuck between two strong candidates, force the choice externally (alternate on request count, ask the user, or flip on an arbitrary but fixed rule) rather than re-deliberating in the same reasoning pass.
- **Phase 1 → Phase 2:** commit to the aesthetic fully before checking it against artifact-type fit or legibility; do the fit check as its own later step, not folded into the same generation (§5).
- **Self-audit:** before declaring done, do the wireframe-strip check (§6) and re-read the DESIGN.md aesthetic commitment against the actual render as if seeing it for the first time (§7) — not just the tell-by-tell checklist in `references/slop-checklist.md`, which catches known patterns but not "technically slop-free, still generic."
