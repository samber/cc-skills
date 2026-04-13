# Financial Research — Axes, Probes, and Section Template

Use this file for `type == financial` research: funding landscapes, valuation analysis, revenue signals, investor patterns, capital markets. Load after the user confirms scope.

Probe the user: "What's the focus — a specific company's financials, a sector's funding landscape, valuation multiples, or investor activity? Any time range?"

The axes below are a starting point — include any additional relevant findings encountered during research. Completeness matters more than strict adherence to predefined categories.

⚠️ Distinguish clearly between **public** (filed, verified) and **reported** (press-cited, unconfirmed) figures. Label each.

## Step 2 axes — Capital and revenue landscape

Fan out these 4 axes as sub-agents in a single message:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Funding activity** | Recent funding rounds (Crunchbase, PitchBook, press): amounts, investors, dates, stated valuations. For a sector: total capital deployed, deal counts, stage distribution |
| 2 | **Revenue signals** | Public filings (10-K, S-1, earnings transcripts), press releases, analyst estimates, CEO statements. For private companies: reported ARR, headcount-to-revenue proxies |
| 3 | **Investor landscape** | Who are the active investors? Lead vs follow-on patterns, stage focus, portfolio overlaps, notable exits |
| 4 | **Valuation benchmarks** | Revenue multiples, EBITDA multiples, or GMV multiples for comparable companies or the sector. Source and year of each multiple |

## Step 3 axes — Financial health and trends

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Unit economics signals** | CAC, LTV, gross margin signals from public statements, job postings, or analyst commentary |
| 2 | **Capital efficiency** | Burn multiples, time to profitability signals, headcount vs revenue proxies, layoff history |
| 3 | **M&A and exit landscape** | Recent acquisitions in the space: acquirers, deal sizes, strategic rationale. IPO pipeline if relevant |

## Step 4 axes — Macro and risk context

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Macro environment** | Interest rate impact on valuations, sector-specific capital cycle (boom/correction?), LP appetite for the asset class |
| 2 | **Regulatory and accounting risk** | Pending regulations affecting valuation or revenue recognition, tax changes, foreign investment restrictions |
| 3 | **Public market comparables** | For public companies: P/E, EV/Revenue, EV/EBITDA vs sector peers. Recent stock performance and analyst ratings |

## Citation notes for financial research

Financial figures require extra rigor:

- Always cite the source type: public filing, earnings call, press release, analyst estimate, or reported (unverified)
- Reported figures from press: `confidence: Medium` at best — flag as unverified
- Multi-year figures: note the fiscal year, not just the date
- Currency: always specify (USD, EUR, etc.)

## Section template

```md
## Funding and Capital Activity

### Recent Funding Rounds

### Investor Landscape

## Revenue and Business Performance

### Revenue Signals

### Unit Economics Signals

### Capital Efficiency

## Valuation Context

### Comparable Multiples

| Company / Sector | Metric | Multiple | Source | Year |
| ---------------- | ------ | -------- | ------ | ---- |

### Public Market Comparables

## M&A and Exit Landscape

## Macro and Risk Context

### Macro Environment

### Regulatory and Accounting Risk
```
