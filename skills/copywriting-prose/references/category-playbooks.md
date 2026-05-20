# Category Playbooks

Eleven playbooks. Each one compresses corpus evidence for the category — load the relevant playbook in Phase 2, apply its defaults in Phase 3.

Format per playbook: **Optimize for** · **Prose characteristics** · **Anti-patterns** · **Lexicon** · **Syntax** · **Rhythm** · **Structure** · **Reference brands**.

For categories not in this file, invoke `samber/cc-skills@deep-research` to map the category's prose conventions before codifying.

## 1. B2B (SaaS, enterprise, tech)

- **Optimize for**: clarity + credibility
- **Prose characteristics**: declarative-default; concrete examples within 100 words of any abstract claim; numbers, dates, customer names; precise terminology; explicit connectors (because, therefore, in contrast); structured arguments
- **Anti-patterns**: vague benefit-speak ("transform your business"); adjective stacking ("powerful, scalable, intelligent"); long sentences with passive subjects ("It is believed that…"); thought leadership without an actual thought
- **Lexicon**: technical terms permitted at a known specificity (latency, throughput, TCO, MRR) with glosses for non-expert readers; ban marketing intensifiers (best-in-class, world-class, cutting-edge); use product names exactly as registered
- **Syntax**: mean 14–18 words; allow longer for technical claims with multiple qualifications; subject-verb proximity (no buried verbs); active default, passive permitted in technical impersonal claims
- **Rhythm**: alternate short claim with longer evidence; one breath sentence (≤ 8 words) every 4–6 sentences; H2/H3 every 200–300 words
- **Structure**: TL;DR or summary up top; inverted pyramid; numbered lists for procedures; tables for comparisons; explicit headings ("How it works", "Why it matters", "What to do")
- **Reference brands**: Stripe (footnoted memos), Linear (terse declaratives), Notion (didactic-warm), Atlassian (clear product prose)
- **France-specific**: French B2B SaaS audiences in English expect lower tolerance for hyperbole and higher tolerance for technical depth than US norms

## 2. B2C (consumer products)

- **Optimize for**: emotional clarity + memorability
- **Prose characteristics**: shorter sentences; second person; concrete sensory verbs (taste, feel, see); product as protagonist; benefit-first leads; one idea per paragraph
- **Anti-patterns**: B2B jargon (solutions, platforms); features without sensory translation; long sentences; passive constructions; abstract nominalizations
- **Lexicon**: Anglo-Saxon verbs over Latinate; no acronyms without explanation; product names always capitalized as registered
- **Syntax**: mean 10–14 words; sentence fragments permitted in body for emphasis; imperatives common in CTAs
- **Rhythm**: punchy openings; one-sentence paragraphs allowed; lists kept to 3 items (Rule of Three)
- **Structure**: lead with the feeling, then the feature; testimonials and reviews integrated; product photography as part of the structural rhythm
- **Reference brands**: Innocent Drinks, Mailchimp consumer copy, Apple consumer pages

## 3. Consumer brand (lifestyle, DTC)

- **Optimize for**: distinctiveness + memorability
- **Prose characteristics**: high voice-marker density; idiosyncratic signature moves; willingness to break grammar rules deliberately (Innocent's lowercase i, Oatly's run-on asides); brand-as-character voice; meta-commentary on its own marketing acceptable
- **Anti-patterns**: imitating Innocent without earning it (Nick Asbury's "Wackywriting" critique); cuteness without substance; ironic distance that masks lack of conviction
- **Lexicon**: brand-owned coinages encouraged (Liquid Death's "Murder Your Thirst", Oatly's "Wow no cow!"); strong opinions encoded in vocabulary
- **Syntax**: deliberately varied; fragments common; one-sentence paragraphs frequent; rule-breaking permitted but rationed
- **Rhythm**: highly variable cadence; surprise sentence lengths; punchlines at the end
- **Structure**: micro-content first (packaging, social); pillars often manifestos rather than how-to
- **Reference brands**: Innocent Drinks, Liquid Death, Oatly, Patagonia (purpose-led variant), Cards Against Humanity (irreverent variant)
- **Caveat**: this register collapses without a real product point of view. Liquid Death works because the product (canned water in beer-style cans) is itself a thesis

## 4. Non-corporate / NGO / non-profit

- **Optimize for**: dignity + clarity
- **Prose characteristics**: humans named with consent, not anonymous "beneficiaries"; data embedded in narrative, not opposed to it; specific places and dates; first-person testimonials with full attribution where possible; ethical care in describing vulnerable populations
- **Anti-patterns**: poverty porn / suffering aesthetics; abstract nouns of suffering ("hunger", "injustice") without grounding; corporate-speak imported from for-profit ("stakeholders", "engagement", "ROI of empathy"); patronizing framings ("giving voice to" instead of platforming)
- **Lexicon**: people-first language ("people experiencing homelessness", not "the homeless"); strengths-based vocabulary (Charity: Water — focus on hope, not guilt); avoid Latinate abstractions in favor of Anglo-Saxon verbs; maintain a banned list for stigmatizing terms
- **Syntax**: medium sentence length (15–20 words) to accommodate context; active voice default with named agents; passive when protecting privacy
- **Rhythm**: narrative cadence; alternating personal scene and aggregate data; explicit "from one person to many" structure
- **Structure**: scene → person → context → systemic claim → call to action; named impact ("37 wells in 12 villages, serving 4,800 people"); credit lines for community partners
- **Reference brands**: Charity: Water (hope-not-guilt), Médecins Sans Frontières (clinical-but-human), Oxfam (campaigning), Patagonia (purpose-led)
- **France-specific**: French NGO register is more abstract and lexically Latinate than English equivalents; English-language adaptations should cut 20% of abstract vocabulary

## 5. Consulting / professional services

- **Optimize for**: authority + accessibility
- **Prose characteristics**: structured arguments with named frameworks; data with citations; institutional "we have observed" or partner-level "I have observed"; concrete client situations (anonymized where required); explicit caveats and conditions
- **Anti-patterns**: McKinsey-pastiche ("In our experience, leading organizations…") without specifics; consulting bingo (synergies, optimization, transformation); claims without evidence; pseudo-data ("studies show")
- **Lexicon**: declared framework terms (capitalize when proper noun, lowercase otherwise); banned consultancy jargon list (synergize, operationalize, leverage as verb); precise hedges ("we observed in 7 of 12 engagements", not "often")
- **Syntax**: longer sentences acceptable (18–22 words mean) given expert audience; subordination acceptable; parenthetical conditions common
- **Rhythm**: slower cadence than B2B SaaS; long paragraphs of argument (5–8 sentences) acceptable in pillars; broken by data callouts or numbered findings
- **Structure**: executive summary mandatory; situation–complication–resolution (Minto Pyramid) common; numbered findings; explicit "implications for X" sections
- **Reference brands**: McKinsey Quarterly (institutional), Bain Insights (data-driven), Stripe Press (technical-cultural), BCG Henderson Institute (academic-adjacent)

## 6. Product-led (makers, indie hackers, dev tools)

- **Optimize for**: utility + product as evidence
- **Prose characteristics**: present-tense product claims; screenshots and code blocks as part of the prose; "show, don't tell" enforced (Linear's approach); CTAs are product demos, not contact forms; documentation tone leaking into marketing copy (positively)
- **Anti-patterns**: enterprise marketing imported into product-led contexts ("revolutionize your workflow"); long preambles before showing the product; benefits without screenshots
- **Lexicon**: feature names treated as proper nouns; verbs that map to UI actions (click, select, configure); no industry buzzwords unless category requires
- **Syntax**: very short, mean 10–14 words; imperatives in how-to content; declaratives for product claims
- **Rhythm**: claim, screenshot, claim, screenshot; very high signal-to-noise
- **Structure**: above-the-fold product image plus one-sentence claim; problem-solution-proof below; final CTA = try the product
- **Reference brands**: Linear, Notion, Vercel, Plausible, Raycast

## 7. Industry (manufacturing, B2B industrial, deep-tech)

- **Optimize for**: precision + technical credibility
- **Prose characteristics**: specifications cited exactly; standards referenced (ISO, IEC, ASTM); named engineers and facilities; metric units; long-form technical depth in pillars with executive-summary openings
- **Anti-patterns**: consumer marketing language (amazing, incredible); soft claims without spec (high performance); breathy purpose-marketing pasted onto industrial products
- **Lexicon**: domain-specific terminology required, not avoided; standard abbreviations as norms (kW, MPa, IP67); banned consumer intensifiers; full part numbers and model designations
- **Syntax**: long sentences tolerated (up to 25-word means in technical sections); passive voice acceptable in scientific impersonal register; precise qualifications ("at 25°C and 1 atm")
- **Rhythm**: slower; longer paragraphs; data tables interrupt prose
- **Structure**: GE Reports model is the journalistic benchmark — named protagonist, named place, named challenge, measurable outcome; brand mentioned sparingly
- **Reference brands**: GE Reports (journalistic storytelling), Siemens (industrial minimalism), Anthropic and OpenAI research blogs (deep-tech variant — long-form, hedged, mission-framed)
- **Deep-tech variant**: research-blog prose hedges epistemically ("preliminary results suggest"); cites primary sources; reserves superlatives; embeds equations and diagrams

## 8. Volunteering / community / association

- **Optimize for**: belonging + actionability
- **Prose characteristics**: inclusive pronouns (we, our community); concrete next actions per piece (a meetup, a contribution, a vote); volunteer-authored voices given billing; gratitude as a structural element, not closing platitude
- **Anti-patterns**: corporate-charity register imported from NGOs; insider jargon excluding newcomers; assumed knowledge ("as you know from last month's meeting"); event posts missing basics (date, place, time, who can come)
- **Lexicon**: declared insider terms with one-line glosses for newcomers; banned gatekeeping vocabulary; inclusive terms (newcomers vs "noobs")
- **Syntax**: short, conversational; second person plural often appropriate; imperatives for calls to action ("RSVP by Friday")
- **Rhythm**: brisk; bullet lists for logistics; narrative for stories from members
- **Structure**: who-what-when-where-why in the first 100 words for events; member spotlights as recurring format; "how to get involved" as standard closing
- **Reference brands**: open-source community newsletters (Rust Foundation, Kubernetes); volunteer-run conferences (PyCon, GopherCon); local-chapter newsletters

## 9. Personal branding (individual creators, founders, executives)

- **Optimize for**: authentic voice fingerprint + cumulative point of view
- **Prose characteristics**: first person used deliberately; signature openings; short paragraphs on social (1–3 sentences); idiolect preserved (specific filler words, recurring connectors, characteristic metaphors); opinions clearly stated
- **Anti-patterns**: ghostwritten prose that smooths the principal's idiolect into generic LinkedIn cadence; thought leadership without thoughts; performative vulnerability; AI-template structure (hook + three bullets + question CTA)
- **Lexicon**: principal-specific. Maintain the principal's actual word list (favorite verbs, characteristic adjectives, terms they refuse to use)
- **Syntax**: principal-specific. Some founders use long sentences (Paul Graham); others use short (Naval Ravikant). Match the principal's mean sentence length within ±2 words
- **Rhythm**: principal-specific. Capture 60–90 minutes of recorded speech to extract
- **Structure**: post archetypes (lesson + story, contrarian opinion, framework, reaction to industry event); each archetype has an established cadence per principal
- **Diagnostic test**: a blind reader should be able to identify the principal from a paragraph
- **Ghostwriting addendum** (mandatory for per-principal codification):
  1. Corpus capture: 60–90 min of recorded speech + all prior writing (emails, posts, op-eds)
  2. Idiolect analysis: mean sentence length, top 50 lexemes, characteristic openings, filler phrases (you know, the thing is), preferred connectors, recurring metaphors, frequent stories, banned topics
  3. Codify: 10 signature openings · 5 signature closings · 3 recurring stories with retelling cadence · banned topics · preferred connectors · average post length · line-break convention
  4. Calibration: 3 test posts; principal reviews; iterate until "this sounds like me" with no edits
  5. Quarterly review with principal

## 10. Politics / advocacy / public figures

- **Optimize for**: clarity of position + memorability + ethical durability
- **Prose characteristics**: declarative-default; concrete promises and concrete constraints; rhetorical devices (anaphora, tricolons, contrast) used deliberately but rationed (overuse signals AI or amateurism); explicit acknowledgement of opposing views before refutation; consistent message across speeches, posts, op-eds
- **Anti-patterns**: hedging that obscures position; insider procedural language; attack-only register; recycled boilerplate from prior campaigns; superlatives ("most important election of our lifetime") that erode credibility through repetition
- **Lexicon**: campaign-specific declared vocabulary (signature words and phrases that recur); avoidance of opposition's framing language; inclusive pronouns balanced with specific named groups; banned terms list to prevent gaffes
- **Syntax**: shorter than other categories (mean 12–16 words); parallelism enforced in promises and value statements; tricolons reserved for keynote moments
- **Rhythm**: oratorical when intended for speech (read-aloud testing mandatory); written rhythm for op-eds; both should match the principal's natural cadence
- **Structure**: Aristotle's ethos-pathos-logos still operative. For speeches: hook (named constituent), thesis, three reasons, opposition acknowledged, peroration. For op-eds: argument-led, evidence-rich, concrete proposal
- **Reference**: Gettysburg Address (272 words, three paragraphs, ten sentences) as the canonical short modern model; Amnesty International and Human Rights Watch for advocacy NGO benchmarks
- **Ethical guardrail**: stick to what can realistically be accomplished. Misleading voters wins applause in the short term but erodes trust in the long run. Invoke `samber/cc-skills@deep-research` for jurisdiction-specific legal constraints (campaign finance disclosure, defamation thresholds, electoral codes) before codifying
- **Note**: per-principal customization required, similar to personal branding addendum

## 11. Internal corporate communication

- **Optimize for**: trust + comprehension + actionability
- **Prose characteristics**: plain language; named owners and named deadlines; "what changes for you" sections; explicit acknowledgement of uncertainty during change; consistent voice from leadership across channels (all-hands, intranet, email, Slack)
- **Anti-patterns**: corporate euphemism for layoffs / restructuring ("synergies", "right-sizing", "transitioning colleagues out"); buried bad news (the real news in paragraph 6); jargon-as-power ("strategic alignment workstream"); ChatGPT-flavored "I am pleased to announce" boilerplate
- **Lexicon**: employee-facing terms (colleagues, teammates) over HR-coded ones (resources, headcount); concrete role names over abstract function names (engineering team over engineering organization); accessibility-first (avoid acronyms unique to one division)
- **Syntax**: mean 14–18 words; second person ("you", "your team") in change comms; imperatives for action items
- **Rhythm**: bullet-heavy for change comms; narrative for context and rationale; clear delineation between "what" / "why" / "what changes for you" / "what to do next"
- **Structure**: lede paragraph carries the news (no throat-clearing); FAQ section for change announcements; named contact for follow-up questions; explicit timeline
- **Reference**: Patrick Collison's leaked Stripe internal memos style (research-paper structure with footnotes); Basecamp / 37signals all-hands updates (contrarian-but-warm); Slack's internal comms playbook (transparency by default)
- **Critical**: this category collapses into HR-speak more reliably than any other. The prose guide must explicitly ban the corporate-comms cliché set (cascading communication, leveraging synergies, key stakeholders, going forward, at this time)

## Multi-category brands

A brand may sit in two categories simultaneously (e.g., a B2B SaaS that markets like a consumer brand — Notion, Linear). In that case, write **one PROSE.md per audience segment**, not a blended guide. A blended guide collapses to the lowest common denominator and loses both audiences. Maintain a mapping document for shared pillars and divergent rules.

## Disclaimer

These playbooks compress the dominant patterns of each category as observed in the source research. They are starting points, not endpoints. Audit the brand's actual corpus (via AUDIT mode) before locking the category defaults — empirical patterns beat compressed ones.
