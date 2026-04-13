# Competitive Research — Axes, Probes, and Section Template

Use this file for `type == competitive` research: focused teardown of competitors, without the full market-sizing context of a market research report. Load after the user confirms scope.

Probe the user: "Which competitors? Any specific dimensions to compare (pricing, features, GTM, hiring, tech stack)?"

The axes below are a starting point — include any additional relevant findings encountered during research. Completeness matters more than strict adherence to predefined categories.

## Step 2 axes — Competitor profiles

Fan out one sub-agent **per competitor** (up to 5), each producing a structured profile:

| Agent | Axis | Key questions |
| --- | --- | --- |
| Per competitor | **Company profile** | Founding year, headcount, funding raised, investors, revenue signals (if public), business model |
| Per competitor | **Positioning & messaging** | Website headline, target persona, claimed differentiator, tone |
| Per competitor | **Product surface** | Feature set, pricing tiers, integrations, what's on the roadmap (if public) |
| Per competitor | **Community signals** | GitHub stars/activity (if applicable), forum presence, job postings, developer sentiment |

## Step 3 axes — Cross-competitor analysis

Fan out these 3 axes (one agent each):

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Reviews & sentiment** | G2, Capterra, Reddit, HN, App Store: recurring praise and recurring complaints per competitor |
| 2 | **Pricing comparison** | Side-by-side pricing tiers; free tier vs paid; pricing page changes over time (Wayback Machine) |
| 3 | **GTM & distribution** | How do they acquire customers? SEO, paid, PLG, sales-led, partnerships? Content strategy? |

## Step 4 axes — Win/loss signals

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Switching signals** | Posts/threads about people switching away from each competitor; stated reasons |
| 2 | **Hiring signals** | Recent job postings; what they reveal about strategic bets (e.g., "enterprise AE" = moving upmarket) |
| 3 | **Market gaps** | What no competitor does well? Underserved segments, missing features, pricing gaps |

## Section template

```md
## Competitor Profiles

### {Competitor A}

### {Competitor B}

...

## Cross-Competitor Analysis

### Review Sentiment

### Pricing Comparison

| Competitor | Free tier | Entry | Mid | Enterprise |
| ---------- | --------- | ----- | --- | ---------- |

### GTM and Distribution

## Win/Loss Signals

### Switching Signals

### Hiring Signals

### Market Gaps
```
