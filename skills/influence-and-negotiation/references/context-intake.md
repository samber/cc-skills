# Context intake

70% of the outcome is set before the room. Context degrades across sessions and tools — users remember recent events and forget earlier anchors, paste what's top of mind and omit what feels obvious. No single source is complete; searching across many surfaces the contradictions and signals that change the strategy. Run these three steps before any intake question.

## Step 1: Collect raw material

**Before any intake question (Phase 1)**, ask the user to share everything they have. Use `AskUserQuestion`:

> _"Before we build your strategy, share every piece of raw material available — the more context, the sharper the advice:_
>
> - **Emails / messages:** the last message received (verbatim), your last reply, the full 2–3 message thread, a forwarded chain, a WhatsApp or SMS screenshot, a Teams / Slack DM
> - **Previous communications with the counterpart:** every prior email thread, recorded call transcript, meeting recap sent to them, any written exchange going back to first contact
> - **Meeting notes / transcripts:** call notes, voice-memo transcription, CRM activity log, Notion page, shared doc from the last meeting, auto-generated meeting summary (Fireflies, Otter, Granola, etc.)
> - **Prior analyses / reports:** previous negotiation debrief, deal summary, internal briefing, consultant report, HR case file, union delegation minutes, board presentation, QBR deck
> - **Counterparty-facing documents:** proposal you sent, term sheet, contract redlines, RFP received, statement of work, job offer letter, counter-offer email, union demands document, competitor quote, LOI
> - **Internal documents:** org chart, sociogramme, salary band / compensation grid, HR policy, mandate letter, budget approval email, board directive, internal talking points, approval chain, legal constraints memo
> - **Knowledge bases and wikis:** internal Confluence / Notion wiki, company handbook, HR policy portal, product documentation, pricing playbook, deal desk guidelines, legal FAQ
> - **Counterparty intelligence:** LinkedIn profile, company press release, public financials, industry benchmark, Glassdoor reviews, funding announcement, recent news, analyst report, court filing, regulatory disclosure
> - **Web / open sources:** web search on the counterparty's company, recent articles or interviews featuring the decision-maker, industry news, competitor announcements, job postings (signals priorities and pain), patents, conference talks
> - **Side signals:** a Slack thread with your champion, a rumour from your N2, something said off-record after the last call, a reaction you noticed in the room, a mutual contact's opinion_
>
> _Paste directly, attach, or link. Partial and messy is fine — raw beats polished summaries."_

**External sources — use connectors and MCP servers.** If any of the following are connected to the session, proactively offer to pull context directly rather than waiting for the user to paste:

- **Gmail / Outlook MCP** — full thread history with the counterparty; search by sender, subject, or date range
- **Slack MCP** — relevant channel history, DMs with champion or internal stakeholders, deal room threads
- **Salesforce / HubSpot / Pipedrive MCP** — opportunity record, activity log, contact notes, deal stage history, email sequences
- **Notion / Confluence / Obsidian MCP** — deal room, project brief, HR policy page, internal wiki, company handbook
- **Linear / Jira / Asana MCP** — linked issues for scope, timeline, or SLA disputes; sprint notes; project history
- **Google Drive / OneDrive / SharePoint MCP** — shared proposals, redline documents, RFP folders, meeting decks
- **Calendar MCP** — meeting history with the counterparty; past agenda items and attendees as a timeline
- **LinkedIn / Apollo / Clay MCP** — counterparty's career history, recent posts, mutual connections, org changes

Ask the user which system holds the relevant data, then retrieve it before proceeding — this surfaces far more signal than what users remember to paste manually.

## Step 2: Deep research into sources

**Full vs incremental mode.** If no memory exists, run a full search across all available sources. If memory exists, check the `## Search history` section in `context.md` — skip sources already covered and restrict date filters to documents newer than the last session date. Incremental runs are faster but must still produce a complete picture of what changed since the previous session.

Using 3 to 20 parallel sub-agents, actively search all available sources to surface context the user may not have thought to share. Each agent targets a distinct source or angle — do not wait for the user to hand everything over.

**Two valid split strategies — pick the one that fits:**

- **Split by source** (preferred for context efficiency) — each agent exhausts one platform or system: one agent on LinkedIn, one on web news, one on CRM, one on email threads, one on regulatory filings, one on industry forums. Findings from the same source collide often (two agents querying LinkedIn will retrieve overlapping profiles); findings from two different sources rarely do. This means source-split agents produce less redundant context and require lighter deduplication before synthesis.
- **Split by topic** — each agent covers one analytical question: counterparty company, key decision-makers, deal history, competitive landscape, industry context, procurement history, internal dynamics, our own commitment history, pricing benchmarks, soft intelligence. Best when the domain is well-scoped and sources are few (B2B deal, salary ask with 2–3 platforms). Expect some overlap — multiple topic-agents will independently query the same LinkedIn profile or news source.

The table below is a **B2B example only** — this skill covers salary, NAO, recruitment, internal management, cross-cultural, and more. Adapt the split to the domain and the available sources.

| Agent (B2B example) | Target | What to surface |
| --- | --- | --- |
| 1 | Counterparty company — news and financials | Recent press releases, earnings calls, M&A activity, funding announcements, public financials |
| 2 | Key decision-makers — professional profiles | LinkedIn career history, recent posts, conference talks, published articles, org changes |
| 3 | Deal / product / contract history | Prior engagement records (CRM, email threads, previous proposals), past agreements or disputes |
| 4 | Competitive landscape | Who else is being evaluated, competitor positioning and pricing signals, recent analyst coverage |
| 5 | Industry and macro context | Sector trends, regulatory changes, wage indices, market benchmarks relevant to the deal |
| 6 | Procurement and buying history | Past vendor decisions, procurement lead's LinkedIn, reviews of them as a buyer on vendor forums |

**Deep research means exhaustive search, not a single query.** For each topic (counterparty, company, deal history, industry...), try many keyword combinations, vary phrasing, apply filters (date range, source type, region...), cross search across multiple platforms (web, LinkedIn, CRM, news archives, regulatory databases...), and follow leads from one result to the next. Stop only when new queries stop returning new signal.

**How to run it:** use whichever method is available, in priority order:

1. Invoke a `deep-research` skill if one is installed in the environment
2. Use Claude.ai's built-in deep research feature if running on claude.ai
3. Use ChatGPT's deep research feature if running on chatgpt.com
4. Fall back to parallel sub-agents with `WebSearch` + MCP connectors

For each source, extract:

- **Counterparty signals:** stated positions, implied enjeux, emotional tone shifts, concessions already made, threats or promises, deadline pressure, things they avoided saying
- **Relationship history:** prior agreements, broken commitments, trust-building events, known preferences and sensitivities, recurring friction points
- **Organisational context:** who influenced past decisions, internal dynamics visible in the thread, budget cycles, approval chains, political constraints
- **Our side's history:** commitments already given, anchors already set, concessions already made — these constrain the mandate and cannot be walked back
- **Open questions:** anything material still unknown that must be surfaced in Phase 2 discovery; rank by impact on the mandate

Cross-reference sources against each other. Flag contradictions explicitly — e.g., the CRM records budget at $200k but the email thread reveals the CFO approved $320k. Contradictions are leverage; missing them is preparation malpractice.

**Source tracking.** Every claim extracted must carry its source. For each piece of intelligence added to any memory file, record:

- **URL or reference** — document name, URL, system (CRM, LinkedIn, email), or "stated by user"
- **Date retrieved** — the date you accessed it
- **Confidence** — integer 0–10: how certain you are the claim is accurate. 9–10: directly stated or documented; 6–8: strongly implied or corroborated across sources; 3–5: inferred, plausible but unverified; 0–2: rumour or single unverifiable signal. Also note the source type per `preparation.md` Intel grading: `white` (open-source), `grey` (active monitoring), `black` (do not use).

Claims with confidence ≤ 5 or grey-source grading are usable for internal preparation only — never include them in counterparty-facing material or shared docs.

Store the extraction as a `context.md` file in the negotiation memory directory (see [memory.md](memory.md)). This file feeds directly into Phases 2 and 3 and replaces re-asking questions the sources already answer.

## Step 3: Context quality gate

**Do not proceed to Phase 1 until all four are answered:**

1. **Who is the counterparty?** Name, role, organisation — or at minimum role and level.
2. **What is the substantive ask or conflict?** What is actually on the table.
3. **What is the current state?** First contact / mid-negotiation / stalled / approaching close.
4. **What did they say last?** Verbatim or close — paraphrase degrades tactical precision.

If any gap remains after Step 2, use `AskUserQuestion` to fill it specifically. A missing "what did they say last?" cannot be filled by assumption — push for the quote. Proceed to Phase 1 only once all four are solid.

**Memory creation (if no prior memory).** At end of session (or after Phase 3 at the latest), detect the best access method (see [memory.md](memory.md#platform-detection--how-to-access-the-files)) and create the full memory directory. Announce:

> _"I've created your negotiation memory in `negotiation-{slug}/` [or: as Artifacts / in your Obsidian vault]. Share at the start of the next session to pick up exactly here."_

If only Artifacts or Canvas is available, warn: they don't persist across new conversations — the user must save locally.
