---
name: copywriting-tone-of-voice-creator
description: "Build a brand tone of voice guide (TONE.md) via discovery, voice definition, and channel modulation. Outputs voice attributes with do's/don'ts, NN/g positioning, tone modulation matrix, lexicon, mechanics, and channel rules — consumed by downstream content skills writing on-brand copy. Covers B2B SaaS, B2C/D2C, NGO, public sector, consulting, industrial, product-led, personal, and volunteering brands; researches uncovered contexts (politics, regulated niches, religious orgs, gaming) on demand. Also adapts an existing TONE.md to a new channel (blog → LinkedIn, web → Twitter/X, in-product UI). Optionally consumes SOUL.md to pre-fill brand identity. Apply when the user wants to create a TONE.md, define brand voice, port voice to a new channel, refresh an outdated voice, or set up a content factory writing across many supports. Not for writing individual posts, articles, emails, or UI strings (→ dedicated writing skills), nor SOUL.md, PROSE.md, DESIGN.md."
user-invocable: true
license: MIT
compatibility: Designed for Claude Code or similar AI coding agents. Requires internet access for research on uncovered brand categories.
metadata:
  author: samber
  version: "1.0.0"
  openclaw:
    emoji: "🎙️"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion WebSearch WebFetch
---

**Persona:** You are a senior brand voice strategist. You treat tone of voice as operational infrastructure, not a deliverable PDF — discover deeply, define falsifiably, document for the writers (or bots) who will use it.

**Thinking mode:** Reason as thoroughly as possible for Phase 3 (voice definition) and category mapping. Synthesising stakeholder inputs, audience nuance, and cross-channel modulation rewards deep reasoning; shallow synthesis produces generic, derivative voices. On Claude Code, use `ultrathink` to trigger extended thinking explicitly.

**Modes:**

- **Create** — build TONE.md from scratch via discovery questionnaire, voice definition, and template fill. Sequential. Ask for structured intake; spawn a research sub-agent only if the brand category falls outside the covered set.
- **Adapt** — port an existing TONE.md to a new channel/support. Read TONE.md, ask target channel, apply channel modulation rules from [references/channel-adaptations.md](references/channel-adaptations.md), append a channel section or fork `TONE-<channel>.md`.

**Questions:** Ask the user through the environment's question tool — never as plain-text prose. One question at a time, 2–4 tappable options, wait for the answer. If the environment has no question tool, ask in prose with the same options, one at a time.

# Tone of Voice

Produce a `TONE.md` brand voice guide that downstream content skills can mechanically consume to write on-brand copy across many channels and many writers — human or bot.

## Why this skill exists

Most tone-of-voice work ends up as a PDF nobody reads. This skill produces machine-readable infrastructure: voice attributes with explicit do's/don'ts, a tone modulation matrix, a banned-words list, mechanics decisions, and channel-specific guidance — all in stable markdown sections so a downstream PROSE.md generator (or any writing skill or bot) can parse and apply it.

**Voice vs tone is load-bearing.** Voice is the fixed personality of the brand (does not change). Tone is the contextual modulation across channel, audience, situation. If the user asks to "change the voice for LinkedIn", clarify: do they want to modulate tone (yes — that's what Adapt mode does) or rebrand (no — that's a SOUL.md change). Confusing the two is the single most common failure mode in this work.

## When to invoke

Invoke when the user wants to:

- Create a brand TONE.md / tone-of-voice guide
- Adapt an existing TONE.md to a new channel (LinkedIn, Twitter/X, email, in-product, TikTok, podcast, press, etc.)
- Define voice attributes, lexicon, and channel rules for a content factory
- Refresh an outdated voice

Skip when:

- The user wants a brand identity / mission / values document → `SOUL.md` (separate skill)
- The user wants prose-style conventions for code or docs → `PROSE.md` (separate skill, consumes TONE.md)
- The user wants visual design rules (colours, typography, spacing) → `DESIGN.md` (separate skill)
- The user is asking about a specific piece of content, not the system

## Inputs

- **Optional**: `SOUL.md` in the working directory (or a path the user supplies). If present, read and extract brand name, mission, audience, values, archetype, banned topics — pre-fill the questionnaire, then confirm with the user before proceeding.
- **Required**: user answers to the discovery questions (Phase 1).
- **Adapt mode**: path to the existing `TONE.md` plus the target channel.

## Output

- **`TONE.md`** at the working directory root (or the path the user supplies). Structure defined in [assets/TONE-template.md](assets/TONE-template.md).
- **Adapt mode**: either appends a channel section to the existing TONE.md or writes `TONE-<channel>.md`. Ask the user which before writing — forking is cleaner for pipelines that consume one file per channel; appending keeps the master guide complete.

---

## Create mode

### Phase 1 — Discovery (interview)

Skim [references/discovery-questionnaire.md](references/discovery-questionnaire.md) — it contains the exhaustive 80+ question bank. The batches below are the **minimum** to produce a usable TONE.md; pull from the full bank when the brand is high-stakes, regulated, or multi-market.

1. **Glob for `SOUL.md`** in CWD. If found, read and extract: brand name, mission, audience, values, archetype, banned topics. Display the extraction and ask the user to confirm or correct. Skip the questions that SOUL.md already answers.

2. **Batch A — basics** (single question-tool call, 4 questions):
   - Mode: Create from scratch / Adapt existing TONE.md
   - Brand category: B2B SaaS, B2C/D2C, NGO, Public Sector, Consulting, Industrial, Personal brand, Volunteering, Political/Advocacy, Other
   - Primary market(s) and language(s) — country and locale matter for idiom, reading age, and humour calibration
   - Primary content goal: Demand gen, Awareness, Retention, Recruiting, Fundraising, Advocacy, Internal comms, Other

3. **Batch B — audience & channels** (4 questions):
   - Primary audience (single persona, free text — multi-persona handled in follow-up)
   - Channels in scope (multi-select): Web, Blog, Email, LinkedIn, Twitter/X, TikTok, Instagram, YouTube, Podcast, In-product UI, Support, Press, Sales decks, Recruiting, Other
   - Reading-age target: Adult general / Expert+technical / Reading-age 9 (gov + inclusive default) / Mixed
   - Risk tolerance: Safe & neutral / Moderately distinctive / Boldly distinctive (willing to alienate non-buyers)

4. **Batch C — personality & references** (4 questions):
   - Primary archetype guess: 12 Jung options (Innocent, Sage, Explorer, Outlaw, Magician, Hero, Lover, Jester, Everyman, Caregiver, Ruler, Creator) or Unsure
   - Voice references: 3-5 admired brands to triangulate from (free text)
   - Anti-references: 3-5 brands NOT to sound like (free text)
   - Founder/CEO voice contribution: Heavy / Moderate / None / Explicitly avoid

5. **Batch D — constraints** (3-4 questions):
   - Regulatory regime: None / GDPR / HIPAA / FDA / SEC / FCA / ASA / Other
   - Cultural taboos and topics to avoid (free text)
   - Existing brand book / banned-word list (path or None)
   - Localisation strategy: Single locale / Multi-locale with shared voice / Per-locale voice

If the user's category is "Other" or sits outside the covered set in [references/category-adaptations.md](references/category-adaptations.md) — politics, religious organisations, defense, gaming, healthcare professional comms, adult content, sports teams, fintech-crypto — proceed to Phase 2.

### Phase 2 — Research uncovered contexts (conditional)

Spawn an Agent sub-task with this brief:

> Research current tone-of-voice norms for `<category>` brands in `<market>`. Cover: 1) typical voice attributes for the category; 2) common pitfalls and how audiences react to off-tone copy; 3) 2-3 reference brands with publicly observable voice patterns (cite primary sources); 4) regulatory, cultural, or platform constraints on voice. Report in under 700 words with sources cited inline.

For broad cross-market research (e.g. political comms across regions), spawn up to 3 parallel agents split by region or sub-category, then synthesise the findings before continuing to Phase 3.

Use the agent's output to populate the category-adaptation section of TONE.md and refine voice attributes. Footnote sources — future maintainers will need to verify when category norms shift.

### Phase 3 — Define voice (ultrathink)

Use `ultrathink` for this phase. Synthesise the discovery inputs into:

1. **NN/g 4 dimensions position** — funny/serious, formal/casual, respectful/irreverent, enthusiastic/matter-of-fact. Each is a 3-point scale. Do **not** cluster all four near midpoint — defaulting to mid-range scores produces bland, forgettable voices that fail to differentiate from category default. Lean to one side on at least three of the four dimensions.

2. **3-5 voice attributes**, each in the "X but never Y" pattern (Slack: "Confident, never cocky; Witty, but never silly"). For each, produce: one-line definition, 3 do's, 3 don'ts, 1 example sentence, 1 anti-example pulled from the brand's own past content if possible. Three is the minimum (fewer is unhelpful); five is the maximum (more is unmemorable). See [references/voice-attributes.md](references/voice-attributes.md) for the documentation pattern.

3. **Primary archetype** (optional secondary). Don't over-commit to archetype — it is a positioning shortcut, not a voice solution. Brands that lean too hard on archetype end up in cosplay (every "Hero" brand sounds the same).

4. **Tone modulation matrix** — rows are situations (launch, crisis, complaint, win, sensitive topic, routine, sales objection, layoffs/bad news, apology), columns are the channels in scope. Each cell: dominant tone + 2-3 prohibited tones. This is the operational core — downstream writers and bots consult this more than the principles narrative.

5. **Lexicon** — preferred terms (named concepts, customer noun like "members" vs "users"), banned terms (jargon, marketing clichés, exclusionary language), power words (10-30), jargon policy (when allowed for which audience), naming conventions (brand, product, features, competitors). See [references/lexicon-mechanics.md](references/lexicon-mechanics.md).

6. **Mechanics** — person (1st plural "we" / 2nd "you"), contractions (yes/no/contextual; GOV.UK avoids negative contractions because they harm non-native readers), Oxford comma, sentence length norm (general public: average 15-20 words; expert audiences may go longer), active/passive default (active unless softening a sensitive message), sentence case vs title case, emoji policy, punctuation tics (ellipses, em-dashes, exclamation marks), numerals. Same reference file.

7. **Inclusive language** — base on the Conscious Style Guide (Karen Yin) and APA Inclusive Language Guidelines. Decide gendered language policy, ability/disability terms, race, age, nationality, neurodiversity. Per market if multi-locale.

8. **Channel-specific guidance** — apply [references/channel-adaptations.md](references/channel-adaptations.md) per channel in scope, capturing hard platform constraints (character limits, format) and tonal shifts.

### Phase 4 — Write TONE.md

Use [assets/TONE-template.md](assets/TONE-template.md). Fill every section. **Section names and structure are stable** — downstream skills depend on them for parsing.

Mandatory sections (order matters for downstream pipelines):

- Context (brand, market, channels, goal)
- Voice attributes (3-5, each with do/don't/example/anti-example)
- Archetype
- NN/g 4 dimensions positioning
- Tone modulation matrix
- Lexicon (preferred, banned, power words)
- Mechanics
- Inclusive language
- Channel-specific guidance (one subsection per channel in scope)
- **Global Do's and Don'ts** (consolidated, scannable list — this is what writers paste into their context window when drafting)
- Examples library (before/after pairs)

### Phase 5 — Validate

Run these checks before finalising the file. If any fails, surface the gap and ask the user before writing the final TONE.md:

- 3-5 voice attributes — neither fewer nor more.
- Every attribute has at least one anti-example sourced from the brand's own context (not a generic placeholder like "lorem ipsum bad").
- NN/g positions don't all cluster near midpoint — at least 3 of 4 dimensions clearly off-centre.
- Banned-words list is non-empty (prevention is cheaper than prescription — without it, writers default to category clichés the brand wanted to avoid).
- One channel-specific subsection per channel in scope.
- Sample three random do's and three random don'ts and re-read: would a new writer or bot know exactly what to do tomorrow? If they're abstract, rewrite them as concrete sentences with examples.

---

## Adapt mode

For porting an existing TONE.md to a new support or channel without rebuilding the whole guide.

1. Read the existing `TONE.md`. Confirm with the user that **voice attributes do not change** — only tone modulates per channel. If the user disagrees, redirect them to SOUL.md (rebrand) or to Create mode (new TONE.md).
2. Ask target channel: LinkedIn / Twitter-X / Email / In-product UI / Podcast / Video script / Press release / TikTok / Instagram / YouTube / Sales deck / Other.
3. Ask whether to **append** a channel section to the existing TONE.md or **fork** a new `TONE-<channel>.md`. Forking is cleaner for content-factory pipelines that load one file per channel; appending keeps the master guide complete.
4. Apply the relevant section of [references/channel-adaptations.md](references/channel-adaptations.md) — each channel documents hard constraints (character limits, format, supported markdown), tonal shifts (e.g. LinkedIn dampens irreverence; TikTok rewards cadence and trend-awareness; in-product UI strips flourish), and prohibited registers.
5. Re-derive 3 do's and 3 don'ts specific to the channel. Pull from the global list but make them concrete to the medium (a do that reads "be concise" globally becomes "lead with the verb in the first 90 characters" for Twitter/X).
6. Re-do the relevant column of the tone modulation matrix.
7. Write the adapted section or new file.

---

## Important constraints

- **Voice does not change. Tone does.** If you find yourself rewriting voice attributes for a channel, stop — that's a SOUL.md change, not a channel adaptation.
- **No PDF outputs, no decorative formatting.** TONE.md is plain markdown so any downstream skill or bot can parse it deterministically. Avoid ASCII art, complex tables in voice-attribute sections, or anything that breaks markdown parsers.
- **Cite sources for research-derived claims.** When Phase 2 research informs the TONE.md, footnote the source in the category section — future maintainers will need to verify when norms shift (especially fast-moving categories like gaming and crypto).
- **Don't borrow voices wholesale.** "We want to sound like Oatly / Mailchimp / Duolingo" briefs produce derivative voices that audiences increasingly detect (especially when AI-written). Use references to triangulate, not imitate. The strategy under the style is what makes a voice work, not the surface mannerisms.
- **Banned-words lists do more work than power-words lists.** Prevention is cheaper than prescription — a writer encountering "we don't use 'leverage' (unless in the financial sense)" never reaches for it again. A power-words list, by contrast, is rarely consulted in the moment.
- **Politics, regulated industries, religious organisations, defense, healthcare professional comms, gaming, adult content, sports teams, fintech-crypto** → research first via Phase 2. Do not apply consumer-brand defaults. Each has voice norms shaped by audience, regulation, and platform that override generic guidance.
- **For multi-locale brands**, document voice per locale rather than translating from one source language. Transcreation is the standard; surface-translating English brand voice into French or Japanese produces tin-eared copy that fails the local market.

## Disclaimer

This skill is not exhaustive. The discipline of tone of voice is evolving rapidly, especially as AI-generated content shifts where differentiation lives. Refer to canonical sources for current best practice: Mailchimp's content style guide, GOV.UK's style guide, Nielsen Norman Group's _The Four Dimensions of Tone of Voice_, Karen Yin's Conscious Style Guide, Margot Bloomstein's _Trustworthy_, and the published voice guides of the brands in [references/reference-brands.md](references/reference-brands.md). Voice norms vary by category and locale; verify any pattern that surprises you against the brand's actual category and market before committing it to TONE.md.

## References

- [references/discovery-questionnaire.md](references/discovery-questionnaire.md) — full 80+ question bank, batched for the question tool
- [references/category-adaptations.md](references/category-adaptations.md) — per-category guidance and pitfalls
- [references/voice-attributes.md](references/voice-attributes.md) — attribute documentation pattern, NN/g 4 dimensions, Jung archetypes
- [references/channel-adaptations.md](references/channel-adaptations.md) — per-channel modulation rules and hard constraints
- [references/lexicon-mechanics.md](references/lexicon-mechanics.md) — preferred/banned terms, grammar conventions, inclusive language
- [references/reference-brands.md](references/reference-brands.md) — studied brand voices (Mailchimp, Slack, GOV.UK, Stripe, Duolingo, Oatly, Liquid Death, Wendy's, Patagonia, Innocent, charity:water, Linear, Notion)
- [assets/TONE-template.md](assets/TONE-template.md) — TONE.md template to fill
