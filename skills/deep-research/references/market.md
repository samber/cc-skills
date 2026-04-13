# Market Research — Axes, Probes, and Section Template

Use this file for `type == market` research. Load after the user confirms scope.

The axes below are a starting point — include any additional relevant findings encountered during research. Completeness matters more than strict adherence to predefined categories.

## Step 2 axes — Core market research

Fan out these 4 axes as sub-agents in a single message:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Market size & growth** | TAM/SAM/SOM estimates; CAGR projections; primary data sources (Gartner, IDC, CB Insights, Statista); year of estimate |
| 2 | **Customer segments** | Who buys? Segment breakdown by size, industry, geography; behavioral patterns; willingness to pay signals |
| 3 | **Pricing models** | How do incumbents charge? Per-seat, usage-based, freemium, enterprise license? Price ranges per tier |
| 4 | **Trends & dynamics** | Macro forces driving growth or decline; technology shifts; regulatory tailwinds/headwinds; recent M&A |

For each axis, critical numeric claims (size, growth rate, price) require 2+ sources or `confidence: Low`.

## Step 3 axes — Competitive landscape

Fan out these 4 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Top competitors** | Who are the 5–10 main players? Funding, headcount, founding year, geography |
| 2 | **Positioning & messaging** | How does each player position itself? Target segment, key differentiator, tagline |
| 3 | **Strengths & weaknesses** | What do reviewers (G2, Capterra, Reddit, HN) say? Recurring complaints and praise |
| 4 | **Market gaps** | Underserved segments, feature gaps, pricing gaps, geographic whitespace |

Produce a **comparison table** (competitors × dimensions) at the end of this step's section.

## Step 4 axes — Customer deep dive

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Pain points** | Top 5 problems customers try to solve; evidence from forums, reviews, community posts |
| 2 | **Purchase triggers** | What causes someone to start evaluating? What causes them to choose or reject? |
| 3 | **Customer journey** | Awareness → consideration → decision touchpoints; sales cycle length; champions vs blockers |

## Section template

Use these headings in the output file:

```md
## Market Overview

### Market Size and Growth

### Customer Segments

### Pricing Models

### Trends and Dynamics

## Competitive Landscape

### Key Players

### Positioning Map

### Competitive Matrix

| Player | Segment | Differentiator | Pricing | Strengths | Weaknesses |
| ------ | ------- | -------------- | ------- | --------- | ---------- |

### Market Gaps

## Customer Insights

### Top Pain Points

### Purchase Triggers

### Customer Journey
```
