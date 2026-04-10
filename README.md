# Agent Skills

AI agent skills are reusable instruction sets that extend your assistant with domain-specific expertise, loaded on demand so they don't bloat your context. This repository covers marketing and engineering skills authored by [@samber](https://github.com/samber).

For Golang-related skills, please visit [cc-skills-golang](https://github.com/samber/cc-skills-golang).

> [!IMPORTANT]  
> Bootstrapped with Claude. **Edited, tested, reviewed and reworked by a human**.
>
> **No AI slop here.** AI-made skills are useless.

<img width="3808" height="1280" alt="image" src="https://github.com/user-attachments/assets/95139f6f-c19c-4041-a010-d94bca594bba" />

## 🚀 How to use?

**Install with [skills](https://skills.sh/) CLI** (universal, works with any [Agent Skills](https://agentskills.io)-compatible tool):

```bash
npx skills add https://github.com/samber/cc-skills --all
# or a single skill:
npx skills add https://github.com/samber/cc-skills --skill promql-cli
```

<!-- prettier-ignore-start -->

<details>
<summary>Claude Code</summary>

```bash
/plugin marketplace add samber/cc
/plugin install cc-skills@samber
```

</details>

<details>
<summary>Openclaw</summary>

Copy skills into the cross-client discovery directory:

```bash
git clone https://github.com/samber/cc-skills.git ~/.openclaw/skills/cc-skills
# or in workspace:
git clone https://github.com/samber/cc-skills.git ~/.openclaw/workspace/skills/cc-skills
```

</details>

<details>
<summary>Gemini CLI</summary>

```bash
gemini extensions install https://github.com/samber/cc-skills
```

Update with `gemini extensions update cc-skills`.

</details>

<details>
<summary>Cursor</summary>

Copy skills into the cross-client discovery directory:

```bash
git clone https://github.com/samber/cc-skills.git  ~/.cursor/skills/cc-skills
```

Cursor auto-discovers skills from `.agents/skills/` and `.cursor/skills/`.

</details>

<details>
<summary>Copilot</summary>

Copy skills into the cross-client discovery directory:

```bash
/plugin install https://github.com/samber/cc-skills
# or
git clone https://github.com/samber/cc-skills.git ~/.copilot/skills/cc-skills
```

Copilot auto-discovers skills from `.copilot/skills/`.

</details>

<details>
<summary>OpenCode</summary>

Copy skills into the cross-client discovery directory:

```bash
git clone https://github.com/samber/cc-skills.git ~/.agents/skills/cc-skills
```

OpenCode auto-discovers skills from `.agents/skills/`, `.opencode/skills/`, and `.claude/skills/`.

</details>

<details>
<summary>Codex (OpenAI)</summary>

Clone into the cross-client discovery path:

```bash
git clone https://github.com/samber/cc-skills.git ~/.agents/skills/cc-skills
```

Codex auto-discovers skills from `~/.agents/skills/` and `.agents/skills/`. Update with `cd ~/.agents/skills/cc-skills && git pull`.

</details>

<details>
<summary>Antigravity</summary>

Clone and symlink into the cross-client discovery path:

```bash
git clone https://github.com/samber/cc-skills.git ~/.antigravity/skills/cc-skills
```

Update with `cd ~/.antigravity/skills/cc-skills && git pull`.

</details>

<!-- prettier-ignore-end -->

## 🧩 Skills

These skills are designed as **atomic units, cross-referencing units**. A skill may reference conventions defined in another. Installing only a subset will give you a partial and potentially inconsistent view of the guidelines. For best results, install all general-purpose skills together.

Each skill lives in `skills/<name>/` with a `SKILL.md` entry point. The `SKILL.md` is kept small with internal references to advanced markdown files, so only the relevant content is loaded into context.

- **Description (tok)**: weight of the `description` field from YAML frontmatter, always loaded into Claude's context for skill triggering
- **SKILL.md (tok)**: weight of the full `SKILL.md` file loaded when the skill triggers
- **Directory (tok)**: weight of all files in the skill directory (SKILL.md + referenced markdown files)

| Skill | Error rate gap | Description (tok) | SKILL.md (tok) | Directory (tok) |
| --- | --- | --- | --- | --- |
| `conventional-git` | -36% | 73 | 1,446 | 1,446 |
| `promql-cli` | -39% | 87 | 1,257 | 6,248 |
| `linkedin-ghostwriting` | -31% | 87 | 1,045 | 1,993 |
| `substack-ghostwriting` | -51% | 205 | 3,315 | 10,720 |
| `technical-article-writer` | -33% | 147 | 2,295 | 5,737 |
| `press-release-writer` | -34% | 149 | 1,532 | 17,829 |
| `humaniseur-fr` | -14% | 249 | 5,895 | 5,895 |
| `snyk-agent-scan-compliance` | -27% | TBD | TBD | TBD |

## 🧪 Skill evaluations

|             | With Skill | Without Skill | Delta     |
| ----------- | ---------- | ------------- | --------- |
| **Overall** | **99%**    | **62%**       | **+37pp** |

See [EVALUATIONS.md](./EVALUATIONS.md) for the full per-skill breakdown.

## 🎯 Tuning Skill Triggers

If a skill triggers too often or not often enough, please [open an issue](https://github.com/samber/cc-skills-golang/issues) suggesting a description change. The `description` field in SKILL.md frontmatter is the primary triggering mechanism: small wording adjustments can significantly improve trigger accuracy. Some `SKILL.md` might have a `When to use` section which is another level of exclusion. Finally, `SKILL.md` is an entrypoint for lazy loading references with deep knowledge located in `references/`.

## 🔄 Overlap

If your team has its own conventions, create a company skill and declare the override explicitly near the top of its body: `This skill supersedes samber/cc-skills@git-convention skill for [company] projects.`

## ✍️ Contribute

- **100 tokens per skill description** - what? when to use this skill?
- **1.000–2.500 tokens per SKILL.md** — keep the main file focused on essentials
- **Use secondary markdown files for depth** — reference them from SKILL.md with relative links (e.g., `[Logging](./logging.md)`). Claude reads these on demand when the topic is relevant, so they don't count against the context budget until needed
- **Up to 10.000 tokens** for full skill and secondary files
- **2–4 skills loaded simultaneously** in a typical session — design skills to coexist
- **Stay below ~10k tokens of total loaded SKILL.md** anytime to avoid degrading response quality

For more guidelines, please check `CLAUDE.md`.

## 💫 Fuel the Revolution

- ⭐️ **Star this repo** - Your star powers the caffeine engine!
- ☕️ **Buy me a coffee** - I'll literally use it to build more skills while drinking actual coffee

[![GitHub Sponsors](https://img.shields.io/github/sponsors/samber?style=for-the-badge)](https://github.com/sponsors/samber)

## 📝 License

Copyright © 2026 [Samuel Berthe](https://github.com/samber).

This project is under [MIT](./LICENSE) license.
