---
name: copywriting-cta
description: Design end-of-article CTAs (calls-to-action placed at the bottom of blog posts, newsletters, essays, articles, or any long-form content). Use this skill whenever the user asks to write, design, review, or improve a CTA at the bottom of an article, blog post, or essay; mentions "end-of-post CTA", "bottom of the article", "call-to-action", "signup box", "newsletter CTA", "subscribe block", "what should I put at the bottom", "how do I get readers to subscribe / share / book a call / buy / follow / join / download"; or asks how to convert article readers into subscribers, leads, customers, community members, or supporters. Also trigger when the user wants A/B testing guidance or accessibility review for a CTA block. Covers independent / personal writing, newsletter publications, and brand / content-marketing blogs across any topic — tech, finance, food, climate, design, lifestyle, B2B, B2C. Produces both the copy (content) and the structural / visual design (form), matched to the user's objective and audience.
---

# End-of-Article CTA Designer

Designing an end-of-article CTA is a function of three inputs: the **objective** (what action), the **audience** (who reads it, in what relationship to the author), and the **context** (independent writing, newsletter, brand publication). Get those three right and the copy + form follow almost mechanically. Skip them and you get the universal failure mode: a generic "Subscribe for more" or "Learn More" that converts at the noise floor.

This skill runs a tight interview to capture those three inputs, then prescribes a CTA: copy (what it says), form (how it looks and sits on the page), mechanism (whether to use urgency, scarcity, curiosity, reciprocity, social proof, or none), an A/B test plan, and an accessibility check.

---

## Workflow

Run the four steps below in order. Do not skip the interview. The user may have given partial context already; pull what's available from the conversation, then ask only for the missing pieces.

### Step 1 — Interview

Use the `ask_user_input_v0` tool. Ask one question at a time. Do not stack questions in prose. Each question must have 2-4 tappable options. Fall back to free text only if the answer genuinely cannot be enumerated.

Ask these in order, skipping any already answered:

**Q1. Article context.**
Options: `Personal / independent blog or essay` · `Newsletter / paid publication (Substack, beehiiv, Ghost, etc.)` · `Brand / company / content-marketing blog` · `Other (free text)`

**Q2. Primary objective.** (Pick the one outcome you most want from a reader who finishes the article. If they say "all of them," push back: multiple objectives is the #1 cause of CTA failure.)

Options:
- `Newsletter / email subscription`
- `Social follow / personal branding`
- `Lead generation (download / gated asset)`
- `Product or service signup / free trial`
- `Demo or sales call booking`
- `Direct purchase`
- `Community join (Discord / Slack / forum)`
- `Engagement (reply / comment / share / restack)`
- `Reader support (paid subscription / tip / sponsorship)`
- `Try-it / direct action (use the code, run the tool, fork the template, open the calculator)`
- `Other (free text)`

If the user lists more than one, ask which is primary. You can offer 1-2 secondaries later, but the primary must be singular.

**Q3. Audience and relationship.**
Options: `First-time visitor (organic search / social)` · `Returning reader, not subscribed` · `Existing subscriber / customer` · `Mixed / unknown`

**Q4. Funnel stage.** (Where is the reader mentally?)
Options: `TOFU: discovery, learning, no buying intent yet` · `MOFU: evaluating options, comparing` · `BOFU: ready to act, just needs a nudge` · `Not applicable (no buying funnel — e.g., personal blog, journalism, hobby content)`

**Q5. Mechanism preference.** (Only ask if a mechanism could legitimately help. See `references/mechanisms.md`. For sophisticated, skeptical, or repeat-reader audiences, default to "None / value-only" without asking.)
Options: `None: value statement only` · `Curiosity gap ("Want to know more?")` · `Reciprocity (free asset first)` · `Discount / offer` · `Urgency (real deadline)` · `Scarcity / FOMO (limited spots)` · `Social proof (count / testimonial)`

Capture any free-text constraints the user volunteers (length limit, brand voice, no popups, multi-language, etc.). Note them.

### Step 2 — Diagnose

Map the inputs to a CTA archetype. The decision logic:

```
context = INDEPENDENT / PERSONAL
├── objective = newsletter / email      → Archetype A: Author-signature subscribe
├── objective = try-it / direct action  → Archetype B: Inline action + source link
├── objective = reader support / tip    → Archetype C: Reader-supported funding link
├── objective = community               → Archetype D: Proof-counted community invite
├── objective = social follow           → Archetype A (variant: lead with social links)
├── objective = engagement              → Archetype E: Specific reply prompt
└── objective = product / demo          → ⚠️ FLAG. Only valid on personal/professional
                                          blog where the author IS the product
                                          (consultants, coaches, solo founders, indie devs).
                                          Frame as "if you hit this, here's how I help"
                                          — never "Book a Demo" verbatim.

context = NEWSLETTER PUBLICATION
├── objective = growth / subs           → Archetype F: Share/restack + native widget
├── objective = engagement              → Archetype E: Specific reply prompt
├── objective = paid conversion         → Archetype G: Value-gap tease
├── objective = monetization / sponsor  → Archetype H: Inline sponsor block (not bottom)
├── objective = community               → Archetype D
└── objective = direct purchase         → Archetype K (rare on newsletters; use BOFU only)

context = BRAND / CONTENT MARKETING
├── stage = TOFU                        → Archetype I: Transitional asset (lead magnet)
├── stage = MOFU                        → Archetype J: Direct + Transitional pair
├── stage = BOFU                        → Archetype K: Direct CTA + risk reversal
├── objective = community               → Archetype D
└── objective = engagement              → Archetype E (rarely the right call here)
```

Read `references/taxonomy.md` for the full archetype catalog with copy templates, form specs, when each works, and verbatim examples from named publications.

### Step 3 — Compose the recommendation

Output the recommendation in this exact structure. Do not deviate. Do not add filler.

```markdown
## Recommended CTA

**Archetype:** [letter + name from decision tree]
**Why this fits:** [1-2 sentences naming the input combination]

### Content (copy)
**Headline / value line:**
> [exact text]

**Body / proof line (1-2 lines):**
> [exact text]

**Button copy:**
> [exact text]

**Risk reversal / subtext (if applicable):**
> [exact text, or "Omit: would feel forced for this audience"]

### Form (structure)
- **Placement:** [end-only / end + sticky / end + mid-article repeat]
- **Visual weight:** [low / medium / high, with justification]
- **Layout:** [single button / button + text link / native widget cluster / one-line signature]
- **Proof to co-locate:** [subscriber count / star count / testimonial / named recommenders / logo wall / none]

### Mechanism
[Named mechanism + 1 sentence on why it is appropriate, OR "None: value statement carries it. Mechanisms would erode trust for this audience."]

### A/B test plan
- **First test:** [single variable, e.g., button copy A vs. B]
- **Why this one first:** [1 sentence]
- **Sample size needed:** [rough estimate based on baseline traffic, or "skip A/B for now — traffic too low" with the alternative recommendation]
- **Next 2 tests to queue:** [in priority order]

### Accessibility check
- **Color contrast:** [target ratio + concrete pairing if colors known]
- **Touch target:** [size requirement]
- **Semantic markup:** [<button> vs. <a> vs. form]
- **ARIA:** [only if non-obvious]
- **Keyboard / focus:** [requirement]
- **Color-independence:** [non-color affordance]
```

After printing the recommendation, list 2-3 anti-patterns the user is at risk of falling into given their inputs, directly, as a contrarian check. Pull these from `references/anti-patterns.md`.

If the user is writing in a non-English language, translate the content section into that language but keep the structure (headings, labels) in English. Honor formality cues (e.g., `tu` vs. `vous` in French, `du` vs. `Sie` in German) based on prior conversation context, and flag the choice explicitly.

### Step 4 — Offer next moves

Suggest 2-3 follow-up directions:

1. **Steelman the opposite.** Offer to design the CTA you would recommend against — e.g., the hard-sell version on a TOFU post — so the user can see why it fails.
2. **Variant for a different audience or platform.** If the article will be cross-posted (own site + Medium + LinkedIn + a syndication network), offer to rewrite per platform.
3. **End-to-end review.** Offer to audit the rest of the article for CTA-supporting signals: author bio, related-post links, in-line proof.

---

## Style inheritance

The copy templates in `references/taxonomy.md` are starting points, not finished copy. Always adapt them to:

- The user's stated brand voice or any `<userPreferences>` in scope (formality, language, em-dash avoidance, length limits).
- The language of the article. Output copy in the article's language; never default to English.
- The publication's existing voice. If the user has prior posts visible, mirror their cadence and vocabulary.
- The reader's expected level of expertise. A CTA for a beginner-finance blog uses different vocabulary than one for a quant-trading newsletter.

Never output a template verbatim if it conflicts with the user's stated style preferences.

---

## Reference files

Read these as needed during diagnosis and composition. Read the relevant file in full before composing the recommendation; do not paraphrase from memory.

- **`references/taxonomy.md`**: All 11 archetypes (A through K) with copy templates, form specs, verbatim examples from named publications, and conversion expectations.
- **`references/mechanisms.md`**: When to use urgency, scarcity, FOMO, discount, curiosity, reciprocity, social proof, authority, unity. When NOT to use them.
- **`references/ab-testing.md`**: Priority order of variables to test, sample-size rules of thumb, common pitfalls, when to skip A/B testing entirely.
- **`references/accessibility.md`**: WCAG 2.2 specifics for CTA blocks: contrast ratios, touch targets, ARIA patterns, focus states, keyboard support, motion preferences.
- **`references/anti-patterns.md`**: 12 failure modes to call out by name when they apply to the user's inputs.

---

## Operating principles

- **One primary CTA per post.** Multiple competing CTAs is the dominant failure mode (single-CTA pages convert ~30%+ better than multi-CTA pages in repeated case studies).
- **Match the voice of the publication.** A personal-essay footer that reads like a SaaS landing page collapses credibility. A SaaS footer that reads like a casual signature converts at noise.
- **Specificity beats cleverness.** "Get one essay a week on indie filmmaking" beats "Subscribe to our awesome newsletter." Joanna Wiebe's "I want to ___" completion test is the cleanest filter for button copy.
- **Proof co-located with the ask.** Subscriber count, testimonial, customer logos, star count, named recommenders — whichever signal is honest for the context, place it inside or adjacent to the CTA block.
- **Mechanisms are tools, not garnish.** Most well-written value statements need no mechanism. Add urgency, scarcity, FOMO, or discount only when the context genuinely supports them; theatrical mechanisms erode trust faster than they lift conversion.
- **Push back on bad asks.** If the user wants "Book a Demo" at the bottom of a beginner tutorial for first-time visitors, say so. Do not produce a polished version of a CTA that will fail. Propose the alternative, explain why, then if the user still wants the original, deliver it with the failure mode flagged.
