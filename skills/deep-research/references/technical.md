# Technical Research — Axes, Probes, and Section Template

Use this file for `type == technical` research (technology evaluation, architecture analysis, tool comparison). Load after the user confirms scope.

The axes below are a starting point — include any additional relevant findings encountered during research. Completeness matters more than strict adherence to predefined categories.

## Step 2 axes — Core technical landscape

Fan out these 4 axes as sub-agents in a single message:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Technology landscape** | What are the main approaches/tools/frameworks in this space? Who are the primary authors or maintainers? |
| 2 | **Performance & benchmarks** | What do published benchmarks show? Latency, throughput, resource usage? What scenarios do benchmarks cover or miss? |
| 3 | **Community & maturity** | GitHub stars/forks/activity, StackOverflow volume, release cadence, CVE history, last major release date |
| 4 | **Integration & compatibility** | What ecosystems does each option fit into? Language support, cloud provider integrations, protocol compatibility |

## Step 3 axes — Comparative analysis

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Top 3–5 options head-to-head** | For each: strengths, weaknesses, license, pricing (open-source vs commercial), vendor lock-in risk |
| 2 | **Decision criteria** | What dimensions matter most for the use case? Performance vs DX vs cost vs operational complexity |
| 3 | **Migration & lock-in** | What does adopting each option commit you to? Migration path if you switch later? Data portability? |

Produce a **decision matrix** (options × criteria) at the end of this step.

## Step 4 axes — Implementation deep dive

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Architecture patterns** | What are the recommended deployment topologies, data models, or integration patterns? What are the trade-offs? |
| 2 | **Common pitfalls** | What gotchas, version quirks, or configuration traps do practitioners report? (GitHub issues, blog post-mortems, HN discussions) |
| 3 | **Security & compliance** | Known CVEs, authentication mechanisms, data-at-rest/in-transit posture, compliance certifications (SOC 2, HIPAA, GDPR) |

## Section template

Use these headings in the output file:

```md
## Technology Landscape

### Overview of Approaches

### Performance and Benchmarks

### Community Health and Maturity

### Integration and Compatibility

## Comparative Analysis

### Top Options Head-to-Head

### Decision Matrix

| Option | Performance | DX  | Community | Cost | Lock-in | Notes |
| ------ | ----------- | --- | --------- | ---- | ------- | ----- |

### Migration and Lock-in Risks

## Implementation Considerations

### Recommended Architecture Patterns

### Common Pitfalls and Gotchas

### Security and Compliance
```
