# Color strategy and OKLCH

Color is a strategic decision, not an aesthetic preference. Snap judgments about products form within about 90 seconds and 62 to 90 percent of that assessment is color-driven; consistent color use can raise brand recognition by up to 80 percent. Color is a first impression that shapes all later perception. So choose for fit and differentiation, specify exactly, author in a perceptual model, and verify accessibility.

Frameworks below draw on Elliot and Maier (color-in-context), Singh (the 62 to 90 percent finding), Eiseman (color harmony), Neumeier (brand as gut feeling), and Blue Ocean strategy (Kim and Mauborgne).

## Contents

1. Color-in-context theory
2. The appropriateness principle
3. Blue Ocean differentiation (the strategic anti-indigo)
4. OKLCH primer and hue points
5. Color harmony systems
6. The 60-30-10 rule
7. Key mental models
8. Brand archetype color map
9. Industry conventions
10. Cultural considerations
11. Building the palette (roles)
12. Tints and shades
13. Neutrals
14. Color combinations and proportions
15. Accessibility and color blindness
16. Specification systems and output
17. Testing and validation methods
18. Common mistakes
19. Validation checklist

## 1. Color-in-context theory

Color effects are neither universal nor arbitrary; they depend on context. Meaning varies with the psychological context, some responses are biological and others learned, and hue, lightness, and chroma all matter. Red is danger in one context, attractiveness in another; urgency on a sale banner, warning in a health app, love on Valentine's. Always reason about the context the color will be seen in. Never treat a hue's meaning as fixed.

## 2. The appropriateness principle

Color effectiveness depends on perceived fit with the brand, product, and context. An appropriate color outperforms a theoretically better one that feels wrong. Blue works for finance because trust signals are expected there; it would not work for a children's candy brand. Appropriateness may be the single most important factor in color effectiveness.

## 3. Blue Ocean differentiation (the strategic anti-indigo)

In a crowded category everyone uses the same cues (a red ocean); find uncontested visual territory (blue ocean). For AI-generated UI, the indigo/violet band is the reddest ocean: it is the literal default. Avoid OKLCH hue ~250 to 320 for accents unless the brief demands it. Process: audit what competitors and the AI default use; find the absent or underused hue; check it still fits brand personality and audience; decide whether you can own it credibly. Precedents: Lufthansa yellow among blue airlines; T-Mobile magenta among blue/red telecoms; Apple white/silver among black/gray hardware; ING orange in blue banking; Tiffany trademarked its blue-green (PMS 1837) so the color alone triggers recognition.

## 4. OKLCH primer and hue points

Author in OKLCH because it is perceptually uniform: lightness matches perceived brightness, scale steps come out even without manual correction, and gradients avoid gray dead-zones. Format `oklch(L C H)`: L 0 to 1, C 0 to about 0.37 (sRGB max, P3 about 0.4), H 0 to 360. Hue points: red ~20, orange ~40, yellow ~90, green ~140, teal ~195, blue ~220, purple ~320. Accents far from indigo: orange `oklch(0.70 0.19 40)`, brick `oklch(0.53 0.15 30)`, crimson `oklch(0.64 0.22 0.6)`, grass `oklch(0.65 0.14 145)`, teal `oklch(0.70 0.12 195)`, amber `oklch(0.835 0.146 86)`. Chroma is gamut-limited per hue; high C at some hues (teal ~195) clips on sRGB. Verify at oklch.com and ship a hex fallback: `.accent{ background:#12A594; background:oklch(0.70 0.12 195); }`.

## 5. Color harmony systems

Based on traditional color theory (Newton's color wheel).

| Scheme | Description | Best for |
| --- | --- | --- |
| Monochromatic | one hue with tints, shades, tones | sophisticated, cohesive (Spotify greens) |
| Complementary | opposites (blue/orange, red/green) | maximum contrast, use sparingly |
| Analogous | three adjacent hues | harmonious, soothing |
| Triadic | three colors 120 degrees apart | vibrant, balanced; one primary, others accents |
| Split-complementary | base plus two neighbors of the complement | good contrast, less tension |

In OKLCH, build categorical sets by holding L and C and rotating H by 360/n; equal C gives equal visual weight.

## 6. The 60-30-10 rule

60 percent dominant/neutral (backgrounds, large areas), 30 percent secondary/brand (headers, nav, key elements), 10 percent accent (CTAs, highlights). Creates hierarchy without overwhelming and ensures the accent draws attention exactly where intended.

## 7. Key mental models

- Recognition compounds over time; consistency makes a color iconic (Coca-Cola red was not special at first).
- Differentiation over conformity; conforming to norms is safe, strategic difference often creates more value (T-Mobile magenta).
- The 90-second rule; color is a first impression, not decoration.
- Simplicity scales; complex palettes break down in real use. The simpler the palette, the more consistently it is applied.
- Saturation and brightness matter; bright saturated reads energetic and youthful, muted desaturated reads sophisticated and mature. Hue is only part of the equation.

## 8. Brand archetype color map

Useful when the brand has a clear archetype.

| Archetype | Colors                                 | Reads as               |
| --------- | -------------------------------------- | ---------------------- |
| Hero      | bold red, blue, gold, black            | power, achievement     |
| Sage      | blues, muted tones, gray, white        | wisdom, trust          |
| Outlaw    | black, red, electric                   | rebellion, disruption  |
| Innocent  | pastels, white, baby blue, pale yellow | optimism, purity       |
| Explorer  | earthy green, brown, orange, blue      | adventure, freedom     |
| Caregiver | soft blue, green, warm earth           | nurturing, compassion  |
| Creator   | bold unconventional combinations       | innovation, expression |
| Ruler     | deep purple, gold, black, navy         | authority, luxury      |
| Magician  | purples, deep blue, mystical tones     | transformation, vision |
| Lover     | reds, pinks, warm sensuous tones       | passion, intimacy      |
| Jester    | bright, playful, multi-color           | fun, spontaneity       |
| Everyman  | earthy, accessible, blue, green        | belonging, reliability |

## 9. Industry conventions

- Tech and finance: blue (trust, competence). Users: IBM, Chase, LinkedIn. Differentiate with purple (Twitch), green (Robinhood), magenta (T-Mobile).
- Healthcare and wellness: blue (trust), green (calm, less eye strain). Cool colors reduce anxiety.
- Food and beverage: red, yellow, orange (appetite, energy, urgency). Users: McDonald's, Coca-Cola.
- Luxury and premium: black, gold, deep navy, white. Restrained palettes, metallic accents, less is more.
- Eco and sustainability: green, earth tones, natural neutrals. Users: Whole Foods, Patagonia. Meeting a convention buys instant legibility; breaking it with fit buys recognition.

## 10. Cultural considerations

Meanings vary across cultures; research target markets and adapt.

| Color  | Western                  | Eastern/Asian    | Middle Eastern  |
| ------ | ------------------------ | ---------------- | --------------- |
| White  | purity, weddings         | mourning, death  | purity, peace   |
| Red    | danger, love             | luck, prosperity | danger, caution |
| Green  | nature, money            | youth, fertility | Islam, paradise |
| Yellow | happiness, warning       | courage, royalty | happiness       |
| Black  | sophistication, mourning | power, health    | mystery         |
| Blue   | trust, calm              | immortality      | protection      |
| Purple | royalty, luxury          | wealth, nobility | wealth          |

## 11. Building the palette (roles)

Keep 3 to 5 core colors plus neutrals and semantic states. Define by role, not raw hue, so components stay portable:

- Primary/brand (1, sometimes 2): the 30 percent.
- Accent/CTA (1): the 10 percent, highest contrast, drives action.
- Neutrals: bg, surface, border, muted-fg, fg (the 60 percent).
- Semantic states: success, warning, error (never color alone; pair with icon or text). Build a 12-step scale per important hue when you need depth (Radix model): 1 to 2 app/subtle bg, 3 to 5 component bg (normal/hover/active), 6 to 8 borders (subtle/normal/strong), 9 solid (pure, the value to override with a brand color), 10 solid hover, 11 low-contrast text, 12 high-contrast text. Radix Colors ships accessible APCA-tuned scales if you do not want to hand-roll.

## 12. Tints and shades

For each important color, generate a 100 (lightest) to 900 (darkest) ramp with 500 as the base, used for hover/active states, surfaces, and borders. In OKLCH, step lightness evenly and ease chroma down at the extremes so light tints do not look washed and dark shades do not muddy.

## 13. Neutrals

Do not use pure black or pure white. Soften to a near-black ink and an off-white, often tinted slightly toward the brand hue (lower the L and C of the brand color). State why: softer on the eyes, warmer, more intentional. On colored backgrounds use the same hue darker and desaturated, never gray.

## 14. Color combinations and proportions

Document approved combinations (primary, secondary, background, text, context) and combinations to avoid (clash, accessibility, cultural). Apply 60-30-10: neutral canvas, brand presence, accent for action.

## 15. Accessibility and color blindness

WCAG AA: 4.5:1 normal text, 3:1 large. AAA: 7:1 and 4.5:1. Test protanopia (red-blind), deuteranopia (green-blind), tritanopia (blue-blind). Never encode meaning in color alone; add icon, label, or pattern. Verify the palette in grayscale, which proves hierarchy does not depend on hue.

## 16. Specification systems and output

- RGB: additive, screens. `rgb(255,0,0)`. Largest gamut.
- HEX: six-digit RGB for web. `#FF0000`.
- CMYK: subtractive, print. `C0 M100 Y100 K0`. Smaller gamut; some screen colors dull in print.
- Pantone (PMS): pre-mixed spot color, exact brand matching. About 30 percent cannot be replicated in CMYK. Author and ship OKLCH for screen with a hex fallback; add HSL if helpful. Only add CMYK and Pantone when print is in scope. Document each color with its role and values.

## 17. Testing and validation methods

- Qualitative: focus groups (3 to 5 options, emotional reactions, fit), depth interviews (cultural and demographic nuance).
- Quantitative: A/B testing (CTR, conversion, behavior not stated preference), MaxDiff (forced ranking reveals true preference), implicit association (subconscious associations).
- Biometric: eye tracking and heatmaps (where attention lands first), facial coding (unconscious emotional reaction).

## 18. Common mistakes

Too many colors (cap at 3 to 5); copying competitors (you blend in); ignoring accessibility (excludes about 5 percent colorblind plus low-vision users); chasing trends (age fast); choosing by personal preference over audience psychology; cultural color blindness; inconsistent application across touchpoints.

## 19. Validation checklist

- Works in grayscale (hierarchy holds without color)?
- Passes WCAG AA for every text-on-bg pair?
- Accent sits outside the indigo/violet default band (unless briefed)?
- Distinct from direct competitors and from the AI default at a glance?
- 3 to 5 core colors, simple enough to apply consistently?
- Semantic states defined and never color-only?
- If global: meanings checked in target markets?
- If print: CMYK conversion and Pantone matching considered?
