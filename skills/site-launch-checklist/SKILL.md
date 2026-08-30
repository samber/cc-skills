---
name: site-launch-checklist
description: Pre-launch checklist for shipping a new website. Orchestrates analytics setup (GA4, PostHog, Google Search Console, Ahrefs), legal compliance, security headers and audit, SEO and GEO with keyword research validated against Google Trends (robots.txt, sitemaps, llms.txt, AI policy, schema markup, hreflang), copywriting consistency via a TONE.md and a humanizer pass in the matching language, OpenGraph and social previews, full favicon set with manifest, quality gates (Lighthouse, Core Web Vitals, WCAG accessibility, mobile testing), and setup of a weekly SEO agent. Also covers launch readiness (SLC gate), directory submission strategy (13 tiers, destination pages, PH 3-week prep), review generation (10-in-30 G2/Capterra protocol), and post-launch momentum. Use this skill whenever the user mentions launching a site/app, deploying a domain to production, pre-launch audit, shipping a marketing/docs/SaaS site or lead magnet, or says "checklist for the site", "ready to ship", "before I go live", "audit before launch", "ready for prod", or asks for a site review.
license: MIT
compatibility: Designed for Claude Code, Codex or similar harness. Requires internet access for directory submissions, G2/Capterra reviews, and AI citation checks.
user-invocable: true
metadata:
  author: samber
  version: "2.0.0"
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

**Questions:** Ask the user through the environment's question tool — never as plain-text prose. One question at a time, 2–4 tappable options, wait for the answer. If the environment has no question tool, ask in prose with the same options, one at a time.

# Site Launch Checklist

Pre-launch audit and setup workflow for shipping a new website. Opinionated for Cloudflare DNS + Vercel hosting + PostHog + Legal context.

## Interaction style (READ FIRST)

This skill is intentionally interactive. Ask aggressively instead of assuming. The user will tap, not type.

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

**Never install any MCP server or skill without explicit user confirmation.** Always ask via the question tool before running `npx skills add`, `claude mcp add`, or any equivalent install command — even when the skill selection workflow proposes a curated subset.

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
3. **Confirm with the user.** Use multi-select when the proposed list has more than 3 items, single-select (`install-as-proposed` | `let-me-modify` | `skip-this-pack`) otherwise.
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

## Phase 0: Launch Readiness Gate

**Run this BEFORE any other phase.** Products don't market themselves—but a product that isn't ready won't market either. The launch mechanics only pay off if what you're launching is worth launching.

Two failure modes kill launches from opposite ends:

- **Stealth Mode** — launching too late. "Procrastination in a fancy suit." You keep polishing in private, waiting for the product to be perfect. It never ships, and nobody learns you exist.
- **"Just One More Feature"** — never launching. Every proposed launch date gets pushed for one more thing. The scope creeps forever; the launch never comes.

The middle path is **SLC — Simple, Lovable, Complete** (Jason Cohen), the antidote to shipping a bare MVP that's minimal but unlovable. Don't launch a stub nobody wants; don't wait for a bloated everything-app. A launchable v1 is:

- **Simple** — it does *one* thing. Not many things poorly. One clear job, done well.
- **Lovable** — people *want* to use it, not just tolerate it. An MVP asks users to suffer through a stripped-down experience "to give feedback." SLC gives them something they'd choose. If nobody would be sad to lose it, it isn't lovable yet.
- **Complete** — it's a *whole* experience for that one thing, not a stub with obvious holes. Complete at its chosen scope, not a teaser of a bigger promise.

**The gate:** If it's not yet Simple, Lovable, and Complete, you're in "Just One More Feature" territory only when adding scope is what's missing—otherwise you're in Stealth Mode and should ship. Cut scope until one thing is lovable and complete, then launch that. SLC gives you a real launch now instead of a perfect launch never.

**Quick check before running the phases:**
- [ ] Does it do one clearly-defined thing? (Simple)
- [ ] Would a target user *choose* to use it, not just endure it? (Lovable)
- [ ] Is that one thing a whole experience, with no glaring stubs? (Complete)
- [ ] Are you polishing past this bar? → Stop. You're in Stealth Mode. Ship.
- [ ] Are you still adding new things to the scope? → Stop. You're in "Just One More Feature." Cut back to SLC.

**Directory submission readiness (from directory-submissions skill):**
Ask these 9 questions. If any are "no", they're not ready — help them build the missing piece first.

1. Is the product publicly accessible (no password wall)?
2. Is there a pricing page (even "free while in beta")?
3. Are privacy policy + terms live?
4. Logo assets in PNG + SVG + square + favicon?
5. 5–8 real screenshots + 60–90s demo video?
6. Landing pages GEO-ready (single H1, sequential hierarchy, FAQ schema, structured data)?
7. At least 3 alternative pages and 3 use-case pages live and indexed?
8. Template gallery or lead magnet asset (if applicable to category)?
9. At least 20 beta/early users who could leave a review on G2?

A "no" on any of 1–7 is a hard block. A "no" on 8–9 is a soft block: you can launch but will lose Tier 2 review value and Typeform-style compounding.

**ORB Channel Strategy (from launch skill):**
Structure your launch marketing across three channel types. Everything should ultimately lead back to owned channels.

### Owned Channels
You own the channel (though not the audience). Direct access without algorithms or platform rules.
- Email list, Blog, Podcast, Branded community (Slack, Discord), Website/product
- **Start with 1-2 based on audience:** Industry lacks quality content → Blog; People want direct updates → Email; Engagement matters → Community

### Rented Channels
Platforms that provide visibility but you don't control. Algorithms shift, rules change, pay-to-play increases.
- Social media (Twitter/X, LinkedIn, Instagram), App stores, YouTube, Reddit
- **How to use correctly:** Pick 1-2 platforms where your audience is active; Use them to drive traffic to owned channels; Don't rely on them as your only strategy

### Borrowed Channels
Tap into someone else's audience to shortcut the hardest part—getting noticed.
- Guest content (blog posts, podcast interviews, newsletter features)
- Collaborations (webinars, co-marketing, social takeovers)
- Speaking engagements (conferences, panels, virtual summits)
- Influencer partnerships
- **Be proactive:** List industry leaders your audience follows → Pitch win-win collaborations → Use tools like SparkToro or Listen Notes to find audience overlap

Pass the gate, then run the phases below.

## Copywriting voice and humanizer pass

Every site has visible marketing copy (hero, features, CTAs, meta descriptions, OG descriptions, blog posts, 404 page text). Two layers of polish are mandatory before launch:

### 1. Define `TONE.md` once per site

Ask the user: "Does this site already have a `TONE.md`?" (`yes-already-exists` | `no-create-from-template` | `skip-use-default`).

If creating: write it to `.agents/TONE.md` or repo root `TONE.md`. See `references/templates.md` (section "TONE.md template") for the structure.

TONE.md specifies: voice (terse, contrarian, etc.), forbidden patterns (e.g., "delve", "crucial", em dashes, AI-sounding openers), sentence length preference, audience reading level, examples of good and bad sentences from the user's own writing.

### 2. Run a humanizer pass in the matching language

After every drafting step (whether by a copywriting skill, by hand, or by Claude directly), run a humanizer to strip AI patterns.

Ask the user for the site's primary audience language at the start of the session if not already known:

- `english-global` → `npx skills add https://github.com/blader/humanizer --skill humanizer`
- `french` → use `samber/cc-skills@humaniseur-fr` (custom French humanizer) or equivalent French-tuned skill
- `other` → install matching humanizer if available; otherwise the skill writes a short language-specific anti-pattern checklist inline

Apply the humanizer to: hero copy, feature descriptions, CTA buttons, meta descriptions, OG/Twitter card descriptions, blog posts, email signup confirmations, 404 page text. Skip for legal pages (mentions légales, CGV) since they have rigid wording requirements.

### 3. Always reference TONE.md when invoking copywriting skills

When delegating to any copywriting or content-writing sub-skill (selected at invocation per the skill selection workflow), include `TONE.md` in the prompt context. Pass voice constraints explicitly: "Follow `.agents/TONE.md`. Avoid the listed patterns. Apply the humanizer after drafting."

## Browser interaction preference

Many checks require a real browser (Lighthouse runs, securityheaders.com scan, opengraph.xyz validation, Twitter card validator, mobile viewport, screen reader smoke, Network tab inspection).

**Always prefer the Claude Chrome extension.** Fall back to Playwright only if the Chrome extension is unavailable. If neither is available, ask the user whether to skip browser checks entirely or wait until they enable one.

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

Always run the relevant command, paste the output to the user when reporting, then ask whether to fix immediately or queue.

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

Ask the user: "Which data stores does this app write to?" (`database-only` | `database-plus-file-storage` | `file-storage-only` | `stateless-no-persistent-data`). If `stateless-no-persistent-data`, skip this section.

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

**For the conditional tools (Crisp, Sentry, BetterStack), ask the user** to confirm per site type. See `references/decisions.md` for the observability tier matrix.

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
- [ ] Competitor brand names (optional — ask user: `yes-monitor-competitors` | `skip`)

Ask the user: "Which additional keywords to monitor?" (`product-name-only` | `domain-plus-brand` | `full-set-with-competitors` | `custom-list`)

**Developer community monitoring (F5bot) — for `doc-site` and `SaaS-app` targeting developers:**

F5bot (f5bot.com) monitors Reddit, Hacker News, and Lobste.rs for keyword mentions and sends email alerts. Free, no API required.

Set up one keyword per line at f5bot.com/add:

- [ ] Brand or product name
- [ ] Domain name (catches link shares)
- [ ] Key feature or library names
- [ ] Common misspellings if applicable

**Competitor analysis (`marketing/lead-gen`, `SaaS-app`, `training/paid-course` only):**

Before writing copy, setting up ads, or planning content, run a competitor analysis to understand what is already working in the market — positioning, messaging angles, CTA patterns, pricing presentation, and content strategy.

Use a deep research tool or a competitor analysis skill if one is available in the toolchain. Ask:

- "Do you already have competitor names/URLs to analyze?" (`yes-provide-list` | `no-discover-for-me` | `skip`)
- If `yes-provide-list`: ask the user to paste 2-5 names or URLs (free text)
- "What are we looking to extract?" (`positioning-and-messaging` | `pricing-strategy` | `content-and-seo` | `full-spectrum`)

Feed the output into:

- Phase 5 keyword strategy (target queries they rank for but you can outrank or flank)
- `TONE.md` voice calibration (deliberately differentiate from the dominant tone in the category)
- Phase 6 OG copy and CTA language (borrow proven frames, don't clone verbatim)
- Copywriting sub-skills invoked later (pass the competitor snapshot as context)

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
- [ ] Verify no leaked secrets in client bundle: open Chrome DevTools Network tab via Claude Chrome extension, grep response bodies for `sk_`, `pk_`, `AKIA`, `ghp_`, `Bearer`

---

## Phase 5: SEO & GEO

Delegate the full audit to `AgriciDaniel/claude-seo`. The items below are the orchestration list.

See `references/templates.md` for `robots.txt`, `llms.txt`, and `manifest.json` templates. See `references/decisions.md` for the AI scraper policy matrix by site type.

- [ ] `/robots.txt` present, references sitemap (verify with `curl -s https://example.com/robots.txt`)
- [ ] `/sitemap.xml` present, valid (verify with `curl -s https://example.com/sitemap.xml | head -40`). Sitemap-index with per-language sitemaps if multilingual.
- [ ] `/llms.txt` present (per llmstxt.org spec, verify with `curl -s https://example.com/llms.txt`)
- [ ] AI scraper policy encoded in `robots.txt`. Apply the matrix from `references/decisions.md` based on site type, then **ask via the question tool to confirm each non-default decision** — this ships in a public file, get it right before it's crawled.
- [ ] Schema markup (JSON-LD): `Organization` + `WebSite` + `BreadcrumbList` site-wide; per-page types where applicable (`SoftwareApplication` for lib homepages, `Article` for blog posts, `FAQPage` for FAQs, `Person` for author bio). Verify with `curl -s URL | grep -A 50 'application/ld+json'`. Validate structured data via **Google Rich Results Test** (<https://search.google.com/test/rich-results>) and **Schema.org Validator** (<https://validator.schema.org>) — Rich Results Test checks eligibility for rich snippets; Schema.org Validator catches spec violations that Google may silently ignore.
- [ ] Meta tags per page: unique `<title>` (50-60 chars), unique `<meta description>` (150-160 chars), `<link rel="canonical">`, `<meta name="robots">` if needed
- [ ] `hreflang` tags on every page if multilingual (every language version declares all alternates including self). Verify with `curl -s URL | grep -i hreflang`.
- [ ] **Keyword analysis using both Google Trends and Ahrefs** (they answer different questions, not interchangeable):
  - **Google Trends** (trends.google.com): trajectory (rising vs declining), geographic distribution (especially FR vs international split), seasonal patterns, related queries breakout, head-to-head comparison of 2-5 candidate keywords. Use Trends to **validate direction and timing** of the SEO bet.
  - **Exploding Topics** (explodingtopics.com): surfaces emerging trends weeks or months before they peak in Google Trends. Use to identify rising queries before competition solidifies and to validate that target keywords aren't already on the decline.
  - **Answer The Public** (answerthepublic.com/en): maps search questions, comparisons, and related queries around a seed keyword. Use to uncover long-tail intent clusters, populate FAQ schema, and identify content gaps.
  - **Ahrefs Keywords Explorer**: monthly volume, keyword difficulty, SERP analysis, CPC, parent topic, traffic potential. Use Ahrefs to **size the opportunity** in absolute terms.
  - Combined output: a ranked shortlist of 3-5 target queries per page, with rationale (volume × difficulty × trajectory × intent match).
  - Delegate to whichever keyword-research sub-skill was installed at session start (selected from the installed packs via the skill selection workflow; typical sources are the SEO+GEO and marketing packs).
- [ ] **AI visibility audit via productrank.ai**: open productrank.ai in a browser, submit multiple category or product searches, run the full AI SEO report. It audits how the site appears in AI-generated answers (ChatGPT, Perplexity, Gemini, Claude). Flag any zero-visibility categories and surface content gaps the AI graders identify.
- [ ] Typo and grammar pass on all visible text content
- [ ] Backlink profile audit: run **Ahrefs Backlink Checker** and **Moz Link Explorer** to assess domain authority and surface toxic or broken inbound links before launch — especially critical on migrations to ensure old-domain equity transfers correctly
- [ ] Internal linking audit: every important page reachable in ≤3 clicks from the homepage

**Destination Pages Strategy (from directory-submissions skill):**
Directories are useless if the backlinks land on a generic homepage. Build these destination pages *before* submitting to directories:

### 1. Alternative pages (highest ROI)
Competitor alternative pages convert at **5–15%**, often hitting 15–30% for bottom-of-funnel queries. One page per top competitor:
- `/alternatives/[competitor-1]`
- `/alternatives/[competitor-2]`
- `/alternatives/[competitor-3]`
- `/alternatives/[competitor-4]`

Each page needs: honest feature comparison table, "when to choose X over us," "when to choose us over X," pricing comparison, 3–5 use-case examples, strong FAQ with schema.
**Critical:** Be honest. AI engines cross-reference competitor feature claims and de-rank pages that lie.

### 2. Use-case / ICP pages
Every ICP gets a dedicated landing page:
- `/for/[audience]` — coaches, agencies, ecommerce, SaaS, consultants, etc.
- `/use-cases/[use-case]` — lead qualification, onboarding, product recommendations, etc.

### 3. Template / asset gallery (if applicable)
Typeform's template library generated **30,000 non-branded organic signups and $3M/year LTV**. The pattern:
- One indexable page per template at `/templates/[slug]`.
- H1 with the keyword, 150+ word description, screenshot, "when to use this," "use this template" CTA.
- Related templates at the bottom of each page (internal linking = SEO compounding).
- 100 templates by day 30, 300 by day 90 is the realistic target.

### 4. "Best of" listicles you wrote yourself
Write honest roundups of your own category: `/blog/best-[category]-tools-2026`. Include yourself + 10 competitors with real reviews. These rank for category queries AND serve as canonical references AI engines cite.

### 5. Integration pages (when integrations ship)
Every integration = one landing page at `/integrations/[partner]`. Follows the Zapier playbook: Zapier gets **~2.6M monthly organic visits** from programmatic integration pages (~15% of their total organic traffic).

**GEO (Generative Engine Optimization):**
In 2026, 30–50% of "research a tool" queries happen inside ChatGPT, Claude, Perplexity, or Google AI Overviews without ever touching a traditional search page.

### Tactics that get pages cited
1. **One H1 per page, sequential heading hierarchy.** 2.8× higher citation rate. 87% of cited pages use a single H1.
2. **Dense, factual content with citable stats.** AI engines prefer specific numbers ("3× faster than X") over vague claims.
3. **FAQ schema on every landing page.** AI engines heavily weight `FAQPage` JSON-LD for answer extraction.
4. **Comparison tables.** Extractable, structured — exactly what an AI answer needs.
5. **Explicit "what it is" paragraph in the first 100 words.**
6. **Get cited on Reddit and Hacker News.** Claude and Perplexity index these heavily. Genuine mentions on r/SaaS and HN count as training fuel.
7. **Publish original research.** "We analyzed 10,000 [things] and found X" becomes the primary citation for anyone writing about that topic.
8. **Claim Crunchbase, LinkedIn company page, and Wikidata entries.** All three feed AI training corpora.
9. **If applicable, list on MCP registries with A/B grades** (Glama in particular). LLMs pull from these when answering MCP questions.

### Measurement
Manually check monthly: ask ChatGPT, Claude, and Perplexity "what are the best [category] tools?" and log where the product appears. Free GEO tracking tools (GeoTracker, llmrefs) automate this.

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

After launch, set up a scheduled background agent, such as Hermes or Claude Cowork Routine, that runs weekly to monitor SEO health and surface action items.

See `references/weekly-seo-agent.md` for the full agent definition, with a concrete equivalent for each harness — copy the block matching your environment into the location it specifies, in the site's repo (or a dedicated ops repo). The agent uses these MCP connectors (or their equivalent API calls):

- Ahrefs MCP (backlinks, rankings, keywords)
- PostHog MCP (analytics correlation, AI bot traffic)
- Web search (SERP monitoring, competitor checks)
- Google Search Console (via community MCP or `curl` with service account credentials)

**Ask via the question tool** before creating the file: "Set up the weekly SEO agent now?" (`yes-create-agent-file` | `yes-but-defer` | `skip-for-now`).

When MCP are not available, use Claude for Chrome extension.

---

## Phase 11: Directory Submission Execution

Execute the directory submission workflow from the `directory-submissions` skill. This is the foundation layer of distribution — never the whole strategy.

### Step 1: Choose the tiers (from references/directory-list.md)
| Tier | When | Examples | Typical count |
|---|---|---|---|
| **Tier 1 — Flagship launch** | Launch week only | Product Hunt (anchor), BetaList, HN Show HN, Fazier, DevHunt | ~15 |
| **Tier 2 — Startup/SaaS** | Week 1 + rolling | AlternativeTo, SaaSHub, G2, Capterra, F6S, SourceForge, Slashdot | ~50 |
| **Tier 3 — AI directories** | Week 1–3 | TAAFT, Futurepedia, Toolify, Future Tools, aitools.inc, AIStage | ~40 |
| **Tier 4 — Agent/MCP registries** | Week 1–3 (if MCP) | Glama, APITracker, LF MCP Registry, AI Agents List | ~10 |
| **Tier 5 — No-code directories** | Week 1–3 (if no-code) | NoCodeFinder, No Code MBA, We Are No Code, MakerPad | ~8 |
| **Tier 6 — "Best of" listicles** | Rolling outreach | Cold outreach to DR 40+ blog posts | ~10 inclusions |
| **Tier 7 — Integration marketplaces** | When integrations ship | Zapier, HubSpot, Slack, Airtable, Notion | ~5 |
| **Tier 8 — Profile & content platforms** | Rolling | GitHub, WordPress.com, Substack, Dev.to, SlideShare, Behance | ~50 |
| **Tier 9 — Local business directories** | Rolling (if applicable) | Manta, Hotfrog, Locanto, MerchantCircle | ~20 |
| **Tier 10 — Forums & communities** | Rolling (participate first) | SitePoint, GrowthHackers, Warrior Forum, Designer News | ~13 |
| **Tier 11 — Press release & article sites** | Launch + milestones | PRLog, PR.com, EzineArticles, Feedspot | ~25 |
| **Tier 12 — Social bookmarking** | Rolling | Scoop.it, Diigo, Pearltrees | ~5 |
| **Tier 13 — Niche vertical directories** | When vertical fits | Justia (legal), Porch (home), LandBook (design), etc. | ~20 |

**Triage rule:** Only submit where the product is a genuine fit. Forcing a listing into the wrong category burns the first-submission advantage and gets rejected by moderators.

### Step 2: Prepare asset variations per tier
For each tier, prep a distinct description variant (from `references/positioning-variations.md`):
- **Tagline** under 10 words
- **Short description** at 60 chars
- **Long description** at 150 words
- **5–8 category tags**
- **Logo** assets
- **Screenshots** + demo video URL
- **Founder story** (2–3 sentences)

**Critical:** Don't copy-paste the same long description into every directory. Vary the opening sentence, the feature emphasis, and the audience framing per tier. AI engines cross-reference and down-weight duplicate content.

### Step 3: Batch submit with tracker
Set up the tracker spreadsheet (`references/submission-tracker-template.csv`). Work left-to-right through it. 2–3 hours per batch is realistic.

Per submission:
1. Copy the tier-appropriate positioning variant.
2. Fill in the form.
3. Upload assets.
4. Submit.
5. Log: date, URL, status, moderator notes.
6. Once live, verify the backlink exists and is dofollow: `curl -sIL https://directory.com/your-listing | grep -i rel=`. If absent, the link is dofollow.

---

## Phase 12: Product Hunt Deep Dive (The Anchor Event)

Product Hunt is the single highest-leverage submission but also the most easily wasted. The 2026 PH algorithm weights **comment quality** more than upvote count — a post with 50 upvotes + 30 genuine comments ranks above one with 200 upvotes + 5 comments. **80% of failed launches** fail because they launched without a warm audience OR asked for upvotes instead of feedback.

### 3-week prep timeline
- **Day -21 to -14:** Warm up hunter account. Upvote + thoughtfully comment on 3 launches/day. Follow 100+ active makers. Build history so your account looks real to the algorithm.
- **Day -14:** Create "Upcoming" page on PH. Drive traffic to it to collect "notify on launch" subscribers.
- **Day -10:** (Optional) book a hunter. Don't pay cash — trade a feature, shoutout, or intro. A known hunter adds ~15% to day-one momentum but isn't required.
- **Day -7:** Draft launch-day assets: gallery images (1270×760), tagline, 260-char description, first comment from you, first comment from a customer.
- **Day -3:** Email list warm-up. "We're launching Tuesday. Here's what to expect. Reply if you want a heads up."
- **Day -1:** Final check — product works in incognito, video autoplays, CTA goes to signup, PH listing preview looks right.

### Launch day execution
- **Launch at 12:01 AM Pacific Time.** Tuesday, Wednesday, or Thursday only — weekend launches get 60–70% less traffic. The 12:01 AM PT start maximizes your 24-hour window.
- **First 2 hours are everything.** Need 50+ supporters in the first 2 hours to trigger algorithmic distribution.
- **Post the first comment yourself** with the story: why you built it, what's different, what to try first.
- **Reply to every comment** in under 30 minutes. PH measures maker responsiveness.
- **Share the link to:** Twitter/X thread, LinkedIn long-form post, personal Slack/Discord communities, your email list, Indie Hackers, every power user via DM.
- **Never ask for upvotes.** Ask for **feedback**. "Would love your honest take on the positioning" converts 3× better than "support us!" and doesn't trigger the algorithm's anti-manipulation filters.
- **Don't message strangers.** The community flags this and moderators will hide your post.

### Post-launch
- Write a launch recap blog post with numbers + lessons. Honest, not bragging. Publish on day 2.
- Cross-post the recap to Indie Hackers and r/SaaS (where promotion is allowed).
- Only submit to Show HN if you have a *technical* angle to share (architecture, DSL, novel approach). A generic "we launched a SaaS" post will get flagged to death.

---

## Phase 13: Reviews Playbook (G2 / Capterra / TrustRadius)

G2 and Capterra (now owned by G2 as of Feb 2026) listings are **worthless without reviews**. 10 reviews is the magic threshold for Grid appearance. Run the 10-in-30 protocol during launch month.

### The 10-in-30 protocol
1. **Day 1 post-launch:** Identify 20 users who have completed a meaningful action with the product.
2. **Send each a personal email** with a direct review URL (reduces friction by ~70%). No forms, no landing pages — direct link.
3. **Offer a modest thank-you.** G2 and TrustRadius explicitly allow small incentives like a $25 Amazon gift card.
4. **Follow up once** after 5 days. Don't follow up twice — it becomes annoying and damages the relationship.
5. **Target:** 50% conversion → 10 reviews from 20 asks.

### Critical deadlines
- **G2 Summer reports:** cut off ~April 28. Plan review drives to land before this.
- **G2 Fall reports:** cut off ~July 28.
- Missing a cutoff means waiting 3 months for the next grid update.

### Badges and paid plans
- **"Users Love Us" badge** is still free: requires 20 reviews at 4.0+ average.
- **Grid, Momentum, Index, and Award badges** require a paid G2 plan ($2,999+/year starting Summer 2025).
- **Do not spend on paid G2 in year one.** The free listing + Users Love Us badge is sufficient.

### Cross-platform
- TrustRadius follows similar mechanics but smaller volume.
- Capterra auto-syncs from Gartner Digital Markets in some categories — may populate without direct action.

---

## Phase 14: Post-Launch Momentum

Your launch isn't over when the announcement goes live. Now comes adoption and retention work. Don't rely on a single launch event. Regular updates and feature rollouts sustain engagement.

### Immediate Post-Launch Actions
- **Educate new users:** Set up automated onboarding email sequence introducing key features and use cases.
- **Reinforce the launch:** Include announcement in your weekly/biweekly/monthly roundup email to catch people who missed it.
- **Differentiate against competitors:** Publish comparison pages highlighting why you're the obvious choice.
- **Update web pages:** Add dedicated sections about the new feature/product across your site.
- **Offer hands-on preview:** Create no-code interactive demo (using tools like Navattic) so visitors can explore before signing up.

### How to Prioritize What to Announce
Use this matrix to decide how much marketing each update deserves:

**Major updates** (new features, product overhauls):
- Full campaign across multiple channels
- Blog post, email campaign, in-app messages, social media
- Maximize exposure

**Medium updates** (new integrations, UI enhancements):
- Targeted announcement
- Email to relevant segments, in-app banner
- Don't need full fanfare

**Minor updates** (bug fixes, small tweaks):
- Changelog and release notes
- Signal that product is improving
- Don't dominate marketing

### Announcement Tactics
- **Space out releases:** Instead of shipping everything at once, stagger announcements to maintain momentum.
- **Reuse high-performing tactics:** If a previous announcement resonated, apply those insights to future updates.
- **Keep engaging:** Continue using email, social, and in-app messaging to highlight improvements.
- **Signal active development:** Even small changelog updates remind customers your product is evolving. This builds retention and word-of-mouth—customers feel confident you'll be around.

---

## KPIs & Tracking Dashboard

Track weekly. If a number isn't moving, investigate — don't just submit more directories.

| Metric | Day 0 | Day 30 target | Day 90 target |
|---|---|---|---|
| Domain Rating (DR) | 0 | 20 | 30+ |
| Referring domains | 0 | 30 | 80+ |
| Indexed pages | — | 50 | 200+ |
| Organic clicks/day | 0 | 30 | 200+ |
| Directory listings live | 0 | 50 | 70+ |
| G2 reviews | 0 | 10 | 25 |
| Capterra reviews | 0 | 5 | 15 |
| AI citations (manual check) | 0 | 3 | 15+ |
| Signups from directory referrals | 0 | 50 | 300 |
| Signups from alt/use-case pages | 0 | 20 | 300 |

---

## What NOT to Do

1. **Don't pay for directory submission services** ($60–$200 packages). The whole point is these are free. It's an afternoon of copy-paste.
2. **Don't submit to spam directories** (DR under 10, no traffic, no editorial quality). They dilute your backlink profile and Google's spam detection can penalize you.
3. **Don't submit with the wrong positioning.** Re-read the positioning table per tier. Generic descriptions waste the listing.
4. **Don't treat directories as your entire GTM.** They're the foundation. Content + community + reviews are what actually convert.
5. **Don't skip reviews on G2/Capterra.** Zero-review listings are dead. Run the 10-in-30 protocol or don't submit.
6. **Don't ask for upvotes on Product Hunt.** The 2026 algorithm penalizes it. Ask for **feedback**.
7. **Don't amend old directory listings every week.** Submit once, check quarterly.
8. **Don't submit before the destination page exists.** Link equity needs a destination.
9. **Don't duplicate descriptions across directories.** AI engines penalize duplicate content.
10. **Don't lie on comparison pages.** AI engines cross-reference and de-rank lies.
11. **Don't over-index on launch-day spike.** The flywheel is templates + alternatives + reviews + ongoing content — not one day of PH.
12. **Don't forget Crunchbase, LinkedIn company page, and Wikidata.** These feed AI training corpora and matter for GEO.
13. **Don't launch before SLC gate passes.** Stealth Mode and "Just One More Feature" both kill launches.
14. **Don't skip the humanizer pass on marketing copy.** AI patterns in hero, CTAs, meta descriptions, OG descriptions tank credibility.
15. **Don't assume analytics "just work."** Verify every integration with curl before launch — GA4, PostHog, GSC, Bing, Ahrefs.
16. **Don't ignore backup drills.** A backup you haven't tested is not a backup. Restore to staging before launch.

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

End by asking: "Which list do you want to tackle next?" (`blockers` | `recommended` | `optional` | `done-for-now`).

---

## References

- `references/decisions.md`: AI scraper policy matrix by site type, observability tier matrix
- `references/templates.md`: robots.txt, llms.txt, manifest.json, CSP templates per tightness level, security headers reference
- `references/weekly-seo-agent.md`: Full definition of the weekly SEO maintenance sub-agent (MCPs, tasks, output format)
- `assets/weekly-seo-*.md`, `assets/weekly-seo-vibe.toml`: per-harness agent-definition files linked from `references/weekly-seo-agent.md` — copy the one matching your harness
- `references/directory-list.md`: 13-tier directory catalog with submission timing, examples, and counts
- `references/positioning-variations.md`: Positioning variant library per directory tier (tagline, short/long descriptions, category tags)
- `references/submission-tracker-template.csv`: Submission tracker spreadsheet template for logging directory submissions
