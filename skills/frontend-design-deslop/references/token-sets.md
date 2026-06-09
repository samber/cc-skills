# Token sets

Four ready-to-use directions, each deliberately outside the indigo/violet default, each with one named signature move. Hex values are authoritative where given (verified against official sources); OKLCH is used for new tokens. Drop one into `token-core.css` and adapt per `adapters.md`.

## Set 1 - Editorial Ink

High-contrast newsprint. Dominant near-black ink, single warm accent. (This is the default already in token-core.css.)

```css
:root {
  --font-display: "Fraunces", Georgia, serif;
  --font-body: "Newsreader", Georgia, serif;
  --color-bg: #f7f5f2; /* warm paper, deliberate */
  --color-fg: #1a1c1e; /* deep ink, ~oklch(0.22 0.004 250) */
  --color-accent: #b8422e; /* brick red, ~oklch(0.53 0.15 30) */
  --radius: 2px; /* near-sharp */
}
```

Signature move: a thick brick-red horizontal rule under section headings; real columns and drop caps; zero cards.

## Set 2 - Terminal / Nord

Developer-native dark. Nord values verified from nordtheme.com.

```css
:root {
  --font-display: "JetBrains Mono", ui-monospace, monospace;
  --font-body: "IBM Plex Mono", ui-monospace, monospace;
  --color-bg: #2e3440; /* nord0 Polar Night */
  --color-surface: #3b4252; /* nord1 */
  --color-fg: #eceff4; /* nord6 Snow Storm */
  --color-accent: #88c0d0; /* nord8 Frost, primary accent */
  --color-accent-2: #a3be8c; /* nord14 Aurora green */
  --color-danger: #bf616a; /* nord11 Aurora red */
  --radius: 3px;
}
```

Signature move: monospace everything (not just code), ANSI frost/aurora accents, optional blinking-cursor or CRT touch. Alt scheme (Solarized, verified ethanschoonover.com): base03 `#002B36`, blue `#268BD2`, yellow `#B58900`, cyan `#2AA198`, green `#859900`.

## Set 3 - Neo-Brutalist Pop

Signature move IS the visual identity: hard offset shadow + thick black borders.

```css
:root {
  --font-display: "Clash Display", sans-serif; /* Fontshare */
  --font-body: "Satoshi", sans-serif; /* Fontshare */
  --color-bg: #fffdf5;
  --color-fg: #000000;
  --color-accent: #ffc53d; /* Radix Amber-9, dark text on it; ~oklch(0.835 0.146 86) */
  --color-accent-2: #29a383; /* Radix Jade-9; ~oklch(0.648 0.123 165) */
  --border: 3px solid #000;
  --shadow: 6px 6px 0 #000; /* hard, no blur, THE signature */
  --radius: 0; /* sharp corners */
}
```

Signature move: solid 6px offset black shadow (no blur), 3px black borders, flat saturated fills, zero radius. Note: Amber/Sky/Mint/Lime/Yellow Radix-9 values are tuned for dark foreground text.

## Set 4 - OKLCH Single-Accent Minimal

Swiss restraint. One vivid accent on perceptually-even grays. Authored entirely in OKLCH.

```css
:root {
  --font-display: "Cabinet Grotesk", sans-serif; /* Fontshare */
  --font-body: "General Sans", sans-serif; /* Fontshare */
  --color-bg: oklch(0.99 0 0);
  --color-fg: oklch(0.22 0.01 250);
  --color-muted: oklch(0.55 0.01 250);
  --color-border: oklch(0.9 0.005 250);
  --color-accent: oklch(0.7 0.12 195); /* teal, far from indigo */
  --color-accent-fg: oklch(0.99 0 0);
  --radius: 0.375rem;
}
.dark {
  --color-bg: oklch(0.16 0.01 250);
  --color-fg: oklch(0.96 0 0);
  --color-border: oklch(0.3 0.01 250);
}
```

Signature move: strict grid, one teal accent used only on links/CTAs/focus, generous negative space, everything else perceptually-even grays. Swap accent hue by changing one number (H): orange `oklch(0.70 0.19 40)`, grass `oklch(0.65 0.14 145)`, crimson `oklch(0.64 0.22 0.6)`.

## Radix step-9 reference (solid accents)

Teal `#12A594`, Jade `#29A383`, Amber `#FFC53D`, Crimson `#E93D82`, Grass `#46A758`, Bronze `#A18072`. Use step 9 as the pure solid; override it to inject a brand color. Iris (`#5B5BD6`) is in the indigo/violet band — avoid it as a default accent per the color strategy in `color-oklch.md`.

## Shared motion tokens (all sets)

Motion is orthogonal to palette; reuse one scale across every set. ease-out under 300ms is the default; animate transform and opacity only. See `motion.md`.

```css
:root {
  --duration-instant: 100ms;
  --duration-fast: 150ms;
  --duration-normal: 200ms;
  --duration-slow: 300ms;
  --duration-sheet: 500ms;
  --ease-out: cubic-bezier(0.23, 1, 0.32, 1);
  --ease-in-out: cubic-bezier(0.77, 0, 0.175, 1);
  --ease-sheet: cubic-bezier(0.32, 0.72, 0, 1);
  --ease-exit: cubic-bezier(0.4, 0, 1, 1);
}
```

Neo-brutalist exception: snappier, near-instant transitions (or none) suit the hard-edged aesthetic; skip smooth easing there.
