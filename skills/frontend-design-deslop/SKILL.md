---
name: frontend-design-deslop
description: Produce distinctive, non-generic UI and design applications well, working strategy-first. Identify the project (landing page, SaaS app, dashboard, ecommerce, presentation, docs, portfolio...) and its positioning and personality, commit to brand adjectives, translate into a typography and color system, then apply the craft layer (layout, components and states, motion, iconography, imagery, dark mode and theming, accessibility), avoiding the AI-slop / Claude-esque default. This is both a de-slop and an expert app-design skill. Use this whenever building or styling any web frontend, app, dashboard, landing page, deck, or artifact, or when the user says "make it not look like AI", "de-slopify", "deslop", "less generic", "give it character", "design a UI for X", "design an app", "update DESIGN.md", or complains the output looks like every other AI site. Trigger even when the user just says "build a UI for X" without naming an aesthetic, because the default without this skill is slop.
user-invocable: true
license: MIT
compatibility: Designed for Claude Code or similar AI coding agents.
metadata:
  author: samber
  version: "1.0.0"
  openclaw:
    emoji: "🎨"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion WebSearch WebFetch
---

# frontend design deslop

AI-generated UI looks generic for two reasons. First, with no constraints the model samples the statistical median of 2019-2024 web code, which is Tailwind UI's `bg-indigo-500`, Inter, rounded cards, and soft shadows. You cannot out-prompt a vacuum. Second, and deeper: designing before you know what you are designing. A corporate landing page, a creative portfolio, a developer-tool landing page, an analytics dashboard, and an ecommerce product page share almost no design DNA. A beautiful aesthetic that fights the artifact's job is its own slop.

The fix is a discipline borrowed from brand design: strategy drives design. Commit to words first (what this is, who it serves, the adjectives it must feel like), then translate those words into a typography and color system, then build from tokens, then apply the craft layer (layout, components, motion, iconography, imagery, dark mode, accessibility), then audit. Never pick aesthetics first. Target the convergence mechanism, not a frozen blocklist; the slop fingerprint shifts over time (purple gradients in 2022, cream backgrounds and italic-serif heroes in 2026).

This skill does two jobs at once: it de-slops the default AI look, and it designs applications well. A distinctive theme on top of careless components, weak layout, or thoughtless motion still reads as amateur. The mechanisms behind every choice live in `references/design-theory.md` (hierarchy, Gestalt, CRAP, signal-vs-noise, affordances, the interaction laws); read it once so the rest is reasoning rather than rule-following.

## Asking questions (CRITICAL)

ALWAYS use the AskUserQuestion tool for ANY question to the user. Never ask questions as plain text output. The tool gives a guided, interactive experience with structured options that the user can answer in one tap. Every single user question must go through this tool. (On claude.ai the equivalent tool is `ask_user_input_v0`; use whichever structured question tool the environment provides.)

Discipline on top of that rule: batch related questions, offer 2 to 4 concrete options each, and ask only the high-signal subset that changes the design system. Infer from context first and confirm inferences rather than re-asking. The bank is generous; the asking is selective. Do not interrogate.

## Phase 0: Discover and commit to words (do this FIRST, before any code)

First, check for an existing `DESIGN.md` at the project root (and common locations like `docs/`). If one exists, read it, honor its tokens, skip the questions it already answers, and extend it rather than starting over. If none exists, resolve three things before any pixel. Read `references/discovery.md` for the full protocol, question bank, and the personality-to-token translation table, and `references/artifact-types.md` for per-type priorities.

1. **WHAT is the artifact?** Classify it: marketing/landing page, pricing page, SaaS application, dashboard/data tool, ecommerce, marketplace, mobile app, AI/conversational interface, email/newsletter, blog/editorial publication, onboarding/auth flow, settings/admin/CMS, presentation/deck, docs/API reference, portfolio/brand site, or one of the long-tail types in `references/artifact-types.md`. Each optimizes for a different thing and has its own layout grammar and density. A composite artifact (a marketing site with an embedded app, an AI chat inside a SaaS app) is designed region by region.
2. **WHO and WHY?** Audience, positioning (corporate vs creative vs technical vs luxury vs playful), and the single primary action or outcome.
3. **Commit to words.** Lock 3 to 5 brand adjectives and a 3-word aesthetic essence before any visual exploration. This is the highest-leverage input; it drives type, color, density, radius, and motion. Strategy drives design, never the reverse.

Run discovery adaptively: infer, state inferences, ask the high-signal subset through the question tool, and ground the direction in 1 to 3 references (web-search strong current examples of the exact artifact type and positioning if none are given, then transpose rather than originate). Do not proceed until artifact type, positioning, and the adjectives are locked.

## Phase 1: Translate strategy into a design system (the gate)

State these commitments in prose, briefly. Each must follow from Phase 0, not from reflex.

1. **Aesthetic commitment.** Pick ONE opinionated direction that fits the artifact and the adjectives; generic is the failure mode. See `references/aesthetics-library.md`. If the user gave a brand or reference, transpose it.

2. **Typography (brand-first).** Choose type from personality, not aesthetic preference. Match classification to the adjectives, pick a modular-scale ratio that fits the content, and pair for contrast (display + body) without typographic mud. Never Inter/Roboto/Arial/system as the primary face. See `references/typography.md`.

3. **Color (appropriateness + differentiation).** Choose colors for fit with the brand and audience, then find uncontested territory (the indigo/violet band is the red ocean of AI UI; avoid it unless the brief demands it). Build one dominant plus a sharp accent plus neutrals plus semantic states, distributed roughly 60-30-10. Author in OKLCH. See `references/color-oklch.md`.

4. **Token table (emit BEFORE components).** Display + body font; type scale (state the ratio and base, 6 steps); spacing base unit; max two radius values; ONE shadow approach (defined edge OR soft elevation, never both on one element); palette with roles (bg, fg, muted, border, accent, accent-fg, success, warning, error). Everything references tokens; no scattered hex/px. Pull a starting set from `references/token-sets.md`.

5. **Signature move.** Name the single thing that makes this UI memorable and unmistakably not-default. One per project.

6. **Adapter.** Pick the stack syntax: plain CSS custom properties, Tailwind v4 `@theme`, or shadcn semantic tokens. See `references/adapters.md`. `references/token-core.css` is the portable source of truth.

## Phase 2: Apply the system to the interface (the craft layer)

Tokens make a UI consistent; the craft layer makes it good. This is the "design an application" half of the skill and the half most AI output skips. Apply each of the following to the artifact, pulling the matching reference on demand. Density and emphasis vary by artifact type (see `references/artifact-types.md`); a dashboard applies these very differently from a landing page.

1. **Layout and composition.** Compose space with intent: a base spacing unit, spacing that is tight within groups and generous between sections, an intentional grid (12-column, modular, or bento where content genuinely varies), at least one brief-specific layout move, and whitespace as a signal of confidence. Break the centered-max-width-column reflex. See `references/layout.md`.

2. **Components and states.** Specify every interactive component across its full state matrix (default, hover, active, focus, disabled, loading, error, selected), not just at rest. Get buttons (ranked by importance, not colored by meaning), forms (real labels, correct types, inline validation that keeps input), tables (left-align text, right-align tabular-nums numerals, light separators), navigation, overlays, and the empty/loading/error states right. See `references/components.md`.

3. **Motion.** Treat motion as communication, under a duration and easing token scale. Default to ease-out under 300ms, animate only transform and opacity, scale popovers from their trigger, and never animate high-frequency actions. See `references/motion.md`.

4. **Iconography.** One grid, one stroke, one radius across the set; do not let the unmodified default starter-kit set define the look. See `references/iconography.md`.

5. **Imagery and illustration.** Art-direct imagery as a system. Prefer real product visuals over stock and abstract; avoid the AI/stock fingerprint (people pointing at laptops, gradient blobs, corporate-Memphis, default Midjourney). Use texture and a graphic device to escape flat-slop. See `references/imagery.md`.

6. **Dark mode and theming.** If dark mode is in scope, design it (do not invert): near-black not pure black, off-white not pure white, elevation via lightness, desaturated accents, all driven by semantic tokens. See `references/dark-mode.md`.

7. **Accessibility as you build.** WCAG 2.2 AA: visible managed focus, keyboard operability, labels, 24px-plus targets, color independence, reduced-motion. Build it in; do not bolt it on. See `references/accessibility.md`.

At the end of conception, once the direction and craft decisions are locked, suggest to the user a relevant subset of design and component catalogs to mine for concrete ideas and ready implementations, framed as inspiration to transpose through the committed system (never to clone) and with a reminder to verify component licenses. Pick by artifact type and stage rather than dumping the whole list. See `references/catalogs.md`.

## Phase 3: Write DESIGN.md (the durable output)

Everything this skill produces lives in a single `DESIGN.md` at the project root: the discovery context, the committed aesthetic and signature move, the typography and color systems, the tokens, the spacing/radius/shadow rules, the craft-layer decisions (layout, components, motion, iconography, imagery, dark mode, accessibility), and the slop-audit result. Write or update it before or alongside building components, using the schema in `references/design-md.md`. DESIGN.md is the single source of truth; the CSS, the adapter, and the components are projections of it. If they ever drift, DESIGN.md wins. On later sessions, Phase 0 reads this file instead of re-running discovery.

## Token-first generation rules

- **Colors in OKLCH**, dominant + sharp accent, not a timid even spread. Design hierarchy in grayscale first, add the accent last and sparingly, roughly 60-30-10 (neutral / brand / accent). On colored backgrounds, darken/desaturate the same hue rather than going gray. Define semantic state colors (success, warning, error) and never use color as the only signal.
- **Typography**: a distinctive display face paired with a refined body face, modular scale with a stated ratio. Source from Fontshare/Google. Limit to 2 to 3 families.
- **Spacing rhythm**: vary spacing by relationship (tight within a group, generous between sections). One uniform value everywhere is a tell.
- **Density fits the artifact.** Dashboards and pro tools tolerate high density; marketing and portfolio pages want air.
- **Match implementation complexity to the aesthetic**: maximalism gets elaborate detail; minimalism gets restraint and precision, not laziness.

## NEVER (negative prompt)

NEVER use generic AI-generated aesthetics: overused fonts (Inter, Roboto, Arial, system-ui as the primary face); cliched color schemes (especially purple/indigo/violet gradients on white or dark); the hero + 3-feature-cards + testimonials + CTA boilerplate as the only structure; the icon-tile-above-heading feature-card template; side-tab accent borders on cards; hairline border and diffuse drop shadow stacked on the same element; gradient text on headings or metrics; decorative glassmorphism; blob-rounding (radius > 16px on small cards); cream/beige backgrounds by reflex; bounce/elastic easing and animate-everything micro-interactions. Use distinctive fonts, a cohesive committed palette, and motion only where it serves the interaction.

Craft-layer NEVERs: do not ship components with only a resting state; do not use placeholder text as the label; do not color buttons by meaning instead of ranking them by importance; do not center-align numeric table columns or use non-tabular numerals for figures; do not let the unmodified shadcn/Tailwind default icon set define the look; do not use stock people-pointing-at-laptops, gradient blobs, floating orbs, glossy isometric tech illustrations, corporate-Memphis figures, or raw default-Midjourney imagery where a real product visual belongs; do not invert a light palette to make dark mode, use pure black backgrounds, pure white text, or glowing colored box-shadows by reflex; do not animate layout properties (width/height/top/left) or ignore prefers-reduced-motion; do not remove focus outlines without replacing them, convey meaning by color alone, or ship sub-24px targets.

## Self-audit before finishing

Run the generated UI against `references/slop-checklist.md` and score it. Verify it serves the artifact type's priorities from `references/artifact-types.md` (a dashboard that reads as a portfolio piece, or a landing page with no clear primary action, has failed even if it is beautiful), and that the type and color choices match the committed adjectives. Verify the craft layer: components have full state matrices, layout has rhythm and an intentional move, motion is communicative and respects reduced-motion, icons are one coherent system, imagery is not stock/AI slop, and dark mode (if present) is designed not inverted. Run the accessibility gate in `references/accessibility.md` (focus, keyboard, contrast, targets, color independence); accessibility is a pass/fail gate, not a nicety. If any tell fires or the fit is wrong, regenerate that section before presenting. Record the result in the DESIGN.md slop-audit section and bump its changelog. State the artifact type, positioning, adjectives, aesthetic, type system, palette, and signature move used. All checklist items are detectable within a single generation; do not invent cross-generation rules the model cannot verify.

## Reference files

Load on demand.

Foundation and intake:

- `references/design-theory.md` - the mechanisms behind every choice: hierarchy, Gestalt, CRAP, signal-vs-noise, affordances, interaction laws. Read once early.
- `references/discovery.md` - design intake: AskUserQuestion protocol, commit-to-words, question bank, personality-to-token translation table. Read at the start of Phase 0.
- `references/design-md.md` - the DESIGN.md schema and persistence conventions. The durable output of the whole skill. Read in Phase 0 (to consume an existing file) and Phase 3 (to write one).
- `references/artifact-types.md` - artifact taxonomy with per-type priorities, layout grammar, density, positioning variants, anti-patterns. Read at the start of Phase 0.

System (Phase 1):

- `references/typography.md` - full type strategy: brand-first selection, classification matrix, modular scale ratios, pairing, variable fonts, accessibility, anti-slop sourcing and ban-list.
- `references/color-oklch.md` - full color strategy: appropriateness, Blue Ocean differentiation, harmony systems, 60-30-10, archetype map, OKLCH primer, Radix roles, accessibility.
- `references/aesthetics-library.md` - encoded style families with defining traits, plus the method for originating a bespoke theme from discovery.
- `references/token-sets.md` - ready-to-use distinctive palettes, each with a signature move, plus shared motion tokens.
- `references/token-core.css` - the framework-agnostic OKLCH token core, including motion tokens.
- `references/adapters.md` - Tailwind v4 / shadcn / plain-CSS token syntax.

Craft (Phase 2):

- `references/layout.md` - spacing rhythm, grids (12-col, bento), asymmetry, whitespace, scanning, density, responsive, layout inspiration.
- `references/components.md` - the state matrix and patterns for buttons, forms, tables, navigation, overlays, feedback, empty/loading/error states, plus component inspiration.
- `references/motion.md` - duration and easing scales, springs, transform-origin, performance, reduced motion, motion tokens and inspiration.
- `references/iconography.md` - grid, stroke, radius, optical balance, when defaults become slop, how to differentiate, icon inspiration.
- `references/imagery.md` - art direction, photography direction, the AI/stock fingerprint, illustration systems, graphic devices and texture, imagery inspiration.
- `references/dark-mode.md` - dark mode as a designed mode (not inversion), elevation via lightness, desaturation, semantic-token theming, dark/theme tokens.
- `references/accessibility.md` - unified WCAG 2.2 AA: contrast, focus, keyboard, target size, forms, ARIA basics, motion, testing.
- `references/catalogs.md` - component catalogs (shadcn/ui, 21st.dev, Magic UI, Aceternity, Origin, Cult, Kibo, shadcnblocks) and inspiration galleries (Awwwards, Behance, Dribbble, Mobbin, Land-book, Page Collective, Godly, SaaS Landing Page, Lapa Ninja, Refero, Screenlane), with transposition and licensing cautions. Suggest a relevant subset at the end of conception.

Audit:

- `references/slop-checklist.md` - the self-audit (tell catalog + quality gates). Read before finishing any UI.
