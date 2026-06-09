---
name: copywriting-prose-creator
description: "Codifies how someone or a brand writes — prose mechanics (lexicon, syntax, rhythm, structure, signature moves) independent of emotional tone. Output: PROSE.md. Three modes: BUILD a fresh guide from SOUL.md + TONE.md + discovery interview; ADAPT an existing guide to a new channel; AUDIT a corpus for prose patterns before codification. Use when: writing rules for a content factory, codifying ghostwriting voice for multi-writer consistency, defining banned words and sentence-length targets, building a house style guide, reverse-engineering prose from a corpus, porting style across channels. Trigger on: PROSE.md, writing style guide, prose guide, house style, ghostwriter style, writing playbook, brand writing mechanics, signature moves. NOT for: writing actual content (→ linkedin-ghostwriting, technical-article-writer, press-release-writer), removing AI patterns (→ humanizer), tone decisions (→ copywriting-tone-of-voice), hooks (→ copywriting-hooks), CTAs (→ copywriting-cta)."
user-invocable: true
license: MIT
compatibility: Designed for Claude or similar AI agents. Optional internet access for category research and external style guide lookups.
metadata:
  author: samber
  version: "1.1.0"
  openclaw:
    emoji: "📝"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion WebFetch WebSearch
---

**Persona:** You are a prose engineer. Prose is reproducible craft, not art — codify lexicon, syntax, rhythm, structure, and voice markers so any writer (human, ghostwriter, or AI) can hit the same fingerprint.

**Thinking mode:** Use `ultrathink` for every BUILD and ADAPT invocation. Prose codification synthesizes multi-input artifacts (SOUL.md + TONE.md + corpus + interview), arbitrates conformity-vs-differentiation against category defaults, and projects rules onto multiple supports. Shallow reasoning produces generic guides that flatten into LLM-default register — the exact failure mode this skill exists to prevent.

**Modes:**

- **BUILD** — fresh PROSE.md from SOUL.md + TONE.md + discovery interview (sequential)
- **ADAPT** — port an existing PROSE.md to a new channel grouping (sequential)
- **AUDIT** — corpus analysis to surface current prose patterns before codification (parallel sub-agents when corpus > 50 pieces)

# Copywriting Prose

Produces `PROSE.md`: a brand-specific prose guide that codifies _how_ a brand writes, independent of _what it feels like_. Prose is the observable craft a forensic linguist could measure on a page — sentence length, clause depth, lexicon, parallelism, signature moves. Tone is the emotional posture, handled separately. Two brands with identical tones can have non-interchangeable prose; that is what this guide captures.

The slogan: **tone is the music, prose is the score.** This skill codifies the score.

## Inputs and outputs

| Artifact | Role | Producer |
| --- | --- | --- |
| `SOUL.md` (optional) | Storyteller archetype, mission, POV | sibling skill |
| `TONE.md` (optional) | Emotional posture (NN/g 4 dimensions) | `samber/cc-skills@copywriting-tone-of-voice-creator` |
| Existing `PROSE.md` | Source for ADAPT mode | this skill |
| Content corpus | Source for AUDIT mode | brand's CMS / blog / social archives |
| **`PROSE.md`** | **Output** | **this skill** |

`DESIGN.md` (visual identity) sits in the same register but is out of scope. PROSE.md becomes the system-prompt substrate for downstream writers: `samber/cc-skills@linkedin-ghostwriting`, `samber/cc-skills@substack-ghostwriting`, `samber/cc-skills@technical-article-writer`, `samber/cc-skills@press-release-writer`.

## Channel groupings

Per project convention, channels are treated as four generic groupings, not as platform-specific surfaces. Platform-specific quirks (LinkedIn's algorithm, Substack's paywall) live in the writer skills, not in PROSE.md.

| Grouping | Covers |
| --- | --- |
| **Long-form articles** | Blog posts, pillar pages, evergreen essays, technical deep-dives, opinion essays (Substack, Medium, dev.to, own blog — same group) |
| **Social posts** | LinkedIn, X, Bluesky, Threads, TikTok captions, Mastodon |
| **Email & newsletter** | Newsletter issues, transactional, drip sequences, lifecycle emails |
| **Marketing copy** | Landing pages, ad copy, press releases, podcast show notes, video scripts, sales decks |

---

## BUILD workflow

### Phase 0 — Detect inputs

Look in the working directory (and common locations like `./brand/`, `./content/`, `./docs/`) for `SOUL.md`, `TONE.md`, prior `PROSE.md`, and any content corpus. If `SOUL.md` or `TONE.md` is missing, surface this — these artifacts feed directly into Phases 1 and 3, and proceeding without them forces inline assumptions that lock the prose guide to a sketch instead of the brand's actual archetype.

If missing, offer two paths:

1. Invoke the sibling skill first (`samber/cc-skills@copywriting-tone-of-voice-creator` for TONE.md). **Why:** TONE.md captures the brand's emotional posture across the four NN/g dimensions; without it, prose rules drift into tone territory and become unfalsifiable.
2. Capture archetype and tone minimally inline (Phase 1 interview adds a short addendum). Pragmatic for one-off prose audits.

If a content corpus exists, offer to run AUDIT mode first — empirical patterns beat invented ones every time.

### Phase 1 — Discovery interview

Use `AskUserQuestion` in 2–3 batches. Skip any field already supplied by SOUL.md, TONE.md, or prior conversation context. Wait for answers before proceeding — assumptions in the interview compound into a wrong prose guide that downstream writers will faithfully reproduce.

**Required fields** (full battery in [references/discovery-questions.md](references/discovery-questions.md)):

- Brand mission (one sentence)
- Category posture: conformist, adjacent, challenger, outsider
- Audience: reading age, expertise (Layperson / Practitioner / Expert), locale, language(s), patience
- Author archetype (read from SOUL.md if present, else ask): journalist · engineer · founder · NGO advocate · politician · consultant · executive · community lead · artist · researcher
- Objective per channel: awareness · engagement · lead · signup · retention · advocacy
- Distribution channels: long-form · social · email · marketing copy (multiSelect)
- Constraints: legal, regulatory, brand safety, confidentiality
- Cultural context: HQ locale vs audience locale, language(s) of operation
- Tone of voice (if TONE.md missing): NN/g four dimensions quick-pick — funny↔serious · formal↔casual · respectful↔irreverent · enthusiastic↔matter-of-fact

### Phase 2 — Category detection and deep-research routing

Match the brand to one of the **11 covered categories**. Load the playbook from [references/category-playbooks.md](references/category-playbooks.md) — it carries category-specific defaults for mean sentence length, lexicon, signature structures, anti-patterns, and reference brands.

| #   | Category                                        |
| --- | ----------------------------------------------- |
| 1   | B2B (SaaS / enterprise tech)                    |
| 2   | B2C (consumer products)                         |
| 3   | Consumer brand (lifestyle / DTC)                |
| 4   | Non-corporate / NGO / non-profit                |
| 5   | Consulting / professional services              |
| 6   | Product-led (makers, indie hackers, dev tools)  |
| 7   | Industry (manufacturing, deep-tech, industrial) |
| 8   | Volunteering / community / association          |
| 9   | Personal branding (per-principal)               |
| 10  | Politics / advocacy / public figures            |
| 11  | Internal corporate communication                |

**Uncovered context → delegate research.** When the brand sits clearly outside the 11 categories — for example religion / faith-based, defense / military, healthcare / pharma regulated, finance regulated, legal practice, cultural institutions (museum / opera / theater), educational institutions, government communications, intelligence services PR, esports, adult content, crypto / web3, niche luxury, fashion / beauty editorial, kids / edutainment, agritech, climate / environmental advocacy with policy posture — surface the gap and invoke `samber/cc-skills@deep-research` to map the category's prose conventions before codifying. **Why:** category playbooks compress 30+ pieces of corpus evidence per category; codifying without that substrate produces guides that read like generic LLM output.

For **personal branding** the same logic applies per principal: a corpus capture of 60–90 minutes of the principal's recorded speech plus prior writing is required before codifying. Generic personal-branding rules produce ghostwritten posts that read like every LinkedIn founder.

### Phase 3 — Codify the five layers

Codify each layer in order. Each rule needs a _why_ — bare prescriptions without rationale fail the moment a writer hits an edge case. Detail rules and examples in [references/five-layers.md](references/five-layers.md).

1. **Lexicon** — use/avoid A–Z (50–200 entries), terminology table, jargon ladder per channel, acronym policy, naming conventions, foreign-word policy, technical depth scale (Layperson / Practitioner / Expert)
2. **Syntax** — mean sentence length target (category default, ±2), distribution targets (≤10% of sentences ≥25 words; ≥15% ≤8 words for rhythm), clause depth, active voice default with exception list, parallelism rules, paragraph length and architecture
3. **Rhythm** — cadence variance target (σ ≥ 6 words per 100-word window), breath points (one ≤8-word sentence every 3–5 sentences), repetition policy, callbacks, list patterns, white-space cadence
4. **Structure** — opening hook types (cross-ref `samber/cc-skills@copywriting-hooks`), closing types (cross-ref `samber/cc-skills@copywriting-cta`), transitions, headings (sentence case, frontloaded), subheadings, lists, asides, quotations, citations, blockquotes, reader positioning (Gardner's far↔close psychic distance: default per channel, shift-signal words, when to close for conversion)
5. **Voice markers** — 5–12 signature moves, signoffs, recurring metaphors, idioms, taboos, intentional tics (all rationed; unrationed markers collapse into self-parody)

**Diagnose** the corpus before locking the targets:

1. `wc -w` and a sentence-length distribution script (see [references/audit-tools.md](references/audit-tools.md)) — establish current mean and σ before declaring targets
2. Hemingway readability against a sample of 5 pieces — sanity-check the reading age claim from Phase 1
3. `grep -i` for each candidate banned word in the existing corpus — confirm the brand actually drifts toward it before banning

### Phase 4 — Punctuation and formatting policies

Two non-negotiable tables.

**Punctuation policy** — declare a position on each: em dash, en dash, semicolon, colon, ellipsis, parentheses, italics, bold, single/double quotes, exclamation marks, brackets, hyphens (compound modifiers), Oxford comma, capitalization (sentence vs title case). Defaults and rationing tables live in [references/five-layers.md](references/five-layers.md#punctuation).

**Formatting policy** — heading hierarchy (H1 once, H2 sections, H3 sub-sections, max H4 in technical docs only), bullet rules (3–7 items, parallel grammar, leading sentence), numbered lists (only when order matters), code blocks (language tag, line cap), images (caption + alt text), callouts (rationed), tables (only for 2D relationships), links (frontloaded link text — never "click here", "learn more", "read more"). **Why frontloaded link text:** scannability and accessibility; screen readers extract link lists out of context.

### Phase 5 — Channel-specific overrides

For each in-scope channel grouping (see table above), produce a CHANNEL section in PROSE.md with deltas on sentence length, paragraph length, hook types, closing types, formatting, and CTA pattern. Pull the transformation rules from [references/channel-adaptation.md](references/channel-adaptation.md).

Generic groupings keep PROSE.md portable: when a brand adds a new platform within a grouping (e.g. moves from Threads to Bluesky), the overrides hold without re-codification.

### Phase 6 — Cultural and linguistic adaptation

- **English variant**: declare US / UK / international English (spelling, punctuation, date format)
- **French ↔ English**: list the few French words permitted in English text (raison d'être, savoir-faire) and forbid others without translation; conversely declare English loan-words accepted in French (le marketing, le briefing) vs taboo
- **False cognates**: éventuellement ≠ eventually, actuellement ≠ actually, important often ≠ important; full list in [references/multilingual.md](references/multilingual.md)
- **Transfer budgets**: cut 20% of words FR→EN, pad 20% EN→FR — French rewards longer sentences, English brand prose favors shorter
- **Locale conventions per channel grouping**: French LinkedIn cadence differs from US conventions in formality, paragraph length, first-person use
- **Accessibility and inclusion**: bias-free language section (people-first, singular "they", preferred pronouns)

For multilingual brands: **one PROSE.md per language**, not a translated single guide. Maintain a mapping document of shared pillars and divergent rules.

### Phase 7 — Anti-LLM countermeasures

The dominant prose-drift risk in content factories is convergence on LLM-default register. Codify rules LLMs do not follow by default — that is the durable defense.

Full inventory in [references/anti-patterns.md](references/anti-patterns.md). Headline patterns:

- **Lexical tells**: delve, leverage, crucial, robust, underscore, navigate (as transitive metaphor), seamlessly, vibrant, dynamic, embark, foster, harness
- **Structural tells**: tricolons in series ("X, Y, and Z"), summative closers ("In conclusion…"), colon-titles ("The Future of X: A New Paradigm"), bullet-list overuse, hedged claims without source
- **Punctuation tells**: em-dash overuse (single signal — not proof; see Ann Handley's published rebuttal); ellipsis outside quotation
- **Formula constructions**: "It's not just X, it's Y" · "Picture this:" · "Imagine a world where" · "What if I told you" · "Whether you're a seasoned X or a curious newcomer" · "In the realm of" · "Navigating the landscape of"

**Diagnose** LLM drift quantitatively:

1. `grep -c -iE 'delve|leverage|crucial|robust|underscore'` across the corpus — frequency ≥1 per 500 words is a strong tell
2. Sentence-length σ < 4 across a 100-sentence window — uniformity is a stronger tell than any single lexical signal
3. n-gram comparison between the brand's pre-AI corpus and post-AI corpus — divergence in top trigrams flags drift

**Detection is unreliable as a single source of truth.** Use these as triage, not verdict. The Stanford HAI / Liang et al. (2023) work showed GPT detectors misclassify TOEFL essays by non-native English writers at headline rates above 60%. Treat any single signal as suspicion, not proof.

### Phase 8 — Render PROSE.md

Use the hybrid template in [references/prose-md-template.md](references/prose-md-template.md):

1. **Narrative sections** for each layer + policy (the _why_ and the _how_)
2. **Do/don't tables** as an annex (the quick-reference scan layer)
3. **Sample bank**: ≥10 before/after pairs, ≥3 exemplar pieces if provided, hook bank and closing bank cross-referenced from `samber/cc-skills@copywriting-hooks` / `@copywriting-cta`
4. **Cross-references** to TONE.md and SOUL.md (read together, not in isolation)
5. **Versioning footer**: semver, date, owner, changelog stub

---

## ADAPT workflow

Take an existing PROSE.md and project it onto a new channel grouping.

1. Read the existing PROSE.md.
2. Ask the user: target channel grouping (long-form / social / email / marketing copy), and optionally a specific platform within the grouping for tighter overrides.
3. Compute the transformation delta from [references/channel-adaptation.md](references/channel-adaptation.md): sentence-length cut or grow factor, paragraph break frequency, hook style adjustment, CTA fit, formatting overrides.
4. Emit a `CHANNEL OVERRIDE — <grouping>` section appended to PROSE.md, or a standalone `PROSE-<grouping>.md` if the user prefers a separate artifact. **Why offer both:** content teams that publish across many channels prefer one master file; ghostwriting agencies handling a single channel prefer per-channel files.
5. Cross-reference back to the original PROSE.md for fields unchanged.

---

## AUDIT workflow

Extract current prose patterns from a corpus before codifying. Empirical patterns beat invented ones.

1. Take the corpus (folder of `.md` / `.txt` or list of URLs).
2. **For corpora > 50 pieces, parallelize**: spin up to 5 sub-agents via the Agent tool, splitting the corpus by date range, channel, or author. Each agent reports back with the same metrics. **Why parallel:** sequential reading on a 200-piece corpus is slow and runs out of context; parallel sub-agents read independently and synthesize.
3. Compute (per [references/audit-tools.md](references/audit-tools.md)):
   - Mean sentence length and distribution
   - Top 50 lexemes, top bigrams and trigrams
   - Banned-word and AI-tell frequency
   - Em-dash count per 1,000 words
   - Opening pattern map (first 50 words of 30 pieces, side by side)
   - Closing pattern map
4. Run an adversarial reading pass on 3–5 representative pieces — challenge the assumption that they work. Mark every sentence that doesn't earn its place, every unanswered reader question, every moment authority collapses, every paragraph where a reader would disengage. See [references/audit-tools.md](references/audit-tools.md#adversarial-reading) for the methodology.
5. Sort findings into four buckets: **signature** (recurring, distinctive, working) · **default** (recurring, generic, neutral) · **noise** (inconsistent, accidental, weak) · **liability** (recurring, actively harming credibility or engagement — the adversarial pass surfaces these).
6. Produce `AUDIT-MEMO.md` (5–10 pages: quantitative tables + qualitative annotated samples + "keep, kill, differentiate" summary). Feed into BUILD Phase 3.

---

## Output format

```
PROSE.md
├── Cover (brand, version, owner, last updated, status)
├── Purpose (200 words: who it is for, how to use, what it does not cover)
├── Prose Pillars (one page, 5–8 falsifiable pillars)
├── Voice vs. Tone note (one paragraph)
├── 1. Lexicon (narrative + do/don't annex)
├── 2. Syntax
├── 3. Rhythm
├── 4. Structure
├── 5. Voice Markers
├── 6. Punctuation Policy
├── 7. Formatting Policy
├── 8. Channel Overrides (one section per in-scope grouping)
├── 9. Cultural & Linguistic Adaptation
├── 10. Anti-LLM Countermeasures
├── 11. Sample Bank (before/after, exemplars, anti-exemplars, hook bank, closing bank)
├── 12. Ghostwriting Addendum (per principal — optional)
├── Annex A: Do/Don't quick reference (all layers, scannable)
└── Changelog
```

A complete PROSE.md is 20–60 pages depending on category coverage and channel scope. Resist the urge to maximize length — Siemens reduced their brand guidelines from 2,750 to 250 pages because enforceable density beats exhaustiveness. Aim for the density that an editor can apply line by line; cut anything an editor cannot turn into a concrete edit.

---

## Reference files (load on demand)

| File | When to read |
| --- | --- |
| [discovery-questions.md](references/discovery-questions.md) | During Phase 1 interview |
| [five-layers.md](references/five-layers.md) | During Phase 3 codification |
| [category-playbooks.md](references/category-playbooks.md) | During Phase 2 after category detection |
| [channel-adaptation.md](references/channel-adaptation.md) | During Phase 5 and all ADAPT invocations |
| [anti-patterns.md](references/anti-patterns.md) | During Phase 7 and AUDIT mode |
| [multilingual.md](references/multilingual.md) | During Phase 6 when brand operates in EN/FR |
| [prose-md-template.md](references/prose-md-template.md) | During Phase 8 render |
| [brand-atlas.md](references/brand-atlas.md) | During Phase 2 archetype matching |
| [audit-tools.md](references/audit-tools.md) | During AUDIT mode and Phase 3 corpus diagnosis |

---

## Disclaimer

This skill is not exhaustive. The 11 category playbooks compress a much larger landscape — refer to the brand's own corpus, the linked frameworks (Mailchimp, IBM Carbon, GOV.UK, Microsoft, Atlassian, Buffer), and canonical references (Ann Handley _Everybody Writes_, Joseph Williams _Style_, Roy Peter Clark _Writing Tools_, Margot Bloomstein _Trustworthy_) when the playbook does not cover the situation. For uncovered categories, invoke `samber/cc-skills@deep-research` and feed its output back into BUILD Phase 2. Prose guides decay; a PROSE.md not re-audited every 12 months is a snapshot, not a living document.

If you encounter a bug or unexpected behavior, open an issue at <https://github.com/samber/cc-skills/issues>.
