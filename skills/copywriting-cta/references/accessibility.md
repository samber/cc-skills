# Accessibility Checklist for CTA Blocks

A CTA that excludes readers with disabilities is a CTA that converts at a lower ceiling. This is also an EAA / WCAG compliance concern for any commercial European-facing content as of June 2025.

This file lists the WCAG 2.2 requirements that apply to end-of-article CTA blocks, with concrete pass/fail criteria. Apply all of these to every CTA you ship. There is no acceptable trade-off.

---

## 1. Color contrast (WCAG 2.2 SC 1.4.3 / 1.4.11)

### Text contrast
- **Normal text (< 18pt regular / < 14pt bold):** contrast ratio ≥ **4.5:1** against the background. AA requirement.
- **Large text (≥ 18pt regular / ≥ 14pt bold):** contrast ratio ≥ **3:1**. AA requirement.
- **AAA target (recommended for primary CTAs):** ≥ **7:1** for normal text, ≥ **4.5:1** for large text.

### Non-text contrast (UI components, button outlines, icons)
- **UI components (button boundaries, focus indicators, form fields):** contrast ratio ≥ **3:1** against the adjacent background. SC 1.4.11, AA requirement.

### Common failure: light-gray "Subscribe" text on white
"Subtle" gray-on-white CTAs (#999 on #FFF = 2.84:1) fail WCAG by a wide margin. The fix: use a darker text color (#595959 on #FFF = 7.02:1) or fill the button.

### How to check
- **Browser DevTools:** Chrome and Firefox both ship contrast checkers in the color picker of the inspector.
- **CLI / programmatic:** axe-core, pa11y, Lighthouse.
- **Quick web tools:** WebAIM Contrast Checker, Coolors Contrast Checker, Stark.

---

## 2. Touch target size (WCAG 2.2 SC 2.5.8)

- **Minimum target size:** ≥ **24×24 CSS pixels**. AA requirement, introduced in WCAG 2.2.
- **Recommended target size:** ≥ **44×44 CSS pixels**. AAA requirement, also the Apple HIG / Google Material guideline.

### Practical thresholds
- Button: minimum 44×44px tap target including padding. Even on desktop, this margin makes the button hittable on a touchpad without precision.
- Inline text links: ensure ≥ 24×24px hit area (typically achieved with line-height + padding around the link).
- Adjacent CTAs (e.g., "Subscribe" + "RSS" + "Mastodon"): require ≥ 8px spacing between targets so adjacent taps don't trigger the wrong link.

---

## 3. Semantic markup (WCAG 2.2 SC 4.1.2)

### Use the right element
- **Submitting a form (e.g., newsletter signup):** `<button type="submit">`. Always inside a `<form>` with an explicit `action` and `method`.
- **Navigating to another page:** `<a href="...">`. Not a `<button>` styled as a link, not a `<div>` with an onClick.
- **Toggling state in-place (e.g., expanding a section):** `<button type="button">`.

### Common failures
- `<div onClick={...}>` styled as a button: invisible to screen readers, not keyboard-focusable by default. Always replace with `<button>` or `<a>`.
- `<a>` with no `href` and an onClick: same problem. Use a `<button>`.
- `<button>` that navigates: technically works, but loses right-click "Open in new tab" and middle-click behavior. Use `<a>` for navigation.

---

## 4. ARIA — use sparingly, only when semantics are insufficient

### First rule of ARIA: don't use ARIA when native HTML works.

A `<button>Subscribe</button>` does not need `role="button"`. A `<a>` does not need `aria-label="link"`.

### When ARIA IS needed for CTAs
- **Icon-only button:** `<button aria-label="Subscribe to newsletter">📩</button>`. Without the label, a screen reader announces "button" with no purpose.
- **Button label that's ambiguous out of context:** "Read more" or "Click here" link should have an `aria-label` that names the destination ("Read more about [article title]"). Better: rewrite the visible text to be self-describing.
- **Form field without a visible label:** `<input aria-label="Email address">`. Better: include a visible `<label>` and link it with `for=`.

### Common failures
- `aria-label="Submit"` on a button that already says "Submit": redundant, can produce double announcements.
- `role="button"` on a `<button>`: redundant, sometimes overrides native behavior in older AT.
- `aria-hidden="true"` on a focusable element: screen reader users see the focus, hear nothing. Use either `tabindex="-1"` to remove from focus or remove `aria-hidden`.

---

## 5. Keyboard support (WCAG 2.2 SC 2.1.1 / 2.4.7)

- **Every CTA must be reachable by Tab and activatable by Enter (and Space for `<button>`).** This is automatic with native `<button>` and `<a>`. Custom JS-driven CTAs require manual handling.
- **Focus indicator must be visible.** `outline: none` without an explicit replacement is a WCAG 2.4.7 failure.
- **Recommended focus style:** ≥ 2px solid outline with ≥ 3:1 contrast against both the button and the page background. WCAG 2.2 SC 2.4.11 (Focus Not Obscured) requires that the focused element be at least partly visible — no full overlay by sticky headers or footers.
- **Tab order must be logical.** If the visual order is "Primary CTA → Secondary text link", the DOM order must match.

---

## 6. Color-independence (WCAG 2.2 SC 1.4.1)

**Do not convey CTA state, importance, or affordance through color alone.**

### Common failures
- Only difference between primary and secondary CTA is color: colorblind users (~8% of male readers) cannot distinguish them. Add a visual difference (filled vs. outlined, larger vs. smaller, button vs. text link).
- Error states shown only with red text: pair with an icon or explicit text ("Error:").
- Required form fields shown only with red asterisk color: include the asterisk as a character and the word "(required)".

### Apply to CTAs
- Primary CTA: filled background + bold text + larger size. Not just "the blue one."
- Visited state: include underline or bold change, not just color shift.

---

## 7. Forms specifically (newsletter signup blocks)

- **Visible label** for every input (not just placeholder text — placeholder disappears on focus and is low-contrast).
- **`label for=` linking** to the input's `id`.
- **Inline validation** announced to screen readers via `aria-live="polite"` or `aria-describedby` on the input pointing to the error message.
- **Error messages** placed near the field, not floated at the top of the form.
- **Submit button** with descriptive text ("Subscribe to the newsletter", not "Submit").
- **GDPR / consent checkbox** (where required): visible label, not pre-checked by default (EU law), with link to privacy policy.

---

## 8. Motion (WCAG 2.2 SC 2.3.3)

- **Animated CTAs (pulsing, bouncing) must respect `prefers-reduced-motion`.** If a user has set that media query, freeze the animation.
- **Auto-scrolling sticky CTAs:** disable on `prefers-reduced-motion`.
- **Countdown timers** that animate: ensure the number itself is announced, not just visually counting. Use `aria-live="polite"` updates at coarse intervals (every 10s or 1m, not every second).

---

## 9. Screen reader announcements

Test with at least one screen reader:
- **macOS / iOS:** VoiceOver (Cmd+F5 / triple-click Home).
- **Windows:** NVDA (free) or JAWS.
- **Linux:** Orca.
- **Mobile Android:** TalkBack.

**Quick test:** turn on VoiceOver, navigate to the CTA via Tab, listen to the announcement. It should clearly state: (1) the action, (2) the element type. Example: "Subscribe to the newsletter, button" or "Get the template, link".

If the announcement is "button" or "link" with no purpose, the CTA fails.

---

## 10. Language and readability

- **Set `lang` attribute** on the page (`<html lang="fr">`). Affects pronunciation by screen readers and hyphenation.
- **For multilingual CTAs** (e.g., a French CTA in an English page), wrap in `<span lang="fr">...</span>` so screen readers switch voices.
- **Reading level:** aim for the lowest plausible Flesch reading-ease that doesn't insult the audience. Expert / niche audiences tolerate higher complexity; general / consumer audiences should target Flesch ~60+ (around grade 8-9).

---

## Compact pre-publication checklist

For every CTA, verify:

- [ ] Text contrast ≥ 4.5:1 (or 3:1 for large text)
- [ ] Button / non-text UI contrast ≥ 3:1
- [ ] Touch target ≥ 44×44px (recommended) or ≥ 24×24px (minimum)
- [ ] Native `<button>` or `<a>` (no `<div onClick>`)
- [ ] Keyboard-reachable (Tab) and activatable (Enter/Space)
- [ ] Focus indicator visible, ≥ 2px, ≥ 3:1 contrast
- [ ] No information conveyed by color alone
- [ ] Form has visible labels (not just placeholders) and `label for=`
- [ ] Icon-only buttons have `aria-label`
- [ ] `prefers-reduced-motion` honored for any animation
- [ ] Screen reader announces purpose, not just element type
- [ ] `lang` attribute set; multilingual content wrapped with `lang=`

If you can't tick every box, fix the failures before shipping. There is no "we'll do accessibility later" — readers excluded today are conversions lost forever.
