# The Five Layers of Prose

Two organizing principles before codifying any layer.

**Style is content, not decoration.** Presentation shapes meaning — a faulty rhythm in a sentence can wreck it as surely as a wrong word. Every syntax choice, every breath point, every clause depth decision is a semantic act, not an aesthetic afterthought.

**Concision is the baseline.** Every word must justify its inclusion. Not brevity for its own sake — lean sentences carry more authority than padded ones because they never ask the reader to work without payoff.

Codify each layer independently. The layers are orthogonal: a brand can have distinctive lexicon and generic syntax (Liquid Death), or distinctive syntax and generic lexicon (Basecamp). Decide per layer where to conform and where to differentiate.

## 1. Lexicon

Word-level rules. Deterministic, testable.

### 1.1 Use / avoid A–Z

A 50–200 entry table. GOV.UK is the gold standard — short entries, alternatives provided, exceptions enumerated.

| Term to use | Why | Term to avoid | Why avoid | Exceptions |
| --- | --- | --- | --- | --- |
| customer | active subject, dignified | user | reductive outside product docs | "user" OK in product docs |
| help | plain | facilitate | empty Latinate | — |
| build / create | concrete | leverage | empty verb | financial sense permitted |
| use | direct | utilize | wordy | — |
| because | causal | due to the fact that | wordy | — |
| make | concrete | deliver (abstract) | GOV.UK: "only pizzas, post and services are delivered" | concrete senses OK |

**Why bother:** banning a word without an alternative creates a vacuum writers fill with the next-worst word. Always pair ban with replacement.

### 1.2 Terminology table

Product names, feature names, capitalization, hyphenation, plural forms. Update on every product launch — a guide that drifts from product reality is ignored by engineers.

### 1.3 Jargon ladder per channel

| Channel grouping   | Specialist terms permitted                              |
| ------------------ | ------------------------------------------------------- |
| Long-form articles | Up to 5 per piece, with one-line glosses                |
| Social posts       | Up to 2 per post, no glosses (link to glossary instead) |
| Email & newsletter | Up to 1 per issue                                       |
| Marketing copy     | None unless category requires (compliance, deep-tech)   |

### 1.4 Acronyms

Spell out on first use per page (GOV.UK convention) OR allow known acronyms unexpanded (Microsoft convention). Pick one. The choice depends on audience expertise — Expert audiences resent expansion of acronyms they own.

### 1.5 Naming conventions

Company, products, features, methodologies. Include possessive forms. Critical for brands with non-standard capitalization (innocent, samber/lo).

### 1.6 Foreign words

Italics or not, accents preserved or stripped, translation in parentheses or not. Especially critical for French-origin brands writing in English. See [multilingual.md](multilingual.md).

### 1.7 Technical depth scale

Three-level: Layperson · Practitioner · Expert. Allocate per channel. Mixing levels within a single piece is the dominant readability failure.

## 2. Syntax

Sentence- and paragraph-level rules.

### 2.1 Sentence length distribution

Plain Language Commission default: **15–20 words mean per sentence**. Category overrides in [category-playbooks.md](category-playbooks.md).

| Metric | Default target | Why |
| --- | --- | --- |
| Mean sentence length | category-specific (10–22) | matches reading age, audience patience |
| Standard deviation | ≥ 6 words per 100-word window | uniform = robotic; variance = human |
| Sentences ≥ 25 words | ≤ 10% | long sentences load short-term memory; rationing protects comprehension |
| Sentences ≤ 8 words | ≥ 15% | punch sentences carry rhythm; their absence = monotony |

**Diagnose:** 1- run a Python `nltk.sent_tokenize` + word-count script on a 1000-word sample; 2- Hemingway readability for grade-level cross-check; 3- read the piece aloud, mark every breath point.

### 2.2 Sentence types

- Declarative as default
- Rhetorical questions: max 1 per long-form piece (or banned entirely — they signal low confidence)
- Imperatives: reserved for CTAs and how-to steps
- Exclamations: rationed per [punctuation policy](#6-punctuation-policy)

### 2.3 Clause depth

Max 2 levels of subordination per sentence. Beyond that, comprehension drops. Coordination preferred for B2C, subordination acceptable for B2B and industry.

### 2.4 Active vs passive

Active default. Passive permitted for: (a) unknown agent, (b) emphasis on object, (c) impersonal scientific register. Codify the exception list — without it, "active voice always" produces awkward science writing.

**Zombie test**: append "by zombies" after the verb. If it works, it's passive ("The data was analyzed [by zombies]").

### 2.5 Parallelism

Enforced in lists, headings, tricolons. Parallel structures must share grammatical category (all noun phrases, or all verb phrases starting with the same tense).

### 2.6 Paragraph length

- Target 2–5 sentences, max 80 words on web
- One-sentence paragraphs permitted for emphasis but ≤ 15% of paragraphs (else they lose impact)

### 2.7 Paragraph architecture

Codify one or two house structures. Defaults:

- **TES**: Topic sentence + 2–3 evidence sentences + implication
- **PEEL**: Point, Evidence, Explanation, Link
- **PAS**: Problem, Agitation, Solution (newsletters, email)
- **Inverted pyramid**: most important first (newsletters, news)

## 3. Rhythm

How sentences move together. Hardest layer to codify; easiest to audit by reading aloud.

### 3.1 Cadence

Target sentence-length variance such that σ ≥ 6 words per 100-word window. Lower = robotic / AI tell. See [anti-patterns.md](anti-patterns.md).

### 3.2 Breath points

One short sentence (≤ 8 words) every 3–5 sentences. **Why:** reading is breathing; missing breath points exhaust the reader's working memory.

### 3.3 Repetition

- Anaphora (repeated openers): permitted in closings and CTAs only, or banned
- Epistrophe (repeated endings): reserved for signature moments

### 3.4 Callbacks

If the hook names a person, the closing returns to that person. **Why:** structural symmetry is a low-cost ethos signal that the piece is built, not generated.

### 3.5 List patterns

- Prefer prose-then-list (introduce in a sentence) over list-then-prose
- Cap lists at 7 items (Miller's law)
- Parallel grammar enforced

### 3.6 White space

- Long-form: subheading every 200–350 words
- Social posts: line break every 1–3 sentences
- Email & newsletter: one idea per paragraph

## 4. Structure

Macrostructures across the piece.

### 4.1 Openings (hooks)

Cross-ref `samber/cc-skills@copywriting-hooks` for the full catalog. State 3–5 permitted hook types per channel grouping. **Forbid**:

- Dictionary-definition openings ("Productivity, defined as...")
- "In today's fast-paced world", "À l'heure du tout-numérique"
- Self-referential openings ("This article will discuss...")

### 4.2 Closings

Cross-ref `samber/cc-skills@copywriting-cta` for end-of-article CTA codification. State 2–3 permitted closing types. **Forbid**: generic "Thanks for reading", "What do you think?" unless signature.

### 4.3 Transitions

Prefer logical connectors (because, therefore, however, but) over additive (also, moreover, furthermore). **Ban** "Last but not least."

### 4.4 Headings

Sentence case, no terminal punctuation, frontloaded with topic noun or active verb, scannable in isolation. GOV.UK rule: "Frontload your headings so that the words that match your users' tasks are at the beginning."

### 4.5 Subheadings

Parallel structure within an article (all questions, or all noun phrases, not mixed).

### 4.6 Lists

Bulleted vs numbered policy (numbered only when order matters). Leading sentence required. No nested lists beyond one level.

### 4.7 Asides

Parentheticals capped at one per 200 words.

### 4.8 Quotations

Attribution style (name, title, organization; no honorifics on second reference). Minimum quote quality bar: does the quote say something the body cannot?

### 4.9 Citations and links

Inline, frontloaded link text. **Never** "click here", "read more", "learn more".

### 4.10 Blockquotes

Reserved for quotes of 25+ words or for high-emphasis claims.

## 4.11 Reader positioning (psychic distance)

Gardner's psychic distance continuum describes how close or far the reader sits from the action, the brand, or the subject matter. In brand prose (not fiction), the spectrum runs:

| Distance | Register | Example |
| --- | --- | --- |
| **Far** | Third-person, external, historical | "Acme was founded in 2005 with a mission to reduce infrastructure costs." |
| **Medium-far** | Category framing, industry truth | "Most infrastructure teams spend 40% of their time firefighting, not building." |
| **Medium-close** | Reader-adjacent, hypothetical | "Your team is probably dealing with this right now." |
| **Close** | Second-person present, internal experience | "You open the dashboard. The number is wrong. Again." |

**Why it matters:** distance controls emotional temperature. Far establishes authority and context. Close creates empathy and drives conversion. Uncontrolled oscillation reads as schizophrenic; deliberate oscillation creates emotional shape.

### Default positions per channel

| Channel grouping | Default | Rationale |
| --- | --- | --- |
| Long-form articles | Medium-far opening → close at key anecdote → far for analysis → close at CTA | Authority frame, then humanity, then rigor, then conversion |
| Social posts | Close hook → medium for argument → close for CTA | Hook must land immediately; brevity requires intimacy |
| Email & newsletter | Medium-close default | Personalization convention; inbox is a private channel |
| Marketing copy | Close default for emotional sections, far for proof/credibility | Conversion copy needs immersion; proof copy needs objectivity |

### Shift signals

Moving **closer**: second-person pronouns ("you", "your"), present tense, sensory detail, internal monologue framing ("You're wondering if…"), short sentences, concrete nouns.

Moving **farther**: third-person, past tense, statistics, brand history, passive constructions, abstract nouns, long sentences.

**Diagnose:** scan a 1500-word piece and annotate each paragraph with its distance level (F / MF / MC / C). A flat distribution (all one level) means the piece has no emotional shape. High variance without a pattern means oscillation is accidental. The target is an intentional arc.

## 5. Voice markers

The small set of repeatable signature elements that make the brand recognizable in a blind test. Catalogue 5–12 markers; more is unenforceable.

| Marker | Definition | Example |
| --- | --- | --- |
| Signature moves | Recurring rhetorical move | Basecamp's contrarian one-sentence paragraph |
| Signoffs | Fixed or templated closing line | Innocent's "Win." |
| Recurring metaphors | 2–3 metaphors the brand owns and reuses | — |
| Idioms | Curated short list (drift is a strong signal of distributed-team decay) | — |
| Taboos | Explicit list of phrases the brand never uses | "leverage", "delve", "in today's fast-paced world" |
| Intentional tics | Deliberately quirky moves (named, rationed) | Innocent's lowercase brand name; Oatly's parenthetical meta-commentary |

**Rationing matters.** Innocent's puns work because they are rationed. Unrationed quirks collapse into self-parody (the Wackywriting failure mode, per Nick Asbury).

## 6. Punctuation policy

Declare a position on each. The list is non-negotiable — silence creates drift.

| Mark | Position |
| --- | --- |
| Em dash | Permitted / banned (declare) — current AI-tell candidate; rationed even when permitted |
| En dash | Ranges only (2024–2026) |
| Semicolon | Permitted in long-form, banned in social and email subject lines |
| Colon | Lists, examples, rephrased restatements; max 1 per paragraph |
| Ellipsis | Banned outside direct quotation (AI tell) |
| Parentheses | Rationed: 1 per 200 words |
| Italics | Foreign words, titles of works, technical first-use emphasis |
| Bold | Scannable phrases in long-form only |
| Quotation marks | Single (UK) or double (US) per locale; consistent |
| Exclamation marks | 1 per 1000 words in long-form; 1 per LinkedIn post; 1 per newsletter |
| Brackets | Editorial insertions in quotations only |
| Hyphens | Compound modifiers before nouns (well-known author); maintain a hyphenated-compound list |
| Oxford comma | Declare yes/no, enforce |
| Capitalization | Sentence case for headings (Microsoft, Mailchimp, IBM Carbon default); title case for proper nouns and product names |

## 7. Formatting policy

| Element | Rule |
| --- | --- |
| H1 | One per page |
| H2 | Sections |
| H3 | Sub-sections |
| H4+ | Technical docs only |
| Heading length | ≤ 70 characters |
| Bullets | 3–7 items, parallel grammar, leading sentence required, max 1 level of nesting |
| Numbered lists | Only when sequence matters |
| Code blocks | Language tag mandatory, max 30 lines, prose explanation precedes code |
| Images | Sentence-case captions, descriptive alt text mandatory (WCAG 2.2) |
| Callouts (note, warning, tip) | Rationed: 1 per 800 words in long-form |
| Tables | Only when relationship is two-dimensional |
| Links | Frontloaded link text — never "click here", "learn more", "read more" |
