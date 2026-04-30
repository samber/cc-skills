# Mutual Action Plan (MAP) — the close timeline as artifact

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
- _Stalls between #5 and #6._ Procurement is running the playbook (escalation, fixed budget) — see [references/objection-procurement-playbook.md](objection-procurement-playbook.md).
- _Stalls between #6 and #7._ Legal disagreement is real. Don't push date — push for legal-to-legal call.
- _Stalls between #7 and #8._ Buyer signal of buyer's remorse or new objection. Diagnose with calibrated questions, not pressure.

**Failure signal.** The buyer refuses to put dates on the MAP, or repeatedly defers them by 1–2 weeks each time. Either MEDDPICC is incomplete (no real Decision Process visibility) or you're being JOLT-trapped (see [playbook-jolt.md](playbook-jolt.md)).
