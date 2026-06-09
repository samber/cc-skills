# Component and interaction craft

This is the "expert at designing an application" layer: the part most AI output skips. A beautiful theme on top of careless components still reads as amateur. Components are judged by their states and their behavior under real conditions (loading, empty, error, dense data), not by their resting appearance. The discipline below draws on Refactoring UI (Wathan and Schoger), Rauno Freiberg's interface guidelines, Nielsen Norman Group, and the patterns codified by Apple HIG, Material Design 3, IBM Carbon, Atlassian, Shopify Polaris, and GitHub Primer. Mine those systems for any component not covered here.

## Contents

1. The universal state matrix
2. Buttons
3. Forms and inputs
4. Tables and data grids
5. Navigation and command surfaces
6. Overlays: modals, dialogs, sheets, drawers, popovers
7. Feedback: toasts, inline validation, optimistic updates
8. Empty, loading, and error states
9. Interaction details that separate expert from default
10. Component slop tells
11. Inspiration library (components)

## 1. The universal state matrix

Every interactive component needs every state specified, not just its default. The matrix: default, hover, active/pressed, focus (keyboard-visible), disabled, loading, error, and where relevant selected and read-only. Two rules prevent the most common defects. First, font weight must not change between states (regular to bold on hover or selected) because it shifts layout; change color, background, or a border instead, or reserve space for the bold weight. Second, use box-shadow for focus rings, not outline, so the ring follows border-radius (older Safari ignored radius on outline). Specify the matrix once per component and reuse it.

## 2. Buttons

Hierarchy by importance, not by semantic color. One primary action per view (solid, highest contrast), secondary actions (outlined or low-contrast fill), tertiary actions (styled like text or links). Do not paint every button with its meaning (green save, blue edit, red delete); that destroys hierarchy. Destructive actions get the loud red treatment only when destruction is the primary action of that surface, such as the confirm button inside a delete dialog; elsewhere a delete is a quiet tertiary action. Always: a hover state, an active/pressed state (a subtle scale to 0.97 or a darkened fill reads as physical), a keyboard focus ring, and a disabled state. Async buttons need a loading state and should disable on submit to prevent duplicate network requests. Size by context: comfortable touch targets (at least 44px tall) on mobile and primary CTAs, tighter in dense toolbars. Label with a verb describing the outcome ("Create project", not "Submit").

## 3. Forms and inputs

Forms are where craft is most visible and most often missing.

- **Labels**: every input has a visible label, not placeholder-as-label (placeholders vanish on focus and fail accessibility). Clicking the label focuses the input (wrap the input in the label or use `for`/`id`).
- **Submission**: wrap fields in a real `<form>` so Enter submits; do not rebuild this in JS.
- **Types and attributes**: use the correct `type` (email, tel, url, number) to get the right mobile keyboard and built-in validation; add `required`; set `inputmode` where useful; disable spellcheck and autocomplete where they hurt (names, codes) and enable them where they help.
- **iOS zoom**: input font-size at least 16px on touch, or iOS Safari zooms the viewport on focus.
- **Autofocus**: autofocus the first field on desktop; do not autofocus on touch, because it opens the keyboard over the screen before the user is ready.
- **Affixes**: position prefix/suffix icons or units absolutely inside the input with padding, so they sit within the field and clicking them focuses the input, rather than as separate adjacent boxes.
- **Validation**: validate at the right moment (on blur or on submit, not on every keystroke for format errors), show the error inline next to the field, highlight the offending field, keep the user's input, and explain how to fix it. Never clear the form on error.
- **Toggles and instant controls**: switches, checkboxes that filter, and segmented controls take effect immediately with no separate confirm; reserve Save for forms that batch changes.

## 4. Tables and data grids

- **Alignment**: left-align text, right-align numbers so decimals and magnitudes line up for comparison, and align headers with their column's content.
- **Numerals**: use `font-variant-numeric: tabular-nums` for any column of figures, IDs, timestamps, or anything that should align vertically, so digits share a fixed width.
- **Separation**: prefer light horizontal row separators or generous row padding over heavy full borders; zebra striping is optional and earns its keep only at high density. Avoid a grid of heavy lines (chart junk for tables).
- **Scroll**: sticky header on vertical scroll; pin the identifying first column on horizontal scroll; provide a totals or summary row for numeric tables.
- **Density**: pick a density for the page and keep it; do not mix loose and tight rows in one view. Use surface color and dividers to create zones in dense layouts rather than more borders.
- **Sorting and actions**: indicate sortable columns and current sort; keep row actions discoverable (visible or on row hover with a keyboard-accessible fallback).

## 5. Navigation and command surfaces

Choose sidebar vs topbar by information architecture depth: sidebar for many sections and nested areas, topbar for shallow IA and marketing. Breadcrumbs for deep hierarchies. For power-user products, a command palette (the cmd-K pattern) is the fastest navigation and action surface; the cmdk library by Paco Coursey is the de facto React implementation. Make the current location obvious (one accent on the active item, never weight change). Dropdown and menu triggers can open on mousedown rather than click for perceived immediacy. For nested menus, use a prediction cone (a triangular safe zone toward the submenu) so the pointer can travel diagonally without the submenu closing.

## 6. Overlays: modals, dialogs, sheets, drawers, popovers

Use the lightest overlay that fits: a popover for a small contextual choice, a sheet or drawer for a focused subtask, a modal dialog only for a decision that must block the flow. Requirements: trap focus inside while open, return focus to the trigger on close, close on Escape, close on backdrop click for non-destructive dialogs, and scale or slide from a sensible origin (a popover scales from its trigger via a transform-origin variable, not from center; a sheet slides from the edge). Drawers should resist accidental dismissal (a short delay or velocity threshold before drag-to-dismiss fires). Keep modals shallow; a modal that opens another modal is a flow smell.

## 7. Feedback: toasts, inline validation, optimistic updates

Give feedback where the action happened. A copy-to-clipboard button shows an inline checkmark on itself, not a toast across the screen. Toasts are for background or cross-surface events (saved, synced, failed), are brief, stack sanely, and never carry the only copy of an error the user must act on. Prefer optimistic updates for local actions: apply the change immediately, then reconcile with the server and roll back visibly with an explanation if it fails. Server-side gate redirects (auth) before the client renders so the user never sees a flash of the wrong screen.

## 8. Empty, loading, and error states

These are first-class screens, not afterthoughts.

- **Empty states**: explain what the feature is and prompt the first action, ideally with a template or example to remove the blank-canvas problem. Lead with a verb. A good empty state teaches; a bad one is a sad icon and "No data".
- **Loading**: use skeletons that mirror the eventual layout for content, spinners only for short indeterminate waits; preserve layout so content does not jump in. Show progress for long operations.
- **Error**: say what went wrong, why if known, and the next step; keep the user's context and work. Distinguish recoverable (retry) from terminal. Never dead-end.

## 9. Interaction details that separate expert from default

- Disabled buttons should not show tooltips (they are out of the tab order and never announced); explain the disabled reason elsewhere or keep the button enabled and validate on click.
- Keyboard-navigable lists: arrow keys to move, Enter to open, a delete shortcut where relevant.
- Do not animate high-frequency or keyboard-initiated actions; speed beats delight there (see motion.md).
- Respect the platform: a web app that fights browser conventions (custom scrollbars that break, hijacked Cmd-F) frustrates.
- Make hit targets larger than their visible icon; pad the clickable area.

## 10. Component slop tells

- Components with only a resting state (no hover, focus, active, disabled, loading).
- Placeholder text used as the label.
- Buttons colored by meaning instead of ranked by importance.
- Tables with center-aligned numbers, proportional (non-tabular) numerals, or heavy full borders.
- Modal-on-modal; toasts carrying must-act errors; no empty/loading/error states.
- Layout shift on hover or selection (weight change), focus rings that ignore radius (outline instead of box-shadow).
- The icon-tile-above-heading feature card as the universal content shape (see iconography.md).

## 11. Inspiration library (components)

Transpose the named behavior, not the visuals. Inspiration only.

- **Linear**: instant, keyboard-first interactions; command palette; near-zero perceived latency. Transpose the keyboard-first, low-latency interaction model.
- **Stripe Dashboard and Docs**: dense data presented calmly; docs-as-product with live, copyable examples. Transpose tabular-nums tables and inline copy feedback.
- **Raycast**: deliberate restraint, almost no animation on high-frequency actions. Transpose the no-animation-on-frequent-actions discipline.
- **Superhuman**: command-driven speed, every action keyboard-reachable. Transpose the everything-has-a-shortcut model.
- **Shopify Polaris / IBM Carbon / GitHub Primer (design systems)**: fully specified component state matrices, density guidance, accessible patterns. Transpose the rigor of specifying every state.
- **Family (iOS) and Vaul (web)**: spring-based sheets that resist accidental dismissal. Transpose the drawer dismissal threshold and edge-origin motion.
