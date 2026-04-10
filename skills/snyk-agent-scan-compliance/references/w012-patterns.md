# W012 — Potentially Malicious External URL: Pattern Catalog

W012 fires when a skill body references external content that is fetched and **executed** at runtime — package installs, pipe-to-shell patterns, or GitHub Actions pinned to wrong/non-existent major versions. The scanner treats these as supply-chain risk vectors.

## Core Principle

The fix is to either:

1. **Move** the install command from the body into the frontmatter `metadata.openclaw.install` block (not scanned as body text), or
2. **Pin** the reference to a specific, existing version rather than a floating tag.

## Before / After Table

| Triggering pattern | Safe reformulation |
| --- | --- |
| `go install golang.org/x/vuln/cmd/govulncheck@latest` in prose | Move to frontmatter `install` block: `kind: go, package: golang.org/x/vuln/cmd/govulncheck, bins: [govulncheck]` |
| `go install pkg@latest` anywhere in body | Use exact version: `go install pkg@v1.2.3` — or move to frontmatter `install` |
| `curl https://example.com/install.sh \| sh` | Remove entirely; document the package manager install path instead |
| `wget -qO- https://example.com/install \| bash` | Remove entirely; use a package manager or frontmatter `install` block |
| `npx package@latest` in prose | Pin: `npx package@1.2.3` — or move to frontmatter `install` |
| `uses: actions/checkout@v6` (non-existent version) | Update to correct current major: `uses: actions/checkout@v4` |
| `uses: org/action@v99` (future/wrong version) | Update to current stable major version |
| `FROM image:latest` in embedded Dockerfile | Pin: `FROM image:1.23.4` |
| `pip install package` (no version) | Pin: `pip install package==1.2.3` or use frontmatter `install` |
| `brew install tool` in body prose | Move to frontmatter: `kind: brew, formula: tool, bins: [tool]` |

## Pattern Categories

### 1. `@latest` / floating version tags

Any reference that resolves to an unknown future version at execution time is flagged. The scanner cannot verify what `@latest` resolves to.

**Fix:** Pin to a specific version, or move to the frontmatter `install` block which is not scanned as body text.

### 2. Pipe-to-shell patterns

`curl | sh`, `wget | bash`, `irm | iex` (PowerShell) are always flagged — they execute arbitrary remote code.

**Fix:** Replace with a package manager install path (`brew install`, `apt-get install`, etc.) or move to frontmatter. Never embed pipe-to-shell in a skill body.

### 3. Unpinned GitHub Actions

Actions pinned to non-existent or wrong major versions look suspicious because they can't be verified.

**Fix:** Check the Github Actions documentation is use the correct current major version tag.

### 4. Unversioned package manager installs

`brew install tool`, `pip install package`, `apt-get install tool` without a version pin are lower severity but still flagged.

**Fix:** Use frontmatter `install` block (preferred), or pin the version explicitly.

### 5. Embedded Dockerfiles with `FROM image:latest`

Docker images tagged `latest` resolve to different content over time.

**Fix:** Pin to a digest or exact tag: `FROM golang:1.26.0-alpine`.

## Frontmatter Install Block Reference

Move runtime installs from body prose to frontmatter. The scanner does not flag frontmatter.

```yaml
metadata:
  openclaw:
    install:
      - kind: brew
        formula: protobuf
        bins: [protoc]
      - kind: go
        package: golang.org/x/vuln/cmd/govulncheck
        bins: [govulncheck]
      - kind: uv
        package: snyk-agent-scan
        bins: [snyk-agent-scan]
      - kind: node
        package: "@anthropic-ai/claude-code"
        bins: [claude]
```

Supported kinds: `brew`, `go`, `node`, `uv`. Each entry requires `kind`, `formula`/`package`, and `bins`.

## Version Pinning Strategies

Pinning hierarchy (most to least safe):

```
SHA pin (most secure):
  uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683

Major version tag (standard):
  uses: actions/checkout@v4

Minor version tag (acceptable):
  uses: actions/checkout@v4.1.0

@latest (triggers W012 — never use):
  uses: actions/checkout@latest
```

For Go packages:

```bash
# Triggers W012
go install golang.org/x/tools/cmd/goimports@latest

# Safe — in frontmatter install block (no version needed; install block handles resolution safely)
kind: go
package: golang.org/x/tools/cmd/goimports
bins: [goimports]

# Safe — pinned in prose (rare; prefer frontmatter)
go install golang.org/x/tools/cmd/goimports@v0.19.0
```

## Frontmatter Offloading

Move any install command or binary dependency from the skill body into frontmatter — the scanner does not flag frontmatter fields.

| What to move | From body | To frontmatter |
| --- | --- | --- |
| Install commands | `go install pkg@latest` in prose | `metadata.openclaw.install` block |
| Binary dependencies | `brew install tool` in instructions | `metadata.openclaw.requires.bins` |
