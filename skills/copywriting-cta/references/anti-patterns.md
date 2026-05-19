# Anti-Patterns — Failure Modes to Call Out by Name

Twelve failure modes that recur across end-of-article CTAs. When the user's inputs put them at risk of one of these, call it out explicitly. Do not soften.

---

## 1. "Subscribe for more"

**Why it fails:** Says nothing about value, frequency, content, or who else is in. Conversion floor.

**Fix:** State the value proposition, frequency, and a proof signal in one line. "Get one debugging trick a week. Friday morning. 12,000+ engineers read it."

---

## 2. Generic verbs: "Learn More" / "Read More" / "Click Here" / "Get Started"

**Why they fail:** Andy Crestodina is blunt: these are not calls to action. They name no value and no destination. NN/g's "Get Started" Stops Users documents how "Get Started" specifically funnels first-time visitors into signup flows they didn't ask for.

**Fix:** Replace with the specific noun and verb. "Read more" → "Read the deep-dive on Go runtime maps." "Get Started" → "Start the 5-minute tutorial."

---

## 3. Three equally weighted buttons

**Why it fails:** Hick's Law. Equal visual weight on multiple CTAs creates decision paralysis. Reader picks none.

**Fix:** One primary CTA (button), demote others to subordinate text links or smaller secondaries. The StoryBrand "direct + transitional" dyad is the proven pattern.

---

## 4. Begging for comments

**Why it fails:** "Let me know what you think in the comments!" gets ignored. The reader can't think of anything specific to say and bounces.

**Fix:** Ask a specific question that requires recall of a personal experience or technical opinion. "What's the worst bug you shipped on a Friday afternoon?" gets answers; "What do you think?" does not.

---

## 5. Hard-sell CTA ("Book a Demo" / "Talk to Sales") on a TOFU post

**Why it fails:** Top-of-funnel readers are discovering the topic, not ready to buy. A hard-sell ask at the bottom collapses credibility for the rest of the article retroactively. For sophisticated audiences (technical, professional, niche-expert), the effect is even stronger. Yacine Hmito (Head of Technology, Fabriq): "If I see 'Book a demo' or 'Talk to Sales,' I am out." The same reflex applies to readers in professional services, healthcare, journalism, and any context where credibility is the readership currency.

**Fix:** Use a transitional asset (PDF, template, calculator, checklist) if this is brand content. Use an author-signature subscribe if this is independent content. Save "Book a Demo" for BOFU content that explicitly precedes a buying decision — and even then, prefer "Talk to a Human" or "Get a 20-min audit" verbs (both produced documented 110%+ conversion lifts vs. "Book a Demo").

---

## 6. Buzzword stacking

**Why it fails:** Generic adjectives stack without adding information. Every industry has its own catalog: tech ("AI-infused," "enterprise-grade," "single pane of glass," "synergy," "leverage," "seamless," "scalable," "at scale," "digital transformation" — Redis published an audit of buzzwords developers hate), finance ("alpha," "asymmetric upside," "best-in-class"), wellness ("transformative," "holistic," "intentional," "elevated"), B2B SaaS ("unlock," "empower," "supercharge"). Each empty word cuts credibility. By word four, the reader has tuned out.

**Fix:** Replace every adjective with a concrete number or example. "Enterprise-grade reliability" → "99.99% uptime, measured over the last 24 months." "Seamless integration" → "Three steps, works with [specific tools]." "Transformative coaching" → "12-week program, 1:1, every session recorded."

---

## 7. Theatrical urgency

**Why it fails:** Countdown timers that reset on page refresh; "Only 2 left!" on infinite digital goods; "Offer ends soon!" recurring weekly. Sophisticated readers detect this in 0.5 seconds and bounce — permanently.

**Fix:** Only use urgency when the deadline is real (cohort starts, conference tickets sell out, beta closes). State the actual date and what happens if the reader misses it. If you don't have real urgency, don't manufacture it.

---

## 8. Stale proof

**Why it fails:** "Trusted by leading companies" with no logos. "Join thousands of happy users." "Award-winning newsletter" with no award named. Vague proof performs worse than no proof — it signals "we know we should have specifics, but we don't."

**Fix:** Real number, named logos, named testimonial. "Join 2,437 engineers" beats "thousands." Recognizable brand logos beat "Fortune 500 customers." Named testimonial with role and company beats "Happy Reader."

---

## 9. Subscribe form with seven fields

**Why it fails:** Each additional form field reduces conversion. Email-only forms convert 2-5x better than multi-field forms in most published case studies.

**Fix:** Capture email only. Ask for name, role, or preferences after the initial subscribe, via a welcome email or a profile completion prompt. Never block the first conversion on metadata you can collect later.

---

## 10. CTA contradicts the article

**Why it fails:** Article argues vendor neutrality, then footer says "Sign up for our SaaS." Article teaches readers to do X themselves, then footer says "Let us do X for you." The CTA undermines the article's thesis.

**Fix:** Align the CTA with the article's argument. A vendor-neutral piece earns a newsletter / RSS subscribe. A teach-yourself piece earns a deeper-content offer. Save the product pitch for posts where the product is the thesis.

---

## 11. Marketing voice on an independent / credibility-driven publication

**Why it fails:** End-of-article CTAs in over-eager marketing tone immediately downgrade the perceived authority of the entire post. The pattern crosses every topic: a journalist's essay ending in "Don't miss out on our amazing weekly insights!"; a niche-expert newsletter closing with "Subscribe now to join thousands of happy readers!"; a personal blog footer that reads like a B2B SaaS hero. Each one tells the reader "the human who wrote the article isn't the human who wrote this CTA."

**Fix:** Adopt the voice of the author signing off. Restrained, specific, no exclamation marks, no royal-we. Compare:
- ❌ "Don't miss out on our amazing weekly insights! Subscribe now to join thousands of happy readers!"
- ✅ "If this was useful, the weekly digest covers one thing in depth every Friday. Subscribe here. RSS over here."

For technical blogs specifically, Cecilia Stallsmith (Calyx) put it this way: "Run content by your dev team. If they cringe, edit." The same test works for any audience: read the CTA aloud to one trusted reader from your target audience; if they wince, rewrite.

---

## 12. Same CTA for every post regardless of intent

**Why it fails:** A "Subscribe to the newsletter" CTA glued to the bottom of every post — tutorial, opinion essay, release announcement, conference recap — treats every reader the same. Tutorial readers want depth; release-announcement readers want to try the code; conference-recap readers want next year's event.

**Fix:** Three to five CTA templates, one per post type. Tutorial → newsletter or related deep-dive. Product / project release announcement → try-it action + source link. Opinion piece → reply prompt + newsletter. Conference / event recap → next event registration + photo album. Review post → comments + related reviews. The post tells you which template fits; never default to one.

---

## How to use this list

When composing a CTA recommendation, scan this list against the user's inputs. If their context or stated goal would put them on one of these failure modes, surface it before writing the CTA. Format:

> ⚠️ Anti-pattern risk: [name from this list]. [One sentence on why it applies to your case]. [The fix.]

Do not soften the language. The user pays for direct, contrarian feedback; sycophancy is a disservice.
