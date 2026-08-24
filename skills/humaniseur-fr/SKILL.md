---
name: humaniseur-fr
description: "Remove AI-writing patterns from French text and inject voice, personality, and soul. Use when editing, reviewing, rewriting, or cleaning up French content that reads like ChatGPT/Claude output. Humanize, humanise, déslopifier. Detects and fixes 38 patterns: AI vocabulary overuse (crucial, essentiel, également, notamment, défi, dans le paysage), anglicisms from English-first models (faire du sens, adresser un problème), copula avoidance, formulaic openings (À l'ère de, Dans un monde où), superficial participle analyses (-ant), em dash overuse, redundant adjective doublets, rule of three, sycophantic tone, decorative emojis, residual Markdown artifacts, fiction-register lyricism (instant suspendu, promesse murmurée), typographic inconsistency (mixed quote and apostrophe styles), uniform sentence length. Trigger on: humaniser, déslopifier, rendre plus humain, nettoyer le texte IA, enlever le slop, réécrire pour que ça sonne humain, make it sound human."
user-invocable: true
license: MIT
compatibility: Designed for Claude or similar AI agents.
metadata:
  author: samber
  version: "1.1.0"
  openclaw:
    emoji: "🤖"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion
---

# Humaniseur : supprimer les patterns d'écriture IA du français

## Your task

When given French text to humanize:

0. **Clarify the target register first** - Abbreviations, argot, orality, emojis and typography all depend on the expected niveau de langage. If it is not clear from the request or the input (soutenu, courant, familier ? for which medium ?), ask the user before starting to humanize
1. **Identify AI patterns** - Scan for all 38 patterns listed below
2. **Rewrite problematic sections** - Replace AI-isms with natural French alternatives
3. **Preserve meaning** - Keep the core message intact
4. **Maintain voice** - Match the intended tone and register
5. **Add soul** - Don't just remove bad patterns; inject actual personality (see Part 4)
6. **Do a final anti-AI pass** - Ask: "Qu'est-ce qui rend ce texte évidemment IA ?" Answer briefly with remaining tells, then revise. Apply the three-signal rule: one isolated marker is noise (most are normal French), but three or more co-occurring in the same passage make a reader flinch — revise until no paragraph accumulates three

## The 80 % rule: imperfect compliance is the point

Follow the humanizer rules _most of the time_ — not always. It is fine to leave roughly 20 % of this skill's instructions unapplied. Real human prose contains flagged patterns at low density: « pour conclure » does not make a text 100 % AI, and a text that dodges every single tell with mechanical rigor is uniform in a new, equally detectable way. Transgress deliberately: keep an em dash that earns its place, one « par ailleurs », one tidy list. The tells are density and co-occurrence (see the three-signal rule), never a single occurrence.

**One pass only.** Do not run this skill repeatedly on the same text: each pass removes variance and injects its own habits, and quality degrades fast — by the second or third pass the voice the first one created is flattened again. If the result still smells AI after the final anti-AI pass, the fix is adding anchored content (a fact, a date, an opinion — see the limits note in Part 4), not another scrub.

## Precedence: this skill yields to context

Instructions here can be overridden by the user's prompt or by a more specific skill loaded alongside. When the task comes with its own prose and copywriting method — a LinkedIn post, a press release, ad copy, developer documentation in a README — those rules win on conflict: apply this skill only to what they leave open (AI vocabulary, anglicisms, artifacts, typography). A LinkedIn hook, a press-release structure or Markdown formatting in developer docs may legitimately use patterns flagged here (short punchy paragraphs, a tidy list, headings and bold, a rule of three); that is the format speaking, not the machine.

## IMPORTANT: French-specific context

French professional writing is inherently more formal than English. Connectors like « néanmoins » and « toutefois » are legitimate in human French. The tells are different from English:

- The AI lexicon is distinct (« crucial » is the #1 French AI word, not "delve")
- Anglicisms from the model's English-first architecture are a major tell
- Typographic conventions (guillemets, spacing before punctuation) are strict
- The dissertation tradition (thèse/antithèse/synthèse) overlaps with AI structure
- French tolerates longer sentences naturally, so burstiness signals differ

Do NOT over-correct toward informal French. The goal is authentic French at the appropriate register, not dumbed-down French.

**Ne jamais abaisser le registre de langue.** If the input is in « langage soutenu », the output MUST remain in « langage soutenu ». Rewriting formal prose into casual French is a different kind of inauthenticity — just as detectable, just as artificial. The enemy is _formulaic_ writing, not _formal_ writing. A well-constructed subordinate clause, a precise connector, a long periodic sentence — these are features of good French, not AI artifacts. Only remove what is genuinely mechanical: inflated significance, copula avoidance, synonym cycling, promotional filler.

---

## Part 1: Content patterns

### Pattern 1 — Inflation de signification et d'héritage

**Triggers:** constitue/représente un tournant, témoigne de, joue un rôle crucial/essentiel/déterminant, souligne l'importance, reflète une tendance plus large, symbolisant son caractère durable, contribuant à, ouvrant la voie à, marquant une étape, un jalon décisif, un paysage en mutation, une empreinte indélébile, profondément ancré

LLMs inflate the importance of ordinary facts by connecting them to broader trends nobody asked about.

**Avant :**

> L'Institut de la Statistique de la Catalogne a été officiellement créé en 1989, marquant un tournant décisif dans l'évolution des statistiques régionales en Espagne. Cette initiative s'inscrivait dans un mouvement plus large de décentralisation administrative.

**Après :**

> L'Institut de la Statistique de la Catalogne a été créé en 1989 dans le cadre du transfert de compétences statistiques aux communautés autonomes. Il produit et publie des statistiques régionales indépendamment de l'INE.

### Pattern 2 — Insistance sur la notabilité et la couverture médiatique

**Triggers:** couverture médiatique indépendante, médias locaux/nationaux/internationaux, cité par un expert reconnu, forte présence sur les réseaux sociaux

**Avant :**

> Ses travaux ont été cités dans Le Monde, la BBC, Les Échos et Le Figaro. Elle maintient une présence active sur les réseaux sociaux avec plus de 200 000 abonnés.

**Après :**

> Dans un entretien au Monde en 2024, elle a défendu l'idée que la régulation de l'IA devrait porter sur les résultats plutôt que sur les méthodes.

### Pattern 3 — Analyses superficielles en participe présent (-ant)

**Triggers:** soulignant/mettant en lumière..., assurant..., reflétant/symbolisant..., contribuant à..., favorisant/encourageant..., englobant..., illustrant...

AI tacks participial phrases onto sentences to add fake analytical depth. The French equivalent of the English "-ing" problem.

**Avant :**

> La palette du bâtiment, mêlant bleu, vert et or, évoque la beauté naturelle de la région, symbolisant les champs de lavande et la Méditerranée, reflétant l'attachement profond de la communauté à son terroir.

**Après :**

> Le bâtiment utilise du bleu, du vert et de l'or. L'architecte a expliqué que ces couleurs font référence aux champs de lavande et à la côte méditerranéenne.

### Pattern 4 — Langage promotionnel et publicitaire

**Triggers:** dispose de, vibrant, riche (figuré), profond, renforçant son, illustrant, exemplifie, engagement envers, beauté naturelle, niché, au cœur de, révolutionnaire (figuré), renommé, à couper le souffle, incontournable, époustouflant, un joyau

**Avant :**

> Niché au cœur de la région époustouflante du Luberon, ce village se dresse comme un joyau vibrant doté d'un riche patrimoine culturel et d'une beauté naturelle à couper le souffle.

**Après :**

> Le village est situé dans le Luberon, à une trentaine de kilomètres d'Apt. On y vient surtout pour le marché du samedi et l'église romane du XIIe siècle.

**Subtle variant when editing or summarizing:** AI inserts valorizing adjectives and inclusive doublets absent from the source — « nos soldats » becomes « nos _vaillants_ soldats », « concitoyens » becomes « concitoyennes et concitoyens ». It over-corrects toward its training norms instead of following the text. Restore the source's wording.

### Pattern 5 — Attributions vagues et mots-fouines

**Triggers:** Des rapports sectoriels, Les observateurs soulignent, Les experts estiment, Certains critiques avancent, plusieurs sources/publications (quand peu sont citées), il est communément admis que, il est largement reconnu que

**Avant :**

> Les experts estiment qu'elle joue un rôle crucial dans l'écosystème régional.

**Après :**

> La rivière abrite plusieurs espèces de poissons endémiques, selon un inventaire de 2019 du CNRS.

### Pattern 6 — Sections « Défis et perspectives »

**Triggers:** Malgré son... fait face à plusieurs défis..., En dépit de ces défis, Défis et héritage, Perspectives d'avenir, L'avenir s'annonce prometteur

The formulaic challenge-then-optimism sandwich.

**Avant :**

> Malgré sa prospérité industrielle, la commune fait face à des défis typiques des zones urbaines. En dépit de ces défis, elle continue de prospérer.

**Après :**

> La congestion routière s'est aggravée après 2015 avec l'ouverture de trois zones d'activités. La mairie a lancé un programme de réfection du réseau pluvial en 2022.

---

## Part 2: Language, grammar, and style patterns

### Pattern 7 — Vocabulaire « IA » surutilisé

The single most flagged word in French AI text is **crucial**. The adverb **notamment** appears ~1/200 words in AI text vs. ~1/800 in human French (4x overuse).

**High-frequency AI vocabulary (find-and-replace checklist):**

| AI word/phrase | Replacement strategy |
| --- | --- |
| crucial, essentiel | Use domain-specific terms, or just drop |
| également (the top measured French AI marker) | « aussi », « de même », or drop — one per paragraph max |
| défi | « problème », « difficulté », or name the actual obstacle |
| significatif, robuste, substantiel | Be precise: give numbers instead |
| holistique | Remove (calque of English "holistic") |
| compréhensif (= exhaustif) | Use « exhaustif » or « complet » (compréhensif = empathetic in French) |
| disruptif | « de rupture » or describe the actual change |
| notamment (if >1 per 800 words) | « en particulier », « entre autres », or restructure |
| par ailleurs, en outre, de plus | Use « or », « reste que », « n'empêche que », « soit dit en passant » |
| il convient de noter que | Delete, start sentence directly |
| dans le paysage [actuel/numérique] | Delete entirely |
| au cœur de | Replace with specific location/concept |
| la pierre angulaire | Just say what it is |
| un levier puissant | Describe the actual mechanism |
| captivant, fascinant, passionnant | Say what is actually interesting, or drop |
| révolutionnaire, transformateur | Describe the actual change |
| permettre de, favoriser, optimiser | Use a concrete verb: say what actually happens |
| mettre en lumière | « montrer », « révéler » |
| naviguer dans, déverrouiller le potentiel de | Calques — describe the actual action |
| garantir, assurer, offrir (as service-brochure verbs) | State the fact plainly |
| dans cette optique, dans ce contexte, à cet égard | Delete, or link the ideas concretely |
| que vous soyez X ou Y | Address the actual reader directly |

**Jargon de ministre:** AI French leans on administrative vocabulary (« dispositif », « acteurs », « enjeux », « mise en œuvre », « dynamique territoriale ») even outside institutional contexts. Outside actual administrative prose, swap for plain words.

**Formulaic openings to kill on sight:**

- « Dans le paysage [actuel/numérique/contemporain] de... »
- « À l'ère de... »
- « Dans un monde [où/trépidant/tumultueux]... »
- « Il est essentiel/crucial de noter que... »
- « Plongeons dans... » (the French "Let's dive into")
- « Découvrez comment... », « Dans cet article, nous allons explorer... », « Bienvenue dans ce guide complet... » (meta-announcements — start with the content itself)

**Formulaic closings to kill on sight:** « En conclusion », « En résumé », « En somme », « En fin de compte », « Au final » opening a final paragraph. End on a concrete fact instead (see Pattern 26).

**Connectors that signal human authorship** (AI almost never uses these): « Or », « Quoi qu'il en soit », « Toujours est-il que », « Force est de constater que », « Reste que », « N'empêche que », « Soit dit en passant »

### Pattern 8 — Évitement de la copule (être/avoir)

**Triggers:** constitue, fait office de, se positionne comme, représente [un], dispose de, offre [un]

**Avant :** La galerie constitue l'espace d'exposition. Elle dispose de quatre salles. **Après :** La galerie est l'espace d'exposition. Elle a quatre salles.

### Pattern 9 — Parallélismes négatifs

**Triggers:** Non seulement... mais aussi..., Il ne s'agit pas seulement de... mais de..., Ce n'est pas un simple X, c'est un Y

**Avant :** Il ne s'agit pas simplement d'autocomplétion ; il s'agit de libérer la créativité. **Après :** L'apport principal reste l'autocomplétion.

### Pattern 10 — Règle de trois systématique

AI forces ideas into groups of three.

**Avant :** L'événement propose des conférences plénières, des tables rondes et des opportunités de réseautage. Innovation, inspiration et analyses sectorielles. **Après :** L'événement comprend des conférences et des tables rondes. Du temps est prévu pour le réseautage.

### Pattern 11 — Cycle de synonymes (variation élégante)

Repetition-penalty code causes excessive synonym substitution for the same referent.

**Avant :** Le protagoniste fait face à de nombreux défis. Le personnage principal doit surmonter les obstacles. La figure centrale finit par triompher. **Après :** Le protagoniste fait face à de nombreux obstacles, finit par les surmonter et rentre chez lui.

### Pattern 12 — Fausses gammes

**Triggers:** « de X à Y, de A à B » where X-Y and A-B don't form meaningful scales.

**Avant :** De la singularité du Big Bang au vaste réseau cosmique, de la naissance des étoiles à la danse de la matière noire. **Après :** Le livre couvre le Big Bang, la formation des étoiles et la matière noire.

### Pattern 13 — Anglicismes d'architecture

~16% of ChatGPT's French errors have English origins. These are among the most reliable tells.

| Anglicisme IA                     | Français correct                  |
| --------------------------------- | --------------------------------- |
| « faire du sens »                 | « avoir du sens »                 |
| « adresser un problème »          | « traiter / aborder un problème » |
| « implémenter » (hors info)       | « mettre en œuvre »               |
| « impacter »                      | « affecter, toucher »             |
| « supporter » (= soutenir)        | « prendre en charge »             |
| « définitivement » (= assurément) | « sans aucun doute »              |
| « basiquement »                   | « en gros, fondamentalement »     |
| Oxford comma before « et »        | No comma before « et » in French  |

### Pattern 14 — Doublets adjectivaux redondants

Token-by-token generation produces synonym pairs as hedging.

**Triggers:** crucial et essentiel, robuste et fiable, innovant et avant-gardiste, dynamique et en pleine expansion, riche et varié

**Avant :** Cette approche innovante et avant-gardiste offre une solution robuste et fiable. **Après :** Cette approche tient la charge sans maintenance lourde.

### Pattern 15 — Abus de tirets cadratins

AI overuses em dashes mimicking English "punchy" writing. French prefers commas and parentheses for incidental clauses.

**Avant :** Le terme est promu par les institutions — pas par les habitants. Cet étiquetage — même dans les documents officiels — persiste. **Après :** Le terme est promu par les institutions, pas par les habitants. Cet étiquetage persiste, même dans les documents officiels.

**Freshness note:** since November 2025, ChatGPT obeys "no em dash" custom instructions, and readers know the tell. Presence proves little (humans use it too), absence proves nothing. Still reduce overuse — the goal is natural French, not detector evasion.

### Pattern 16 — Abus de gras mécanique

AI bolds terms mechanically to signal importance.

**Rule:** Remove all bold unless it serves a genuine navigational function.

### Pattern 17 — Listes verticales avec en-têtes en gras et deux-points

**Avant :**

> - **Expérience utilisateur :** Significativement améliorée.
> - **Performance :** Optimisée grâce à des algorithmes améliorés.
> - **Sécurité :** Renforcée avec le chiffrement de bout en bout.

**Après :**

> La mise à jour améliore l'interface, accélère le chargement et ajoute le chiffrement de bout en bout.

**Same rule for gratuitous tables:** AI presents ordinary developments as tables (a French Wikipedia-flagged marker). Keep a table only when the data is genuinely tabular (comparisons, figures); otherwise convert to prose.

### Pattern 18 — Majuscules de titre à l'anglaise

French headings capitalize only the first word (and proper nouns).

**Avant :** ## Négociations Stratégiques Et Partenariats Globaux **Après :** ## Négociations stratégiques et partenariats globaux

### Pattern 19 — Emojis : décoratifs vs expressifs

Emojis are a register feature, not a defect. Three tests:

1. **Function** — an emoji that _replaces_ words or carries tone (irony, emotion, reaction) is human usage; one that _decorates_ structure (one per heading, 🚀💡✅ series, « 👉 » paragraph openers) is machine usage. Remove the second, keep the first.
2. **Medium** — social posts, chats, internal messaging: emojis are expected — keep some, or add one if the author's voice uses them. Formal documents, press releases, articles: none.
3. **Regularity** — the tell is systematicity: same position, same density everywhere. Human emoji use is irregular and sparse (max ~1 per paragraph, never in series). Keep the irregular, kill the systematic.

When in doubt about the author's voice, ask.

### Pattern 20 — Guillemets et incohérence typographique

Sources contradict on which quote style AI produces (perfect chevrons « », English curly quotes "…", or both). The robust tell is not one variant but the **mix**: straight quotes, curly quotes and chevrons cohabiting in one text, or straight (') and curly (’) apostrophes alternating — a human sticks to whatever their keyboard produces.

**Quote rule by register:** in official documents written in langage soutenu with worked typography, use chevron quotes (« ... ») with non-breaking spaces. The rest of the time (emails, internal communication, social media), prefer curly quotes ("...") — chevron-perfection there reads as machine output.

**Also check:** spaces before colons/semicolons/exclamation/question marks, and French number formatting (1 000,50 not 1,000.50). Whatever the convention, keep it consistent across the whole text — consistency beats correctness.

### Pattern 21 — Artéfacts de conversation

**Kill on sight:** J'espère que cela vous aide, Bien sûr !, Absolument !, Vous avez tout à fait raison !, Souhaitez-vous que..., N'hésitez pas à, Voici un...

### Pattern 22 — Clauses de limitation de connaissance

**Kill on sight:** en date de [date], Selon les informations disponibles, Bien que les détails spécifiques soient limités..., sur la base des données accessibles...

### Pattern 23 — Ton servile et sycophante

**Avant :** Excellente question ! Vous avez tout à fait raison, c'est un sujet complexe. **Après :** Les facteurs économiques que vous mentionnez jouent effectivement ici.

### Pattern 24 — Phrases de remplissage

| Kill                            | Replace with             |
| ------------------------------- | ------------------------ |
| Afin de parvenir à cet objectif | Pour y arriver           |
| En raison du fait que           | Parce que                |
| À ce stade / À l'heure actuelle | Maintenant / Aujourd'hui |
| Dans l'éventualité où           | Si                       |
| Le système a la capacité de     | Le système peut          |
| Il est important de noter que   | (delete, start directly) |
| Il convient de souligner que    | (delete, start directly) |
| En ce qui concerne              | Sur / Quant à            |

### Pattern 25 — Hedging excessif

**Avant :** On pourrait potentiellement arguer que cette politique pourrait éventuellement avoir un certain effet. **Après :** Cette politique a probablement un effet sur les résultats.

### Pattern 26 — Conclusions positives génériques

**Triggers:** L'avenir s'annonce prometteur, Des temps passionnants, poursuit son chemin vers l'excellence, un pas majeur dans la bonne direction

Replace with a concrete fact about what actually happens next.

### Pattern 27 — Uniformité structurelle

AI produces paragraphs of nearly identical length (std dev <30 words vs. >60 for humans), lists grouped in 3/5/7/10 items, and invariable intro-body-conclusion architecture. Section headings phrased as questions are an additional formatting marker.

At sentence level, the tell is dispersion, not average: in the only quantified French study, mean sentence length was near-identical (21.0 human vs. 21.7 AI words) but AI produced almost no sentences under 15 or over 39 words (most frequent length shifting from 13 to 19 words).

**Rule:** Reintroduce the tail. Write some short sentences (under 15 words) and some long periodic ones (over 39). The missing extremes are what betrays the machine, not the mean.

**Sentence-start anaphora:** consecutive sentences opening identically (« Cela... », « Cette approche... », « Ce système... »). Vary the attack of each sentence.

**Style « LinkedIn »:** one-sentence paragraphs stacked for drama, ellipses as suspense pivots (« Et là... tout a changé »), relentlessly upbeat tone. This register is now so associated with AI-assisted posting that it reads as machine output even when human. Merge the fragments into real paragraphs.

### Pattern 28 — Markdown résiduel et artéfacts techniques

**Kill on sight:** unrendered `**mot**` or `##` in plain-text contexts, `- **Titre :**` bullets pasted where Markdown doesn't render, citation artifacts like `:contentReference[oaicite:2]{index=2}`, leftover refusals (« Je suis désolé, mais je ne peux pas... »)

These are the strongest tells of all: they cannot come from a spellchecker or a CMS — only from pasting a chat output. French investigative journalists hunt AI-generated news sites by searching exactly these strings.

**Also strip zero-width characters** (U+200B, U+200C, U+200D, U+FEFF) — copy-paste artifacts with no legitimate use in prose. Do NOT strip non-breaking spaces (U+00A0, U+202F): they are correct French typography before « ; : ! ? » and inside « 12 h 30 ». Confusing the two creates false alarms on every properly typeset French text.

**Medium exception:** where Markdown is the native format — a README, developer documentation, a technical wiki — headings, bold, lists, tables and code blocks are the norm, not a tell. This pattern targets Markdown pasted into contexts that do not render it, plus generation artifacts; it does not apply to documents meant to be Markdown.

### Pattern 29 — Lyrisme de pacotille (registre narratif)

French AI _fiction_ has its own register, distinct from blog slop.

**Triggers:** un instant suspendu, une promesse murmurée/suspendue dans l'air, un secret brûlant, un désir/silence vibrant, comme si le temps s'était figé — recurring fetish words: _promesse, suspendu, vibrant, secret, brûlant, murmuré_

**Grammar profile:** AI narrative French flattens tense and person. The quantified study measured passé simple −84 %, imparfait −71 %, conditionnel −50 %, pronoun « on » −92 %, verb « falloir » −93 % versus human French. Reintroduce the tenses the genre calls for, prefer « on » over a stiff « nous », and let « il faut » back in.

The same study measured the over-uses: « devoir » (+101 %), « continuer » (+145 %), « tenir » (+158 %), « ensemble » (+93 %), possessive determiners (+30 %). When these cluster (« nous devons continuer, ensemble, à tenir nos engagements »), the sentence is machine-average French — rewrite it around a concrete action.

---

## Part 3: Discourse architecture patterns

Lexical scrubbing is not enough: the deepest AI tells are architectural. A text can contain zero flagged words and still read machine-made because of how it is built. Unlike the measured lexical data, these patterns are craft heuristics — convergent observations from experienced readers, not corpus-measured figures.

### Pattern 30 — Annonce, récapitulation et écho de la consigne

**Triggers:** an intro announcing what the text will say, a conclusion repeating what it said, section headings mirroring the announced plan 1:1, a first sentence rephrasing the question asked (« Vous vous demandez comment... ? », the assignment restated), a closing that loops back to the request

The information exists once but is served three times. Chatbot answers and school essays echo the prompt at both ends.

**Rule:** Start in medias res — the first sentence delivers content, not a program. End somewhere the intro couldn't predict: a consequence, an open question, a concrete next fact. Delete prompt echoes at both ends.

### Pattern 31 — Structure en catalogue, sans angle

**Triggers:** sections that could be reordered without breaking anything; every aspect of the topic covered at equal depth (définition, avantages, inconvénients, bonnes pratiques, conclusion); no claim that later sections build on

AI covers a subject; a human makes a point. The permutation test: if two sections can swap places without damage, the text is a disguised list, not an argument.

**Rule:** Choose an angle and commit. Cut the aspects that don't serve it — visible dead ends are human. Make each section depend on the previous one, so the order becomes necessary.

### Pattern 32 — Moule de paragraphe et échafaudage apparent

**Triggers:** every paragraph = topic sentence + two or three supports + mini-conclusion, fully self-contained; paragraphs opening with sequence connectors (« D'abord », « Ensuite », « De plus », « Enfin ») ; no idea ever spilling across a paragraph break; zero digressions

The structure is signaled instead of carried by the content. Human paragraphs lean on each other: a thought starts at the end of one and finishes in the next; an aside interrupts.

**Rule:** Drop scaffolding connectors — juxtaposition works. Let at least one idea straddle a paragraph break. Allow a digression when it earns its place.

### Pattern 33 — Faux équilibre discursif

**Triggers:** every claim immediately counterbalanced (« Cependant, il convient de nuancer... »), symmetrical « d'une part / d'autre part », conclusion of the « tout dépend du contexte » type

Sentence-level hedging (Pattern 25) scaled up to the whole text: the piece has no thesis. Both-sidesism reads as machine caution, not fairness.

**Rule:** Take a position. Nuance once, where it genuinely matters — not after every claim. If the honest answer really is « ça dépend », say of what, precisely.

**Deletion test:** remove the objection paragraph. If the conclusion still holds unchanged, the objection was ornament, not thought — a real antithesis _displaces_ the thesis. The discriminator matters in French: the dissertation tradition (thèse/antithèse/synthèse) makes announce-and-balance school-legitimate, so a courtesy counter-argument passes unnoticed.

**Quebec caveat:** rédaction épicène and OQLF plain-language norms push human institutional writers toward exactly this flat, symmetrical shape — in Québec institutional prose, do not read balance alone as machine output.

### Pattern 34 — Sur-sectionnement SEO et question-réponse fantôme

**Triggers:** H2/H3 every two paragraphs, a table of contents on a short text, an FAQ block, a closing quiz or « points clés à retenir » ; self-interrogation outside any real FAQ (« Pourquoi est-ce important ? Parce que... »)

This is the documented grid of French AI content farms. The ghost Q&A simulates a dialogue where none exists.

**Rule:** A heading must govern at least four or five paragraphs — otherwise merge. Remove FAQ/quiz blocks unless the medium genuinely calls for them. Convert self-questions into direct statements.

### Pattern 35 — Granularité constante

**Triggers:** the whole text sits at one level of abstraction — no date, no name, no price, no error message, no quoted sentence; 1 500 words at mid-altitude

Humans change altitude: they drop from the abstract to a hyper-specific detail (a date, a stack trace, a price) and climb back within a couple of paragraphs. LLMs cruise at mid-altitude for the whole text.

**Rule:** Force at least one dive per section: a verifiable, dated, named detail. If the author has none to offer, that is a content problem, not a style problem (see the limits note in Part 4).

### Pattern 36 — Absence de trous

**Triggers:** every question the text raises gets answered; no abandoned thread, no unresolved tension, no open problem

Real expertise leaves holes, because the author knows where the knowledge stops. AI text resolves everything it opens — the tidiness itself is the tell. This is the structural counterpart of never writing « je ne sais pas » (Part 4).

**Rule:** Leave at least one raised question honestly open. Name the limit (« je n'ai pas testé au-delà de X ») instead of rounding it off.

### Pattern 37 — La liste comme évitement

**Triggers:** bullet lists appearing exactly where the reasoning gets hard — at the decision point, the trade-off, the prioritization

Enumeration replaces the choice the author refused to make: listing five options is easier than defending one. Pattern 17 treats lists as formatting; this one treats them as an argumentative symptom.

**Rule:** At each list, ask what decision it avoids. Replace it with a sentence that chooses — keep the list only when the items genuinely are peers.

### Pattern 38 — Absence d'occasion d'écriture

**Triggers:** nothing in the text explains why it exists, now, triggered by what, addressed to whom — no event, no encounter, no deadline, no request

Human texts have an origin (an incident, a question someone asked, a release, an annoyance) and an addressee, and it shows. AI text is written from nowhere, to no one.

**Rule:** Anchor the piece in its occasion within the first paragraphs: what happened that made this worth writing, and for whom. If no occasion exists, ask the author for it.

---

## Part 4: Personality and soul

**Avoiding AI patterns is only half the job.** Sterile, voiceless text is just as suspicious as text full of « crucial » and « dans le paysage de ». This is the dimension most "humanization" guides ignore.

**Know the limits.** Experienced French readers, moderators and investigators no longer rely on style: the signals they trust are behavioral and ecosystem-level (publishing cadence, whether the author exists, whether the sources check out). No amount of pattern-scrubbing fixes a text with nothing situated in it — no lived detail, no dated fact, no checkable source. If the input has no anchored content, flag it to the author instead of polishing the surface: ask for one real example, one date, one source, and build the rewrite around them.

### Préserver le registre

Formal ≠ AI. Un texte en langage soutenu ne doit pas devenir familier après réécriture. Conserver les structures complexes (subordonnées, incises, phrases périodiques) quand elles portent du sens. Ne simplifier que ce qui est mécaniquement formulé — pas ce qui est simplement formel. Adapter les exemples de ce guide au registre du texte d'entrée : les réécritures ci-dessous ciblent un registre courant ; pour un texte soutenu, maintenir le même niveau de langue.

### Signs of soulless writing (even if technically clean)

- Every sentence is the same length and structure
- No opinions, just neutral reporting
- No acknowledgment of uncertainty or mixed feelings
- No first person when it would be appropriate
- No humor, no edge, no personality
- Reads like a Wikipedia article or press release

### How to add voice in French

**Avoir des opinions.** « Franchement, je ne sais pas quoi en penser » is more human than neutral pros-and-cons.

**Varier le rythme.** Short sentences that hit hard. Then longer ones with nested subordinates that take their time. French has a tradition of rhythmic asymmetry (Montaigne, Cioran, Debord). AI text is monotonously regular by contrast.

**Reconnaître la complexité.** « C'est impressionnant mais aussi un peu flippant » beats « C'est impressionnant. »

**Utiliser « je ».** First person is not unprofessional. « J'y reviens sans arrêt... » signals a human thinking. Personal voice is among the strongest authenticity markers.

**Laisser du désordre.** Perfect structure feels algorithmic. Tangents, parentheses, half-formed thoughts are human. French has a long tradition of the parenthèse (Proust is the caricature, but even in technical writing, asides signal authenticity).

**Utiliser le second degré.** LLMs are constitutionally incapable of authentic irony and humor. Understatement, light sarcasm, self-deprecation: unfakeable markers. « On a quand même inventé un truc qui code mieux que nous quand on est fatigué, ce qui est à peu près tout le temps » does not come from an LLM.

**Admettre l'ignorance.** An LLM never writes « je ne sais pas », « aucune idée », « je n'ai pas vérifié ». Like irony and humor, a frank admission of not knowing is among the strongest authenticity markers precisely because the machine never produces it. Use all three sparingly and only where the context allows — a legal notice or an audit report tolerates neither jokes nor shrugs.

**Être précis sur les ressentis.** Not « cela est préoccupant » but « il y a quelque chose de dérangeant à voir des agents tourner à 3h du matin sans personne pour les surveiller. »

**Utiliser des mots rares.** AI French avoids low-probability words in both directions: no « séide » or « nonobstant », no « chelou » or « relou ». One well-placed rare word — soutenu or argotique, matching the register — signals a human choosing, not a model averaging.

**Utiliser l'argot et le registre familier (quand le registre s'y prête).** AI French is uniformly standard; argot is one of the cheapest authenticity injections. A non-exhaustive palette, by region:

- **France (familier/argot)** : chelou, relou, ouf, avoir le seum, la flemme, une galère, ça me saoule, bosser, un boulot, un bouquin, le fric, la thune, une bagnole, kiffer, se planter, un truc de dingue, grave (= très), carrément, vachement, se prendre le chou, bidouiller, une magouille, au taquet, à l'arrache
- **Belgique** : septante, nonante, un GSM, un kot, tantôt (= tout à l'heure), à tantôt, une aubette, la guindaille, s'il te plaît (en tendant un objet), une farde, savoir (= pouvoir : « je ne saurais pas venir »), il drache
- **Québec** : niaiser, jaser, magasiner, pantoute, c'est plate, c'est correct, un char, un dépanneur, une blonde / un chum, avoir de la misère, être dans le champ, ça prend pas la tête à Papineau, c'est tiguidou, se faire passer un sapin, présentement, à matin
- **Suisse romande** : un natel, septante / huitante / nonante, une panosse, un cornet (= sac plastique), ça joue, se réjouir de (= avoir hâte), un linge (= serviette), une votation, faire la pièce droite

**Ancrer géographiquement.** AI defaults to Parisian standard French. Regionalisms are strong authenticity markers where they fit the author — and their systematic absence in a supposedly Québécois, Belgian or Swiss author's text is itself a tell. Never force them: a misused regionalism (or the clichéd Belgian « une fois ») is worse than none. Match the author's real origin, medium and register.

**Assumer l'oralité (registre familier uniquement).** In informal writing, humans drop the « ne » (« c'est pas faux », « y'a un truc »), use hyperbole (« 1000 % d'accord »), contract. AI keeps full negation everywhere. Never force this into formal prose — register first.

**Abréger comme un humain.** AI spells everything out; humans abbreviate constantly. Sprinkle where the register allows:

- **Sigles et marqueurs d'usage** : PS:, NB:, cf., etc., ex: / p. ex., càd, RDV, ASAP, FYI, pour info, cc (mettre en copie), CR (compte rendu), retex, N+1, RH, WE
- **Unités et chiffres** : min (« 5 min de marche »), h collé (« 14h30 », « 2h de route »), km, € collé (« 30€ »), ~ pour « environ », nb (nombre)
- **Raccourcis d'écrit courant** : pb, tjs, bcp, qqch, qqn, svp / stp, dispo, perso, pro
- **Apocopes** : ordi, appart, resto, apéro, ciné, fac, prof, exam, visio, réu, présa, la doc, la config, l'admin, le labo, la manif, l'expo, la promo, l'info, l'aprem
- **Clôtures d'email** : A+, Cdlt, « à plus »

An LLM never spontaneously writes « pb », « tjs » or « 14h30 » — these are cheap, strong authenticity markers. Calibrate to the medium and to the target register (see step 0): in formal documents, stick to cf., etc., NB and p. ex. ; and avoid full SMS-speak (slt, bjr) everywhere except actual chat.

---

## Process

1. Read the input text carefully. If the target register is unclear, ask the user which niveau de langage is expected before rewriting anything
2. Identify all instances of the 38 patterns
3. Rewrite each problematic section
4. Inject voice and personality (Part 4)
5. Ensure the revised text:
   - Sounds natural when read aloud in French
   - Varies sentence structure (measure paragraph length std dev)
   - Uses specific details over vague claims
   - Maintains appropriate register for context — if the input is « soutenu », the output stays « soutenu »
   - Uses simple constructions (est/a/fait) where appropriate
   - Uses correct French typography (guillemets, spacing, number formatting)
   - Contains zero anglicisms from pattern #13
6. Present a draft humanized version
7. Ask: "Qu'est-ce qui rend ce texte évidemment généré par IA ?"
8. Answer briefly with the remaining tells (2-3 bullet points max)
9. Ask: "Maintenant, fais en sorte qu'il ne le soit plus."
10. Present the final version

## Output format

Provide:

1. **Brouillon réécrit** (draft rewrite)
2. **« Qu'est-ce qui rend ce texte évidemment IA ? »** (brief remaining tells)
3. **Version finale** (revised after the self-audit)
4. **Résumé des modifications** (brief list of patterns removed, optional)

## Full example

**Avant (texte IA typique) :**

> Voici un aperçu de ce sujet. J'espère que cela vous sera utile !
>
> Le coding assisté par IA constitue un témoignage durable du potentiel transformateur des grands modèles de langage, marquant un tournant décisif dans l'évolution du développement logiciel. Dans le paysage technologique actuel en perpétuelle mutation, ces outils révolutionnaires — nichés à l'intersection de la recherche et de la pratique — redéfinissent la manière dont les ingénieurs idéent, itèrent et livrent, soulignant leur rôle crucial dans les workflows modernes.
>
> Au cœur de cette dynamique, la proposition de valeur est claire : rationaliser les processus, renforcer la collaboration et favoriser l'alignement. Il ne s'agit pas simplement d'autocomplétion ; il s'agit de libérer la créativité à grande échelle, en assurant que les organisations restent agiles tout en délivrant des expériences fluides, intuitives et puissantes. L'outil constitue un catalyseur. L'assistant fait office de partenaire. Le système se positionne comme une fondation pour l'innovation.
>
> - 💡 **Rapidité :** La génération de code est significativement plus rapide, réduisant les frictions et autonomisant les développeurs.
> - 🚀 **Qualité :** La qualité des résultats a été renforcée grâce à un entraînement amélioré, contribuant à des standards plus élevés.
> - ✅ **Adoption :** L'utilisation continue de croître, reflétant des tendances sectorielles plus larges.
>
> Malgré des défis typiques des technologies émergentes — notamment les hallucinations, les biais et la responsabilité — l'écosystème continue de prospérer. L'avenir s'annonce prometteur. N'hésitez pas à me dire si vous souhaitez que je développe une section !

**Brouillon réécrit :**

> Les assistants de code IA accélèrent certaines tâches. Dans une étude Google de 2024, les développeurs utilisant Codex complétaient les fonctions simples 55% plus vite qu'un groupe témoin, mais ne montraient aucune amélioration sur le debugging ou les décisions d'architecture.
>
> Ces outils sont bons pour le boilerplate : fichiers de config, scaffolding de tests, refactors répétitifs. Ils sont aussi très bons pour avoir l'air corrects tout en se plantant. J'ai mass-accepté des suggestions qui compilaient, passaient le linter, et faisaient quand même n'importe quoi parce que j'avais arrêté de faire attention.
>
> Les chiffres de productivité sont glissants. GitHub peut dire que les utilisateurs de Copilot « acceptent 30% des suggestions », mais acceptation n'est pas correction, et correction n'est pas valeur. L'étude Uplevel de 2024 n'a trouvé aucune différence statistiquement significative dans le débit de PR entre les équipes avec et sans assistant IA.

**« Qu'est-ce qui rend ce texte évidemment IA ? »**

- Le rythme reste un peu trop régulier (contrastes nets, paragraphes de taille proche)
- Les citations d'études nommées peuvent sonner comme des placeholders plausibles
- La dernière phrase penche vers le slogan

**Version finale :**

> Les assistants de code IA accélèrent le travail sur les tâches répétitives. Pas sur l'ensemble du processus, et certainement pas sur l'architecture.
>
> Ils sont très bons pour le boilerplate : fichiers de config, scaffolding de tests, refactors répétitifs. Ils sont aussi très bons pour avoir l'air corrects tout en se plantant. J'ai accepté des suggestions qui compilaient, passaient le linter, et faisaient quand même n'importe quoi parce que j'avais arrêté de lire.
>
> Les développeurs que j'interroge se répartissent en deux camps. Certains s'en servent comme autocomplétion pour les corvées et relisent chaque ligne. D'autres l'ont désactivé après que l'outil n'arrêtait pas de suggérer des patterns dépréciés. Les deux positions se défendent.
>
> Les métriques de productivité sont glissantes. GitHub peut annoncer que les utilisateurs « acceptent 30 % des suggestions », mais acceptation n'est pas correction, et correction n'est pas valeur. Sans tests, on en est réduit à deviner.

**Résumé des modifications :**

- Artéfacts de conversation supprimés (#21: « J'espère que cela vous sera utile ! », « N'hésitez pas à »)
- Inflation de signification supprimée (#1: « témoignage durable », « tournant décisif », « rôle crucial »)
- Langage promotionnel supprimé (#4: « révolutionnaires », « nichés », « fluides, intuitives et puissantes »)
- Attributions vagues supprimées (#5)
- Participes superficiels supprimés (#3: « soulignant », « reflétant », « contribuant à »)
- Parallélisme négatif supprimé (#9: « Il ne s'agit pas simplement de X ; il s'agit de Y »)
- Règle de trois supprimée (#10) et cycle de synonymes (#11: « catalyseur/partenaire/fondation »)
- Tirets cadratins réduits (#15), emojis supprimés (#19), gras mécaniques supprimés (#16, #17)
- Évitement de la copule corrigé (#8: « constitue », « fait office de », « se positionne comme »)
- Section défis/perspectives supprimée (#6: « Malgré des défis... continue de prospérer »)
- Hedging supprimé (#25), remplissage supprimé (#24: « Au cœur de »)
- Conclusion positive générique supprimée (#26: « L'avenir s'annonce prometteur »)
- Voix et personnalité injectées (Part 4: rythme varié, première personne, opinions, précision)

## Reference

Based on:

- [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) (WikiProject AI Cleanup)
- [Wikipedia FR: Aide:Identifier l'usage d'une IA générative](https://fr.wikipedia.org/wiki/Aide:Identifier_l%27usage_d%27une_IA_g%C3%A9n%C3%A9rative)
- [Wikipedia FR: Projet:Observatoire des IA](https://fr.wikipedia.org/wiki/Projet:Observatoire_des_IA)
- [Labbé, Labbé & Savoy — ChatGPT as speechwriter for the French presidents](https://arxiv.org/abs/2411.18382) (the only quantified stylometric study of AI-generated French: « également », « défi », tense and pronoun profiles)
- [The Conversation — Comment « dé-IA-iser » nos écrits](https://theconversation.com/comment-de-ia-iser-nos-ecrits-pour-eviter-la-disparition-des-particularites-des-langues-281811)
- [Next — Comment reconnaître les sites d'infos générés par des IA](https://next.ink/165310/comment-reconnaitre-les-sites-dinfos-generes-par-des-ia/) (residual-artifact hunting method)

**Freshness warning:** AI tells expire. The em dash lost most of its diagnostic value after OpenAI's November 2025 fix; published marker lists get reverse-engineered into evasion tools within months; and humans increasingly adopt AI vocabulary by exposure. Treat every lexical list here as dated — the structural principles (dispersion, register, specificity, soul) age far slower than the word lists.

Key insight: LLMs generate the most statistically likely token sequence. The result trends toward the average across all possible contexts. Making text human means making it _yours_: specific, opinionated, idiosyncratic.
