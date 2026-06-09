# Iconography

Icons are a system, not a grab bag. Inconsistent stroke weights, mixed grids, and the default starter-kit set are quiet but reliable slop tells. A coherent icon system reads as care; the wrong default reads as a template. The mechanics below let you either build a small custom set or adapt an existing one so it stops looking generic. Named sets are inspiration, not endorsements; the right choice follows from the brand adjectives.

## Contents

1. The grid and live area
2. Stroke, caps, and joins
3. Corner radius as brand signal
4. Optical balance and equal weight
5. Pixel alignment
6. Filled vs outline, and sizing
7. When a default set becomes slop
8. Differentiating without drawing 300 icons
9. Accessibility
10. Icon system slop tells
11. Inspiration library (icon systems)

## 1. The grid and live area

Design or choose icons on one grid and never mix. The common standard is a 24 by 24 grid with a 2px stroke (Lucide, Tabler, Material). Sets designed for small sizes use a 16 by 16 grid (Phosphor) so detail survives. Define a live area inside the canvas with consistent padding (for example a 24 by 24 canvas with 2px padding gives a 20 by 20 live area), so icons share visual size even when their shapes differ. All icons in the set share the same canvas, padding, and stroke, or they will not sit together.

## 2. Stroke, caps, and joins

Pick one stroke width and hold it across the set (2px on a 24px grid is typical). Decide how the stroke scales: some sets scale stroke mathematically with size (Lucide's default), others keep it visually constant via an option, others are hand-drawn per weight (Phosphor's six weights are individually optimized rather than interpolated). Standardize line caps (round vs butt) and joins (round, miter, bevel). Round caps and joins read softer and friendlier; butt caps and miter joins read more technical and precise. These two choices, applied consistently, are most of what makes a set feel like one voice.

## 3. Corner radius as brand signal

The corner radius on icon shapes carries personality the same way component radius does. 0px corners read technical, serious, industrial. 2 to 4px reads friendly and contemporary. Large radii read playful or soft. Match the icon radius to the overall radius decision in the token set so icons and components agree. A mismatch (sharp icons in a soft-radius UI) is subtly wrong.

## 4. Optical balance and equal weight

Mathematical equality is not visual equality: a circle at the same bounding box as a square looks smaller, so it must be drawn slightly larger to read as the same size. Use the squint test (blur your eyes; misweighted icons jump out). The goal is that every icon in the set carries the same optical weight, so emphasis in the UI comes from color and context, never from one icon being heavier or larger by accident.

## 5. Pixel alignment

Snap icon coordinates to whole pixels where possible, and offset by 0.5px when a 1px or odd-width stroke would otherwise straddle a pixel boundary and blur under anti-aliasing. Crisp icons at the sizes you actually ship matter more than mathematical purity in the source file. Test at the real rendered sizes, not zoomed in.

## 6. Filled vs outline, and sizing

Decide the primary style (outline is the contemporary default; filled reads bolder and works for active or selected states). A common pattern: outline by default, filled for the selected nav item. Do not scale a 16px-designed icon up to 48px and expect it to hold; redraw a simplified or more detailed version per size band (small, default, large), as you would for type. Optical-size axes (Material Symbols) do this automatically.

## 7. When a default set becomes slop

Excellent icon sets become tells purely through ubiquity in starter kits and AI output. Lucide is the shadcn default and is now baked into countless templates and generated components, so it signals "generic template" even though it is well made. Heroicons (by the Tailwind team) is heavily used in templates and AI UI and reads as familiar rather than distinctive. The problem is not quality; it is that these are the statistical median of generated UIs. Using them is acceptable when nothing else fits and the rest of the system carries the identity, but they should not be the thing that defines the look.

## 8. Differentiating without drawing 300 icons

You rarely need a full custom set to escape the default. Options, cheapest first: switch to a distinctive set whose voice matches the brand (Phosphor for its weight range and friendly geometry, Tabler for breadth on a strict 24px/2px grid, Iconoir or Hugeicons for a distinct hand); adjust the default set's stroke width and corner radius to match your tokens (a 1.5px or 2.5px stroke instantly looks less like the 2px default); draw only the handful of brand-critical icons custom (the logo mark, the one or two icons that appear in the hero or nav) and use a consistent set for the long tail; or commit to one weight and one style rigorously, which alone reads as intentional. Whatever the choice, normalize stroke and grid across any mixed sources.

## 9. Accessibility

Icon-only interactive elements (icon buttons) require an explicit text alternative (`aria-label`) so screen readers announce the action. Decorative icons that sit beside a text label should be hidden from assistive tech (`aria-hidden`) to avoid double announcement. Icons that carry meaning on their own (a status indicator) must also encode that meaning in text or shape, never color alone. Ensure icon-bearing targets meet the minimum target size (see accessibility.md).

## 10. Icon system slop tells

- Mixed stroke widths or mixed grids across the set.
- The unmodified shadcn or Tailwind default set defining the entire look.
- Icons scaled far beyond their design size, blurring or thinning.
- The icon-tile-above-heading feature card as the universal content shape (this is a layout tell as much as an icon one; vary the feature presentation).
- Emojis standing in for a real icon system.
- Sharp icons in a soft UI or vice versa (radius mismatch with the token set).
- Icon-only buttons with no `aria-label`.

## 11. Inspiration library (icon systems)

Inspiration for voice and construction, not a mandate.

- **Phosphor** (Helena Zhang and Tobias Fried): six hand-drawn weights from thin to fill plus duotone, friendly and organic, designed at 16px. Transpose the idea of one family carrying state through weight rather than swapping sets.
- **Tabler** (Pawel Kuna): thousands of icons on a consistent 24px grid with a 2px stroke across outline and filled. Transpose the breadth-with-consistency model when you need wide coverage.
- **Material Symbols**: variable optical-size, weight, and grade axes adjusted together. Transpose the optical-size-per-display-size discipline.
- **Lucide and Heroicons**: clean and geometric, excellent but now default; useful as a base to customize (change stroke and radius) rather than ship unmodified.
- **Iconoir, Hugeicons**: distinct hands for escaping the default look entirely.
