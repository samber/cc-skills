# Artifact types

Each type optimizes for a different thing and has its own layout grammar, density, and aesthetic range. Identify the type in Phase 0, then design to its priorities. The positioning variants are where the same type splits into genuinely different design systems. The named products under each type are inspiration to study and transpose one move from (an interaction, a layout device, a density choice), never templates to clone, and their specific look may have changed since writing; borrow the durable design quality, not a snapshot.

## Marketing / landing page

Optimizes for: one conversion action. Everything serves a single primary CTA. Layout grammar: focused single-column narrative, above-the-fold value proposition, proof, then CTA. A landing page (campaign-specific) is tighter and more singular than a homepage (brand hub with navigation). Density: airy. One idea per section. Aesthetic range: wide, set by positioning below. Anti-patterns: no clear primary action; competing CTAs; the generic hero + 3-cards + testimonials + CTA template used by reflex.

Positioning variants (these are different design systems):

- **Corporate / enterprise**: trust and proof first. Restrained palette (often blue/neutral), clear hierarchy, logos, case studies, data-backed claims, professional imagery. Competence personality. Conservative motion. Avoid: looking like a startup toy.
- **Creative / design-forward**: visual impact and expression first. Bold or unexpected color, strong typographic personality, motion and micro-interactions as features, asymmetry. Conversion is secondary to impression. Think design studios, agencies, premium products. Avoid: timid, templated layouts.
- **Technical / developer tool**: show the product, not adjectives. Often dark mode, dense, code snippets and live demos, workflow-mirroring structure (for example a three-column build/deploy/run), real interface screenshots over stock imagery, honest performance claims. Avoid: marketing fluff, hidden product, stock photos of people pointing at laptops.
- **Ecommerce landing (single product/campaign)**: hero image, price, CTA above the fold; trust signals; benefit bullets; reviews. See ecommerce below.

Inspiration: Stripe and Linear (technical, product-as-hero, restrained), Vercel (developer landing, blueprint grid, build-log motion), Apple and BMW (premium, full-bleed product), Mercury and Ramp (fintech, disciplined and bold), Anthropic and OpenAI (calm, editorial-leaning AI positioning), Awwwards and Godly entries (creative, design-forward).

## SaaS application

Optimizes for: repeated task completion. Productivity over impression. Layout grammar: persistent navigation (sidebar or top), content area, consistent component system, predictable patterns, empty states and loading states that teach. Density: medium to high; depends on user expertise and task. Power users tolerate density; consumer apps want clarity. Aesthetic range: usually restrained (swiss, industrial, clean neutral). A committed but quiet palette; the accent carries primary actions and focus. Anti-patterns: marketing-page flourishes inside the app; inconsistent components; decoration that slows the task; reinventing controls. Inspiration: Linear (keyboard-first, low-latency, consistent), Notion (flexible blocks, calm surfaces), Figma (dense pro tooling that stays legible), Height and Superhuman (command-driven speed), Vercel and Sentry dashboards (developer-grade density).

## Dashboard / data tool

Optimizes for: a specific decision, not data display. If no one can name the decision, the dashboard will fail. Layout grammar: 12-column grid, primary elements span 6 to 8 columns and secondary 3 to 4; F or Z scan pattern, most critical data top-left; grouped sections with whitespace; bento grids work for scanning diverse metrics. Keep metric definitions one click away. Density: high, but disciplined. 5 to 9 prioritized metrics, not everything. Desktop tolerates more density than mobile (touch targets 44x44, 3 to 5 metrics on the go). Aesthetic range: restrained and functional. Color is meaning (status, thresholds), not decoration. Charts chosen by data structure, not aesthetics. Anti-patterns: information overload (the top dashboard failure); charts nobody reads; gradient text on metrics; treating it as a portfolio piece; raw-data dump with no hierarchy.

Type variants:

- **Operational**: live monitoring. Big status indicators, clear ownership, tiles or tables with sparklines, low latency, immediate clarity.
- **Analytical**: exploration. Filters, drill-downs, range pickers, reset controls, more breathing room for deep dives.
- **Strategic / executive**: high-level KPIs at a glance. Simplicity, only the critical metrics, trend over detail.
- **Tactical**: mid-level, daily/weekly, bridges operational and strategic.

Inspiration: Grafana and Datadog (operational, dense, status-forward), Vercel and Sentry (developer analytics with restraint), Stripe Dashboard (financial data presented calmly, tabular-nums everywhere), Linear insights and PostHog (analytical exploration), executive KPI views in Geckoboard-style boards (strategic simplicity).

## Ecommerce

Optimizes for: confident purchase. Reduce uncertainty and friction at the decision point. Layout grammar (product page): hero with multiple high-quality images and zoom, product name, price, prominent CTA (Add to Cart) above the fold; benefit bullets; trust section (secure payment, shipping, returns); detailed specs, reviews, FAQs; related items. CTA repeats above fold, mid-page, and below reviews. Density: medium; imagery-forward. Trust and proof density: reviews and real human signals near the point of decision, not buried. Proof should be specific and traceable, not generic. State shipping, returns, guarantees clearly. Aesthetic range: set by brand (luxury = sparse and refined; consumer = bright and energetic), but conversion mechanics are constant. Anti-patterns: dark patterns (pre-ticked boxes, manufactured urgency) that erode trust; hidden fees; weak or distant product imagery; proof reduced to a star count. Inspiration: Apple (premium product pages, vast space), Gymshark and Allbirds (consumer, energetic, strong PDPs), Aesop and SSENSE (luxury restraint, editorial), Gumroad (creator commerce, raw confidence), Shopify storefront references (conversion mechanics done well).

## Presentation / deck

Optimizes for: a narrative that persuades. Structure beats decoration. Layout grammar: clear arc, commonly problem -> solution -> proof -> CTA, or awareness -> consideration -> conversion. One idea per slide; strong visual hierarchy with bold headlines, charts, icons guiding attention; consistent branding throughout. Density: low per slide; the deck carries density, not the slide. Aesthetic range: consistent system, customer-centric framing over feature-dumping. Anti-patterns: walls of text; one slide doing five jobs; inconsistent template; decoration competing with the point. Inspiration: classic pitch-deck references (Airbnb, Sequoia template) for structure, conference-talk decks for one-idea-per-slide discipline, and editorial/keynote styling (Apple keynote slides) for typographic restraint.

## Docs / content site

Optimizes for: reading and findability. Layout grammar: clear navigation (sidebar for depth), strong measure (65 to 75ch), generous line-height, good code styling if technical, persistent search, scannable headings. Density: text-forward; structured. Aesthetic range: editorial or clean technical; restrained so content leads. Anti-patterns: marketing-page styling that hurts readability; centered long-form; weak code blocks; poor navigation for depth. Inspiration: Stripe Docs (docs-as-product, live and copyable examples), Tailwind and React docs (clear IA, strong code styling), Mintlify and GitBook (modern docs platforms), Vercel docs (calm technical), Cloudflare and Twilio (deep API references).

## Portfolio / brand site

Optimizes for: a single strong impression and showcasing the work. Layout grammar: the work is the hero; layout can break convention deliberately; strong typographic and motion personality. Density: usually airy; the work fills the space. Aesthetic range: the widest; this is where maximalism, editorial, and creative directions shine. Anti-patterns: hiding the work behind chrome; generic template that says nothing about the maker. Inspiration: Awwwards and Brutalist Websites galleries, designer portfolios indexed by Typewolf, agency sites (Pentagram, Locomotive, Active Theory) for motion and craft.

## Mobile app (native and mobile web)

Optimizes for: thumb-reachable, focused task flow on a small screen. One primary action per screen. Layout grammar: platform navigation (tab bar or bottom nav on iOS/Android, not a desktop sidebar), top app bar, content scroll, bottom sheets and action sheets for secondary choices, primary actions in the thumb zone (lower half). Follow Apple Human Interface Guidelines and Material Design 3 rather than porting a desktop layout. Density: low to medium per screen; progressive disclosure carries depth. Touch targets at least 44x44. Aesthetic range: platform-native restraint to bold consumer; respect platform conventions for gestures, back behavior, and system controls. Anti-patterns: desktop layouts squashed into a phone; tiny targets; hover-dependent interactions; ignoring safe areas and the keyboard covering inputs; custom controls that fight the platform. Inspiration: Things and Linear mobile (focus and restraint), Duolingo (playful motion and character), Arc Search and Family (gesture and sheet craft), Airbnb and Revolut (consumer polish). Mobbin is the reference library for real mobile flows.

## AI / conversational interface

Optimizes for: a legible exchange between user and model, with trust in the output. The message stream is the product. Layout grammar: a scrollable conversation (user vs assistant clearly differentiated), a persistent composer (input plus send, often with attachment and model controls), streaming text that renders incrementally, and treatments for rich output (code blocks with copy, tables, citations, tool-call or step indicators, artifacts/side panels). A history or thread list for returning to past conversations. Stop and regenerate controls. Density: medium; the content is variable-length, so the layout must hold both a one-line reply and a long structured answer. Aesthetic range: calm and readable usually wins; the type and code styling matter more than decoration. Streaming and tool-use motion should communicate progress, not entertain. Anti-patterns: chat bubbles so styled they hurt long-form reading; no copy button on code; citations that cannot be traced; no streaming feedback (the user stares at nothing); losing the composer off-screen; hiding model or context controls the user needs. Inspiration: ChatGPT, Claude, Perplexity (citation-forward), Raycast AI and Vercel v0 (AI inside a tool). Treat these as inspiration; the patterns are evolving fast.

## Email and newsletter

Optimizes for: rendering and reading inside an email client, then one click out. The client, not the browser, is the constraint. Layout grammar: single-column, table-based layout for client compatibility; inline styles; a clear hierarchy that survives stripped CSS; a single primary CTA; preheader text; web-safe or system fonts with graceful fallback; dark-mode-aware colors. Roughly 600px content width is the durable convention. Density: low; one message, scannable in seconds. Aesthetic range: brand-consistent but constrained by client support; do not rely on modern CSS, custom fonts, or background images rendering everywhere. Anti-patterns: multi-column desktop layouts that break on mobile clients; external CSS; tiny tap targets; image-only emails that fail with images off; ignoring dark mode inversion in clients. Inspiration: well-crafted product and editorial newsletters (Stripe, Linear changelog emails, Substack issues); tools like Mailchimp and Loops for client-safe patterns. Newsletter as a web post is a different artifact (see blog/editorial).

## Blog / editorial publication

Optimizes for: sustained reading and return visits. Distinct from docs (findability) and from landing (conversion). Layout grammar: a strong measure (65 to 75ch), generous line-height and paragraph spacing, a confident type system (a real display face for titles, a refined body face), article furniture (byline, date, reading time, pull quotes, figures with captions, footnotes), an index or archive, and a quiet but present subscribe or follow CTA at the end (see copywriting-cta thinking). Left-aligned long-form, never centered. Density: text-forward and airy; the words lead. Aesthetic range: editorial and typographic; this is where serif display and real columns shine (see aesthetics-library.md Editorial). Anti-patterns: centered body text; weak hierarchy between article and chrome; aggressive popups over the read; code blocks and figures that break the rhythm; a homepage that buries the writing. Inspiration: Stripe Press and editorial sites (The Verge, Pitchfork redesigns), personal sites indexed by Typewolf, Ghost and Substack web posts, paula-scher-grade typographic publications. Inspiration only.

## Onboarding and auth flows

Optimizes for: getting the user to first value with the least friction. Conversion through a sequence, not a page. Layout grammar: focused, single-task screens (sign up, log in, verify, set up); a stepper or progress indicator for multi-step setup; minimal chrome; smart defaults and inference (Tesler's law); a strong empty-first-run state that teaches; passwordless and social options; server-side redirects so the user never sees the wrong screen flash. Density: very low; one decision per step. Aesthetic range: matches the product, stripped to essentials. Trust signals on auth (security, privacy) where relevant. Anti-patterns: long forms before any value; cognitive-test logins (WCAG 3.3.8); re-entering known data (3.3.7); no progress sense; dead-end empty states; autofocus opening the keyboard over a mobile screen. Inspiration: Linear and Vercel onboarding (fast to first value), Superhuman (guided setup), Stripe and Mercury (trustworthy auth), Duolingo (motivating first-run). See components.md for the underlying state work.

## Pricing page

Optimizes for: a confident plan choice. A conversion artifact distinct enough from the landing page to design on its own. Layout grammar: a comparable set of tiers (typically 2 to 4), one recommended plan visually emphasized, a feature comparison that is scannable (not an undifferentiated matrix), clear price and billing cadence with a monthly/annual toggle, an FAQ addressing the real objections, and a single primary CTA per tier. Enterprise as a contact tier. Density: medium; comparison-heavy but must stay scannable. Aesthetic range: matches the product; restraint and clarity beat decoration here because the user is comparing, not browsing. Anti-patterns: too many tiers; a giant feature matrix with no hierarchy; hidden total cost; manufactured urgency; no recommended default (Hick's law); ambiguous billing. Inspiration: Linear, Vercel, and Stripe pricing (clear tiers, honest comparison), Notion and Figma (per-seat clarity). Inspiration only.

## Settings, account, and admin / CMS

Optimizes for: finding and changing the right setting safely. Configuration density, not data display. Layout grammar: a clear category navigation (grouped sections), forms organized by task, sensible grouping and search for large surfaces, instant-apply toggles vs explicit save for batched changes, destructive actions guarded and clearly separated, audit and confirmation feedback. Admin and CMS add tables, bulk actions, roles and permissions, and content editing. Density: medium to high; dense but zoned with surfaces and dividers, not borders. Aesthetic range: restrained and functional; the system recedes so the task is clear. Anti-patterns: a wall of ungrouped toggles; unclear save model (does this apply now?); destructive actions next to benign ones; no search on large settings; reinventing form controls. Inspiration: Linear, GitHub, and Vercel settings (grouped, searchable, calm), Stripe Dashboard settings, Shopify admin and WordPress/Sanity/Contentful for CMS patterns. See components.md for form and table craft.

## Marketplace (two-sided)

Optimizes for: matching supply and demand with trust on both sides. Search, filter, listing, and trust are the core. Layout grammar: a search and filter surface, a results grid or list with strong scannable cards (image, key facts, price, rating), a detailed listing page with rich media and trust signals (reviews, verification, policies), and a booking or purchase flow. Seller and buyer views differ. Map plus list for location-based marketplaces. Density: medium; imagery and facts balanced for fast comparison. Aesthetic range: set by brand, but trust and clarity are constant; specific, traceable proof beats generic badges. Anti-patterns: weak listing cards; filters that do not persist or reset cleanly; trust reduced to a star count; hidden fees revealed late; results with no hierarchy. Inspiration: Airbnb (listing and trust craft), Etsy and eBay (volume and filtering), Vinted and StockX (vertical marketplaces), Booking.com (filter-heavy comparison). Inspiration only.

## More artifact types in brief

For the long tail, the same discipline applies: name what it optimizes for, its one hard constraint, and one reference to study. Inspiration only.

| Type | Optimizes for | Hard constraint | Study (inspiration) |
| --- | --- | --- | --- |
| Community / forum / social feed | sustained participation | signal over noise in an infinite feed; moderation surfaces | Reddit, Discord, Threads |
| Booking / reservation / scheduling | a confirmed slot | availability clarity, timezone, calendar UX | Calendly, Cal.com, OpenTable |
| Status / changelog / system pages (404, error, maintenance) | quick reassurance and orientation | honesty and a clear next step, never a dead end | Atlassian Statuspage, Vercel and Linear changelogs |
| Data-entry / forms / survey | completion with low error | field clarity, validation, progress, save | Typeform, Tally, Google Forms |
| Developer API reference | precise lookup while coding | accuracy, copyable examples, deep navigation | Stripe, Twilio, Cloudflare docs |
| LMS / education | learning progress and retention | pacing, progress, motivation | Duolingo, Coursera, Khan Academy |
| Profile / account page | identity at a glance plus quick actions | hierarchy of identity vs actions vs content | GitHub, LinkedIn, X profiles |
| Search results | fast relevance judgement | scan speed, filters, result hierarchy | Algolia-powered search, Linear command palette, Google |
| Calendar / scheduling view | time at a glance and quick edits | density vs legibility, drag interactions with non-drag alternative | Google Calendar, Cron/Notion Calendar |
| Kanban / project tool | flow and status of work | column density, drag plus keyboard, WIP clarity | Linear, Trello, Height |
| Link-in-bio / waitlist / coming-soon micro-site | one tap or one signup | a single action, fast load, strong identity in little space | Linktree alternatives, launch and waitlist pages |
| Kiosk / TV / large-display | glanceability at distance | large targets and type, no fine pointer, no keyboard | dashboards on wall displays, signage, Apple TV UI |
| Wearable / watch | a glance and one action | tiny screen, complications, minimal interaction | Apple Watch and Wear OS patterns |
| Browser extension / embedded widget | a focused job inside someone else's page | tiny viewport, must not clash with the host, container queries | Grammarly, 1Password, Intercom messenger |
| Game / interactive UI | immersion and feedback | responsiveness, motion as feedback, custom controls | itch.io games, playful experimental sites |

## Quick selection

Decision support -> dashboard. Repeated task -> SaaS app. One conversion action -> landing page. Choose a plan -> pricing page. Buy a product -> ecommerce. Match supply and demand -> marketplace. Persuade an audience -> deck. Read and find reference -> docs. Read long-form -> blog/editorial. Look up an API while coding -> API reference. Talk to a model -> AI/conversational. Reach the user in their inbox -> email/newsletter. Get a user started -> onboarding/auth. Change a setting -> settings/admin. Manage content -> CMS. Phone-first focused task -> mobile app. Leave an impression -> portfolio. When an artifact spans two (a marketing site with an embedded app, an AI chat inside a SaaS app, a landing page with a pricing section), design each region to its own type.
