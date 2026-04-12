# DOCX Generation — Reference

Load this file at Step 6. Read the `docx` skill first — this file does not repeat its technical rules, only adds training-report-specific structure and formatting guidance.

## Pre-conditions

- The `docx` skill has been loaded and read in full
- The Markdown draft has been reviewed and approved by the user
- This is the last operation of the conversation

## If a template was provided (Step 2)

Use the `docx` skill's **unpack/edit/repack** workflow:

1. Unpack the template to a working directory
2. Inject section content into existing paragraph styles — do not redefine fonts, colors, or margins; the template owns those
3. Preserve all existing header/footer/logo elements exactly
4. Repack and validate

Map the Markdown headings to the template's heading styles by name. If the template uses custom style names (e.g. "TitreSection" instead of "Heading 1"), use those names.

## If no template was provided

Build from scratch following the `docx` skill's node.js API. Apply the structure and formatting guidance below.

## Document structure

### Cover block (no H1 — use raw Paragraphs)

```
[Title]        — large (48pt), bold, brand color, Arial
[Subtitle]     — medium (28pt), dark, Arial
[Metadata]     — small (22pt), gray, Arial
               format: Company — Team | Date | Duration | N participants
```

Followed by a separator (paragraph with bottom border, not a Table).

### Header

```
"Training Report | [Team]"    — 20pt, gray, bold label + separator bottom border
```

Adapt to document language: "Compte rendu de formation" in French, etc.

### Footer

```
"[Trainer name] | [Date]"     — 18pt, gray, separator top border
```

### Body sections

Mirror the Markdown structure. Convert each Markdown heading level:

- `## Section title` → `HeadingLevel.HEADING_1` (32pt, bold, brand color)
- `### Subsection` → `HeadingLevel.HEADING_2` (26pt, bold, dark)

For sections marked optional in the Markdown (Individual Feedback, General Observations, Satisfaction) — only include them if content was written.

### Closing paragraph

Style as normal body text. Contact details (name, email, phone) on a single line, slightly smaller font (20pt), gray, after a spacer paragraph.

### Annexes section

One bullet per annex:

- **[Title]:** [description] — [status: embedded / see attached / placeholder]

## Handling annotated elements from Markdown

For each `<!-- DOCX: convert to styled Table -->` block:

- Rebuild as a native `Table` element using the `docx` skill's table API
- Apply column widths (sum must equal content width: 9026 DXA for A4 with 1" margins)
- Header row: light brand-color shading (`ShadingType.CLEAR`), bold text
- Body rows: alternating light gray shading optional
- Cell padding: `{ top: 80, bottom: 80, left: 120, right: 120 }`
- Do not carry over HTML — rebuild natively

For other `<!-- DOCX: [instruction] -->` annotations: follow the instruction literally.

## Validation and delivery

Run the validation step as directed by the `docx` skill. Fix any errors before presenting. Deliver both files:

- `$OUTDIR/training_report_[team]_[date].docx`
- `$OUTDIR/training_report_[team]_[date].md` (source for future reference)

If the environment supports inline file delivery (e.g. `present_files` on Claude.ai), use it. Otherwise, print the absolute paths to both files.

Close with:

- 1-sentence summary of what was produced
- List of any images needing manual insertion (with instructions)
- Reminder: future edits go through the `.md` first; do not edit the `.docx` directly
