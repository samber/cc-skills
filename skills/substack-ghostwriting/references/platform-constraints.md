# Platform Formatting Constraints

## Post fields

- **Title**: No hard character limit, but keep under 60 characters for SEO (search engines truncate beyond that). Gmail shows ~70 chars in subject line, Yahoo ~46, mobile even less. Front-load the interesting part.
- **Subtitle**: No hard limit, but aim for under 10 words. Serves as email preview text (~90 chars visible) and as fallback SEO meta description if no custom one is set. Substack allows setting a separate SEO description (150-160 chars) — use it to optimize for search independently of the subtitle.
- **Post body**: No word/character limit, but Gmail truncates emails exceeding 102KB (~3000 words with formatting). Readers can click "View entire message" but most won't.

## Notes

- **No character limit** — unlike Twitter/X, Notes can be long-form.
- Supports text formatting (bold, italic, links), mentions, up to 6 photos or GIFs, links to posts, quotes, and comments.
- Does not support video uploads.
- Best-performing Notes are concise (2-5 sentences) despite having no limit. Use them as a testing pipeline for long-form ideas.

## Special content blocks

The post editor offers special blocks via the **"More"** dropdown and the **"Buttons..."** dropdown.

**Buttons (via "Buttons..." dropdown)**:

- **Subscribe button** — inline CTA for free readers. Place after delivering strong value to maximize conversion.
- **Share button** — one-click share prompt. Place after a key insight or at the end.
- **Custom button** — link to anything (repo, product, event). Keep text to 3-5 words.

**Content blocks (via "More" dropdown)**:

- **Paywall divider** — marks where paid content begins. Give enough free value above the fold to hook, then paywall the depth.
- **Pull quote** — styled blockquote for emphasis. Use for the single most quotable line in the post.
- **Footnotes** — render well on web, less reliably in email. Use for tangential details.
- **Code block** — syntax-highlighted fenced code. Keep under 10 lines for email (link to Gist for longer code).
- **LaTeX** — math rendering via `\command` syntax. Limited subset supported.
- **Financial chart** — embed stock/crypto charts for market data.
- **Poll** — inline reader poll. Drives engagement and replies (algorithm signals). One per post max.
- **Poetry block** — preserves custom spacing. Also useful for ASCII art or structured text.
- **Recipe** — structured recipe format. Niche but useful for food-adjacent newsletters.
- **Divider** — horizontal rule between sections. Max 2-3 per issue.

**Media embeds** (paste link on a new line):

- Tweets, YouTube/Vimeo, Spotify/SoundCloud/Bandcamp, GitHub Gists, Instagram
- Drag-and-drop: images, audio, video, PDFs, Excel (XLSX), comics (CBZ/CBR)
- Embeds render on web but degrade to link/preview in email. Don't rely on embeds for critical content.

When writing a post, suggest relevant special blocks where they add value — subscribe button after the hook, share button after the strongest insight, a poll to drive engagement, or a paywall divider for paid posts.
