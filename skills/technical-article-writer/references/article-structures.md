# Article Structures Reference

## Table of Contents

1. Eight Content Type Templates
2. The Diataxis Framework
3. Structural Anti-patterns
4. Section Transitions

---

## 1. Eight Content Type Templates

Each template defines sections, purpose, and approximate word allocation for a medium-length article (1500-2500 words). Adapt proportions to target length.

### The Bug Hunt

Debugging narrative. The reader follows your investigation like a mystery.

1. **The symptom** (10%): What went wrong? Error messages, metrics, user reports.
2. **First hypothesis** (15%): What you assumed. Why it seemed reasonable.
3. **The investigation** (30%): What you tried. Dead ends matter. Show commands, logs, code.
4. **The revelation** (20%): The actual root cause. The payoff. Make it vivid.
5. **The fix** (15%): Code, config, architecture change.
6. **The lesson** (10%): The generalizable insight beyond this specific bug.

Technique: Build tension with plausible-but-wrong hypotheses before the real cause.

### We Rewrote It in X

Migration story. Readers want: should I do this too?

1. **Why we considered the rewrite** (15%): The pain. Be honest.
2. **Why we chose [new thing]** (10%): Decision criteria. What was rejected.
3. **The migration process** (30%): How. Phased? Big bang? Tooling?
4. **What went wrong** (15%): The pain. This is what makes it credible.
5. **Results and metrics** (20%): Before/after. Quantify everything.
6. **Would we do it again?** (10%): Honest assessment. Under what conditions?

Technique: The "what went wrong" section is what makes this valuable. Without it, it's a press release.

### How We Built It

Architecture walkthrough. Readers want design decisions.

1. **What and why** (10%): Product/system goal. User needs.
2. **Constraints** (15%): Performance targets, team size, timeline, compatibility.
3. **Architecture overview** (20%): High-level design. Diagram if possible.
4. **Key decisions and tradeoffs** (30%): For each: options, choice, and why. Core value.
5. **What we'd change** (15%): Hindsight. What would v2 look like?
6. **Takeaways** (10%): Principles the reader can apply.

Technique: Frame each decision as a tradeoff, not the "right" answer.

### Lessons Learned

Retrospective insight.

1. **Context** (10%): What experience generated these lessons. Credibility.
2. **Lesson 1** (20%): Most surprising or important. Lead with your best.
3. **Lesson 2** (20%): Build on or contrast with Lesson 1.
4. **Lesson 3** (20%): The one that took longest to learn.
5. **Lesson N** (if needed): Keep to 3-5 lessons. More dilutes impact.
6. **The meta-lesson** (10%): What ties these together.

Technique: Each lesson needs a specific story, not just the abstract principle.

### Thoughts on Trends

Industry analysis or opinion piece.

1. **The observation** (15%): What you're noticing. Be concrete.
2. **Evidence** (25%): Data, examples, trends.
3. **The steelman** (15%): Strongest argument against your position. Address honestly.
4. **Your thesis** (25%): Your take, informed by evidence and counterargument.
5. **Implications** (20%): What should the reader do differently?

Technique: The steelman separates good analysis from hot takes.

### Benchmark / Data-Driven

Technical comparison or measurement.

1. **What and why** (10%): The question. Why it matters.
2. **Methodology** (20%): Environment, tools, config. Reproducible detail.
3. **Results** (25%): Data first, interpretation second. Tables, charts, numbers.
4. **Analysis** (25%): What it means. Caveats. Where methodology might mislead.
5. **Practical recommendations** (15%): Given this data, what should the reader do?
6. **Reproduction notes** (5%): Repo, scripts, raw data links.

Technique: Lead with methodology. No trust in setup = no trust in conclusions.

### Tutorial / How-To

Step-by-step guide.

1. **What you'll build/achieve** (5%): End result. Screenshot or demo if possible.
2. **Prerequisites** (5%): What the reader needs. Be explicit.
3. **Steps** (70%): Numbered, sequential. Each step: action, code/command, expected result, common errors.
4. **Verification** (10%): How to confirm it worked.
5. **Next steps** (10%): Related topics, advanced usage.

Technique: Test from scratch on a clean environment. Every missing step loses readers.

### Explainer / Deep Dive

Concept explanation for a technical audience.

1. **Why this matters** (10%): Motivation. What problem does understanding this solve?
2. **The simple mental model** (20%): The 80/20 explanation. Standalone value.
3. **Going deeper** (40%): Nuances, edge cases, implementation details. Progressive complexity.
4. **Common misconceptions** (15%): What people get wrong. Cements understanding.
5. **Practical implications** (15%): How does knowing this change what you do?

Technique: Start with the simplest accurate mental model, then complicate it.

---

## 2. The Diataxis Framework

For content closer to documentation than opinion, use Diataxis (Daniele Procida) to diagnose type:

|                 | Learning    | Working       |
| --------------- | ----------- | ------------- |
| **Practical**   | Tutorials   | How-to guides |
| **Theoretical** | Explanation | Reference     |

Common failure: mixing types. A tutorial drifting into reference, a how-to explaining theory. Fix: separate mixed content into its proper type.

For blog posts: tutorials need clear start/end states, how-tos solve specific problems without teaching theory, explanations build understanding without requiring action, reference rarely works as a blog post (put it in docs).

---

## 3. Structural Anti-patterns

- **Burying the lede**: Interesting insight in paragraph 5. Move it to paragraph 1.
- **The unnecessary preamble**: 200 words of "In today's world of..." before content. Cut it.
- **The kitchen sink**: Covering everything about a topic. Pick one angle, go deep.
- **Unexplained jargon**: Terms without definitions. Not everyone has your context.
- **Missing motivation**: Explaining "how" without "why anyone should care."
- **The wall of code**: 50-line block with no annotation. Break up, explain interesting parts.
- **The false conclusion**: "In conclusion, [restate]." Add value: implications, open questions, CTA.
- **Monotone pacing**: Every section same length/intensity. Vary rhythm.
- **No signposting**: Reader doesn't know where they are. Use subheadings and transitions.

---

## 4. Section Transitions

Techniques that create momentum:

- **Forward reference**: "But this creates a new problem..."
- **Question**: "So if X is true, what happens when we try Y?"
- **Contrast**: "That handles the common case. Edge cases are where it gets interesting."
- **Escalation**: "This works for small datasets. Let's scale it up."

Momentum killers:

- "Now let's talk about..." (no reason to continue)
- "Another important topic is..." (disconnected)
- "Moving on to..." (filler)
