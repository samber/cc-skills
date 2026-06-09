---
name: copywriting-hooks
description: >
  Generate opening hooks and post titles for long-form articles in EN or FR — blog posts, Substack/Medium/dev.to, LinkedIn long-form, paid newsletters, opinion essays, reported features, technical deep-dives. Trigger whenever the user asks for a hook, opening, lede, intro, first sentence/paragraph, opener, accroche, attaque, phrase d'accroche, or première phrase — including making a flat intro punchier or rewriting a draft opening. Also trigger when user asks for a post title, titre d'article, headline, or when ghostwriting skills reach the opening or titling step. Proposes 3-4 hooks pulling distinct psychological levers (curiosity gap, contrarian, scene, promise, authority), 2 candidates each, waits for the user to pick. Do NOT trigger for social posts (LinkedIn feed, Twitter/X, TikTok, Bluesky, Threads), READMEs or doc first lines, taglines, email subjects or openers, ad copy (Google/Meta Ads), landing-page headlines, press releases, SEO meta, fiction openings, talk/podcast/video script intros, or body rewrites.

user-invocable: true
license: MIT
compatibility: Designed for Claude Code or similar AI coding agents.
metadata:
  author: samber
  version: "1.0.0"
  openclaw:
    emoji: "🪝"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent
---

# Copywriting Hooks

## The method

A hook's only job is to make the reader want sentence 2. Voice, structure, formatting, all of it, follow from that one job.

What makes a reader want sentence 2 is one of **five levers**:

1. **Open a gap.** Pose something incomplete that the reader needs to close. Curiosity gap, question, open loop.
2. **Break a prediction.** State something that violates the reader's prior. Contrarian, definition reversal, surprising statistic.
3. **Drop into a scene.** Load sensory or specific detail that builds a vivid frame. In medias res, concrete detail, time anchor.
4. **Promise a payoff.** Name an outcome the reader wants. Benefit, "if you... then this", direct problem.
5. **Borrow weight.** Lean on a name, number, or quote that carries embedded authority. Authority hook, statistic, quote with disagreement.

A strong hook usually pulls two levers at once. "Frank Sinatra, holding a glass of bourbon..." is scene plus open loop. "Most people think X. They're wrong." is prediction-break plus gap. Single-lever hooks can still work but are easier to ignore.

Three further principles:

- **Specific beats abstract every time.** Replace "many companies" with "Stripe, Shopify, Vercel". Replace "recently" with a date. Replace "studies show" with the actual finding or cut the claim.
- **The first sentence must force the second.** Read each candidate cold. If you would not click sentence 2 after sentence 1, rewrite.
- **Match technique to article type.** Personal essay does not open like a tutorial. See the type-fit table below.

---

## Behavior

When this skill triggers:

1. **Confirm the brief.** Topic, audience, target language (EN, FR, or both), approximate length, where it will be published. If any of these is unclear and material, ask before generating.
2. **Pick 3 to 4 hooks from the catalog** below that are genuinely different. Different levers, not three flavors of contrarian.
3. **Write 2 candidates per hook**, specific to the user's article. The two candidates within one hook should explore different angles (different anecdote, different statistic, different scene), not be rewordings of each other.
4. **Present using the Output format** below.
5. **Use `ask_user_input_v0`** if available. The choice is a small fixed set, which is what that tool is for.
6. **Wait for the user's pick.** Do not pick for them.
7. **After they pick**, name what the choice commits the rest of the article to. A contrarian hook commits paragraphs 2 to 3 to defending the non-consensus claim. A scene opener commits the next section to either resolving the scene or productively delaying it.

**Diversification rule.** Across your 3 to 4 options include at minimum:

- One intellectual hook (contrarian, definition reversal, historical analogy, curiosity gap)
- One sensory hook (in medias res, concrete detail)
- One reader-direct hook (conditional, direct problem, promise)

This guarantees real choice. Three flavors of contrarian is not a choice.

**Type-fit reference:**

| Article type | Strong hooks | Avoid |
| --- | --- | --- |
| Technical deep-dive | concrete detail, statistic, contrarian, direct problem | personal confession, scene opener |
| Personal essay | in medias res, personal confession, time anchor, definition reversal | bold claim, direct problem |
| Opinion / contrarian | bold claim, definition reversal, contrarian, quote + disagreement | gentle setup, dictionary opener |
| Tutorial / how-to | direct problem (PAS), promise, conditional | scene opener, historical analogy |
| Reported / investigative | concrete detail, time anchor, in medias res, statistic | bold claim, definition reversal |
| Listicle | curiosity gap, counted stakes, conditional | personal confession, in medias res |
| Longform analysis | historical analogy, statistic, contrarian | direct problem |
| Newsletter issue | personal confession + open loop, conditional, curiosity gap | dictionary opener |

---

## Output format

Always present options exactly like this:

```
## Hook options for: [working title]

**Option 1: [Hook name]** ([lever])
A. [Candidate 1]
B. [Candidate 2]

**Option 2: [Hook name]** ([lever])
A. [Candidate 1]
B. [Candidate 2]

**Option 3: [Hook name]** ([lever])
A. [Candidate 1]
B. [Candidate 2]

Which? Reply with letter combination (e.g., "1B") or "more" for different techniques.
```

If the user says "more" or "none", produce 3 different hooks (not new candidates for the same hooks). If the user says "blend 1A and 2B", write a combined hook and check in again.

---

## The hook catalog (18)

Each hook: what it does, examples (mix EN and FR, real and illustrative), when to use, when to avoid.

### 1. Curiosity Gap

Open an information gap the reader wants closed.

- EN: "How does Shen Yun make any money? Short answer: they don't." (Packy McCormick)
- EN: "Many years ago, one mustard dominated the supermarket shelves: French's." (Gladwell, "The Ketchup Conundrum")
- FR: "Trois startups françaises ont franchi le milliard cette année. Aucune n'est dans la tech."
- EN: "I've been a surgeon for eight years. For the past couple of them, my performance in the operating room has reached a plateau." (Gawande)

**Use when**: you can honestly close the gap in 2 or 3 sentences. The gap must be one the reader cares about. **Avoid**: vague gaps ("You won't believe what happened next") that the reader cannot even guess at.

### 2. Contrarian

Knock down a consensus belief the reader holds.

- EN: "Prevailing wisdom claims that the best way to achieve what we want in life is to set specific, actionable goals." (Clear, "Forget About Setting Goals", proceeds to argue the opposite)
- EN: "To do something well you have to like it. That idea is not exactly novel." (Graham, "Do What You Love", proceeds to complicate it)
- EN: "If you're not saying 'HELL YEAH!' about something, say no." (Sivers)
- FR: "Le Marketing est TOUT ce que l'IA ne peut pas faire !" (Truphème)

**Use when**: you have a defensible non-consensus view and 200 to 400 words to defend it. **Avoid**: strawmen, gratuitous edginess, contrarianism for its own sake.

### 3. Bold Claim / Promise

State the outcome upfront, before the proof.

- EN: "At 60 miles an hour the loudest noise in this new Rolls-Royce comes from the electric clock." (Ogilvy)
- EN: "They laughed when I sat down at the piano. But when I started to play!—" (Caples 1925)
- EN: "Give me 15 minutes and I'll give you a super-power memory." (Schwartz)
- FR: "En 5 minutes : la structure qui fait passer le taux de complétion d'un article de 18% à 64%."

**Use when**: you can deliver on the promise concretely in the article. **Avoid**: promises larger than the payoff. Destroys trust permanently.

### 4. Scene Opener / In Medias Res

Drop the reader inside a specific moment, no setup.

- EN: "Frank Sinatra, holding a glass of bourbon in one hand and a cigarette in the other, stood in a dark corner of the bar between two attractive but fading blondes who sat waiting for him to say something." (Talese)
- EN: "We were somewhere around Barstow on the edge of the desert when the drugs began to take hold." (Thompson)
- EN: "The center was not holding." (Didion)
- FR: "Le 14 mai 2024, à 6h12, trois hommes en civil sonnent à la porte d'un appartement du XVe arrondissement."

**Use when**: longform, profile, reported piece, essay. **Avoid**: short technical pieces where the reader has not earned the scene yet.

### 5. Surprising Statistic

Lead with a number that violates the prior.

- EN: "You have five seconds to get people's attention." (Housel, self-demonstrating)
- EN: "Thirty-seven thousand Americans died in car accidents in 1955, six times today's rate adjusted for miles driven." (Housel)
- EN: "Approximately 40 percent of the actions you perform each day are habits, not actual decisions." (Clear)
- FR: "Tu as moins de 3 secondes pour convaincre tes audiences que ton contenu est intéressant." (Truphème)

**Use when**: the number is genuinely surprising and you can cite it accurately. **Avoid**: vague stats ("studies show 90%..."), stats that confirm the reader's prior (no surprise equals no hook).

### 6. Question

Pose a question the reader actually wants answered.

- EN: "If you collected lists of techniques for doing great work in a lot of different fields, what would the intersection look like?" (Graham)
- EN: "Why do we make kids go to school?" (Caplan)
- FR: "Pourquoi 80% des articles LinkedIn ne dépassent jamais 100 vues ? Spoiler : ce n'est pas l'algorithme."
- FR: "Avez-vous le courage de gagner la moitié d'un million de dollars cette année ?" (Schwartz)

**Use when**: the reader was implicitly carrying the question. **Avoid**: "Have you ever wondered...?", "Did you know...?", "What if I told you...?". These presuppose curiosity not yet formed.

### 7. Quote + Disagreement

Borrow weight, then twist.

- EN: "Vernor Vinge: 'We are on the edge of change comparable to the rise of human life on Earth.'" (Urban setup)
- EN: "Steve Jobs said people don't know what they want until you show it to them. For SaaS, this is exactly backwards."
- EN: "Henry Ford supposedly said his customers would have asked for faster horses. For most products, that excuse is wrong."
- FR: "Henry Ford disait qu'on lui aurait demandé des chevaux plus rapides. Pour 90% des produits, c'est faux."

**Use when**: you have a real quote that supports or genuinely contrasts your point. **Avoid**: misattributed Einstein, Seneca, Confucius, Bouddha platitudes. Cliché.

### 8. Personal Confession

Admit something vulnerable, then universalize.

- EN: "I cheated on my husband." (Strayed)
- EN: "I've been thinking about my parents, who are in their mid-60s. During my first 18 years, I spent some time with my parents during at least 90% of my days." (Urban, "The Tail End")
- EN: "It's been a minute. This is as long as I've gone without writing an essay since starting Not Boring." (McCormick)
- FR: "À 34 ans, j'ai démissionné sans plan B. Voici ce que personne ne dit sur la suite."

**Use when**: personal byline, essay, newsletter. **Avoid**: corporate byline, technical articles where the author voice is not personal, performative vulnerability ("I almost didn't write this...").

### 9. Concrete Specific Detail

Replace abstraction with a single vivid detail.

- EN: "John Laroche is a tall guy, skinny as a stick, pale-eyed, slouch-shouldered, and sharply handsome, despite the fact that he is missing all his front teeth." (Orlean)
- EN: "Charles Bukowski was an alcoholic, a womanizer, a chronic gambler, a lout, a cheapskate, a deadbeat, and on his worst days, a poet." (Manson)
- FR: "Quand on la voit arriver dans les locaux du Bondy Blog, ce samedi 24 février, difficile de se dire qu'elle est fichée illégalement par les services de renseignement français."
- FR: "Un Post-it collé sur mon écran : 'Supprime ton premier paragraphe.'"

**Use when**: profile, reported piece, contrarian biographical setup. **Avoid**: specificity that does not advance the thesis (clutter).

### 10. Pattern Interrupt

Break expected rhythm with a fragment.

- EN: "Wait." (Godin style)
- EN: "Stop."
- EN: "This is not an article about productivity. It's an article about identity."
- FR: "Non. Ce que vous avez lu cette semaine sur l'IA est faux. Voici pourquoi."

**Use when**: rhythm-driven content, opinion piece, when the reader expects flow and you want to interrupt it. **Avoid**: every article. It becomes its own pattern fast.

### 11. Direct Problem (PAS)

Name the pain, sharpen it, hint at solution.

- EN: "Your articles aren't read. The data says you lose 80% of readers by paragraph two. There's a fix, and it's not what you've been doing."
- EN: "If you're like most marketing managers, you don't have enough time to write your white papers, and the ones you outsource come back generic." (Bly)
- FR: "Vos emails ne sont pas ouverts. Trois mois, taux plafonné à 12%. Le problème n'est pas l'objet, c'est l'expéditeur."
- FR: "Vos articles ne sont pas lus. 80% des lecteurs décrochent dès le deuxième paragraphe. Et la solution n'est pas celle que vous croyez."

**Use when**: tutorial, how-to, sales-adjacent content. **Avoid**: manufactured problems. Reads as fear-mongering. The pain must be real and recognizable.

### 12. Promise / Benefit

State a specific, bounded outcome.

- EN: "Read this in 5 minutes and you'll never write a weak opening again."
- EN: "By the end of this article, you'll know exactly when to use goroutines and when not to."
- EN: "Three things separate writers who get read from writers who don't. None involve writing every day."
- FR: "En 5 minutes : la structure qui fait passer le taux de complétion d'un article de 18% à 64%."

**Use when**: tutorial, how-to. **Avoid**: vague promises ("Learn how to be more productive"). Add a time bound or a number to anchor it.

### 13. Historical Analogy

Open with a vignette from history, pivot to the present.

- EN: "On a Tuesday morning in March 1976, a 21-year-old college dropout sold his Volkswagen Bus for 1,500 dollars. He used the money to build the first Apple computer."
- EN: "In 1965, Robert Lucas wrote a four-page paper that broke macroeconomics."
- EN: Wright Brothers vignette (Housel, "Three Big Things"), pivots to demographics and interest rates.
- FR: "En 1903, à Kitty Hawk, deux frères réparateurs de vélos volent pendant 12 secondes. Personne ne remarque. Voici ce que cette indifférence dit de l'adoption technologique aujourd'hui."

**Use when**: longform analysis, opinion piece, idea essay. **Avoid**: tutorials, news pieces. Reads as indulgent.

### 14. Definition Reversal

"X is not what you think. It's Y."

- EN: "Procrastination isn't laziness. It's a fight between two parts of your brain."
- EN: "This is not an article about productivity. It's an article about identity."
- EN: "Generics were the most requested Go feature for a decade. Three years in, the people who pushed hardest for them are telling you to stop using them."
- FR: "Le copywriting n'est pas de l'écriture. C'est de la psychologie déguisée en phrases."

**Use when**: opinion piece, contrarian deep dive. **Avoid**: when your reframe is just a slight angle. Sounds gimmicky.

### 15. Authority Borrow

Lead with a name plus a specific action.

- EN: "Warren Buffett, at 91, still reads 500 pages a day."
- EN: "When Steve Jobs returned to Apple in 1997, he killed 70% of the product line in his first year."
- EN: "A boy once asked Charlie Munger..." (Housel narrative variant)
- FR: "Quand Bernard Arnault a racheté Tiffany pour 16 milliards, trois analystes ont prédit un échec. Ils s'étaient tous trompés sur la même chose."

**Use when**: business piece, profile, analytical essay. **Avoid**: name-dropping without payoff. The action must be specific and relevant.

### 16. Time Anchor

Lead with a specific date, hour, or moment.

- EN: "October 2005. Three journalists set up a blog in an apartment of the cité Blanqui, in Bondy."
- EN: "In 2022, the cost of writing a competent article dropped to zero. Most writers haven't noticed."
- EN: "On a Tuesday morning in March 1976, a 21-year-old dropout sold his Volkswagen Bus for 1,500 dollars."
- FR: "Octobre 2005, Bondy. Trois journalistes installent un blog dans un appartement de la cité Blanqui."

**Use when**: reported piece, retrospective, "why now" framing. **Avoid**: vague time anchors ("recently", "these past few years"). Use a specific date or cut the time framing.

### 17. Conditional ("If you... then this")

Self-segment the reader. Pre-target the curiosity.

- EN: "If you write for a living, you've probably been taught to start with context. Don't."
- EN: "If you've ever read a blog post and forgotten what it said within the hour, this article is the diagnostic."
- EN: "If you're not saying 'HELL YEAH!' about something, say no." (Sivers)
- FR: "Si vos articles sont lus à 80% par vos collègues et à 8% par vos prospects, le problème n'est pas le contenu. C'est l'accroche."

**Use when**: tutorial, advice piece, segmented audience. **Avoid**: conditions too broad ("If you've ever felt stuck..."). Segments nobody.

### 18. Open Loop

Start something, withhold the resolution.

- EN: Talese's Sinatra waiting for him to say something. He never says.
- EN: "He pressed Send and waited. Forty-seven seconds later, the company was worth 4 billion dollars less."
- EN: "Now here's where it gets really interesting..." (Sugarman, transition phrase, also valid as opener)
- FR: "J'ai été contacté par un éditeur la semaine dernière. Ce qu'il m'a demandé m'a fait reconsidérer 15 ans de pratique."

**Use when**: longform, pieces where the journey matters as much as the answer. **Avoid**: unresolved loops. Creates disproportionate betrayal when the article ends without paying off.

---

## Anti-patterns (never propose any of these)

Cliché openers that immediately disqualify the writer:

- "In today's fast-paced world..." / "À l'heure du tout-numérique" / "À l'ère de l'IA" / "Dans un monde où..."
- "Have you ever wondered...?" / "Vous êtes-vous déjà demandé...?"
- Dictionary opener played straight ("Productivity, defined as...")
- "In this article, I'll discuss..." / "Dans cet article, nous allons voir..."
- Generic stats without source ("90% of people...", "Les études montrent...")
- Misattributed Einstein / Seneca / Confucius / Bouddha quotes
- "I'm not an expert, but..." / "Je ne suis pas spécialiste mais..."
- Three rhetorical questions in a row
- "Imagine waking up..." without a specific scene
- "Hot take:", "Unpopular opinion:", "Voici la vérité que personne ne veut entendre..."
- "At [Company], we believe..." / "Chez [Entreprise], nous pensons..."
- "Recently,..." / "Récemment,..." without a specific date
- "You're not alone."

Current AI tells (refresh yearly):

- "It's not just X, it's Y" (the formula construction)
- "Picture this:", "Imagine a world where...", "What if I told you..."
- "Whether you're a seasoned X or a curious newcomer..."
- "In the realm of...", "Navigating the landscape of..."
- "Unlock the power of...", "Dive into...", "Buckle up,", "Let's dive in"
- "Crucially,", "Notably,", "Importantly,", "Essentially," as sentence openers
- French AI tells: "Dans un monde en constante évolution", "Plongez dans...", "Découvrez comment...", "Par ailleurs,...", "Notamment,...", "Il est crucial de..."

Run every candidate through this list before presenting. If a candidate matches, rewrite.

For the extended anti-pattern list, see `references/anti-patterns.md`.

---

## Language handling

**If the audience is French**: write in French. Apply the _attaque journalistique_ register: concrete scene-setting, restrained tone, dated anchors, formal "vous" or restrained tutoiement. Do not translate American hype tropes literally. "You'll never believe..." becomes "Vous n'allez pas en croire vos yeux", which reads as scam in French. French marketing-skepticism baseline is higher than English; high promises trigger _réactance_ faster.

**If English**: default to direct-response register for marketing or tutorial content, longform register for essays and reported pieces.

**If bilingual**: produce hooks in both languages, label clearly.

For deeper register guidance, see `references/anglophone-vs-francophone.md`.

---

## Post Titles

A **title** is what the reader sees before clicking. A **hook** is what they read after. Both earn attention through different mechanisms: the title competes for clicks in a feed or search result; the hook earns continued reading after the click.

### The core mechanic: calibrated curiosity

A title must open a gap without closing it — but the gap must feel real, not manufactured. Research on 8,977 A/B experiments (Upworthy, *Scientific Reports* 2024) found a curvilinear relationship: too vague produces confusion (no foothold for curiosity); too specific removes motivation to click. The sweet spot: name the stakes, withhold the resolution.

**The craft test.** Does the title open a gap the reader cares about, and does the article genuinely close it? If yes, that's craft. If the content doesn't deliver what the title implied, that's clickbait — it destroys trust for future clicks.

### Core formulas

**Curiosity / Gap**
- `The [Adjective] Truth About [Topic]` — "The Counterintuitive Truth About Go Generics"
- `What [Group] Won't Tell You About [Topic]`
- `The Real Reason [Phenomenon]` — "The Real Reason Most Content Gets Zero Shares"
- `[Number] Things Every [Audience] Gets Wrong About [Topic]`

**Contrarian / Negative** (negative superlatives: +63% CTR vs. positive — Outbrain, 65k titles)
- `Stop [Doing X]. Here's Why.` / `Why [Common Belief] Is Wrong`
- `[Number] [Myths/Mistakes] That Are Killing Your [Result]`

**Specificity / Data**
- `I Analyzed [Number] [Things] — Here's What I Found`
- `[Number]% of [Group] Does This Wrong`
- Brackets signal format honestly and add +38% CTR: `How I Cut Build Time by 60% [Benchmark]`

**List / Number** (numbers: +36% CTR — Conductor; odd numbers: +20% CTR — CMI)
- `[Number] [Adjective] Ways to [Goal]` / `[Number] Mistakes to Avoid When [Task]`

**How-To** (3× more B2B shares than other formats — BuzzSumo, 10M LinkedIn articles)
- `How to [Task] Without [Painful Constraint]` / `How to [Task] Even If [Limiting Belief]`

### The "putaclic léger" zone

Slightly clickbait but honest — maximum tension with a real promise:

- Replace "won't believe" → "surprised to learn": same curiosity, honest register
- Add specificity: "I saved €500/month" beats "I saved money"
- Add a constraint: "without quitting your job" creates the gap
- Use "the real reason" or "what nobody tells you" — they signal a non-consensus view you must substantiate
- Add a bracket `[Étude]`, `[Template]`, `[Benchmark]` to signal payoff type

**FR — putaclic carries stronger pejorative weight.** Apply the **70/30 rule**: 70% information, 30% mystery. Tension and contradiction work; faux drama ("J'arrête tout 😱") destroys credibility immediately in French professional contexts. Canonical FR structure: "Tout le monde vous dit de faire A. Voici pourquoi je fais B." Formulas saturated on LinkedIn FR in 2025+: "J'ai fait une erreur, voici ce que j'ai appris", "J'arrête [plateforme]".

### Platform constraints

| Platform | Max display | Key rule |
| --- | --- | --- |
| Blog / SEO | 50–60 chars | Front-load keyword. Power words reduce CTR by ~14% in search. |
| LinkedIn article | 150 chars hard | Under 100 for clean display. |
| LinkedIn feed | 120–140 chars | Opening line = the title. Engineer a "see more" click. |
| Newsletter subject | 30–50 chars | First 30 chars carry the signal. Avoid "Newsletter" (−18.7% opens). |
| X / Twitter | ≤200 chars | First tweet = the title. Must stand alone. |

### Anti-patterns for titles

- Generic superlatives without specificity: "The Ultimate Guide to X" — no gap
- "You won't believe..." / "Vous n'allez pas y croire..." — overused, signals hype
- Power words (Secret, Amazing, Ultimate) in SEO titles — signal hype, lower CTR
- Titles that give away the full answer — if the title answers the question, there is no reason to click
- Recycling saturated fingerprints: "I analyzed X things, here's what I found" — effective 2022–2023, saturating 2025–2026

### Behavior for title requests

1. Confirm topic, audience, language, platform
2. Propose **3–5 titles** across distinct formulas — not three variants of the same type
3. Include at minimum: one curiosity/gap, one contrarian or data, one list or how-to
4. Use the same output format as hooks: numbered options, wait for the pick
5. After the pick, note what the title commits the article's opening to

For the full 58-formula catalog (EN + FR) with data citations, see `references/title-formulas.md`.

---

## Reference files (load only when needed)

- `references/anti-patterns.md`: extended cliché and AI-tell list.
- `references/anglophone-vs-francophone.md`: register conventions, what does not translate.
- `references/formulas.md`: 30 reusable templates (EN + FR) for quick template-based hooks.
- `references/title-formulas.md`: 58-formula post title catalog (EN + FR), platform constraints table, data summary.

The catalog above is sufficient for most invocations. Load references only when the user asks for templates, deeper register guidance, or to sanity-check anti-patterns.

---

## Integration with other ghostwriting skills

If invoked from inside another skill's workflow (e.g., `technical-article-writer` reaches the hook step), produce options, ask, wait. Return the chosen hook to the parent skill for the rest of the article.

If the user has already drafted an opening and asks for "a better one", treat that draft as **Option 0** (their current version) and propose 3 alternatives across different hooks. Do not silently discard their version.

---

## Worked example

User: "I'm writing a Substack piece on why most Go developers misuse generics. About 1500 words, intermediate Go devs, English."

Correct skill response:

```
## Hook options for: "Why Most Go Developers Misuse Generics"

**Option 1: Contrarian** (prediction-break)
A. Most articles on Go generics explain when to use them. This one explains when to delete them.
B. Generics were the most requested Go feature for a decade. Three years in, the people who pushed hardest for them are the ones telling you to stop using them.

**Option 2: Concrete detail** (sensory + specific)
A. samber/lo ships 87 generic helpers. Six of them account for 94 percent of the binary-size complaints. The other 81 are fine.
B. A function called `Map[T, U any]` looks innocent. Compile a project that imports it 40 times and your build time triples. Here is why.

**Option 3: Direct problem (PAS)** (reader-direct)
A. Your Go code compiles slower since you adopted generics. The cause is not what the linter is telling you.
B. If your team adopted generics last year and your build times doubled, you are not alone. The diagnosis is more boring than the fix.

Which? Reply with letter combination (e.g., "1B") or "more" for different techniques.
```

Then wait for the pick. Do not write the rest of the article until the user has chosen.
