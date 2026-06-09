# Catalogs: components and inspiration

Once the direction is committed (artifact type, adjectives, aesthetic, type and color system, signature move) and before or during building, scan these catalogs for concrete ideas and ready implementations. They are accelerators, not the design. Two cautions hold throughout. First, transpose, never adopt wholesale: pull a layout idea, an interaction, or a component implementation and refit it to the committed tokens, because several of these catalogs have a recognizable house style that is itself becoming a tell (animated-gradient hero blocks, beam/spotlight borders, the same Aceternity/Magic flourishes everywhere). Run anything you borrow through `references/slop-checklist.md`. Second, check the license before shipping: some are MIT copy-paste, some are free plus paid tiers, some are community registries with mixed licenses, and some are paid.

## Component catalogs (implementation and patterns)

Use these for built components, blocks, and interaction patterns you can adapt to the token set. Most target React plus Tailwind and the shadcn/ui registry convention.

- **shadcn/ui**: the baseline. Unstyled, accessible, copy-paste components you own and restyle through semantic tokens (MIT). The correct foundation precisely because it carries no opinionated look; you supply the identity via tokens (see `references/adapters.md`).
- **21st.dev**: a large community registry of shadcn-compatible components and blocks, installable via the shadcn CLI. Mixed authorship and licenses, so verify per component. Good for breadth and discovering patterns.
- **Magic UI**: animated and marketing-oriented components (free plus pro). Strong for landing-page motion ideas; filter heavily, as its signature effects are widely copied.
- **Aceternity UI**: high-impact animated components and hero effects (free plus paid). Striking, but its look is one of the most recognizable on the current web, so transpose the technique, not the exact effect.
- **Origin UI**: a broad, restrained set of Tailwind plus shadcn components and inputs (free). Useful for form, input, and control variety without a heavy house style.
- **Cult UI**: distinctive, well-crafted shadcn components with more character (free plus some paid). Good for interaction detail.
- **Kibo UI**: composable shadcn-registry components, including richer pieces (tables, editors, kanban). Useful for application-grade building blocks.
- **shadcnblocks**: large library of prebuilt marketing and app blocks for shadcn (paid). Good for fast section scaffolding; restyle to the system.

Workflow with these: take the structure or the interaction, strip the donor styling, and reattach the committed tokens (type, color, radius, motion). A borrowed component that still carries its catalog's default look has not been deslopped.

## Design inspiration galleries (direction and reference)

Use these in Phase 0 and Phase 1 to find strong current examples of the exact artifact type and positioning, then transpose one move (a type pairing, a color relationship, a layout device, a signature detail) per the recipe in `references/discovery.md`. Match the gallery to the job.

- **Awwwards**: juried, cutting-edge, often maximalist and motion-heavy. Best for creative, portfolio, and brand-forward work; over-indexes on spectacle, so adapt for product UI.
- **Behance**: broad design portfolios across disciplines (branding, illustration, UI). Good for visual identity and illustration direction.
- **Dribbble**: shots and concepts; fast for visual ideas, but much is non-shipping concept work, so weight toward real products.
- **Mobbin**: real product UX flows and screens (web and mobile), searchable by pattern. The best source for how shipped apps actually solve a flow (onboarding, settings, empty states).
- **Land-book**: curated landing pages across industries. Strong for marketing and landing direction.
- **Page Collective**: curated, high-quality site and page references with a tasteful bias.
- **Godly**: ultra-curated, tech and startup and SaaS leaning. Small, high signal.
- **SaaS Landing Page**: landing pages specifically for SaaS, organized for that artifact type.
- **Lapa Ninja**: large landing-page gallery, filterable by category and section.
- **Refero**: searchable real-product UI reference (screens and patterns), good for app and dashboard detail.
- **Screenlane**: curated web and mobile UI patterns and inspiration, useful for component-level ideas.

Workflow with these: find one to three references for the exact artifact type and positioning, name what specifically is worth borrowing from each, transpose into the token set, and state what was borrowed before building. Do not clone a layout; extract its relationships.

## How to suggest these to the user

At the end of conception, recommend the relevant subset, not the whole list. Pick by artifact type and stage: galleries (Land-book, Godly, SaaS Landing Page, Lapa Ninja) for landing direction; Mobbin, Refero, Screenlane for app and dashboard flows; Awwwards, Behance, Dribbble, Page Collective for creative and brand-forward work; the component catalogs for implementation once the system is set. Frame them as inspiration to transpose through the committed system, with a reminder to verify component licenses.
