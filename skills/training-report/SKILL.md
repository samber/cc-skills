---
name: training-report
description: 'Produce a professional training/workshop report as a .docx file. Use this skill whenever the user mentions "training report", "workshop report", "compte rendu", "compte rendu de formation", "formation report", "debriefing a workshop", "write up a training session", "résumé de formation", or any request to document a training session, workshop, or onboarding event with individual participant feedback and recommendations. Also trigger when the user says things like "I just ran a workshop and need to write it up", "help me summarize what happened in my training session", or "I need to report back to management about a session I ran". Always use this skill — for short or long sessions, across any discipline (technical, soft skills, creative, compliance, onboarding, etc.) — whenever a structured written deliverable about a training event is needed.'
user-invocable: false
license: MIT
compatibility: Designed for Claude or similar AI agents.
metadata:
  author: samber
  version: "1.0.0"
  openclaw:
    emoji: "📚"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion
---

# Training Report

Iterate the full report in **Markdown first**. Generate the **.docx last**, once, when the content is final. The .md is the canonical artifact; the .docx is a terminal derivative.

Discipline-agnostic: coding workshop, leadership seminar, safety training, onboarding, creative workshop — all apply equally.

> **Voice mode:** this conversation may be conducted by voice. Transcription can introduce homophones, missing punctuation, or ambiguous proper nouns (names, company names, tool names). If any answer is unclear after transcription, ask a short clarifying question before moving on — do not guess.

## Reference files

Load these files at the steps indicated. Do not load them all upfront.

| File | Load at |
| --- | --- |
| `references/tone-of-voice.md` | Step 1 (after language + audience confirmed) |
| `references/markdown-draft.md` | Step 5 (before writing the draft) |
| `references/docx-generation.md` | Step 6 (before generating the .docx) |

## Step 0 — Check dependencies

**Before asking the user anything**, verify skill availability.

**`docx` skill (required for Step 6)**

- If found: note it; load it at Step 6
- If not found: warn the user — it is required to generate the final Word document and can be installed from Anthropic's official skill library. Offer to proceed with the Markdown draft in the meantime.

**Humanizer skill (recommended)**

- After Step 1, look for a humanizer skill matching the chosen language
- If found: load it and apply it during the humanization pass in Step 5
- If not found: tell the user once, then fall back to inline humanization rules (Step 5b). Suggest installing a humanizer skill for the chosen language.

## Step 1 — Language & audience

Ask:

1. "In what language should I write the report? (French / English / other)"
2. "Who is the primary reader? (executive / HR / direct management / external client / internal archive)"

Then load `references/tone-of-voice.md` and apply its guidance throughout.

## Step 2 — Template

Ask:

> "Do you have a Word (.docx) template for this report? (company header/footer, logo, branded fonts, color scheme)"

- **Yes** → ask them to upload it; use it as the base at Step 6 (unpack/inject/repack)
- **No** → proceed with a clean document; ask for a brand color before defaulting to blue `#2E75B6`

## Step 3 — Interview

Conduct a structured interview in batches. Wait for answers before moving on. Extract what the user already told you from the conversation before asking.

### Batch A — Session metadata

- Trainer name and role
- Date, location, company/team name
- Duration
- Total number of participants
- Confirm or refine: who is the document for?

### Batch B — Session context

- Stated goal of the training
- Subject, topic, tool, or material used as practical support
- Any rules or constraints set at the start
- Materials, accounts, licenses, or equipment provided to participants

### Batch C — Starting levels

- Distribution of familiarity across the group (any beginners? any experts?)
- Notable outliers at either end

### Batch D — Session walkthrough

Walk through the session step by step. For each step:

- Objective
- What participants actually did
- Materials, tools, or exercises involved
- First exposure to this concept or not
- How it landed; any difficulties

Probe until complete: "What happened next?", "Did anything go differently than planned?", "Were there any pivots?"

### Batch E — Deliverables

Ask: "Did participants produce anything during the session?"

Probe for:

- Documents, files, diagrams, prototypes, or any output created during exercises
- Collaborative work produced as a group
- Individual work produced autonomously
- Anything left incomplete or started but not finished

These may appear in the Annexes and/or be referenced in the Session Walkthrough.

### Batch F — General observations

- Overall energy and engagement of the group
- Any incidents, surprises, or notable moments
- Schedule: did it hold, or were sections cut/extended?
- Logistical issues (room, materials, setup)

General Observations is **optional**. If the trainer has nothing notable to add beyond the walkthrough, skip this section entirely.

### Batch G — Individual feedback

Ask: "Do you have specific observations for any individual participant?"

For each named participant, extract:

- Role or background
- Starting level
- Behavior/engagement (positive and negative)
- Notable evolution, breakthrough, or resistance
- How they ended the session

**Individual Feedback is optional.** Only write it if the trainer explicitly provides meaningful observations. Do not prompt for feedback on every participant.

Be diplomatic. Describe behaviors, not character. Name problems factually; do not editorialize. When writing for an external client about a team you don't know, consider whether naming individuals is appropriate at all.

See `references/tone-of-voice.md` — Diplomatic framing section.

### Batch H — Recommendations & next steps

Ask: "What would you recommend to the direction/client to build on this session?"

Probe for:

- Resources and access to provide (licenses, books, platforms, communities)
- Practices to anchor in daily work
- What to pace carefully — basics before advanced material
- Follow-up sessions (refresher, coaching, Q&A after a few weeks)
- Assessment and validation (quiz, practical challenge, peer review, checklist)
- Knowledge-sharing rituals (Slack/Teams channel, recurring meeting, Loom demos, buddy system, monthly show-and-tell)
- Management involvement (protect practice time, 1:1 check-ins, celebrate wins)
- External resources (books, courses, certifications) for self-driven participants
- Specific warnings or caveats for management

### Batch I — Annexes

Ask: "Do you have any annexes to attach to the report?"

Annexes can include:

- Photos from the session
- Satisfaction survey results (NPS, ratings, verbatim comments)
- Slides or handouts distributed during the session
- Work produced by participants (exercises, prototypes, documents, diagrams)
- Reference documents used during the session
- Any other supporting material

For each annex:

- **Image** → attempt auto-embed at Step 6
- **File** (PDF, slides, spreadsheet) → reference in the Annexes section; do not embed
- **Survey data** → synthesize in Step 4, then include as a dedicated section in the doc
- **Participant deliverable** → reference in the relevant Walkthrough step AND in Annexes

### Batch J — Closing & contact

Ask: "May I include a closing note thanking the team for the invitation, and your contact details for future collaboration? (email + phone)"

If yes: collect name, email, phone. The closing is written in the document language, personal in tone, brief. See `references/markdown-draft.md` — Closing paragraph section.

## Step 4 — Feedback synthesis (if survey data provided)

Produce a synthesis in the conversation before drafting:

- Overall score / NPS
- Rating distribution
- Top 3 positive themes
- Top 3 areas for improvement
- Any outlier responses

Ask the user to confirm before it enters the document.

## Step 4b — Confirm outline

```
Here's what I'll draft:
1. Context
2. Starting Levels
3. Session Walkthrough (N steps)
4. General Observations         [optional — include if trainer provided content]
5. Participant Satisfaction     [only if survey data provided]
6. Individual Feedback          [optional — include if trainer provided feedback]
7. Recommendations & Next Steps
8. Annexes                      [only if annexes provided]
[Closing + contact]

Language: [language] | Audience: [target] | Template: [yes/no]
```

Ask: "Anything to adjust before I start the draft?"

## Step 5 — Markdown draft

**Load `references/markdown-draft.md` before writing.** It contains the full section-by- section writing guide, Markdown limitations, HTML table workarounds, and closing paragraph guidance.

### Humanization pass

Before presenting the draft, apply the humanizer skill (loaded in Step 0). If no humanizer skill is available, apply these rules inline:

- Cut all AI throat-clearing openers and sentence starters
- Cut adjective doublets — pick the more precise word
- Replace passive voice with active wherever natural
- Replace vague praise or criticism with specific behaviors or facts
- Short sentences over long ones
- Adapt to the document language (see `references/tone-of-voice.md`)

Do not present an un-humanized draft.

### Iteration loop

Present the draft inline in the conversation. Let the user lead. Update the `.md` file for every change. One canonical file, no versions. Only move to Step 6 when the user explicitly confirms the content is final.

## Step 6 — Final .docx generation

**Load `references/docx-generation.md` and the `docx` skill before starting.**

This step runs once. It is terminal: if the user requests changes after the .docx is generated, update the `.md` and regenerate from scratch.

Deliver both files. If the environment supports inline file delivery (e.g. `present_files` on Claude.ai), use it. Otherwise, print the absolute paths to both files.

## Pitfalls

- Don't fabricate details — only document what the trainer explicitly provided
- Don't editorialize in General Observations — factual only
- Don't write Individual Feedback unless explicitly provided — and stay diplomatic
- Don't pad recommendations — 6 sharp ones beat 12 vague ones
- Always include a Pacing recommendation in the Next Steps
- This skill is not developer-specific — adapt vocabulary to the discipline
- Never generate the .docx mid-conversation — Markdown is the draft stage
- Never skip an annex or image — embed, reference, or placeholder
