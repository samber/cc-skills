---
name: substack-ghostwriting
description: "Write, optimize, and grow Substack content — both newsletter issues (email-first) and web posts (web-first articles/essays). Covers ghostwriting with voice matching, Substack algorithm optimization, Notes strategy, email formatting, SEO, growth tactics, and monetization planning. Use when the user mentions Substack, newsletters, write a newsletter issue, Substack post, Substack article, web post on Substack, evergreen content, SEO for Substack, newsletter growth, Notes strategy, ghostwrite for, match someone's voice, write in the style of, newsletter monetization, paid subscribers, or any task involving Substack as a platform. Also trigger for general article/newsletter writing even if Substack isn't named explicitly, or when the user wants to adapt existing content (blog post, talk, thread) into newsletter or web post format. Do NOT use for generic blog post writing without a newsletter/Substack context (-> See samber/cc-skills@technical-article-writer skill)."
user-invocable: true
license: MIT
compatibility: Designed for Claude or similar AI agents.
metadata:
  author: samber
  version: "1.1.3"
  openclaw:
    emoji: "📰"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent WebFetch WebSearch AskUserQuestion
---

# Substack Ghostwriting & Content Optimization

A skill for writing Substack content — both newsletter issues (email-first) and web posts (web-first articles/essays) — that grows subscribers and converts readers. Handles two voice modes (own voice, ghostwriting) and two format modes (newsletter issue, web post).

## Core philosophy

Substack is not a blog with an email list. It's a social-media-newsletter hybrid with an algorithm that optimizes for subscriptions, not engagement. This changes everything about how you write, format, and distribute content on the platform.

The algorithm's incentives genuinely align with quality. Substack's revenue comes from subscription cuts (not ads), so gaming engagement metrics doesn't help. What helps: writing content good enough that readers convert to paid subscribers and recommend you to others.

For ghostwriting specifically: the job is capturing someone's existing insights in their voice, not generating insights from scratch. As Nicolas Cole frames it: clients are "insights-rich and time-poor", writers are "time-rich but insights-poor." The art is extraction and voice matching.

---

## Platform formatting constraints

Substack is a social-media-newsletter hybrid with an algorithm that optimizes for subscriptions, not engagement. Revenue comes from subscription cuts (not ads), so quality genuinely wins. For ghostwriting: the job is capturing someone's existing insights in their voice — clients are "insights-rich and time-poor."

Read `references/platform-constraints.md` for post fields, Notes limits, special content blocks, and media embeds.

---

## Mode detection

Determine two dimensions:

**Voice dimension:**

- **Own voice** — the user writes/publishes under their own name. Go directly to the Writing Workflow.
- **Ghostwriting** — writing in someone else's voice, or preparing content for a client. Complete the Ghostwriting Workflow first, then the Writing Workflow.

**Format dimension:**

- **Newsletter issue** (email-first) — sent to subscribers' inboxes. Subject line and email formatting matter most. Read `references/email-formatting.md` during Phase 3.
- **Web post** (web-first) — published as a Substack article/essay, discoverable via search and Substack's feed. SEO and web formatting matter most. Read `references/web-post-formatting.md` during Phase 3.

If unclear, ask the user. Default to newsletter issue when they say "newsletter" or "issue"; default to web post when they say "article", "essay", "post", or "evergreen content".

---

## Ghostwriting Workflow

When writing for someone else, voice matching comes before content. Read `references/voice-matching.md` for the full extraction process — it covers sample collection (transcripts > writing > media), voice marker extraction, building a voice guide (10-15 markers with examples), and iteration with the user.

Complete the voice guide and get user validation before proceeding to the Writing Workflow.

---

## Writing Workflow

**Phase 1 is mandatory — always ask the user the intake questions and wait for answers before writing anything.** If the user already provided some context, extract what you can and ask only about missing pieces.

### Phase 0: Voice calibration (own voice mode)

Skip this phase if ghostwriting (the Ghostwriting Workflow handles voice separately).

Ask the user for their **existing Substack URL**. If they have one, fetch 2-3 recent posts and extract tone markers: formality level, sentence rhythm, humor style, paragraph length, how they open and close, recurring phrases. Summarize the voice in 5-7 bullet points and confirm with the user before writing.

If they don't have an existing Substack, ask: "How do you want to sound? Casual and conversational, professional and authoritative, or something else?" Use their answer plus any other writing samples they can share.

### Phase 1: Content planning (interview)

**Stop and ask.** Present the intake questions below to the user and wait for their answers. Do not skip this phase, do not infer silently, and do not start drafting until you have explicit answers or confirmation on every item.

1. **Topic**: What's this about? If vague, ask what specific angle or story the reader should walk away with.
2. **Format**: Newsletter issue (email-first) or web post (web-first)? See mode detection above.
3. **Audience**: Who reads this? (developers, founders, marketers, general tech, niche community...) A newsletter for junior devs reads very differently than one for CTOs.
4. **Objective**: What's the concrete goal?
   - Grow subscribers (free or paid)?
   - Drive signups/traffic to an external product (SaaS, course, tool)?
   - Establish authority / thought leadership?
   - Nurture existing subscribers toward a paid tier?
   - Something else? The objective shapes the CTA, the hook angle, and where depth goes vs where the paywall or link sits.
5. **Context**: Part of a series? What have recent posts covered?
6. **Length**: Short (500-800 words), Standard (1000-1500), Deep dive (2000+)

If critical pieces are missing (especially topic, audience, objective, or format), **ask and wait** — don't guess. A wrong assumption wastes an entire draft.

If the user has Notes data (which Notes got engagement), use that to validate topic selection. Notes function as a cheap testing pipeline for long-form content.

### Phase 2: Title and hook selection

Generate **5 title/subject line variants** and **3 hook options** (opening 2-3 sentences each). Present them together and **ask the user to pick or remix before proceeding**. Do not write the body until the user has validated a title and hook direction.

**Title principles:**

- Specificity beats vagueness
- Promise a clear benefit or reveal
- 6-10 words (readable on mobile and in search results)
- For dev audiences: technical keywords filter for the right audience; "How to" and numbers perform well; avoid urgency/scarcity tactics

**Hook types** — write 3 distinct hooks using different strategies (e.g. credibility, counter-narrative, curiosity, surprise, data). Each hook should be 2-3 sentences that could open the piece. Present them labeled (Hook A, Hook B, Hook C) with a brief note on the strategy used.

**Newsletter issue — subject line + preview text:**

- The subject line is the headline. The preview text (first ~90 chars of the email) is the subhead. Together they determine open rate.
- Preview text should complement, not repeat, the subject line.

**Web post — SEO + discoverability:**

- Keep the main title punchy for the feed. Use the separate **SEO title** field for a keyword-rich version (under 60 chars).
- Write a dedicated **SEO description** (150-160 chars) — don't rely on the subtitle fallback, it's usually too short.
- Suggest a **URL slug**: short (3-6 words), keyword-rich, no dates.
- Assign to a publication section if applicable.
- Read `references/web-post-formatting.md` for detailed SEO guidance.

**Wait for the user to choose** a title and hook before moving to Phase 3.

### Phase 3: Write the content

Using the chosen title and hook, write the full piece. The hook opens the article, then continue with:

1. **Hook** (chosen from Phase 2)
2. **Context** (1-2 paragraphs): Why this matters now. What prompted this.
3. **Body** (bulk): The actual content. Structure depends on content type.
4. **Takeaway** (1-2 sentences): The one thing the reader should remember.
5. **CTA** (1-2 sentences): Ask for a specific action. Questions that invite replies are strongest (replies are an algorithm signal).

**Newsletter issue formatting** — read `references/email-formatting.md` for full rules:

- Paragraphs: 2-3 sentences max (email clients make long paragraphs feel like walls)
- Code blocks: < 10 lines (link to Gist for longer code)
- Images: sparingly (many email clients block them by default)
- TL;DR at top for issues > 1500 words

**Web post formatting** — read `references/web-post-formatting.md` for full rules:

- Paragraphs: 3-4 sentences acceptable (full-width web rendering is more forgiving)
- Longer code blocks OK (up to 30-40 lines with full syntax highlighting)
- Images and embeds render reliably — use more liberally
- Table of contents for posts > 2000 words

**Shared formatting rules:**

- Subheadings every 200-400 words. Bold key phrases so skimmers catch the argument.
- Descriptive anchor text on links, not "click here."

### Phase 4: Growth-optimized elements

Add elements that leverage the Substack algorithm. Read `references/substack-algorithm.md` for the full mechanics.

1. **Reply prompt**: End with a genuine question. Replies signal engagement to the algorithm.
2. **Share prompt**: "If you found this useful, forward it to a colleague who [specific situation]." Specificity increases share rate.
3. **Recommendation hook**: If the user has recommendation partnerships, weave in natural cross-references.
4. **Notes teaser**: Write a 2-3 sentence version for Substack Notes. Notes should stand alone as valuable, not just be a link to the issue.

### Phase 5: Paid vs. free strategy

If the user has a paid tier, advise on the free/paid split:

- Free issues should be your best work (they drive growth and recommendations)
- Paid issues should offer depth, exclusivity, or access (not just a paywall on normal content)
- The most effective model: free issues that demonstrate value so clearly that readers want more

Common mistake: paywalling too early. At < 1000 subscribers, everything should be free. Growth compounds faster than paid conversion at small scale.

### Phase 5b: Humanize

Invoke a humanizer skill (e.g. "humanize", "humanizer", "de-slop", "natural writing check", "AI detection cleanup", "rewrite like a human") to strip AI-generated patterns — filler words, predictable cadence, over-hedging, hollow transitions, inflated language. Substack readers pay for authentic voice; AI-sounding prose kills trust and cancels subscriptions.

**Preserve hooks and subject lines.** The hook and title/subject line (Phase 2) were deliberately engineered for open rate and curiosity. Instruct the humanizer to leave them intact — rewriting them for "naturalness" destroys the copywriting structure that drives opens and first-scroll retention.

### Phase 6: Image suggestions

After the content is drafted, suggest **1-3 images** with specific placement. For each image, provide:

- **Placement**: Where in the issue (e.g. "as the cover image", "after the hook", "between section X and Y")
- **Purpose**: What the image adds (set the tone, break up a long section, illustrate a concept, reinforce the emotional beat)
- **Description**: What the image should depict

For newsletter issues: use images sparingly — many email clients block them by default. Prioritize a strong cover image and at most 1-2 inline images. For web posts: images render reliably — use more freely (diagrams, charts, screenshots).

Offer to generate a **Midjourney prompt** for each suggested image. If the user accepts, use the latest Midjourney model conventions to write the prompt. Use `--ar 16:9` or `--ar 3:1` for cover images and wide illustrations (optimal for Substack headers and social sharing), `--ar 3:2` for smaller inline images. Refer to up-to-date Midjourney documentation for current prompt syntax and parameters.

### Phase 7: Social distribution posts (optional — offer, don't auto-generate)

After the content is written, **ask the user if they want social distribution posts**. Do not generate them automatically. If accepted, write a **LinkedIn post** and/or a **Twitter/X post** to promote it. These are not summaries — they are standalone pieces of content that create enough curiosity or value to drive clicks.

Read `references/social-distribution.md` for LinkedIn and Twitter/X post templates.

---

## Output format

**Newsletter issue:**

- Subject line (chosen) + 2 alternatives
- Preview text
- Full issue in markdown, formatted for email readability
- Image suggestions with placement notes (and Midjourney prompts if accepted)
- A Notes teaser (2-3 sentences)
- LinkedIn + Twitter/X distribution posts (only if the user accepted)
- If ghostwriting: the voice guide used

**Web post:**

- Title (chosen) + 2 alternatives
- Subtitle / meta description
- Suggested URL slug
- Full post in markdown, formatted for web readability
- Image suggestions with placement notes (and Midjourney prompts if accepted)
- A Notes teaser (2-3 sentences)
- LinkedIn + Twitter/X distribution posts (only if the user accepted)
- If ghostwriting: the voice guide used

---

## Adapting existing content

When the user wants to convert a blog post, talk, or thread into Substack content:

1. **Choose the right format.** Evergreen source material (reference, tutorial, deep dive) → web post. Timely source (commentary, announcement, reaction) → newsletter issue.
2. **Don't just copy-paste.** Substack readers expect a different voice and format than blog readers.
3. **Add the personal layer.** Substack is more personal than a blog. Add context: why you're sharing this, what prompted it, your take.
4. **Front-load the value.** Blog posts can have a slow build. Substack content must hook in the first 2 sentences (the email preview or search snippet).
5. **Shorten for newsletters.** Cut 30-50% of blog post length for newsletter issues — email tolerance for length is lower. Web posts can preserve more depth.
6. **Add the CTA.** Blog posts can end quietly. Substack content should ask for something.

---

## Reference files

Read these for deeper platform knowledge:

- `references/voice-matching.md` -- Detailed ghostwriting voice extraction process, interview techniques, voice guide templates, and iteration workflow. Read when ghostwriting.
- `references/email-formatting.md` -- Email client rendering constraints, formatting rules, mobile optimization, and code block handling. Read during Phase 3 for newsletter issues.
- `references/web-post-formatting.md` -- SEO optimization, web-first formatting rules, evergreen vs timely content strategy, sections/categories, and rich media usage. Read during Phase 3 for web posts.
- `references/substack-algorithm.md` -- How the algorithm works (from Substack's ML lead), Notes ranking signals, Recommendations system, growth levers ranked by impact, and monetization math. Read during Phase 4 or for strategic planning.
