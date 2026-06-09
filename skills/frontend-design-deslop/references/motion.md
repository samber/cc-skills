# Motion and animation

Motion is a design layer, not a finishing sprinkle. Good motion communicates causality (this opened from that), spatial relationships (this slid in from the edge), and state changes; it makes a product feel fast and physical. Bad motion is the opposite of deslop: bounce on everything, fade-up on every section, scale-on-hover by reflex. The default for most UI is restraint. The concrete values below come from production systems and from design engineers who ship motion (Emil Kowalski of Linear, author of Sonner and Vaul; Rauno Freiberg; Josh Comeau) and from Material, Carbon, and Apple. Treat the token blocks as copy-pasteable starting points.

## Contents

1. The two questions before animating
2. Duration scale
3. Easing: the heart of feel
4. Spring physics
5. Scale, origin, and masking
6. What to animate (performance)
7. Orchestration and staggering
8. Reduced motion and accessibility
9. Motion slop tells
10. Token set
11. Inspiration library (motion)

## 1. The two questions before animating

Before adding any animation, answer: does it communicate something (causality, hierarchy, state, spatial origin), and how often will the user trigger it? Animation that communicates earns its time budget. Animation on high-frequency or keyboard-initiated actions (a power user opening a menu 200 times a day) is friction; Raycast ships almost no animation and feels right because of it. The gate: animate meaningful, low-frequency transitions; do not animate frequent, utilitarian ones.

## 2. Duration scale

Most UI animations should stay under 300ms. A 180ms dropdown feels more responsive than a 400ms one. Rough map: micro feedback (button press, toggle, tooltip) 100 to 150ms; standard transitions (menus, popovers, fades) 150 to 250ms; larger surfaces (sheets, drawers, modals) 250 to 500ms, where ~500ms with an iOS-like curve makes a drawer feel substantial; full-screen or page transitions can run longer. Duration scales with travel distance and element size: a small tooltip is fast, a full-height sheet is slower. Build a token scale (see below) and pull from it rather than picking ad hoc milliseconds.

## 3. Easing: the heart of feel

Easing is what makes motion feel designed. Defaults:

- **ease-out for enter and most UI**: fast start, slow settle. It reads as a quick, responsive reaction to the user. This is the single most useful curve.
- **ease-in for exit only** when the element leaves the screen entirely; never for things the user is waiting on (it speeds up at the end and feels laggy).
- **ease-in-out for movement between two on-screen positions**.
- **linear** only for continuous loops (spinners, progress) and for opacity-only crossfades. The browser keyword curves are usually too weak. Prefer custom cubic-bezier curves for character. Useful authored curves: a strong ease-out `cubic-bezier(0.23, 1, 0.32, 1)`, a strong ease-in-out `cubic-bezier(0.77, 0, 0.175, 1)`, and an iOS-like sheet curve `cubic-bezier(0.32, 0.72, 0, 1)`. Production-system curves worth knowing: Material standard `cubic-bezier(0.4, 0, 0.2, 1)`, decelerate `cubic-bezier(0, 0, 0.2, 1)`, accelerate `cubic-bezier(0.4, 0, 1, 1)`; Material 3 emphasized `cubic-bezier(0.2, 0, 0, 1)`; IBM Carbon standard `cubic-bezier(0.2, 0, 0.38, 0.9)`. Tools: easings.co and cubic-bezier.com to author and feel curves.

## 4. Spring physics

Springs often feel more natural than bezier curves because they model real physics: an element has mass and settles like a physical object, and an interrupted spring redirects smoothly from its current velocity. Comeau's observation is that it is hard to make a nice bezier and easy to make a nice spring. Springs are parameterized by stiffness/response and damping rather than duration. SwiftUI's defaults are a useful reference: default spring is roughly response 0.55 and damping fraction 0.825; a snappy interactive spring is much shorter. On the web, springs come from libraries (Framer Motion, React Spring) or, increasingly, from the CSS `linear()` timing function, which approximates a spring with many sampled points and can overshoot past 1 to create a settle. Use springs for direct-manipulation and physical surfaces (drag, sheets, drawers); use eased durations for discrete state changes (a fade, a color change). A discipline check from Comeau: if more than roughly a fifth of your transitions need bespoke timing functions, your tokens are wrong.

## 5. Scale, origin, and masking

- **Never animate from scale(0)**. Start from about 0.9 to 0.97 so the element already has a shape and grows into place rather than materializing from nothing.
- **Transform-origin matters**. A popover or menu should scale from its trigger, not from its own center; wire the origin to the trigger position (Radix and Base UI expose a `--transform-origin` variable for this). Center-origin scaling on a corner-anchored menu is a tell.
- **Press feedback**: a subtle scale to 0.97 on `:active` reads as a physical press.
- **Blur to mask**: when crossfading between two states that do not line up, a small (~2px) blur during the transition hides the visual seam and reads as smooth.

## 6. What to animate (performance)

Animate only `transform` and `opacity`. These are composited on the GPU and do not trigger layout or paint, so they stay at 60fps. Animating `width`, `height`, `top`, `left`, `margin`, or `box-shadow` forces layout/paint and janks; achieve the same effects with `transform: scale()` / `translate()` and with opacity. CSS transitions are interruptible mid-flight (good for hover and toggles that can reverse); keyframe animations are not, so use transitions for reversible state and keyframes for fire-and-forget. Keep `will-change` rare and targeted.

## 7. Orchestration and staggering

When multiple elements enter (a list, a menu of items, a grid), stagger them by a small delay (roughly 20 to 50ms each) so they cascade rather than appearing as a block; this guides the eye and reads as crafted. But staggering everything, everywhere, is itself a tell. Orchestrate only where the sequence means something (items arriving) and keep total sequence time within the duration budget so the user is never waiting on choreography.

## 8. Reduced motion and accessibility

Honor `prefers-reduced-motion`. Motion can trigger vestibular discomfort; large movement, parallax, and scaling are the risky kinds, while opacity fades are generally safe. The robust pattern inverts the default: define no transition by default and enable motion inside `@media (prefers-reduced-motion: no-preference)`, or, when reduced motion is requested, swap movement for an opacity-only fade rather than removing feedback entirely. Avoid the blunt global override that zeroes all animation durations; it can break JS-driven springs and removes safe fades along with the harmful motion. Gate hover-triggered animation behind `@media (hover: hover)` so touch devices do not fire phantom hover states.

## 9. Motion slop tells

- Bounce or elastic easing on ordinary UI (reserve bounce for genuinely celebratory moments).
- Animate-everything: every element has a transition by reflex.
- Identical fade-in-up on every section (same opacity plus translateY plus duration plus easing across four or more blocks).
- Image-scale-on-hover applied to every image by default.
- Parallax overuse and scroll-jacking (hijacking the scroll speed or direction).
- Missing exit animations (things appear smoothly but vanish instantly).
- Animating layout properties (width/height/top/left) instead of transform.
- Default browser easing everywhere; wrong transform-origin on menus and popovers.
- Animating high-frequency actions.

## 10. Token set

```css
:root {
  /* Durations */
  --duration-instant: 100ms; /* tooltips, toggles, press feedback */
  --duration-fast: 150ms; /* dropdowns, small popovers */
  --duration-normal: 200ms; /* standard transitions, fades */
  --duration-slow: 300ms; /* larger panels */
  --duration-sheet: 500ms; /* sheets, drawers (with the iOS curve) */

  /* Easings (custom; the browser keywords are too weak) */
  --ease-out: cubic-bezier(0.23, 1, 0.32, 1); /* enter, most UI */
  --ease-in-out: cubic-bezier(0.77, 0, 0.175, 1); /* on-screen movement */
  --ease-sheet: cubic-bezier(0.32, 0.72, 0, 1); /* iOS-like drawers */
  --ease-exit: cubic-bezier(0.4, 0, 1, 1); /* leaving the screen */
}

/* Default: no motion. Opt in when the user has not asked to reduce it. */
@media (prefers-reduced-motion: no-preference) {
  .animated {
    transition:
      transform var(--duration-fast) var(--ease-out),
      opacity var(--duration-fast) var(--ease-out);
  }
}
```

## 11. Inspiration library (motion)

Transpose the named principle, not a clone. Inspiration only.

- **Linear**: motion exists to prove the product is fast; transitions are short and purposeful. Transpose sub-200ms, communicative-only motion.
- **Stripe**: restrained, smooth transitions that never delay the task. Transpose calm enter/exit with custom ease-out.
- **Vercel**: a hero build-log animation that is itself a product demo. Transpose motion-as-demonstration of the product.
- **Family (iOS)**: spring-based tray with text that morphs between states. Transpose physical springs for direct-manipulation surfaces.
- **Vaul and Sonner** (Emil Kowalski): the iOS-curve drawer at ~500ms and the deliberately elegant, slightly slower toast. Transpose the edge-origin sheet curve and the dismissal threshold.
- **Raycast**: almost no animation on frequent actions. Transpose the restraint on high-frequency interactions.
- Reference reading to encode tasteful defaults: animations.dev (Emil Kowalski), joshwcomeau.com (springs, reduced motion), rauno.me/craft (interaction details).
