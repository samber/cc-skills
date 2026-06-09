# Slop self-audit checklist

Run the generated UI against this before presenting. Score 0-10. If any item fires, regenerate that section. Every item here is detectable within a single generation.

The fingerprint shifts over time, so the underlying test is always: "Is this the most probable output, or a committed choice?" The lists below are the current (2022-2026) tells.

## Color

- [ ] No purple/indigo/violet gradient. Accent is NOT in the indigo/violet hue band (OKLCH H ~250-320) unless the brief explicitly demands it.
- [ ] No gradient text on headings or metrics.
- [ ] Background is not cream/beige by reflex; it comes from the chosen palette.
- [ ] No gray text on colored backgrounds. Use the same hue, darker and desaturated.
- [ ] One dominant color plus a sharp accent, not a timid even spread across many hues.
- [ ] On dark themes, no default glowing colored box-shadows (cyberpunk-by-reflex).

## Typography

- [ ] Primary face is NOT Inter, Roboto, Arial, Open Sans, Lato, or system-ui.
- [ ] Not Space Grotesk, Geist, or Instrument Serif chosen by reflex (these are now themselves convergence tells; only use if genuinely the right call).
- [ ] A distinct display + body pairing exists; they are not the same font.
- [ ] Type scale ratio >= 1.25 so adjacent steps are clearly different.
- [ ] No icon-tile stacked above heading as the universal feature-card shape.
- [ ] No hero eyebrow / pill chip above an oversized headline by reflex.
- [ ] No 01/02/03 numbered section markers unless the content is truly sequential.
- [ ] No big italic serif display headline used as the default startup-hero move.

## Layout and structure

- [ ] Not hero + 3 cards + testimonials + pricing + CTA as the only structure. At least one intentional, brief-specific layout move.
- [ ] No identical same-sized card grid as the only device.
- [ ] No nested cards (cards inside cards inside cards).
- [ ] Not everything centered in a max-width container as the sole layout idea.

## Visual detail

- [ ] No side-tab accent border (thick colored border on one side of a rounded card). This is the single most recognizable tell.
- [ ] No hairline border AND wide diffuse shadow on the same element. Commit to one: a defined edge or a soft elevation.
- [ ] Radius <= 16px on small cards. No blob-rounding (24px+).
- [ ] No decorative glassmorphism (blur/glass/glow used for looks rather than to solve layering).
- [ ] No uniform 16px radius on everything (the rounded-2xl reflex).
- [ ] No bounce/elastic easing on UI motion; no animate-everything; no image-scale-on-hover by default.

## Motion (see motion.md)

- [ ] Animation communicates (causality, state, spatial origin); high-frequency and keyboard-initiated actions are not animated.
- [ ] Durations mostly under 300ms; ease-out for enter; custom cubic-bezier, not weak browser keywords.
- [ ] Only transform and opacity are animated (no width/height/top/left/box-shadow).
- [ ] Popovers and menus scale from their trigger (transform-origin), not from center; nothing animates from scale(0).
- [ ] Exit animations exist where enter animations do; no identical fade-in-up on 4+ sections.
- [ ] prefers-reduced-motion is honored (motion swapped for a fade, not a blunt global zero).

## Iconography (see iconography.md)

- [ ] One grid, one stroke width, one corner radius across the icon set.
- [ ] The unmodified shadcn/Tailwind default set does not define the look (customized stroke/radius, or a distinctive set).
- [ ] Icons are not scaled far beyond their design size; no emojis as icons.
- [ ] Icon radius matches the token radius (no sharp icons in a soft UI).
- [ ] Icon-only buttons have an accessible name.

## Components and states (see components.md)

- [ ] Every interactive component specifies hover, active, focus, disabled, and (where relevant) loading, error, selected, not just rest.
- [ ] Font weight does not change on hover/selected (no layout shift); focus uses box-shadow, not outline.
- [ ] Buttons ranked by importance (one primary), not colored by meaning.
- [ ] Inputs have visible labels (not placeholder-as-label), correct types, inline validation that keeps the user's input.
- [ ] Tables: text left, numbers right, tabular-nums for figures, light separators not heavy borders.
- [ ] Empty, loading, and error states are designed, not afterthoughts.

## Imagery (see imagery.md)

- [ ] No stock people-pointing-at-laptops, gradient blobs, floating orbs, glossy isometric tech illustration.
- [ ] No corporate-Memphis/Alegria figures; no raw default-Midjourney renders.
- [ ] Real product visuals used where they belong, not stock or abstract decoration.
- [ ] Third-party photography regraded to the palette; text-over-image contrast guaranteed.
- [ ] Texture or a graphic device present where flat color would read as slop.

## Dark mode (if present, see dark-mode.md)

- [ ] Not a straight inversion; background is near-black (not #000), text is off-white (not #FFF).
- [ ] Elevation expressed by lightness steps, not drop shadows; no glowing colored box-shadows by reflex.
- [ ] Accents are lighter, desaturated siblings of the light-mode accent, and still pass contrast.
- [ ] Borders are lighter than the surface; no transition animation on theme switch.

## Accessibility gate (see accessibility.md)

- [ ] Visible, managed keyboard focus on every interactive element (focus not obscured by sticky bars).
- [ ] Fully keyboard operable; targets at least 24px (44px preferred); drag interactions have a non-drag alternative.
- [ ] Meaning never conveyed by color alone; UI readable in grayscale.
- [ ] Forms have associated labels and accessible error messaging.
- [ ] WCAG AA contrast in both light and dark modes.

## Spacing

- [ ] Spacing varies by relationship: tight within groups, generous between sections. Not one uniform value everywhere.
- [ ] Started from generous whitespace, then tightened (not cramped-by-default).

## Quality gates (Refactoring UI foundations)

- [ ] Body text >= 14px (16 ideal), line-height 1.5-1.7.
- [ ] Long-form measure 65-75ch, left-aligned (not centered, not full-width).
- [ ] Hierarchy comes from size/weight/color, not from making everything loud.
- [ ] Shadows use transparent dark, not opaque gray; elevation is a scale.
- [ ] Button hierarchy by importance (primary filled, secondary outlined/muted, tertiary text), not by semantic color.
- [ ] WCAG AA contrast: 4.5:1 body, 3:1 large text. No skipped heading levels.

## Signature

- [ ] A single named signature move is present and identifiable in the output.

## Copy (if generating copy)

- [ ] No em-dash overuse, no "supercharge / world-class / enterprise-grade" buzzwords, no "Not a feature. A platform." aphoristic cadence, no vague "Build the future of X" headlines.
