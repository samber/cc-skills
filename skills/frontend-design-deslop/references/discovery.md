# Discovery

The intake that produces the design system. Strategy drives design: resolve what, who, and the adjectives before any visual. The question bank is generous on purpose; the asking is selective.

## Contents

1. Asking questions (CRITICAL)
2. Protocol
3. The five discovery phases
4. Commit to words
5. Core question bank
6. Personality sliders
7. Personality-to-token translation
8. Which questions matter, by artifact type
9. System governance (constant vs variable)
10. Human-sounding writing protocol
11. Reference transposition recipe

## 1. Asking questions (CRITICAL)

ALWAYS use the AskUserQuestion tool for ANY question to the user. Never ask questions as plain text output. The tool gives a guided, interactive experience with structured options the user can answer in one tap. Every single user question must go through this tool. (On claude.ai use `ask_user_input_v0`.) Use it to gather preferences before deciding, present options with clear tradeoffs, validate direction before building, and confirm outputs before finishing. Never make a significant design decision without user input; the result belongs to them. Discipline on top: batch related questions, give 2 to 4 concrete options each, infer from context first and confirm inferences, ask only the high-signal subset. Do not interrogate.

## 2. Protocol

1. Classify the artifact type (see `artifact-types.md`); type decides which questions matter.
2. Infer from context (prompt, domain, repo, existing brand) and state inferences so they are cheap to correct.
3. Ask the high-signal subset through the question tool. Offer to go deeper rather than front-loading.
4. Commit to words before designing.
5. Gather references: 1 to 3 sites admired (and what specifically), 1 to 2 to avoid, key competitors. If none and direction is unclear, web-search current strong examples of the type plus positioning and transpose.

## 3. The five discovery phases

Adapted from brand visual-direction practice. Run lightly for small jobs, fully for client work.

1. Synthesize strategy: extract purpose, values, positioning, audience, and the competitive (and AI-default) landscape to differentiate from.
2. Commit to words: 3 to 5 adjectives, a visual word translation for each, a single-minded proposition, and the 3-word aesthetic essence (see below).
3. Translate strategy to visual language: for each adjective and any archetype quality, define the concrete visual expression (type, color, space, motion, imagery).
4. Comprehensive direction: decide overall aesthetic and references, then type system, color strategy, spatial composition, motion, and supporting details.
5. System governance: define what stays constant and what may vary, the hierarchy of elements, and application priorities.

## 4. Commit to words (do before any visual)

The highest-leverage step.

- Lock 3 to 5 brand adjectives. These translate directly into type, color, density, and motion.
- Write a one-line visual word translation per adjective: adjective -> concrete visual move. Example: "precise" -> tight grid, monospace numerals, hairline rules; "warm" -> humanist sans, soft saturated accent, generous spacing; "bold" -> oversized display, high contrast, one loud accent.
- Distil a 3-word aesthetic essence capturing the overall feel (for example "quiet, technical, exact" or "bold, editorial, loud").
- State a single-minded proposition: the one impression the UI must leave. Only after the words are locked, move to Phase 1 of the skill.

## 5. Core question bank (ask the relevant subset, via the tool)

- Artifact and primary action: what is this, and what single outcome matters most (sign up, buy, explore data, read, book a demo, present)?
- Audience: who uses it; B2B/B2C/developer/internal; technical sophistication; decision-maker or end-user; demographics if relevant?
- Positioning: corporate/enterprise, creative/design-forward, technical/developer, luxury/premium, playful/consumer, or utilitarian/internal? (See per-type variants in `artifact-types.md`.)
- Personality: 3 to 5 adjectives, or place on the sliders below.
- Archetype (optional): Hero, Sage, Outlaw, Innocent, Explorer, Caregiver, Creator, Ruler, Magician, Lover, Jester, Everyman. Drives both color and type mood.
- References: sites admired and why; aspirational brands; sites to avoid; direct competitors.
- Brand assets: existing logo, colors, fonts, or greenfield? Must-keep and must-avoid constraints?
- Mode and constraints: dark, light, or both? Accessibility bar? Content volume (sparse vs dense)? Stack? Fidelity (prototype vs production)? Timeline/budget?

## 6. Personality sliders (fast structured intake)

Each end pulls concrete token moves. warm <-> cool; playful <-> serious; traditional <-> innovative; minimalist <-> expressive; formal <-> conversational; bold <-> restrained; dense <-> airy.

## 7. Personality-to-token translation

Built on Aaker's five brand-personality dimensions plus the sliders. Turn adjectives into a token set.

| Personality read | Type | Color | Space / density | Radius / shape | Motion | Imagery |
| --- | --- | --- | --- | --- | --- | --- |
| Sincere / warm / friendly | humanist or rounded sans, generous body | warm neutrals, soft saturated accent | airy, generous | soft to medium radius | gentle, slow | candid, human |
| Exciting / bold / playful | high-contrast display, big weights | bold saturated, maybe two accents | dynamic, asymmetric | varied, sharp or round | energetic, motion as feature | vivid, dynamic |
| Competent / trustworthy | clean neutral sans, clear hierarchy | restrained, one accent, data-forward | structured, balanced | small to medium radius | minimal, functional | charts, proof, clean product |
| Sophisticated / premium | elegant serif display or refined sans | muted or jewel, near-black + off-white, metallic accent | vast whitespace, large type | minimal radius, sharp | slow, deliberate | high-quality, sparse |
| Rugged / industrial | condensed or monospace, heavy weights | high contrast, muted base + one hazard accent | dense, functional grid | zero to small radius, hard edges | abrupt or none | utilitarian, textured |

Slider deltas (stack on top): more expressive -> add a second typeface, more color, more motion. More minimal -> fewer colors, more whitespace, one family across weights. More playful -> rounder shapes, brighter accent, micro-interactions. More serious -> tighter grid, restrained palette, sharper shapes. Denser -> smaller spacing and type steps. Airier -> larger spacing, fewer elements per view.

## 8. Which questions matter, by artifact type

- Landing page: primary conversion action; positioning (corporate/creative/technical); the single most important proof or differentiator; references.
- SaaS app: core daily task and frequency; user expertise; data/control density; light/dark; existing design system.
- Dashboard: the specific decision it supports; type (operational/analytical/strategic); top 5 to 9 metrics; cadence and device.
- Ecommerce: product type and price point; trust posture; primary objection to overcome; brand maturity.
- Presentation: audience and setting (pitch, sales, internal, conference); narrative arc; live or read.
- Docs/content site: reading length; navigation depth; code-heavy or prose; brand tie-in.
- Portfolio/brand site: the one impression to leave; how design-forward; work to foreground.

## 9. System governance (constant vs variable)

Before building, decide what is fixed and what can flex, so the system scales without drifting:

- Constant: the type families, the core palette and accent, the spacing base unit, the radius and shadow approach, the signature move.
- Variable: layout per page/section, imagery, accent intensity within range, density per context.
- Hierarchy of elements: which tokens dominate (usually type and the accent), which support.
- Application priorities: where the system must be strongest first (hero, primary CTA, key screen).

## 10. Human-sounding writing protocol

If the skill also generates copy, avoid AI-writing tells. Avoid vocabulary like delve, tapestry, multifaceted, leverage, crucial, comprehensive, foster, harness, navigate, landscape, realm, beacon, pivotal. Avoid openers like "It's important to note", "In today's fast-paced world", "At its core", "Let me explain". Avoid uniform sentence lengths, excessive tricolons (rule of three), and em-dash-as-rhythm. Vary sentence structure instead. For French copy or deep cleanup, defer to the user's humanizer and humaniseur-fr skills.

## 11. Reference transposition recipe

When the user names a site to emulate, or you find one by search: extract its color relationships, type contrast and pairing, density, and one signature move. Borrow those into the token set; do not copy its layout. State what you are borrowing before coding.
