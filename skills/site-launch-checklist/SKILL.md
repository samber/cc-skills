---
name: site-launch-checklist
description: Pre-launch checklist for shipping a new website. Orchestrates analytics setup (GA4, PostHog, Google Search Console, Ahrefs), legal compliance, security headers and audit, SEO and GEO with keyword research validated against Google Trends (robots.txt, sitemaps, llms.txt, AI policy, schema markup, hreflang), copywriting consistency via a TONE.md and a humanizer pass in the matching language, OpenGraph and social previews, full favicon set with manifest, quality gates (Lighthouse, Core Web Vitals, WCAG accessibility, mobile testing), and setup of a weekly SEO agent. Use this skill whenever the user mentions launching a site/app, deploying a domain to production, pre-launch audit, shipping a marketing/docs/SaaS site or lead magnet, or says "checklist for the site", "ready to ship", "before I go live", "audit before launch", "ready for prod", or asks for a site review.
license: MIT
compatibility: Requires Claude Code
user-invocable: true
metadata:
  author: samber
  version: "1.0.1"
  openclaw:
    emoji: "📊"
    homepage: https://github.com/samber/cc-skills
    install:
      - kind: npm
        package: skills
        bins: [skills]
      - kind: brew
        formula: jq
        bins: [jq]
    requires:
      bins:
        - curl
        - npm
        - npx
        - jq
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion
---

# Site Launch Checklist

Pre-launch audit and setup workflow for shipping a new website. Opinionated for Cloudflare DNS + Vercel hosting + PostHog + Legal context.

## Interaction style (READ FIRST)

This skill is intentionally interactive. **Use `ask_user_input_v0` aggressively** instead of assuming. Ask one question at a time with 2-4 tappable options. The user will tap, not type.

**Always ask these questions at the start of a run** (one at a time, in this order):

1. Site type: `doc-site` | `marketing/lead-gen` | `SaaS-app` | `training/paid-course` | `personal-portfolio`
2. Migration: `greenfield-new-domain` | `migration-need-301-redirects` | `replacing-existing-on-same-domain`
3. Multilingual: `single-locale` | `en` | `fr+en` | `other-multi`
4. PostHog setup: `hogpost.samber.dev` | `set-up-new-proxy` | `skip-PostHog`
5. AI scraper policy: `use-default-for-site-type` | `customize-per-bot` | `block-all`
6. Browser tool available: `claude-chrome-extension` | `playwright` | `neither-skip-browser-checks`

**Ask again at every decision point throughout the phases**, including:

- Whether to install Sentry / BetterStack / Crisp (depends on site type, ask explicitly)
- www vs apex canonical preference (most sites: apex; ask anyway)
- Which AI bots to allow if user chose `customize-per-bot`
- CSP tightness level: `strict-default-src-none` | `balanced-allow-self` | `permissive-for-marketing`
- Whether to skip a phase entirely (e.g., skip Phase 3 if non-FR site)

Never proceed past a decision point without explicit user input. Verbose checklists without checkpoints are not the goal.

**Never install any MCP server or skill without explicit user confirmation.** Always ask via `ask_user_input_v0` before running `npx skills add`, `claude mcp add`, or any equivalent install command — even when the skill selection workflow proposes a curated subset.

## How to use this skill

1. Run the start-of-session questions above.
2. Walk the user through phases 1-10 in order. For each phase: a. List items, ask if any should be skipped. b. For each remaining item, run the verification command (see "Verification tools" below). c. Report pass/fail. On fail, ask the user if they want to fix now or queue for later.
3. End with a status report grouped by phase, with blockers, recommended fixes, and optional improvements clearly separated.

## Companion skills

Six skill packs are useful for site launches. **Never install full multi-skill packs**. The actual subset to install is decided at invocation time based on the site type the user confirms.

### Pack inventory

| Pack | What it covers | Typically useful for |
| --- | --- | --- |
| `AgriciDaniel/claude-seo` | SEO + GEO + schema + hreflang + sitemaps audits, parallel sub-agents | All site types |
| `addyosmani/web-quality-skills` | Lighthouse, Core Web Vitals, accessibility, performance, best practices | All site types |
| `trailofbits/skills` | Security audit (OWASP, headers, dependencies) | All site types |
| `aaron-he-zhu/seo-geo-claude-skills` | 20 SEO+GEO skills, CORE-EEAT + CITE frameworks, `/seo:` slash commands | Content-heavy sites, competitive niches |
| `coreyhaines31/marketingskills` | ~30 marketing skills (CRO, copywriting, ads, popups, email, paywalls, etc.) | `marketing/lead-gen`, `SaaS-app`, `training/paid-course` |
| `jonathimer/devmarketing-skills` | 33 developer-marketing skills (persona, docs-as-marketing, technical tutorials, etc.) | `doc-site`, `SaaS-app` for developers |

### Skill selection workflow (run at session start)

After the user confirms site type, for **each pack relevant to that site type**:

1. **List available sub-skills**: `npx skills add owner/repo --list`
2. **Propose a curated subset** based on site type and the phases this skill will execute. Match each phase's needs to specific sub-skills the listing returns.
3. **Confirm with the user** via `ask_user_input_v0`. Use multi-select when the proposed list has more than 3 items, single-select (`install-as-proposed` | `let-me-modify` | `skip-this-pack`) otherwise.
4. **Bulk install the agreed subset**: `npx skills add owner/repo --skill A B C`

Rules:

- Sub-skill names live in the pack, not in this SKILL.md. Always query `--list` for the current state. Pack contents change.
- Never run `npx skills add owner/repo` without `--skill` (that installs everything).
- Site type → packs mapping (which packs to enumerate, sub-skills still selected per workflow):
  - `doc-site`: claude-seo, web-quality-skills, trailofbits, seo-geo-claude-skills, devmarketing-skills
  - `marketing/lead-gen`: claude-seo, web-quality-skills, trailofbits, seo-geo-claude-skills, marketingskills
  - `SaaS-app`: all six
  - `training/paid-course`: claude-seo, web-quality-skills, trailofbits, marketingskills
  - `personal-portfolio`: claude-seo, web-quality-skills, trailofbits, seo-geo-claude-skills (lightweight subset)
- If the user later requests a phase that needs a sub-skill not yet installed, run the workflow again for that single sub-skill rather than re-installing the whole subset.

This avoids importing 80+ skills the user does not need, avoids going stale on sub-skill names, and avoids overfitting to a single pack version.

When delegating during a phase, do not duplicate work this skill orchestrates. Call the specialist with a narrow scope (e.g., "run only the security headers sub-audit on URL X").

## Copywriting voice and humanizer pass

Every site has visible marketing copy (hero, features, CTAs, meta descriptions, OG descriptions, blog posts, 404 page text). Two layers of polish are mandatory before launch:

### 1. Define `TONE.md` once per site

Ask the user (`ask_user_input_v0`): "Does this site already have a `TONE.md`?" (`yes-already-exists` | `no-create-from-template` | `skip-use-default`).

If creating: write it to `.agents/TONE.md` or repo root `TONE.md`. See `references/templates.md` (section "TONE.md template") for the structure.

TONE.md specifies: voice (terse, contrarian, etc.), forbidden patterns (e.g., "delve", "crucial", em dashes, AI-sounding openers), sentence length preference, audience reading level, examples of good and bad sentences from the user's own writing.

### 2. Run a humanizer pass in the matching language

After every drafting step (whether by a copywriting skill, by hand, or by Claude directly), run a humanizer to strip AI patterns.

Ask the user (`ask_user_input_v0`) for the site's primary audience language at the start of the session if not already known:

- `english-global` → `npx skills add https://github.com/blader/humanizer --skill humanizer`
- `french` → use `samber/humaniseur-fr` (custom French humanizer) or equivalent French-tuned skill
- `other` → install matching humanizer if available; otherwise the skill writes a short language-specific anti-pattern checklist inline

Apply the humanizer to: hero copy, feature descriptions, CTA buttons, meta descriptions, OG/Twitter card descriptions, blog posts, email signup confirmations, 404 page text. Skip for legal pages (mentions légales, CGV) since they have rigid wording requirements.

### 3. Always reference TONE.md when invoking copywriting skills

When delegating to any copywriting or content-writing sub-skill (selected at invocation per the skill selection workflow), include `TONE.md` in the prompt context. Pass voice constraints explicitly: "Follow `.agents/TONE.md`. Avoid the listed patterns. Apply the humanizer after drafting."

## Browser interaction preference

Many checks require a real browser (Lighthouse runs, securityheaders.com scan, opengraph.xyz validation, Twitter card validator, mobile viewport, screen reader smoke, Network tab inspection).

**Always prefer the Claude Chrome extension.** Fall back to Playwright only if the Chrome extension is unavailable. If neither is available, ask the user (`ask_user_input_v0`) whether to skip browser checks entirely or wait until they enable one.

## Verification tools

Most checks are doable from the command line without third-party services. Use these tools inline at every phase. Don't trust panels in Cloudflare/Vercel/Google dashboards alone, verify with curl.

**DNS (Phase 1):**

```bash
dig +short A example.com                          # A record
dig +short AAAA example.com                       # AAAA (IPv6)
dig +short MX example.com                         # MX (mail)
dig +short TXT example.com                        # SPF + verification TXT
dig +short TXT _dmarc.example.com                 # DMARC
dig +short TXT default._domainkey.example.com     # DKIM (selector varies)
dig +short CAA example.com                        # CAA
dig +dnssec example.com | grep RRSIG              # DNSSEC active
```

**TLS / HTTPS (Phase 1):**

```bash
curl -sIL https://example.com | head             # follow redirects
curl -sI https://www.example.com                 # check www handling
openssl s_client -showcerts -connect example.com:443 < /dev/null 2>/dev/null | openssl x509 -noout -dates
```

**Headers (Phase 4):**

```bash
curl -sI https://example.com | grep -iE 'content-security-policy|strict-transport-security|x-frame-options|x-content-type-options|referrer-policy|permissions-policy'
# Full header dump:
curl -sI https://example.com
# External graders:
curl -s "https://api.securityheaders.com/?q=https://example.com&followRedirects=on&hide=on" -I | grep -i 'x-grade'
```

**SEO files (Phase 5):**

```bash
curl -s https://example.com/robots.txt
curl -sI https://example.com/sitemap.xml
curl -s https://example.com/sitemap.xml | head -40
curl -s https://example.com/llms.txt
# Schema (JSON-LD):
curl -s https://example.com/ | grep -A 50 'application/ld+json'
# hreflang:
curl -s https://example.com/ | grep -i hreflang
```

**Open Graph & social (Phase 6):**

```bash
curl -s https://example.com/page | grep -iE 'og:|twitter:|<title|name="description"'
```

**Favicons & manifest (Phase 7):**

```bash
curl -sI https://example.com/favicon.ico
curl -sI https://example.com/favicon.svg
curl -sI https://example.com/apple-touch-icon.png
curl -s https://example.com/manifest.json | jq .
```

**404 / 500 / redirects:**

```bash
curl -sI https://example.com/this-does-not-exist
curl -sIL https://example.com/old-url     # verify 301 chain
```

Always run the relevant command, paste the output to the user when reporting, then ask (via `ask_user_input_v0`) whether to fix immediately or queue.

---

## Phase 1: Domain & Infrastructure

Most of this is one-click via Cloudflare's dashboard if the domain is on Cloudflare.

Ask first: "Is the domain already on Cloudflare with the standard config from previous launches?" (`yes-standard` | `yes-needs-review` | `no-fresh-setup`)

Checklist:

- [ ] Cloudflare: proxy ON for apex + www, TLS 1.3 minimum, "Always Use HTTPS" enabled, HSTS preload enabled in Cloudflare SSL/TLS settings
- [ ] DNS A/AAAA or CNAME pointing to Vercel (verify with `dig +short A example.com`)
- [ ] MX records for Google Workspace (verify with `dig +short MX example.com`)
- [ ] SPF, DKIM, DMARC records (verify all 3 with the dig commands above)
- [ ] CAA records restricting cert issuance (verify with `dig +short CAA example.com`)
- [ ] DNSSEC enabled at registrar level (verify with `dig +dnssec`)
- [ ] Vercel: project linked to repo, prod + preview env vars set, custom domain attached, prod and preview aliases correct
- [ ] Decide www vs apex canonical, configure 308 redirect for the non-canonical (verify with `curl -sIL https://www.example.com`)
- [ ] Custom 404 page renders (verify with `curl -sI https://example.com/does-not-exist`)
- [ ] Custom 500 page exists (cannot easily verify without forcing an error, ask user)
- [ ] If migration: 301 redirect map for every old URL (loop verification with `curl -sIL` per URL)

### Backups

If you don't configure backups at launch, you never will. Do it now.

Ask the user (`ask_user_input_v0`): "Which data stores does this app write to?" (`database-only` | `database-plus-file-storage` | `file-storage-only` | `stateless-no-persistent-data`). If `stateless-no-persistent-data`, skip this section.

**Database:**

- [ ] Automated daily backups enabled at the provider level (Neon, Supabase, PlanetScale, Railway, RDS — each has a one-click toggle). Verify by opening the backup panel and confirming the last backup timestamp is recent.
- [ ] Retention policy set to ≥30 days
- [ ] Point-in-time recovery (PITR) enabled if available (Neon, Supabase, RDS all support it)
- [ ] Off-site copy: if the provider stores backups in the same region as the primary, configure cross-region replication or a nightly export to a separate storage account (S3, R2, GCS)
- [ ] **Restore drill performed before launch**: pick a recent backup, restore to a staging database, verify row counts and a sample query. A backup you haven't tested is not a backup.

**File storage (if applicable — S3, R2, GCS, Cloudflare Images):**

- [ ] Versioning enabled on the primary bucket
- [ ] Cross-region replication or a scheduled sync to a secondary bucket. Backblaze B2 is a cheap, reliable option for off-site copies (significantly cheaper than S3/GCS egress). Use `rclone` to sync from S3/R2/GCS → B2 on a daily cron.
- [ ] Lifecycle rule: transition old versions to cheaper storage after 30 days, delete after 90 days (adjust to cost tolerance)

**Secrets / environment variables:**

- [ ] All env vars documented and stored in a secrets manager (1Password, Doppler, Vault, or equivalent). Not in a `.env` file on someone's laptop.
- [ ] Verify: if every engineer's machine burned tonight, could a new team member restore prod from scratch using only the secrets manager + git?

**Monitoring:**

- [ ] Set up an alert (email or Slack) if the daily backup job fails. Most providers support this natively; configure it before closing the backup panel.

---

## Phase 2: Analytics & Observability

Most third-party integrations are one-click via Cloudflare or Vercel.

**For the conditional tools (Crisp, Sentry, BetterStack), use `ask_user_input_v0`** to confirm per site type. See `references/decisions.md` for the observability tier matrix.

**Always-on:**

- [ ] Google Analytics 4: property created, measurement ID embedded, gated behind CNIL consent
- [ ] PostHog: based on user's earlier answer:
  - If `hogpost.samber.dev`: configure client with `api_host: "https://hogpost.samber.dev"` and verify CORS allows the new domain (test with browser console or `curl -H "Origin: https://newsite.com" -I https://hogpost.samber.dev/decide`)
  - If `set-up-new-proxy`: add path rewrite in `next.config.js` to `us.i.posthog.com` and `us-assets.i.posthog.com`, init client with `api_host: "/ingest"`
  - If `skip-PostHog`: skip
- [ ] Google Search Console: site verified (DNS TXT or HTML file), sitemap submitted
- [ ] Bing Webmaster Tools: site verified, sitemap submitted, IndexNow key file at `/{key}.txt` on root (verify with `curl -sI https://example.com/{key}.txt`)
- [ ] Ahrefs: site added to dashboard for tracking
- [ ] Add the site to the internal stats spreadsheet (PostHog properties registry + GitHub Sponsors tracking sheet if applicable)

**Brand monitoring (Google Alerts):**

For each alert, use these settings: **Frequency**: once a day | **Sources**: Automatic | **How many**: All results | **Region**: Any region

Set up one alert per keyword via alerts.google.com:

- [ ] Domain name (e.g., `example.com`)
- [ ] Brand or product name (quoted if multi-word, e.g., `"My Brand"`)
- [ ] Key feature or library names if the site documents a project
- [ ] Competitor brand names (optional — ask user via `ask_user_input_v0`: `yes-monitor-competitors` | `skip`)

Ask the user: "Which additional keywords to monitor?" (`product-name-only` | `domain-plus-brand` | `full-set-with-competitors` | `custom-list`)

**Developer community monitoring (F5bot) — for `doc-site` and `SaaS-app` targeting developers:**

F5bot (f5bot.com) monitors Reddit, Hacker News, and Lobste.rs for keyword mentions and sends email alerts. Free, no API required.

Set up one keyword per line at f5bot.com/add:

- [ ] Brand or product name
- [ ] Domain name (catches link shares)
- [ ] Key feature or library names
- [ ] Common misspellings if applicable

**Conditional (ask user, default per site type from `references/decisions.md`):**

- [ ] Crisp
- [ ] Sentry
- [ ] BetterStack

---

## Phase 3: Legal & Compliance (FR)

Ask first: "Is this site subject to French law?" (`yes-FR-operator-or-audience` | `no-EU-only` | `no-non-EU`). If no, ask whether GDPR or equivalent applies and adjust.

For FR sites:

- [ ] Mentions légales page (mandatory, fines up to 75k€ per omission)
- [ ] CGV (Conditions Générales de Vente) if commercial activity
- [ ] Privacy policy
- [ ] Terms of service
- [ ] CNIL-compliant cookie consent that **gates** GA4, PostHog, Crisp, Sentry script loading (not just a banner that always loads trackers). Use a CMP (Axeptio, Tarteaucitron, or custom). Verify with browser Network tab: no tracker fires before explicit consent.

---

## Phase 4: Security

Delegate the deep audit to `trailofbits/skills`. The items below are the must-pass checklist.

Ask first: CSP tightness level (`strict-default-src-none` | `balanced-allow-self` | `permissive-for-marketing`). See `references/templates.md` for the CSP template per level.

- [ ] CSP: target chosen tightness level. No `'unsafe-inline'` for scripts (use nonces). Verify with `curl -sI ... | grep -i content-security-policy`.
- [ ] HSTS: `max-age=31536000; includeSubDomains; preload`. Submit to hstspreload.org. Verify with `curl -sI ... | grep -i strict-transport`.
- [ ] X-Frame-Options: `DENY`
- [ ] X-Content-Type-Options: `nosniff`
- [ ] Referrer-Policy: `strict-origin-when-cross-origin`
- [ ] Permissions-Policy: deny camera, microphone, geolocation, payment unless used
- [ ] Run all headers in one go: `curl -sI https://example.com | grep -iE 'content-security|strict-transport|x-frame|x-content-type|referrer-policy|permissions-policy'`
- [ ] securityheaders.com: target A+ (verify via Claude Chrome extension or `curl https://securityheaders.com/?q=URL` and parse)
- [ ] observatory.mozilla.org: target 90+ (via Chrome extension)
- [ ] Run `trailofbits/skills` security audit on the codebase
- [ ] Verify no leaked secrets in client bundle: open Chrome DevTools Network tab via Claude Chrome extension, grep response bodies for `sk_`, `pk_`, `AKIA`, `ghp_`, `Bearer `

---

## Phase 5: SEO & GEO

Delegate the full audit to `AgriciDaniel/claude-seo`. The items below are the orchestration list.

See `references/templates.md` for `robots.txt`, `llms.txt`, and `manifest.json` templates. See `references/decisions.md` for the AI scraper policy matrix by site type.

- [ ] `/robots.txt` present, references sitemap (verify with `curl -s https://example.com/robots.txt`)
- [ ] `/sitemap.xml` present, valid (verify with `curl -s https://example.com/sitemap.xml | head -40`). Sitemap-index with per-language sitemaps if multilingual.
- [ ] `/llms.txt` present (per llmstxt.org spec, verify with `curl -s https://example.com/llms.txt`)
- [ ] AI scraper policy encoded in `robots.txt`. Apply the matrix from `references/decisions.md` based on site type, then **ask user via `ask_user_input_v0` to confirm each non-default decision**.
- [ ] Schema markup (JSON-LD): `Organization` + `WebSite` + `BreadcrumbList` site-wide; per-page types where applicable (`SoftwareApplication` for lib homepages, `Article` for blog posts, `FAQPage` for FAQs, `Person` for author bio). Verify with `curl -s URL | grep -A 50 'application/ld+json'`. Validate structured data via **Google Rich Results Test** (https://search.google.com/test/rich-results) and **Schema.org Validator** (https://validator.schema.org) — Rich Results Test checks eligibility for rich snippets; Schema.org Validator catches spec violations that Google may silently ignore.
- [ ] Meta tags per page: unique `<title>` (50-60 chars), unique `<meta description>` (150-160 chars), `<link rel="canonical">`, `<meta name="robots">` if needed
- [ ] `hreflang` tags on every page if multilingual (every language version declares all alternates including self). Verify with `curl -s URL | grep -i hreflang`.
- [ ] **Keyword analysis using both Google Trends and Ahrefs** (they answer different questions, not interchangeable):
  - **Google Trends** (trends.google.com): trajectory (rising vs declining), geographic distribution (especially FR vs international split), seasonal patterns, related queries breakout, head-to-head comparison of 2-5 candidate keywords. Use Trends to **validate direction and timing** of the SEO bet.
  - **Ahrefs Keywords Explorer**: monthly volume, keyword difficulty, SERP analysis, CPC, parent topic, traffic potential. Use Ahrefs to **size the opportunity** in absolute terms.
  - Combined output: a ranked shortlist of 3-5 target queries per page, with rationale (volume × difficulty × trajectory × intent match).
  - Delegate to whichever keyword-research sub-skill was installed at session start (selected from the installed packs via the skill selection workflow; typical sources are the SEO+GEO and marketing packs).
- [ ] **AI visibility audit via productrank.ai**: open productrank.ai in a browser, submit multiple category or product searches, run the full AI SEO report. It audits how the site appears in AI-generated answers (ChatGPT, Perplexity, Gemini, Claude). Flag any zero-visibility categories and surface content gaps the AI graders identify.
- [ ] Typo and grammar pass on all visible text content
- [ ] Backlink profile audit: run **Ahrefs Backlink Checker** and **Moz Link Explorer** to assess domain authority and surface toxic or broken inbound links before launch — especially critical on migrations to ensure old-domain equity transfers correctly
- [ ] Internal linking audit: every important page reachable in ≤3 clicks from the homepage

---

## Phase 6: Open Graph & Social Preview

Verify all OG and Twitter tags with: `curl -s URL | grep -iE 'og:|twitter:'`

- [ ] `og:title`, `og:description`, `og:url`, `og:type`, `og:site_name`
- [ ] `og:image` 1200×630px, absolute URL, `og:image:width` and `og:image:height` declared, `og:image:alt` set
- [ ] **Per-page `og:image`**, not one global. For doc sites: generate dynamically from page title. For blog posts: per-article custom image.
- [ ] `og:locale` + `og:locale:alternate` for each language if multilingual
- [ ] Twitter Cards: `twitter:card=summary_large_image`, `twitter:title`, `twitter:description`, `twitter:image`, `twitter:site` (handle)
- [ ] Validate with opengraph.xyz (covers FB, LinkedIn, Slack, Discord, WhatsApp previews) via Claude Chrome extension
- [ ] Validate with Twitter's card validator
- [ ] Manual check: paste URL in a LinkedIn DM, a Slack channel, a Discord, an iMessage. Preview must render correctly in all.

---

## Phase 7: Favicons & Web Manifest

See `references/templates.md` for the `manifest.json` template.

Generate from a single 1024×1024 source PNG using realfavicongenerator.net or favicon.io.

**Minimum modern set:**

- [ ] `/favicon.ico` (multi-res 16/32/48). Verify with `curl -sI https://example.com/favicon.ico`.
- [ ] `/favicon.svg` with embedded `<style>@media (prefers-color-scheme: dark) { ... }</style>` for dark mode. Verify with `curl -sI https://example.com/favicon.svg`.
- [ ] `/favicon-96x96.png` (PNG fallback)
- [ ] `/apple-touch-icon.png` 180×180px, no transparency, opaque background. Verify with `curl -sI`.
- [ ] `/web-app-manifest-192x192.png` (Android PWA icon)
- [ ] `/web-app-manifest-512x512.png` (Android splash)
- [ ] `/manifest.json` referencing both PNGs, with `theme_color`, `background_color`, `name`, `short_name`, `display`. Verify with `curl -s https://example.com/manifest.json | jq .`.

**Skip (deprecated):**

- `mstile-*.png` (Windows tiles)
- `safari-pinned-tab.svg` (deprecated since macOS Big Sur)
- `favicon-16x16.png` / `favicon-32x32.png` (covered by `.ico` and `.svg`)

**HTML head verification:**

```bash
curl -s https://example.com/ | grep -iE 'rel="icon"|rel="apple-touch-icon"|rel="manifest"'
```

---

## Phase 8: Quality Gates

Delegate to `addyosmani/web-quality-skills`. The skill covers 150+ Lighthouse audits across performance, accessibility, SEO, and best practices.

- [ ] **Unlighthouse site-wide crawl**: `npx unlighthouse --site {site}` — crawls all pages and runs Lighthouse on each. Surface pages below 90 on any axis before the per-URL checks.
- [ ] Lighthouse all 4 axes, mobile mode: target ≥90 on each (perf, a11y, best practices, SEO)
- [ ] Lighthouse all 4 axes, desktop mode: target ≥95 on each
- [ ] Core Web Vitals field data (CrUX via PageSpeed Insights): LCP < 2.5s, INP < 200ms, CLS < 0.1, on both mobile and desktop
- [ ] Accessibility (WCAG 2.2 AA via `web-quality-skills`): keyboard nav works for every interactive element, focus rings visible, color contrast ≥4.5:1 for text, all images have `alt`, heading hierarchy is monotonic (H1 → H2 → H3), ARIA labels on icon-only buttons
- [ ] Real mobile device test (not just devtools emulator). Use Claude Chrome extension on mobile viewport on a real device or BrowserStack.
- [ ] Cross-browser smoke test: Chrome, Safari, Firefox latest stable
- [ ] Print stylesheet sanity (Cmd+P should not break layout)

---

## Phase 9: Ecosystem Cross-linking

Internal cross-linking between owned properties. High-leverage SEO action for any multi-domain owner.

Ask the user: "List the other domains in your ecosystem that are topically relevant to this new site." Then for each one:

- [ ] Add a link from the existing site (footer / nav / "other projects" section) to the new site, where topically relevant
- [ ] Add a link to the new site in the README of the matching GitHub repo, if it documents a library
- [ ] Verify reciprocal links: every link added points back where appropriate
- [ ] If the new site documents a Go lib, link from related lib docs

Do not over-link. Only cross-link where topically relevant. A doc site for a logging lib should not link to a personal blog about cycling.

---

## Phase 10: Set up weekly SEO maintenance sub-agent

After launch, set up a Hermes agent or Claude Cowork agent that runs weekly to monitor SEO health and surface action items.

See `references/weekly-seo-agent.md` for the full agent definition. Copy it into `.claude/agents/weekly-seo.md` in the site's repo (or a dedicated ops repo). The agent uses these MCP connectors:

- Ahrefs MCP (backlinks, rankings, keywords)
- PostHog MCP (analytics correlation, AI bot traffic)
- Web search (SERP monitoring, competitor checks)
- Google Search Console (via community MCP or `curl` with service account credentials)

Ask the user via `ask_user_input_v0`: "Set up the weekly SEO agent now?" (`yes-create-agent-file` | `yes-but-defer` | `skip-for-now`).

When MCP are not available, use Claude for Chrome extension.

---

## Output format

At the end of a full run, output a status report grouped by phase:

```
Phase 1: Domain & Infrastructure  [9/10 pass]
  ✓ Cloudflare proxy on
  ✓ DNS records configured
  ...
  ✗ DMARC missing. Fix: add TXT record at _dmarc.example.com with policy v=DMARC1; p=quarantine;...

Phase 2: Analytics & Observability  [6/7 pass]
  ...
```

Followed by three lists, in order:

1. **Blockers** (must fix before launch)
2. **Recommended fixes** (should fix before announcing)
3. **Optional improvements** (post-launch)

End by asking via `ask_user_input_v0`: "Which list do you want to tackle next?" (`blockers` | `recommended` | `optional` | `done-for-now`).

---

## References

- `references/decisions.md`: AI scraper policy matrix by site type, observability tier matrix
- `references/templates.md`: robots.txt, llms.txt, manifest.json, CSP templates per tightness level, security headers reference
- `references/weekly-seo-agent.md`: Full definition of the weekly SEO maintenance sub-agent (MCPs, tasks, output format)
