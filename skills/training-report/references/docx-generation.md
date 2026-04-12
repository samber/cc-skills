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

## Image handling

1. Attempt embedding via `ImageRun` (PNG, JPEG, GIF, BMP, SVG)
2. Resize to fit content width (max 9026 DXA)
3. On failure: insert a labeled placeholder paragraph and instruct the user to insert manually

Never silently skip an image.

## Formatting hints for a professional document

These are strong recommendations — deviate only if the template or client brand overrides.

**Typography**

- Body text: Arial 11pt (22 half-points in docx-js). Never mix more than 2 font families.
- Headings: same family as body, differentiated by size and weight only
- Line spacing: `{ before: 60, after: 60 }` on body paragraphs; `{ before: 240, after: 80 }` on H1; `{ before: 180, after: 60 }` on H2
- Never use ALL CAPS except in the cover block title if the brand requires it

**Color**

- Use at most 3 colors: brand accent (headings, cover), dark near-black (body), gray (metadata, header/footer). A fourth color only if the template provides it.
- Default brand color if none provided: `#2E75B6`
- Body text: `#1F2D3D` (dark navy, softer than pure black)
- Metadata/secondary: `#666666`

**Spacing and rhythm**

- Separators between major sections: paragraph with bottom border `{ style: SINGLE, size: 6, color: D0D0D0 }` — never use a Table as a divider (cells have minimum height)
- Consistent vertical spacing: do not mix spacer paragraphs and paragraph spacing — pick one and apply it uniformly
- Bullet indentation: `{ left: 720, hanging: 360 }` (standard 0.5 inch indent)

**Lists**

- Always use `LevelFormat.BULLET` with a `numbering` config — never unicode bullet characters
- Bold label pattern for recommendations: first `TextRun` bold, colon, second `TextRun` normal
- Nested bullets: add a level to the numbering config rather than indenting manually

**Tables**

- Always set `width` on both the `Table` and each `TableCell` (dual-width requirement)
- Use `WidthType.DXA` — never `WidthType.PERCENTAGE` (breaks in Google Docs)
- Column widths must sum exactly to the table width
- Header row: `ShadingType.CLEAR` with brand color fill, bold white or dark text
- Borders: `{ style: SINGLE, size: 1, color: CCCCCC }` — subtle, not heavy

**Page setup**

- A4: `{ width: 11906, height: 16838 }` DXA
- Margins: `{ top: 1440, right: 1440, bottom: 1440, left: 1440 }` (1 inch all sides)
- Content width: 11906 − 2880 = 9026 DXA

**Accessibility basics**

- Use heading styles (not bold paragraphs) for all section titles — screen readers and Word's navigation pane depend on this
- Alt text for embedded images: set `description` in the `ImageRun` config
- Do not rely on color alone to convey meaning

## Validation and delivery

Run the validation script provided by the `docx` skill against the output file. Use the same `$OUTDIR` determined in Step 5 (see `references/markdown-draft.md` — File naming and location):

```bash
python scripts/office/validate.py "$OUTDIR/training_report_[team]_[date].docx"
```

Fix any errors before presenting. Deliver both files:

- `$OUTDIR/training_report_[team]_[date].docx`
- `$OUTDIR/training_report_[team]_[date].md` (source for future reference)

If the environment supports inline file delivery (e.g. `present_files` on Claude.ai), use it. Otherwise, print the absolute paths to both files.

Close with:

- 1-sentence summary of what was produced
- List of any images needing manual insertion (with instructions)
- Reminder: future edits go through the `.md` first; do not edit the `.docx` directly
