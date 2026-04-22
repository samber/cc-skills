---
name: conventional-git
description: Conventional Commits v1.0.0 branch naming, worktree naming, and commit message standards for GitHub and GitLab projects. Use when creating branches, naming worktrees, writing commits, generating commit messages, reviewing branch conventions, or setting up changelog automation. Apply when your project needs consistent git history, SemVer-driven releases, parseable changelog generation, or automatic issue closing. Trigger when the user asks how to name a worktree, create a git worktree, or organize worktrees alongside branches.
user-invocable: true
license: MIT
compatibility: Designed for Claude Code or similar AI coding agents. Requires git.
metadata:
  author: samber
  version: "1.2.0"
  openclaw:
    emoji: "📝"
    homepage: https://github.com/samber/cc-skills
    requires:
      bins:
        - git
allowed-tools: Read Edit Write Glob Grep Bash(git:*) Bash(gh:*)
---

# Conventional Commits & Branch Naming

Follow Conventional Commits v1.0.0 for both branch names and commit messages — consistent naming lets tools auto-generate changelogs, enforce SemVer bumps, and filter history by concern.

## Branch Naming

Format: `<type>/[issue-]<description>` — lowercase, hyphens only, no special chars except `/`.

```
feat/user-authentication
feat/42-user-authentication
fix/login-race-condition
fix/87-login-race-condition
docs/api-reference-update
refactor/payment-module
```

Prefix with the issue number when one exists — GitHub and GitLab auto-link it and it makes `git log` immediately traceable to the tracker. Keep the description under 50 characters — most git UIs truncate branch names in lists around that length. Match the type to the work you're doing — this is the contract readers use to understand the branch purpose at a glance.

NEVER include `worktree` in a branch name — git worktrees are a local checkout mechanism, not a branch concept; the name would leak implementation details into the remote and confuse other contributors.

## Worktree Naming

Worktrees are local checkout directories — they never appear in the remote. Place them under `.claude/worktrees/` and name them by replacing the branch `/` separator with `-`.

```
git worktree add .claude/worktrees/feat-user-authentication feat/user-authentication
git worktree add .claude/worktrees/fix-87-login-race-condition fix/87-login-race-condition
```

The directory name mirrors the branch name so `git worktree list` stays readable and each worktree is immediately traceable to its branch without inspecting the checkout. Run `git worktree list` before creating a new one — reuse an existing worktree if it already covers the same branch.

Keep worktrees scoped to a single branch. Doing unrelated work inside someone else's worktree obscures which changes belong where and makes cleanup error-prone.

Remove the worktree once its branch is merged — either after a local merge or after the pull/merge request is closed on the remote. Stale worktrees accumulate and make `git worktree list` unreadable.

```bash
git worktree remove .claude/worktrees/feat-user-authentication   # branch merged locally
git worktree prune                                                # remove refs to already-deleted directories
```

## Commit Message Format

```
<type>[optional scope]: <description>
[optional body]
[optional footer(s)]
```

**Types:**

| Type       | SemVer | When                         |
| ---------- | ------ | ---------------------------- |
| `feat`     | MINOR  | New feature                  |
| `fix`      | PATCH  | Bug fix                      |
| `docs`     | —      | Docs only                    |
| `style`    | —      | Formatting, no logic change  |
| `refactor` | —      | Restructure, no feature/fix  |
| `perf`     | —      | Performance improvement      |
| `test`     | —      | Add/fix tests                |
| `build`    | —      | Build system, deps           |
| `ci`       | —      | CI config                    |
| `chore`    | —      | Anything else (not src/test) |
| `revert`   | —      | Reverts a previous commit    |

**Rules:**

- Subject line ≤ 72 characters — git log and GitHub/GitLab UIs silently truncate longer subjects
- Imperative mood: "add" not "added" — reads as an instruction, not a history log
- No capital letter, no trailing period — enforces uniform parsing by changelog tools
- Body separated by blank line — parsers split header/body at the first blank line
- Breaking changes: use `!` after type/scope, or add `BREAKING CHANGE:` footer (triggers MAJOR bump) — body-only descriptions are invisible to changelog tools
- `revert` commits SHOULD include `This reverts commit <hash>.` in the body — `git revert` generates this automatically; don't strip it
- NEVER add a Claude signature, AI agent attribution, or `Co-authored-by` trailer for Claude or any other AI agent to commits

**Examples:**

```
feat(auth): add JWT token refresh
```

```
fix: prevent race condition on concurrent requests

Introduce request ID and reference to latest request.
Dismiss responses from stale requests.
```

```
refactor!: drop support for Go 1.18

BREAKING CHANGE: Go 1.18 no longer supported; uses stdlib APIs from 1.21+
```

## Closing Issues via Commit Messages

Both GitHub and GitLab detect keywords in commit messages and automatically close the referenced issue when the commit lands on the default branch. Place the reference in the **footer** (preferred — keeps the subject line clean).

**Keywords:** `close`, `closes`, `closed`, `fix`, `fixes`, `fixed`, `resolve`, `resolves`, `resolved` — case-insensitive.

**GitHub:**

```
fix(auth): prevent token expiry race condition

Closes #42
Closes owner/repo#99
```

- Triggers when merged into the **default branch** (usually `main`)
- Cross-repo: `Closes owner/repo#42`
- Close multiple: `Closes #42, closes #43`
- Works in PR descriptions too

**GitLab:**

```
feat: add dark mode support

Resolves #101
Closes group/project#42
```

- Triggers when merged into the **default branch** (configurable per project)
- Cross-project: `Closes group/project#42`
- Close multiple: `Closes #101, closes #102`
- Works in MR descriptions too

**Tip:** Pair with the commit type — `fix:` closing a bug issue, `feat:` closing a feature request — keeps the changelog semantically coherent.

## Common Mistakes

| Mistake | Fix |
| --- | --- |
| `feat: Added login page` | `feat: add login page` — imperative, no capital |
| `fix: fix bug.` | `fix: fix bug` — no trailing period |
| Subject over 72 chars | Shorten; move detail to body |
| Breaking change only in body | Add `!` or `BREAKING CHANGE:` footer — tools won't detect body-only |
| `feat(adding-auth): ...` | `feat(auth): ...` — scope is a noun, not a verb |
| Closes #42 in subject line | Move to footer — keeps subject clean and parseable |

## Best Practices

- Align branch type and commit type — `feat/auth-*` branch → `feat(auth):` commits
- One concern per branch — mixing fixes into feature branches obscures the changelog
- Use scope consistently within a branch — `feat(auth):` throughout, not `feat(user):` mid-way
- **Squash merge:** when squash-merging a PR/MR, the branch commits are collapsed into one — the PR/MR title becomes the commit message. If the title doesn't follow conventional commits format, changelog generation breaks silently. Always set the PR title before squashing.
