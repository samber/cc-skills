# Team negotiation

For deals above SMB threshold (and for high-stakes negotiations beyond commercial — joint social negotiations, multi-party mediations, complex hiring panels), you negotiate as a team — not because more people make better decisions, but because role separation prevents the cognitive overload that produces concession errors. This file covers the four-role architecture, the _effet fusible_ pattern, between-round debriefing, and the discipline of in-room signalling.

## Why role separation matters

A single negotiator doing discovery, objection-handling, mandate-tracking, micro-expression reading, and price math simultaneously will fail at one of them. Usually mandate-tracking (which produces a concession breach) or micro-expression reading (which misses the buyer's tell at the closing moment).

Splitting the work across roles preserves the cognitive bandwidth each role actually needs.

## The four roles

Use as many as the deal warrants. SMB: solo or N1 + observer. Mid-market: N1 + N2. Enterprise: full N1 + N2 + SUP + Décideur in retreat.

### N1 — primary negotiator

Front of house. Holds the relationship. Speaks. Applies the listening tactics (TLS écoute, calibrated questions, mirroring/labeling). Their cognitive job is the **flow** — reading the room and routing the conversation.

The N1 should NOT be tracking mandate floors live. Their working memory is already on the buyer's words and behaviour. Mandate-tracking is the N2's job.

### N2 — tactical negotiator and observer

One step back, slightly off-axis. Speaks rarely (only for a deliberate technique like sacrifice or contrast). Their cognitive job is the **observation**:

- Track the Mandascan in real-time. When the N1 approaches a bascule (escalation point), signal.
- Read micro-expressions on the buyer side that the N1 will miss while focused on speaking.
- Note exactly what was agreed, in the buyer's words. The "main courante" (running log) becomes the back-brief reference at wrap-up.
- Detect _effet tunnel_ — the N1 fixating on a sub-axis and losing the global view. When detected, signal a pause.

The N2 is the team's situational awareness. A team without an N2 is a single negotiator with a witness, not a team.

### SUP — supervisor / Alpha-leader

For trinôme negotiations (typically enterprise). Holds strategic continuity across rounds. Doesn't necessarily attend every call — they validate the mandate, review between-round debriefs, and arbitrate when N1 and N2 disagree on tactics.

The SUP is who the negotiator calls during a pause tactique to validate breaching the bascule.

### Décideur — decision-maker, deliberately in retreat

The CRO, VP Sales, or executive who can sign exceptions to the mandate. The discipline: **the décideur is not in the room** during normal negotiation. Their absence creates the **effet fusible** (fuse effect).

#### Effet fusible

The N1's most useful refusal: _"I'd love to do that. I genuinely don't have the authority — let me check with my CRO."_ This is not weakness; it's a structural block on the buyer's escalation pressure. The negotiator cannot be argued past their authority limit because they don't have it. The CRO, in turn, has the discretion to grant the exception or hold the line — without the buyer feeling personally rebuffed.

The fuse only works if the décideur is genuinely absent from the room. Reps who let the décideur join early lose the fuse and now have to argue the mandate themselves. The discipline is to keep the décideur dialled in only at moments where their presence creates value: a senior alignment meeting, signature, or escalation arbitration.

The fuse also works in reverse. When the buyer brings their own décideur in early, that's a signal — they're either cutting their own fuse (a sign of urgency on their side) or skipping a layer to apply pressure on you (a sign of escalation theatre — see [references/objections.md](objections.md#the-escalation-ladder)).

## In-room signalling

When N1 and N2 are in the same room with the buyer, they need to communicate without the buyer noticing. Pre-agree:

- **Slow down signal.** N2 places hand on the table or adjusts a notebook. Means: _"You're approaching a Mandascan limit — don't move further on this axis."_
- **Pause request signal.** N2 makes deliberate eye contact + reaches for water. Means: _"Call a break now — I have something the team needs to know before this continues."_
- **Mandate breach silent veto.** N2 closes the laptop. Means: _"You just breached. We need to back-brief and re-anchor when you can."_

The signals must be planned **before the meeting**. Inventing them live produces visible confusion that the buyer reads as internal disagreement — a leverage point.

## Between-round debrief — the 6 questions

A short focused debrief between every round of a multi-session negotiation. Different from the full RetEx (which happens at end-of-deal — see [references/debrief.md](debrief.md#retex--cold-technical-analysis)). Use a 15-minute slot, immediately after the buyer leaves the call:

1. **Who was in the room?** New attendees signal political shifts. The CFO showing up unexpectedly = they're escalating internally; this changes the mandate.
2. **What was the agenda?** Versus what was actually discussed. A drift signals where the real concerns sit.
3. **What information did we extract?** Not what we delivered. What did we LEARN?
4. **What information did we leak?** Did the N1 over-share on a roadmap point, an internal dependency, a competing deal? Note for next round.
5. **What is true / false / uncertain?** Which buyer claims survive scrutiny? Which need verification before next round?
6. **What were the marquant moments?** A buyer's micro-expression of joy on the SLA term (= you hit their enjeu). A long latence on the budget question (= the budget claim is shaky). A territorial reaction to a multi-thread suggestion (= champion is protecting their gatekeeper status).

The output is a 1-paragraph adjustment to the strategy for the next round. Without this debrief, every round repeats the previous mistakes — see the 17% statistic in [references/debrief.md](debrief.md).

## Avoiding internal disagreement on display

Buyers exploit visible internal disagreement on the seller side. Disciplines:

- **One voice in the room.** Only the N1 speaks during the negotiation proper. The N2's role is observation, not parallel negotiation.
- **No interruptions.** If the N2 has critical information, signal a pause — don't interject.
- **Silent rule on numbers.** The N2 never volunteers a number out loud, even to confirm the N1's. Once a number is stated by anyone on your side, it becomes a buyer anchor.
- **Re-alignment in the pause.** During pauses tactiques, re-align the N1 and N2 on Mandascan and tactic before resuming. Coming back to the room with visible disagreement (different body language, hesitation when answering) tells the buyer to push.

## When to bring the specialist

A specialist (architect, security lead, customer-success executive) is a tactical addition, not a default. Bring them when:

- The buyer raised a technical concern that out-strips your N1's depth.
- A senior buyer needs a peer on the call to feel the meeting is serious (the executive sponsor pattern).
- A specific objection requires authority you don't carry (security audit results, custom architecture commitment, multi-tenant data residency).

The specialist is briefed on the **mandate axes they touch** before the call. They are not part of the commercial negotiation; their authority is bounded to their domain. This boundary keeps them from being used as an escalation lever by the buyer ("the security architect just told me you can do X — please confirm").

## Failure modes

The patterns that destroy team-negotiation effectiveness, observed repeatedly:

- **N1 + N2 both speaking.** Buyer plays them against each other. Solution: enforce one-voice rule.
- **N2 absent or asleep.** N1 carries cognitive load, breaches mandate. Solution: N2 attendance is mandatory; if they can't focus, replace them.
- **Décideur joins too early.** Fuse blown; buyer escalates faster. Solution: décideur dials in only at mandated moments.
- **Specialist over-shares roadmap.** Buyer extracts unannounced features as "promises." Solution: specialist is briefed on what they cannot say.
- **Between-round debrief skipped.** Team carries forward unverified buyer claims. Solution: 15-minute debrief is non-optional after every round.
- **Internal disagreement leaks visibly.** Buyer reads the gap. Solution: re-align in pause; if alignment fails, end the meeting and reschedule.
