# Playbooks

<!-- toc: jolt | multi-threading | map | eb-engagement | renewal-expansion | salary-ask | decision-announcement | cross-cultural -->

## JOLT — the no-decision protocol

**Trigger.** Deal stuck. Champion present. Pain validated. Solution fits. But the buyer can't get to a decision. 40–60% of pipeline that doesn't close is "no decision," not lost-to-competitor.

**The diagnosis:** the buyer is facing **fear of messing up** (FOMU), not fear of missing out (FOMO). Status quo = career-safe. Buying = personal risk. The classic moves (urgency, FOMO appeals, escalation) make FOMU **worse** because they amplify the perceived risk.

**The four moves** (J-O-L-T):

### J — Judge the indecision

Distinguish indecision from disinterest. Calibrated questions:

- _"What would have to be true for you to move forward?"_
- _"If I told you the deal was off, what would you feel — relief, or frustration?"_

Relief = no real fit; respect the no. Frustration = indecision, which JOLT addresses.

### O — Offer your recommendation

Most AEs lay out options to "let the buyer choose." That **increases** indecision because it adds decision load.

Make the call. _"Based on what you've told me, I'd recommend the standard tier with the security add-on. The enterprise tier is overkill for your stage; we can revisit at renewal if the user count grows."_

The buyer's job is now to disagree with a specific recommendation, not to construct a decision from scratch. Indecision drops.

### L — Limit the explore

Cap the evaluation. _"Based on your team's capacity and the discovery we've done, I think two more meetings will get us to a decision. Beyond that, the analysis cost outweighs the differentiation between options."_

You're explicitly removing the option to keep evaluating forever — which is what FOMU defaults to.

### T — Take risk off the table

Specific risk-reduction asks the buyer hasn't articulated:

- **Pilot conversion clause.** "If quarter 1 doesn't show [specific metric], you have a documented exit at no penalty."
- **Migration support included.** "We'll do the data migration ourselves at no extra cost — your team won't carry the technical risk."
- **Reference call with similar customer.** Not a marketing reference — a "tell me what went wrong" call with a customer at the buyer's stage who chose your tool.

The risk reductions must address the **specific** FOMU. Generic "money-back guarantees" don't work because the FOMU isn't financial; it's career.

**Failure signal.** Even with all four moves, the buyer continues to defer. The FOMU is structural (their organisation genuinely can't decide) — re-qualify and de-prioritise.

---

## Multi-threading sequence — from 1 contact to 4–7 stakeholders

**Trigger.** You have one solid contact (champion or strong coach). The deal is real. Now you need the EB, technical evaluator, security, finance, and procurement before signature. Multi-threading without burning the champion is a precise sequence.

**The "validate with X" move.** Frame outreach to other stakeholders as in service of the champion's success.

_Script._ "I want to make sure when we put a recommendation together, it lands the first time. It would help me to spend 20 minutes with [name] on the security side so I can speak to their concerns when we present. Are you open to a quick intro?"

The frame: you're protecting the champion from internal pushback by anticipating it.

**The CC-the-EB move.** When the EB hasn't been engaged yet but you have visibility, copy them on substantive emails (NOT discovery noise). Send a recap of a major milestone or a new piece of technical validation, addressed to the champion, CC'd to the EB. This puts your name in the EB's inbox without asking for their time.

**The earned right to the EB meeting.** Don't ask for the meeting until you've earned it. Earned right = (a) named pain that maps to the EB's mandate, (b) some technical validation that the solution works for them, (c) a champion willing to vouch for your time. Typical sequence:

1. Discovery with the champion → surface pain + map MEDDPICC.
2. Technical validation call (champion + technical evaluator) → prove fit.
3. Internal advocacy by champion (you're not in the room) → champion socialises with EB.
4. EB meeting requested by champion or by you with champion's blessing.

Going for the EB meeting before step 3 is asking for their time without a reason for them to give it.

**Champion-arms-the-deal kit.** Materials your champion should have for internal selling:

- **One-pager** (their internal pitch deck slide). Their words, their problem, your solution. They send this to the EB.
- **Business case template** (with assumptions they fill in). Do NOT pre-fill the numbers — let them own the model so they own the close.
- **Objection FAQ** (procurement, security, finance). What internal stakeholders will ask, and the 1-paragraph answer.
- **Comparison sheet** (you vs status quo / you vs competitor). Honest about the trade-offs — champions distrust over-claimed comparisons.

**Failure signal.** The champion refuses to introduce you to the EB despite a clean ask. Either they don't have the political capital (build it), they're not actually pro-deal (re-qualify), or they're protecting their gatekeeper position (an enjeu issue — surface it directly).

---

## Mutual Action Plan (MAP) — the close timeline as artifact

**Trigger.** Late discovery, after you've validated MEDDPICC has the C (champion) and you can sketch the Decision Process. Often round 2–3 of substantive conversations.

**Why a MAP works.** The MAP is the negotiation's commitment device. Two effects:

- **Surfaces hidden steps.** "We need legal" / "we need infosec" / "we need a board update" — these are the 30-day delays that hide. The MAP forces them visible early.
- **Creates joint ownership.** A MAP the buyer co-authors becomes their plan, not yours. They defend its dates internally.

**The structure** (a single table; copy into Google Docs or Notion):

| # | Milestone | Date | Owner | Dependency | Status |
| --- | --- | --- | --- | --- | --- |
| 1 | Deeper discovery (technical) | YYYY-MM-DD | Champion + your SE | — | Done |
| 2 | Security questionnaire returned | YYYY-MM-DD | Their security lead | #1 | In flight |
| 3 | Pricing aligned | YYYY-MM-DD | Champion + you | #1 | Pending |
| 4 | EB business case meeting | YYYY-MM-DD | Champion + EB + you | #2, #3 | Scheduled |
| 5 | Procurement intake | YYYY-MM-DD | Buyer procurement lead | #4 | Not started |
| 6 | MSA redlines exchanged | YYYY-MM-DD | Both legal teams | #5 | Not started |
| 7 | Final approvals | YYYY-MM-DD | EB + CFO | #6 | Not started |
| 8 | Signature | YYYY-MM-DD | EB | #7 | Not started |
| 9 | Kickoff scheduled | YYYY-MM-DD | Customer success | #8 | Not started |

**How to introduce a MAP without making the buyer feel pushed.**

_Script._ "We've covered a lot of ground. To make sure I don't drop the ball on what you need from us, do you mind if I share a working timeline of what I think the next steps look like? I'd love your edits — you'll know your internal process better than I will."

The framing: it's for **your** discipline, you're asking them to correct **your** assumptions. Buyer ownership emerges from the corrections.

**MAP stalls as diagnostics.** When a MAP stops moving, the stall is the most diagnostic data in the deal. Decode:

- _Stalls between #2 and #3._ Security or pricing isn't actually validated. Surface the real concern.
- _Stalls between #3 and #4._ Champion can't get the EB meeting → champion test failed → re-qualify or rebuild capital.
- _Stalls between #5 and #6._ Procurement is running the playbook (escalation, fixed budget) — see [objections.md#procurement-playbook-awareness](objections.md#procurement-playbook-awareness).
- _Stalls between #6 and #7._ Legal disagreement is real. Don't push date — push for legal-to-legal call.
- _Stalls between #7 and #8._ Buyer signal of buyer's remorse or new objection. Diagnose with calibrated questions, not pressure.

**Failure signal.** The buyer refuses to put dates on the MAP, or repeatedly defers them by 1–2 weeks each time. Either MEDDPICC is incomplete (no real Decision Process visibility) or you're being JOLT-trapped (see [JOLT](#jolt--the-no-decision-protocol)).

---

## Executive sponsor (EB) engagement — the 5-minute opening

**Trigger.** The EB is now on the call. You have 30 minutes (often less). The first 5 minutes determine whether the meeting is productive.

**What NOT to do in the first 5 minutes:**

- Re-pitch the product. The EB has been told the product story by your champion; if they're in the meeting, they accept it as a starting point.
- Walk through company background or "who we are." Their time is the constraint; respect it.
- Open with discovery questions. They'll feel sold to. Discovery happens after they've decided you're worth their attention.

**The 5-minute opening structure:**

1. **Acknowledge their time and the path.** _"[Champion] has shared what's been in scope. I'd like to use the 30 minutes you've given me to confirm three things and then have your direction on whether we move forward."_
2. **State the strategic frame.** Not the product — the **business problem class** in their language. _"You're trying to take 8 days out of the close cycle without adding headcount in finance. That's the goal we're solving for."_
3. **Acknowledge the trade-off.** EBs trust counterparties who acknowledge limits. _"This isn't free — there's a 60-day implementation cost and a change-management curve for your AP team. The question is whether the payback period justifies it."_
4. **Invite their question.** _"Before I take you through what we've validated, what's the one thing you want my answer to?"_

The ask is not "tell me about your business." The ask is "name the question the meeting must answer to be worth your time." The EB's answer reshapes the rest of the meeting around their actual decision criterion.

**The "earned right" frame.** You earned this meeting through prior work. The opening signals that you take their time as a gift, not an entitlement.

**Failure signal.** EB asks "remind me what your company does?" within the first 5 minutes. Champion didn't do their job; pivot to a fast 60-second pitch and treat the meeting as a soft re-discovery.

---

## Renewal & expansion — the 90-day coopétition cadence

**Trigger.** 90 days before the renewal date. This is when most AEs make the most expensive mistake of the year: starting renewal conversations 30 days out, when the buyer has all the leverage.

**The 90-day cadence:**

### T-90 — value review (no commercial ask)

Schedule a "year-in-review" with the champion + at least one user and one finance contact.

- **Usage data.** Specific metrics — accounts onboarded, time saved, defects prevented. Numbers, not narratives.
- **Outcomes.** Map the metrics to the original business case. Did the deployment hit the original targets?
- **Friction points.** What's broken or could be better. Naming this honestly builds credibility for the renewal ask.

No ask in this meeting. The output is a written value summary you and the buyer agree on.

### T-60 — internal stakeholder mapping

Multi-thread (see [Multi-threading sequence](#multi-threading-sequence--from-1-contact-to-47-stakeholders)) BEFORE the renewal. New stakeholders since the original deal — new EB, new CFO, new procurement lead. They didn't sign the original; their priors aren't aligned with renewal.

Expand the conversation by introducing your customer success executive or specialist to the new stakeholder before procurement gets involved.

### T-45 — expansion proposal (separate from renewal)

If the data supports expansion (additional seats, new modules, sister entity), propose it as a **separate** track from the renewal. Why: bundling expansion into renewal lets procurement use renewal pressure to discount expansion. Separating them forces each to stand on its own merit.

### T-30 — renewal commercial ask

Bring the renewal commercial proposal. By now, the value review is documented, multi-threading is done, and expansion is a parallel conversation.

The commercial ask is **not** "sign the same deal again." It's structured:

- **Renewal terms** (likely the same or modest uplift, justified).
- **Multi-year option** (3-year locks rate; trade for usage commit and reference rights).
- **Expansion option** (separate price, separate scope).

### T-10 — escalation if needed

If procurement is grinding, the EB you multi-threaded at T-60 is now a known stakeholder you can escalate to. _"We're inside ten days. I want to make sure your finance team has what they need; can we get on a call with [EB] to align?"_

**Anti-pattern: auto-renew and expand later.** Easy in the moment but compounds badly. The expansion conversation against an already-renewed customer has none of the renewal-pressure leverage. Procurement extracts more on the expansion than they would have at renewal.

**Failure signal.** Champion goes cold at T-60. Either internal change (reorganisation, departure) or status quo bias is now working against you. Diagnose immediately — by T-30 it's too late.

---

## Salary ask — the structured raise / offer conversation

**Trigger.** You're asking for a raise (mid-cycle or annual) or negotiating a fresh offer above the recruiter's first number.

**Pre-conversation preparation:**

- **Market data.** Pull from at least 3 sources (industry surveys, public salary databases, peers you trust). Bring 2–3 specific data points to the conversation.
- **Multi-axis Mandascan.** Don't negotiate base alone. Sketch your 5 points across base, variable, equity, sign-on, leave/training, title, scope, review cadence.
- **Anchor range.** Use a bolstering range whose bottom is your real target — see [references/tactics.md](tactics.md#anchoring). Real ask $185K → anchor "$185K to $210K based on the scope and market data".
- **Pre-empt the 5 objections** (see scripts below).

**Defensive scripts for the 5 classic employer objections:**

- _"The budget is closed."_ → "Help me understand the constraint. Is it base envelope, total compensation, or department-level? If today's number is fixed, what would unlock movement at the next review? And who would I talk to about a structural exception — a sign-on or a one-off retention bonus?"
- _"You're at the top of the band."_ → "Help me understand how the band was set and how often it's recalibrated. If the band itself is stale vs market, that's the conversation we should have. What would change for me to be re-banded at the next level?"
- _"We're holding everyone flat this year."_ → "I understand the organisation-wide constraint. My ask is grounded in scope I've taken on beyond my role spec — let me walk through that, and then let's talk about whether this is a flat-year exception or a delayed-but-committed cycle conversation."
- _"We don't give raises mid-cycle on principle."_ → "I hear that. The principle protects against arbitrary raises — mine isn't. Can we agree on a structural exception (scope change, retention) or commit to a specific cycle-aligned raise so I'm not asking again in 9 months?"
- _"Promotion comes before raise."_ → "Sequence works for me — what's the path to promotion, and what's the timeline? If we're 6 months out, I'd like a pre-commit on the compensation uplift now, conditional on the promotion landing."

**Counter-offer from your current employer.** When you resign and they counter, treat it as a yellow flag. Statistical data: roughly half of accepters leave within 12 months. Decision rule: take the counter only if the proposal includes a structural change (new role, scope, manager) — not just a pay match. Trust frame: _"They needed me to threaten to leave before paying me fairly."_

**Failure signal.** You leave the conversation with a vague _"we'll see what we can do."_ Re-anchor with a specific date and number before ending: _"If I haven't heard back by [specific date] with a concrete number, I'll assume the answer is no and adjust accordingly."_

---

## Decision announcement / difficult 1:1

**Trigger.** You're announcing an unpopular decision (layoff, salary freeze, restructuring, role change) or running a difficult performance conversation.

**The mistake to avoid:** softening the message until the substance is muddled. Reports who walk out unsure what just happened spread the worst-case interpretation through the team. Direct delivery, paired with explicit emotional space, is the discipline.

**Three-part structure:**

1. **The fact.** Specific, complete, no euphemism. _"As of next quarter, salaries are frozen across the organisation."_ / _"We've decided to eliminate the X role. Your last day is [date]."_ / _"I'm placing you on a performance plan starting Monday."_ No softeners, no preamble.
2. **The OCP (the why).** Not the spin — the actual shared goal that makes the decision defensible. _"This freeze preserves every role through the cycle. The alternative was reductions."_ / _"This plan exists to give you a real path to either turning this around or finding a better fit elsewhere."_ The OCP must be true; manipulation here destroys trust that compounds for years.
3. **The emotional space.** _"I expect this will land hard. Take the rest of the day; my office is open tomorrow for questions."_ Then **stop talking**. Most managers fill the silence with more rationale; the silence is what the report needs to process.

**Layoff-specific additions:**

- **Own it.** Use "I decided" not "the company decided." If you can't, you shouldn't be delivering the message.
- **Numbers up front.** Severance, benefits continuation, equity treatment, last day, start of any garden leave. Don't bury the practicalities.
- **Deep enough to avoid round two.** A second wave 6 weeks later destroys morale more than a single larger cut. If more is possible, don't claim "this is it" unless it is.
- **Address survivors within 48 hours.** Survivors watch how the departed were treated — that signal, not the layoff itself, predicts retention.

**Difficult performance conversation — the STATE move:**

1. **S**hare the facts. Specific observable behaviours, not interpretations. _"In the last 3 sprints, you missed your committed deliverables and didn't surface the slip until the retro."_
2. **T**ell your story. The interpretation you're working with. _"What I'm reading from this is that either the scope was unrealistic, or there's something blocking that I don't know about."_
3. **A**sk for theirs. _"What's your read on what happened?"_
4. **T**alk tentatively. Hold your interpretation as a hypothesis, not a verdict.
5. **E**ncourage testing. Invite disagreement explicitly. _"What am I getting wrong here?"_

**The recadrage variant** — when behaviour, not performance, is the issue:

> _"I understand you were frustrated about [event] — that's legitimate, and I want to talk about it separately. What I cannot accept is [specific behaviour]. Going forward, here's the line: [specific expectation]. Are we aligned?"_

The legitimacy of the emotion is granted; the behaviour is not. Conflating them — refusing the emotion or accepting the behaviour — produces lasting damage either way.

**Failure signal.** The report leaves the meeting saying "thank you" or "I appreciate it." That's almost always a face-saving exit, not understanding. Schedule a follow-up within 48 hours to confirm landing.

---

## Cross-cultural deal — opening the room

**Trigger.** First substantive meeting in a cross-cultural commercial or diplomatic context (joint venture, M&A, international procurement, multi-country licensing).

**Pre-meeting preparation:**

- **Map the gap.** Locate your team and theirs on cultural dimensions: communication directness, hierarchy steepness, time orientation (polychronic / monochronic), trust source (task-based vs relationship-based), confrontation style. The friction lives at the gap, not in either culture's absolute position.
- **Protocole research.** Specific to the country, the institution, and the seniority level. When in doubt, default minimal — formal address, conservative dress, no gifts heavier than a logoed pen. A misjudged gift (€10K rare book to a senior public official) can be perceived as bribery and destroy the deal before the substance is opened.
- **Interpreter preparation.** If you bring an interpreter, brief them on tone, key terms, and walk-away conditions. Pre-agree silent signals so you can request a clarification or a pause without breaking the flow. Consecutive translation builds trust; simultaneous is faster but distancing.

**Opening script:**

> _"My name is [name]. I'm [origin / context]. I'll do my best in [language] and ask you to help me when I'm unclear. Before we discuss specifics, I'd like to understand what success looks like for [counterparty's organisation] — and then I'll share what we're hoping to build together. Is that OK?"_

The script acknowledges asymmetry, claims a shared frame ("together"), and invites their voice first.

**Indirect refusal decoding.** In high-context cultures (much of Asia, Middle East, parts of Latin America), refusal often comes wrapped in soft language: _"That would be difficult"_ / _"We will study it"_ / _"Maybe next time"_ / silence. Treat any of these as a "no" worth surfacing — but do not push. _"I hear there are concerns. Help me understand what would have to change for this to work."_

**Time horizon match.** Counterparts in patient cultures (Japan, China, much of Asia) play 5–30-year horizons. Pushing for quarterly close in those rooms reads as disrespect. Match their cadence, even if your internal pressure is shorter.

**Failure signal.** The counterparty repeats themselves with slight variations and you keep responding to the surface content. The repetition signals you missed the point — slow down, ask a calibrated question, surface what they're trying to communicate.
