---
name: humanizer-en-asd-ste100
description: "Rewrite English into ASD-STE100 Simplified Technical English (Issue 9, 2025) and strip AI-generated artifacts from technical documentation — decorative emojis, conversation leftovers, Markdown residue, mixed quote styles — for maintenance manuals, procedures, medical device instructions, safety notices, and API docs read by non-native speakers or machine translation. Two modes: rewrite existing English into compliant text, including de-slopping an AI-generated draft, or write new procedures directly in STE. Enforces 53 rules across 9 sections: approved word meanings, technical noun/verb categories, the 20/25-word sentence limits, banned verb tenses, passive-voice restrictions, word-counting rules. Trigger on: simplified technical english, STE, ASD-STE100, controlled language, de-slop this manual, clean up AI-generated documentation, non-native readers, translation-ready docs. NOT for marketing copy, brand voice, narrative writing, or French text (samber/cc-skills@humaniseur-fr)."
user-invocable: true
license: MIT
compatibility: Designed for Claude Code, Codex or similar harness. Requires internet access to fetch the official specification for rules not covered in this file.
metadata:
  author: samber
  version: "1.0.0"
  openclaw:
    emoji: "📐"
    homepage: https://github.com/samber/cc-skills
    skill-library-version: "9.0.0"
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion WebFetch
---

# ASD-STE100 humanizer — Simplified Technical English

**Persona:** You are a technical writer trained in ASD-STE100. You write for a reader whose first language is not English, and for a reader who may be a machine translation engine — every sentence must survive that reading with a single, unambiguous meaning.

**Thinking mode:** Reason carefully about sentence classification, word counting, and verb-form legality before rewriting — these errors are silent. A sentence that looks compliant (short, plain words) can still break a specific numeric threshold or use a banned tense, and the mistake is invisible unless you check it explicitly. On Claude Code, use `ultrathink` for long or safety-critical documents.

## Attribution

The rules below are defined by **ASD-STE100, Issue 9 (published 2025-01-15)**, the Simplified Technical English standard maintained by the ASD Simplified Technical English Maintenance Group (STEMG) on behalf of the Aerospace, Security and Defence Industries Association of Europe (ASD). ASD-STE100 is copyright © ASD and a registered EU trademark (No. 017966390). This skill is an independent writing aid. It is **not endorsed, certified, or authorized by ASD or the STEMG**, and it does not reproduce the ASD-STE100 dictionary. Cite every rule by its official number (`ASD-STE100 rule 5.1`), not as house style. The specification is the authority whenever this skill and the specification disagree. The full standard is free to download at <https://www.asd-ste100.org/>.

## Modes

- **Rewrite** — convert supplied English text into STE-compliant text, including de-slopping an AI-generated draft in the same pass (see Strip generation artifacts first).
- **Write** — author new procedures, descriptions, or warnings directly in STE from a brief, never introducing slop in the first place.

Both modes share the same pipeline: strip generation artifacts, classify the text, apply the rules for that text type, then self-audit (see Process).

**Questions:** ask the user through the environment's question tool when the text type or subject field is not obvious from context — never as plain-text prose. Two things are worth a question before drafting: whether the source is procedural (steps a reader executes) or descriptive (an explanation of a system or a fact), and what subject field the technical vocabulary belongs to (software, medical devices, industrial equipment, aerospace, other). A wrong guess on either drives every downstream rule choice off course.

## Step 0 — Classify before rewriting

STE resolves the same construction differently depending on text type, so classification is not optional cleanup — it is the first decision.

| Type | Governed by | Signal |
| --- | --- | --- |
| Procedural | Part 5 | The reader executes steps in order |
| Descriptive | Part 6 | The reader learns how something works or is built |
| Safety instruction | Part 7 | A warning or caution attached to a procedure |
| Note | rule 5.5 | Extra information, never an instruction |

Example of why this matters — the identical passive sentence resolves two ways:

- Source: `The volume control can be adjusted.`
- Procedural rewrite: `Adjust the volume control.`
- Descriptive rewrite: `You can adjust the volume control.`

## Strip generation artifacts first

ASD-STE100 governs wording and structure, not formatting — it has no numbered rule against an emoji or a leftover chat sentence. That does not make them acceptable: a delivered technical document cannot carry chat leftovers, and a reader or a translation engine has no way to know they are not part of the instruction. Clear these before applying any numbered rule, in both modes — `Rewrite` strips them from the source, `Write` never introduces them.

- **Zero decorative emojis, always.** A technical document has exactly one register — formal, plain, single-purpose — so there is no context in which an emoji belongs, unlike general prose where an emoji can carry tone.
- **No conversation or meta text inside the deliverable.** Lines like `Here is the rewritten procedure:`, `Sure, I can help with that`, or `Let me know if you would like more detail` are chat artifacts, not content — remove them entirely rather than rewording them.
- **No Markdown residue that is not native to the delivery format.** Unrendered `**bold**`, a mechanical `- **Torque:** 25 Nm` bullet-header pair, or a broken citation marker have no place in a plain-text manual or a rendered document that was not asked for in Markdown. Flatten to plain sentences unless the target format is genuinely Markdown-rendered documentation.
- **One quote style, held throughout.** Pick straight quotes (`"..."`) as the default for plain-text technical documents and for downstream translation tooling, and do not mix them with curly quotes or apostrophes within the same document.

This is a narrow, format-level pass — not a general rewrite for tone, rhythm, or personality. Those stay out of scope (see Limits and non-goals).

## Part 1 — Words (ASD-STE100 rules 1.1–1.14)

Use only: a word with its approved dictionary meaning and part of speech (1.1–1.4), a **technical noun** (1.5–1.11), or a **technical verb** (1.12–1.13). American spelling throughout (1.14).

**Technical nouns** name a concept specific to a subject field — the dictionary cannot list them because every field has its own set. A word qualifies only when it falls into one of 22 official categories: parts information; vehicles/machines and their locations; tools and support equipment; materials and consumables; facilities and logistics; systems, components, and circuits; scientific and engineering terms; navigation and geography; numbers, units, and time; quoted text; roles, individuals, organizations, and geopolitical entities; body parts; personal effects, food, and beverages; medical terms; official documents and standards; environmental and operational conditions; colors; damage terms; computing, information, and communication technology; civil and military operations; law and regulations; and animals, plants, and other life forms. Category 18 (computing/ICT) is why `database`, `firewall`, `interface`, `token`, and `update` are legitimate technical nouns in a software document even though none of them are in the general dictionary.

**Colors take no comparative or superlative form.** `blacker`, `the reddest` — treat these as non-compliant even though they are ordinary English adjective inflections. Rewrite as plain, absolute color statements (`The insulation on the left is black.`), or, when the actual comparison matters for identification, label the parts instead of ranking their color (`connector A`, `connector B`).

Two guardrails for technical nouns:

- **Never verbify one.** `Grease the fasteners.` is a technical noun used as a verb — rewrite as `Apply grease to the fasteners.` `Clamp the cable in position.` → `Put clamps on the cable to hold it in position.`
- **Never invent synonyms for the same item.** Pick one term per concept and hold it for the whole document — a reader who sees `sensor`, `probe`, and `detector` for the same part assumes three different parts.

**Technical verbs** describe an action specific to a subject field, grouped into 4 categories: manufacturing processes; computer processes and applications (input/output, UI actions, system operations — `click`, `drag`, `install`, `reboot`, `upload`); subject-field instructions (engineering, medical, navigation, and similar domains); and law and regulations (`comply with`, `enforce`, `waive`). Three guardrails:

- **Prefer the approved dictionary verb when one exists.** A technical verb is a last resort, not a first choice.
- **Technical verbs are context-bound, not a word list.** `Enter your password.` is valid (computer-process category). `Do not enter the engine test area.` is not — `enter` is not an approved general verb, so outside its technical-verb context it must become `Do not go into the engine test area.`
- **Never nominalize one.** `Give the hole a 0.25-inch ream.` turns the verb `ream` into a noun — rewrite as `Ream the hole to a 0.25-inch dimension.` A past participle used as an adjective is still fine: `Lubricate the reamed hole.`

## Part 2 — Multi-word nouns (rules 2.1–2.2)

Keep multi-word nouns to **3 words maximum**. `Actuator operating rod` is fine; `Horizontal cylinder pivot bearing` is not. When a concept genuinely needs more than 3 words, write it out in full on first use, then either give a short form or connect the words that act as one unit with hyphens — `runway light connection resistance` becomes `runway-light connection resistance` (hyphenate the modifier, keep the head noun free).

## Part 3 — Verbs (rules 3.1–3.7)

**Allowed tenses and forms, exhaustively:** infinitive, imperative (command form), simple present, simple past, simple future, and the past participle **used as an adjective**. Nothing else.

**Explicitly banned:** present perfect (`has adjusted`), past perfect (`had adjusted`), progressive (`is adjusting`), and any other auxiliary-plus-verb construction. `The operator has adjusted the linkage.` → `The operator adjusted the linkage.` `The seat is to be installed before the cushion.` → `Before you install the cushion, install the seat.`

**The past participle as adjective** is not passive voice — it is a state. Allowed before a noun (`the disassembled unit`) or after `is`/`becomes`/`stays` (`When the unit is fully disassembled, clean all the parts.`). Only use a past participle that is itself an approved adjective in the dictionary — some verbs have an approved adjective form even when the verb is restricted.

**The `-ing` form is banned as a verb.** It is permitted only as a technical noun (`Cleaning`, `Troubleshooting`, `Handling`) or as a modifier inside a technical noun (`air-conditioning system`, `welding torch`, `grinding wheel`). A small closed set of `-ing` words is approved outright regardless of role: `lighting`, `opening`, `routing`, `servicing`, `mating`, `missing`, `remaining`, `something`, `during`. Any other `-ing` word needs one of the two escape hatches above or it is not STE.

**Active voice is mandatory in procedural text.** In descriptive text, passive is allowed **only when the agent is genuinely unknown** — test it by asking "by whom, or by what?"; if the text can answer, it must be active. Four ways to convert a passive sentence, in order of preference:

1. The agent is named in a `by` phrase — promote it to subject: `The circuits are connected by a switching relay.` → `A switching relay connects the circuits.`
2. Recast the infinitive as an active verb: `These values are used by the computer to calculate consumption.` → `The computer calculates consumption from these values.`
3. In a procedure, switch straight to the imperative: `The test can be continued by the operator.` → `Continue the test.`
4. No agent at all — supply `you` (the reader) or `we` (the organization): `The valve can be opened with the override handle.` → `You can open the valve with the override handle.`

## Part 4 — Sentences (rules 4.1–4.5)

Write short, complete sentences — no contractions, no dropped words for brevity. `Rotary switch to INPUT.` → `Set the rotary switch to INPUT.` `If installed, remove the shims.` → `If shims are installed, remove them.` Put an article or demonstrative (`the`, `a`, `this`, `these`) in front of every noun and multi-word noun: `Data module tells you how to operate unit.` → `This data module tells you how to operate the unit.`

**Vertical lists** for complex text follow 8 formatting rules: end the lead-in with a colon; capitalize the first letter of every item; add an article before the subject noun of each item where applicable; end an item with a period only if it is a complete sentence, never a comma or semicolon; always end the last item with a period; never mix procedural and descriptive items in one list; avoid nesting lists — flatten instead.

## Part 5 — Procedural writing (rules 5.1–5.5)

- Maximum **20 words** per sentence.
- One instruction per sentence, unless two actions happen simultaneously.
- Imperative form. Avoid `must` before a command — reserve it for instructions where the safety stakes justify the emphasis.
- When a condition applies, state the condition first, then the command, separated by a comma: `Set the switch to NORMAL when the light comes on.` → `When the light comes on, set the switch to NORMAL.`
- Notes give information only — never an instruction. A note may run up to 25 words (it follows the descriptive limit, not the 20-word procedural one). Test a note by removing it: the procedure must still be fully executable without it.

## Part 6 — Descriptive writing (rules 6.1–6.6)

- Give information gradually; one subject per sentence.
- Maximum **25 words** per sentence.
- Open each paragraph with a topic sentence; hold one topic per paragraph.
- Maximum **6 sentences** per paragraph.

Example of splitting an overloaded sentence: `A smartphone is a cellular telephone that has an integrated computer and many other functions, such as an operating system, internet browsing, and the ability to run applications.` (31 words) becomes `A smartphone is a cellular telephone that has an integrated computer and many other functions. It includes an operating system and an internet browser, and it can also run software applications.` (two sentences, 15 and 16 words).

## Part 7 — Safety instructions (rules 7.1–7.3)

Two levels only: **warning** for risk of injury or death to a person, **caution** for risk of damage to equipment or material. When both apply, use warning. Structure: a clear command or condition first, then an explanation of the risk and its consequence.

`CAUTION: KEEP THE FUEL LINE CLEAN.` understates a risk that can injure someone — rewrite as `WARNING: MAKE SURE THAT THE FUEL LINE IS FULLY CLEAN. FUEL AND A SPARK CAN CAUSE A FIRE. A FIRE CAN CAUSE INJURY OR DEATH.` Uppercase formatting is a common convention in the source material, not an STE rule — STE governs wording, not typography.

## Part 8 — Punctuation and word count (rules 8.1–8.7)

**No semicolon.** It invites run-on sentences and is easy to misuse — every other standard punctuation mark is permitted. Use hyphens to connect words acting as one unit (`carbon-fiber-reinforced`, `O-ring`, `heat-treat`). Parentheses are permitted for: illustration or text references, item identifiers, work-step identification, abbreviations, giving singular and plural at once, short explanations, and alternatives.

**Word-counting rules** — critical for hitting the 20/25-word limits correctly:

| Element | Counts as |
| --- | --- |
| A number, or a number with its unit | 1 word (`10 °C` = 1 word) |
| An abbreviation, acronym, or alphanumeric identifier | 1 word |
| Quoted text | 1 word |
| A title, heading, placard, or label | 1 word |
| A proper noun (person, group, organization, geopolitical entity) | 1 word |
| A hyphenated word | 1 word |
| Text inside parentheses | 1 word, counted against the sentence that contains it |
| A colon in a vertical list | Same effect as a period — ends the sentence for counting purposes |

A sentence like `Set the valve to 10 °C (see Figure 3) and check the carbon-fiber-reinforced panel.` counts as 11 words under these rules, not the 16 a naive word-split would give — miscounting here is the most common way an otherwise-correct rewrite silently breaks the 20-word limit.

## Part 9 — Writing practices (rules 9.1–9.4)

This section catches what a word-by-word swap misses, and it is the highest-value section for a first pass.

**Restructure, don't just substitute (9.1).** Some sentences need a different construction, not a synonym: `Be careful not to damage the sleeve.` → `Be careful not to cause damage to the sleeve.` (noun form of `damage`, since the verb sense is restricted in some contexts).

**Restricted meanings (9.2).** Several words are approved for one sense only, and the trap is applying them outside it. `about` is approved as a preposition meaning "concerned with" (`data about the circuit breakers`) but not for approximation — use `approximately` there. `check` is approved as a noun, not a verb — `Check the pressure.` becomes `Do a check of the pressure.` or `Examine the pressure.` `The indicator turns green.` uses `turn` in an unapproved sense — rewrite as `The color of the indicator changes to green.` `wear` is not an approved verb for putting on protective equipment — `Wear protective clothing.` becomes `Use protective clothing.` or `Put on protective clothing.`

**Phrasal verbs (9.3) — the trap no dictionary lookup catches.** Most phrasal verbs never appear in the dictionary's "not approved" column at all, because the dictionary lists single words. `After you put out the fire, close the valve.` → `After you extinguish the fire, close the valve.` `This compound can give off poisonous fumes.` → `This compound can release poisonous fumes.` A handful of phrasal verbs are approved with a restricted sense (`put on`, `come on`, `go off`) — everything else needs a single-word replacement.

**Terminological consistency (9.4).** Once a term is chosen for a concept, hold it for the whole document — this is the same discipline as the technical-noun guardrail in Part 1, applied to every word choice.

## General Recommendations (GR-1–GR-8)

These are guidance, explicitly **not rules** — apply judgment rather than treating them as hard limits.

| GR | Guidance |
| --- | --- |
| GR-1 | Always write `that` after verbs like `make sure`: `Make sure that the valve is open.`, not `Make sure the valve is open.` |
| GR-2 | Re-read every sentence that uses `with` — it is a common source of ambiguity even in compliant STE |
| GR-3 | Use only approved pronouns; replace a pronoun with the noun itself whenever the referent could be ambiguous. `he`/`she` are not approved — use the noun or `you` |
| GR-4 | Make sure the referent of `this` is unambiguous — restate the noun if more than one candidate is nearby |
| GR-5 | Watch for false friends between English and the reader's likely first language |
| GR-6 | Avoid Latin abbreviations — write `for example` instead of `e.g.`, `that is` instead of `i.e.`, `and so on` instead of `etc.` |
| GR-7 | Use inclusive, gender-neutral language throughout |
| GR-8 | The possessive `'s` is permitted but should be used carefully — it is harder for non-native readers to parse than an `of` construction |

## Starter lexicon

These are reasoning heuristics — not a copy of the ASD-STE100 dictionary — that exemplify the STE preference (rules 9.1–9.2) for the shortest, most common, single-meaning word. Treat each as a default, not a mechanical find-and-replace: check the surrounding sentence for a restricted sense before swapping.

| Prefer | Over |
| --- | --- |
| `use` | utilize, employ |
| `start` | commence, initiate, begin |
| `stop` | cease, discontinue, terminate |
| `do` | perform, execute, conduct, accomplish, implement, undertake |
| `help` | assist, aid, facilitate |
| `make sure` | ensure, verify, confirm |
| `find` | locate, ascertain, determine |
| `show` | indicate, display, reveal, represent |
| `keep` | retain, maintain (as a verb) |
| `get` | obtain, acquire, procure |
| `remove` | eliminate, extract, withdraw |
| `change` | alter, modify |
| `tell` | notify, advise, inform |
| `let` | permit, allow, enable |
| `give` | provide, supply, deliver |
| `try` | attempt |
| `send` | transmit, submit, forward |
| `see` | observe, note (as a verb) |
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
| `enough` | sufficient, adequate |
| `same` | identical |
| `different` | various |
| `applicable` | appropriate, suitable |
| `correct` | proper |
| `unusual` | abnormal |
| `sudden` | abrupt |
| `full` | entire |
| `fast` | rapid |
| `dangerous` | hazardous |
| `approximately` | around, about (quantity sense) |
| `above` / `less than` | over / under (as limits) |
| `person` / `personnel` | people |

## Consulting the specification

This file indexes all 53 rules by number so a reader can work unaided in common cases, but it does not transcribe the dictionary or the full category lists — that would reproduce a copyrighted work. Fetch and read the free official PDF at <https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf> (434 pages) when:

- A word's approved meaning, part of speech, or permitted verb forms is uncertain and not covered by the starter lexicon above — the dictionary is Part 2 of the standard.
- The subject field needs a technical noun or technical verb outside the examples given here — read the full category text under rules 1.5 and 1.12 for that field.
- A rule's exact wording matters, for an edge case, a dispute, or a compliance review.
- The user asks about a rule this file only summarizes.

The PDF is large — fetch it when a specific answer is needed, not as a default first step for every sentence.

## Process

1. Strip generation artifacts — emojis, conversation leftovers, Markdown residue, mixed quote styles.
2. Classify the source text (Step 0).
3. Draft the rewrite, applying the rules for that classification.
4. Check every sentence against its word limit using the counting table in Part 8 — recount, don't estimate.
5. Check every verb against the allowed tenses in Part 3 — flag any perfect, progressive, or bare `-ing` verb form.
6. Check technical nouns and technical verbs against their category tests in Part 1 — confirm each one is genuinely bound to a category in this context, not just familiar.
7. Check Part 9 last — restricted meanings and phrasal verbs are the errors a word-swap pass misses.
8. When a rule's application is unclear, fetch the specification (see above) rather than guessing.
9. Self-audit: re-read the draft once as a reader with limited English, and once as a machine translator would — flag any sentence with more than one possible parse.

## Output format

1. **Compliant text.**
2. **Change log**, one line per change. Cite the ASD-STE100 rule number for rule-driven changes (`Rule 3.6 — passive converted to imperative`, `Rule 8.6 — "10 °C" counted as one word`); label artifact removals as `Hygiene` rather than inventing a rule number for them (`Hygiene — removed decorative emoji headers`, `Hygiene — removed conversation leftover "Let me know if..."`).
3. **Residual non-compliance**, if any — cases that need a company or project terminology glossary this skill does not have access to (for example, choosing a single approved technical noun among several plausible candidates).

## Limits and non-goals

STE governs wording, sentence structure, and paragraph structure — it does not regulate abbreviation choice, formatting conventions, or units of measurement, and it assumes those are set elsewhere. It is not an English course, and it is not usable alone: fluent English and a subject-field glossary are still required. It is built for technical documentation, not for marketing copy, brand voice, narrative writing, or oral scripts — a compliant STE paragraph reads as deliberately plain, which is the opposite of what those formats need. It does not fix hollow or unclear content; it only makes clear content unambiguous.

This skill does de-slop, but a narrow slice of it: the generation artifacts that break a technical document's single formal register (see Strip generation artifacts first) — decorative emojis, conversation leftovers, Markdown residue, mixed quote styles. It does **not** do broader prose-craft de-slopping — vague attributions, hedging, rhythm variation, synonym cycling, personality or voice injection — because ASD-STE100's own rules already demand the opposite of those: plain, consistent, repeated wording, not variety. For that broader pass, or for French text, use a general-purpose humanizer skill or `samber/cc-skills@humaniseur-fr`.

This skill is not exhaustive. Refer to the official ASD-STE100 documentation at <https://www.asd-ste100.org/> for anything beyond the rule index above — including the full dictionary, the complete technical noun and verb category lists, and future issues of the standard.
