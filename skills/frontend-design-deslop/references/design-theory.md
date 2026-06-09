# Design theory

The mechanisms behind every later choice. Read this once so the rest of the skill is reasoning, not rule-following. None of these are aesthetics; they are the physics of perception and interaction. When a layout, component, or motion decision feels arbitrary, one of these laws usually has the answer.

## Contents

1. Visual hierarchy (the master tool)
2. Gestalt principles applied to UI
3. CRAP: contrast, repetition, alignment, proximity
4. Signal vs noise and data-ink (Tufte)
5. Affordances and signifiers (Norman)
6. Interaction laws: Fitts, Hick, Jakob, Tesler, Miller
7. How these map to slop

## 1. Visual hierarchy (the master tool)

Hierarchy is the single most effective lever for making something feel designed (Wathan and Schoger, Refactoring UI). The reader's eye should land on things in the order of their importance. Build hierarchy from five controls, in rough order of strength: size, weight, color/contrast, spacing, and position. The common beginner mistake is making everything loud: bold the heading, color the label, box the section, shadow the card. Loud-everywhere is flat. To emphasize one thing, de-emphasize its neighbors. To make secondary text recede, lower its contrast rather than shrinking it to illegibility. Establish three tiers (primary, secondary, tertiary) and assign every element to one. Design in grayscale first so hierarchy comes from size/weight/space, then add color last and sparingly; if it reads in grayscale, color is decoration you can afford, not a crutch you depend on.

## 2. Gestalt principles applied to UI

The brain groups visual input automatically. Use these to imply structure without drawing boxes, borders, and arrows (which add noise). This is why a well-spaced bento grid reads as organized with no dividers at all.

- **Proximity**: elements placed close together are read as a group. The fastest way to relate a label to its input, or a caption to its image, is to move them closer and push everything else away. Proximity is stronger than a shared border.
- **Similarity**: elements that share a trait (radius, color, shadow, shape) are read as belonging to the same class. Consistent component styling is what makes a UI feel like one system. Breaking similarity deliberately (one differently-styled button) is how you signal "this is the primary action."
- **Common region**: a shared background or container groups items even when far apart. A subtle surface color groups a section more quietly than a 1px border.
- **Enclosure**: a border or background encloses and separates. Use the lightest enclosure that works; a faint surface beats a hard border beats a heavy shadow.
- **Continuity**: the eye follows lines and alignment. Aligned edges create invisible rails that guide scanning.
- **Closure**: the brain completes implied shapes. You can suggest a card or grouping with alignment and spacing alone.
- **Pragnanz (simplicity)**: the brain prefers the simplest interpretation. Reduce the number of distinct visual ideas per screen.

## 3. CRAP: contrast, repetition, alignment, proximity

Robin Williams' four principles, the most portable checklist in design.

- **Contrast**: if two elements are not the same, make them very different. Timid contrast (16px vs 18px, gray vs slightly-grayer) reads as a mistake. Push differences hard.
- **Repetition**: repeat visual motifs (a radius, a spacing unit, an accent, a type treatment) to unify and to teach the user the system.
- **Alignment**: nothing should be placed arbitrarily. Every element aligns to something. Strong left or grid alignment beats centered-everything.
- **Proximity**: group related items, separate unrelated ones, using space. A layout that passes CRAP rarely looks like slop, because slop is usually weak contrast plus arbitrary placement plus uniform spacing.

## 4. Signal vs noise and data-ink (Tufte)

For dashboards, data tools, and any dense interface: maximize the data-ink ratio. Every pixel that is not conveying information is a candidate for removal. Tufte's targets: erase non-data ink (heavy gridlines, chart borders, backgrounds, 3D effects, redundant labels), erase redundant data-ink, and revise. Concretely: prefer light row separators to heavy table borders, drop chart junk, label directly instead of with a legend when possible, and ask "what one decision does this view support?" before adding anything. One question per visualization. Density is fine; noise is not. A dense dashboard with a high data-ink ratio reads as expert; a sparse one full of decoration reads as a toy.

## 5. Affordances and signifiers (Norman)

From The Design of Everyday Things. An **affordance** is a possible action between an object and an actor (a button can be pressed). A **signifier** is the perceivable cue that reveals where and how to act (the button looks pressable: it has a fill, an edge, a label, a hover state). Norman's later clarification: most of what UI designers casually call "affordances" are really signifiers. The practical rule: interactive elements must signify their interactivity (cursor, contrast, affordance of depth or underline), and the system must give immediate feedback that the action registered. Flat design that strips all signifiers (no hover, no edge, link-colored-as-body-text) creates discoverability failures: users cannot tell what is clickable. Discoverability and feedback are the two qualities to protect.

## 6. Interaction laws: Fitts, Hick, Jakob, Tesler, Miller

- **Fitts's Law**: time to acquire a target grows with distance and shrinks with target size. Make primary actions large and place them where the cursor or thumb already rests. Screen edges and corners behave as infinitely large targets (the pointer cannot overshoot them), which is why macOS menu bars and full-bleed mobile tab bars work. Tiny far-away targets are a usability tax.
- **Hick's Law**: decision time grows logarithmically with the number and complexity of choices. Chunk long menus, use progressive disclosure, and default to a recommended option. A wall of equally-weighted options is slow; a clear primary plus a few secondaries is fast.
- **Jakob's Law**: users spend most of their time on other products, so they expect yours to work like those. Favor convention (logo top-left returns home, cart icon top-right, underlined links, search where search lives) unless novelty buys a real advantage. Deslop is not the same as breaking conventions; break the visual median, keep the interaction conventions.
- **Tesler's Law (conservation of complexity)**: every system has an irreducible amount of complexity. The question is who absorbs it. Push it onto the product (smart defaults, inference) rather than the user (more fields, more decisions).
- **Miller's Law (7 plus or minus 2)**: working memory is small. Chunk information; do not present long undifferentiated lists or forms. This underwrites grouping, stepped flows, and summary rows.

## 7. How these map to slop

Slop is usually a theory failure, not a taste failure. The AI-default look is flat (no signifiers), uniformly spaced (no proximity grouping), centered (no alignment intent), low-contrast (timid hierarchy), and decoration-heavy (low data-ink). Naming the violated principle is faster than naming the visual tell: "this section has no hierarchy" or "these cards have no proximity grouping" is more actionable than "make it less generic." When auditing, ask which principle each weak area violates, then fix the principle.
