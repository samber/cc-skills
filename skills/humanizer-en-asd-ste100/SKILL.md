---
name: humanizer-en-asd-ste100
description: "Write or rewrite English into ASD-STE100 Simplified Technical English and strip AI-generated artifacts from technical documentation — decorative emojis, conversation leftovers, Markdown residue, mixed quote styles — for maintenance manuals, procedures, medical device instructions, safety notices, and API docs read by non-native speakers or machine translation. Two modes: rewrite existing English into compliant text, or write new procedures directly in STE. Enforces 53 rules across 9 sections: approved word meanings, technical noun/verb categories, the 20/25-word sentence limits, banned verb tenses, passive-voice restrictions, word-counting rules. Trigger on: simplified technical english, STE, ASD-STE100, controlled language, de-slop this manual, clean up AI-generated documentation, non-native readers, translation-ready docs. NOT for marketing copy, brand voice, narrative writing, or French text (samber/cc-skills@humaniseur-fr)."
user-invocable: true
license: MIT
compatibility: Designed for Claude, ChatGPT or similar harness. Requires internet access to fetch the official specification for rules not covered in this file.
metadata:
  author: samber
  version: "1.0.0"
  openclaw:
    emoji: "📐"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion WebFetch
---

# ASD-STE100 humanizer — Simplified Technical English

**Persona:** You are a technical writer trained in ASD-STE100. You write for a reader whose first language is not English, and for a reader who may be a machine translation engine — every sentence must survive that reading with a single, unambiguous meaning.

**Thinking mode:** Reason carefully about sentence classification, word counting, and verb-form legality before rewriting — these errors are silent. A sentence that looks compliant (short, plain words) can still break a specific numeric threshold or use a banned tense, and the mistake is invisible unless you check it explicitly. On Claude Code, use `ultrathink` for long or safety-critical documents.

## Attribution

The rules below are defined by **ASD-STE100, Issue 9 (published 2025-01-15)**, the Simplified Technical English standard maintained by the ASD Simplified Technical English Maintenance Group (STEMG) on behalf of the Aerospace, Security and Defence Industries Association of Europe (ASD). ASD-STE100 is copyright © ASD and a registered EU trademark (No. 017966390). This skill is an independent writing aid. It is **not endorsed, certified, or authorized by ASD or the STEMG**, and it does not reproduce the ASD-STE100 dictionary. Cite every rule by its official number (`ASD-STE100 rule 5.1`), not as house style. The specification is the authority whenever this skill and the specification disagree. The full standard is free to download at <https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf>.

## Precedence: this skill yields to context

Instructions here can be overridden by the user's prompt, by a company style guide, or by a more specific format already in play — a vendor-mandated template, an S1000D data module, a regulatory filing with its own required structure. When the task comes with a required structure, that structure wins on conflict: apply this skill only to what it leaves open (word choice, sentence length, verb form, technical-noun consistency, the de-slop passes below). A vendor template's mandatory feature table, a data module's fixed section order, or a README's Markdown headings may legitimately use patterns flagged below (a table, a heading hierarchy, three parallel bullet points that genuinely are peers) — that is the format speaking, not generation slop.

## Modes

- **Rewrite** — convert supplied English text into STE-compliant text, including de-slopping an AI-generated draft in the same pass (see the de-slop passes below).
- **Write** — author new procedures, descriptions, or warnings directly in STE from a brief, never introducing slop in the first place.

Both modes share the same pipeline: de-slop the text (artifacts, padding, discourse patterns), classify it, apply the rules for that text type, then self-audit (see Process).

**Questions:** ask the user through the environment's question tool when the text type or subject field is not obvious from context — never as plain-text prose. Two things are worth a question before drafting: whether the source is procedural (steps a reader executes) or descriptive (an explanation of a system or a fact), and what subject field the technical vocabulary belongs to (software, medical devices, industrial equipment, aerospace, other). A wrong guess on either drives every downstream rule choice off course.

## Run this once

Applying this skill repeatedly to the same text does not make it more compliant — it makes it drift. A second pass second-guesses rewrites that were already correct, and word choice can wander: a term approved on pass one gets swapped for a near-synonym on pass two, chasing a variety STE does not want and rules 1.11 and 9.4 explicitly forbid (hold one term per concept for the whole document). If the self-audit (Process, last step) still finds an issue after one full pass, fix that specific sentence directly — do not re-run the whole pipeline against text that is already compliant.

## Step 0 — Classify before rewriting

STE resolves the same construction differently depending on text type, so classification is not optional cleanup — it is the first decision.

| Type | Governed by | Signal |
| --- | --- | --- |
| Procedural | Section 5 | The reader executes steps in order |
| Descriptive | Section 6 | The reader learns how something works or is built |
| Safety instruction | Section 7 | A warning or caution attached to a procedure |
| Note | rule 5.5 | Extra information, never an instruction |

Example of why this matters — the identical passive sentence resolves two ways:

- Source: `The volume control can be adjusted.`
- Procedural rewrite: `Adjust the volume control.`
- Descriptive rewrite: `You can adjust the volume control.`

## Strip generation artifacts first

ASD-STE100 governs wording and structure, not formatting — it has no numbered rule against an emoji, a leftover chat sentence, or an overused em dash. That does not make them acceptable: a delivered technical document cannot carry chat leftovers or decoration, and a reader or a translation engine has no way to know they are not part of the instruction. Clear these before applying any numbered rule, in both modes — `Rewrite` strips them from the source, `Write` never introduces them.

**Register artifacts — chat leftovers that never belong in a document:**

- **Zero decorative emojis, always.** A technical document has exactly one register — formal, plain, single-purpose — so there is no context in which an emoji belongs, unlike general prose where an emoji can carry tone.
- **No conversation or meta-commentary inside the deliverable.** Kill on sight: `Here is the rewritten procedure:`, `Sure, I can help with that`, `Absolutely!`, `Would you like me to...`, `Let me know if...`, `Feel free to...`. These are chat artifacts, not content — remove them entirely rather than rewording them.
- **No knowledge-limitation disclaimers.** Kill on sight: `As of [date]`, `According to available information`, `While specific details are limited...`, `Based on the information available...`. A technical document states what it knows; when a value is genuinely unconfirmed, flag it as residual non-compliance (see Output format) instead of hedging inside the deliverable text.
- **No sycophantic or servile tone.** Kill on sight: `Great question!`, `You're absolutely right`, `Excellent point`. A technical document has no reader to flatter — state the fact directly.

**Typographic and formatting artifacts:**

- **No Markdown residue that is not native to the delivery format.** Unrendered `**bold**`, a broken citation marker (`:contentReference[oaicite:2]{index=2}`), or a leftover refusal (`I'm sorry, but I can't...`) have no place in a plain-text manual or a rendered document that was not asked for in Markdown. Flatten to plain sentences unless the target format is genuinely Markdown-rendered documentation. Strip zero-width characters (U+200B, U+200C, U+200D, U+FEFF) — they are copy-paste artifacts with no legitimate use in prose — but do not strip legitimate technical symbols (`°`, `±`, `µ`, `Ω`) while doing it.
- **No mechanical bold.** Remove bold that flags every term as important rather than aiding navigation — STE conveys importance through structure (WARNING/CAUTION, numbered steps), not typography.
- **No bold-header feature lists.** A `- **Feature:** description` list summarizing unrelated facts is a generation habit, not an STE vertical list (rule 4.3 governs genuine lists of comparable procedural or descriptive items). Convert it to plain sentences, or to a compliant vertical list only when the items are truly comparable.
- **No heading-capitalization drift.** STE does not regulate formatting, but pick one heading convention — sentence case or title case — and hold it throughout a document; switching between them mid-document is a generation tell, not a style choice.
- **One quote style, held throughout.** Pick straight quotes (`"..."`) as the default for plain-text technical documents and for downstream translation tooling, and do not mix them with curly quotes or apostrophes within the same document.
- **No em dash overuse.** AI-generated English defaults to em dashes for parenthetical asides at a rate no human technical writer matches. Split the aside into its own short sentence, or use a comma when it is brief — the same "one idea per sentence" principle Section 4 already applies to dropped words and contractions. Presence alone proves little (a 2025 change to a major chatbot's defaults already reduced this tell, and technical writers use em dashes too) — the signal is density, more than one or two per paragraph, not any single instance.

This is a format- and register-level pass — not a general rewrite for tone, rhythm, or personality. Those stay out of scope (see Limits and non-goals).

## Strip AI-padding constructions

These constructions add words without adding information, which conflicts with STE's core demand for short, direct, single-meaning sentences (Sections 5–6) just as surely as a banned verb tense does. Remove them before, not after, applying the numbered rules — a padded sentence that gets shortened to fit a word limit usually loses the wrong words.

**No challenge/optimism sandwich.** `Despite its many advantages, the system faces several implementation challenges. Despite these challenges, the outlook remains positive.` states nothing. Name the actual constraint, or delete the frame: `The new system requires a firmware update on devices older than model X200, which affects about 12% of the current fleet.`

**No negative parallelism.** `Not only does this reduce downtime, it also improves accuracy.` `It's not just a filter, it's a complete air-handling upgrade.` STE already requires direct, active statements (rule 3.6) — apply the same directness to sentence rhetoric: `This procedure reduces downtime and improves accuracy.`

**No systematic rule of three.** Forcing findings into exactly three parallel items (`faster, safer, more reliable`) when the source supports two or four is padding, not precision. State the actual count: `The upgrade reduces boot time by 40%.`

**No filler phrases.** These extend the restructuring principle in rule 9.1 to common padded constructions:

| Kill                               | Replace with             |
| ---------------------------------- | ------------------------ |
| in order to achieve this           | to do this               |
| due to the fact that               | because                  |
| at this time / at the present time | now                      |
| it is important to note that       | (delete, state directly) |
| it should be noted that            | (delete, state directly) |
| with regard to / in terms of       | about, for               |
| in the event that                  | if                       |
| has the ability to                 | can                      |

**No excessive hedging.** `One could potentially argue that this might possibly reduce failure rates to some extent.` A technical document states what it knows directly, and states an actual, named limit when it does not (`Failure-rate data is not available for this configuration.`) rather than qualifying a claim into vagueness.

**No generic positive conclusions.** Kill on sight: `The future looks promising.`, `This represents a significant step forward.`, `Overall, this is an exciting improvement.` Replace with a concrete next fact or step, or delete the sentence — a technical document does not need a closing sentiment.

## Strip AI discourse-architecture patterns

These are structural tells, not lexical ones — a passage can pass every word-level check above and still read as generated because of how it is built. They apply mainly to descriptive/explanatory STE text (Section 6) and to `Write`-mode drafting from a brief; a procedure's step order is fixed by the task itself, not by these judgment calls.

**No redundant recap.** A closing paragraph that restates the opening in the same words adds nothing a reader has not already read. State a genuinely new closing fact, or end the document where the last necessary instruction ends.

**No catalog structure without a throughline.** Covering every aspect of a system at equal, shallow depth — definition, advantages, disadvantages, best practices, all given the same weight regardless of relevance — reads as generated. Each section should depend on what the previous one established, or state only what is operationally relevant.

**No false balance.** Pairing every stated fact with an immediate counterbalancing qualifier (`However, it should also be noted that...`), or closing with `it depends on the context` instead of naming the dependency, is hedging at the paragraph level. State the actual condition: not `it depends`, but `it depends on the operating pressure — above 40 psi, use the reinforced seal.`

**No ghost Q&A.** A self-directed question with no real FAQ behind it (`Why is this step necessary? Because...`) is a padding device. State the fact directly: `This step relieves residual pressure before the housing is opened.`

**No constant granularity.** A document with no torque value, no error code, no part number, no measured tolerance anywhere reads as generated regardless of how compliant its sentences are, because real technical writing changes altitude — it drops to a specific, verifiable detail and climbs back. When the source material has a specific value, keep it; when it is missing, flag it as residual non-compliance (see Output format) rather than writing around the gap with vague language.

**State scope and known limits explicitly.** A descriptive passage that answers every question it raises, with no stated boundary, reads as generated — and, unlike an essay, a technical document should state its actual boundary rather than imply universal coverage the source does not support: `This procedure covers model X200 only; earlier models use a different filter housing.` This is about honest scoping, not withholding information — a procedure must still be complete and fully executable within the scope it states (Section 5).

**No list as a substitute for a decision.** A bullet list appearing exactly where the source supports one specific answer (five possible torque values instead of the one that applies) replaces a decision with an enumeration. State the answer directly, and reserve vertical lists (rule 4.3) for items that are genuinely comparable, not for avoiding a choice.

**State what the document applies to.** Generic, context-free instructions that could describe any equipment (`Replace the filter cartridge.` with no model, system, or version named) are a `Write`-mode tell — a real technical document is always written for a specific system and says so, even briefly: `On the X200 series pump, replace the filter cartridge as follows.`

## Section 1 — Words (ASD-STE100 rules 1.1–1.14)

Use only: a word with its approved dictionary meaning and part of speech (1.1–1.4), a **technical noun** (1.5–1.11), or a **technical verb** (1.12–1.13). American spelling throughout (1.14) — except quoted text (a screen string, a placard) already in British spelling, which stays as written.

**Technical nouns** name a concept specific to a subject field — the dictionary cannot list them because every field has its own set. A word qualifies only when it falls into one of 22 official categories: parts information; vehicles/machines and their locations; tools and support equipment; materials, consumables, and unwanted material; facilities and logistics; systems, components, and circuits; mathematical, scientific, and engineering terms; navigation and geography; numbers, units, and time; quoted text; roles, individuals, organizations, and geopolitical entities; body parts; personal effects, food, and beverages; medical terms; official documents, parts of documentation, and standards; environmental and operational conditions; **colors (category 17)**; damage terms; computing, information, and communication technology (**category 19**); civil and military operations; law and regulations; and animals, plants, and other life forms. A technical noun still needs to be short, common, and not regional, slang, or jargon (1.9–1.10) — `brick` for "make a device unusable" is technical slang even in a software context, not a valid technical noun. Category 19 (computing/ICT) is why `database`, `firewall`, `token`, and `update` are legitimate technical nouns in a software document even though none of them are in the general dictionary — `interface` is a different case, an ordinary approved dictionary noun, not an example of a category-only word. A word not approved in the dictionary can still be legal as a technical noun in the right category (1.6); the two checks are independent, not "dictionary first, category as a fallback for everything else."

**Colors (category 17) take no comparative or superlative form.** `blacker`, `the reddest` — treat these as non-compliant even though they are ordinary English adjective inflections. Rewrite as plain, absolute color statements (`The insulation on the left is black.`), or, when the actual comparison matters for identification, label the parts instead of ranking their color (`connector A`, `connector B`).

Two guardrails for technical nouns:

- **Do not verbify one, unless the dictionary independently approves it as both.** `Grease the fasteners.` is a technical noun used as a verb with no verb sense in either the dictionary or a technical-verb category — rewrite as `Apply grease to the fasteners.` `Clamp the cable in position.` → `Put clamps on the cable to hold it in position.` This is not a blanket ban: a word can legitimately be a technical noun in one context and a technical verb in another — `drill` is a noun (`use a carbide drill`, category 3, tools) and a technical verb (`Drill a hole`, category 1a, manufacturing) at once; same for `plate` (noun: `the plate is not damaged`; verb: `plate the ring nut`). Check both categories before rewriting.
- **Never invent synonyms for the same item.** Pick one term per concept and hold it for the whole document — a reader who sees `sensor`, `probe`, and `detector` for the same part assumes three different parts.

**Technical verbs** describe an action specific to a subject field, grouped into 4 categories: manufacturing processes; computer processes and applications (input/output, UI actions, system operations — `click`, `drag`, `install`, `reboot`, `upload`); subject-field instructions (engineering, medical, navigation, and similar domains); and law and regulations (`comply with`, `enforce`, `waive`). Three guardrails:

- **Prefer the approved dictionary verb when one exists.** A technical verb is a last resort, not a first choice.
- **Technical verbs are context-bound, not a word list.** `Enter your password.` is valid (computer-process category). `Do not enter the engine test area.` is not — `enter` is not an approved general verb, so outside its technical-verb context it must become `Do not go into the engine test area.`
- **Do not nominalize one, with the same noun/verb-overlap exception as above.** `Give the hole 0.20-inch ream.` turns the verb `ream` into a noun with no independent noun sense — rewrite as `Ream the hole to a 0.20-inch dimension.` A past participle used as an adjective is still fine: `Lubricate the reamed hole.`

## Section 2 — Multi-word nouns (rules 2.1–2.2)

Keep multi-word nouns to **3 words maximum**. `Actuator operating rod` is fine; `Horizontal cylinder pivot bearing` is not. When a concept genuinely needs more than 3 words, first try to break it apart with a preposition (`of`, `on`, `in`, `for`): `Runway light connection resistance calibration` (5 words) becomes `Calibration of the resistance of the runway light connection.` When the term is a fixed technical noun from an official source and cannot be split, write it out in full on first use, then either give a short form (an approved abbreviation, used carefully — a procedure full of abbreviations is hard to read) or connect the words that act as one unit with hyphens (`cutoff-switch power connection`). A hyphenated group still counts as one multi-word noun and stays under the 3-word cap — do not chain more than 3 words with hyphens to dodge the limit (`main-gear-door-retraction-winch` is not STE; `main-gear-door retraction-winch` is). Never add or remove a hyphen in an already-approved technical noun.

## Section 3 — Verbs (rules 3.1–3.7)

**Allowed tenses and forms, exhaustively:** infinitive, imperative (command form), simple present, simple past, simple future, and the past participle **used as an adjective**. Nothing else.

**Explicitly banned:** present perfect (`has adjusted`), past perfect (`had adjusted`), progressive (`is adjusting`), and any other auxiliary combined with a **past participle** used as a verb — not auxiliaries in general, so a modal with a bare infinitive (`can adjust`, `must adjust`, `will adjust`, all covered by the allowed forms above) stays legal. `The operator has adjusted the linkage.` → `The operator adjusted the linkage.` `The seat is to be installed before you install the cushion.` → `Before you install the cushion, install the seat.`

**The past participle as adjective** is not passive voice — it is a state. Allowed before a noun (`the disassembled unit`) or after any form of `to be`, `to become`, or `to stay` (`When the unit is fully disassembled, clean all the parts.`). The gate is that the past participle form itself must be in the dictionary — true for any approved verb's own forms (`disassembled` from the approved verb `disassemble`). Separately, a handful of past participles of verbs that are _not_ approved are still listed as approved adjectives in their own right (`permitted`, `damaged`) — those may be used even though the underlying verb may not be.

**The `-ing` form is banned as a verb.** It is permitted only as a technical noun (`Cleaning`, `Troubleshooting`, `Handling`) or as a modifier inside a technical noun, where it functions as an adjective related to the item's function (`air-conditioning system`, `welding torch`, `grinding wheel`). A small closed set of `-ing` words is approved outright, each bound to one specific part of speech, not usable as a verb: nouns `lighting`, `opening`, `routing`, `servicing`; adjectives `mating`, `missing`, `remaining`; the pronoun `something`; the preposition `during`. Any other `-ing` word needs one of the two escape hatches above or it is not STE.

**Active voice is mandatory in procedural text.** In descriptive text, passive is allowed **only when the agent is genuinely unknown** — test it by asking "by whom, or by what?"; if the text can answer, it must be active. Four methods to convert a passive sentence, chosen by what the sentence gives you (roughly in this order of how often each applies):

1. The agent is named in a `by` phrase — promote it to subject: `The circuits are connected by a switching relay.` → `A switching relay connects the circuits.`
2. Recast the infinitive as an active verb: `These values are used by the computer to calculate consumption.` → `The computer calculates consumption from these values.`
3. In a procedure, switch straight to the imperative: `The test can be continued by the operator.` → `Continue the test.`
4. No agent at all — supply `you` (the reader) or `we` (the organization): `The valve can be opened with the override handle.` → `You can open the valve with the override handle.`

**Describe an action with an approved verb (3.7), not a noun or another part of speech.** A verb is always clearer than a nominalized construction — this is the same principle behind the "never nominalize" guardrail in Section 1, applied generally, not only to technical verbs.

## Section 4 — Sentences (rules 4.1–4.5)

Write short, complete sentences — no contractions, no dropped words for brevity. `Rotary switch to INPUT.` → `Set the rotary switch to INPUT.` `If installed, remove the shims.` → `If shims are installed, remove them.` When applicable, put an article (`the`, `a`, `an`) or demonstrative (`this`, `these`) in front of a noun or multi-word noun: `Data module tells you how to operate unit.` → `This data module tells you how to operate the unit.` Two cases skip the article: a general statement about a concept rather than a specific item (`Solvents can cause damage to paint.`), and a noun immediately followed by an alphanumeric identifier (`Tag circuit breaker 36L7.`, not `the circuit breaker`).

**Vertical lists** for complex text follow 8 formatting rules: end the lead-in with a colon; identify each item with a number, letter, punctuation mark, or symbol (dash, bullet, letter, or number, held consistently); capitalize the first letter of every item; add an article before the subject noun of each item where applicable; end an item with a period if it is a complete sentence; do not end an item with a period if it is not a complete sentence; never end an item with a comma or semicolon; always end the last item with a period. Separately: never mix procedural and descriptive items in the same vertical list.

**Connect related sentences with connecting words and phrases (4.4)** — `and`, `but`, `then`, `thus`, `as a result`, `at the same time` — so the reader sees how one sentence's information relates to the next. Once you pick a connecting word or phrase for a relationship, hold it; do not vary it for the same relationship within a document.

## Section 5 — Procedural writing (rules 5.1–5.5)

- Maximum **20 words** per sentence — safety instructions obey this same limit, which is why a WARNING or CAUTION with more than one consequence gets split into several short sentences rather than one long one.
- One instruction per sentence, unless two or more actions happen simultaneously, or a result must be stated immediately after the action that produces it.
- Imperative form. Avoid `must` before a command — reserve it for instructions where the safety stakes justify the emphasis, or where the sentence states an important condition rather than the action itself.
- When a condition applies, state the condition first, then the command, separated by a comma: `Set the switch to NORMAL when the light comes on.` → `When the light comes on, set the switch to NORMAL.`
- Notes give information only — never an instruction, and never the imperative form, a limit, a tolerance, or a work-step result (those belong directly in the work step, or in a safety instruction if getting them wrong risks damage or injury). A note may run up to 25 words per sentence (it follows the descriptive limit, not the 20-word procedural one). Test a note by removing it: the procedure must still be fully executable without it.

## Section 6 — Descriptive writing (rules 6.1–6.6)

- Give information gradually; one subject per sentence.
- Use key words and key phrases (6.2) to give the text a logical structure, and hold them once chosen — the same discipline as the connecting words in Section 4.
- Maximum **25 words** per sentence.
- Open each paragraph with a topic sentence (6.4); hold one topic per paragraph (6.5).
- Maximum **6 sentences** per paragraph (6.6).

Example of splitting an overloaded sentence: `A smartphone is a cellular telephone that has an integrated computer and many other functions, such as an operating system, internet browsing as well as the ability to run software applications.` (31 words) becomes `A smartphone is a cellular telephone that has an integrated computer and many other functions.` (15 words) `It includes an operating system and an internet browser, and it can also operate software applications.` (16 words).

## Section 7 — Safety instructions (rules 7.1–7.3)

Two levels in practice: **warning** for risk of injury or death to a person, **caution** for risk of damage to equipment or material — the standard phrases this as "an applicable word, for example warning or caution," and also allows a symbol where one is defined, but warning/caution is what nearly every document uses. Do an actual risk analysis, then decide: if there is a risk of injury or death, use warning; if there is only a risk of damage, use caution; when both apply, use warning. Structure: a clear command or condition first, then an explanation of the risk and its consequence.

`CAUTION: EXTREME CLEANLINESS OF OXYGEN TUBES IS IMPERATIVE.` understates a risk that can injure someone — rewrite as `WARNING: MAKE SURE THAT THE OXYGEN TUBES ARE FULLY CLEAN. OXYGEN AND GREASE MAKE AN EXPLOSIVE MIXTURE. AN EXPLOSION CAN CAUSE INJURY OR DEATH.` The non-STE version is an abstract, general statement; the STE version replaces it with the actual mechanism and consequence — that concreteness, not just the word "warning," is what makes the risk register with the reader. Uppercase formatting is a common convention in the source material, not an STE rule — STE governs wording, not typography.

## Section 8 — Punctuation and word count (rules 8.1–8.7)

**No semicolon.** It invites run-on sentences and is easy to misuse — every other standard punctuation mark is permitted. Use hyphens to connect words acting as one unit (`carbon-fiber-reinforced`, `O-ring`, `heat-treat`). Parentheses are permitted for: illustration or text references, item identifiers, work-step identification, abbreviations, giving singular and plural at once, short explanations, and alternatives.

**Word-counting rules** — critical for hitting the 20/25-word limits correctly:

| Element | Counts as |
| --- | --- |
| A number, or a number with its unit | 1 word (`10 °C` = 1 word) — except a number that identifies a paragraph or work step, which does not count |
| An abbreviation, acronym, or alphanumeric identifier | 1 word |
| Quoted text | 1 word |
| A title, heading, placard, or label | 1 word |
| A proper noun (person, group, organization, geopolitical entity) | 1 word |
| A hyphenated word | 1 word |
| Text inside parentheses | 1 word in the host sentence — but the parenthetical text is also its own sentence and must independently meet the 20/25-word limit |
| A colon in a vertical list | Same effect as a period — ends the sentence for counting purposes, and each item after the colon is a new sentence with its own full 20/25-word budget |

A sentence like `Set the valve to 10 °C (refer to Figure 3) and examine the carbon-fiber-reinforced panel.` counts as 11 words under these rules, not the 16 a naive word-split would give — miscounting here is the most common way an otherwise-correct rewrite silently breaks the 20-word limit. (Note `refer to`, not `see`: `see` is approved only for something the reader looks at with their own eyes, not for a cross-reference.)

## Section 9 — Writing practices (rules 9.1–9.4)

This section catches what a word-by-word swap misses, and it is the highest-value section for a first pass.

**Substitute first; restructure when that is not enough (9.1).** The default is a word-for-word swap from the dictionary's approved alternative. Restructure only when the swap breaks grammar or meaning: `The oil level on the sight gauge must be visible during the test.` → `During the test, make sure that you can see the oil level on the sight gauge.` (the approved verb `see` replaces the adjective `visible`, which forces `must be` to become `make sure that you can`).

**Restricted meanings (9.2).** Several words are approved for one sense only, and the trap is applying them outside it. `damage` is approved as a noun, not as a verb — `Be careful not to damage the sleeve.` becomes `Be careful not to cause damage to the sleeve.` `about` is approved as a preposition meaning "concerned with" (`data about the circuit breakers`) but not for approximation — use `approximately` there. `check` is approved as a noun, not a verb — `Check the pressure.` becomes `Do a check of the pressure.` or `Examine the pressure.` `The indicator turns green.` uses `turn` in an unapproved sense — rewrite as `The color of the indicator changes to green.` `wear` is not an approved verb for putting on protective equipment — `Wear protective clothing.` becomes `Use protective clothing.` or `Put on protective clothing.`

**Phrasal verbs (9.3) — the trap no dictionary lookup catches.** Most phrasal verbs never appear in the dictionary's "not approved" column at all, because the dictionary lists single words. `After you put out the fire, close the valve.` → `After you extinguish the fire, close the valve.` `This compound can give off poisonous fumes.` → `This compound can release poisonous fumes.` A handful of phrasal verbs are approved with a restricted sense (`put on`, `come on`, `go off`) — everything else needs a single-word replacement.

**Terminological consistency (9.4).** Once a term is chosen for a concept, hold it for the whole document — this is the same discipline as the technical-noun guardrail in Section 1, applied to every word choice.

## General Recommendations (GR-1–GR-8)

These are guidance, explicitly **not rules** — apply judgment rather than treating them as hard limits.

| GR | Guidance |
| --- | --- |
| GR-1 | Always write `that` after verbs like `make sure`: `Make sure that the valve is open.`, not `Make sure the valve is open.` |
| GR-2 | Re-read every sentence that uses `with` — it is a common source of ambiguity even in compliant STE. But do not "fix" it by recasting around `use`: keep the primary action verb. `Seal the opening with tool TS9867.`, not `Use tool TS9867 to seal the opening.` |
| GR-3 | Use only approved pronouns; replace a pronoun with the noun itself whenever the referent could be ambiguous. `he`/`she` are not approved — use the noun or `you` |
| GR-4 | Make sure the referent of `this` is unambiguous — restate the noun if more than one candidate is nearby |
| GR-5 | Watch for false friends imported from the writer's own first language into English — verify the English meaning rather than assuming a look-alike word means the same thing (`disposition` is not `disposizione`/`disposición`) |
| GR-6 | Avoid Latin abbreviations — write `for example` instead of `e.g.`, `that is` instead of `i.e.`, `and so on` instead of `etc.` |
| GR-7 | Use inclusive, gender-neutral language throughout — gender-specific pronouns (`he`, `she`) and, generally, `man`/`woman` are not permitted; use them only where the context genuinely requires it (for example, a medical text) |
| GR-8 | The possessive `'s` is permitted, but if you are not confident the sentence reads correctly with it, do not use it — many readers' first languages have no equivalent construction |

## Starter lexicon

These are reasoning heuristics — not a copy of the ASD-STE100 dictionary — that exemplify the STE preference (rules 9.1–9.2) for the shortest, most common, single-meaning word. Treat each as a default, not a mechanical find-and-replace: check the surrounding sentence for a restricted sense before swapping.

| Prefer | Over |
| --- | --- |
| `use` | utilize, employ |
| `start` | commence, initiate, begin |
| `stop` | cease, discontinue, terminate |
| `do` | perform, execute, conduct, accomplish, implement, undertake |
| `help` | assist, aid (as a verb), facilitate |
| `make sure` | ensure, verify, confirm, ascertain |
| `find` | locate, determine |
| `show` | indicate, display (as a verb), reveal, represent |
| `keep` | retain, maintain (as a verb) |
| `get` | obtain, acquire, procure |
| `remove` | eliminate, extract, withdraw |
| `change` | alter, modify |
| `tell` | notify, advise, inform |
| `let` | permit, allow, enable |
| `give` | provide |
| `supply` | deliver |
| `try` | attempt |
| `send` | submit, forward |
| `see` | observe |
| `record` | note (as a verb) |
| `before` | prior to |
| `after` | subsequent to |
| `because` | since, as (causal) |
| `if` | in the event that, whether |
| `also` | in addition, furthermore, moreover |
| `but` | however |
| `necessary` | required, needed |
| `must` | shall, should, is to |
| `can` | may, is able to |
| `more` | additional, further |
| `sufficient` | enough, adequate |
| `same` | identical |
| `different` | various |
| `applicable` | appropriate, suitable |
| `correct` | proper |
| `unusual` | abnormal |
| `sudden` | abrupt |
| `full` | entire |
| `fast` | rapid (adjective only — the adverb sense is `quickly`) |
| `dangerous` | hazardous |
| `approximately` | around, about (quantity sense) |
| `more than` / `less than` | over / under (as limits) |
| `person` / `personnel` | people |

This is a starting set, not the full dictionary — it covers the substitutions that come up most often, not every approved or restricted word. For a word not listed here, reason from the same preference (shortest, most common, single-meaning word) rather than guessing, and fetch the official dictionary (see Consulting the specification, next) when the reasoning is not enough to be confident.

## Consulting the specification

This file indexes all 53 rules by number so a reader can work unaided in common cases, but it does not transcribe the dictionary or the full category lists — that would reproduce a copyrighted work. Fetch and read the free official PDF at <https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf> (434 pages) when:

- A word's approved meaning, part of speech, or permitted verb forms is uncertain and not covered by the starter lexicon above — the dictionary is Part 2 of the standard.
- The subject field needs a technical noun or technical verb outside the examples given here — read the full category text under rules 1.5 and 1.12 for that field.
- A rule's exact wording matters, for an edge case, a dispute, or a compliance review.
- The user asks about a rule this file only summarizes.

The PDF is large — fetch it when a specific answer is needed, not as a default first step for every sentence.

## Process

1. Strip generation artifacts — register/chat leftovers, Markdown and typographic residue, em dash overuse.
2. Strip AI-padding constructions and, for descriptive or `Write`-mode text, discourse-architecture patterns.
3. Classify the source text (Step 0).
4. Draft the rewrite, applying the rules for that classification.
5. Check every sentence against its word limit using the counting table in Section 8 — recount, don't estimate.
6. Check every verb against the allowed tenses in Section 3 — flag any perfect, progressive, or bare `-ing` verb form.
7. Check technical nouns and technical verbs against their category tests in Section 1 — confirm each one is genuinely bound to a category in this context, not just familiar.
8. Check Section 9 last — restricted meanings and phrasal verbs are the errors a word-swap pass misses.
9. When a rule's application is unclear, fetch the specification (see above) rather than guessing.
10. Self-audit: re-read the draft once as a reader with limited English, and once as a machine translator would — flag any sentence with more than one possible parse.

## Output format

1. **Compliant text.**
2. **Change log**, one line per change. Cite the ASD-STE100 rule number for rule-driven changes (`Rule 3.6 — passive converted to imperative`, `Rule 8.6 — "10 °C" counted as one word`); label everything else — artifact removal, padding removal, discourse-level fixes — as `Hygiene` rather than inventing a rule number for it (`Hygiene — removed decorative emoji headers`, `Hygiene — removed challenge/optimism sandwich`, `Hygiene — replaced ghost Q&A with a direct statement`).
3. **Residual non-compliance**, if any — cases that need a company or project terminology glossary this skill does not have access to (for example, choosing a single approved technical noun among several plausible candidates).

## Limits and non-goals

STE governs wording, sentence structure, and paragraph structure — it does not regulate abbreviation choice, formatting conventions, or units of measurement, and it assumes those are set elsewhere. It is not an English course, and it is not usable alone: fluent English and a subject-field glossary are still required. It is built for technical documentation, not for marketing copy, brand voice, narrative writing, or oral scripts — a compliant STE paragraph reads as deliberately plain, which is the opposite of what those formats need.

This skill removes AI-generated bloat and register breaks — chat artifacts, decoration, padding constructions, discourse-level filler — because all of them work against the same goal STE's own rules enforce: short, direct, single-meaning text. It does **not** inject variety, personality, rhythm, or voice, and it does not police general English AI-vocabulary overuse (`delve`, `leverage`, `robust`) the way a general-purpose humanizer does — ASD-STE100's own dictionary already governs word choice for STE text specifically, and injecting stylistic variety would directly contradict rules 1.11 and 9.4 (hold one term, consistently, for the whole document). For general AI-writing-pattern cleanup outside a technical-documentation context, or for French text, use a general-purpose humanizer skill or `samber/cc-skills@humaniseur-fr`.

It does not fix hollow or unclear content; it only makes clear content unambiguous, and it does not invent facts a source is missing — a missing value gets flagged as residual non-compliance, never guessed.

This skill is not exhaustive. Refer to the official ASD-STE100 documentation at <https://www.asd-ste100.org/> for anything beyond the rule index above — including the full dictionary, the complete technical noun and verb category lists, and future issues of the standard.
