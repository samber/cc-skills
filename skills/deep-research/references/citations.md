# Citation Rules

Every claim in the report must be traceable to a source. This file defines the format and confidence ladder.

## Inline citation format

Append a citation immediately after the claim:

```
[Source Name](https://url) (accessed YYYY-MM-DD, confidence: High|Medium|Low)
```

**Short source name rules:**

- Use the publication or domain name, not the article title: `Gartner`, `TechCrunch`, `GitHub`, `NIST`, `SEC.gov`
- For blog posts or forums: use author full name or handle + domain: `@jsmith / HN`, `Stack Overflow`
- For primary sources (official docs, filings): use the org name: `Apple SEC 10-K`, `EU Commission`

## Confidence levels

| Level | Meaning |
| --- | --- |
| **High** | 2+ reputable, independent sources agree on the claim |
| **Medium** | 1 reputable source (established publication, official document, primary source) |
| **Low** | Blog post, forum, single analyst opinion, or inferred from indirect data |

A source is _reputable_ if it has an editorial or review process, institutional backing, or is a primary source (government filings, official docs, peer-reviewed research).

## Multi-source validation for critical claims

Critical claims — market size, growth rates, competitive market share, regulatory deadlines — **must** reach High confidence or be explicitly flagged:

```
> ⚠️ **Confidence: Low** — Only one source found for this figure. Treat as directional until corroborated.
```

If two sources conflict, do not pick one silently. Report the conflict:

```
Sources disagree: [Source A](url-a) reports $4.2B; [Source B](url-b) reports $6.1B.
Likely difference: methodology (TAM vs SAM). Using the lower figure as conservative baseline.
```

## Accessed date

Always include the access date. Research pages change. A figure cited today may not match tomorrow.

Format: `YYYY-MM-DD` (ISO 8601).

## What counts as a source

- ✓ News articles from established outlets
- ✓ Analyst reports (Gartner, IDC, Forrester, CB Insights — even paywalled summaries)
- ✓ Government or regulatory publications
- ✓ Official product documentation or release notes
- ✓ Peer-reviewed papers
- ✓ Company investor filings (10-K, S-1, earnings calls)
- ✗ Wikipedia (use it to find primary sources, not as a source itself)
- ✗ Aggregator lists without original research
- ✗ Social media posts (unless the author is the primary source, e.g., a founder's tweet about their own product)
