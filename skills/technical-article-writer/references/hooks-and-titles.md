# Hooks and Titles Reference

## Table of Contents

1. The 10 Hook Types
2. Copywriting Frameworks for Article Intros
3. Headline Formulas and Data
4. The 4 U's Headline Checklist
5. Developer-Specific Constraints
6. Open Loop Technique

---

## 1. The 10 Hook Types

Based on Neal O'Grady's taxonomy, reverse-engineered from thousands of viral posts. Pick the type that matches your article's angle.

### Type 1: Credibility

Signal authority or experience worth listening to.

Patterns:

- "I've [verb] [impressive thing] for [time period]. Here's what I learned."
- "After [specific result], I can tell you [insight]."
- "[Number] years of [activity]. [Number] [things done]. Here's the pattern."

Best for: How We Built It, Lessons Learned, Benchmarks

### Type 2: Fear (FOMO/FOBO)

Highlight what the reader risks missing or getting wrong.

Patterns:

- "Most [audience] don't realize [costly mistake]."
- "If you're still doing [common practice], you're leaving [value] on the table."
- "[Percentage] of [audience] get this wrong."

Best for: Counter-narrative articles, opinionated takes

### Type 3: Curiosity

Open an information gap the reader must close.

Patterns:

- "There's a [specific thing] that [unexpected property]."
- "I found [thing] that changes how I think about [topic]."
- "What happens when you [unusual action]?"

Best for: Deep dives, experiments, bug hunts

### Type 4: Counter-narrative

Challenge what everyone assumes is true.

Patterns:

- "Everyone says [common belief]. They're wrong."
- "The conventional wisdom about [topic] is backwards."
- "[Popular advice] is actively harmful. Here's the evidence."

Best for: Opinion pieces, industry analysis, myth-busting

### Type 5: Eloquence

Say something the reader has felt but never articulated.

Patterns:

- "[Elegant reframe of common experience]."
- "The real reason [thing happens] isn't [obvious reason]."

Best for: Philosophical/reflective technical content

### Type 6: Faces (Social proof)

Reference known people, companies, or projects.

Patterns:

- "How [known company] solved [problem]"
- "[Known person] said [thing]. Here's why that matters."

Best for: Case studies, analysis of public systems

### Type 7: Value

Promise a specific, tangible benefit.

Patterns:

- "[Specific technique] that will save you [specific time/effort]."
- "The [number]-step process I use to [desirable outcome]."

Best for: Tutorials, how-tos, tool recommendations

### Type 8: Surprise

Lead with something genuinely unexpected.

Patterns:

- "[Surprising fact or statistic]."
- "I didn't expect [result]. Neither will you."

Best for: Benchmarks, experiments, data-driven articles

### Type 9: Celebration

Share a win that inspires or teaches.

Patterns:

- "We just [achievement]. Here's the [number]-month journey."
- "[Project] just hit [milestone]. What we learned building it."

Best for: Launch posts, retrospectives, milestones

### Type 10: Identity

Speak directly to a group's shared experience.

Patterns:

- "If you're a [role] who [shared experience], this is for you."
- "Every [role] has [this moment]. Here's how to handle it."

Best for: Career content, community content, opinion pieces

---

## 2. Copywriting Frameworks for Article Intros

### PAS (Problem - Agitate - Solution)

The most versatile short-form framework. Name the exact pain, twist the knife on consequences, then present the solution. Rooted in loss aversion: losses feel ~2x worse than equivalent gains.

Example for a technical article intro:

- Problem: "Your Go CI benchmarks run on different CPU architectures than production."
- Agitate: "Every performance regression you catch in CI might be a false positive. Real regressions slip through to prod."
- Solution: "Here's how to detect and fix the mismatch in 10 minutes."

### AIDA (Attention - Interest - Desire - Action)

Better for longer intros. Hook with something unexpected, provide context that makes the reader lean in, show the transformation, tell them what to do.

### BAB (Before - After - Bridge)

Best for transformation narratives and case studies. Paint the painful current state, the desired future, then show how your content bridges the gap.

### FAB (Feature - Advantage - Benefit)

Translates technical details into human value.

- Feature: "One-click rollback in the deployment pipeline"
- Advantage: "Undo bad deploys in seconds instead of minutes"
- Benefit: "Ship with confidence. No more 2am panic fixes."

### PASTOR (Problem - Amplify - Story - Transformation - Offer - Response)

Extended PAS with narrative elements. Best for longer newsletter intros. Rule: 80% of the intro focuses on the transformation, only 20% on the "offer" (your article).

### 4 U's Headline Checklist

Rate each headline 1-4 on each dimension. Priority: Useful > Urgent > Unique > Ultra-Specific. If you can only hit 3, drop Urgency.

---

## 3. Headline Formulas and Data

### Research-backed findings

**BuzzSumo (100M articles)**: Optimal length 7-12 words for LinkedIn/B2B. Top list numbers: 10, 5, 15, 7. "How to..." is ~3x more shared than runner-up on LinkedIn.

**Nature Human Behaviour (2023, 105K headlines, 370M impressions)**: Negative emotion words increase CTR. Driver is sadness, not anger or fear. Each negative word +2.3% CTR. Fear words _decrease_ clicks.

**Nature Scientific Reports (2024)**: Inverted-U with concreteness. Too vague or too concrete both underperform. Moderate specificity (relevance signal + curiosity gap) is optimal.

**Upworthy's 25-headline method**: Generate 25+ variants per article, A/B test 4-5 finalists. Headlines #20-25 are often the most original (obvious options exhausted).

### Proven formula templates for technical content

1. "How to [specific thing] (without [common pain])"
2. "[Number] [things] I wish I knew before [activity]"
3. "Why [popular tool/practice] is [surprising claim]"
4. "I [specific action] for [time/scale]. Here's what I found."
5. "The [adjective] guide to [topic] that [qualifier]"
6. "[Common thing] is broken. Here's how to fix it."
7. "What [impressive entity] taught me about [topic]"
8. "Stop [common practice]. Do [better practice] instead."
9. "[Topic]: the good, the bad, and the [unexpected]"
10. "A [role]'s guide to [topic] (from someone who [credibility])"

---

## 4. Developer-Specific Constraints

- **Specificity over cleverness**: Include tool, language, or framework name
- **Numbers signal rigor**: "3 compiler flags that reduced binary size by 40%"
- **Avoid superlatives**: "ultimate", "complete" trigger the BS detector
- **Cognitive dissonance works**: "Why our fastest service runs the slowest language"
- **Honesty hooks**: "What I got wrong about [topic]" signals genuine insight

---

## 5. Open Loop Technique

George Loewenstein's Gap Theory: curiosity happens when we feel a gap in our knowledge.

Technique:

1. Highlight what the reader already knows
2. Reveal what they're missing
3. The gap must be manageable (not too big, not too small)

In practice: open a loop in the headline or first sentence, resolve within 1-3 paragraphs, open a new loop, close all by the end. Creates reading momentum.

Copyhackers tested this: curiosity headline outperformed direct headline by 927%. But the gap must be credible, not manipulative.
