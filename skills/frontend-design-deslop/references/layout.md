# Layout and composition

Layout is where strategy becomes spatial. The default AI layout (centered max-width column, hero plus three equal cards, uniform gaps) is the most recognizable slop of all because it is the highest-probability arrangement. The fix is not novelty for its own sake; it is composing space with intent so hierarchy, grouping, and rhythm are visible. Named examples here are inspiration to transpose a single move from, never templates to clone.

## Contents

1. Spacing rhythm and the base unit
2. Fluid type and space
3. Grids: 12-column, modular, bento
4. Asymmetry and editorial composition
5. Whitespace as a tool
6. Scanning patterns and placement
7. Density by artifact type
8. Responsive strategy
9. Composition slop tells
10. Inspiration library (layout moves)

## 1. Spacing rhythm and the base unit

Pick one base unit and derive everything from it. 4px or 8px are standard; 4px gives finer control for dense UI, 8px enforces calm in marketing. Build a constrained scale (for example 4, 8, 12, 16, 24, 32, 48, 64, 96) rather than freehand values. The single most important rule: vary spacing by relationship, not uniformly. Space within a group is tight; space between groups is generous; space between sections is large. One uniform gap everywhere is a primary tell of unconsidered layout. Refactoring UI's heuristic: start with more whitespace than feels necessary, then remove until it feels right, never the reverse. Related elements (label and input, heading and its paragraph, icon and its text) move closer; unrelated elements move apart. This is proximity (see design-theory.md) made literal in pixels.

## 2. Fluid type and space

Use `clamp()` for headline type and large section spacing so the layout breathes across viewports without a dozen breakpoints: `font-size: clamp(2.5rem, 5vw, 4.5rem)`. Use rem for the min and max so user zoom is respected. Relative sizing does not scale linearly: large elements must shrink faster than small ones on small screens, so a 72px desktop hero might floor at 36px on mobile while 16px body stays 16px. Container queries (`@container`) let a component adapt to its container width rather than the viewport, which is the correct tool for components reused at different widths (a card in a sidebar vs a full-width grid).

## 3. Grids: 12-column, modular, bento

The 12-column grid is the workhorse because 12 divides into halves, thirds, quarters, and sixths. Primary content spans 6 to 8 columns, secondary 3 to 4. Establish a max content width and consistent gutters, then compose within them.

Bento grids (modular blocks of varying size, named after the compartmentalized Japanese lunchbox) are strong for showcasing diverse content (feature sets, dashboards, capability overviews) because Gestalt proximity and similarity make uneven blocks read as one organized whole, and they restack cleanly on mobile. Popularized by Apple product pages and Linear. Caution: bento-everything is now itself a 2025 to 2026 tell. Use it when content genuinely varies in size and importance, not as the default container for three equal features.

Modular and Swiss grids (see aesthetics-library.md) treat the grid itself as the visible structure: columns, baseline rhythm, and alignment are the design.

## 4. Asymmetry and editorial composition

Symmetry is safe and static; intentional asymmetry creates energy and directs the eye. Offset a heading from its supporting text, let an image bleed past the grid, stagger a two-column layout so the eye moves diagonally. Editorial layouts borrow from print: real columns, pull quotes, rules and dividers instead of cards, drop caps, a strong measure. The goal is at least one intentional, brief-specific layout move per page so the composition is not the default template. State the move (for example "asymmetric two-column hero with the product screenshot bleeding off the right edge") before building.

## 5. Whitespace as a tool

Whitespace is not empty; it is the primary signal of quality and confidence. The shared principle across Stripe, Linear, and Vercel: take the spacing that already feels generous, then add more. Macro whitespace (between sections, around the page) sets the calm; micro whitespace (line-height, padding inside controls, gaps in a group) sets legibility. Premium and editorial positioning lean on vast whitespace and large type; dense tools spend it carefully. Cramped-by-default is a slop tell; so is uniform whitespace with no rhythm.

## 6. Scanning patterns and placement

Eyes scan predictably. For text-heavy pages, the F-pattern: users read the top line, scan down the left edge, and dip right occasionally, so put the most important words at the start of headings and left-align body. For sparse, visual pages (landing, hero), the Z-pattern: top-left brand, top-right action, diagonal to the value proposition, then to the primary CTA bottom-right. Most critical content goes top-left; the primary CTA sits along the natural path. On dashboards, the most important metric goes top-left and the layout follows the decision the view supports.

## 7. Density by artifact type

Density must fit the job (see artifact-types.md). Dashboards and professional tools tolerate and often require high density: small type steps, tight rows, many elements per view, because power users scan and compare. Marketing, portfolio, and premium pages want air: few elements per view, large type, generous space. Matching density to the artifact is itself a deslop move; a marketing page with dashboard density feels cramped, a dashboard with marketing air feels empty and wastes the expert user's screen.

## 8. Responsive strategy

Decide mobile-first or desktop-first by audience and primary device. Consumer and content products: mobile-first, design the small screen as the real product. Dense professional tools and dashboards: desktop-first, then decide what to drop or restack for mobile (touch targets at least 24px, ideally 44px; fewer metrics on the go). Use a small set of breakpoints tied to content, not device names, and prefer fluid type/space and container queries to reduce breakpoint count. Test at 200 percent zoom and at the narrowest realistic width. Never let a fixed three-column grid simply squash; restack it.

## 9. Composition slop tells

- Hero plus three equal feature cards plus testimonials plus CTA as the only structure.
- Everything centered in a max-width container as the sole layout idea.
- Identical same-sized card grid as the only device for everything.
- Nested cards (cards inside cards inside cards).
- Uniform spacing everywhere with no tight-within / loose-between rhythm.
- Bento grid used by reflex for content that does not vary in size or importance.
- Centered long-form body text (reserve centering for short headings and one to two line blocks).
- A fixed grid that squashes instead of restacking on mobile.

## 10. Inspiration library (layout moves)

Transpose the named move, not the page. All names below are inspiration only.

- **Linear**: bento sections with subtle glow-bordered blocks; consistent rhythm across every screen. Transpose the disciplined block grid with one accent on active state.
- **Apple product pages**: bento for diverse capabilities, full-bleed imagery, dramatic vertical pacing. Transpose the alternation of full-bleed and contained sections.
- **Vercel**: a faint blueprint grid behind content; white on near-black; build-log animation in the hero. Transpose the structural background grid at low opacity.
- **Stripe**: generous whitespace, embedded live code samples beside prose, a confident single accent over near-monochrome. Transpose the product-in-the-hero (real interface, not stock).
- **Mercury**: premium minimalism, vast whitespace, restrained palette. Transpose the air-as-confidence pacing.
- **Editorial/broadsheet** (The Verge, magazine sites): columns, rules, pull quotes, drop caps. Transpose rules-and-columns replacing the card grid entirely.
- **Swiss reference** (Josef Mueller-Brockmann posters): rigorous grid, asymmetric balance, one accent. Transpose the visible grid as structure.
