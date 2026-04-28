# Negotiation Memory System

A negotiation rarely closes in one session. Between sessions — switching tools, losing context, resuming days or weeks later — the accumulated intelligence evaporates and you re-explain everything from scratch. The memory system is a structured set of markdown files that persist across sessions and let you resume exactly where you left off.

## The memory system is always flat markdown files

The memory lives in a directory of plain markdown files — `negotiation-{slug}/` — regardless of tool or platform. This is the source of truth. What varies across platforms is only **how those files are read, written, and surfaced between sessions**.

## Naming convention

All memory files share a **slug**: a short, lowercase, hyphenated identifier for the negotiation (e.g. `acme-renewal`, `q3-salary`, `nao-2026`). The directory is always named `negotiation-{slug}/` and the files inside always use short names (`memory.md`, `context.md`, etc.).

## Platform detection — how to access the files

Detect what's available and use the best method for reading and writing the flat files.

| Priority | Access method | Cross-session? | How |
| -------- | ------------- | -------------- | --- |
| 1 | **Agent with file write access** (Claude Code, Codex, etc.) | ✅ Yes | Write directly to `negotiation-{slug}/` in the repo or workspace. Read next session with the Read tool. |
| 2 | **Obsidian MCP** (if available) | ✅ Yes | Write the flat files into the Obsidian vault at `negotiations/negotiation-{slug}/`. Obsidian indexes and links them automatically — the files remain plain markdown, Obsidian is just the viewer. |
| 3 | **Claude (claude.ai) — within a Project** | ⚠️ Partial | Create one Artifact per file (markdown type). Artifacts in a Project persist across conversations. Title each artifact `negotiation-{slug}-{file}` (e.g. `negotiation-acme-renewal-memory`). |
| 4 | **Claude (claude.ai) — no Project / ChatGPT Canvas** | ❌ Per-conversation | Create one Artifact or Canvas per file within the session. **Warn the user at session end**: _"These don't persist across new conversations — copy each file's content and save it locally, or paste them at the start of the next session."_ |
| 5 | **Any other tool** | ❌ Manual | Output the markdown files as text blocks. The user saves them locally and pastes them into context at the next session start. |

**Obsidian as a format layer.** When Obsidian MCP is available, the flat files are written to the vault unchanged. Obsidian adds backlinks, graph view, and search on top — useful for mapping stakeholder relationships across a long negotiation — but the files themselves stay plain markdown. Any agent can read them without Obsidian.

## Default structure

```
negotiation-{slug}/
  memory.md       ← entrypoint: status, index, load order, structure definition — READ THIS FIRST
  context.md      ← situation, parties, mandate (Mandascan)
  stakeholders.md ← org map, sociogramme, MICE, POE per person
  numbers.md      ← all quantitative data: offers, amounts, volumes, changes over time
  log.md          ← session-by-session append-only event log
  strategy.md     ← decisions made, rationale, next session plan
```

Six files is the default. **The structure may be adapted** — if the negotiation is simple, merge files; if it's complex, add domain-specific files. Whatever structure is used, it must be declared in `memory.md` under a `## Structure` section so any agent can discover it. Never rely on assumed structure — always read `memory.md` first.

## Taking initiative

Don't wait to be asked. Proactively:

- **Create the memory** at the end of the first substantive session, even if the user didn't ask for it. Announce what you created and where to find it.
- **Update the memory** after any significant event mid-session — a new offer, a stakeholder revealed, a concession, a mindset shift. Don't wait until session end.
- **Flag when something important is missing** — if `numbers.md` has no figures but prices were discussed, say so. If a stakeholder was named but isn't on the map, add them immediately.
- **Propose structure improvements** when the negotiation evolves — if a new workstream opens (e.g. a parallel legal track), suggest adding a file for it and declare it in `memory.md`.
- **Warn proactively** when a Mandascan axis approaches Escalation or Rupture — put a `⚠️ Warning` in `memory.md` even if the user hasn't asked.

## Load policy

At the start of every session, read `memory.md` first — it contains the current status and tells you which other files to load. Never skip it.

| File | Load when |
| ---- | --------- |
| `memory.md` | **Always, first.** Before Phase 1 intake. |
| `context.md` | Every session — mandate and situation overview. |
| `strategy.md` | Every session — current strategy and next session plan. |
| `numbers.md` | When any offer, amount, or figure is discussed. |
| `stakeholders.md` | When discussing who's involved, motivations, or influence. |
| `log.md` | When the user asks "what happened in the last session" or needs to trace a pattern back. |

## When to create

Create the full directory at the end of the **first substantive session** — after Phase 1 intake at minimum, ideally after Phases 1–3. Don't wait until the negotiation is complete; the value is in continuity across rounds.

## When to update

- **End of every session** — update `log.md`, update `strategy.md` (next session section), update `numbers.md` if any figures moved.
- **After any significant event** — new offer, new stakeholder revealed, deadline introduced, concession made.
- **When the counterparty's mindset shifts** — log it in `stakeholders.md` (mindset shifts section) immediately. Shifts are the most valuable signal and the most easily forgotten.

---

## Templates

### `memory.md` — entrypoint

```markdown
# negotiation-{slug} — memory

> Stage: [early / mid / late / post-verbal-yes] · Last updated: [YYYY-MM-DD] · Session [N]

## Status

[1–3 sentences on where the negotiation stands right now. Write it for someone reading cold.]

## Structure

_List every file in use for this negotiation. If the default structure was adapted (files merged, renamed, or added), document it here. Any agent resuming this negotiation must read this section to discover the actual file set._

| File | Contents | Last updated |
| ---- | -------- | ------------ |
| memory.md | This entrypoint | [date] |
| context.md | Situation, parties, mandate | [date] |
| stakeholders.md | Org map, MICE, POE | [date] |
| numbers.md | All figures, offers, movement | [date] |
| log.md | Session log | [date] |
| strategy.md | Decisions + next session plan | [date] |

_Artifact/Canvas title for each file: `negotiation-{slug}-{file}` (e.g. `negotiation-acme-renewal-memory`)._

## Load order this session

1. This file ✓
2. context.md — mandate check
3. strategy.md — pick up from last session's plan
4. [numbers.md / stakeholders.md / log.md as needed]

## Warnings

_⚠️ Flags that must not be forgotten: mandate approaching Escalation or Rupture, counterparty deadlines, political risks, commitments made that constrain the next move. Update this section immediately when a warning emerges — don't wait._

[no warnings yet]
```

---

### `context.md` — situation and mandate

```markdown
# negotiation-{slug} — context

## Situation

- **Type:** [B2B sales / Salary / NAO / Internal / Clinical / Recruitment / Cross-cultural]
- **Our side:** [name(s), role(s), authority level]
- **Counterparty:** [name(s), company, role(s)]
- **Stakes:** [size, scope, who's affected]
- **Target close:** [date or trigger]
- **Current stage:** [early / mid / late / post-verbal-yes]

## Mandate (Mandascan)

_Update cells as the negotiation evolves. Strike through ~~old values~~ when a concession is made._

| Axis | Entry | Ideal | Objective | Escalation | Rupture | Current position |
| ---- | ----- | ----- | --------- | ---------- | ------- | ---------------- |
| | | | | | | |

## BATNA

- **Ours:** [best alternative if no deal]
- **Theirs (estimated):** [their likely fallback]
```

---

### `stakeholders.md` — people and influence

```markdown
# negotiation-{slug} — stakeholders

## Org map

| Name | Title | Reports to | Role in this deal | Champion / Neutral / Blocker |
| ---- | ----- | ---------- | ----------------- | ----------------------------- |
| | | | | |

## Informal influence (sociogramme)

[Who actually influences whom. Who do people glance at before answering. Who's off-stage but shapes the outcome.]

## MICE per stakeholder

| Name | M (money) | I (ideology) | C (compromise) | E (ego) | Primary driver |
| ---- | --------- | ------------ | -------------- | ------- | -------------- |
| | | | | | |

## POE per stakeholder

_Format: **[Name]** — Position: … · Objectif: … · Enjeu (inferred): …_

## Mindset & position shifts

_Chronological. What changed, what triggered it._

- [YYYY-MM-DD] [Name] — [shift and trigger]
```

---

### `numbers.md` — all figures

```markdown
# negotiation-{slug} — numbers

_Every figure that has appeared in this negotiation. Track movement over time — the direction and speed of movement is as important as the current number._

## Our positions (history)

| Axis | Session 1 | Session 2 | Session N | Current |
| ---- | --------- | --------- | --------- | ------- |
| | | | | |

## Their positions (history)

| Axis | Session 1 | Session 2 | Session N | Current |
| ---- | --------- | --------- | --------- | ------- |
| | | | | |

## Offers table

| Date | From | Axis | Value | Response | Notes |
| ---- | ---- | ---- | ----- | -------- | ----- |
| | | | | Accepted / Rejected / Countered / Pending | |

## Key figures

_Amounts, volumes, headcounts, dates, percentages that matter beyond offers._

| Label | Value | Source | Date confirmed |
| ----- | ----- | ------ | -------------- |
| Contract ACV | | | |
| Total deal value | | | |
| Budget envelope (stated) | | | |
| Their fiscal year end | | | |
| Our cost-to-serve | | | |

## Movement analysis

_As the negotiation progresses, track: how fast is each side moving? Who is making larger concessions? Which axes are stuck?_

- [YYYY-MM-DD] — [observation about movement pattern]
```

---

### `log.md` — session log

```markdown
# negotiation-{slug} — log

_Append-only. Add a new section after each session. Never edit past entries._

---

## Session [N] — [YYYY-MM-DD]

**Participants:** [who was in the room on each side]  
**Format:** [in-person / video / phone / async]  
**Duration:** [approx]

**What happened:**  
[Chronological summary of key events. Offers made, objections raised, information exchanged.]

**What moved:**  
[What changed from the previous session — positions, relationships, information.]

**What didn't move:**  
[What stayed stuck and any observable reason.]

**Tactics used and outcome:**  
- [tactic] → [response / effect]

**Counterparty behaviour:**  
[Tone, body language, evasiveness, specific phrases that stood out.]

**Surprises:**  
[Anything that wasn't anticipated. A new stakeholder, a new constraint, a shift in tone.]

**Open at end of session:**  
[Unresolved items, pending answers, next move expected from each side.]
```

---

### `strategy.md` — decisions and next session

```markdown
# negotiation-{slug} — strategy

## Decisions log

_Key strategic choices — what was decided, why, and what it rules out._

- [YYYY-MM-DD] — [Decision] — [Rationale]

## Wins & failures

**Worked:**
- [tactic or move] — [what it produced]

**Backfired:**
- [tactic or move] — [what went wrong and why]

## Next session plan

> _Write this at the end of each session. It's the briefing note for your future self — or for a colleague taking over cold._

- **Planned opening move:** [specific — what you'll say or do first]
- **Top calibrated questions to ask:** [3–5 specific "what" / "how" questions]
- **Concession ready to trade:** [what you'll offer + what you'll ask in return]
- **Pre-emptive labels to deploy:** [accusation-audit lines for the most likely objections]
- **Mandate check:** [any axis closer to Escalation or Rupture than last session?]
- **Information to gather before session:** [research, internal validation, intel]
- **Warning flags:** [things to watch for — manipulation patterns, deadline traps, JOLT signals]
```
