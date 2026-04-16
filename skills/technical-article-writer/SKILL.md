---
name: technical-article-writer
description: "Write compelling technical articles and blog posts for developer audiences. Use this skill whenever the user asks to write a blog post, technical article, or any long-form technical content. Also trigger when the user says 'write about [technical topic]', 'help me draft an article', 'turn this into a blog post', 'write a post about', 'I want to publish something about', or mentions writing for a developer audience. Covers the full pipeline: idea sharpening, hook/title generation, article structure, body drafting, and editing. Even if the user just says 'I want to write about X' without specifying format, use this skill. Do NOT use for platform-specific optimization, newsletter strategy, or ghostwriting voice matching."
user-invocable: true
license: MIT
compatibility: Designed for Claude or similar AI agents.
metadata:
  author: samber
  version: "1.1.2"
  openclaw:
    emoji: "📝"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent WebFetch WebSearch AskUserQuestion
---

# Technical Article Writer

Combines structural frameworks from technical writing, hook engineering from copywriting, and practitioner-tested patterns for developer content. Lead with specificity and honesty — sound like a smart colleague, not a marketer.

## Workflow

Follow these phases in order. Each phase produces a concrete artifact the user reviews before moving on. **Phase 1 is mandatory — always ask the user the intake questions and wait for answers before writing anything.** If the user already provided some context, extract what you can and ask only about missing pieces.

### Phase 1: Idea sharpening (interview)

**Stop and ask.** Before writing anything, present the intake questions below to the user and wait for their answers. Do not skip this phase, do not infer silently, and do not start drafting until you have explicit answers or confirmation on every item. Ask the user (or extract from context and confirm):

1. **Topic**: What specific thing are you writing about?
2. **Objective**: What's the concrete goal? Ask the user explicitly:
   - Grow subscribers / build an audience?
   - Drive signups or traffic to a product (SaaS, course, tool)?
   - Establish authority / thought leadership in a niche?
   - Something else? The objective shapes the CTA, how much you give away vs. tease, and where links and conversion points sit.
3. **Audience**: Who reads this? (junior devs, senior engineers, CTOs, general tech, DBA, frontend developer...)
4. **Content type**: Which pattern fits? (see `references/article-structures.md` for full templates)
   - The Bug Hunt / We Rewrote It in X / How We Built It / Lessons Learned
   - Thoughts on Trends / Benchmark / Tutorial / Explainer
5. **Length target**: Short (800-1200), Medium (1500-2500), Long (3000+)
6. **One-sentence thesis**: The single claim or takeaway. If the user can't state this, help them.

If the user already provided most of this, extract from conversation and confirm. If critical pieces are missing, **stop and ask before proceeding**:

- Vague topic → ask what specific aspect and what the reader should walk away knowing
- Unclear audience → ask (junior devs vs senior engineers need different structure)
- No thesis → ask "What's the one thing you want the reader to remember?"
- Ambiguous content type → ask: following along hands-on, or building a mental model?

Only proceed to Phase 2 once you have clarity on topic, audience, content type, and thesis.

**Idea quality filters.** The best technical content comes from struggles and surprises, not textbook mastery (Julia Evans). The idea should fit at least one novelty filter (Julian Shapiro): counter-intuitive, counter-narrative, shock and awe, elegant articulation, or makes you feel seen. If none fit, help the user find an angle that does.

### Phase 2: Title generation

Generate **10 title variants** using different hook strategies. Read `references/hooks-and-titles.md` for the full framework of 10 hook types and headline formulas.

Constraints for developer audiences:

- 7-12 words optimal for LinkedIn/B2B sharing
- Specificity over cleverness ("How to profile Go allocations with pprof" > "Mastering Go Performance")
- Numbers and data signal rigor
- Avoid superlatives ("ultimate", "complete", "everything you need")
- Technical keywords attract the right audience
- Cognitive dissonance creates curiosity without clickbait

Present 10 titles ranked by assessment, with a brief note on why each works. Let the user pick or remix.

### Phase 3: Hook and intro

Write the opening 2-4 paragraphs. Read `references/hooks-and-titles.md` for the ten hook types.

The intro must accomplish three things:

1. **Hook** (1-2 sentences): Create a reason to keep reading. Best for technical content: Credibility, Counter-narrative, Curiosity, or Surprise hooks.
2. **Stakes** (1-2 sentences): Why should the reader care? What's the cost of not knowing this?
3. **Promise** (1 sentence): What will the reader gain by the end?

Address three reader objections: **Untrustworthy** (credibility hook), **Irrelevant** (stakes), **Implausible** (promise + specificity). Never bury the interesting part after paragraphs of context.

### Phase 4: Body structure

Choose structure based on content type. Read `references/article-structures.md` for detailed templates per content type.

General structural principles:

- **One idea per section.** If a section does two things, split it.
- **Show, then tell.** Lead with the example, code snippet, or observation. Then explain.
- **Progressive disclosure.** Start with the simplest version, then add complexity.
- **Every section earns the next.** Each section should create enough momentum to pull the reader forward. If a section could be skipped, cut it.

For code-heavy articles:

- Snippets < 20 lines, focused on one concept
- Always show "before" (problem) and "after" (solution)
- Annotate non-obvious lines
- Link to repo for full code, show only the interesting parts inline

For opinion/analysis:

- Steelman the opposing view before arguing against it
- Concrete examples, not abstract reasoning
- Quantify claims ("2x faster" not "much faster")

### Phase 5: Draft the full article

Write the complete article. Interleave hook, body sections, and conclusion.

For the **conclusion**, avoid restating the article. Instead pick one of:

- **Implication**: What does this mean for the reader's work going forward?
- **Open question**: What's still unresolved or worth exploring?
- **Call to action**: What should the reader do next?

### Phase 5b: Humanize

Invoke a humanizer skill (e.g. "humanize", "humanizer", "de-slop", "natural writing check", "AI detection cleanup", "rewrite like a human") to strip AI-generated patterns — filler words, predictable cadence, over-hedging, hollow transitions, inflated language. Developer audiences have a built-in BS detector; AI-sounding prose kills trust before the reader reaches the technical content.

**Preserve the hook and title.** The opening hook (Phase 3) and title (Phase 2) were deliberately engineered for curiosity and credibility. Instruct the humanizer to leave them intact — rewriting them for "naturalness" destroys the copywriting structure that earns the click and the first scroll.

### Phase 6: Image suggestions

After the draft is complete, suggest **1-3 images** with specific placement in the article. For each image, provide:

- **Placement**: Where in the article (e.g. "as the hero/cover image", "after the intro", "between section X and Y")
- **Purpose**: What the image adds (break up a long text section, illustrate a concept, set the tone, visualize data)
- **Description**: What the image should depict

Offer to generate a **Midjourney prompt** for each suggested image. If the user accepts, use the latest Midjourney model conventions to write the prompt. Use `--ar 16:9` or `--ar 3:1` for hero/cover images and wide illustrations (optimal for article headers), `--ar 3:2` for smaller inline images. Refer to up-to-date Midjourney documentation for current prompt syntax and parameters.

### Phase 7: Title finalization

Revisit titles from Phase 2. Now that the full piece exists, some titles fit better. Present top 3 with a recommendation.

---

## Output format

Present the article in clean markdown with:

- The chosen title as H1
- A subtitle or meta-description (1 sentence)
- The full article body
- Image suggestions with placement notes (and Midjourney prompts if accepted)
- A "Title alternatives" section at the end with 2-3 runner-up titles
- A social teaser (only if the user accepted — offer after the draft, don't auto-generate)

---

## Reference files

Read these when the corresponding phase needs more depth:

- `references/hooks-and-titles.md` -- The 10 hook types, 6 copywriting frameworks (PAS, AIDA, BAB, FAB, PASTOR, 4Us), headline formulas, and research data. Read during Phase 2 and Phase 3.
- `references/article-structures.md` -- Detailed templates for each of the 8 content types, Diataxis framework, structural anti-patterns, and transition techniques. Read during Phase 4.
