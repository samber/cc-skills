# Dark mode and theming

Dark mode is a design problem, not an inversion. Flipping a light palette produces a UI that looks like someone dimmed the lights rather than designed for the dark: pure-black backgrounds that vibrate, shadows that vanish, accents that glare. Theming is the broader discipline of expressing one design system in multiple modes (light, dark, brand themes) from one set of semantic tokens. Both come down to driving everything through semantic tokens and redefining those tokens per mode. The specs below are concrete starting points.

## Contents

1. Theming through semantic tokens
2. Dark mode is not an inversion
3. Backgrounds: never pure black
4. Elevation via lightness, not shadow
5. Text: never pure white
6. Desaturating accents for dark
7. Borders, icons, and charts in dark
8. Mode switching mechanics
9. Dark mode and theming slop tells
10. Token set
11. References (inspiration)

## 1. Theming through semantic tokens

A theme is a set of values bound to semantic token names. Components reference semantic tokens (`--color-bg`, `--color-surface`, `--color-fg`, `--color-muted`, `--color-border`, `--color-accent`, `--color-accent-fg`, plus elevation and state tokens), never raw values. To add dark mode or a brand theme, redefine those same semantic tokens under a selector (`.dark`, `[data-theme="..."]`) or media query; nothing in the components changes. This is the three-layer discipline from adapters.md (primitive, semantic, component) applied to modes. The dark palette is a sibling of the light one, authored deliberately, not derived by inversion.

## 2. Dark mode is not an inversion

Light mode's job is legibility on a bright, high-reflectance surface. Dark mode's job is to manage contrast so text is readable but not harsh, and color is vivid but not aggressive, on a low-luminance surface. The same hex values behave differently on dark: light text on dark at full contrast can shimmer and fatigue, saturated accents glare, and pure black plus pure white is the harshest possible pairing. Design the dark palette for its own context.

## 3. Backgrounds: never pure black

Base the darkest surface on a very dark gray, not `#000`. A common base sits around 8 to 12 percent lightness (Material recommends roughly `#121212`; the 0x12 to 0x16 range is typical). Pure black causes halation (text appears to vibrate, worse for readers with astigmatism), shows OLED black-smear during scrolling, and leaves no room to express elevation by lightening surfaces. A near-black base, often tinted very slightly toward the brand hue, reads more intentional and warmer.

## 4. Elevation via lightness, not shadow

On dark, shadows barely register, so elevation is expressed by making higher surfaces lighter, not by drop shadows. Build an elevation ramp in lightness: base around L10, cards and raised surfaces L14 to L16, popovers and modals L18 to L20, each step roughly plus 3 to 4 L. Material models this as a translucent white overlay whose opacity grows with elevation (about 5 percent at the lowest raised level up to about 16 percent at the highest). The practical rule: the closer a surface is to the user, the lighter it is. Reserve actual shadows for genuine floating elements, and keep them subtle.

## 5. Text: never pure white

Body text on dark should be an off-white, not `#FFF`, to reduce glare and halation (around rgba(255,255,255,0.87) for primary text, lower opacities for secondary and disabled). Maintain the contrast tiers (primary, secondary, disabled) by stepping opacity or lightness, the same hierarchy logic as light mode.

## 6. Desaturating accents for dark

Saturated colors that work on white glare on dark. Lighten and desaturate accents for the dark theme: blues and cyans desaturated noticeably, reds and oranges slightly, greens nudged toward teal, and bright yellows usually redesigned toward amber. The principle: pick a lighter, less-saturated sibling of the light-mode accent rather than reusing the same value. Verify every text-on-surface and accent-on-surface pair still meets contrast (see accessibility.md). OKLCH makes this easy: raise L, lower C, keep H (see color-oklch.md).

## 7. Borders, icons, and charts in dark

Borders are lighter than the surface in dark, not darker. Icons should use `currentColor` so they follow the text color and do not disappear. Charts: desaturate series by roughly 15 percent, keep at least a 20 percent luminance gap between adjacent series so they remain distinguishable, and drop gridlines to white at 5 to 10 percent opacity.

## 8. Mode switching mechanics

Drive mode from a class or data attribute on the root plus `prefers-color-scheme` for the default. Do not animate a transition on the theme switch; transitioning every color at once is janky and slow, so suppress transitions during the swap (libraries like next-themes handle this). Respect the user's system preference as the default and remember an explicit override. Test both modes against the same accessibility bar; a palette that passes in light can fail in dark and vice versa.

## 9. Dark mode and theming slop tells

- Pure black (`#000`) backgrounds and pure white (`#FFF`) text.
- A straight inversion of the light palette.
- Drop shadows used for elevation on dark (where they do not read) instead of lightness steps.
- Glowing colored box-shadows by reflex (cyberpunk-by-default) when the brief is not neon.
- Fully saturated light-mode accents reused unchanged on dark, glaring.
- Borders darker than the surface in dark mode.
- A visible color-transition animation when toggling theme.
- Raw values scattered in components so only one mode can be themed.

## 10. Token set

```css
:root {
  /* Light (semantic) */
  --color-bg: oklch(0.99 0 0);
  --color-surface: oklch(0.97 0.005 250);
  --color-fg: oklch(0.22 0.01 250);
  --color-muted: oklch(0.55 0.01 250);
  --color-border: oklch(0.9 0.005 250);
  --color-accent: oklch(0.55 0.16 250); /* example brand hue */
  --color-accent-fg: oklch(0.99 0 0);
  /* Dark elevation ramp */
  --elev-0: oklch(0.16 0.01 250);
  --elev-1: oklch(0.2 0.01 250);
  --elev-2: oklch(0.24 0.01 250);
}

.dark,
[data-theme="dark"] {
  --color-bg: var(--elev-0); /* near-black, not #000 */
  --color-surface: var(--elev-1); /* raised = lighter */
  --color-fg: oklch(0.95 0 0); /* off-white, not #FFF */
  --color-muted: oklch(0.7 0.01 250);
  --color-border: oklch(0.3 0.01 250); /* lighter than surface */
  --color-accent: oklch(0.72 0.12 250); /* lighter, desaturated sibling */
  --color-accent-fg: oklch(0.16 0.01 250);
}

/* Suppress transitions during the theme swap */
.theme-switching * {
  transition: none !important;
}
```

## 11. References (inspiration)

- **Material dark theme guidance**: the `#121212` base, the white-overlay elevation model, and the desaturation rationale.
- **Radix dark color scales**: ready-made, contrast-tuned 12-step dark scales (see color-oklch.md) so you do not hand-roll elevation and state steps.
- **Apple dark mode (HIG)**: system semantic colors, elevation through material and lightness, and the principle that dark is a designed mode, not a filter.
