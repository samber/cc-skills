# Anti-Patterns and AI Tells

The dominant prose-drift risk in content factories is convergence on LLM-default register. This file inventories the patterns to ban explicitly in PROSE.md and to check for in AUDIT mode.

Refresh yearly. Lexical and structural tells evolve as models change.

## Lexical tells

Words and phrases that appear at elevated frequency in LLM-generated text. Roger J. Kreuz (_The Conversation_, 2025) documented "a dramatic increase in relatively uncommon words, such as 'delves' or 'crucial,' in articles published in scientific journals over the past couple of years."

### Single-word tells

| Word | Common in LLM output as | Replacement strategy |
| --- | --- | --- |
| delve | "let's delve into…" | "examine", or just say the thing |
| leverage | "leverage X to achieve Y" | "use", or restructure to active verb |
| crucial | "this is crucial" | drop or be specific about why |
| robust | "robust framework / system" | name the property concretely |
| underscore | "this underscores the importance of…" | "shows" / "proves" / "means" |
| navigate | "navigate the complexities of…" | drop the navigation metaphor; say the thing |
| seamlessly | "integrates seamlessly" | replace with what it actually does |
| vibrant | "vibrant community" | give a concrete signal of vibrancy |
| dynamic | "dynamic landscape" | be specific about what changes |
| embark | "embark on a journey" | drop the journey metaphor |
| foster | "foster collaboration" | "build" / "support" / "encourage" |
| harness | "harness the power of" | drop the harnessing metaphor |
| myriad | "a myriad of options" | "many" / specific number |
| tapestry | "rich tapestry of" | drop the tapestry metaphor |
| paradigm | "new paradigm" | "model" / "approach" — usually drop |
| pivotal | "pivotal moment" | be specific about why it pivoted what |
| holistic | "holistic approach" | name the components |
| synergize | n/a | banned in any register |
| utilize | "utilize" | "use" |
| facilitate | "facilitate" | "help" / "let" / "enable" |
| commence | "commence operations" | "start" / "begin" |
| furthermore | sentence opener | replace with "and" / drop / restructure |
| moreover | sentence opener | replace with "also" / drop |
| notwithstanding | "notwithstanding the…" | "despite" |

### Phrase tells

- "It's not just X, it's Y" — the formula construction; LLMs emit this 5–10× human baseline rate
- "In conclusion,…" — summative closer; humans usually skip it
- "It's important to note that…" — hedging that adds nothing
- "It's worth noting that…" — same
- "Crucially,", "Notably,", "Importantly,", "Essentially," — sentence-opener hedges
- "Picture this:" / "Imagine a world where" / "What if I told you" — manufactured-curiosity openings
- "Whether you're a seasoned X or a curious newcomer" — audience-segmenting filler
- "In the realm of" / "Navigating the landscape of" — empty scene-setting
- "Unlock the power of" / "Dive into" / "Buckle up" / "Let's dive in" — hype openers
- "From the comfort of your own home" — copywriting cliché
- "At the end of the day" — empty connector
- "Last but not least" — banned in lists
- "In today's fast-paced world" / "In an era of" — universally banned opener
- "Hope this helps!" — chatbot signature

### French phrase tells

- "Dans un monde en constante évolution" — universally banned French opener
- "Plongez dans…" — equivalent of "dive into"
- "Découvrez comment…" — over-used in French AI output
- "Par ailleurs,…" / "Notamment,…" — over-used sentence openers
- "Il est crucial de…" — French equivalent of "it is crucial to"
- "À l'heure du tout-numérique" / "À l'ère de l'IA" — universally banned openers
- "N'hésitez pas à…" — chatbot-flavored closing

## Structural tells

Isabel Al-Dhahir (_Verdict_, 2024): "AI models also overuse tricolons, a rhetorical device that consists of a series of three parallel words, phrases, or clauses."

| Pattern | Why it's a tell | Counter |
| --- | --- | --- |
| Tricolons in series ("X, Y, and Z") | LLMs default to threes everywhere; humans vary list lengths | Limit lists of 3 to 1 per 1000 words; use 2-item or 4-item lists elsewhere |
| Colon-titles ("The Future of X: A New Paradigm") | Over-represented in LLM headlines | Use single-clause titles; drop the colon |
| Summative closers ("In conclusion,…") | Humans skip this in 80%+ of pieces | End on the thing itself; no recap |
| Bullet-list overuse | LLMs convert prose to bullets reflexively | Audit: bullet-density per piece. Cap. |
| Hedged claims without source | "It is widely believed that…" / "Many experts agree…" | Force citations or remove |
| Symmetric paragraph lengths | Uniform 4-sentence paragraphs across the piece | Force variance via the rhythm rules |
| Anaphora overuse | Repeated openers in clusters | Reserve anaphora for closings only |
| "Not only X, but also Y" | LLM-favored coordination | Use "X. And Y." or restructure |

## Punctuation tells

The em-dash debate is contested. Ann Handley's published rebuttal (_The Em Dash Is NOT an AI Tell_, annhandley.com) argues it is unreliable as a single signal. Treat as suspicion, not proof.

| Punctuation pattern | Strength of signal |
| --- | --- |
| Em-dash density > 1 per 200 words | Weak — humans vary widely |
| Ellipsis outside direct quotation | Moderate |
| Parenthetical asides > 1 per 200 words | Weak |
| Em dash + tricolon + summative closer in same piece | Strong |

## Statistical tells

GPTZero (Edward Tian) frames detection as **perplexity** (how predictable to a language model) plus **burstiness** (sentence-length variance).

- **Low perplexity** correlates with AI generation. Hard to measure without tooling.
- **Low burstiness** = uniform sentence length. Measurable: σ < 4 words per 100-sentence window suggests automation. σ ≥ 6 is the human baseline target.

## Detection unreliability

Liang et al. (2023), _GPT detectors are biased against non-native English writers_ (_Patterns_, Cell Press; Stanford HAI): "These platforms incorrectly labeled more than half of the essays as AI-generated, with one detector flagging nearly 98%" of TOEFL essays by non-native English writers.

**Operational consequence**: use detectors as triage, not verdict. Codify rules LLMs cannot follow by default — that is the durable defense, not a detector arms race.

## Counter-measures for content factories

1. Codify rules that LLMs cannot follow by default: idiosyncratic lexicon, named taboos, sentence-length variance targets, specific voice markers.
2. Use the PROSE.md as the AI system prompt; supplement with the brand's published corpus as few-shot examples.
3. Editor reviews 100% of AI-assisted content with the audit scorecard.
4. Run regular n-gram comparison between the brand's pre-AI corpus and post-AI corpus to detect lexical drift.
5. Invoke `samber/cc-skills@humaniseur-fr` (for French) or an equivalent humanizer skill as a final pass on AI-assisted drafts. Note: humanizers do not replace the prose guide — they scrub the patterns the guide already banned.

## Cliché opener inventory

A list to embed in the brand's taboos section. These all immediately disqualify the writer:

**English**:

- "In today's fast-paced world…"
- "Have you ever wondered…?"
- "Did you know…?"
- "What if I told you…?"
- Dictionary opener played straight ("Productivity, defined as…")
- "In this article, I'll discuss…"
- "I'm not an expert, but…"
- Three rhetorical questions in a row
- "Imagine waking up…" without a specific scene
- "Hot take:", "Unpopular opinion:"
- "At [Company], we believe…"
- "Recently,…" without a specific date
- "You're not alone."
- "We've all been there."
- "Buckle up,"
- Misattributed Einstein / Seneca / Confucius / Bouddha quotes

**French**:

- "À l'heure du tout-numérique"
- "À l'ère de l'IA"
- "Dans un monde où…"
- "Vous êtes-vous déjà demandé…?"
- "Dans cet article, nous allons voir…"
- "Je ne suis pas spécialiste mais…"
- "Voici la vérité que personne ne veut entendre…"
- "Récemment,…" sans date précise
- "Chez [Entreprise], nous pensons…"
- "Cher lecteur," (in newsletter)
- "Les études montrent que…" sans source
- "90% des gens…" sans source

## Diagnose

When auditing a piece for AI tells:

1. `grep -c -iE 'delve|leverage|crucial|robust|underscore|seamlessly|navigate|harness|foster|embark|myriad|tapestry|holistic|paradigm|utilize|facilitate|commence'` — count single-word tells. > 1 per 500 words = strong tell.
2. Count em dashes per 1000 words. > 5 = check the context.
3. Compute sentence-length σ on a 100-sentence sample. σ < 4 = robotic cadence.
4. Search for the formula constructions ("It's not just X, it's Y"; "Whether you're a seasoned X"). Any hit = rewrite.
5. Check tricolon density per 500 words. > 3 = AI-favored.
