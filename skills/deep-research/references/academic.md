# Academic / Literature Research — Axes, Probes, and Section Template

Use this file for `type == academic` research: surveying academic literature, mapping citation networks, identifying key authors and institutions. Load after the user confirms scope.

Probe the user: "What field or sub-field? Any time range (e.g., last 5 years)? Are you looking for foundational papers, recent advances, or the current consensus on a specific claim?"

The axes below are a starting point — include any additional relevant findings encountered during research. Completeness matters more than strict adherence to predefined categories.

## Step 2 axes — Literature mapping

Fan out these 4 axes as sub-agents in a single message:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Foundational works** | What are the seminal papers? Most-cited works? When were they published and by whom? Search Google Scholar, Semantic Scholar, arXiv |
| 2 | **Recent advances** | Papers from the last 2–3 years on the topic. What new methods, findings, or frameworks have emerged? |
| 3 | **Key authors and labs** | Who publishes most in this area? Which institutions? Any dominant research groups or labs? |
| 4 | **Surveys and reviews** | Are there published survey papers or meta-analyses? These are high-leverage sources that summarize a field |

## Step 3 axes — Citation landscape

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Citation clusters** | Which papers are frequently cited together? What sub-communities exist within the broader topic? |
| 2 | **Contested claims** | Where do papers disagree? What findings have been challenged, retracted, or failed to replicate? |
| 3 | **Practitioner adoption** | Which academic findings have been adopted in industry or open-source tools? Where is there a gap between research and practice? |

## Step 4 axes — State of the field

Fan out these 3 axes:

| Agent | Axis | Key questions |
| --- | --- | --- |
| 1 | **Open problems** | What do recent papers identify as unsolved? What are the stated next research directions? |
| 2 | **Datasets and benchmarks** | What standard datasets or evaluation benchmarks does the field use? Who maintains them? |
| 3 | **Conferences and venues** | Which conferences and journals are considered top-tier? Acceptance rates? Recent best papers? |

## Citation notes for academic research

Academic citations follow the same URL + confidence format, but also include:

- DOI when available: `[Author et al. (Year)](https://doi.org/...)`
- arXiv IDs for preprints: `[Author et al. (Year)](https://arxiv.org/abs/XXXX.XXXXX)`
- Distinguish peer-reviewed publications (High) from preprints (Medium) from blog posts summarizing papers (Low)

## Section template

```md
## Literature Overview

### Foundational Works

### Recent Advances (last 2–3 years)

### Key Authors and Institutions

### Survey Papers and Reviews

## Citation Landscape

### Citation Clusters and Sub-communities

### Contested or Retracted Claims

### Research-to-Practice Gap

## State of the Field

### Open Problems

### Datasets and Benchmarks

### Top Venues
```
