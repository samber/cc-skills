# Brand Atlas

A short, opinionated catalogue of brands whose prose is identifiable in a blind test. Use during Phase 2 archetype matching: ask "which of these does the brand most resemble?" and "where does it want to differentiate?"

Each entry: one-line summary of the diagnostic feature.

## Consumer brands

**Mailchimp** — short, declarative, sentence-case, contractions, Oxford comma, plain Anglo-Saxon verbs, sparing humor, never patronizing. _Diagnostic_: sounds like a colleague writing an email at 3pm.

**Innocent Drinks** — ultra-short sentences (frequently 4–8 words), product-as-narrator first person, lowercase brand name, hand-written-feeling asides, fruit puns rationed. _Diagnostic_: a sentence that ends in "Win." or a parenthetical aside in product voice.

**Patagonia** — long, journalistic, magazine-feature openings; named human protagonists (Chilean fishermen, female carpenters, Japanese sake brewers); data points embedded in narrative; declarative ethical claims. _Diagnostic_: a story about a named person with a place name in the dek.

**Liquid Death** — maximalist horror-genre register, mock-tabloid microcopy, all-caps headlines, sentence fragments as exclamations, satirical "About" pages. _Diagnostic_: a product description that reads like a B-movie pitch.

**Oatly** — handwritten-style asides, faux-naïve voice, self-deprecation, parenthetical meta-commentary on its own marketing.

**Apple** — terminal sentence economy and sentence-case discipline.

## B2B / SaaS brands

**Stripe** — footnoted, narrative-memo prose. Patrick Collison structures emails like research papers with footnotes. _Diagnostic_: a paragraph that pre-empts an objection in parentheses or a footnote. Stripe defaults to writing over slide decks across the entire company.

**Linear** — terse, declarative, no marketing adjectives, single-sentence value propositions, present-tense product claims, dense product screenshots in lieu of explanation. _Diagnostic_: a sentence with no adjective.

**Slack** — friendly imperatives, microcopy as small talk, sentence-case headings, contractions, frequent second person. _Diagnostic_: a UI string that begins with a verb and feels like a coworker.

**Notion** — didactic-but-warm, lists everywhere, second-person, "you can…" constructions, definitions before features. _Diagnostic_: help-doc cadence even in marketing copy.

**Basecamp / 37signals** — opinionated, contrarian, short paragraphs, frequent one-sentence paragraphs, dialectical structure (claim/counterclaim/resolution). _Diagnostic_: a one-sentence paragraph that contains an opinion.

**Mailerlite** — clear, didactic, list-heavy, second-person, low jargon, screenshot-rich. _Diagnostic_: a numbered list that is the article.

## Social media voices

**Wendy's social** — punchline-first, sentence fragments, callbacks to previous posts, no hashtags. _Diagnostic_: a reply that is funnier than the prompt.

**Duolingo social** — chaos register, lowercase, ironic threats, owl-as-narrator. _Diagnostic_: a post that would be a fireable offense at any other brand.

## Reference frameworks

The published style guides worth reading in full before codifying:

**Nielsen Norman Group, _The Four Dimensions of Tone of Voice_** (Moran, 2016) — funny↔serious, formal↔casual, respectful↔irreverent, enthusiastic↔matter-of-fact. Use as sanity check; not a prose rule.

**Mailchimp Content Style Guide** (styleguide.mailchimp.com) — most-copied open template. Take the structure (Voice and tone, Grammar and mechanics, Writing about people, Writing for accessibility).

**GOV.UK Style Guide** — the discipline of plain language. Targets reading age 9 across the site; maintains a strict A–Z banned-word list. Take the discipline of a maintained A–Z list.

**Microsoft Writing Style Guide** (learn.microsoft.com/style-guide) — sentence case in headings, Oxford comma, contractions allowed, "Write short, simple sentences." Mean target 15–20 words per sentence.

**IBM Carbon Design System** (carbondesignsystem.com/guidelines/content/overview) — codifies voice as a nine-attribute checklist. Take the rare technique of writing voice as a checklist an editor can apply line by line.

**Atlassian Design System** (atlassian.design/content) — "be bold, be optimistic, be practical, with a wink" tetrad, paired with the internal "Voicify" sliding-scale tool. Take the situational-flex model for newsletters and product-led content.

**Buffer Style Guide** (buffer.com/resources/style-guide) — voice attributes "relatable, approachable, genuine, inclusive". Product copy rules unusually prescriptive: "Invite the customer to take an action. Never command." Take the prescriptive product-copy block.

## Canonical writing books

For the brand owner and editor to read once, not the writers:

- **Ann Handley, _Everybody Writes_ (2nd ed., 2022)** — the 17-step "Writing GPS", the "ugly first draft" doctrine, "Create reading momentum."
- **William Zinsser, _On Writing Well_** — the pruning doctrine ("clutter is the disease of American writing"). Operationalize as a 20% cut rule on every draft.
- **Strunk & White, _The Elements of Style_** — rule 17 ("Omit needless words"), rule 11 ("Use the active voice"). Overrideable defaults.
- **Joseph Williams, _Style: Lessons in Clarity and Grace_** — the character-action principle (subjects should be characters, verbs should be actions). The most useful syntactic rule for technical writers escaping nominalizations.
- **Roy Peter Clark, _Writing Tools_** — Tool 2 ("Order words for emphasis": strongest word at the end, second strongest at the start) and the parallelism toolkit.
- **Heath brothers, _Made to Stick_** — the SUCCES heuristic for openers and closers, especially Concreteness.
- **Margot Bloomstein, _Content Strategy at Work_ and _Trustworthy_** — the BrandSort message-architecture method, the prerequisite to a prose guide.
- **Nicole Fenton and Kate Kiefer Lee, _Nicely Said_** — the simple style-guide template at the end of the book is the minimum viable prose guide.

## Corpus linguistics methods

For quantitative audits, the relevant methods:

- **Type-token ratio** — vocabulary diversity per piece
- **Mean sentence length distribution** — central rhythm signal
- **n-gram frequency** — top bigrams and trigrams; drift detection
- **POS-tag profiles** — verb/noun/adjective ratios; detects nominalization drift
- **Banned-word frequency** — direct enforcement metric

These are the only way to detect prose drift in a large content operation. See [audit-tools.md](audit-tools.md) for the actual tools.

## How to use this atlas in Phase 2

1. Ask the brand owner which 1–3 brands they admire most (not necessarily in their category).
2. Ask which 1–3 brands they actively want to **avoid sounding like**.
3. Map both sets to the entries above where possible; for unrecognized brands, run an inline corpus skim.
4. Codify the "differentiate" axis: which of the loved brand's signature moves to borrow; which of the avoided brand's defaults to ban.

The atlas is not exhaustive. A brand that does not resemble any entry here is interesting — codify what they actually do, then file it under a new entry for next time.
