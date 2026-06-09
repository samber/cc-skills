# Typography strategy

Type is voice made visible. Every typeface carries personality, every hierarchy guides attention, every spacing decision affects comprehension. The goal is not a beautiful font but the right one: the one that serves the message and the reader. Start from brand personality (the adjectives locked in discovery), then translate to typographic form. Never the reverse.

Anchoring quotes: "Typography exists to honor content" (Bringhurst). "Typography and design should enhance communication, not just look attractive" (Spiekermann). "If you have fewer choices, it often makes your life easier" (Spiekermann). The frameworks below draw on Bringhurst (proportion, rhythm, harmony), Ellen Lupton (Letter, Text, Grid), Spiekermann (type serving communication), and Paula Scher and Matthew Carter (bold identities, screen-legible type).

## Contents

1. Brand-first selection process
2. Classification and personality matrix
3. Serif vs sans decision
4. Typeface evaluation criteria
5. Modular scale
6. Ellen Lupton: Letter, Text, Grid
7. Pairing principles
8. Typography system components
9. Full hierarchy reference (web and print)
10. Spacing: tracking, leading, measure
11. Variable fonts
12. Web font performance
13. Responsive and fluid type
14. System font stacks
15. Accessibility deep dive
16. Print vs digital
17. Font licensing
18. Anti-slop sourcing and ban-list
19. Recommended distinctive fonts
20. Design tokens (CSS)
21. Common mistakes
22. Where experts disagree

## 1. Brand-first selection process

1. Define 3 to 5 personality adjectives (from discovery). These translate directly into type qualities. If the brand can describe its tone, personality, and principles in words, that translates into typographic form.
2. Understand the audience and industry expectations; different fields carry ingrained type expectations.
3. Gather inspiration; analyze competitors, see what works, decide how to differ.
4. Select and pair fonts; build mockups for real use cases (web, mobile, print) to test if they hold up.
5. Establish hierarchy; define primary, secondary, and optional tertiary with clear purposes.
6. Document everything with examples and specifications.

## 2. Classification and personality matrix

Match the class to the committed adjectives.

| Class | Personality | Best for | Typical fields |
| --- | --- | --- | --- |
| Serif | traditional, classical, reliable, authoritative, sophisticated | long-form, heritage, trust | law, finance, luxury, editorial |
| Sans-serif | modern, clean, minimal, approachable, contemporary | digital UI, startups, accessibility | tech, SaaS, healthcare, retail |
| Script | elegant, distinctive, personal | special moments, luxury accents | fashion, weddings, high-end beauty |
| Handwritten | artsy, informal, fun, playful, authentic | personal connection, casual | creative, kids, artisan food |
| Display / decorative | bold, attention-grabbing, distinctive | headlines only, limited accent | entertainment, events, campaigns |
| Slab serif | strong, sturdy, mechanical, modern-classic | tech with heritage, editorial | construction, automotive, journalism |
| Monospace | technical, precise, developer-oriented | code, data, technical docs | dev tools, fintech, data platforms |

## 3. Serif vs sans decision

Choose serif when the brand leans artisanal, authoritative, or editorial; long-form print or reading leads; you want tradition, trust, premium positioning; the audience expects established credibility (boutique hotels, legal, investment, craft, heritage). Choose sans when 70 percent or more of touchpoints are digital UI; quick legibility is paramount; you want modernity, accessibility, innovation (tech, startups, digital products, contemporary retail, healthcare). High-resolution displays have largely closed the screen legibility gap, so the specific typeface and context matter more than the class alone. A serif display over a sans body (or the reverse) is a reliable de-slop move because it breaks the sans-everything default.

## 4. Typeface evaluation criteria

Assess any candidate on seven dimensions:

- Comprehensiveness: all characters, weights, styles you will need (brand needs grow).
- Legibility: readable at small sizes, distinctive characters.
- Versatility: works across headline, body, caption, and media.
- Complementarity: works with the logo, colors, imagery.
- Distinctiveness: helps differentiate from competitors and from the AI default.
- Technical readiness: web font available, proper licensing, variable font.
- X-height appropriateness: optimal for intended sizes. Higher x-height aids small-size legibility, but an extremely high x-height reduces word-shape recognition. Aim for appropriate, not maximal.

## 5. Modular scale

A mathematical hierarchy using a consistent ratio between sizes (Bringhurst, after musical scales). Pick the ratio from personality and content, state it, base it at 16px for web (browser default and accessibility baseline), then multiply up and divide down. Limit to 6 to 8 sizes to avoid clutter.

| Ratio          | Value | Character           | Best for                   |
| -------------- | ----- | ------------------- | -------------------------- |
| Minor second   | 1.067 | subtle increments   | dense, data-heavy UIs      |
| Major second   | 1.125 | slightly noticeable | functional interfaces      |
| Minor third    | 1.200 | moderate            | balanced content hierarchy |
| Major third    | 1.250 | clear hierarchy     | general UI                 |
| Perfect fourth | 1.333 | distinct hierarchy  | editorial, marketing       |
| Golden ratio   | 1.618 | dramatic, high-end  | premium, display-heavy     |

Larger screens tolerate more dramatic ratios; smaller screens want conservative ones. Tools: typescale.io, precise-type.com.

## 6. Ellen Lupton: Letter, Text, Grid

- Letter: individual characters, anatomy, classification, personality.
- Text: words and paragraphs; alignment, spacing, kerning, tracking, leading.
- Grid: page structure; columns, margins, spatial relationships. Learn the rules and how to break them; visual balance and Gestalt grouping guide layout; legibility and accessibility are non-negotiable.

## 7. Pairing principles

- Seek contrast, not conflict. Two near-but-not-quite-same faces clash like mismatched plaids.
- Avoid typographic mud: faces from the same class but different families blur together with no meaningful distinction.
- Create meaningful hierarchy through weight, size, and style.
- Limit strong personalities: two bold display faces compete for attention.
- Consider weight contrast: bolder titles, lighter body, or the reverse for effect. Practical tips: keep one face simple when the other is distinctive; serif headline + sans body (or reverse) is reliable; look for a shared trait (x-height, proportion, era); test in real content before committing; monospace pairs with any class for a technical accent.

## 8. Typography system components

- Primary (display): attention type for headlines and key moments; expresses personality most strongly.
- Secondary (body): the workhorse for readable text; prioritizes legibility over personality.
- Tertiary (accent, optional): special uses (monospace for code, script for signatures); use sparingly.
- Hierarchy: the systematic relationship of sizes, weights, and spacing that guides the reader.
- Usage guidelines: rules so anyone can apply it consistently.

## 9. Full hierarchy reference (web and print)

Web/digital starting values (tune to the chosen scale):

| Element    | Size       | Line height | Tracking | Use                       |
| ---------- | ---------- | ----------- | -------- | ------------------------- |
| Display    | 48 to 72px | 1.1 to 1.2  | -0.02em  | hero headlines            |
| H1         | 36 to 48px | 1.2         | -0.01em  | page titles               |
| H2         | 28 to 36px | 1.25        | 0        | section headers           |
| H3         | 22 to 28px | 1.3         | 0        | subsections               |
| H4         | 18 to 22px | 1.35        | 0        | minor headings            |
| Body large | 18 to 20px | 1.6         | 0        | lead paragraphs           |
| Body       | 16px       | 1.6 to 1.7  | 0        | standard text             |
| Body small | 14px       | 1.5         | 0        | captions, meta            |
| Caption    | 12px       | 1.4         | 0.02em   | labels, footnotes         |
| Button     | 14 to 16px | 1           | 0.05em   | CTAs                      |
| Overline   | 12px       | 1.4         | 0.1em    | category labels, all caps |

Print starting values: H1 24 to 36pt (leading 28 to 40pt, tracking -10); H2 18 to 24pt (22 to 28pt, -5); body 10 to 12pt (13 to 16pt, 0); caption 8 to 9pt (11 to 12pt, +5).

## 10. Spacing: tracking, leading, measure

- Tracking: tighten large headlines (-0.02 to -0.01em); body 0; small text +0.01 to +0.02em; all caps and labels +0.05 to +0.1em.
- Leading (line height): headlines 1.1 to 1.25; subheads 1.25 to 1.35; body 1.5 to 1.7; long-form 1.6 to 1.8.
- Measure (line length): optimal 50 to 75 characters (66 ideal), minimum 45, maximum 80. Too short reads choppy; too long loses the reader. Do not center long-form.

## 11. Variable fonts

One file holds all weights and widths through continuous interpolation: smaller than many statics, any weight available (450, not just 400/500), responsive and animatable.

| Axis         | Code | Range                 | Effect                        |
| ------------ | ---- | --------------------- | ----------------------------- |
| Weight       | wght | thin to black         | stroke thickness              |
| Width        | wdth | condensed to extended | character width               |
| Italic       | ital | upright to italic     | roman/italic switch           |
| Slant        | slnt | angle                 | oblique lean                  |
| Optical size | opsz | size-specific         | auto-adjusts details for size |

```css
.heading {
  font-variation-settings:
    "wght" 700,
    "wdth" 100;
}
.body {
  font-variation-settings:
    "wght" 400,
    "opsz" 16;
}
```

## 12. Web font performance

Custom fonts delay text rendering. Prefer FOUT (show fallback, swap when ready) over FOIT (hide text until loaded).

- Use `font-display: swap`.
- Preload critical faces: `<link rel="preload" href="brand.woff2" as="font" type="font/woff2" crossorigin>`.
- `font-display: optional` for maximum performance (uses the font only if cached).
- Tune fallback metrics to the web font to reduce layout shift.

```css
@font-face {
  font-family: "BrandFont";
  src: url("brand.woff2") format("woff2");
  font-display: swap;
}
```

## 13. Responsive and fluid type

```css
h1 {
  font-size: clamp(2rem, 5vw, 4rem);
}
```

Minimum 2rem, preferred 5vw, maximum 4rem. Use rem for min/max so user zoom is respected. Headings benefit most from fluid scaling; body can stay fixed. Test at 200 percent zoom.

## 14. System font stacks

Valid for apps, dashboards, and content-heavy tools where neutrality and zero-download speed matter. This is a deliberate utilitarian choice, not the slop default.

```css
font-family:
  -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu,
  Cantarell, "Helvetica Neue", sans-serif;
```

## 15. Accessibility deep dive

- Contrast (WCAG): AA 4.5:1 normal, 3:1 large (24px+ or about 18.66px bold). AAA 7:1 and 4.5:1.
- Text resizing (1.4.4): resizable to 200 percent without loss; use relative units (rem, em, percent).
- Text spacing (1.4.12): content must survive user overrides of line-height 1.5x, paragraph 2x, letter 0.12x, word 0.16x of font size.
- Minimums: body 16px (desktop and mobile), buttons/links 14px (16 better), captions 12px (14 better).
- Dyslexia-friendly: simple sans shapes, wider letter and word spacing, distinct b/d and p/q, upright (no italic body), 16px+. Recommended: Lexend (built for readability), Atkinson Hyperlegible (low-vision, benefits all), Open Sans, Verdana, Calibri. Sans, monospace, and roman are most readable for dyslexic readers; italics reduce readability.

## 16. Print vs digital

Resolution 300dpi vs 72 to 100ppi. Body 10 to 12pt print vs 15 to 25px digital. Print allows any font; digital is limited by availability and licensing. Print renders consistently; screens vary by device. For cross-channel work, choose faces designed for both, test in both, consider superfamilies, ensure licensing covers all uses, and document per-medium size adjustments.

## 17. Font licensing

License types: Desktop (users/devices), Web (page views, domains), App (downloads, platforms), ePub (titles), Server/API (impressions). Key points: read the EULA; some licenses prohibit logo use; clients need their own license (you cannot transfer yours); most prohibit modifying files; embedding (PDF, video) has specific rules. Open source: SIL Open Font License (free personal and commercial, modifiable), Google Fonts (all commercial-licensed), The League of Moveable Type.

## 18. Anti-slop sourcing and ban-list

The de-slop constraint sits on top of all the strategy above. Some technically excellent fonts are slop tells purely because of ubiquity in AI output and starter templates. Ban as the PRIMARY/display face: Inter, Roboto, Arial, Open Sans, Lato, Montserrat, Poppins, system-ui. These are good fonts; their problem is that they are the statistical median. Inter is acceptable only as a body/fallback when nothing else fits, never as the brand voice. Use only with clear intent (now themselves tells): Space Grotesk, Geist, Instrument Serif.

## 19. Recommended distinctive fonts

Free, distinctive sources:

- Fontshare (ITF Free Font License, commercial OK): Clash Display, Satoshi, General Sans, Cabinet Grotesk, Boska, Switzer, Sentient. Curated pairs in its Pairs section.
- Google Fonts, distinctive picks: Fraunces, Newsreader, Bricolage Grotesque, Crimson Pro, Source Serif 4, Lora, IBM Plex family, JetBrains Mono, Fira Code. By register: code/dev -> JetBrains Mono, Fira Code, IBM Plex Mono. Editorial -> Fraunces, Newsreader, Crimson Pro, Playfair Display. Startup/product -> Clash Display, Satoshi, Cabinet Grotesk, General Sans. Technical/dense -> IBM Plex Sans + Mono, Source Serif 4. Verified pairings: Clash Display + Satoshi; General Sans + Satoshi; Cabinet Grotesk + General Sans; Fraunces + a geometric sans; Bricolage Grotesque + a neutral body; JetBrains Mono + IBM Plex Mono (terminal). Premium foundries when budget allows: Pangram Pangram (from ~$40), TypeType, Grilli Type, Commercial Type, Hoefler and Co, Typotheque. A distinctive paid display face is one of the fastest ways off the default.

## 20. Design tokens (CSS)

```css
:root {
  --font-display: "[Display]", [fallbacks];
  --font-body: "[Body]", [fallbacks];
  --font-mono: "[Mono]", ui-monospace, monospace;
  --fw-regular: 400;
  --fw-medium: 500;
  --fw-semibold: 600;
  --fw-bold: 700;
  /* scale at chosen ratio, base 16px */
  --text-xs: 0.75rem;
  --text-sm: 0.875rem;
  --text-base: 1rem;
  --text-lg: 1.125rem;
  --text-xl: 1.25rem;
  --text-2xl: 1.5rem;
  --text-3xl: 1.875rem;
  --text-4xl: 2.25rem;
  --text-5xl: 3rem;
  --leading-tight: 1.25;
  --leading-snug: 1.375;
  --leading-normal: 1.5;
  --leading-relaxed: 1.625;
  --tracking-tight: -0.01em;
  --tracking-normal: 0;
  --tracking-wide: 0.05em;
  --tracking-widest: 0.1em;
}
:root {
  --type-display: var(--fw-bold) var(--text-5xl)/var(--leading-tight)
    var(--font-display);
  --type-h1: var(--fw-bold) var(--text-4xl)/var(--leading-tight)
    var(--font-display);
  --type-body: var(--fw-regular) var(--text-base)/var(--leading-normal)
    var(--font-body);
}
```

## 21. Common mistakes

Inconsistent usage across platforms; too many fonts (cap at 3); readability sacrificed for style; ignoring licensing; mismatched personality; low-contrast text; over-styling (shadows, gradients on type); ignoring mobile; trendy faces that date fast; skipping hierarchy; not testing across media; default fonts for logos or display.

## 22. Where experts disagree

- Serif vs sans on screen: high-res has largely equalized this; context and the specific face matter more than class.
- X-height: appropriate beats maximal.
- Dyslexia fonts: well-designed standard fonts (Verdana, Lexend) work as well as specialized ones; match to user preference.
- System vs web fonts: brand expression can justify the performance cost; test both.
- Variable fonts: support is now solid; use for new projects.
