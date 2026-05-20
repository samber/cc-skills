# Channel Adaptation

Transformation rules between the four generic channel groupings. Used in BUILD Phase 5 (to populate channel-overrides sections in PROSE.md) and in ADAPT mode (to project an existing PROSE.md onto a new channel).

Generic groupings keep PROSE.md portable: adding a new platform within a grouping does not require re-codification. Platform-specific quirks (LinkedIn's algorithm, Substack's paywall, X's reply economy) live in the downstream writer skills, not here.

## The four groupings

| Grouping | Covers |
| --- | --- |
| **Long-form articles** | Blog posts, pillar pages, evergreen essays, technical deep-dives, opinion essays (Substack web post, Medium, dev.to, own blog — same group) |
| **Social posts** | LinkedIn, X / Twitter, Bluesky, Threads, TikTok captions, Mastodon |
| **Email & newsletter** | Newsletter issues (Substack email, ConvertKit, Beehiiv), transactional, drip sequences, lifecycle |
| **Marketing copy** | Landing pages, ad copy, press releases, podcast show notes, video scripts, sales decks |

## Channel deltas

Each row is a transformation rule. When ADAPT mode projects a PROSE.md from one grouping onto another, walk this table top-down.

| Dimension | Long-form | Social | Email & newsletter | Marketing copy |
| --- | --- | --- | --- | --- |
| Mean sentence length | 14–18 words (B2C 10–14; consulting 18–22) | 8–12 words | 10–14 words | 8–12 words |
| Paragraph length | 2–5 sentences, max 80 words | 1–3 sentences, frequent breaks | 1–2 sentences | 1–3 sentences |
| Hook style | Scene · contrarian · stat · concrete detail · question | Bold claim · direct problem · concrete detail · counterintuitive | Personal frame · curiosity gap · open loop | Promise · direct problem · authority · benefit |
| Body structure | TES, PEEL, inverted pyramid | Hook → re-hook → ABT (And/But/Therefore) → CTA | Personal lede → 3–5 paragraphs → P.S. | Above-fold claim → proof → CTA |
| List use | Bulleted lists within prose, max 7 items | Numbered or bulleted, heavy use, max 5 items | Sparse — break with bold instead | Bullet-heavy for features |
| Heading frequency | Every 200–350 words (H2/H3) | None (line breaks instead) | Light — bolded section headers | One H1, optional H2 per section |
| Closing | Practical next step · callback · restated stake | Specific reply prompt · no open-ended questions | Single primary CTA in P.S. or final paragraph | Direct action button + risk reversal |
| Voice marker density | Moderate (1–2 signature moves per piece) | High (1 marker per post — the brand's "tell") | Moderate (personal opener as marker) | Low (consistency over personality) |
| Reading time | 3–15 min | 15–60 sec | 2–5 min | 30–90 sec |
| Tone register | Voice unchanged, tone matter-of-fact to enthusiastic | Voice unchanged, tone casual-confident | Voice unchanged, tone personal-intimate | Voice unchanged, tone direct-confident |

## Transformation rules (long-form → other channels)

The most common ADAPT direction. Pillar articles are usually the source of truth; other channels derive.

### Long-form → social post (200–300 words; one platform-specific tweet/post)

1. Extract the **single most counterintuitive claim** from the article.
2. Lead with it as the hook (re-engineer per `samber/cc-skills@copywriting-hooks`).
3. Cut sentence length to ~60% of the long-form mean.
4. Break paragraphs to 1–3 sentences.
5. Add line breaks for scannability.
6. CTA: specific reply prompt, comment, link to long-form, or no-CTA. Avoid open-ended questions — they reduce action.
7. Strip qualifiers ("often", "in general", "typically") — social rewards confidence.

### Long-form → newsletter issue (500–1500 words)

1. Open with the **personal or editorial frame** ("This week I've been thinking about…", "A reader emailed me…").
2. Compress argument to 3–5 paragraphs, one idea per paragraph.
3. Include one **named data point** within the first 200 words.
4. Single primary CTA — in P.S. or final paragraph. Newsletter readers reward restraint.
5. Cut images sparingly — many email clients block them by default. Lead with strong cover image if used.
6. Subject line: declarative, specific. Avoid clickbait — newsletters live on trust.

### Long-form → marketing copy (landing page, ad, press release)

1. Strip narrative scaffolding (anecdotes, scene-setting). Marketing copy lives above the fold.
2. Lead with the **promise or direct problem**. The reader must know within 3 seconds whether to keep reading.
3. Translate features → benefits → outcomes.
4. Add risk reversal (guarantees, social proof, testimonials).
5. Single CTA per page. Multiple CTAs split conversion.
6. Banned in marketing copy unless brand-specific: rhetorical questions, hedges, scene openings.

### Long-form → email & newsletter drip sequence

1. Split the article's arguments across N emails — one argument per email.
2. Each email opens with a hook that pulls forward from the previous one.
3. Closing of each email teases the next (curiosity gap, open loop).
4. Final email contains the primary CTA. Earlier emails build trust without asking.
5. Maintain consistent sender voice across the sequence — drip sequences live on continuity.

## Cross-channel transformation rules (other directions)

### Social → long-form (post-as-seed)

When a social post performs well, expand it. Rules:

1. The post becomes the **lede** of the long-form piece.
2. Add 3–5 sections that defend or extend the original claim.
3. Add evidence the original post could not carry (data, named cases, citations).
4. Replace the social CTA with a long-form closing (callback or restated stake).

### Email → social (newsletter-as-thread)

1. Pick the strongest single argument from the newsletter.
2. Recast as a thread or single post.
3. Preserve the personal frame — newsletter readers expect intimacy; social readers reward authenticity.

### Marketing copy → social

Generally avoid. Marketing copy that reads like marketing copy on social produces low engagement. If forced, strip all sales language and focus on a single insight from the marketing piece.

## Hooks per channel

Cross-reference `samber/cc-skills@copywriting-hooks` for the full hook catalog. Per channel grouping, the **permitted hook types** are:

| Grouping | Permitted hooks |
| --- | --- |
| Long-form | Scene · contrarian · curiosity gap · concrete detail · stat · question · historical analogy · time anchor · authority |
| Social | Bold claim · direct problem · concrete detail · contrarian · stat · conditional · pattern interrupt |
| Email & newsletter | Personal confession · curiosity gap · open loop · conditional · personal frame |
| Marketing copy | Promise · direct problem · authority · stat · benefit |

## CTAs per channel

Cross-reference `samber/cc-skills@copywriting-cta` for the full CTA archetype catalog. Per channel grouping:

| Grouping | CTA archetypes |
| --- | --- |
| Long-form | Practical next step · callback · restated stake · transitional asset (lead magnet) |
| Social | Specific reply prompt · link to long-form · profile visit nudge |
| Email & newsletter | Single P.S. CTA · reply prompt · paid-tier tease (if applicable) |
| Marketing copy | Direct action button · book a call · free trial · pricing page |

## Anti-patterns per channel

| Channel | Anti-patterns |
| --- | --- |
| Long-form | Slow scene-setting in technical pieces; closing with generic "What do you think?"; lists-as-article (when prose would do) |
| Social | Hashtag spam; emoji as personality substitute; threading what should be one post; open-ended questions as CTA |
| Email & newsletter | Salesy subject lines; multiple competing CTAs; ignoring preview text; long paragraphs (email clients render them as walls) |
| Marketing copy | "Click here", "Learn more"; feature lists without translation; testimonials without faces and names; multiple CTAs per page |

## When ADAPT mode emits a separate file

Two output options for ADAPT mode:

1. **Inline channel override section** appended to PROSE.md (preferred when channels share most rules)
2. **Standalone `PROSE-<grouping>.md`** (preferred when a channel has substantial divergence, e.g., a B2B SaaS with a wildly different consumer brand for one product line)

Ask the user which they prefer in ADAPT Phase 2.
