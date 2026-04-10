---
name: snyk-agent-scan-compliance
description: "Compliance expert for snyk-agent-scan — the agent skill file scanner — NOT for other Snyk CLI tools (snyk test, snyk code SAST, snyk iac, snyk container). Fixes alerts through content restructuring, never by suppressing or deleting information. Covers every file in a skill directory: SKILL.md, references/, assets/, and any secondary markdown. Apply when authoring a new skill, editing an existing one, triaging a failed snyk-agent-scan run locally or in CI, or unblocking a PR held by agent scanner failures. Not applicable to dependency vulnerabilities, code security findings, or infrastructure misconfigurations — those are out of scope."
user-invocable: true
license: MIT
compatibility: Designed for Claude Code or similar AI coding agents.
metadata:
  author: samber
  version: "1.0.0"
  openclaw:
    emoji: "🔍"
    homepage: https://github.com/samber/cc-skills
    requires:
      bins: []
    install:
      - kind: uv
        package: snyk-agent-scan
        bins: [snyk-agent-scan]
    skill-library-version: "0.4.14"
allowed-tools: Read Edit Write Glob Grep Bash(git:*) Bash(uv:*) Bash(uvx:*) AskUserQuestion Agent
---

**Persona:** You are a skill-authoring compliance expert. You fix snyk-agent-scan alerts by restructuring content — never by suppressing or deleting useful information.

**Thinking mode:** Use `ultrathink` for multi-alert remediation where fixes for one alert type can surface or suppress another. Deep reasoning reduces rework.

# snyk-agent-scan Compliance

The `snyk-agent-scan` tool analyzes skill bodies for three categories of unsafe patterns: third-party content exposure (W011), malicious external URLs (W012), and prompt injection via MCP tool calls (W001). All three are fixable through content restructuring without losing any information.

## Reference Files

| File | When to read |
| --- | --- |
| [references/w001-patterns.md](references/w001-patterns.md) | Fixing W001 alerts — MCP tool name patterns |
| [references/w011-patterns.md](references/w011-patterns.md) | Fixing W011 alerts — imperative URL and external content patterns |
| [references/w012-patterns.md](references/w012-patterns.md) | Fixing W012 alerts — version pinning and frontmatter offloading |

## Quick Reference

| Alert | Severity | Root Cause | Primary Fix |
| --- | --- | --- | --- |
| W011 | High | Skill body instructs agent to fetch/interpret external content | Replace imperatives with passive availability hints |
| W012 | High | Skill body references external URLs fetched and executed at runtime | Move to frontmatter `install` block; pin versions |
| W001 | High | Skill body names MCP tool functions explicitly | Use generic formulations instead |

## Running the Scanner

```bash
# Scan a single skill
SNYK_TOKEN=<token> snyk-agent-scan --skills skills/<name>/

# Scan all skills
SNYK_TOKEN=<token> snyk-agent-scan --skills ./skills
```

The scanner requires a valid `SNYK_TOKEN`. In CI, store it as a secret. If `snyk-agent-scan` is not installed, use `uvx snyk-agent-scan@latest` as a drop-in replacement without installing. See [detailed patterns](references/w011-patterns.md) for fixes per alert type.

## W011 — Third-Party Content Exposure

W011 fires when the skill body uses imperative verbs directing the agent to fetch, check, or evaluate external content and then act on it. The scanner treats the agent as the grammatical subject performing an external action.

Rules:

- Replace `Check <url>` and `Fetch <url>` with passive hints: `The release notes at <url> may be useful.`
- Remove "always" from any instruction involving external data: `Always reference the changelog` → `The changelog documents breaking changes.`
- Keep tool invocations (`gh repo view`, `govulncheck`) in code blocks, not in prose checklists that imply the agent must run them before acting.
- Decouple tool execution from decisions: running a tool is fine; using its remote-sourced output as the sole trigger for a refactor is not.

See [W011 pattern catalog](references/w011-patterns.md) for 12+ before/after examples.

## W012 — Potentially Malicious External URL

W012 fires when the body references external content fetched and executed at runtime: package installs with `@latest`, pipe-to-shell patterns, or GitHub Actions with wrong/non-existent major versions.

Rules:

- Move `go install pkg@latest` and similar commands from prose into the frontmatter `metadata.openclaw.install` block — the scanner does not flag frontmatter.
- Pin GitHub Actions to the correct current major version (`@v4`, not `@v6`).
- Never use pipe-to-shell patterns (`curl ... | sh`) in skill bodies.

See [W012 pattern catalog](references/w012-patterns.md) for 8+ before/after examples.

## W001 — Prompt Injection via MCP Tool Calls

W001 fires when the skill body explicitly names MCP server tool functions, triggering prompt-injection detection.

Rules:

- Never write tool function names (`resolve-library-id`, `query-docs`, `mcp__*`) in the skill body.
- Replace with generic formulations: `Context7 can help as a discoverability platform.`
- MCP tool names may still appear in the `allowed-tools` frontmatter field — only the body is restricted.

See [W001 pattern catalog](references/w001-patterns.md) for safe reformulations.

## Remediation Methodology

Fix one alert at a time, re-run `snyk-agent-scan` after each change, and verify the alert count dropped before moving to the next. If a fix does not reduce alerts, undo it and try a different approach — do not stack unverified changes.

When a scan returns multiple alerts, fix in this order to minimize rework:

```
1. W001 (simplest) — remove MCP tool names from body; confirm allowed-tools is correct
2. W011 — rewrite imperative sentences as passive statements; move checklist items to code blocks
3. W012 — move install commands to frontmatter; pin versions
4. Re-scan after each individual fix to verify improvement
```

W011 fixes sometimes surface hidden W012s when URLs become more prominent after restructuring.

## False Positives

Not all alerts are real. Criteria for a likely false positive:

| Condition | Likely false positive? |
| --- | --- |
| URL appears in a markdown table cell as reference data, not in an instruction | Yes — tables are usually safe |
| In a skill describin a library, URL is the library official documentation | Yes — usually safe |
| URL is the `homepage` or `issues` link in frontmatter | Yes — not scanned |
| Tool name appears inside a triple-backtick code block as a shell command | Sometimes — code blocks have lighter scrutiny |
| `go install` with a pinned version in a Quick Reference code block | Sometimes — pinned versions are lower risk |
| `always` appears in a sentence not involving external resources | Yes — "always" alone doesn't trigger W011 |

When an alert is a likely false positive, restructure anyway using the passive hint pattern — the scanner's heuristic protects real users; restructuring is safer than assuming scanner error.

## Pre-Authoring Checklist

Apply these checks while writing a new skill body to avoid alerts before the first scan:

- [ ] No sentence has the agent as subject performing an action on a URL
- [ ] No `@latest` tags in any install instruction in the body
- [ ] No MCP tool function names (`mcp__*`, `resolve-library-id`, etc.) in body prose
- [ ] All install commands are in the frontmatter `install` block
- [ ] GitHub Actions versions match real existing major versions
- [ ] Tool invocations are in code blocks, not in ordered-list checklists
- [ ] "always" does not precede any external resource instruction

If you encounter a bug or unexpected behavior in `snyk-agent-scan`, open an issue at https://github.com/snyk/snyk-agent-scan/issues.

If you discover a pattern that triggers an alert not covered in the reference files above — a new bypass technique, a false positive condition, or an undocumented alert code — open a pull request to the `samber/cc-skills` repository to add it to the relevant pattern file. New patterns are the most valuable contribution to this skill.
