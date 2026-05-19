# CTA Archetypes (A through K)

Eleven archetypes covering the independent / newsletter / brand contexts × the full goal taxonomy. Each entry includes: when it fits, copy template, form spec, verbatim example from a named publication, and rough conversion expectation.

The archetypes are designed to work across topics: a personal essay on indie filmmaking, a finance newsletter, a SaaS engineering blog, a hobby cooking blog, a B2B HR tech site. Adapt the wording to the topic; the structural prescriptions are general.

---

## A. Author-signature subscribe (independent blog, newsletter growth or social follow)

**When it fits:** Personal or independent blog of any topic. Goal is to grow an RSS / email / social audience without alienating the reader. Solo-author voice. First-time and returning visitors mixed.

**Copy template:**
> Posted [date]. If you liked this, you can subscribe to the [newsletter / weekly digest / monthly notes] — [frequency promise]. RSS [here]. [Optional: social handle(s) for follow].

**Form:**
- Single short paragraph or one-line signature, no boxed UI.
- Visual weight: **low**. Reads as a byline, not an ad.
- Layout: 1-3 inline text links, no button. Optional: native subscribe widget on its own line below.
- Placement: end-only. No mid-article repetition. No sticky.

**Verbatim example — Simon Willison (simonwillison.net), technical blog:**
> Posted [date] at [time]. Follow me on Mastodon, Bluesky, Twitter or subscribe to my newsletter.

**Verbatim example — Stripe blog, brand publication using author-signature style:**
> Stay connected with Stripe and receive new blog posts in your inbox. Stripe builds financial tools and economic infrastructure for the internet. [email field]

**Conversion expectation:** 0.3-2% of unique readers subscribe per post. Above 2% is top-decile.

---

## B. Inline action + source link (any context, try-it / direct action)

**When it fits:** Article walks through a doable action: code, recipe, exercise routine, financial calculation, design template, workout, drill, prompt, configuration. Goal is for the reader to try the action immediately. Reader trusts artifacts over copy.

**Copy template:**
> Try it:
> ```
> [code snippet / recipe steps / template link / prompt / calculation]
> ```
> Source: [link to repo / template / spreadsheet / Figma file / GitHub gist]. Feedback welcome. If you build something with it, [reply / DM / open an issue] — I'd love to see it.

**Form:**
- Code block or embedded artifact (recipe card, downloadable template, interactive calculator) immediately above the link line.
- Visual weight: **medium**. The artifact carries the weight, not a button.
- Layout: artifact + 1-2 plain text links.
- No "Star the repo!" or "Save the recipe!" button at the bottom. That sort of ask belongs on the artifact's own page, not the blog footer.

**Verbatim example — Fly.io blog, technical publication using restrained share-only pattern:**
> Share this post on Twitter | Share this post on Hacker News | Share this post on Reddit
> Next post ↑ / Previous post ↓

(Fly.io's blog deliberately omits any subscribe or sign-up ask at the bottom; product CTAs live inline at the top of certain posts. The pattern generalizes: when the artifact in the post is the value, the bottom only needs share affordances.)

**Common variants:**
- **OSS / dev context:** `pip install x`, `npm install y`, `go get z`, plus repo link.
- **Cooking / hobby blog:** "Get the printable recipe card" + link.
- **Finance / spreadsheet context:** "Open the calculator in a new tab" + link to a Google Sheet template.
- **Design / no-code:** "Duplicate this Figma file" + link.
- **Productivity / templates:** "Use the Notion template" + link.

**Conversion expectation:** Hard to attribute directly. Measure via referrer logs on the artifact, downstream artifact-engagement (installs, copies, forks), or query-string tagging (`?ref=post-name`).

---

## C. Reader-supported funding link (independent context, paid support / tip)

**When it fits:** Independent creator with a sustainable readership: writer, journalist, podcaster, indie maintainer, indie analyst, illustrator, researcher. Goal is to convert reader-trust into financial support without begging.

**Copy template:**
> I write / make this on the side. If you find it useful, a [membership / sponsorship / tip] covers about [a day / a week / a month] of work. [Memberful / Patreon / GitHub Sponsors / Buy Me a Coffee / Stripe link] · [one-off tip link]

**Form:**
- Plain text link, no button. Optional: small recurring "members get X" subtext.
- Visual weight: **low**.
- Placement: at the *top* of posts (Dan Luu's documented pattern) OR end-signature. Not both.
- Layout: 1-2 inline text links.

**Verbatim example — Dan Luu (danluu.com), independent technical writer:**
> A couple weeks ago, I added a link to Patreon at the top of posts (instead of just having one hiding at the bottom).

**Generalization to other creator types:**
- **Indie journalist / Substack writer:** "If this is useful, a paid subscription covers the time. [link]"
- **Podcaster:** "Members get the extended cut and the back catalog. [link]"
- **Illustrator / artist:** "Memberships fund the next series. [link]"

**Conversion expectation:** Reader support is a rare event. Don't optimize for conversion rate; optimize for the signal "this is a serious operation worth funding." A small number of high-value supporters outweighs a long tail of $5 tips on operational sustainability.

---

## D. Proof-counted community invite (any context, community join)

**When it fits:** You run a community (Discord / Slack / forum / Circle / Geneva / WhatsApp group) that the article topic touches. Reader could plausibly want ongoing discussion.

**Copy template:**
> Join [N] [readers / makers / writers / parents / investors / climbers / etc.] in [community name] [on platform]. We talk about [specific topic] every [day / week]. [Invite link]

**Form:**
- Boxed block with platform logo + member count + topic.
- Visual weight: **medium**. Button: "Join the [community name]".
- Layout: 1 button + 1 text link to a public area / archive (if any).

**Critical:** The count must be honest. "Join 24 readers" is more compelling than "Join a growing community" because the former is verifiable. Round to actual number, never inflate.

**Conversion expectation:** 1-3% of readers click; 30-60% of clickers actually join.

---

## E. Specific reply prompt (any context, engagement)

**When it fits:** Article makes a claim or shares an experience where the reader plausibly has a counter-example, addition, or related story. Goal is comments / replies / DMs.

**Copy template:**
> [Specific question that requires recall of a personal experience or strong opinion]. Reply, hit comment, or DM me — [contact handle]. I read everything.

**Form:**
- 1-2 sentences. No button.
- Visual weight: **low**.

**The question must be specific.** Replace "What do you think?" with one of:
- "What's the worst hire you've ever made and what tipped you off in the first week?"
- "Which of these three recipes did you try, and what would you change?"
- "What's one investment thesis you've held for 5+ years that you'd defend in public?"
- "Which conference talk changed how you work, and why?"

**Verbatim example — Patrick McKenzie / Bits about Money (paraphrased pattern):**
> Counter-arguments and corrections are welcome. Reply to this email; I read everything, even if I don't always respond in time.

**Conversion expectation:** Specific prompts can hit 1-3% reply rate on newsletters. Generic prompts ("Let me know what you think!") run near zero.

---

## F. Share / restack + native widget (newsletter publication, growth)

**When it fits:** Newsletter on Substack, beehiiv, Ghost, or similar. Goal is subscriber growth. Reader is engaged (they finished a long essay).

**Copy template:**
> If this was useful: a [restack / share] helps more than you'd think — it tells [platform] to show it to people whose feeds look like yours. And if a specific person came to mind while reading, forward it to them.

**Form:**
- One short paragraph asking for restack / share.
- Platform-native widgets (like, comment, restack, share) immediately below.
- Visual weight: **medium**. The native widgets do the visual lifting.

**Verbatim example — Lenny's Newsletter (free posts), B2B operator newsletter:**
> If you're finding this newsletter valuable, share it with a friend, and consider subscribing if you haven't already. There are group discounts, gift options, and referral bonuses available.

**Conversion expectation:** Restack rate 1-8% on Substack. Lenny Rachitsky reports ~78% of free subscribers and ~11% of paid come via Substack recommendations — restacks feed the recommendation algorithm directly.

---

## G. Value-gap tease (newsletter publication, free → paid conversion)

**When it fits:** Free post that exists alongside paid content. Goal is to convert free readers to paying subscribers without bait-and-switch.

**Copy template:**
> This is a free post. Paid members got [specific deeper content] last [time period], including [concrete thing the paid version had]. If you find one in [N] of these useful, the math works out — and you can expense it.

**Form:**
- Italicized paragraph, ends with a "Become a paid member" button.
- Visual weight: **medium**.
- Subtext: "Cancel anytime · Group discounts available · [Refund policy if any]".

**Critical:** Name what the paid version contained. "Subscribe for more" tells the reader nothing. "Paid members got the spreadsheet and three case studies I couldn't share publicly" lets them self-qualify.

**Conversion expectation:** Lenny's documented range is 4-8% free → paid for high-quality newsletters with sustained free → paid teasing. Most newsletters convert 1-3%.

---

## H. Inline sponsor block (newsletter publication, monetization)

**When it fits:** Newsletter with sponsor monetization. Goal is to deliver sponsor value without breaking reader trust.

**Copy template:**
> [Sponsor message in author's voice, 2-4 sentences, names the specific value to a specific reader segment. Signed-off with an explicit "this is a sponsored block" disclosure.]

**Form:**
- Boxed block, clearly demarcated from editorial.
- Placement: **inline, not at bottom.** Packy McCormick (Not Boring) places sponsor blocks inline, mid-essay; the bottom is reserved for native widgets.
- Visual weight: **medium**.
- Disclosure: "This is sponsored by [X]" or "Today's newsletter is presented by [X]" at the top of the block. Required by FTC for US publications.

**Verbatim example — Not Boring (Packy McCormick):**
> Upgrade your team to Ramp: The Official Business Card of Not Boring [...]

**Conversion expectation:** Sponsor CTR is the sponsor's problem to optimize. The publication's job is to maintain the integrity of the block so future sponsors keep paying.

---

## I. Transitional asset / lead magnet (brand publication, TOFU)

**When it fits:** Top-of-funnel content-marketing post. Reader is discovering the topic, not ready to buy. Goal is to get them on the list with a transitional asset (PDF, template, checklist, calculator, swipe file, quiz result).

**Copy template:**
> Get the [specific artifact mentioned in the post] — [PDF / template / checklist / calculator]. [Frequency promise]. [Proof: "12,000+ [persona] use it"]. No upsell.

**Form:**
- Boxed block with the artifact image / thumbnail visible.
- Button: "Send me the [artifact]" or "Download the [artifact]".
- Visual weight: **high**.
- Risk reversal: "Unsubscribe anytime" or "We won't email you unless you ask us to."

**Critical:** The artifact must be the artifact mentioned in the post, not a generic "Ultimate Guide". If the post is "How we cut our customer-support response time by 60%", the asset is "The exact email templates we use", not "The Definitive Guide to Customer Support (47 pages)".

**Conversion expectation:** 1-5% of blog readers download a well-matched transitional asset. Generic "Ultimate Guide" downloads run 0.1-0.5%.

---

## J. Direct + Transitional pair (brand publication, MOFU)

**When it fits:** Middle-of-funnel content-marketing post. Reader is evaluating, comparing. Goal is to capture both buyers (direct) and not-yet-buyers (transitional).

**Copy template:**
> Direct (primary):
> > Start a [N-day] free trial — no credit card. Set up in under [X] minutes.
>
> Transitional (secondary, text link):
> > Or download [specific buyer's asset] (PDF, [N] pages).

**Form:**
- Two visually unequal CTAs. Direct gets the button; transitional gets a text link below or beside.
- Visual weight: **high** for direct, **low** for transitional.
- Layout: Button + text link. NOT two equal buttons.

**Critical:** The visual hierarchy must be unambiguous. Two same-size buttons trigger decision paralysis (Hick's Law). One button + one text link is the high-converting layout. StoryBrand's Donald Miller calls this the "direct + transitional" dyad and treats it as the default for B2B content.

**Conversion expectation:** Combined click-through 3-8% on a well-targeted MOFU post.

---

## K. Direct CTA + risk reversal (brand publication, BOFU)

**When it fits:** Bottom-of-funnel content-marketing post. Reader is ready to act, just needs the friction removed. Goal is signup / demo / purchase.

**Copy template:**
> See [Product / Service] applied to your [workflow / situation]. [N]-minute call. We'll audit your current [process] and show what changes — even if you don't buy.
> [Book a [N]-min audit]
> Risk reversal: No sales pitch. We'll send the recording afterwards.

**Form:**
- Single prominent button.
- Visual weight: **high**.
- Layout: button + 1-2 lines of risk-reversal subtext directly below.
- Proof co-located: small testimonial or logo wall above or below the block.

**Critical:** The button verb must match the offer. PartnerStack's documented test moved "Book a Demo" → "Get Started" and lifted conversion 111.55%. Mailmodo's documented test moved "Book a Demo" → "Talk to a Human" and lifted conversion 110.35%. "Book a Demo" is the lowest-converting BOFU verb in the published record.

**Conversion expectation:** 1-3% of blog readers → MQL on a well-targeted BOFU post. 6-11% on a dedicated landing page reached from the post.

---

## Quick selector

If the user gave context + objective, this table picks the archetype:

| Context \ Objective | Newsletter sub | Try-it / action | Community | Reader support | Trial/Demo | Lead gen | Engagement | Paid upgrade |
|---|---|---|---|---|---|---|---|---|
| Independent / personal | **A** | **B** | **D** | **C** | ⚠️ K (only if BOFU + author IS the product) | I (rare) | **E** | — |
| Newsletter publication | **F** | — | **D** | **H** | — | I (rare) | **E** | **G** |
| Brand / content marketing | I (TOFU) / J (MOFU) | — | **D** | — | **K** (BOFU) | **I** | **E** (rare) | — |
