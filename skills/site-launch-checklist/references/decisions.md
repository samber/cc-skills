# Decisions and matrices

Repeating decisions for site launches. Apply the matrix based on the site type the user confirmed at the start of the session. When a decision is ambiguous or borderline, ask through the question tool, one at a time, rather than assuming.

## AI scraper policy by site type

Decide which AI training and AI-search crawlers to allow per site type. Encode the decision in `robots.txt` (see `templates.md`).

### Marketing / lead-gen page (consulting, training landing)

Allow all AI scrapers. Your conversion copy is intellectual property; training it into LLMs that may recommend competitors is anti-value. But AI citations on a sales page is good.

### Paid course / training page

Block all. Content is the product.

### Personal portfolio / personal blog

Allow the citing crawlers (ClaudeBot, GPTBot, PerplexityBot, Google-Extended). Useful for "who is X" or "what does X work on" queries.

### SaaS app

- App subdomain (e.g., app.example.com): block all AI scrapers. The app is gated, no value in scraping.
- Landing / marketing subdomain: apply the marketing rules above.

### Default when site type is unclear

Block all. Ask the user. Better to surface the decision than to silently expose content to crawlers.

---

## Observability tier by site type

Decide which analytics and observability tools to install. Always confirm conditional tools with the user.

### Doc site / lib homepage

| Tool | Install? |
| --- | --- |
| GA4 | Yes |
| PostHog (via hogpost.samber.dev or new proxy) | Yes |
| Google Search Console | Yes |
| Bing Webmaster + IndexNow | Yes |
| Ahrefs | Yes |
| Crisp | **No** (doc readers don't chat, it tanks Lighthouse) |
| Sentry | **No** (static, no app logic to crash) |
| BetterStack | **No** (Vercel uptime is enough) |

### Marketing / lead-gen

All of the doc-site tools, plus:

| Tool        | Install?                                       |
| ----------- | ---------------------------------------------- |
| Crisp       | Yes (conversion intent)                        |
| Sentry      | Yes if there are forms or interactive elements |
| BetterStack | Only if you publish an SLA                     |

### SaaS app

All of the above, plus:

| Tool              | Install?                       |
| ----------------- | ------------------------------ |
| Sentry            | **Mandatory**                  |
| BetterStack       | Yes, with a public status page |
| Crisp or Intercom | Yes                            |

### Personal portfolio

| Tool        | Install? |
| ----------- | -------- |
| GA4         | Yes      |
| PostHog     | Yes      |
| GSC         | Yes      |
| Ahrefs      | Optional |
| Crisp       | No       |
| Sentry      | No       |
| BetterStack | No       |

---

## www vs apex canonical

Default: **apex is canonical, www redirects to apex via 308**.

Exception: if the site is hosted on a platform that requires CNAME (which cannot be set on apex per DNS RFCs), the platform's flattening / ALIAS / ANAME feature is used. Cloudflare handles this transparently with CNAME flattening, so apex remains canonical.

Verify with:

```bash
curl -sIL https://www.example.com
# Expect: 308 → https://example.com
```

---

## CSP tightness level by site type

Three levels. Ask the user to pick one at the start of Phase 4.

### `strict-default-src-none`

For doc sites, personal portfolio, SaaS app. Whitelist every source explicitly. No `'unsafe-inline'`. Use nonces for any required inline scripts.

### `balanced-allow-self`

For marketing pages with embeds (YouTube, Calendly, etc.). `default-src 'self'`, then allow specific third parties.

### `permissive-for-marketing`

Last resort for legacy marketing pages with many third-party scripts (HubSpot, Drift, etc.). Document why and plan to tighten.

See `templates.md` for the actual CSP strings per level.

---

## When a decision is unclear

Always default to asking, with the matrix options as tappable choices. Never silently apply a guess.
