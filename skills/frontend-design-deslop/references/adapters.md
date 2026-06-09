# Adapters

The token core in `token-core.css` is the portable source of truth. Pick the adapter for the stack. The semantic token names stay constant across stacks so components are portable.

## Plain CSS (any framework, no build step)

Import the core, then reference variables directly.

```css
@import "./token-core.css";

.button {
  font-family: var(--font-body);
  background: var(--color-accent);
  color: var(--color-accent-fg);
  padding: var(--space-2) var(--space-4);
  border-radius: var(--radius);
  border: none;
}
.card {
  background: var(--color-bg);
  border: var(--border); /* edge, not shadow */
  border-radius: var(--radius);
  padding: var(--space-4);
}
```

## Tailwind v4 (@theme)

`@theme` generates utilities AND exposes tokens as runtime CSS variables. Declare tokens once; get `bg-accent`, `text-accent`, `font-display`, `rounded-card` automatically.

```css
@import "tailwindcss";
@import "./token-core.css";

@theme {
  --font-display: "Fraunces", serif;
  --font-body: "Newsreader", serif;
  --color-accent: oklch(0.53 0.15 30);
  --color-bg: oklch(0.97 0.008 95);
  --color-fg: oklch(0.22 0.004 250);
  --radius-card: 2px;
  --spacing: 0.25rem; /* base unit; p-4 = 1rem */
}
```

Usage: `<button class="bg-accent text-white font-body rounded-card px-4 py-2">`. Tailwind v4 ships its own palette in OKLCH, so custom OKLCH tokens sit naturally alongside it.

## shadcn/ui (semantic tokens)

shadcn components read semantic variables, so overriding them reskins every component at once. Override the default primary (which is otherwise the slop accent). On Tailwind v4, shadcn uses OKLCH and `@theme inline`.

```css
:root {
  --background: oklch(0.97 0.008 95);
  --foreground: oklch(0.22 0.004 250);
  --primary: oklch(0.53 0.15 30); /* replace the default */
  --primary-foreground: oklch(0.99 0 0);
  --muted-foreground: oklch(0.55 0.01 250);
  --border: oklch(0.85 0.01 250);
  --radius: 0.125rem; /* 2px, not the rounded-2xl reflex */
}
.dark {
  --background: oklch(0.18 0.01 250);
  --foreground: oklch(0.95 0.008 95);
  --border: oklch(0.32 0.01 250);
}
@theme inline {
  --color-background: var(--background);
  --color-foreground: var(--foreground);
  --color-primary: var(--primary);
  --color-primary-foreground: var(--primary-foreground);
}
```

## Optional: Open Props

For ready-made sizes, easings, and gradients in any stack: `@import "https://unpkg.com/open-props";` then reference `var(--size-3)`, `var(--ease-3)`, etc. Pure CSS variables, framework-agnostic.

## Three-layer token discipline (all stacks)

1. Primitives (raw): `--blue-9`, `--space-3`, `--font-mono`.
2. Semantic (purpose): `--color-bg`, `--color-fg`, `--color-accent`, `--color-border`.
3. Component (variant): `--button-bg`, `--card-radius`. Components reference semantic tokens, never raw primitives. Dark mode redefines the same semantic variables under `.dark` or the media query.
