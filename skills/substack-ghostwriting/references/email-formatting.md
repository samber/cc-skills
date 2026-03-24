# Email Formatting Reference

This reference covers email-first formatting for newsletter issues. For web post formatting, see `references/web-post-formatting.md`.

## Table of Contents

1. Email Client Constraints
2. Formatting Rules
3. Mobile Optimization
4. Code in Newsletters
5. Visual Elements

---

## 1. Email Client Constraints

Substack content is consumed primarily in email clients (Gmail, Apple Mail, Outlook). Email rendering is far more limited and inconsistent than web rendering. Format defensively.

**What works everywhere**: Plain text, bold, italic, links, headings (H2/H3), horizontal rules, blockquotes, simple images, ordered/unordered lists.

**What breaks in some clients**: Complex table layouts, custom fonts, background colors, embedded videos, JavaScript, CSS animations, multi-column layouts.

**What many clients block by default**: Images (Gmail shows them, Outlook often doesn't for first-time senders). Never put critical information only in an image.

---

## 2. Formatting Rules

### Paragraph length

2-3 sentences maximum. This is the single most important formatting rule for email newsletters. Email clients render text in narrow columns (especially on mobile). A paragraph that looks normal on a blog becomes a wall of text in an email.

### Subheadings

One every 300-400 words. Readers skim email more aggressively than web pages. Subheadings let skimmers navigate to the section they care about. Use H2 for major sections, H3 for subsections. Don't go deeper than H3.

### Bold for key phrases

Bold the main point of each section or paragraph. A reader scanning only the bold text should still catch your argument. This is not about emphasis for drama; it's a scanability tool.

Don't over-bold. If everything is bold, nothing is. Aim for 1-2 bold phrases per section.

### Links

Use descriptive anchor text. "Read the full benchmark results" is better than "click here." Email clients often show link destinations on hover, so the URL matters too. Avoid URL shorteners (they look spammy).

Place important links early in the issue. Click-through rate drops as readers scroll.

### Lists

Use sparingly. Lists work for:

- Enumerated steps (numbered)
- Quick comparisons (bulleted)
- Resource roundups

Don't use lists for:

- Every section of the article (turns the newsletter into a bullet-point dump)
- Things that should be flowing prose

### Horizontal rules

Use to separate major topic shifts. Don't overuse (max 2-3 per issue). They create clear visual breaks in email clients.

### Blockquotes

Work well for:

- Quoting someone else
- Highlighting a key insight you want to stand out
- Setting apart a TL;DR or key takeaway

---

## 3. Mobile Optimization

~60% of email opens happen on mobile. Key constraints:

- Subject line: Only ~35-40 characters visible on mobile. Front-load the interesting part.
- Preview text: First ~90 characters of the email body. This is your subheadline.
- Line length: Don't worry about it; email clients reflow text. But short paragraphs help.
- Images: Scale to full width on mobile. Use images that are readable at small sizes.
- CTA buttons: If using Substack's button feature, keep text short (3-5 words).

---

## 4. Code in Newsletters

Code rendering in email is the worst part of technical newsletters. Handle it carefully.

**Short code** (< 5 lines): Inline code blocks (`like this`) work in most clients.

**Medium code** (5-10 lines): Fenced code blocks render acceptably in Gmail and Apple Mail. Outlook may strip formatting. Keep it under 10 lines.

**Long code** (> 10 lines): Don't put it in the email. Link to a GitHub Gist, a repo, or a playground (Go Playground, Rust Playground, etc.) instead. Add a 2-3 line excerpt inline to give context.

**Language hints**: Substack supports syntax highlighting in code fences. Use it:

```go
// This renders with Go syntax highlighting on web
// Email rendering varies but it's still better than nothing
```

**Inline code formatting**: Use `backtick formatting` for function names, variable names, commands, and short code references in prose. Most email clients handle this well.

---

## 5. Visual Elements

### Images

- Use to break up long text sections (every 500-800 words)
- Diagrams and charts add value for technical content
- Always include alt text (for clients that block images)
- Optimize file size (email clients may not load large images)
- Screenshots of code/terminal output sometimes work better than code blocks in email

### Substack-specific elements

See the "Substack special content blocks" section in SKILL.md for the full list of available blocks (buttons, paywall, pull quote, LaTeX, poll, etc.) and when to use each.

**Email rendering notes for special blocks:**

- **Buttons** (subscribe, share, custom): Render as styled links in email. Keep text to 3-5 words. Max 1-2 per issue.
- **Subscription widget**: Substack auto-inserts these. Don't fight it.
- **Pull quotes**: Render as styled blockquotes in email. Work well across clients.
- **Footnotes**: Render well on web, less reliably in email (some clients break the back-link). Use sparingly.
- **Paywall divider**: Shows a "subscribe to read more" CTA in email for free readers.
- **Code blocks**: Syntax highlighting works on web. Email rendering varies — Gmail and Apple Mail handle it acceptably, Outlook may strip formatting.
- **LaTeX**: Renders as an image on web. May not render in all email clients — include a text fallback for critical formulas.
- **Polls**: Render as clickable options on web. Email shows a link to vote on the web version.
- **Embeds** (tweets, YouTube, Spotify, etc.): Email shows a link or preview image, not the embed. Don't rely on embeds for critical content.
