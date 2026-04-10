---
name: humaniseur-fr
description: "Remove AI-writing patterns from French text and inject voice, personality, and soul. Use when editing, reviewing, rewriting, or cleaning up French content that reads like ChatGPT/Claude output. Humanize, humanise, déslopifier. Detects and fixes 27 patterns: AI vocabulary overuse (crucial, essentiel, notamment, par ailleurs, dans le paysage), anglicisms from English-first models (faire du sens, adresser un problème), copula avoidance, formulaic openings (À l'ère de, Dans le paysage actuel), superficial participle analyses (-ant), em dash overuse, redundant adjective doublets, rule of three, sycophantic tone, typographic tells (curly quotes instead of guillemets). Trigger on: humaniser, déslopifier, rendre plus humain, nettoyer le texte IA, enlever le slop, réécrire pour que ça sonne humain, make it sound human."
user-invocable: false
license: MIT
compatibility: Designed for Claude or similar AI agents.
metadata:
  author: samber
  version: "1.0.2"
  openclaw:
    emoji: "🤖"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion
---

# Humaniseur : supprimer les patterns d'écriture IA du français

## Your task

When given French text to humanize:

1. **Identify AI patterns** - Scan for all 27 patterns listed below
2. **Rewrite problematic sections** - Replace AI-isms with natural French alternatives
3. **Preserve meaning** - Keep the core message intact
4. **Maintain voice** - Match the intended tone and register
5. **Add soul** - Don't just remove bad patterns; inject actual personality (see Part 3)
6. **Do a final anti-AI pass** - Ask: "Qu'est-ce qui rend ce texte évidemment IA ?" Answer briefly with remaining tells, then revise

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

**Formulaic openings to kill on sight:**

- « Dans le paysage [actuel/numérique/contemporain] de... »
- « À l'ère de... »
- « Dans un monde [où/trépidant/tumultueux]... »
- « Il est essentiel/crucial de noter que... »
- « Plongeons dans... » (the French "Let's dive into")

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

### Pattern 18 — Majuscules de titre à l'anglaise

French headings capitalize only the first word (and proper nouns).

**Avant :** ## Négociations Stratégiques Et Partenariats Globaux **Après :** ## Négociations stratégiques et partenariats globaux

### Pattern 20 — Guillemets et typographie

ChatGPT uses English curly quotes ("..."). French requires chevron quotes (« ... ») with non-breaking spaces. Also check: spaces before colons/semicolons/exclamation marks/question marks, and French number formatting (1 000,50 not 1,000.50).

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

---

## Part 3: Personality and soul

**Avoiding AI patterns is only half the job.** Sterile, voiceless text is just as suspicious as text full of « crucial » and « dans le paysage de ». This is the dimension most "humanization" guides ignore.

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

**Utiliser le second degré.** LLMs are constitutionally incapable of authentic irony. Understatement, light sarcasm, self-deprecation: unfakeable markers. « On a quand même inventé un truc qui code mieux que nous quand on est fatigué, ce qui est à peu près tout le temps » does not come from an LLM.

**Être précis sur les ressentis.** Not « cela est préoccupant » but « il y a quelque chose de dérangeant à voir des agents tourner à 3h du matin sans personne pour les surveiller. »

---

## Process

1. Read the input text carefully
2. Identify all instances of the 27 patterns
3. Rewrite each problematic section
4. Inject voice and personality (Part 3)
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
- Voix et personnalité injectées (Part 3: rythme varié, première personne, opinions, précision)

## Reference

Based on:

- [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) (WikiProject AI Cleanup)
- [Wikipedia FR: Aide:Identifier l'usage d'une IA générative](https://fr.wikipedia.org/wiki/Aide:Identifier_l%27usage_d%27une_IA_g%C3%A9n%C3%A9rative)
- [Wikipedia FR: Projet:Observatoire des IA](https://fr.wikipedia.org/wiki/Projet:Observatoire_des_IA)

Key insight: LLMs generate the most statistically likely token sequence. The result trends toward the average across all possible contexts. Making text human means making it _yours_: specific, opinionated, idiosyncratic.
