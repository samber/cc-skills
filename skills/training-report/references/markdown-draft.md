# Markdown Draft — Reference

This file details how to write, structure, and iterate the Markdown draft of the training report. The Markdown file is the canonical artifact. The .docx is generated once, at the end of the conversation, from this file.

## Why Markdown first

Editing prose in Markdown is fast and transparent. Editing binary .docx XML is slow, error-prone, and requires unpacking, modifying, and repacking a ZIP archive. By keeping the canonical content in Markdown:

- Every change the user requests is a simple text edit
- The content is readable and reviewable in the conversation itself
- The .docx is a derivative — a styled rendering of the final approved text
- If the user edits the .docx directly and then asks for changes, you're back to parsing binary XML; avoid this situation by making it clear that the .md is the source of truth

The conversion to .docx is the last operation of the conversation. It is not reversible mid-conversation: if the user requests changes after the .docx is generated, update the .md and regenerate from scratch.

## File naming and location

Save the draft to the same output directory that the `docx` skill will use for the final `.docx`. Determine that directory before writing — ask the `docx` skill or use the same `$OUTDIR` you will use at Step 6. Both files must end up in the same directory:

```
$OUTDIR/training_report_[team]_[date].md
$OUTDIR/training_report_[team]_[date].docx   ← written at Step 6
```

Keep a single file. Do not create `_v2`, `_final`, `_revised` variants. Every iteration overwrites the same file. The conversation history is the version history.

## Document structure in Markdown

Write the following sections in order. Omit any section that was explicitly skipped (e.g. no individual feedback requested, no satisfaction data provided).

```markdown
# [Title of the training]

[Subtitle: tool/topic + session type] [Metadata: Company — Team | Date | Duration | N participants]

## 1. Context

[2–3 paragraphs: who commissioned it, what the goal was, what support material was used, any key rules or framing set at the start]

## 2. Starting Levels

[Intro sentence + bullet list segmenting participants by prior familiarity]

## 3. Session Walkthrough

### 1. [Step name]

[1–3 paragraphs: what participants did, what concept was introduced, how it landed]

### 2. [Step name]

...

## 4. General Observations

[3–5 paragraphs: flow, logistics, engagement, notable incidents. Factual only.]

## 5. Participant Satisfaction

[Only if survey data was provided. Overall score, distribution, themes from verbatim.]

## 6. Individual Feedback

[One H3 per notable participant. Optional section — only include if explicitly requested.]

### [Name]

**Starting level:** [brief description]

[Paragraph on background and initial posture] [Paragraph on evolution during the session]

## 7. Recommendations & Next Steps

### [Group heading, e.g. Resources & Access]

- **[Label]:** [explanation]

### [Group heading]

...

## 8. Annexes

[List of attached or referenced documents. Embedded images described inline.]

_[Closing sentence thanking the team for the invitation and expressing openness to future collaboration — see Closing section below]_

_Contact: [name] — [email] — [phone]_
```

## Section-by-section writing guidance

### 1. Context

- Start with the commissioning context: who asked for this training and why
- Describe the practical support used (project, tool, subject) in one sentence
- If a key rule or constraint was set at the start (e.g. "work without looking at the source material"), highlight it as a Markdown blockquote: `> Do not open the reference document.`
- Do not include the full session timeline here — that belongs in Section 3

### 2. Starting Levels

- The goal is to give the reader a quick picture of the heterogeneity of the group
- Use a bullet list, not prose — it scans faster
- If a participant is named in a bullet, be consistent: either name everyone or name outliers only
- Include the level of the furthest-ahead participant as context for the recommendations

### 3. Session Walkthrough

- Use numbered subheadings so the reader can track position in the session
- Focus on what participants DID, not what the trainer explained
- One paragraph per step is often enough; use two if there was a notable difficulty or a pivot in format
- End each step with the outcome: did everyone complete it? Was it demonstrated only? Did something unexpected happen?
- Note any steps that were cut or shortened due to time pressure

### 4. General Observations

- Write in short paragraphs, one idea each
- Do not editorialize here — this section is factual
- Good topics: pacing, tool setup issues, group energy, engagement level, any unexpected disruptions (external interruptions, early departures, etc.)
- Save any interpretation for Individual Feedback

### 5. Participant Satisfaction

- Lead with the headline number (NPS or overall score)
- Use a brief list for themes, not prose: it reads faster and anchors the verbatim
- If there are contradictory signals (high score but negative verbatim), name both and let the reader interpret
- Do not use verbatim quotes directly unless the trainer confirmed the wording — paraphrase instead

### 6. Individual Feedback (optional)

- Only write this section if the trainer explicitly requested individual feedback
- One subheading per participant who has something meaningful to say about
- Structure per participant: starting level (bold), background paragraph, evolution paragraph
- Be direct where praise is genuine. Name resistance factually, not judgmentally.
- If writing for an external client, consider whether naming individuals is appropriate (see tone-of-voice.md — Diplomatic framing section)
- The trainer knows the participants; you do not. Do not embellish or infer beyond what the trainer explicitly told you.

### 7. Recommendations & Next Steps

- Group recommendations under subheadings — do not use a flat list
- Each bullet: **bold label** followed by a colon and the explanation
- Recommendations must be actionable. "Encourage practice" is not actionable. "Block 30 minutes per day for autonomous practice in the two weeks following the session" is actionable.
- Always include a Pacing subgroup advising management not to rush participants into advanced or complex material before basics are consolidated
- Adapt the vocabulary to the discipline — these recommendations apply to any field, not just technical ones

### 8. Annexes

- List each annex with a title, a one-sentence description, and its status
- Status options: "embedded in document", "see attached file", "placeholder — insert manually"
- If the annex was produced by a participant (exercise, deliverable, prototype), note the author and the context in which it was produced
- For survey data already covered in Section 5, just reference it here: "Satisfaction survey results — synthesized in Section 5"

## Closing paragraph

At the end of the document, after the Annexes section, add a brief personal closing:

- Thank the team/client for the invitation to run the session
- Express openness to future collaboration (follow-up session, other training topics, consulting)
- Include contact details: email and phone number

**Ask the trainer for this information before writing the closing.** Do not invent or assume contact details. The closing should feel personal, not templated.

Example (adapt to language and tone):

```
Merci à toute l'équipe pour l'invitation et la qualité des échanges durant cette session.
Je reste disponible pour un suivi, une prochaine formation, ou tout autre besoin de
collaboration.

Samuel Berthe — contact@samuel-berthe.fr — +33 6 XX XX XX XX
```

## Markdown limitations and workarounds

Markdown has no native concept of page layout. The following elements do not exist in Markdown and will be applied only at the .docx generation step:

- Page headers and footers
- Page numbers
- Margins and page size
- Branded fonts and color schemes
- Logo placement
- Section breaks

Do not attempt to represent any of these in the Markdown file.

### Tables

Standard Markdown table syntax has no column widths, no merged cells, no per-cell styling, and no header row shading. For simple tables (3–4 columns, uniform rows), use standard Markdown syntax:

```markdown
| Column A | Column B | Column C |
| -------- | -------- | -------- |
| Value    | Value    | Value    |
```

For **complex tabular content** (decision matrices, multi-column layouts, merged headers, per-cell styling), write a minimal HTML table directly in the Markdown. Mark it with a processing annotation:

```html
<!-- DOCX: convert to styled Table -->
<table>
  <thead>
    <tr>
      <th>Column A</th>
      <th>Column B</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Value</td>
      <td>Value</td>
    </tr>
  </tbody>
</table>
```

Keep the HTML simple: no inline styles, no `colspan`/`rowspan` unless necessary. The annotation tells Step 6 to rebuild this as a native docx Table element with proper column widths, shading, and padding.

### Other complex elements

For any element that Markdown cannot represent cleanly, add an annotation:

```
<!-- DOCX: [instruction for Step 6] -->
```

Examples:

- `<!-- DOCX: insert page break before this section -->`
- `<!-- DOCX: render as two-column layout -->`
- `<!-- DOCX: this is an image placeholder — embed [filename] here -->`

These annotations are invisible to the reader of the Markdown file and serve as explicit instructions for the .docx generation step.

## Presenting the draft

After saving the .md file, present the content inline in the conversation — do not just say "the file is ready". The user needs to read and react to the actual text.

If the environment supports inline file delivery (e.g. `present_files` on Claude.ai), use it to make the .md downloadable. Otherwise, print the absolute path to the saved file.

End the presentation with a focused prompt:

> "Here's the draft. Read through it and tell me what to adjust — any section, any phrasing, any missing detail. We'll iterate until you're happy, then I'll generate the Word document."

Do not ask multiple questions at once. Let the user lead the iteration.
