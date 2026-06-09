# DESIGN.md output

Everything this skill produces lives in a single `DESIGN.md` at the project root. It is the durable source of truth for the design system: the discovery context, the committed aesthetic, the typography and color systems, the tokens, the spacing/radius/shadow rules, component conventions, and the slop-audit result. Code (token-core.css, the Tailwind or shadcn adapter, components) is generated from DESIGN.md, not the other way around.

## Why a file

- Persistence: the design system survives across sessions and contributors. A new session reads DESIGN.md instead of re-running discovery.
- Single source of truth: tokens live in one place; the CSS/adapter is a projection of it.
- Reviewable: the rationale sits next to the values, so choices can be checked and changed deliberately.

## Lifecycle

1. On any UI task, first check for `DESIGN.md` at the project root (and common locations like `docs/`).
2. If it exists: read it, honor its tokens, skip questions it already answers, and extend it. Do not re-originate a theme.
3. If it does not exist: run discovery, Phase 1, and Phase 2, then write DESIGN.md before or alongside building components.
4. After the self-audit, append the audit result and any fixes to DESIGN.md and bump the changelog.
5. Keep `token-core.css` and the chosen adapter in sync with the Tokens section; if they drift, DESIGN.md wins.

## Template

Write DESIGN.md using this structure. Fill every section; use OKLCH with a hex fallback for color. Keep it dense and specific, no vague guidance, no em dashes.

```markdown
# DESIGN.md - [Project name]

## Context (from discovery)

- Artifact type: [landing | pricing | SaaS app | dashboard | ecommerce | marketplace | mobile app | AI/chat | email | blog/editorial | onboarding/auth | settings/admin/CMS | deck | docs/API ref | portfolio | other (see artifact-types.md)]
- Positioning: [corporate | creative | technical | luxury | playful | utilitarian]
- Audience: [who] | Primary action: [the one outcome]
- Adjectives: [3 to 5]
- Visual word translations: [adjective -> concrete visual move, one line each]
- Aesthetic essence (3 words): [x, y, z]
- Single-minded proposition: [the one impression to leave]
- Archetype (optional): [Hero | Sage | ... ]
- References: admire [1 to 3, and what specifically]; avoid [1 to 2]
- Mode: [light | dark | both] | Density: [airy | balanced | dense]
- Constraints: [stack, accessibility bar, content volume, must-keep/avoid]

## Aesthetic

- Direction: [named theme, catalog style, or bespoke]
- Defining trait: [the structural rule that organizes everything]
- Signature move: [the single most memorable detail]

## Typography

- Display: [family] | source: [Fontshare/Google/foundry] | license: [OFL/...]
- Body: [family] | source | license
- Mono (if used): [family]
- Scale: ratio [e.g. 1.25 Major Third], base 16px | step | size | line-height | use | |------|------|-------------|-----| | display | [px] | [n] | hero | | h1 | [px] | [n] | page title | | h2 | [px] | [n] | section | | body | 16px | 1.6 | text | | small | 14px | 1.5 | meta |
- Weights: [e.g. 400/500/700] | Measure: 65-75ch | Tracking notes: [...]

## Color

- Strategy: [appropriateness note + how it differs from the indigo default]
- Distribution: 60 neutral / 30 brand / 10 accent
- Palette (role -> OKLCH | hex):
  - bg: oklch(...) | #...
  - surface: oklch(...) | #...
  - fg: oklch(...) | #...
  - muted: oklch(...) | #...
  - border: oklch(...) | #...
  - accent: oklch(...) | #...
  - accent-fg: oklch(...) | #...
  - success / warning / error: oklch(...) | #...
- Dark mode overrides (if both): [bg, fg, border, ...]

## Spacing, radius, shadow

- Spacing base: [4px | 8px], scale: [1,2,3,4,6,8 ...]
- Radius: [<= 2 values, e.g. 2px and pill]
- Shadow approach: [defined edge OR soft elevation, not both] -> [the rule]

## Layout and composition

- Grid: [12-col | modular | bento | editorial] | gutters/margins: [...]
- Spacing rhythm: [tight-within / loose-between rule]
- Signature layout move: [the one brief-specific composition decision]
- Density: [airy | balanced | dense] | Scanning: [F | Z]
- Responsive: [mobile-first | desktop-first] | breakpoints: [...]

## Components and states

- Button hierarchy: [primary filled / secondary outlined / tertiary text], states [hover/active/focus/disabled/loading]
- Inputs: [label style, validation timing, error pattern]
- Tables: [alignment, tabular-nums, separators, density]
- Overlays: [popover/sheet/modal usage, focus trap+return]
- Empty / loading / error: [the pattern for each]
- Focus ring: [box-shadow, accent, offset]

## Motion

- Duration scale: [instant/fast/normal/slow/sheet ms]
- Easing: [--ease-out, --ease-in-out, --ease-sheet values]
- What animates: [transform/opacity only] | reduced-motion: [fade swap]
- Signature motion (if any): [...]

## Iconography

- Set: [Phosphor | Tabler | custom | customized default] | grid: [24px] | stroke: [px] | caps/joins: [...] | radius match: [yes]

## Imagery and illustration

- Mode: [product screenshots | photography | illustration | device | mix]
- Rules: [lighting/grading | illustration spec | device technique]
- Avoid: [category stock cliches, AI fingerprint, corporate-Memphis]
- Text-over-image contrast: [the guarantee]

## Dark mode (if in scope)

- Base bg: [near-black L] | fg: [off-white] | elevation ramp: [L steps]
- Accent (dark): [lighter desaturated sibling] | border: [lighter than surface]

## Accessibility

- Contrast: [AA verified both modes] | Focus: [visible, managed]
- Keyboard: [fully operable] | Targets: [>=24px, 44 preferred]
- Color independence: [yes] | Reduced motion: [yes] | Notes: [...]

## Tokens (source of truth)

\`\`\`css :root { --font-display: ...; --font-body: ...; --font-mono: ...; /_ scale, spacing, radius, color in OKLCH _/ } @media (prefers-color-scheme: dark) { :root { /_ overrides _/ } } \`\`\`

- Adapter: [plain CSS | Tailwind v4 @theme | shadcn semantic tokens] (see adapters.md)

## Cards and surfaces

- Cards/surfaces: [border XOR shadow, radius, padding] | nesting: [avoid cards-in-cards]

## Slop audit

- Date: [date] | Result: [pass | fixed N tells]
- Notes: [tells caught and corrected; craft-layer and accessibility gate result]

## Changelog

- [date]: [what changed and why]
```

## Notes

- Express colors in OKLCH with a hex fallback so the file is both modern and portable; add CMYK/Pantone only if print is in scope.
- Keep DESIGN.md framework-agnostic in the Tokens section; the adapter line records which stack projection is in use.
- If the project already uses a different design-system file (a Tailwind config, a tokens.json, a vibes visual-direction doc), reconcile into DESIGN.md as the human-readable source of truth and note the link.
