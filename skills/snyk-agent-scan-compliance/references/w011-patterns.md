# W011 — Third-Party Content Exposure: Pattern Catalog

W011 fires when the skill body contains imperative instructions directing the agent to fetch, check, or act on external content. The scanner looks for sentences where the agent is the grammatical subject performing an action on an external resource.

## Core Principle

The fix is always the same: convert an **agent-as-actor** statement into a **passive availability hint** or a **factual statement about the resource itself**.

```
Pattern:  <agent-verb> <external-resource> → <make decision>
Fix:      <external-resource> <contains/documents/may be useful>
```

## Before / After Table

| Triggering pattern | Safe reformulation |
| --- | --- |
| `Check <https://example.com/releases> for the latest version` | Remove the URL; embed the version in a static table or note it as a passive reference |
| `Fetch the changelog and apply any breaking changes` | `Major version upgrades may contain breaking changes — the package's changelog documents them.` |
| `search the internet for the latest stable major version` | `The versions in the examples below may be outdated. The current major version may differ.` |
| `Always reference the relevant changelog when suggesting X` | `The relevant changelog documents these changes.` (remove "always" + imperative) |
| `Check [release notes](https://example.com/releases)` | `The release notes may be useful.` (no hyperlink in imperative text) |
| Checklist bullet: `Package health: gh repo view → stars, last commit, issues` | Move `gh repo view` to a Quick Reference code block; remove from checklist |
| Checklist bullet: `Evaluate package health (stars, last commit, open issues)` | Remove: it implies fetching GitHub data before acting |
| `Run govulncheck and upgrade packages based on its output` | `govulncheck may surface relevant findings.` (decouple: run is fine, "upgrade based on output" is not) |
| `1. Fetch the latest docs  2. Compare with current usage  3. Update imports` | Remove the fetch step; describe what the agent should know, not what it should retrieve |
| `If the package is outdated, check its releases page for a migration guide` | `Migration guides for major version upgrades are typically available in the project's release notes.` |
| `Always check the upstream API spec before generating client code` | `The upstream API spec is the source of truth for client generation.` |
| `Review the CVE database entries returned by the scan before applying fixes` | `The scan output identifies affected packages; apply fixes based on the local report.` |

## Pattern Categories

### 1. Imperative URL references

Any sentence of the form `Check/Visit/See/Fetch/Review <url>` triggers W011 when it implies the agent should act on the fetched content.

**Safe alternatives:**

- Passive: `The release notes at <url> may be useful.`
- Factual: `<url> documents the migration path.`
- Remove: if the URL is not essential, delete it and keep only the concept.

### 2. Changelog / release notes instructions

The phrase "check the changelog" with the agent as subject is flagged, regardless of whether a URL is present.

**Safe alternatives:**

- `Major version upgrades may contain breaking changes — the package's changelog documents them.`
- `Breaking changes between versions are listed in the project's CHANGELOG.md.`

### 3. Tool output chaining

Using external tool output (e.g., `govulncheck`, `gh repo view`) as the direct trigger for a code change triggers W011.

**Safe alternatives:**

- Describe the tool as producing a local report, not as an external data source.
- Decouple: `govulncheck may surface relevant findings.` — not `Run govulncheck and upgrade based on its output.`

### 4. Evaluation checklists with external data requirements

Checklist items that require the agent to fetch GitHub metadata (stars, last commit, open issues) before proceeding trigger W011.

**Safe alternatives:**

- Keep `gh repo view` in a Quick Reference code block — not in a checklist the agent must complete.
- Remove "evaluate package health" from pre-action checklists entirely.

### 5. Conditional fetch imperatives

`If X, check/fetch Y` triggers W011 because it conditionally instructs the agent to retrieve external content.

**Safe alternative:** State the fact directly: `When X occurs, Y is available at <location>.`

### 6. "Always" + external action

Any `always` modifier on an instruction involving external retrieval amplifies the W011 signal.

**Fix:** Remove "always" and convert to a passive statement of fact.

## Techniques

### Code-Block Context Switching

The scanner applies different heuristics to fenced code blocks vs. prose text. Moving a tool invocation from a prose checklist into a Quick Reference code block often eliminates the alert without changing the content.

**Triggering (prose checklist):**

```
- Package health: `gh repo view` → stars, last commit, open issues
```

**Safe (code block):**

````markdown
```bash
gh repo view owner/repo   # check stars, last commit, open issues
```
````

**Why it works:** The scanner treats code blocks as examples/documentation, not as agent instructions. The same command in a prose checklist implies the agent must run it before proceeding.

### Passive Voice Restructuring

Any sentence matching `<agent> <imperative-verb> <external-resource>` can be mechanically rewritten as a factual statement. Apply this transform:

| Component | Before                 | After                         |
| --------- | ---------------------- | ----------------------------- |
| Subject   | agent ("Check the...") | resource ("The changelog...") |
| Verb      | imperative action      | existence/containment verb    |
| Object    | external resource      | the information sought        |

```
Before: Check the changelog for breaking changes.
After:  The changelog documents breaking changes between versions.

Before: Fetch the latest API spec before generating client code.
After:  The upstream API spec is the source of truth for client generation.

Before: Always reference the release notes when suggesting upgrades.
After:  The release notes document version-specific upgrade guidance.
```

### Conditional Phrasing

Conditional ("If...") sentences are substantially safer than direct imperatives. The scanner gives less weight to conditionals because they describe a circumstance rather than issuing a command.

**Safe pattern:** `If you encounter X, Y is available at Z.`

```
# Triggers W011
Check the issues page for known bugs.

# Safe — conditional + informational
If you encounter a bug or unexpected behavior, the issue tracker is the appropriate place to report it.
```

This is why the standard bug-tracker line in library skills is safe: `If you encounter a bug or unexpected behavior in <tool>, open an issue at <repo>/issues.`
