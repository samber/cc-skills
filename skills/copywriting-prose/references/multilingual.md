# Multilingual Prose

For brands operating across languages (especially EN/FR — the dominant case for France-based operators). The core rule: **one PROSE.md per language**, not a translated single guide. Codify each language natively; maintain a mapping document of shared pillars and divergent rules.

## Why per-language guides

A translated guide propagates the source language's rhythm into the target. French sentence structure produces long sentences with subordinate clauses; English brand prose typically favors shorter sentences. A French→English translation that preserves sentence boundaries reads as labored English. An English→French translation that preserves the original mean sentence length reads as choppy French.

The standard is to **retarget, not translate**. Translators must follow the target-language guide as if writing fresh.

## EN variant declaration

Declare one of: **US English** · **UK English** · **International English**. The choice affects:

| Dimension | US | UK | International |
| --- | --- | --- | --- |
| Spelling | -or, -ize, color | -our, -ise, colour | -or, -ize (Microsoft default) |
| Date format | MM/DD/YYYY or "March 5, 2026" | DD/MM/YYYY or "5 March 2026" | YYYY-MM-DD (ISO) |
| Single vs double quotes | Double | Single | Double (more globally readable) |
| Comma in dates | "March 5, 2026" | "5 March 2026" | "2026-03-05" |
| Decimal separator | Period (3.14) | Period (3.14) | Period (3.14) |
| Thousands separator | Comma (1,000) | Comma or space (1,000 / 1 000) | Space (1 000) |
| Time format | 12h with AM/PM | 24h or 12h | 24h |

## EN ↔ FR word-policing

### French words permitted in English brand text

A small whitelist. Adding French outside this list usually reads as affectation:

- **Permitted (no italics, no translation)**: raison d'être, savoir-faire, joie de vivre, cliché, café, salon, genre, milieu, élite, fiancé(e), résumé (US) / CV (UK), déjà vu, faux pas, par excellence
- **Permitted with italics on first use**: avant-garde, à la carte, en route, in vino veritas
- **Banned without translation**: parcours (use "journey" or "path"), dispositif (use "system" or "framework"), enjeu (use "stake" or "issue"), accompagnement (use "support"), démarche (use "approach"), mise en œuvre (use "implementation")

### English loan-words accepted in French brand text

French anglicisms cluster around marketing / tech vocabulary. Pick a position:

- **Permissive (tech, marketing, consulting brands)**: le marketing, le briefing, le manager, le pitch, le brainstorming, le storytelling, le timing, le mailing
- **Restrictive (cultural institutions, traditional consumer brands, government)**: replace with French equivalents (le brief → la note, le pitch → la présentation, le marketing → la mercatique [rarely used in practice — fallback to context-specific])
- **Banned outright in any French brand text**: addressing, deliverables, leverager, prioritiser (use prioriser), implémenter (use mettre en œuvre or réaliser), supporter (use prendre en charge)

## False cognates EN ↔ FR

The frequent traps for ghostwriting and translation. Reproducing the false cognate is a single-sentence credibility kill for bilingual readers.

| French word | What writers think it means | What it actually means |
| --- | --- | --- |
| éventuellement | eventually | possibly, perhaps |
| actuellement | actually | currently, right now |
| important | important | often: large, significant in size |
| sensible | sensible | sensitive |
| déception | deception | disappointment |
| location | location | rental |
| librairie | library | bookstore |
| journée | journey | day |
| assister | to assist | to attend |
| supporter | to support | to bear / tolerate / put up with |
| prétendre | to pretend | to claim |
| achever | to achieve | to complete / finish |
| réaliser | to realize | to make / produce / accomplish |
| consister | to consist | "consister à" + verb = to involve doing |
| demander | to demand | to ask |
| habit | habit | clothing (an outfit) |
| chair | chair | flesh |
| coin | coin | corner |
| pain | pain | bread |
| chance | chance | luck |
| sensible (the other way too) | EN word | FR translation: rationnel, raisonnable |

## Syntactic transfer rules

The **transfer budget** corrects rhythm differences between languages.

| Direction | Adjustment |
| --- | --- |
| FR → EN | Cut 20% of words. French sentences carry more subordinate clauses; English brand prose breaks them. |
| EN → FR | Pad 20% of words. French rewards more developed sentences with explicit connectors. |
| FR → EN | Replace nominal-heavy French ("la mise en œuvre du dispositif") with verbal English ("we deploy the system"). |
| EN → FR | Restore some nominalization for register, especially in B2B and consulting. |

## Regionalisms and global English

Declare neutral international English when audiences are global; reserve UK or US idioms for matching audiences. Common traps:

- **US-only**: "out of the gate", "ballpark figure", "touch base", "rain check"
- **UK-only**: "knackered", "having a chinwag", "spot on"
- **Avoid in international**: idiom-heavy sports metaphors (cricket, baseball, American football)

## French regional variants

French differs across:

- **Hexagonal French** (France) — default for France-based brands
- **Belgian French** — septante / nonante for 70 / 90 (vs soixante-dix / quatre-vingt-dix); some lexical differences
- **Swiss French** — septante, huitante, nonante; different terminology in retail / banking
- **Québécois French** — significantly different vocabulary (courriel for email, magasiner for shop); different anglicism policies; English borrowings often resisted strongly
- **African French** — multiple variants; significant local lexicon

Declare which variant. A French brand expanding into Québec should not assume Hexagonal French passes.

## Cultural references

- **Safe references** (cross-cultural): sports for athletes generally, food and seasons, holidays that are local-relevant only when audience matches
- **Forbidden for global audiences**: region-specific jokes (US Super Bowl, French baccalauréat), political references, religious holidays as default context

## Accessibility and inclusion

- **People-first language**: "people experiencing X" over "the X"
- **Singular they** (EN) — established convention since at least 1375, codified by Microsoft, Mailchimp, GOV.UK, Atlassian
- **French inclusive writing** — declare a position. Three common levels:
  1. **Conservative**: masculine generic ("les développeurs"), historic French Academy default
  2. **Inclusive parentheses**: "les développeurs(euses)" — readable, contested
  3. **Median point**: "les développeur·euse·s" — politically loaded in France; banned in government communication since 2017; accepted in some progressive brand contexts; not all screen readers handle it gracefully
- **Bias-free language section**: maintain a banned-word list for stigmatizing terms (per Microsoft, Mailchimp templates)

## Translation workflow recommendation

When a brand operates in multiple languages:

1. **Author in the dominant language** (usually the brand's HQ language).
2. **Translator-as-writer**: never use literal translation as published content. The translator must follow the target-language PROSE.md.
3. **Terminology table is bilingual**: one canonical term per language, mapped.
4. **Idiom and metaphor list per language**: do not translate idioms; substitute equivalent register.
5. **False-cognate list per language pair**: maintained in PROSE.md annex.
6. **Channel conventions differ across cultures**: LinkedIn convention in France differs from US conventions in formality, paragraph length, first-person use. Codify per locale.

## Mapping document

When multiple language guides exist, maintain `PROSE-MAPPING.md` documenting:

- Shared pillars (the brand's voice principles that hold across languages)
- Divergent rules (where each language guide departs)
- Terminology mappings
- Cross-references for idioms and metaphors
