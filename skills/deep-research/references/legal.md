# Legal Research — Axes, Probes, and Section Template

Use this file for `type == legal` research: IP landscape, patent analysis, litigation history, regulatory enforcement, contract terms, compliance requirements. Load after the user confirms scope.

Probe the user: "What's the focus — patents/IP, litigation risk, regulatory enforcement, standard contract terms, or compliance in a specific jurisdiction? Any industry or geography?"

The axes below are a starting point — include any additional relevant findings encountered during research. Completeness matters more than strict adherence to predefined categories.

⚠️ This skill surfaces publicly available legal information for research purposes. It does not constitute legal advice. Flag when a finding warrants consultation with a qualified lawyer.

## Step 2 axes — IP and patent landscape

Fan out these 4 axes as sub-agents in a single message:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Patent filings** | Key patents in the space (Google Patents, USPTO, EPO): who holds them, filing dates, expiry dates, scope of claims |
| 2 | **Trademark and brand protection** | Registered trademarks (WIPO, USPTO TESS), recent filings, any notable conflicts |
| 3 | **Copyright and licensing** | Content or software licensing norms in the space; open vs proprietary; license compatibility issues |
| 4 | **IP disputes and litigation** | Patent lawsuits, trademark disputes, copyright claims: parties, outcomes, settlements |

## Step 3 axes — Regulatory enforcement and compliance

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Enforcement actions** | Regulatory fines, consent decrees, enforcement notices in the sector (last 5 years): agencies, amounts, stated violations |
| 2 | **Compliance requirements** | What must an operator do to comply? Licenses, certifications, reporting obligations, data handling rules — by jurisdiction |
| 3 | **Upcoming regulatory changes** | Proposed legislation or regulation in consultation, recently passed but not yet in force |

## Step 4 axes — Litigation and contract norms

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Litigation history** | Major lawsuits involving key players: claims, outcomes, appeals, precedents set |
| 2 | **Standard contract terms** | What are the industry-standard terms for key contract types (SaaS MSA, supplier agreements, licensing)? What clauses are contested? |
| 3 | **Jurisdictional risk** | Differences in legal treatment across key jurisdictions (US, EU, UK, APAC); forum-shopping patterns; enforcement asymmetry |

## Citation notes for legal research

Legal sources require specific attribution:

- Court decisions: case name, jurisdiction, year, docket number if available
- Regulations: official register citation (CFR, OJ, etc.) and jurisdiction
- Patent filings: patent number and issuing office
- News about legal matters: verify against official court records when possible; flag "reported" vs "confirmed from filing"

## Section template

```md
## Intellectual Property Landscape

### Key Patents

### Trademarks and Brand Protection

### Copyright and Licensing Norms

### IP Disputes

## Regulatory Enforcement and Compliance

### Enforcement Actions (last 5 years)

### Compliance Requirements by Jurisdiction

### Upcoming Regulatory Changes

## Litigation and Contract Norms

### Litigation History

### Standard Contract Terms

### Jurisdictional Risk

> ⚠️ This report surfaces publicly available legal information for research purposes only. It does not constitute legal advice.
```
