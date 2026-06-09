# Accessibility

Accessibility is a build-time discipline, not an audit you bolt on at the end. It also overlaps almost entirely with good design: clear hierarchy, sufficient contrast, visible focus, sane keyboard order, and meaningful feedback help everyone. This file consolidates the practical, implementation-level requirements that are otherwise scattered across the type and color references. The bar is WCAG 2.2 AA. Automated tools catch only a fraction of real issues, so manual keyboard and screen-reader testing is required regardless of any scan result.

## Contents

1. Contrast and color independence
2. Focus: visible and managed
3. Keyboard navigation
4. Target size and pointer
5. Forms accessibility
6. Names, roles, and ARIA basics for common components
7. Motion
8. WCAG 2.2 AA: the criteria that bite UI
9. Testing
10. Accessibility slop tells

## 1. Contrast and color independence

Text contrast: 4.5:1 for normal text, 3:1 for large text (about 24px, or about 18.66px bold). AAA is 7:1 and 4.5:1. Non-text UI (icons, control boundaries, focus indicators, chart elements that convey meaning) needs 3:1 against adjacent colors (1.4.11). Never convey information by color alone (1.4.1): pair status color with an icon, label, or shape, and verify the whole UI still reads in grayscale (this also proves hierarchy does not depend on hue). For data, provide the underlying numbers in an accessible table alongside any color-coded chart.

## 2. Focus: visible and managed

Every interactive element needs a clearly visible keyboard focus state. Use box-shadow for the ring, not outline, so it follows border-radius. WCAG 2.2 adds two focus criteria: the focus indicator must not be entirely hidden by sticky headers, footers, or banners (2.4.11 Focus Not Obscured), and the indicator itself must be substantial enough, at least the area of a 2px-thick perimeter around the element and at least 3:1 contrast between the focused and unfocused states (2.4.13 Focus Appearance). Manage focus across interactions: when a modal or dialog opens, move focus into it and trap it; when it closes, return focus to the trigger; never leave focus stranded on a removed element. Do not remove focus outlines without replacing them with something at least as visible.

## 3. Keyboard navigation

Everything operable by mouse must be operable by keyboard, in a logical order that matches the visual order. Composite widgets follow expected key patterns: menus and listboxes navigate with arrow keys (not Tab between every item), Escape closes overlays, Enter and Space activate, and editable lists support a delete shortcut. Do not put non-interactive elements in the tab order, and do not skip interactive ones. Custom controls (a div acting as a button) must add the role, tabindex, and key handlers a native element would have given for free; prefer native elements (`button`, `a`, `input`) precisely because they bring keyboard support and semantics already.

## 4. Target size and pointer

Interactive targets must be at least 24 by 24 CSS pixels, or have enough spacing that a 24px-diameter circle centered on each does not overlap its neighbors (2.5.8 Target Size Minimum). Padding counts toward the size. The AAA target is 44 by 44 (2.5.5), which is also the comfortable touch standard, so meeting 44px satisfies both. Any interaction driven by a dragging movement must have a single-pointer, non-drag alternative (2.5.7 Dragging Movements): drag-to-reorder needs move-up/move-down controls, a pannable map needs buttons, a draggable carousel needs arrows.

## 5. Forms accessibility

Every input has a programmatically associated visible label (not placeholder-as-label); clicking the label focuses the input. Group related fields (fieldset and legend, or an accessible grouping). Errors are conveyed in text, associated with the field, and announced; do not rely on red border alone. Keep the user's input on error and explain how to fix it. Use correct input types and autocomplete tokens so assistive tech and password managers work. WCAG 2.2 adds 3.3.8 Accessible Authentication: do not require a cognitive test (transcribing, solving a puzzle, retyping) to log in; allow paste and password managers. Also 3.3.7 Redundant Entry: do not make users re-enter information they already provided in the same flow.

## 6. Names, roles, and ARIA basics for common components

The first rule of ARIA is to prefer native HTML, which carries role and behavior for free. When you must add ARIA: icon-only buttons need an accessible name (`aria-label`); an HTML illustration or icon that conveys meaning needs a label, and a purely decorative one is hidden with `aria-hidden`. Common patterns: a modal uses `role="dialog"`, `aria-modal="true"`, and a labelled title; a toggle uses a native checkbox or `role="switch"` with `aria-checked`; a tab set uses `role="tablist"`/`tab`/`tabpanel` with `aria-selected` and arrow-key navigation; a disclosure uses `aria-expanded`. Live regions (`aria-live="polite"`) announce async feedback like toasts and validation summaries. Do not put interactive content inside a hover-triggered tooltip, and do not give disabled buttons tooltips (they are out of the tab order and never announced; surface the reason elsewhere).

## 7. Motion

Honor `prefers-reduced-motion` (see motion.md). Large movement, parallax, and scaling can cause vestibular discomfort; opacity fades are generally safe. The robust approach enables motion only under `(prefers-reduced-motion: no-preference)` or swaps motion for a fade when reduction is requested, rather than a blunt global zeroing. Avoid content that flashes more than three times per second (2.3.1). Do not auto-play motion or carousels without a pause control.

## 8. WCAG 2.2 AA: the criteria that bite UI

WCAG 2.2 (2023, also published as ISO/IEC 40500:2025) adds criteria over 2.1 and removed 4.1.1 Parsing. The ones that most often catch interface work: 2.4.11 Focus Not Obscured (Minimum), 2.4.13 Focus Appearance, 2.5.7 Dragging Movements, 2.5.8 Target Size (Minimum), 3.2.6 Consistent Help (help in the same relative place across pages), 3.3.7 Redundant Entry, and 3.3.8 Accessible Authentication. Treat these as a build checklist, not a post-hoc audit. The long-standing essentials still apply: contrast, keyboard operability, labels, headings in order (no skipped levels), alt text, and a logical reading and focus order.

## 9. Testing

Automated scanners (axe, Lighthouse, and similar) reliably catch only a portion of issues; published estimates of automated coverage vary widely (from roughly a tenth of success criteria fully detectable up to around half of issues by some vendor measures), so a clean automated pass is necessary but far from sufficient. Always also: tab through the entire interface with the keyboard only, operate every control without a mouse, run a screen reader over the key flows, test at 200 percent zoom and at the reflow width (320px), and verify in grayscale and with a color-blindness simulation (protanopia, deuteranopia, tritanopia). Verify both light and dark modes against the same bar.

## 10. Accessibility slop tells

- No visible keyboard focus state, or outlines removed and not replaced.
- Placeholder text used as the only label.
- Status or meaning conveyed by color alone.
- Icon-only buttons with no accessible name.
- Body text below 4.5:1 contrast, or off-white-on-near-white low-contrast fashions that fail.
- Custom controls (divs as buttons) with no keyboard support or role.
- Tiny targets below 24px with no spacing compensation.
- Drag-only interactions with no button alternative.
- Modals that do not trap or return focus; tooltips with interactive content.
- Motion that ignores `prefers-reduced-motion`.
