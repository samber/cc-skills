# Parallel Search — Sub-agent Fan-out

This file describes how to split research work across sub-agents for maximum coverage and speed.

## When to fan out

Fan out whenever a research step has 3+ independent axes that do not depend on each other's findings. Axes are independent when each can be fully researched from scratch without knowing the others' results.

Do not fan out when axes have ordering dependencies (e.g., you need competitor names from Step 3 before you can look up their pricing). In that case, run the dependency first, then fan out the remaining axes.

## Maximum agents per step

Default to **3–5 sub-agents per step**. This range balances coverage, speed, and coordination overhead for most research tasks.

You may exceed 5 — up to **20 in a single step** — only when all three conditions hold: axes are truly independent, the topic is broad enough to justify the extra coverage, and each sub-agent can be given a clear self-contained prompt. Beyond 5, diminishing returns and context overhead increase quickly, so treat larger fan-out as an explicit exception, not the default.

## Sub-agent prompt template

Each sub-agent prompt must be self-contained — the agent has no memory of the parent conversation.

```
You are a research analyst. Your task: research one specific axis of a larger study.

**Topic:** {overall topic}
**Your axis:** {axis name and description}
**Research goals:** {what specific questions to answer on this axis}
**Geographic/time constraints:** {any from scope interview, or "none"}

Instructions:
1. Run web searches using WebSearch and WebFetch to find relevant sources.
2. For each finding, note the source URL, access date, and confidence level (High/Medium/Low per the ladder below).
3. Tag each source: **Primary** (official docs, government filings, peer-reviewed papers), **Established** (major publications, analyst firms with editorial process), or **Low** (blogs, forums, single opinions). Flag Low-tier sources visibly.
4. Critical claims (numbers, market share, projections) need 2+ sources or get confidence: Low.
5. Flag any conflicts between sources explicitly — do not silently pick one.
6. The axis definition is a starting point, not a ceiling. If you find relevant information that falls outside the stated axis but adds meaningful insight for the overall topic, include it — label it clearly and explain why it matters.
7. If you encounter a PDF, dataset, image, or other external file that would enrich the research (e.g., an analyst report, a regulatory filing, a whitepaper, a chart), download it with `curl -L -o /tmp/<filename> <url>` and reference it in your findings. Summarize its key content inline — do not leave it as a bare link.
8. Write findings as **prose paragraphs**, not bullet lists. Embed figures in sentences: "The market reached $4.2B in 2024 [Source]" rather than "* Market: $4.2B". Bullets are acceptable only for true enumerated lists (product names, compliance items, enumerated steps).
9. Distinguish sourced facts from your analysis: use "According to [Source]..." for direct findings and "This suggests..." or "The pattern indicates..." for your synthesis. Never present inference as fact.
10. If a topic cannot be found, write "No sources found for X" — do not guess or leave a blank.
11. Return your findings as a Markdown section ready to paste into a report.

Confidence ladder:
- High: 2+ reputable independent sources agree
- Medium: 1 reputable source (Primary or Established tier)
- Low: blog, forum, single opinion, Low-tier source, or inferred

Citation format: [Source Name](url) (accessed YYYY-MM-DD, confidence: High|Medium|Low)

Output format:
## {Section heading}
{Prose paragraphs with inline citations. Bullets only for true lists.}

> Conflicts noted: {if any}
> Gaps: {what you couldn't find}
```

## Choosing agent type

- Use **`general-purpose`** for broad search + synthesis work (most research axes).
- Use **`Explore`** only when the axis is about exploring an existing local codebase or file set — not for web research.

## Handling completions

Sub-agents complete at different times. As each one finishes:

1. Read its output immediately.
2. Append its findings section to the output file.
3. Do not wait for all agents before writing — write as you receive.

If a sub-agent returns insufficient findings (e.g., a gap note with no data), do not fill the gap with guesses. Write the gap explicitly in the output file and note it for the Synthesis step.

## Splitting axes by type

See the type-specific reference files for the exact axis breakdown:

- `market` → `references/market.md`
- `domain` → `references/domain.md`
- `technical` → `references/technical.md`
- `competitive` → `references/competitive.md`
- `product` → `references/product.md`
- `academic` → `references/academic.md`
- `person/org` → `references/org.md`
- `financial` → `references/financial.md`
- `legal` → `references/legal.md`
- `trend` → `references/trend.md`
- `community` → `references/community.md`
- Other types → no reference file; derive axes from the topic and goals (see Step 1 in SKILL.md)
