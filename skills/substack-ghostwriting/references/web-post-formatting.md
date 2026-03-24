# Web Post Formatting Reference

This reference covers web-first formatting for Substack articles and essays. For email newsletter formatting, see `references/email-formatting.md`.

## Table of Contents

1. SEO Optimization
2. Web-First Formatting Rules
3. Content Strategy: Evergreen vs Timely
4. Sections and Categories
5. Rich Media Usage

---

## 1. SEO Optimization

### Title optimization

- Front-load the primary keyword in the first 3-4 words
- 50-60 characters for search engine display (Google truncates beyond ~60)
- Substack's title field has no hard limit, but search and social sharing truncate — write for the truncated view
- Avoid clickbait phrasing — Substack's audience converts on substance, not curiosity gaps

### SEO fields

Substack provides separate SEO fields (SEO title, SEO description, URL slug, social preview image) that don't affect how the post appears in email or the app. This means you can optimize for email and search independently.

- **SEO title**: use for a keyword-rich version of the headline (under 60 chars). The main title can stay punchy for email; the SEO title targets search.
- **SEO description** (meta description): 150-160 characters. If left blank, Substack falls back to the subtitle — but the subtitle is often too short to be an adequate meta description. Write a dedicated one with a hook and the primary keyword.
- **Subtitle**: under 10 words. Serves as email preview text (~90 chars visible) and page subhead. Optimize for humans, not search engines — the SEO description field handles that.

### URL slug

- Substack auto-generates the slug from the title, but you can edit it before publishing
- Keep it short: 3-6 words, hyphen-separated
- Include the primary keyword, drop stop words ("the", "a", "how", "to")
- Never include dates in slugs — dates make evergreen content look stale in search results
- Example: title "How to Profile Java Applications in Production" → slug `profile-java-applications-production`

### Internal linking

- Link to previous posts on the same publication — keeps readers on-site and helps Substack's algorithm understand your content graph
- Use descriptive anchor text with keywords (not "click here")
- 2-4 internal links per post is a good baseline
- Link from new posts to old evergreen posts to keep them ranking

### Substack's SEO position

- Substack has high domain authority — posts rank well in Google
- Web posts get long-tail search traffic that newsletter issues don't: emails are read once, web posts accumulate organic traffic over months
- The algorithm also surfaces web posts in Substack's own discovery feed and search
- Substack generates a sitemap automatically — no action needed

---

## 2. Web-First Formatting Rules

### Paragraph length

- Slightly longer than email: 3-4 sentences acceptable (vs 2-3 for email)
- Web readers still skim — break up walls of text
- Full-width rendering means paragraphs feel less dense than in narrow email columns

### Subheadings

- Every 200-400 words
- Use H2 for major sections, H3 for subsections
- H4 is usable on web (unlike email where H4 renders inconsistently)
- Write subheadings as scannable summaries, not clever labels — skimmers should get the argument from headings alone

### Table of contents

- For posts > 2000 words, add a manual TOC at the top
- Substack doesn't auto-generate a TOC — write it as a bulleted list
- Anchor links work on Substack's web view (use `#section-name` format)
- TOC helps both readers and SEO (Google sometimes shows jump links in search results)

### Code blocks

- Full syntax highlighting works reliably on web (unlike email where it varies)
- Longer code blocks acceptable: up to 30-40 lines
- For anything longer, link to a GitHub Gist or repo with a 5-10 line inline excerpt for context
- Use language hints in fenced blocks for proper highlighting

### Footnotes

- Render properly on web with working back-links (unlike email where back-links often break)
- Use freely for citations, digressions, and tangential details
- Keep footnote text concise — long footnotes distract from flow

### Bold and emphasis

- Same principle as email: bold the key phrase in each section so skimmers catch the argument
- Italics for titles, terms, and light emphasis
- Don't over-bold — 1-2 bold phrases per section

---

## 3. Content Strategy: Evergreen vs Timely

### Evergreen content (web post strengths)

- Tutorials, how-to guides, reference material, deep dives, frameworks
- Accumulates search traffic over months and years
- Update periodically to keep ranking (Substack lets you edit published posts — update the date to resurface)
- Best format for web posts — the long-tail search traffic is the value proposition
- Example: "The Complete Guide to Go Error Handling" will get traffic for years

### Timely content (newsletter strengths)

- Commentary, reactions to news, announcements, industry analysis, opinion
- Email delivery ensures immediate reads within 24-48 hours
- Short shelf life — search traffic drops quickly after the news cycle ends
- Better sent as newsletter issues where the email push drives engagement
- Example: "What Python 3.14's New Features Mean for Your Codebase" has a window

### Hybrid approach

- Publish timely content as newsletter issues, evergreen content as web posts
- Cross-link between them: "For background, see my deep dive on [topic]" in newsletters, linking to the evergreen web post
- Some posts are both: publish as a newsletter issue for immediate reach, but write the content to be evergreen so it accumulates search traffic long after the email is forgotten

---

## 4. Sections and Categories

- Substack lets you organize posts into **Sections** (visible tabs on the publication homepage)
- Use sections to group web posts by topic (e.g., "Tutorials", "Deep Dives", "Case Studies", "Industry Analysis")
- Each section gets its own RSS feed and can have its own subscribe option
- Readers can subscribe to specific sections — useful if your publication covers multiple topics
- Don't create too many sections early: 2-4 is sufficient until you have 20+ posts
- Sections help both reader navigation and the algorithm's content categorization
- Consider one section for evergreen web posts and another for newsletter-style commentary

---

## 5. Rich Media Usage

### Embeds

- YouTube, Twitter/X, Spotify, GitHub Gists, and other embeds render fully on web (unlike email where they degrade to links/previews)
- Use embeds freely in web posts — they add dwell time, which is an algorithm signal
- Embedded tweets and videos make the post feel more dynamic and connected to the broader conversation

### Images

- No client-side blocking concerns (unlike email where many clients block images by default)
- Use more liberally: diagrams, architecture charts, screenshots, annotated code, photos
- Still optimize file size for page load speed — Substack compresses images but large originals slow initial render
- Alt text matters for both accessibility and SEO — describe what the image shows, include relevant keywords naturally

### Interactive elements

- **Polls**: render inline on web (in email they show as a link to vote on the web version). Use to drive engagement and discussion.
- **Comments section**: prominent on web posts. End with a question to encourage comments — comments are an engagement signal.
- **Buttons** (subscribe, share, custom): render as proper styled buttons on web, styled links in email. Use subscribe buttons after delivering strong value.

### Comparison with email

| Element                  | Web                | Email                     |
| ------------------------ | ------------------ | ------------------------- |
| Embeds (YouTube, tweets) | Full render        | Link/preview only         |
| Images                   | Always visible     | Often blocked             |
| Polls                    | Inline voting      | Link to web               |
| Code blocks              | Full highlighting  | Varies by client          |
| Footnotes                | Working back-links | Often broken              |
| Long content             | Scrollable         | Gmail truncates at ~102KB |
