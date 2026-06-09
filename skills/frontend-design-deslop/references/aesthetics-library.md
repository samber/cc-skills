# Aesthetics library

Pick ONE and execute its defining trait precisely. Each is anti-default by construction: none can be reached by sampling the SaaS-page median. Match implementation complexity to the aesthetic.

## Editorial / magazine

High-contrast serif display (Fraunces, Playfair Display, Boska, Bodoni Moda) paired with a clean body. Real columns, drop caps, pull quotes, rules and dividers instead of cards, generous measure (65-75ch). Reference: broadsheet newspapers, The Verge. Defining trait: typographic contrast and editorial scaffolding (rules, columns) replacing the card grid entirely.

## Terminal / monospace

Monospace family for everything (JetBrains Mono, IBM Plex Mono, Fira Code). Dark base, ANSI-derived accents (Nord, Solarized, Gogh schemes). Grid-of-text layout, blinking-cursor or CRT touches. Reference: developer tooling, TUIs. Defining trait: monospace UI (not just code blocks) with ANSI palette discipline.

## Neo-brutalism

The single most recognizable trait: hard offset drop shadow, solid, no blur, often colored. Plus thick black borders (2-3px), flat saturated color fills, sharp edges (zero radius), bold sans headlines at huge size. Buttons: thick border + flat fill + hard offset shadow. Reference: Gumroad, Figma brand refresh. Defining trait: `box-shadow: 6px 6px 0 #000` with no blur, thick borders, zero radius.

## Brutalism / raw

Raw unstyled-HTML feel, monochrome or one harsh accent, oversized sans or system/monospace type, exposed structure, visible grid, near-zero decoration, hard edges. High contrast (black on concrete-gray + one loud accent like acid green or red). Reference: brutalistwebsites.com, Drudge Report. Defining trait: deliberate absence of polish; structure exposed rather than hidden.

## Swiss / international typographic

Strict grid, sans-serif (Helvetica-class), restrained palette, generous negative space, typography as structure, left-aligned, asymmetric balance, no decoration. Reference: Josef Mueller-Brockmann. Defining trait: rigorous grid and one accent used with extreme restraint.

## Retro / skeuomorphic

Y2K chrome, brushed-metal panels, beveled buttons, period-correct type. Used deliberately and consistently, never as a fallback. Reference: early-2000s OS UIs, vaporwave. Defining trait: tactile depth and period commitment.

## Luxury / refined

Restrained palette (near-black, off-white, one metallic or jewel accent), large type, vast whitespace, slow deliberate motion, high-quality imagery treatment. Reference: fashion houses, premium hardware. Defining trait: restraint and space signaling premium.

## Organic / natural

Warm earthy palette, soft irregular shapes, hand-drawn or textured elements, humanist type. Reference: wellness and food brands. Defining trait: irregularity and warmth, the opposite of geometric precision.

## Industrial / utilitarian

Dense information, functional grid, monospace numerics, muted palette with one safety-orange or hazard-yellow accent, minimal ornamentation. Reference: aviation/control panels, data tools. Defining trait: density and function-first layout.

## Maximalist

Layered color, overlapping elements, multiple typefaces in tension, dense visual rhythm, intentional chaos. Reference: zine culture, experimental portfolios. Defining trait: controlled excess; every surface does something.

## Choosing

Match the aesthetic to the domain and audience, but bias toward commitment. A developer tool reads well as terminal or industrial; an essay site as editorial; a playful consumer app as neo-brutalist; a premium product as luxury or swiss. When unsure, state the chosen direction and why in one line, then proceed.

## Creating a brand-new theme from discovery

The catalog above is a set of starting points, not a closed list. The strongest, least generic results come from originating a bespoke aesthetic from the discovery context (the adjectives, visual word translations, archetype, references, and artifact type), rather than picking a label off the shelf. Use the catalog as raw material to combine and diverge from.

Method:

1. Read the inputs. Take the 3 to 5 adjectives, their visual word translations, the 3-word essence, the archetype, and the admired/avoid references from discovery.
2. Find the closest one or two catalog styles, then deliberately diverge. A bespoke theme is usually a base style plus a twist that comes straight from an adjective. "Editorial but warm" pulls Editorial toward humanist serifs and a soft accent; "Swiss but playful" keeps the grid and adds one bright accent and rounder shapes; "Terminal but premium" keeps monospace and dark base but swaps ANSI accents for a single jewel tone and adds generous spacing.
3. Translate each adjective into a concrete token decision. Each visual word translation should land on at least one of: type class, scale ratio, accent hue, spacing density, radius, shadow approach, motion. If an adjective changes nothing in the tokens, it is decoration, not direction; cut it or sharpen it.
4. Name the theme. A one or two word name (for example "Ledger", "Atelier", "Console", "Almanac") forces coherence and gives the project a vocabulary. The name is not cosmetic; it is the test of whether the direction is singular.
5. Define the defining trait (the structural rule that organizes everything, like Editorial's rules-instead-of-cards or Swiss's strict grid) and the signature move (the single most memorable detail). These two must be unique to this project and must not collide with the slop tells.
6. Derive the full token set from the above (type, color in OKLCH, spacing, radius, one shadow approach), then proceed to the gate and write it all to DESIGN.md.

Worked example. Discovery yields: artifact = developer tool landing page; adjectives = precise, calm, expert, quietly confident; essence = "quiet, technical, exact"; archetype = Sage; admires Linear and a Swiss rail timetable; avoid loud startup gradients.

- Closest catalog styles: Swiss and Terminal. Diverge by softening Terminal's neon and adopting Swiss restraint.
- Token decisions: "precise" -> strict 12-column grid, monospace numerals, hairline rules, radius 2px. "calm" -> low chroma, generous line height. "expert" -> dense but ordered information, IBM Plex Sans + IBM Plex Mono. "quietly confident" -> one deep teal accent used only on focus and primary action, near-black ink on warm off-white.
- Name: "Console". Defining trait: text-and-rule structure on a strict grid, no cards. Signature move: a single hairline accent rule that marks the active section, echoing a timetable.
- Result: a coherent, original theme that no median sampling would produce, fully specified and ready to write to DESIGN.md.

Reuse vs originate: if the user already has a DESIGN.md or brand assets, do not invent a theme. Read the existing DESIGN.md, honor its tokens, and extend it. Originate only for greenfield work.
