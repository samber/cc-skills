---
name: skill-progressive-disclosure-design
description: Decide how to split skill content between SKILL.md and reference files for context efficiency and reliable triggering. Use this whenever creating a new Claude skill, refactoring an existing one, or when a SKILL.md is growing past 300-400 lines. Also trigger when the user mentions "progressive disclosure", "reference files", "splitting skills", "skill bundling", "context window for skills", "SKILL.md too long", "what goes in references/", "skill structure", or expresses any uncertainty about where to put content within a skill. Use this even if the user phrases the question as a triggering problem ("how do I make my skill trigger better"), because that question is often confused with the splitting question and needs to be disentangled first.
user-invocable: true
license: MIT
compatibility: Designed for Claude or similar AI agents.
metadata:
  author: samber
  version: "1.0.0"
  openclaw:
    emoji: "👷"
    homepage: https://github.com/samber/cc-skills
allowed-tools: Read Edit Write Glob Grep Agent AskUserQuestion
---

# Skill Progressive Disclosure Design

Each section that recommends a direction includes explicit pros and cons. The decisions in this skill are trade-offs, not rules. The model using this skill should reason from the trade-offs to the user's specific situation rather than apply rules blindly.

## Triggering vs. disclosure: separate these first

Two problems get conflated and need separating before any splitting decision.

**Triggering** is whether Claude invokes the skill at all. Driven entirely by the YAML `description`. File splitting does not affect triggering. If the question is "my skill doesn't trigger reliably", do not split files, fix the description (use `run_loop.py` from the `skill-creator` skill).

**Progressive disclosure** is what loads after the skill activates. SKILL.md body always loads. `references/*` only loads when SKILL.md tells the model to read a specific file. `scripts/*` executes without loading into context at all. This is where context protection happens.

If the user is asking about splitting because of triggering issues, surface the confusion first and redirect.

## Default: do not split

A monolithic SKILL.md beats a split one until proven otherwise.

Split only when at least one is true:

- SKILL.md exceeds ~400 lines and content has natural branches.
- Empirical evidence (eval transcripts) shows the model wasting context on irrelevant sections.
- Specific content is large and only needed in narrow conditions.

**Pros of staying monolithic:**

- Single context load, no router prose to maintain.
- No tool-call overhead from reading references.
- No risk of the model loading the wrong reference or skipping a needed one.
- Easier to maintain: one file, one source of truth.
- Better for highly interconnected content where context is global.
- Easier for human reviewers to read end-to-end.

**Cons of staying monolithic:**

- Every invocation pays the full token cost, even when only 10% of the content is relevant.
- Does not scale past ~500 lines without degrading the model's ability to find what matters.
- No mechanism to gate rare or niche content.
- All content must justify its always-loaded status.
- Maintenance gets harder as the file grows.

## Three split axes that work

### 1. Variant branch

User intent selects exactly one path. SKILL.md holds the decision logic and shared workflow. Each `references/<variant>.md` holds path-specific detail.

```
my-skill/
├── SKILL.md               # decision tree + shared steps
└── references/
    ├── variant-a.md
    ├── variant-b.md
    └── variant-c.md
```

Examples of clean variants: cloud provider, database engine, framework choice, output format, language.

**Pros:**

- Each invocation loads only the matching variant; large savings when variants are big.
- Variants evolve independently, simplifying maintenance.
- Adding a new variant does not bloat existing content.
- Mental model is easy: select one path based on input.
- Maps cleanly to user intent that already mentions the variant.

**Cons:**

- Requires routing logic in SKILL.md, eating back some of the line savings.
- Cross-cutting changes touch every variant file, multiplying effort.
- Risk of treatments diverging across variants over time.
- If user intent is ambiguous, the model may load multiple variants and lose the savings.
- If variants share more than ~60% of their content, the abstraction breaks down.

### 2. Workflow vs. reference data

SKILL.md holds the procedure (verbs, sequence, decisions). `references/` holds lookup material queried by key.

Good reference content: schemas, error code tables, API surface listings, example galleries, configuration option matrices, design tokens.

**Pros:**

- Highest leverage of all splits: lookups are narrow, the model reads one entry.
- Natural conceptual boundary (procedure vs. data).
- Reference can grow large without affecting per-invocation cost.
- Adding new reference entries does not touch the workflow.
- Reference data can often be machine-generated and regenerated.

**Cons:**

- The model must know what to look up before reading. Pointer must encode lookup keys explicitly.
- Fails when the workflow needs to weave reference data inline rather than at discrete points.
- Splits content that is conceptually unified, harder for human readers.
- The model may miss broader context that lives only in the reference.
- Lookup data that is small (under ~50 lines total) is rarely worth splitting.

### 3. Depth tier (common path vs. edge cases)

SKILL.md covers the 80% case. `references/edge-cases.md` covers the rest.

The pointer must read like:

> If you see X, Y, or Z, stop and read `references/edge-cases.md` before continuing.

**Pros:**

- Common path stays minimal, fast, cheap.
- Edge cases can be exhaustive without polluting every invocation.
- Easy to extend edge-case coverage without touching the common path.
- Mirrors how experts work: defaults first, exceptions on demand.

**Cons:**

- The load condition must be sharp and observable from user input. Most edge cases do not satisfy this.
- Vague conditions cause either always-loading (waste) or never-loading (dead weight).
- Edge cases get less testing because evals naturally cluster on common queries.
- The model may follow the common path past a point where it should have escalated.
- The 80/20 estimate is often wrong; what looked like an edge case turns out to be common.

## Splits that do not work

For each anti-pattern, "why it appears attractive" shows what makes designers reach for it; "why it fails" shows what goes wrong in practice.

### Topic-based splits where invocations do not cluster by topic

A testing skill split into `unit.md`, `integration.md`, `mocks.md` is a typical example.

**Why it appears attractive:**

- Conceptually clean, mirrors how a human would organize documentation.
- Easy to navigate as a maintainer.
- Plausibly reduces context per invocation.

**Why it fails:**

- Real tasks span 2-3 topics, forcing multiple loads per invocation.
- Cross-topic concerns get duplicated or fragmented.
- The savings are theoretical, not empirical.

### Splitting to hit a line target without a real branching condition

**Why it appears attractive:**

- A heuristic ("keep SKILL.md under 400 lines") feels like a clean rule to satisfy.
- Splitting feels like progress.

**Why it fails:**

- Without a branching condition, references load in parallel or always, providing no savings.
- Adds router prose to SKILL.md, often making the total content longer.

### Rare-but-critical content in references/

**Why it appears attractive:**

- The content is large or specialized.
- Moving it out of SKILL.md feels like good hygiene.

**Why it fails:**

- References are optional by design; the model may skip them.
- If the content is critical, it must be loaded reliably, which means SKILL.md.
- "Rare" and "critical" together is usually a sign the skill is doing two jobs and should be two skills.

### Cosmetic splits (Examples, Notes, Tips files)

**Why it appears attractive:**

- Reduces visual clutter in SKILL.md.
- Feels like good organization.

**Why it fails:**

- No load condition: either always loaded (wasted tool call) or never loaded (dead content).
- Implies an importance hierarchy that does not exist at runtime.
- Frequently hides content from the model that needs it.

## Pointer hygiene

When SKILL.md points at a reference, the pointer is the entire load contract. Rules:

- Name the user-visible signal that triggers the load. "If the user mentions snapshot tests" not "for testing concerns".
- One sentence per pointer. Do not summarize the reference content in SKILL.md.
- Encode the load condition in the filename. `go126-simd.md` not `advanced.md`.
- Top-of-file table of contents for any reference over 300 lines.
- If two references are co-loaded in most runs, merge them.

**Pros of strict pointer hygiene:**

- Wrong-load rate drops sharply.
- Filename encodes load condition, self-documenting for future maintainers.
- Forces upfront clarity about when each reference is needed.
- Makes architecture evals easier to interpret.

**Cons of strict pointer hygiene:**

- Some content has no crisp trigger; rules force awkward formulations.
- Filenames become long and awkward.
- Requires discipline; easy to drift over time.
- Can over-constrain useful loads when the trigger condition is genuinely fuzzy.

## Use scripts/ before references/

For anything deterministic (formatting, validation, schema generation, file transforms, regex-heavy parsing), a script in `scripts/` beats prose in `references/`.

**Pros of scripts over reference prose:**

- Zero context cost for execution.
- Deterministic, repeatable output.
- Reusable across invocations without re-reading.
- Can be unit tested independently.
- Often faster than prose-driven generation by the model.

**Cons of scripts:**

- Requires the runtime to support script execution; not all environments do.
- Less flexible than letting the model reason over prose.
- Harder to handle unanticipated edge cases without code changes.
- Adds a maintenance burden: code in the skill needs to keep working.
- Users cannot easily customize behavior without editing the script.
- Failure modes are sharper: script errors stop the workflow.

## Decision checklist

Before splitting any content out of SKILL.md, answer:

1. Does this content have a sharp, observable load condition the model can detect from user input?
2. Will splitting actually reduce context, accounting for the router prose added to SKILL.md?
3. Is this reference data (lookup) or procedural (sequence)? Procedural content usually stays.
4. Could a script handle this deterministically instead?
5. Across realistic invocations, what fraction of runs would load this file? Below 20%, inline or delete — rarely-loaded references rarely justify the routing overhead. 20–80% is the split sweet spot. Above 80%, promote into SKILL.md — the routing cost exceeds the load savings.

If the answer to question 1 is unclear, do not split.

## Evaluating skill architecture

Architecture evaluation is different from output evaluation. Output evals ask "did the skill produce the right thing?". Architecture evals ask "did the skill load the right files for the right reasons, at acceptable cost?". Same harness, different metrics. Run both. Output quality is the floor; architecture is optimization above that floor.

**Pros of running architecture evals:**

- Catches dead references, dead SKILL.md sections, and mis-routed content.
- Quantifies whether a split actually saved tokens or just looked clean.
- Reveals real load patterns that intuition misses.
- Forces the eval set to cover all declared paths, surfacing dead paths.
- Compounds with output evals to catch regressions across both axes.

**Cons of running architecture evals:**

- Requires harness setup beyond standard output evals.
- Eval-set design for path coverage takes work.
- Metrics need calibration per-skill (thresholds vary with cost profile).
- Output evals are still required; this adds to total iteration cost.
- Easy to over-optimize for token cost at the expense of output quality.

### Eval set design for architecture

Output evals optimize for output quality across realistic queries. Architecture evals optimize for path coverage. The eval set must exercise every code path the skill claims to have, otherwise the metrics are noise.

Construct, at minimum:

- One query per declared variant (if the skill uses variant-branch splits).
- One query per edge-case branch (if depth-tier splits exist).
- One query per major lookup category (if reference-data splits exist).
- One query that should hit the common path only and load zero references.
- 2-3 off-topic queries that should not trigger the skill at all (also tests the description).

If no realistic query triggers a given reference file, that file is dead. Inline it or delete it before running anything.

### Instrumentation

Each eval run is executed by a subagent with the skill loaded. Capture per run:

1. Full transcript including every tool call.
2. Which `references/*` files were read (parse `view` calls on paths inside the skill directory).
3. Whether `scripts/*` were invoked.
4. Total tokens and wall time.
5. The output (for the parallel output-quality eval).

Persist as `transcript.json` and `loads.json` per run, alongside the standard output. The harness from skill-creator already records tokens and time in `timing.json`; extend its grading step to extract reference loads from transcripts.

### Metrics per reference file

Across all eval runs, for each `references/*.md`:

- **Load rate**: fraction of runs that read it.
- **Co-occurrence**: for each other reference, fraction of runs that loaded both.
- **Use rate when loaded**: of the runs that loaded it, did the content visibly inform the output (cited content, applied procedure, used schema)? Inspect transcripts.
- **Re-read rate**: fraction of runs that loaded the same file twice.

### Metrics for the skill overall

- **Median and p95 tokens per invocation**, with and without references.
- **SKILL.md utilization**: read transcripts and identify sections of SKILL.md the model never references in any run. Strong candidates for deletion.
- **Path coverage**: did every declared path get hit by at least one query?

### Decision rules

| Observation | Action |
| --- | --- |
| Reference loaded in <20% of runs | Inline into SKILL.md or delete — routing overhead not justified |
| Reference loaded in 20–80% of runs | Leave split — the sweet spot; routing pays off |
| Reference loaded in >80% of runs | Promote into SKILL.md — always-load cost beats routing cost |
| Two references co-load in >70% of runs | Merge into one file |
| Reference loaded but not used in output | Fix or remove the pointer in SKILL.md |
| Reference re-read inside the same run | SKILL.md routing is unclear; clarify |
| No query triggers a reference | Delete the reference |
| SKILL.md section never referenced in any run | Delete that section |

These thresholds are starting points. Tune them based on the cost profile: small references with cheap loads tolerate lower load rates than large ones.

### Comparing two architectures

When choosing between architectures (monolithic vs. split, or split A vs. split B):

1. Run the identical eval set against both versions.
2. Run output-quality evals on both. Confirm no regression. If quality drops, the architecture change is a loss regardless of token savings.
3. Compare median tokens, p95 tokens, and median time per run.
4. Compare path coverage: does each version reliably reach the same outputs through the expected paths?

A split that saves 15% tokens but adds variance in output quality is worse than the monolith. Reliability beats efficiency.

### What the metrics will not tell you

- Whether the SKILL.md prose is clear. Read transcripts for confused tool calls and dead-end attempts.
- Whether the description triggers correctly. That is a separate eval (use `run_loop.py` from the `skill-creator` skill).
- Whether content placement matches user mental models. Subjective; review with a human.

The split that looked clean at design time rarely matches real load patterns. Trust the transcripts over your intuitions.

## Output when advising

When asked to advise on a specific skill's organization:

1. Diagnose first. Is this a triggering question or a disclosure question?
2. Quote relevant content from the existing SKILL.md (or the user's description of it) before recommending.
3. Propose the minimum viable split. Resist splitting into more files than necessary.
4. For each proposed reference file, write the exact pointer sentence that would go in SKILL.md.
5. Surface the trade-offs explicitly. Use the pros/cons in this skill as the model for how to present a recommendation.
6. If unsure whether a split helps, recommend instrumentation (eval the skill, read transcripts) before committing.
