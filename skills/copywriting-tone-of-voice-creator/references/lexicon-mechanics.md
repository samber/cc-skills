# Lexicon & Mechanics

The vocabulary and grammar layer of voice. **Banned-word lists do more work than power-word lists** — prevention is cheaper than prescription. A writer encountering "we don't use 'leverage' (unless in the financial sense)" never reaches for it again, while a power-words list, by contrast, rarely gets consulted in the moment of drafting.

---

## Table of contents

- [Lexicon](#lexicon)
  - [Preferred terms](#preferred-terms)
  - [Banned terms](#banned-terms)
  - [Power words](#power-words)
  - [Jargon policy](#jargon-policy)
  - [Naming conventions](#naming-conventions)
- [Mechanics](#mechanics)
  - [Person](#person)
  - [Contractions](#contractions)
  - [Oxford comma](#oxford-comma)
  - [Sentence length](#sentence-length)
  - [Active vs passive](#active-vs-passive)
  - [Reading age](#reading-age)
  - [Capitalisation](#capitalisation)
  - [Emoji policy](#emoji-policy)
  - [Punctuation tics](#punctuation-tics)
  - [Numerals, dates, currencies](#numerals-dates-currencies)
- [Inclusive language](#inclusive-language)
- [Localisation](#localisation)

---

## Lexicon

### Preferred terms

Named concepts and nouns the brand uses consistently. Each entry: term, meaning, what NOT to confuse it with.

| Term                    | Use for              | Don't confuse with        |
| ----------------------- | -------------------- | ------------------------- |
| `<brand-specific term>` | `<one-line meaning>` | `<near-synonym to avoid>` |

**Common decision: what to call the customer.**

| Choice | Connotation | Example brands |
| --- | --- | --- |
| **Members** | Belonging, community, recurring | YMCA, Equinox, Costco |
| **Customers** | Transactional, broad | Most B2B SaaS |
| **Users** | Functional, neutral | Engineering-led brands |
| **Readers** | Editorial relationship | Substack, NYT |
| **Subscribers** | Ongoing relationship | Streaming, newsletters |
| **Players** | Active participation | Gaming, fantasy sports |
| **Patients** | Care relationship | Healthcare |
| **Clients** | Service, expertise | Consulting, legal, finance |

Pick one. Use it everywhere. Modulating the customer-noun across channels confuses the brand-customer relationship.

### Banned terms

The single highest-leverage section of TONE.md.

**Pattern (GOV.UK style):** for each banned term, name the replacement and the reason.

| Banned | Use instead | Reason |
| --- | --- | --- |
| Agenda | Plan | Loaded political connotation in many contexts |
| Deliver | Make, create, provide | Used in too many contexts to mean anything specific |
| Leverage (non-financial) | Use, influence | Corporate cliché; concrete verbs are stronger |
| Empower / empowerment | (omit) | Saturated; signals filler |
| Solution | Product, service, fix | Vague; replace with the specific noun |
| Robust | Reliable, well-tested, durable | Vague intensifier; pick the actual property |
| Synergy | (omit) | Self-parody at this point |
| Drive (transitive, abstract) | (omit) | "Drive growth", "drive engagement" — replace with the concrete mechanism |
| Innovative / innovation | (omit, or describe the actual innovation) | Empty claim |
| Cutting-edge / next-generation | (omit) | Empty intensifier |
| Disruptive | (omit) | Saturated; describe what the disruption is |
| Ecosystem | Product set, integrations, marketplace | Overloaded term |
| Touch base | Talk, meet, call | Business-speak |
| At the end of the day | (omit) | Filler |
| Going forward | (omit, or use "from now on") | Filler |
| Best-of-breed | Best | Acquired meaning; meaningless |
| Game-changer | (omit) | Empty claim |
| Thought leader / thought leadership | (omit, or describe the actual perspective) | Self-aggrandising; reads as marketing |
| Reach out | Contact, ask, email | Business-speak |
| Bandwidth (non-technical) | Time, capacity, attention | Lazy substitution |

**LLM-generated copy tells:**

These phrases appear disproportionately in AI-generated content. Ban them to keep brand copy distinguishable:

- "It's worth noting that..."
- "In today's fast-paced world..."
- "In conclusion..."
- "Navigate the complex landscape of..."
- "Unleash the power of..."
- "Delve into..."
- "Embark on a journey..."
- "Game-changing"
- "Cutting-edge"
- "Robust solution"

### Power words

10-30 words that consistently appear in best-performing copy for the brand. Mine your top 10 best-performing pieces; the words that repeat across them are your power words.

**Examples (D2C):** free, new, you, save, easy, now, today, last, finally, real.

**Examples (B2B):** because, specifically, exactly, never, fastest, reduced, prevented, real, evidence, named.

Power words are less load-bearing than banned-word lists. Treat them as descriptive (what we already do well) rather than prescriptive (what we must do).

### Jargon policy

| Audience × channel | Jargon policy |
| --- | --- |
| Technical audience × dev docs | Allowed; assumed shared vocabulary |
| Technical audience × marketing top-of-funnel | Define on first use; use sparingly |
| Mixed audience × marketing | Avoid; substitute with plain-English equivalent |
| Non-technical audience × any | Banned |
| Internal audience × internal comms | Allowed |
| Sensitive comms (apology, crisis) × any | Banned without exception |

### Naming conventions

| Element | Rule |
| --- | --- |
| Brand name | `<exact capitalisation, e.g. "GitHub" not "Github">` |
| Product names | `<rules — e.g. always capitalised; never pluralised>` |
| Feature names | `<sentence case unless trademarked>` |
| Competitors | `<how to refer to them, if at all — many brands name competitors only in comparison content>` |
| Internal teams | `<external-facing names — usually different from internal Slack channel names>` |

---

## Mechanics

### Person

| Choice | Effect | Default for most brands |
| --- | --- | --- |
| First plural ("we") | Brand-as-collective; warmer | Most consumer brands |
| Second ("you") | Reader-centric; direct | Most product and marketing copy |
| Third | Distant; journalistic or press | Press releases, case studies |
| Mixed | Use "you" for reader actions, "we" for brand actions | The modern default |

### Contractions

| Choice | When |
| --- | --- |
| Yes (informal: don't, can't, you're) | Conversational brands, consumer-facing copy |
| No | Formal contexts, multi-language readability, GOV.UK style |
| Contextual | Most brands — yes in marketing and product, no in legal/regulatory |

**Rule worth knowing:** GOV.UK avoids **negative** contractions (don't, can't, won't) because they confuse non-native readers — the apostrophe is easy to miss, flipping the meaning. Allow positive contractions ("we're", "you're") even when banning negative ones.

### Oxford comma

| Choice | Reason |
| --- | --- |
| Yes | Disambiguates lists ("we thank our donors, the Smiths, and the Joneses"). Mailchimp uses it ("We like serial commas, and we cannot lie."). |
| No | Tighter prose; AP style. |

Pick one; document it; enforce in CI/linter if you have one.

### Sentence length

**General-public default:** average 15-20 words per sentence (Attorney General's Office UK Writing Style Guide, February 2015: _"An average of 15 to 20 words per sentence is ideal."_).

**Expert audiences:** can tolerate 20-30 words on average, but never as a sustained pattern.

**Public sector (GOV.UK):** 15-20 word average; reading age of 9.

**Mix lengths.** A page of uniformly 18-word sentences reads as monotonous. Vary: 3-5 word punches, then medium (12-18), then occasionally longer (20-25) for nuance. Variation is the rhythm signature of a confident voice.

### Active vs passive

**Default: active.** Subject acts on object — "We charge the card" beats "The card is charged."

**Passive allowed for:**

- **Time-sensitive softening** (Fenton/Kiefer Lee, _Nicely Said_): _"In certain situations it helps you sound softer... It's especially useful for time-sensitive messages like payment confirmations and error messages."_ "Your card was charged" softens "We charged your card" in a payment confirmation.
- **Process descriptions where the actor is unimportant** ("The data is encrypted in transit").
- **Avoiding blame** when blame would damage the relationship ("An error occurred" beats "You did something wrong").

### Reading age

**GOV.UK target:** reading age of 9. Sarah Richards (GDS): _"Writing for a reading age of 9 isn't the same as writing for a 9-year-old. It's about making sure your content is quick to scan, easy to read and simple to understand."_

**Tools to measure:** Flesch-Kincaid grade level, Hemingway Editor. Aim for grade 6-8 (US) / reading age 9 (UK) for general-public content.

**Higher reading age justified for:** dev docs, expert reference material, specifications.

### Capitalisation

| Choice | Modern default |
| --- | --- |
| Sentence case (only first word + proper nouns) | The modern default for most brands |
| Title case (most words capitalised) | Older convention; still used by US press, some legacy brands |

Sentence case is friendlier and more scannable on mobile. Title case can feel formal or dated.

### Emoji policy

For each channel in scope, decide:

- Allowed? (Y/N)
- Which emoji set? (Most brands restrict to a subset to avoid mismatched register.)
- Frequency cap? (1 per post? 1 per paragraph? None?)
- Specific emojis banned? (e.g. faces with unclear connotation: 😅, 😬)

In-product UI generally bans emoji except in marketing-adjacent surfaces (onboarding, empty states).

### Punctuation tics

Each of these is a stylistic signature. Decide explicitly:

- **Ellipses (`...`):** sparingly; reads as trailing thought, can feel passive-aggressive
- **Em-dashes (`—`):** parenthetical asides; allowed but cap at 1-2 per paragraph
- **Exclamation marks (`!`):** cap at 1 per post; never in transactional copy
- **Parentheses (`()`):** allowed for asides; ensure the sentence still works if the parenthetical is removed
- **Hyphens in compound modifiers (`well-known`):** consistent application

### Numerals, dates, currencies

| Element | Common convention |
| --- | --- |
| Numerals under 10 | Spell out ("three options") unless in tables/headlines |
| Numerals 10+ | Use figures ("12 options") |
| Mixed in one sentence | Use figures throughout ("3 to 12 options") |
| Dates | DD MMM YYYY (en-GB); MMM DD, YYYY (en-US); ISO 8601 (YYYY-MM-DD) for technical contexts |
| Currencies | Symbol + amount (€1,234.56); ISO codes (EUR, USD) for technical contexts |
| Percentages | Use "%" (not "percent") in body copy |
| Phone numbers | E.164 format (+44 20 7946 0958) for international |

---

## Inclusive language

**Base references:**

- Karen Yin, _Conscious Style Guide_ — the canonical living resource
- APA Inclusive Language Guidelines
- For UK English: Citizens Advice plain-language guide

**Yin's principle:** _"To write consciously is to be aware of and compassionate toward the actual people who determine not only the success but also the meaning of any work."_

**Decisions to document per locale:**

- **Gendered language:** default to avoidance; use singular "they" when gender is unknown. Mailchimp: _"Avoid gendered language and use the singular 'they.' When writing about a person, use their preferred pronouns; if you don't know those, just use their name."_
- **Disability / ability:** person-first ("person with diabetes") vs identity-first ("autistic person"). Defer to the community's expressed preference where it exists.
- **Race, ethnicity, nationality:** specific over abstract; capitalisation per community preference (e.g. "Black" capitalised in US convention).
- **Age:** avoid "elderly"; prefer "older adult" or specific age range.
- **Class, education, geography:** avoid sneering shorthand ("flyover country", "uneducated voters", "low-skilled workers").
- **Neurodiversity:** community-led terminology; defer to current consensus.

---

## Localisation

**Per market, document:**

- Which idioms, sports metaphors, pop-culture references, and humour styles do **not** travel.
- Regional variants: en-US vs en-GB vs en-AU; pt-BR vs pt-PT; es-ES vs es-MX vs es-AR; zh-CN vs zh-TW.
- Date, time, address, phone, currency conventions.
- Honorifics and formal-vs-informal address (tu/vous in French; tú/usted in Spanish; T-V distinctions widely).
- Politeness register: Japanese teineigo / sonkeigo / kenjogo; Korean nida-form vs haeyo-form.

**Transcreation, not translation.** Surface-translating English brand voice into French or Japanese produces tin-eared copy that fails the local market. Hire writers in each market; do not rely on translation memory alone for surface tone. Lokalise and similar platforms operationalise transcreation workflows.
