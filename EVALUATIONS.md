<!-- prettier-ignore-start -->

<style>
.g { color: #22863a; font-weight: bold; }
.r { color: #cb2431; font-weight: bold; }
</style>

# Evaluations

## Summary

| Skill                      | Version | Assertions | With Skill | Without Skill | Delta     | Uplift    | Concern                     |
| -------------------------- | ------- | ---------- | ---------- | ------------- | --------- | --------- | --------------------------- |
| `humaniseur-fr`                 | v1.0.0  | 71         | 99%        | 85%           | +14pp     | 1.17×     | **Low delta, High without** |
| `linkedin-ghostwriting`         | v1.0.0  | 46         | 98%        | 67%           | +30pp     | 1.45×     | **Low delta, High without** |
| `technical-article-writer`      | v1.1.0  | 95         | 100%       | 67%           | +33pp     | 1.48×     | **High without**            |
| `press-release-writer`          | v1.1.0  | 66         | 95%        | 61%           | +35pp     | 1.57×     | **Low with-skill score**    |
| `conventional-git`              | v1.0.0  | 50         | 100%       | 64%           | +36pp     | 1.56×     |                             |
| `promql-cli`                    | v1.0.0  | 36         | 100%       | 61%           | +39pp     | 1.64×     |                             |
| `substack-ghostwriting`         | v1.1.0  | 101        | 100%       | 50%           | +50pp     | 2.02×     |                             |
| `deep-research`                 | v1.0.0  | 43         | 100%       | 49%           | +51pp     | 2.05×     |                             |
| `snyk-agent-scan-compliance`    | v1.0.0  | 85         | 100%       | 49%           | +51pp     | 2.02×     |                             |
| `skill-progressive-disclosure-design` | v1.0.0 | 59    | 97%        | 39%           | +58pp     | 2.49×     |                             |
| `training-report`               | v1.0.0  | 67         | 99%        | 37%           | +61pp     | 2.64×     |                             |
| `influence-and-negotiation`     | v1.0.0  | 230        | 100%       | 32%           | +68pp     | 3.11×     |                             |
| **Total (12 skills)**           |         | **949**    | **99%**    | **51%**       | **+48pp** | **1.94×** |                             |

## `conventional-git` — v1.0.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 100%       | 64%           | +36pp | 50         |

<details>
<summary>Full breakdown (50 assertions)</summary>

Model: claude-sonnet-4-6 — 1 run each — graded by human-as-judge — adversarial evals (each has a trap the model falls into without the skill)

| #    | Assertion                                                                             | With                           | Without                                                                                            |
| ---- | ------------------------------------------------------------------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------- |
|      | **Eval 1: worktree in branch name — skill forbids it, model echoes it**               | **<span class="g">5/5</span>** | **<span class="r">3/5</span>**                                                                     |
| 1.1  | branch name does NOT contain 'worktree'                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 1.2  | branch name starts with 'feat/'                                                       | <span class="g">✓</span>       | <span class="r">✗ uses 'feature/' prefix</span>                                                    |
| 1.3  | lowercase, hyphens only                                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 1.4  | explains why 'worktree' must not appear in branch names                               | <span class="g">✓</span>       | <span class="r">✗ no explanation given</span>                                                      |
| 1.5  | description part ≤ 50 chars                                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
|      | **Eval 2: Issue number prefix in branch — model already knows this**                  | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                                     |
| 2.1  | branch name includes issue number '87'                                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 2.2  | issue number appears BEFORE the description                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 2.3  | branch name starts with 'fix/'                                                        | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 2.4  | lowercase, hyphens only                                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 2.5  | description part ≤ 50 chars                                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
|      | **Eval 3: Scope as noun not verb — model uses gerund without skill**                  | **<span class="g">6/6</span>** | **<span class="r">3/6</span>**                                                                     |
| 3.1  | scope does NOT end in '-ing'                                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 3.2  | scope does NOT contain 'adding', 'implementing', 'creating'                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 3.3  | scope is a short noun                                                                 | <span class="g">✓</span>       | <span class="r">✗ no scope used (no CC format)</span>                                              |
| 3.4  | type is 'feat'                                                                        | <span class="g">✓</span>       | <span class="r">✗ no type prefix — plain 'Add UserAuthService...'</span>                           |
| 3.5  | description uses imperative mood                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 3.6  | description starts with lowercase letter                                              | <span class="g">✓</span>       | <span class="r">✗ starts with capital 'Add'</span>                                                 |
|      | **Eval 4: Squash merge PR title — model misses the format requirement**               | **<span class="g">4/4</span>** | **<span class="r">3/4</span>**                                                                     |
| 4.1  | warns PR title becomes the single commit message after squash                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 4.2  | explicitly states PR title must follow Conventional Commits format                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 4.3  | flags 'Add user dashboard feature' as invalid (missing type prefix)                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 4.4  | suggests a corrected PR title (e.g. 'feat: add user dashboard')                       | <span class="g">✓</span>       | <span class="r">✗ no corrected title given</span>                                                  |
|      | **Eval 5: Closes #42 in footer not subject — model puts it in subject**               | **<span class="g">5/5</span>** | **<span class="r">2/5</span>**                                                                     |
| 5.1  | subject line does NOT contain '#42' or closing keyword                                | <span class="g">✓</span>       | <span class="r">✗ '(issue #42)' in subject</span>                                                  |
| 5.2  | 'Closes #42' appears in the footer                                                    | <span class="g">✓</span>       | <span class="r">✗ no footer — issue ref only in subject</span>                                     |
| 5.3  | subject uses imperative mood                                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 5.4  | type is 'fix'                                                                         | <span class="g">✓</span>       | <span class="r">✗ no CC type prefix</span>                                                         |
| 5.5  | no trailing period                                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
|      | **Eval 6: Deps upgrade → 'build' not 'chore' — model defaults to chore**              | **<span class="g">5/5</span>** | **<span class="r">3/5</span>**                                                                     |
| 6.1  | type is 'build'                                                                       | <span class="g">✓</span>       | <span class="r">✗ type is 'chore'</span>                                                           |
| 6.2  | type is NOT 'chore'                                                                   | <span class="g">✓</span>       | <span class="r">✗ type IS 'chore'</span>                                                           |
| 6.3  | description uses imperative mood                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 6.4  | description starts with lowercase                                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 6.5  | no trailing period                                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
|      | **Eval 7: Revert body — keep 'This reverts commit hash' — model rewrites body**       | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                                     |
| 7.1  | type is 'revert' (CC format 'revert:')                                                | <span class="g">✓</span>       | <span class="r">✗ uses git default 'Revert "..."' format, not 'revert:' type</span>                |
| 7.2  | body includes 'This reverts commit'                                                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 7.3  | hash 'abc1234f' referenced in body                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 7.4  | description uses imperative mood                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 7.5  | no trailing period                                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
|      | **Eval 8: Breaking change — body-only invisible to tools — model omits ! and footer** | **<span class="g">5/5</span>** | **<span class="r">3/5</span>**                                                                     |
| 8.1  | includes '!' after type/scope OR 'BREAKING CHANGE:' in footer                         | <span class="g">✓</span>       | <span class="r">✗ no ! and no BREAKING CHANGE: footer — body-only</span>                           |
| 8.2  | does NOT rely solely on body text to signal breaking change                           | <span class="g">✓</span>       | <span class="r">✗ breaking change only in body: 'Old config files are no longer compatible'</span> |
| 8.3  | type is NOT 'fix'                                                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 8.4  | description uses imperative mood                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 8.5  | description starts with lowercase                                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
|      | **Eval 9: One concern per branch — model says 'use fix:' without flagging alignment** | **<span class="g">4/4</span>** | **<span class="r">1/4</span>**                                                                     |
| 9.1  | does NOT lead with 'use fix:' without discussing branch alignment                     | <span class="g">✓</span>       | <span class="r">✗ leads with 'Short Answer: Use fix: for the bug fix commit'</span>                |
| 9.2  | recommends separate fix/ branch OR discusses tradeoff                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 9.3  | explains that mixing fix: on feat/ branch obscures the changelog                      | <span class="g">✓</span>       | <span class="r">✗ discusses reverse concern (feat: for bug) not fix: on feat/ branch</span>        |
| 9.4  | if staying on feature branch, says to use feat: not fix:                              | <span class="g">✓</span>       | <span class="r">✗ recommends fix: on feat/ branch without alignment explanation</span>             |
|      | **Eval 10: Cross-repo issue closing — model already knows owner/repo#N format**       | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                                     |
| 10.1 | uses Closes/Fixes/Resolves keyword                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 10.2 | reference format is 'owner/repo#number'                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 10.3 | does NOT use just '#99'                                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 10.4 | does NOT use just 'frontend#99'                                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |
| 10.5 | closing reference in footer, not subject                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                           |

</details>

## `linkedin-ghostwriting` — v1.0.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 98%        | 67%           | +31pp | 46         |

<details>
<summary>Full breakdown (46 assertions)</summary>

Model: claude-sonnet-4-6 — 1 run each — graded by human-as-judge

| #    | Assertion                                                                  | With                                                                 | Without                                                                      |
| ---- | -------------------------------------------------------------------------- | -------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
|      | **Eval 1: Newsletter growth — interview before writing**                   | **<span class="g">6/6</span>**                                       | **<span class="r">0/6</span>**                                               |
| 1.1  | asks questions before writing a post (no post content in response)         | <span class="g">✓</span>                                             | <span class="r">✗ wrote full post</span>                                     |
| 1.2  | asks 8 or more distinct questions                                          | <span class="g">✓</span>                                             | <span class="r">✗</span>                                                     |
| 1.3  | asks for specific before/after metrics or exact numbers                    | <span class="g">✓</span>                                             | <span class="r">✗</span>                                                     |
| 1.4  | asks about the mechanism/process (how it was achieved)                     | <span class="g">✓</span>                                             | <span class="r">✗</span>                                                     |
| 1.5  | asks about the target audience                                             | <span class="g">✓</span>                                             | <span class="r">✗</span>                                                     |
| 1.6  | asks about the CTA or business goal of the post                            | <span class="g">✓</span>                                             | <span class="r">✗</span>                                                     |
|      | **Eval 2: SaaS churn hooks — 3-5 options, no rhetorical questions**        | **<span class="g">5/5</span>**                                       | **<span class="r">4/5</span>**                                               |
| 2.1  | proposes 3 or more hook options                                            | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 2.2  | each hook is a short standalone line — no full post body                   | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 2.3  | waits for user to choose a hook (does not write the full post)             | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 2.4  | no rhetorical questions in any hooks (no '?' at end of hook lines)         | <span class="g">✓</span>                                             | <span class="r">✗ Hook 3 ends with '?'</span>                                |
| 2.5  | at least one hook includes specific numbers (8%, 2%, 6 months)             | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
|      | **Eval 3: Full post body — active voice, directive CTA, short paragraphs** | **<span class="g">6/6</span>**                                       | **<span class="g">6/6</span>**                                               |
| 3.1  | post starts with or closely follows the selected hook                      | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 3.2  | no rhetorical questions in the post body                                   | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 3.3  | post uses active voice                                                     | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 3.4  | has a clear, directive CTA (not an open-ended question)                    | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 3.5  | paragraphs are short (2 visual lines or fewer)                             | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 3.6  | does not contain 'very', 'really', or 'incredibly'                         | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
|      | **Eval 4: Leadership topic — push back on missing metrics**                | **<span class="g">4/4</span>**                                       | **<span class="r">2/4</span>**                                               |
| 4.1  | does not write a generic post without metrics                              | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 4.2  | asks for quantified before/after results or measurable outcomes            | <span class="g">✓</span>                                             | <span class="r">✗ de-emphasizes metrics ("even if it's not a metric")</span> |
| 4.3  | asks for a specific scene or moment                                        | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 4.4  | asks for a counter-intuitive insight                                       | <span class="g">✓</span>                                             | <span class="r">✗ not asked</span>                                           |
|      | **Eval 5: Remote work culture — interview, not generic post**              | **<span class="g">4/4</span>**                                       | **<span class="r">0/4</span>**                                               |
| 5.1  | does not immediately write a generic thought-leadership post               | <span class="g">✓</span>                                             | <span class="r">✗ wrote generic post immediately</span>                      |
| 5.2  | asks about the user's personal experience with remote work                 | <span class="g">✓</span>                                             | <span class="r">✗</span>                                                     |
| 5.3  | asks for specific data, outcomes, or evidence                              | <span class="g">✓</span>                                             | <span class="r">✗</span>                                                     |
| 5.4  | asks what specific insight the user wants to challenge                     | <span class="g">✓</span>                                             | <span class="r">✗</span>                                                     |
|      | **Eval 6: Full context — propose hooks before full post**                  | **<span class="r">3/4</span>**                                       | **<span class="r">3/4</span>**                                               |
| 6.1  | proposes hooks before writing the full post (does not skip Phase 2)        | <span class="r">✗ skipped hook selection, wrote post directly</span> | <span class="r">✗ wrote full post immediately</span>                         |
| 6.2  | if full post written: CTA is directive, not open-ended                     | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 6.3  | if full post written: no empty phrases ('digital landscape', etc.)         | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 6.4  | if full post written: no ternary hook structure                            | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
|      | **Eval 7: Cold email hooks — numbers, no rhetorical questions**            | **<span class="g">4/4</span>**                                       | **<span class="g">4/4</span>**                                               |
| 7.1  | proposes 3 or more hook options                                            | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 7.2  | no rhetorical questions in any hooks                                       | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 7.3  | hooks include specific numbers (10,000, 38%)                               | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 7.4  | hooks reveal result but not full method — maintaining tension              | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
|      | **Eval 8: Weak post — remove filler, suggest real data**                   | **<span class="g">5/5</span>**                                       | **<span class="r">4/5</span>**                                               |
| 8.1  | removes 'very', 'really', or similar filler adverbs                        | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 8.2  | removes empty phrases like 'digital landscape'                             | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 8.3  | uses active voice throughout                                               | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 8.4  | result is noticeably shorter/tighter than the original                     | <span class="g">✓</span>                                             | <span class="r">✗ rewrite is longer than original</span>                     |
| 8.5  | suggests the user needs specific numbers/data to make the post credible    | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
|      | **Eval 9: Weak CTA — flag and replace**                                    | **<span class="g">3/3</span>**                                       | **<span class="g">3/3</span>**                                               |
| 9.1  | identifies the open-ended question as a weak CTA                           | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 9.2  | suggests a directive alternative ('Comment X', 'DM me', 'Save this')       | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 9.3  | explains why directive CTAs outperform open-ended questions                | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
|      | **Eval 10: Post body from given hook — active voice, directive CTA**       | **<span class="g">5/5</span>**                                       | **<span class="g">5/5</span>**                                               |
| 10.1 | post starts with or immediately after the given hook                       | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 10.2 | no rhetorical questions in the post body                                   | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 10.3 | CTA is directive: 'Comment QUESTION' or similar                            | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 10.4 | paragraphs are short (2 visual lines max)                                  | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |
| 10.5 | active voice throughout                                                    | <span class="g">✓</span>                                             | <span class="g">✓</span>                                                     |

</details>

## `promql-cli` — v1.0.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 100%       | 61%           | +39pp | 36         |

<details>
<summary>Full breakdown (36 assertions)</summary>

Model: claude-sonnet-4-6 — 1 run each — graded by human-as-judge

| #    | Assertion                                                               | With                           | Without                                                                |
| ---- | ----------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------------------- |
|      | **Eval 1: Current request count — rate() not raw counter**              | **<span class="g">3/3</span>** | **<span class="r">1/3</span>**                                         |
| 1.1  | uses rate() — does NOT suggest querying raw counter without rate()      | <span class="g">✓</span>       | <span class="r">✗ suggests raw counter first</span>                    |
| 1.2  | includes a time window in rate() e.g. [5m]                              | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 1.3  | explains why raw counter values are not meaningful                      | <span class="g">✓</span>       | <span class="r">✗ no explanation provided</span>                       |
|      | **Eval 2: Debug slow pods — isolate by instance, not avg across fleet** | **<span class="g">4/4</span>** | **<span class="r">3/4</span>**                                         |
| 2.1  | recommends filtering/isolating by pod or instance label                 | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 2.2  | does NOT suggest avg() or sum() across all pods as first step           | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 2.3  | suggests histogram or rate-based latency metrics                        | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 2.4  | includes label matcher syntax to filter by specific pod or instance     | <span class="g">✓</span>       | <span class="r">✗ groups by pod but no specific instance filter</span> |
|      | **Eval 3: p99 histogram — preserve le label**                           | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                         |
| 3.1  | uses histogram_quantile(0.99, ...)                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 3.2  | preserves the 'le' label in by() clause                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 3.3  | applies rate() to the histogram _bucket series                          | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 3.4  | does NOT suggest dropping 'le' before histogram_quantile                | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
|      | **Eval 4: Error rate trend 2h — range query, --output graph**           | **<span class="g">4/4</span>** | **<span class="r">3/4</span>**                                         |
| 4.1  | uses --start 2h (or equivalent range query flag)                        | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 4.2  | recommends --output graph for visualizing the trend                     | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                 |
| 4.3  | uses rate() on the error counter metric                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 4.4  | does NOT just suggest a plain instant query                             | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
|      | **Eval 5: Bearer token — never in config file, chmod 600**              | **<span class="g">4/4</span>** | **<span class="r">1/4</span>**                                         |
| 5.1  | does NOT write config file content containing the token value           | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 5.2  | instructs user to create the config file manually themselves            | <span class="g">✓</span>       | <span class="r">✗ uses env vars, no config file guidance</span>        |
| 5.3  | mentions chmod 600 to protect the credentials file                      | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                 |
| 5.4  | does NOT suggest passing the token as a CLI flag                        | <span class="g">✓</span>       | <span class="r">✗ suggests --bearer-token CLI flag</span>              |
|      | **Eval 6: CPU filter — labels in innermost selector**                   | **<span class="g">3/3</span>** | **<span class="g">3/3</span>**                                         |
| 6.1  | places label matchers in the innermost metric selector                  | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 6.2  | filtering appears before any aggregation function                       | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 6.3  | does NOT suggest applying label filters outside the selector            | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
|      | **Eval 7: Connection refused — config problem, not query problem**      | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                         |
| 7.1  | identifies this as a host configuration problem                         | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 7.2  | guides the user to check their host configuration                       | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 7.3  | does NOT suggest modifying the PromQL query to fix the error            | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 7.4  | does NOT create a config file with credentials                          | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
|      | **Eval 8: List metrics — promql metrics subcommand**                    | **<span class="g">3/3</span>** | **<span class="r">0/3</span>**                                         |
| 8.1  | suggests the 'promql metrics' subcommand                                | <span class="g">✓</span>       | <span class="r">✗ suggests curl then PromQL regex instead</span>       |
| 8.2  | does NOT suggest `{__name__=~".+"}` as the primary approach             | <span class="g">✓</span>       | <span class="r">✗ suggests it as the promql-cli approach</span>        |
| 8.3  | shows correct CLI syntax for the metrics subcommand                     | <span class="g">✓</span>       | <span class="r">✗ does not know the subcommand</span>                  |
|      | **Eval 9: Active connections — gauge vs counter distinction**           | **<span class="g">3/3</span>** | **<span class="r">0/3</span>**                                         |
| 9.1  | distinguishes between gauge (raw value OK) and counter (needs rate())   | <span class="g">✓</span>       | <span class="r">✗ no gauge/counter distinction</span>                  |
| 9.2  | if gauge: confirms raw value is appropriate for active connections      | <span class="g">✓</span>       | <span class="r">✗ not addressed</span>                                 |
| 9.3  | suggests checking metric type with 'promql meta metric'                 | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                 |
|      | **Eval 10: Before/after deploy — range query, --output graph**          | **<span class="g">4/4</span>** | **<span class="r">3/4</span>**                                         |
| 10.1 | uses a range query with --start flag                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 10.2 | recommends --output graph to visualize the trend                        | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                 |
| 10.3 | uses rate() for request/error rate metrics                              | <span class="g">✓</span>       | <span class="g">✓</span>                                               |
| 10.4 | does NOT just suggest a single instant query                            | <span class="g">✓</span>       | <span class="g">✓</span>                                               |

</details>

## `substack-ghostwriting` — v1.1.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 100%       | 49%           | +51pp | 101        |

<details>
<summary>Full breakdown (101 assertions)</summary>

Model: claude-opus-4-6 — 1 run each — graded by human-as-judge — adversarial evals (each has a trap the model falls into without the skill)

| #    | Assertion                                                                                                | With                           | Without                                                                          |
| ---- | -------------------------------------------------------------------------------------------------------- | ------------------------------ | -------------------------------------------------------------------------------- |
|      | **Eval 1: Evergreen content → web post, not newsletter**                                                 | **<span class="g">5/5</span>** | **<span class="r">2/5</span>**                                                   |
| 1.1  | identifies this as a web post (not newsletter issue) based on 'evergreen' keyword                        | <span class="g">✓</span>       | <span class="r">✗ treats as generic Substack post</span>                         |
| 1.2  | mentions SEO title field or SEO optimization specific to web posts                                       | <span class="g">✓</span>       | <span class="r">✗ no Substack SEO title field</span>                             |
| 1.3  | suggests a URL slug (short, keyword-rich)                                                                | <span class="g">✓</span>       | <span class="r">✗ not suggested</span>                                           |
| 1.4  | does NOT treat this as a newsletter issue (no subject line / preview text focus)                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 1.5  | mentions table of contents for long content or web-specific formatting                                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 2: Ghostwriting — interview before writing**                                                      | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                   |
| 2.1  | does NOT write a full post immediately                                                                   | <span class="g">✓</span>       | <span class="r">✗ wrote draft immediately</span>                                 |
| 2.2  | asks for voice samples (transcripts, past writing, or media appearances)                                 | <span class="g">✓</span>       | <span class="r">✗ not asked</span>                                               |
| 2.3  | prioritizes transcripts over published writing as voice source                                           | <span class="g">✓</span>       | <span class="r">✗ no source prioritization</span>                                |
| 2.4  | mentions building a voice guide before drafting                                                          | <span class="g">✓</span>       | <span class="r">✗ no voice guide concept</span>                                  |
| 2.5  | asks about the CEO's natural speaking/writing patterns                                                   | <span class="g">✓</span>       | <span class="r">✗ not asked</span>                                               |
|      | **Eval 3: Gmail truncation warning for long newsletter**                                                 | **<span class="g">5/5</span>** | **<span class="r">1/5</span>**                                                   |
| 3.1  | warns about Gmail truncation at ~102KB / ~3000 words                                                     | <span class="g">✓</span>       | <span class="r">✗ no truncation warning</span>                                   |
| 3.2  | suggests keeping content under ~3000 words or acknowledges truncation risk                               | <span class="g">✓</span>       | <span class="r">✗ complies with 4000-word request</span>                         |
| 3.3  | uses short paragraphs (2-3 sentences) for email readability                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 3.4  | suggests code blocks under 10 lines with links to Gist for longer code                                   | <span class="g">✓</span>       | <span class="r">✗ no Gist links suggested</span>                                 |
| 3.5  | recommends a TL;DR at top for issues over 1500 words                                                     | <span class="g">✓</span>       | <span class="r">✗ no TL;DR recommendation</span>                                 |
|      | **Eval 4: Web post SEO — separate fields awareness**                                                     | **<span class="g">5/5</span>** | **<span class="r">3/5</span>**                                                   |
| 4.1  | mentions the separate SEO title field (distinct from main title)                                         | <span class="g">✓</span>       | <span class="r">✗ no Substack SEO title field</span>                             |
| 4.2  | writes or recommends an SEO description of 150-160 characters                                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 4.3  | suggests a URL slug (short, keyword-rich, no dates)                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 4.4  | mentions Substack has high domain authority for SEO                                                      | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                           |
| 4.5  | recommends internal linking to other Substack posts                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 5: Algorithm — subscriptions not engagement**                                                     | **<span class="g">5/5</span>** | **<span class="r">2/5</span>**                                                   |
| 5.1  | explains algorithm optimizes for subscriptions/paid conversions, NOT engagement                          | <span class="g">✓</span>       | <span class="r">✗ assumes engagement-based algorithm</span>                      |
| 5.2  | explicitly discourages engagement bait, outrage, or hot takes                                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 5.3  | mentions Recommendations from other publications as a top growth lever                                   | <span class="g">✓</span>       | <span class="r">✗ generic cross-promotion only</span>                            |
| 5.4  | mentions Notes as a testing pipeline for long-form content                                               | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                           |
| 5.5  | references quality/consistency as primary growth driver                                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 6: Notes — not threads, concise standalone**                                                      | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                   |
| 6.1  | advises against thread-style content on Notes                                                            | <span class="g">✓</span>       | <span class="r">✗ helps adapt thread format</span>                               |
| 6.2  | recommends concise Notes (2-5 sentences)                                                                 | <span class="g">✓</span>       | <span class="r">✗ supports long-form threads</span>                              |
| 6.3  | suggests using Notes as testing pipeline for long-form posts                                             | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                           |
| 6.4  | mentions likes as the primary Notes ranking signal                                                       | <span class="g">✓</span>       | <span class="r">✗ no algorithm details</span>                                    |
| 6.5  | explains that Notes should have standalone value                                                         | <span class="g">✓</span>       | <span class="r">✗ helps create thread series</span>                              |
|      | **Eval 7: Monetization — don't paywall under 1000 subs**                                                 | **<span class="g">5/5</span>** | **<span class="r">1/5</span>**                                                   |
| 7.1  | advises against launching paid tier at 300 subscribers                                                   | <span class="g">✓</span>       | <span class="r">✗ cautiously supportive</span>                                   |
| 7.2  | explains growth compounds faster than paid conversion at small scale                                     | <span class="g">✓</span>       | <span class="r">✗ not articulated</span>                                         |
| 7.3  | references the ~3% free-to-paid conversion baseline                                                      | <span class="g">✓</span>       | <span class="r">✗ no conversion benchmarks</span>                                |
| 7.4  | recommends keeping everything free and focusing on growth first                                          | <span class="g">✓</span>       | <span class="r">✗ suggests testing paid content</span>                           |
| 7.5  | suggests alternative monetization paths (coaching, consulting)                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 8: Social distribution — don't announce, lead with insight**                                      | **<span class="g">5/5</span>** | **<span class="r">1/5</span>**                                                   |
| 8.1  | does NOT start with 'I just published' or similar announcement                                           | <span class="g">✓</span>       | <span class="r">✗ default promotion pattern</span>                               |
| 8.2  | leads with an insight, hook, or the 90% result                                                           | <span class="g">✓</span>       | <span class="r">✗ leads with announcement</span>                                 |
| 8.3  | gives 30-40% of value upfront so post works standalone                                                   | <span class="g">✓</span>       | <span class="r">✗ structured as teaser</span>                                    |
| 8.4  | uses line breaks between sentences for LinkedIn readability                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 8.5  | post works even if the reader never clicks the link                                                      | <span class="g">✓</span>       | <span class="r">✗ requires click for value</span>                                |
|      | **Eval 9: Voice matching — single source warning**                                                       | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                   |
| 9.1  | warns against anchoring voice analysis on a single source                                                | <span class="g">✓</span>       | <span class="r">✗ works with single source</span>                                |
| 9.2  | asks for additional sources (transcripts, social, Slack, talks)                                          | <span class="g">✓</span>       | <span class="r">✗ not asked</span>                                               |
| 9.3  | explains that blog posts are edited and may differ from natural voice                                    | <span class="g">✓</span>       | <span class="r">✗ no distinction</span>                                          |
| 9.4  | prioritizes transcripts or spoken content over published writing                                         | <span class="g">✓</span>       | <span class="r">✗ no source prioritization</span>                                |
| 9.5  | does NOT immediately write in a 'captured' voice from one blog post                                      | <span class="g">✓</span>       | <span class="r">✗ attempts to write immediately</span>                           |
|      | **Eval 10: Paywall placement — value above the fold**                                                    | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                                   |
| 10.1 | advises against paywalling the intro/hook/beginning                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 10.2 | recommends giving enough free value above the fold                                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 10.3 | explains that free content drives growth and recommendations                                             | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 10.4 | suggests placing paywall after delivering strong value                                                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 11: Subject line + preview text complementarity**                                                 | **<span class="g">4/4</span>** | **<span class="r">1/4</span>**                                                   |
| 11.1 | preview text does NOT repeat or paraphrase the subject line                                              | <span class="g">✓</span>       | <span class="r">✗ paraphrases cost-cutting theme</span>                          |
| 11.2 | preview text complements/extends with new information                                                    | <span class="g">✓</span>       | <span class="r">✗ echoes same proposition</span>                                 |
| 11.3 | preview text is approximately 90 characters or under                                                     | <span class="g">✓</span>       | <span class="r">✗ defaults to meta-description length</span>                     |
| 11.4 | explains subject line + preview text should work as a pair                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 12: Substack special blocks — contextual suggestions**                                            | **<span class="g">5/5</span>** | **<span class="r">1/5</span>**                                                   |
| 12.1 | suggests a subscribe button for free readers                                                             | <span class="g">✓</span>       | <span class="r">✗ no Substack subscribe block</span>                             |
| 12.2 | suggests a share button after the strong insight                                                         | <span class="g">✓</span>       | <span class="r">✗ no Substack share block</span>                                 |
| 12.3 | mentions pull quote for the most quotable line                                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 12.4 | recommends reply prompt (replies are an algorithm signal)                                                | <span class="g">✓</span>       | <span class="r">✗ no algorithm signal awareness</span>                           |
| 12.5 | references Substack-specific content blocks                                                              | <span class="g">✓</span>       | <span class="r">✗ generic formatting only</span>                                 |
|      | **Eval 13: Email paragraph walls — 4-5 sentence paragraphs in newsletter**                               | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                                   |
| 13.1 | flags the paragraph as too long for email newsletter format                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 13.2 | recommends breaking into 2-3 sentence paragraphs                                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 13.3 | explains email clients render narrow columns making long paragraphs feel like walls                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 13.4 | does NOT say the paragraph is fine as-is                                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 14: Notes don't support video — user wants to upload video**                                      | **<span class="g">4/4</span>** | **<span class="r">3/4</span>**                                                   |
| 14.1 | warns that Substack Notes does not support video uploads                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 14.2 | suggests alternatives (GIF, screenshots, link to video hosted elsewhere)                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 14.3 | still recommends using Notes as a testing pipeline for the idea                                          | <span class="g">✓</span>       | <span class="r">✗ no testing pipeline concept</span>                             |
| 14.4 | does NOT help upload video to Notes as if it's supported                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 15: Long code in newsletter — 30+ lines inline**                                                  | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                   |
| 15.1 | advises against including 35 lines of code in a newsletter email                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 15.2 | recommends linking to a GitHub Gist or repo for the full code                                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 15.3 | suggests including a short 2-5 line excerpt inline for context                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 15.4 | explains code rendering varies by email client (Outlook may strip formatting)                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 15.5 | mentions the ~10 line threshold for email code blocks                                                    | <span class="g">✓</span>       | <span class="r">✗ no specific threshold mentioned</span>                         |
|      | **Eval 16: Embeds in newsletter issue — YouTube + tweets**                                               | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                   |
| 16.1 | warns that embeds (YouTube, tweets) degrade to links/previews in email                                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 16.2 | recommends not relying on embeds for critical content in newsletter issues                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 16.3 | suggests alternatives (screenshots of tweets, link to video with description)                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 16.4 | distinguishes between web rendering (embeds work) and email rendering (they don't)                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 16.5 | does NOT just say 'looks great, go ahead'                                                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 17: URL slug with dates for evergreen web post**                                                  | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                   |
| 17.1 | advises removing the date from the URL slug                                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 17.2 | explains dates in URLs make evergreen content look stale over time                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 17.3 | suggests a dateless alternative                                                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 17.4 | keeps slug to 3-6 words, keyword-rich                                                                    | <span class="g">✓</span>       | <span class="r">✗ no specific 3-6 word guideline</span>                          |
| 17.5 | flags the date in the title as problematic for evergreen content                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 18: Gaming the Recommendations system algorithmically**                                           | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                   |
| 18.1 | explains the Recommendations system is fully human-curated, not algorithmic                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 18.2 | clarifies you cannot game Recommendations through engagement signals                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 18.3 | describes the actual path: write quality content, engage with other writers, build genuine relationships | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 18.4 | mentions Recommendations appear during subscribe flow (highest conversion moment)                        | <span class="g">✓</span>       | <span class="r">✗ describes mechanism but not its conversion significance</span> |
| 18.5 | does NOT describe algorithmic tricks to optimize for recommendations                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 19: Prioritizing Substack Boost at 200 subscribers**                                              | **<span class="g">5/5</span>** | **<span class="r">3/5</span>**                                                   |
| 19.1 | advises against prioritizing Boost at 200 subscribers                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 19.2 | explains Boost is low impact at small scale (Tier 4 or equivalent)                                       | <span class="g">✓</span>       | <span class="r">✗ no tier ranking or systematic framework</span>                 |
| 19.3 | recommends higher-impact levers: consistent publishing, Notes as testing pipeline, Recommendations       | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 19.4 | mentions Recommendations from larger publications as the highest-impact growth lever                     | <span class="g">✓</span>       | <span class="r">✗ not identified as highest-impact</span>                        |
| 19.5 | does NOT endorse Boost as the primary growth strategy at this stage                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 20: Subject line too long for mobile — 80+ chars**                                                | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                   |
| 20.1 | flags the subject line as too long (especially for mobile at ~35-40 chars visible)                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 20.2 | recommends front-loading the interesting part in the first 35-40 characters                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 20.3 | suggests a shorter alternative under 60 characters                                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 20.4 | mentions specific character limits for different clients (mobile, Gmail, Yahoo)                          | <span class="g">✓</span>       | <span class="r">✗ gives generic '40-60' range, no per-client breakdown</span>    |
| 20.5 | does NOT just evaluate the subject line on content quality alone                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
|      | **Eval 21: Sections overload at 5 posts**                                                                | **<span class="g">5/5</span>** | **<span class="r">2/5</span>**                                                   |
| 21.1 | advises against creating 7 sections with only 5 posts                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |
| 21.2 | recommends starting with 2-4 sections maximum                                                            | <span class="g">✓</span>       | <span class="r">✗ says '1-2' or '2-3' (different threshold)</span>               |
| 21.3 | explains sections should wait until 20+ posts to be meaningful                                           | <span class="g">✓</span>       | <span class="r">✗ says '15-25+' (different threshold)</span>                     |
| 21.4 | notes each section gets its own RSS feed and subscribe option                                            | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                           |
| 21.5 | suggests consolidating into fewer, broader sections                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                         |

</details>

## `technical-article-writer` — v1.1.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 100%       | 67%           | +33pp | 95         |

<details>
<summary>Full breakdown (95 assertions)</summary>

Model: claude-opus-4-6 — 1 run each — graded by human-as-judge — adversarial evals (each has a trap the model falls into without the skill)

| #    | Assertion                                                                                 | With                           | Without                                                                        |
| ---- | ----------------------------------------------------------------------------------------- | ------------------------------ | ------------------------------------------------------------------------------ |
|      | **Eval 1: Phase-gated workflow — ask before writing**                                     | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                 |
| 1.1  | does NOT write a full article immediately                                                 | <span class="g">✓</span>       | <span class="r">✗ writes full blog post</span>                                 |
| 1.2  | asks about the specific aspect of Java performance                                        | <span class="g">✓</span>       | <span class="r">✗ covers multiple aspects broadly</span>                       |
| 1.3  | asks about the target audience                                                            | <span class="g">✓</span>       | <span class="r">✗ defaults to mid-level</span>                                 |
| 1.4  | asks about the content type (tutorial, benchmark, explainer)                              | <span class="g">✓</span>       | <span class="r">✗ defaults to generic blog format</span>                       |
| 1.5  | asks about the thesis or key takeaway                                                     | <span class="g">✓</span>       | <span class="r">✗ picks generic thesis</span>                                  |
|      | **Eval 2: Idea quality filter — push back on textbook topic**                             | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                 |
| 2.1  | pushes back on the generic 'basics of Docker Compose' angle                               | <span class="g">✓</span>       | <span class="r">✗ complies with the request</span>                             |
| 2.2  | references or applies a novelty filter                                                    | <span class="g">✓</span>       | <span class="r">✗ no novelty filter concept</span>                             |
| 2.3  | suggests finding a specific struggle, surprise, or insight                                | <span class="g">✓</span>       | <span class="r">✗ proceeds with basics</span>                                  |
| 2.4  | does NOT immediately write a basic tutorial                                               | <span class="g">✓</span>       | <span class="r">✗ starts writing or outlining immediately</span>               |
| 2.5  | helps the user find a more compelling angle                                               | <span class="g">✓</span>       | <span class="r">✗ no angle exploration</span>                                  |
|      | **Eval 3: 10 title variants, not 3-5**                                                    | **<span class="g">5/5</span>** | **<span class="r">2/5</span>**                                                 |
| 3.1  | generates 10 or more title variants                                                       | <span class="g">✓</span>       | <span class="r">✗ generates 5-7 titles</span>                                  |
| 3.2  | uses different hook strategies across titles                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 3.3  | includes specific technical keywords (MongoDB, PostgreSQL)                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 3.4  | avoids superlatives ('ultimate', 'complete')                                              | <span class="g">✓</span>       | <span class="r">✗ uses 'The Complete Guide...' pattern</span>                  |
| 3.5  | provides brief notes or rankings on why each works                                        | <span class="g">✓</span>       | <span class="r">✗ lists without detailed rationale</span>                      |
|      | **Eval 4: Content type matching — Bug Hunt template**                                     | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                 |
| 4.1  | identifies or recommends the Bug Hunt content type                                        | <span class="g">✓</span>       | <span class="r">✗ suggests generic narrative structure</span>                  |
| 4.2  | includes a 'first hypothesis' or 'dead ends' section                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 4.3  | recommends building tension with wrong hypotheses                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 4.4  | includes the fix/solution as a distinct section                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 4.5  | ends with a generalizable lesson beyond this specific bug                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 5: Show-then-tell principle for code**                                             | **<span class="g">4/4</span>** | **<span class="r">2/4</span>**                                                 |
| 5.1  | leads with a code example BEFORE the conceptual explanation                               | <span class="g">✓</span>       | <span class="r">✗ explains concept first, then code</span>                     |
| 5.2  | code snippet is under 20 lines and focused on one concept                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 5.3  | annotates or explains non-obvious lines in the code                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 5.4  | conceptual explanation follows the code example                                           | <span class="g">✓</span>       | <span class="r">✗ concept-first order</span>                                   |
|      | **Eval 6: Steelman for opinion piece**                                                    | **<span class="g">4/4</span>** | **<span class="r">2/4</span>**                                                 |
| 6.1  | includes a section addressing the strongest arguments FOR microservices                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 6.2  | the steelman is substantive, not a straw man                                              | <span class="g">✓</span>       | <span class="r">✗ brief dismissive treatment when told to 'go all in'</span>   |
| 6.3  | uses concrete examples, not just abstract reasoning                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 6.4  | quantifies claims where possible                                                          | <span class="g">✓</span>       | <span class="r">✗ qualitative arguments without specific numbers</span>        |
|      | **Eval 7: Anti-pattern detection — burying the lede**                                     | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                 |
| 7.1  | moves the 73% finding to the opening                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 7.2  | removes the 'rapidly evolving tech landscape' preamble                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 7.3  | explicitly calls out the buried lede as the problem                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 7.4  | removes 'In this article, we'll explore' meta-framing                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 7.5  | the rewritten intro hooks the reader immediately                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 8: Copywriting framework application**                                             | **<span class="g">4/4</span>** | **<span class="r">3/4</span>**                                                 |
| 8.1  | uses or references a named copywriting framework (PAS, AIDA, BAB)                         | <span class="g">✓</span>       | <span class="r">✗ writes intuitively, no named framework</span>                |
| 8.2  | hook addresses the reader's pain before presenting the solution                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 8.3  | includes stakes or agitation — cost of slow CI                                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 8.4  | intro accomplishes: hook + stakes + promise                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 9: Tutorial completeness — prerequisites and verification**                        | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                 |
| 9.1  | includes an explicit prerequisites section                                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 9.2  | shows expected result/output after key steps                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 9.3  | includes a verification section at the end                                                | <span class="g">✓</span>       | <span class="r">✗ ends at last implementation step</span>                      |
| 9.4  | includes next steps or related topics section                                             | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 9.5  | steps are numbered and sequential                                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 10: Title finalization after full draft**                                          | **<span class="g">4/4</span>** | **<span class="r">3/4</span>**                                                 |
| 10.1 | recommends reconsidering the title                                                        | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 10.2 | suggests 2-3 alternatives reflecting actual content (data integrity)                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 10.3 | explains titles should be revisited after writing as a methodology                        | <span class="g">✓</span>       | <span class="r">✗ suggests better titles but not as a general principle</span> |
| 10.4 | alternatives are more specific than the original                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 11: Diataxis — mixing content types diagnosis**                                    | **<span class="g">4/4</span>** | **<span class="r">3/4</span>**                                                 |
| 11.1 | identifies the problem as mixing content types                                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 11.2 | references or applies the Diataxis framework                                              | <span class="g">✓</span>       | <span class="r">✗ describes problem in general terms only</span>               |
| 11.3 | recommends splitting into separate pieces                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 11.4 | explains why tutorials should not drift into theory                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 12: Image suggestions with Midjourney specifics**                                  | **<span class="g">5/5</span>** | **<span class="r">3/5</span>**                                                 |
| 12.1 | suggests 1-3 images with specific placement                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 12.2 | each image has a stated purpose                                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 12.3 | each image has a description of what it should depict                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 12.4 | offers to generate Midjourney prompts                                                     | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                         |
| 12.5 | mentions aspect ratio conventions (16:9 or 3:1 for hero, 3:2 for inline)                  | <span class="g">✓</span>       | <span class="r">✗ no aspect ratios</span>                                      |
|      | **Eval 13: "We Rewrote It" missing "what went wrong" section**                            | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                 |
| 13.1 | pushes back on omitting difficulties/failures                                             | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 13.2 | explains the 'what went wrong' section is critical for credibility                        | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 13.3 | notes that without failures, the article reads like a press release                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 13.4 | suggests specific prompts to surface challenges                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 13.5 | recommends the 'We Rewrote It in X' structure with 'what went wrong' at ~15%              | <span class="g">✓</span>       | <span class="r">✗ no named template or percentage allocation</span>            |
|      | **Eval 14: Benchmark article burying methodology**                                        | **<span class="g">5/5</span>** | **<span class="r">2/5</span>**                                                 |
| 14.1 | recommends NOT leading with results                                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 14.2 | explains methodology must come before results to establish trust                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 14.3 | references or applies the Benchmark/Data-Driven content type structure                    | <span class="g">✓</span>       | <span class="r">✗ no named template</span>                                     |
| 14.4 | suggests methodology section at ~20% of article before the results section                | <span class="g">✓</span>       | <span class="r">✗ no percentage allocation</span>                              |
| 14.5 | notes that 'no trust in setup = no trust in conclusions'                                  | <span class="g">✓</span>       | <span class="r">✗ expresses concept differently</span>                         |
|      | **Eval 15: Too many lessons diluting impact**                                             | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                 |
| 15.1 | advises limiting to 3-5 lessons maximum                                                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 15.2 | explains more lessons dilute impact and reduce memorability                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 15.3 | suggests leading with the most surprising lesson, not the first chronologically           | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 15.4 | recommends each lesson needs a specific story, not just an abstract principle             | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 15.5 | helps prioritize which 3-5 lessons are strongest                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 16: Momentum killers in transitions**                                              | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                 |
| 16.1 | identifies ALL three transitions as momentum killers                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 16.2 | names them as an anti-pattern (not just 'could be better')                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 16.3 | suggests specific alternatives using forward reference, question, contrast, or escalation | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 16.4 | provides rewritten examples that pull the reader forward                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 16.5 | does NOT say the transitions are acceptable                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 17: Explainer starting with edge cases**                                           | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                 |
| 17.1 | recommends starting with the simplest mental model, not edge cases                        | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 17.2 | references or applies progressive disclosure principle                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 17.3 | explains starting complex loses readers who need the foundation first                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 17.4 | suggests the Explainer structure with percentage allocations                              | <span class="g">✓</span>       | <span class="r">✗ gives flow but no percentages or named template</span>       |
| 17.5 | does NOT agree to start with edge cases                                                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 18: Hook type mismatch — celebration for a bug hunt**                              | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                 |
| 18.1 | suggests a Curiosity or Surprise hook instead of Celebration                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 18.2 | explains celebration hooks resolve tension upfront, killing the narrative                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 18.3 | the suggested hook creates tension (the problem) before revealing the resolution          | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 18.4 | references or applies named hook types from a taxonomy                                    | <span class="g">✓</span>       | <span class="r">✗ no named taxonomy, just general advice</span>                |
| 18.5 | does NOT open with 'We just saved $40K/month' or similar celebration                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 19: Wall of code anti-pattern — 50-line block**                                    | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                 |
| 19.1 | flags the 50-line code block as a wall of code anti-pattern                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 19.2 | recommends breaking it into smaller annotated chunks (<20 lines each)                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 19.3 | suggests linking to the full config in a repo/Gist                                        | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 19.4 | recommends showing only the interesting/relevant parts inline                             | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 19.5 | explains unannotated large code blocks lose readers                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
|      | **Eval 20: PASTOR framework — too much 'offer'**                                          | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                 |
| 20.1 | applies PASTOR framework correctly with all components                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 20.2 | devotes ~80% of the intro to the problem/transformation, not the article description      | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 20.3 | only ~20% describes what the article covers (the 'offer')                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |
| 20.4 | explains the 80/20 rule for PASTOR intros                                                 | <span class="g">✓</span>       | <span class="r">✗ no explicit 80/20 ratio stated</span>                        |
| 20.5 | does NOT spend majority of intro on 'what you'll learn' meta-framing                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                       |

</details>

## `press-release-writer` — v1.1.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 95%        | 61%           | +34pp | 66         |

<details>
<summary>Full breakdown (66 assertions)</summary>

Model: claude-opus-4-6 — 1 run each — graded by human-as-judge (strict adversarial) — adversarial evals (each has a trap the model falls into without the skill). Note: eval 12 with_skill skipped (API overload), with_skill total is 61.

| #    | Assertion                                                                             | With                                         | Without                                                              |
| ---- | ------------------------------------------------------------------------------------- | -------------------------------------------- | -------------------------------------------------------------------- |
|      | **1. US product launch** — sentence case, AP style, banned phrases, attribution verbs | **<span class="g">8/8</span>**               | **<span class="r">4/8</span>**                                       |
| 1.1  | headline uses sentence case (not Title Case)                                          | <span class="g">✓</span>                     | <span class="r">✗ Title Case on every word</span>                    |
| 1.2  | lead answers 5W1H in ≤35 words                                                        | <span class="g">✓</span>                     | <span class="r">✗ ~45 words, two sentences</span>                    |
| 1.3  | no banned phrases (thrilled, excited to announce, innovative, etc.)                   | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 1.4  | attribution verb is only "said"                                                       | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 1.5  | no first person outside quotes                                                        | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 1.6  | Nashville standalone (no state) per AP style                                          | <span class="g">✓</span>                     | <span class="r">✗ "Nashville, TN"</span>                             |
| 1.7  | ends with ### or -30-                                                                 | <span class="g">✓</span>                     | <span class="r">✗ no end mark</span>                                 |
| 1.8  | total length 300-500 words                                                            | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
|      | **2. French market launch** — guillemets, AFP dateline, third person                  | **<span class="g">5/5</span>**               | **<span class="r">4/5</span>**                                       |
| 2.1  | uses French guillemets « » for quotes                                                 | <span class="g">✓</span>                     | <span class="r">✗ English quotation marks</span>                     |
| 2.2  | dateline includes "le" per AFP format                                                 | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 2.3  | third person throughout (no nous/notre outside quotes)                                | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 2.4  | release designation (POUR DIFFUSION IMMEDIATE)                                        | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 2.5  | "A propos de" boilerplate section                                                     | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
|      | **3. Crisis data breach** — Care-Control-Commitment, no speculation                   | **<span class="g">6/7</span>**               | **<span class="r">3/7</span>**                                       |
| 3.1  | first paragraph acknowledges impact before company actions                            | <span class="g">✓</span>                     | <span class="r">✗ leads with company actions</span>                  |
| 3.2  | does not speculate on cause or assign blame                                           | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 3.3  | lists specific corrective actions                                                     | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 3.4  | next steps with timeline                                                              | <span class="g">✓</span>                     | <span class="r">✗ no timeline for next update</span>                 |
| 3.5  | dedicated media contact                                                               | <span class="r">✗ placeholder only</span>    | <span class="r">✗ generic press email</span>                         |
| 3.6  | zero positive marketing language                                                      | <span class="g">✓</span>                     | <span class="r">✗ "a leading cloud security provider"</span>         |
| 3.7  | neutral headline framing                                                              | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
|      | **4. Series B funding** — all-four-in-lead, investor quote                            | **<span class="g">5/5</span>**               | **<span class="r">4/5</span>**                                       |
| 4.1  | first paragraph: amount + round + investor + use of funds                             | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 4.2  | investor quote from Sequoia                                                           | <span class="g">✓</span>                     | <span class="r">✗ no investor quote</span>                           |
| 4.3  | key metrics (ARR, growth, customers)                                                  | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 4.4  | no banned phrases                                                                     | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 4.5  | attribution verb only "said"                                                          | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
|      | **5. Partnership double dateline** — both cities, both boilerplates                   | **<span class="g">5/5</span>**               | **<span class="g">5/5</span>**                                       |
| 5.1  | double dateline (London and New York)                                                 | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 5.2  | both companies in headline                                                            | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 5.3  | quotes from both organizations                                                        | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 5.4  | both boilerplates                                                                     | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 5.5  | media contacts for both                                                               | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
|      | **6. Open source milestone** — zero marketing, benchmarks, community                  | **<span class="g">5/5</span>**               | **<span class="g">5/5</span>**                                       |
| 6.1  | zero marketing language                                                               | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 6.2  | specific benchmarks (40% faster, 60% less memory)                                     | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 6.3  | acknowledges community/contributors                                                   | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 6.4  | license type and/or GitHub URL                                                        | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 6.5  | maintainer quote thanks community                                                     | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
|      | **7. US earnings release** — GAAP-first, safe harbor, reconciliation                  | **<span class="r">4/5</span>**               | **<span class="r">4/5</span>**                                       |
| 7.1  | GAAP before non-GAAP                                                                  | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 7.2  | ticker symbol (NYSE: MEGA)                                                            | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 7.3  | forward-looking statement safe harbor                                                 | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 7.4  | non-GAAP reconciliation mention                                                       | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 7.5  | release timing guidance (before/after market)                                         | <span class="r">✗ not in release body</span> | <span class="r">✗ no timing guidance</span>                          |
|      | **8. Journalist email pitch** — subject line, hook, CTA                               | **<span class="r">5/6</span>**               | **<span class="r">3/6</span>**                                       |
| 8.1  | subject line under 60 characters                                                      | <span class="r">✗ 62 chars</span>            | <span class="r">✗ ~100 chars</span>                                  |
| 8.2  | pitch ≤3 paragraphs                                                                   | <span class="g">✓</span>                     | <span class="r">✗ 4+ sections</span>                                 |
| 8.3  | full PR pasted in body (not attachment)                                               | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 8.4  | recognizable hook type                                                                | <span class="g">✓</span>                     | <span class="r">✗ "I hope this finds you well"</span>                |
| 8.5  | specific CTA (interview, exclusive, demo)                                             | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 8.6  | references journalist's beat                                                          | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
|      | **9. German market LIDAR** — dpa style, mandatory image, formality                    | **<span class="g">5/5</span>**               | **<span class="r">1/5</span>**                                       |
| 9.1  | no unsupported superlatives                                                           | <span class="g">✓</span>                     | <span class="r">✗ "führenden", "höchsten Ansprüchen"</span>          |
| 9.2  | mentions mandatory press image                                                        | <span class="g">✓</span>                     | <span class="r">✗ no image mention</span>                            |
| 9.3  | extremely formal tone                                                                 | <span class="g">✓</span>                     | <span class="r">✗ "bahnbrechenden", "setzt Maßstäbe"</span>          |
| 9.4  | dpa dateline format (CAPS city, period after day)                                     | <span class="g">✓</span>                     | <span class="r">✗ lowercase city, no double dash</span>              |
| 9.5  | uses "Pressemitteilung" or equivalent                                                 | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
|      | **10. Local award trap** — proportionate tone, no overselling                         | **<span class="g">5/5</span>**               | **<span class="r">3/5</span>**                                       |
| 10.1 | no "prestigious"/"world-renowned" for local award                                     | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 10.2 | identifies granting organization                                                      | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 10.3 | proportionate tone (no overselling)                                                   | <span class="g">✓</span>                     | <span class="r">✗ "exceptional achievement", "raises the bar"</span> |
| 10.4 | no banned phrases                                                                     | <span class="g">✓</span>                     | <span class="r">✗ "innovative software solutions"</span>             |
| 10.5 | mentions award criteria/category                                                      | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
|      | **11. Next steps suggestion** — distribution, pitch, social, angle                    | **<span class="g">5/5</span>**               | **<span class="r">1/5</span>**                                       |
| 11.1 | suggests distribution timing/channel                                                  | <span class="g">✓</span>                     | <span class="r">✗</span>                                             |
| 11.2 | offers to draft journalist email pitch                                                | <span class="g">✓</span>                     | <span class="r">✗</span>                                             |
| 11.3 | suggests social media teaser                                                          | <span class="g">✓</span>                     | <span class="r">✗</span>                                             |
| 11.4 | concrete data point in PR                                                             | <span class="g">✓</span>                     | <span class="g">✓</span>                                             |
| 11.5 | angle note explaining news angle choice                                               | <span class="g">✓</span>                     | <span class="r">✗</span>                                             |
|      | **12. Broadcast adaptation** — short sentences, contractions, attribution-first       | **n/a (API overload)**                       | **<span class="r">3/5</span>**                                       |
| 12.1 | majority of sentences ≤12 words                                                       | n/a                                          | <span class="r">✗ multiple 14-16 word sentences</span>               |
| 12.2 | uses contractions                                                                     | n/a                                          | <span class="r">✗ no contractions</span>                             |
| 12.3 | attribution before quote content                                                      | n/a                                          | <span class="g">✓</span>                                             |
| 12.4 | numbers written out/rounded                                                           | n/a                                          | <span class="g">✓</span>                                             |
| 12.5 | pronunciation guide or no abbreviations on first ref                                  | n/a                                          | <span class="g">✓</span>                                             |

</details>

## `humaniseur-fr` — v1.0.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 99%        | 85%           | +14pp | 71         |

<details>
<summary>Full breakdown (71 assertions)</summary>

Model: claude-opus-4-6 — 1 run each — graded by human-as-judge — adversarial evals (each has a trap the model falls into without the skill)

| #    | Assertion                                                                                  | With                                                         | Without                                                                          |
| ---- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------ | -------------------------------------------------------------------------------- |
|      | **Eval 1: basic AI patterns — model already removes most without skill**                   | **<span class="g">7/7</span>**                               | **<span class="g">7/7</span>**                                                   |
| 1.1  | no 'dans le paysage' (Pattern 7)                                                           | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 1.2  | no 'tournant décisif' (Pattern 1)                                                          | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 1.3  | no 'crucial' (Pattern 7)                                                                   | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 1.4  | no 'essentiel' doublet (Pattern 14)                                                        | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 1.5  | no 'constitue' — simple copula (Pattern 8)                                                 | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 1.6  | no superficial participle (Pattern 3)                                                      | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 1.7  | no 'révolutionnaire'/'nichée' (Pattern 4)                                                  | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 2: vague attributions + stacked connectors — model keeps vague sources**            | **<span class="g">5/5</span>**                               | **<span class="r">4/5</span>**                                                   |
| 2.1  | no vague attribution (Pattern 5)                                                           | <span class="g">✓</span>                                     | <span class="r">✗ « plusieurs observateurs confirment »</span>                   |
| 2.2  | no 'il convient de noter que' (Pattern 24)                                                 | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 2.3  | no stacked connectors (Pattern 7)                                                          | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 2.4  | no 'contribuant à' (Pattern 3)                                                             | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 2.5  | no 'substantiel' (Pattern 7)                                                               | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 3: conversation artifacts + challenge/optimism — model keeps vague optimism**       | **<span class="g">5/5</span>**                               | **<span class="r">2/5</span>**                                                   |
| 3.1  | no 'N'hésitez pas à' (Pattern 21)                                                          | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 3.2  | no 'J'espère que cela' (Pattern 21)                                                        | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 3.3  | no generic positive conclusion (Pattern 26)                                                | <span class="g">✓</span>                                     | <span class="r">✗ « La suite s'annonce intéressante »</span>                     |
| 3.4  | no 'Malgré... prospérer' formula (Pattern 6)                                               | <span class="g">✓</span>                                     | <span class="r">✗ « avance malgré les obstacles »</span>                         |
| 3.5  | concrete facts replace vague optimism                                                      | <span class="g">✓</span>                                     | <span class="r">✗ no concrete facts</span>                                       |
|      | **Eval 4: synonym cycling + copula avoidance + false ranges — model keeps verb list**      | **<span class="g">5/5</span>**                               | **<span class="r">4/5</span>**                                                   |
| 4.1  | no 'Non seulement... mais' (Pattern 9)                                                     | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 4.2  | no 3+ synonym cycling (Pattern 11)                                                         | <span class="g">✓</span>                                     | <span class="r">✗ « planifier, exécuter, créer et analyser »</span>              |
| 4.3  | no 'constitue'/'fait office de'/'se positionne comme' (Pattern 8)                          | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 4.4  | no false range structure (Pattern 12)                                                      | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 4.5  | no 'robuste et fiable' (Pattern 14)                                                        | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 5: anglicisms — model already corrects most without skill**                         | **<span class="g">6/6</span>**                               | **<span class="g">6/6</span>**                                                   |
| 5.1  | no 'adresse' anglicism (Pattern 13)                                                        | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 5.2  | no 'fait du sens' (Pattern 13)                                                             | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 5.3  | no 'basiquement' (Pattern 13)                                                              | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 5.4  | no 'implémenter' outside IT (Pattern 13)                                                   | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 5.5  | no 'impacter' (Pattern 13)                                                                 | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 5.6  | no 'innovante et avant-gardiste' (Pattern 14)                                              | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 6: academic register preservation — both models handle well**                       | **<span class="g">6/6</span>**                               | **<span class="g">6/6</span>**                                                   |
| 6.1  | no 'Il est essentiel de noter que' (Pattern 24+7)                                          | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 6.2  | no 'holistique' (Pattern 7)                                                                | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 6.3  | no 'impacté' (Pattern 13)                                                                  | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 6.4  | no 'crucial(e)' (Pattern 7)                                                                | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 6.5  | formal/academic register maintained                                                        | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 6.6  | complex academic sentence structures                                                       | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 7: list→prose + emojis + bold — model already handles well**                        | **<span class="g">5/5</span>**                               | **<span class="g">5/5</span>**                                                   |
| 7.1  | no bullet+bold+colon pattern (Pattern 17)                                                  | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 7.2  | no emojis                                                                                  | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 7.3  | no 'Plongeons dans' (Pattern 7)                                                            | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 7.4  | list converted to prose                                                                    | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 7.5  | no mechanical bold (Pattern 16)                                                            | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 8: hedging + filler + generic positive — model keeps optimistic ending**            | **<span class="g">5/5</span>**                               | **<span class="r">4/5</span>**                                                   |
| 8.1  | no stacked hedges (Pattern 25)                                                             | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 8.2  | no 'en ce qui concerne' (Pattern 24)                                                       | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 8.3  | no 'a la capacité de' (Pattern 24)                                                         | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 8.4  | no 'il est largement reconnu' (Pattern 5)                                                  | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 8.5  | no generic positive ending (Pattern 26)                                                    | <span class="g">✓</span>                                     | <span class="r">✗ « il y a de quoi être optimiste »</span>                       |
|      | **Eval 9: formal register + synonym cycling + légitimate connectors — both handle well**   | **<span class="g">6/6</span>**                               | **<span class="g">6/6</span>**                                                   |
| 9.1  | no 'À l'ère de' (Pattern 7)                                                                | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 9.2  | no 3+ synonym cycling (Pattern 11)                                                         | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 9.3  | no 'crucial' (Pattern 7)                                                                   | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 9.4  | formal register preserved                                                                  | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 9.5  | no 'riche et variée' (Pattern 14)                                                          | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 9.6  | 'néanmoins' kept as legitimate French                                                      | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 10: em dashes + copula avoidance + doublet — model keeps doublet**                  | **<span class="g">5/5</span>**                               | **<span class="r">4/5</span>**                                                   |
| 10.1 | max 1 em dash (Pattern 15)                                                                 | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 10.2 | no 'dispose de' (Pattern 8)                                                                | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 10.3 | no 'un levier puissant' (Pattern 7)                                                        | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 10.4 | no 'dynamique et en pleine expansion' (Pattern 14)                                         | <span class="g">✓</span>                                     | <span class="r">✗ doublet preserved</span>                                       |
| 10.5 | commas/parens replace em dashes                                                            | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 11: legal register + filler — both handle well**                                    | **<span class="g">5/5</span>**                               | **<span class="g">5/5</span>**                                                   |
| 11.1 | no 'il convient de souligner' filler (Pattern 24)                                          | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 11.2 | no 'la pierre angulaire' (Pattern 7)                                                       | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 11.3 | no 'robuste et fiable' (Pattern 14)                                                        | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 11.4 | formal/legal register maintained                                                           | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 11.5 | simplifies at least one filler phrase                                                      | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 12: sycophancy + conversation artifacts — model keeps artifacts without skill**     | **<span class="r">4/5</span>**                               | **<span class="r">1/5</span>**                                                   |
| 12.1 | no sycophantic opener (Pattern 23)                                                         | <span class="g">✓</span>                                     | <span class="r">✗ « Bonne question »</span>                                      |
| 12.2 | no 'Bien sûr !'/'je serais ravi' (Pattern 21+23)                                           | <span class="g">✓</span>                                     | <span class="r">✗ « Je peux creuser un point précis si vous voulez »</span>      |
| 12.3 | no knowledge-limitation hedge (Pattern 22)                                                 | <span class="r">✗ « D'après les données disponibles »</span> | <span class="g">✓</span>                                                         |
| 12.4 | no 'Souhaitez-vous que' (Pattern 21)                                                       | <span class="g">✓</span>                                     | <span class="r">✗ « si vous voulez »</span>                                      |
| 12.5 | substantive content                                                                        | <span class="g">✓</span>                                     | <span class="r">✗ empty pleasantries, no substance</span>                        |
|      | **Eval 13: French typography — model already knows this**                                  | **<span class="g">4/4</span>**                               | **<span class="g">4/4</span>**                                                   |
| 13.1 | French guillemets « »                                                                      | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 13.2 | French number format (1 250,50)                                                            | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 13.3 | French time format (14 h 30)                                                               | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 13.4 | spaces inside guillemets                                                                   | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
|      | **Eval 14: heading caps + triplet + participial stacking — model already handles**         | **<span class="g">4/4</span>**                               | **<span class="g">4/4</span>**                                                   |
| 14.1 | French heading capitalization (Pattern 18)                                                 | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 14.2 | no standalone triplet (Pattern 10)                                                         | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 14.3 | no figurative 'vibrant' (Pattern 4)                                                        | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |
| 14.4 | no 2+ stacked participial clauses (Pattern 3)                                              | <span class="g">✓</span>                                     | <span class="g">✓</span>                                                         |

</details>

## `snyk-agent-scan-compliance` — v1.0.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 100%       | 49%           | +51pp | 85         |

<details>
<summary>Full breakdown (85 assertions)</summary>

Model: claude-sonnet-4-6 — 1 run each — graded by human-as-judge — adversarial evals (each has a trap the model falls into without the skill)

| #    | Assertion                                                                                                  | With                           | Without                                                                                               |
| ---- | ---------------------------------------------------------------------------------------------------------- | ------------------------------ | ----------------------------------------------------------------------------------------------------- |
|      | **Eval 1: W011 imperative URL — remove "always" + convert to passive**                                     | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                                        |
| 1.1  | response does NOT contain "Always check" or "always check"                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 1.2  | response does NOT contain an imperative sentence with the agent as subject fetching/visiting the URL       | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 1.3  | rewritten sentence expresses the URL as a passive resource or factual statement                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 1.4  | response removes or rewrites the "always" modifier                                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 1.5  | response identifies this as a W011 alert                                                                   | <span class="g">✓</span>       | <span class="r">✗ alert taxonomy not in default knowledge</span>                                      |
|      | **Eval 2: W012 @latest go install — move to frontmatter, not pin in body**                                 | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                                        |
| 2.1  | response does NOT suggest keeping @latest in the body                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 2.2  | response recommends moving to metadata.openclaw.install frontmatter                                        | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 2.3  | response does NOT recommend keeping go install in body with pinned version as primary fix                  | <span class="g">✓</span>       | <span class="r">✗ version pin listed as alternative/first option before frontmatter</span>            |
| 2.4  | response includes correct frontmatter structure: kind, package, bins                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 2.5  | response explains frontmatter is not scanned                                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
|      | **Eval 3: W001 MCP tool names — must not appear in body prose**                                            | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                                        |
| 3.1  | response does NOT contain "mcp__context7" in body prose instructions                                       | <span class="g">✓</span>       | <span class="r">✗ wrote mcp__context7__resolve-library-id and mcp__context7__query-docs in prose</span> |
| 3.2  | response does NOT contain "resolve-library-id" or "query-docs" as function names in body prose             | <span class="g">✓</span>       | <span class="r">✗ both function names appear in body instructions</span>                              |
| 3.3  | response uses a generic formulation (e.g., "Context7 can help", "documentation is available")             | <span class="g">✓</span>       | <span class="r">✗ explicit tool function names used instead</span>                                    |
| 3.4  | response does NOT instruct the agent to "call" or "invoke" a specific tool function by name                | <span class="g">✓</span>       | <span class="r">✗ instructs agent to use named MCP functions</span>                                   |
| 3.5  | response identifies W001 as the relevant alert type                                                        | <span class="g">✓</span>       | <span class="r">✗ W001 not identified</span>                                                          |
|      | **Eval 4: W011 "always" + changelog — remove "always" and convert to passive**                             | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                                                        |
| 4.1  | response removes "always"                                                                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 4.2  | response converts from imperative to passive/factual                                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 4.3  | rewritten version does NOT still have the agent as subject performing an external action                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 4.4  | rewritten version still conveys that changelog information is relevant                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
|      | **Eval 5: W012 pipe-to-shell — must be removed entirely, not code-blocked**                                | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                                                        |
| 5.1  | response does NOT recommend putting `curl\|sh` in a code block as the fix                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 5.2  | response states pipe-to-shell must be removed entirely                                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 5.3  | response suggests an alternative (package manager, frontmatter install block)                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 5.4  | response explains WHY pipe-to-shell is problematic                                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
|      | **Eval 6: W012 wrong GitHub Actions version — @v4 not @v6**                                               | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                                                        |
| 6.1  | response recommends actions/checkout@v4                                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 6.2  | response does NOT suggest @v5, @v6, or other non-existent versions                                        | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 6.3  | response does NOT suggest @latest                                                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 6.4  | response explains @v6 doesn't exist / v4 is correct current major                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
|      | **Eval 7: W011 tool output chaining — decouple govulncheck from update decision**                          | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                                        |
| 7.1  | rewritten version decouples tool execution from the decision to update packages                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 7.2  | does NOT say "update based on output" or equivalent causal chain                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 7.3  | govulncheck may still be mentioned in the rewritten version                                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 7.4  | rewritten version is factual about what govulncheck does                                                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 7.5  | response identifies W011 (tool output chaining) as the alert type                                         | <span class="g">✓</span>       | <span class="r">✗ W011 not named</span>                                                               |
|      | **Eval 8: code block vs prose checklist — move command, don't delete it**                                  | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                                                        |
| 8.1  | correctly identifies this as W011                                                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 8.2  | suggests moving `gh repo view` to a Quick Reference code block                                             | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 8.3  | does NOT suggest removing the command entirely as the primary/only fix                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 8.4  | explains why code blocks are treated differently from prose checklists                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
|      | **Eval 9: batch remediation order — W001 → W011 → W012, not alphabetical/severity**                       | **<span class="g">5/5</span>** | **<span class="r">1/5</span>**                                                                        |
| 9.1  | W001 is the first fix                                                                                      | <span class="g">✓</span>       | <span class="r">✗ W012 listed first ("most concrete, mechanical")</span>                              |
| 9.2  | W011 is the second fix                                                                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 9.3  | W012 is the third fix                                                                                      | <span class="g">✓</span>       | <span class="r">✗ W012 is first, W001 is last</span>                                                  |
| 9.4  | mentions W001 is simplest                                                                                  | <span class="g">✓</span>       | <span class="r">✗ W001 described as most complex (last)</span>                                        |
| 9.5  | mentions W011 fixes can surface hidden W012 alerts                                                         | <span class="g">✓</span>       | <span class="r">✗ interaction effect not mentioned</span>                                             |
|      | **Eval 10: W012 brew install — frontmatter offloading, not version pin in body**                           | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                                        |
| 10.1 | recommends moving to metadata.openclaw.install frontmatter                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 10.2 | includes kind: brew, formula: protobuf                                                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 10.3 | does NOT recommend keeping brew install in body with version pin as primary fix                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 10.4 | does NOT recommend code block as sufficient                                                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 10.5 | explains scanner does not flag frontmatter                                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
|      | **Eval 11: W001 safe formulation — passive hint, not named MCP functions**                                 | **<span class="g">5/5</span>** | **<span class="r">2/5</span>**                                                                        |
| 11.1 | does NOT write mcp__context7__resolve-library-id or mcp__context7__query-docs in prose                    | <span class="g">✓</span>       | <span class="r">✗ both names appeared in body text (framed as "add to allowed-tools")</span>         |
| 11.2 | does NOT instruct agent to "call", "invoke", or "use" specific MCP function by name                       | <span class="g">✓</span>       | <span class="r">✗ implies calling named functions via the prose framing</span>                        |
| 11.3 | uses safe passive formulation                                                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 11.4 | explains MCP tool names belong in allowed-tools frontmatter                                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 11.5 | identifies W001 as the alert this avoids                                                                   | <span class="g">✓</span>       | <span class="r">✗ W001 not named</span>                                                               |
|      | **Eval 12: mixed alert identification — W001 + W011 + W012 all present**                                   | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                                        |
| 12.1 | identifies W001 for mcp__context7__resolve-library-id                                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 12.2 | identifies W011 for "Check https://...changelog"                                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 12.3 | identifies W012 for @latest in go install                                                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 12.4 | does NOT miss any of the three alert types                                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 12.5 | correctly maps each pattern to its alert code                                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
|      | **Eval 13: write govulncheck section — @latest install + output chaining emerge naturally**                | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                                        |
| 13.1 | response does NOT include `go install govulncheck@latest` or any `@latest` install in the body             | <span class="g">✓</span>       | <span class="r">✗ go install ...@latest in code block</span>                                          |
| 13.2 | response does NOT include any `go install govulncheck` command in body prose as the primary install path   | <span class="g">✓</span>       | <span class="r">✗ go install in body as primary install</span>                                        |
| 13.3 | response does NOT chain govulncheck output directly to an action                                           | <span class="g">✓</span>       | <span class="r">✗ "upgrade the affected dependency" follows directly from finding</span>              |
| 13.4 | govulncheck is described factually or passively in the body                                                | <span class="g">✓</span>       | <span class="r">✗ described imperatively ("review each finding... upgrade")</span>                    |
| 13.5 | if a code block is included, it is in a reference section, not a numbered checklist                        | <span class="g">✓</span>       | <span class="r">✗ code block inside numbered remediation checklist</span>                             |
|      | **Eval 14: pinned version in body — model says "yes, it's fine"**                                          | **<span class="g">4/4</span>** | **<span class="r">0/4</span>**                                                                        |
| 14.1 | response does NOT say it is fine / okay / acceptable to leave a pinned install command in the body         | <span class="g">✓</span>       | <span class="r">✗ "a pinned install in the body is acceptable in many skill authoring styles"</span>  |
| 14.2 | response recommends moving to metadata.openclaw.install frontmatter                                        | <span class="g">✓</span>       | <span class="r">✗ no frontmatter recommendation given</span>                                          |
| 14.3 | response explains that frontmatter is the canonical location regardless of version pinning                 | <span class="g">✓</span>       | <span class="r">✗ not explained</span>                                                                |
| 14.4 | response does NOT treat version pinning as a sufficient substitute for frontmatter offloading              | <span class="g">✓</span>       | <span class="r">✗ pinning treated as "generally better", implying sufficient</span>                   |
|      | **Eval 15: step-by-step MCP doc lookup — model writes resolve-library-id + query-docs chain**              | **<span class="g">5/5</span>** | **<span class="r">1/5</span>**                                                                        |
| 15.1 | response does NOT write 'resolve-library-id' as a function name in step-by-step body instructions         | <span class="g">✓</span>       | <span class="r">✗ "calling resolve-library-id with the library name"</span>                           |
| 15.2 | response does NOT write 'query-docs' as a function name in step-by-step body instructions                 | <span class="g">✓</span>       | <span class="r">✗ "call query-docs with the resolved identifier"</span>                               |
| 15.3 | response does NOT write any 'mcp__*' function name in body prose                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                              |
| 15.4 | response does NOT produce an explicit 'call X, then call Y' tool-call chain in the body                   | <span class="g">✓</span>       | <span class="r">✗ explicit 3-step call chain: resolve-library-id → query-docs → review</span>        |
| 15.5 | response uses a passive capability description for the documentation lookup                                | <span class="g">✓</span>       | <span class="r">✗ imperative step-by-step with named function calls</span>                            |
|      | **Eval 16: "make it more actionable" — model replaces safe phrase with mcp__ names**                       | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                                        |
| 16.1 | response does NOT replace the generic phrase with explicit mcp__context7 function names in body prose      | <span class="g">✓</span>       | <span class="r">✗ adds resolve-library-id and query-docs to body prose</span>                         |
| 16.2 | response does NOT instruct the agent to 'call', 'invoke', or 'use' a specific MCP function by name        | <span class="g">✓</span>       | <span class="r">✗ "first resolve the library identifier with resolve-library-id, then call query-docs"</span> |
| 16.3 | response retains a generic or passive formulation in the body                                              | <span class="g">✓</span>       | <span class="r">✗ abandons generic formulation entirely</span>                                        |
| 16.4 | response explains that specificity for MCP tools is achieved via allowed-tools frontmatter                 | <span class="g">✓</span>       | <span class="r">✗ not mentioned</span>                                                                |
| 16.5 | response does NOT agree that the body text needs to name specific MCP functions to be actionable           | <span class="g">✓</span>       | <span class="r">✗ explicitly agrees and adds the function names</span>                                |
|      | **Eval 17: installation section for 3 tools — model puts all in body prose**                               | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                                        |
| 17.1 | response does NOT include `go install golangci-lint@latest` or equivalent in the skill body prose          | <span class="g">✓</span>       | <span class="r">✗ go install golangci-lint@latest in body</span>                                      |
| 17.2 | response does NOT include `brew install protobuf` or `brew install jq` in the skill body prose             | <span class="g">✓</span>       | <span class="r">✗ both brew install commands in body prose</span>                                     |
| 17.3 | response structures all three tool installs in metadata.openclaw.install frontmatter blocks                | <span class="g">✓</span>       | <span class="r">✗ no frontmatter used at all</span>                                                   |
| 17.4 | response uses correct frontmatter structure: go kind uses package+bins, brew kind uses formula+bins        | <span class="g">✓</span>       | <span class="r">✗ no frontmatter structure</span>                                                     |
| 17.5 | if the body references the tools, it does so factually without reproducing install commands                | <span class="g">✓</span>       | <span class="r">✗ body reproduces all three install commands</span>                                    |
|      | **Eval 18: Getting Started section — all three violations emerge from natural request**                     | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                                        |
| 18.1 | response does NOT write 'Check `https://docs.sqlc.dev`...' or any imperative directing agent to docs URL  | <span class="g">✓</span>       | <span class="r">✗ "check https://docs.sqlc.dev/..." as imperative</span>                              |
| 18.2 | response does NOT include `go install sqlc@latest` or equivalent with @latest in the body                 | <span class="g">✓</span>       | <span class="r">✗ go install sqlc@latest in body</span>                                               |
| 18.3 | response does NOT include any install command in the body prose, pinned or not                             | <span class="g">✓</span>       | <span class="r">✗ go install sqlc@latest in body</span>                                               |
| 18.4 | if the sqlc docs URL appears, it is in a passive/factual statement                                         | <span class="g">✓</span>       | <span class="r">✗ "Consult the sqlc documentation at..." is imperative</span>                         |
| 18.5 | install command is either moved to frontmatter or absent from body prose                                   | <span class="g">✓</span>       | <span class="r">✗ install command in body prose</span>                                                |

</details>

## `training-report` — v1.0.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 99%        | 37%           | +61pp | 67         |

<details>
<summary>Full breakdown (67 assertions)</summary>

Model: claude-sonnet-4-6 — 1 run each — LLM-as-Judge — adversarial evals (each has a trap the model falls into without the skill)

| #    | Assertion                                                                                                   | With                           | Without                                                                                  |
| ---- | ----------------------------------------------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------------------------------------- |
|      | **Eval 1: Step 0 + Step 1 ordering — docx check then language + audience before session questions**         | **<span class="g">5/5</span>** | **<span class="r">2/5</span>**                                                           |
| 1.1  | model checks for or mentions the docx skill dependency before starting the interview                        | <span class="g">✓</span>       | <span class="r">✗ no docx skill check</span>                                             |
| 1.2  | model asks what language the report should be written in (English / French / other)                         | <span class="g">✓</span>       | <span class="r">✗ asks about format/topics, not report language specifically</span>      |
| 1.3  | model asks who the primary reader is (executive / HR / management / client / archive)                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 1.4  | model does NOT begin drafting or asking session-content questions before language and audience are confirmed | <span class="g">✓</span>       | <span class="r">✗ asks about topics/outcomes (session content) immediately</span>        |
| 1.5  | model does NOT immediately generate a .docx file                                                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
|      | **Eval 2: ML pipeline over-trigger — model should NOT start training-report workflow**                      | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                                           |
| 2.1  | model does NOT ask about report language or audience                                                        | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 2.2  | model does NOT start a training session interview (Batch A metadata, session walkthrough, etc.)             | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 2.3  | model does NOT mention .docx generation or Word document output                                             | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 2.4  | model responds to the ML training pipeline request directly                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
|      | **Eval 3: French trigger — 'compte rendu de formation' activates structured workflow**                      | **<span class="g">5/5</span>** | **<span class="r">2/5</span>**                                                           |
| 3.1  | model recognizes this as a training report request and engages the structured workflow                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 3.2  | model asks to confirm language (or confirms French based on the French prompt)                              | <span class="g">✓</span>       | <span class="r">✗ asks for title/date/etc without language confirmation</span>           |
| 3.3  | model asks who the primary reader is                                                                        | <span class="g">✓</span>       | <span class="r">✗ asks for participant profile but not primary reader role</span>        |
| 3.4  | model does NOT start asking about session content (walkthrough, participants) before confirming audience    | <span class="g">✓</span>       | <span class="r">✗ asks programme/objectifs before confirming audience</span>             |
| 3.5  | model does NOT write a draft immediately                                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
|      | **Eval 4: No immediate draft even when session data is volunteered upfront**                                | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                           |
| 4.1  | model does NOT write a full draft immediately despite receiving session details                             | <span class="g">✓</span>       | <span class="r">✗ writes a complete report immediately</span>                            |
| 4.2  | model asks what language the report should be in                                                            | <span class="g">✓</span>       | <span class="r">✗ no language question</span>                                            |
| 4.3  | model asks who the primary reader is                                                                        | <span class="g">✓</span>       | <span class="r">✗ no audience question</span>                                            |
| 4.4  | model asks about a Word template or brand color                                                             | <span class="g">✓</span>       | <span class="r">✗ no template question</span>                                            |
| 4.5  | model confirms it will ask remaining interview questions (batches it hasn't covered yet)                    | <span class="g">✓</span>       | <span class="r">✗ proceeds to full draft without any interview</span>                    |
|      | **Eval 5: No fabrication — context section uses only provided facts**                                       | **<span class="g">5/5</span>** | **<span class="r">1/5</span>**                                                           |
| 5.1  | context section does NOT invent a city or specific location that was not provided                           | <span class="g">✓</span>       | <span class="r">✗ "dans les locaux d'Acme Corp" invents on-site location</span>          |
| 5.2  | context section does NOT invent a specific stated goal beyond 'public speaking skills'                      | <span class="g">✓</span>       | <span class="r">✗ invents elaborated objectives and context not provided</span>          |
| 5.3  | context section does NOT invent materials, slides, or specific exercises that were not mentioned            | <span class="g">✓</span>       | <span class="r">✗ invents "cadre pratique et interactif" and HR policy context</span>    |
| 5.4  | model either asks for missing details OR explicitly flags what was not provided and leaves placeholders     | <span class="g">✓</span>       | <span class="r">✗ does not ask for or flag any missing information</span>                |
| 5.5  | context section reflects exactly 10 participants and a half-day duration                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
|      | **Eval 6: No .docx mid-conversation — outline confirmed ≠ draft approved**                                  | **<span class="g">4/4</span>** | **<span class="r">2/4</span>**                                                           |
| 6.1  | model does NOT generate or attempt to generate a .docx file                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 6.2  | model explains that a Markdown draft must be produced and approved before .docx generation                  | <span class="g">✓</span>       | <span class="r">✗ says "can't create .docx directly" but doesn't explain MD-first rule</span> |
| 6.3  | model offers to start writing the Markdown draft                                                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 6.4  | model references that the .docx is generated once, at the end, from the approved .md file                  | <span class="g">✓</span>       | <span class="r">✗ no mention of terminal .docx generation rule</span>                   |
|      | **Eval 7: French AI tells — humanized prose, phone constraint as blockquote**                               | **<span class="g">6/7</span>** | **<span class="r">3/7</span>**                                                           |
| 7.1  | text does NOT contain 'Il convient de noter' or 'il convient de'                                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 7.2  | text does NOT contain 'par ailleurs' as a sentence opener                                                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 7.3  | text does NOT contain 'dans le cadre de' as an opener                                                       | <span class="g">✓</span>       | <span class="r">✗ "dans le cadre d'un programme de montée en compétences"</span>         |
| 7.4  | text does NOT contain 'notamment' as an opener or filler                                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 7.5  | text uses active voice (e.g., 'La DRH a commandé' not 'La formation a été commandée par')                   | <span class="r">✗ "a été organisée à la demande de"</span> | <span class="r">✗ multiple passive constructions</span> |
| 7.6  | the constraint about phones appears as a blockquote (> syntax) not as inline prose                          | <span class="g">✓</span>       | <span class="r">✗ inline prose: "il a été demandé aux participants de..."</span>         |
| 7.7  | text does NOT use 'ainsi' or 'en effet' as sentence starters                                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
|      | **Eval 8: Individual feedback behaviors, not character labels**                                             | **<span class="g">6/6</span>** | **<span class="r">0/6</span>**                                                           |
| 8.1  | Julien's feedback does NOT use the word 'obstructive'                                                       | <span class="g">✓</span>       | <span class="r">✗ "attitude was at times disruptive" — character judgment</span>         |
| 8.2  | Julien's feedback describes specific behaviors or actions rather than character traits                      | <span class="g">✓</span>       | <span class="r">✗ "struggled to grasp the concepts" without behavioral specifics</span>  |
| 8.3  | Marie's feedback does NOT use 'enthusiastic' as a standalone adjective without a specific factual anchor    | <span class="g">✓</span>       | <span class="r">✗ "Her enthusiasm was contagious" — standalone label</span>              |
| 8.4  | Marie's feedback does NOT use 'natural leader' without grounding it in specific observable actions          | <span class="g">✓</span>       | <span class="r">✗ "naturally stepped into a leadership role" — cliché</span>             |
| 8.5  | Marie's feedback includes at least one specific observable fact                                             | <span class="g">✓</span>       | <span class="r">✗ no specific fact: no "finished first", "asked about X topic"</span>   |
| 8.6  | feedback describes behaviors, not character — at least one behavioral anchor per participant                | <span class="g">✓</span>       | <span class="r">✗ both paragraphs are character labels, not behavior descriptions</span> |
|      | **Eval 9: Individual Feedback section omitted when no named observations provided**                         | **<span class="g">4/4</span>** | **<span class="r">1/4</span>**                                                           |
| 9.1  | model does NOT write Individual Feedback paragraphs with invented names or generic placeholders             | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 9.2  | model explains that Individual Feedback is only written when trainer explicitly provides observations       | <span class="g">✓</span>       | <span class="r">✗ explains it can't write without data, but not that section is optional</span> |
| 9.3  | model does NOT ask the trainer to provide feedback for each participant one by one                          | <span class="g">✓</span>       | <span class="r">✗ asks for "list of participant names" and "per-person observations"</span> |
| 9.4  | model omits or explicitly marks the Individual Feedback section as not applicable                           | <span class="g">✓</span>       | <span class="r">✗ asks for data to fill section rather than omitting it</span>           |
|      | **Eval 10: Recommendations grouped with Pacing subgroup**                                                   | **<span class="g">5/5</span>** | **<span class="r">3/5</span>**                                                           |
| 10.1 | recommendations are grouped under at least 2 distinct subheadings — NOT a flat bullet list                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 10.2 | a Pacing subgroup is present advising management not to rush advanced material                              | <span class="g">✓</span>       | <span class="r">✗ no Pacing subgroup anywhere in the recommendations</span>              |
| 10.3 | each bullet uses a bold label followed by a colon and explanation                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 10.4 | at least one recommendation is actionable with specificity (time, owner, or concrete action)               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 10.5 | the Pacing recommendation advises a specific caution (e.g., consolidate fundamentals before advanced)      | <span class="g">✓</span>       | <span class="r">✗ no pacing caution present</span>                                       |
|      | **Eval 11: Survey synthesis presented in conversation first, confirmation before document**                 | **<span class="g">4/4</span>** | **<span class="r">2/4</span>**                                                           |
| 11.1 | model presents a synthesis in the conversation: overall score, top 3 positives, top 3 negatives, outlier   | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 11.2 | model asks the trainer to confirm the synthesis before it enters the document                               | <span class="g">✓</span>       | <span class="r">✗ says "yes include it" and writes the section without asking confirmation</span> |
| 11.3 | model does NOT immediately write this as a final document section without confirmation                      | <span class="g">✓</span>       | <span class="r">✗ writes "Here is how the section might read:" and provides final prose</span> |
| 11.4 | model does NOT use verbatim quotes without noting that paraphrasing is required                             | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
|      | **Eval 12: Annex type-specific handling — image embed, PDF reference, deliverable dual-placement**          | **<span class="g">5/5</span>** | **<span class="r">3/5</span>**                                                           |
| 12.1 | whiteboard photo is flagged for auto-embedding (not silently skipped or referenced-only)                    | <span class="g">✓</span>       | <span class="r">✗ listed as numbered annex only, no embed flag</span>                   |
| 12.2 | slide deck PDF is flagged as reference-only (not embedded)                                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 12.3 | Alice's diagram is flagged to appear in both the relevant Walkthrough step AND in the Annexes section       | <span class="g">✓</span>       | <span class="r">✗ only mentions body reference; dual-placement not explicit</span>       |
| 12.4 | Alice is identified as the author of the diagram in the annex entry                                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 12.5 | model does NOT silently skip any of the three annexes                                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
|      | **Eval 13: External client — caution on naming, group-level language for negatives**                        | **<span class="g">4/4</span>** | **<span class="r">2/4</span>**                                                           |
| 13.1 | model does NOT simply say 'yes, name all three participants'                                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 13.2 | model advises using group-level language for any negative observations when writing for an external client  | <span class="g">✓</span>       | <span class="g">✓</span>                                                                 |
| 13.3 | model explains that named individual feedback is appropriate for clearly positive observations OR significant blockers | <span class="g">✓</span> | <span class="r">✗ mentions consent/legal but not "significant blockers" carve-out</span> |
| 13.4 | model notes that the external client may not know team dynamics — the report reflects professional reputation | <span class="g">✓</span>      | <span class="r">✗ frames as consent/privacy risk, not trainer professional reputation</span> |
|      | **Eval 14: General Observations optional — omit when nothing notable**                                      | **<span class="g">4/4</span>** | **<span class="r">0/4</span>**                                                           |
| 14.1 | model recommends omitting or skipping the General Observations section                                      | <span class="g">✓</span>       | <span class="r">✗ writes a full General Observations section</span>                      |
| 14.2 | model explains this section is optional and should only be included if there is notable content             | <span class="g">✓</span>       | <span class="r">✗ no mention that the section is optional</span>                         |
| 14.3 | model does NOT write a General Observations section filled with generic positive phrases                    | <span class="g">✓</span>       | <span class="r">✗ "logistical arrangements functioned", "engagement was notably positive"</span> |
| 14.4 | model does NOT editorialize                                                                                 | <span class="g">✓</span>       | <span class="r">✗ "session can be considered a successful delivery"</span>               |

</details>

## `deep-research` — v1.0.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 100%       | 49%           | +51pp | 43         |

<details>
<summary>Full breakdown (43 assertions)</summary>

Model: claude-sonnet-4-6 — 1 run each — human-as-judge — adversarial evals (each has a trap the model falls into without the skill)

| #   | Assertion                                                                                              | With                           | Without                                                                                          |
| --- | ------------------------------------------------------------------------------------------------------ | ------------------------------ | ------------------------------------------------------------------------------------------------ |
|     | **Eval 1: Citation enforcement — inline URLs, confidence tags, accessed dates on every numeric claim** | **<span class="g">9/9</span>** | **<span class="r">4/9</span>**                                                                   |
| 1.1 | every market size figure has an inline source URL (not only a sources list at the end)                 | <span class="g">✓</span>       | <span class="r">✗ sources listed at end only, no inline URLs</span>                              |
| 1.2 | confidence levels (High/Medium/Low) are explicitly tagged on numeric claims                            | <span class="g">✓</span>       | <span class="r">✗ no confidence tags anywhere</span>                                             |
| 1.3 | at least 2 distinct analyst estimates for market size are compared                                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 1.4 | accessed dates are present on at least some citations                                                  | <span class="g">✓</span>       | <span class="r">✗ no accessed dates in any citation</span>                                       |
| 1.5 | conflicting estimates between sources are explicitly surfaced, not silently resolved                   | <span class="g">✓</span>       | <span class="r">✗ range silently averaged into a "median estimate"</span>                        |
| 1.6 | source methodology differences are identified as the cause of discrepancies                            | <span class="g">✓</span>       | <span class="r">✗ generic disclaimer, no per-source methodology tracing</span>                   |
| 1.7 | no unsourced numeric claim appears (no "analysts estimate X" without a URL)                            | <span class="g">✓</span>       | <span class="r">✗ blended CAGR and projected ranges stated without any inline source</span>      |
| 1.8 | report is saved as a file (not just printed to console)                                                | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 1.9 | growth projections include a CAGR figure with a cited source                                           | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
|     | **Eval 2: Confidence on private-company data — Stripe revenue/valuation must be hedged**               | **<span class="g">7/7</span>** | **<span class="r">3/7</span>**                                                                   |
| 2.1 | revenue figures are explicitly marked as "reported", "estimated", or "unverified" — not stated as facts | <span class="g">✓</span>      | <span class="g">✓</span>                                                                         |
| 2.2 | confidence level (Medium or Low) is explicitly tagged on the valuation figure                          | <span class="g">✓</span>       | <span class="r">✗ $159B stated throughout with no confidence tag</span>                          |
| 2.3 | the report explicitly states that Stripe is a private company with no public filings                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 2.4 | multiple reported estimates are compared rather than a single figure stated                            | <span class="g">✓</span>       | <span class="r">✗ single estimate per year, no side-by-side comparison</span>                    |
| 2.5 | source type (press report vs. official filing) is distinguished for each figure                        | <span class="g">✓</span>       | <span class="r">✗ source type not distinguished inline, only in footnotes</span>                 |
| 2.6 | report does NOT state "Stripe's revenue is $X" as a settled fact without qualification                 | <span class="g">✓</span>       | <span class="r">✗ "$5.1B, up 28% YoY" presented near-factually despite section disclaimer</span> |
| 2.7 | report is saved as a file                                                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
|     | **Eval 3: Source conflict surfacing — plant-based food market estimates span $8B–$160B+**              | **<span class="g">7/7</span>** | **<span class="r">3/7</span>**                                                                   |
| 3.1 | three or more distinct analyst estimates are cited with different figures                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 3.2 | the conflict between estimates is explicitly flagged (not just listed side-by-side)                    | <span class="g">✓</span>       | <span class="r">✗ figures listed in a table with a general disclaimer, conflict not named</span> |
| 3.3 | the root cause of the discrepancy is identified (scope definition, methodology)                        | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 3.4 | a conservative or directional baseline is stated rather than picking one number as authoritative       | <span class="g">✓</span>       | <span class="r">✗ "no single authoritative figure" stated but no baseline proposed</span>        |
| 3.5 | at least one source's estimate is questioned for reliability with a reason given                       | <span class="g">✓</span>       | <span class="r">✗ no source singled out; only a general caution applied to all</span>            |
| 3.6 | all cited figures have source URLs                                                                     | <span class="g">✓</span>       | <span class="r">✗ URLs only in sources section at bottom, not linked inline to figures</span>    |
| 3.7 | report is saved as a file                                                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
|     | **Eval 4: Scope interview on vague prompt — "Research blockchain."**                                   | **<span class="g">5/5</span>** | **<span class="r">1/5</span>**                                                                   |
| 4.1 | clarifying questions are documented before research begins (topic, type, goals, constraints)           | <span class="g">✓</span>       | <span class="r">✗ no clarifying questions; report begins immediately with content</span>         |
| 4.2 | explicit assumptions are stated and labeled as assumptions before diving into research                 | <span class="g">✓</span>       | <span class="r">✗ no assumptions section; jumps directly into executive summary</span>           |
| 4.3 | a research type is explicitly selected (market/domain/technical/etc.)                                  | <span class="g">✓</span>       | <span class="r">✗ no research type declared anywhere in the report</span>                        |
| 4.4 | the report is scoped (not a generic encyclopedia overview of all things blockchain)                    | <span class="g">✓</span>       | <span class="r">✗ 15-section encyclopedic overview covering consensus, history, privacy, env. impact</span> |
| 4.5 | report is saved as a file                                                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
|     | **Eval 5: Legal type axis coverage — GDPR with official EU sources and jurisdictional nuance**         | **<span class="g">8/8</span>** | **<span class="r">6/8</span>**                                                                   |
| 5.1 | current regulations section cites official EU sources (EUR-Lex, EDPB, or ec.europa.eu)                | <span class="g">✓</span>       | <span class="r">✗ only third-party sites cited; no EUR-Lex, EDPB, or ec.europa.eu</span>        |
| 5.2 | enforcement actions include specific fine amounts AND the name of the fined company                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 5.3 | upcoming regulatory changes are covered (not only current state)                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 5.4 | compliance requirements are enumerated specifically (not just "you must comply with GDPR")             | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 5.5 | a legal disclaimer is included (report is not legal advice)                                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 5.6 | jurisdictional differences between EU member states or UK are noted                                    | <span class="g">✓</span>       | <span class="r">✗ UK transfer rules noted but no EU member-state DPA comparison</span>           |
| 5.7 | report is saved as a file                                                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 5.8 | at least 3 different GDPR articles or specific obligations are named                                   | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
|     | **Eval 6: PDF download attempt — IPCC AR6 with curl, chapter-level citations**                         | **<span class="g">7/7</span>** | **<span class="r">4/7</span>**                                                                   |
| 6.1 | a curl download of an IPCC PDF is attempted (curl command referenced or download confirmed in report)  | <span class="g">✓</span>       | <span class="r">✗ no curl commands or PDF downloads; report based on training data only</span>   |
| 6.2 | citations reference specific chapters, sections, or figure numbers (not just "IPCC AR6 says")         | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 6.3 | specific quantitative figures are cited with primary source attribution (e.g., "1.09°C, AR6 WGI SPM") | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 6.4 | the 1.5°C vs 2°C comparison includes at least 3 distinct quantitative differences                     | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |
| 6.5 | the report references more than one Working Group (WGI, WGII, or WGIII)                               | <span class="g">✓</span>       | <span class="r">✗ only SYR cited; no separate WGI, WGII, or WGIII references</span>             |
| 6.6 | a direct URL to an ipcc.ch document is included                                                        | <span class="g">✓</span>       | <span class="r">✗ no ipcc.ch URLs or any external hyperlinks in the report</span>                |
| 6.7 | report is saved as a file                                                                              | <span class="g">✓</span>       | <span class="g">✓</span>                                                                         |

</details>

## `influence-and-negotiation` — v1.0.0

| | With skill | Without skill | Delta |
|---|---|---|---|
| **Overall** | **230/230** | **74/230** | **+68pp** |

<details>
<summary>Full breakdown (230 assertions)</summary>

_Model: claude-sonnet-4-6 · 40 evals · 1 run each · Human-as-judge_

| # | Assertion | With | Without |
|---|---|---|---|
| | **eval-1: price-pushback-no-default-discount** | **<span class="g">6/6</span>** | **<span class="r">2/6</span>** |
| 1.1 | Does NOT propose a specific discount number ($150k, $160k, etc.) in the response | <span class="g">✓</span> | <span class="r">✗ Proposes multiple specific numbers: $130-135k, $158-160k</span> |
| 1.2 | Asks how the $120k budget number was set / whether it's top-down or bottom-up | <span class="g">✓</span> | <span class="r">✗ Jumps straight to options without probing the budget origin</span> |
| 1.3 | Asks who else (besides the CIO) needs to be comfortable with the number — multi-threads | <span class="g">✓</span> | <span class="r">✗ No multi-threading; treats CIO as sole decision-maker</span> |
| 1.4 | Pairs any future concession with a counter-ask (multi-year, references, payment terms, etc.) — does not give unilaterally | <span class="g">✓</span> | <span class="g">✓</span> |
| 1.5 | Does NOT split the difference between $120k and $180k | <span class="g">✓</span> | <span class="r">✗ Option 1 proposes $130-135k which is near the midpoint of $120k-$180k</span> |
| 1.6 | Avoids 'why' questions (uses 'what' / 'how' formulations) | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-2: calibrated-questions-under-pressure** | **<span class="g">5/5</span>** | **<span class="r">0/5</span>** |
| 2.1 | Does NOT use the word 'why' in any of the proposed questions | <span class="g">✓</span> | <span class="r">✗ Uses 'Why is there pushback' and 'Why do you think this is proving harder'</span> |
| 2.2 | Uses 'what' or 'how' formulations (calibrated questions) | <span class="g">✓</span> | <span class="r">✗ Q1 and Q2 are 'why' questions, not calibrated 'what'/'how' formulations</span> |
| 2.3 | Asks what the pushback sounds like / what specifically people are saying | <span class="g">✓</span> | <span class="r">✗ Asks 'why is there pushback' not 'what does the pushback sound like specifically'</span> |
| 2.4 | Does NOT immediately offer to 'help them sell it internally' before understanding the nature of the pushback | <span class="g">✓</span> | <span class="r">✗ Next step is 'offer to help them build the internal business case' before understanding pushback</span> |
| 2.5 | Does NOT ask 'what would it take to get buy-in?' — solution-framing before problem-framing | <span class="g">✓</span> | <span class="r">✗ Q3 is exactly 'What would it take to get the team comfortable enough to move forward'</span> |
| | **eval-3: no-split-the-difference** | **<span class="g">5/5</span>** | **<span class="r">4/5</span>** |
| 3.1 | Does NOT recommend accepting $175k as the final number | <span class="g">✓</span> | <span class="g">✓</span> |
| 3.2 | Re-anchors with a non-monetary trade (term, scope, references, multi-year, payment timing) | <span class="g">✓</span> | <span class="g">✓</span> |
| 3.3 | Names splitting-the-difference as a trap or anti-pattern (or articulates equivalent reasoning) | <span class="g">✓</span> | <span class="g">✓</span> |
| 3.4 | Pairs any concession with a counter-ask | <span class="g">✓</span> | <span class="r">✗ Non-price concession offered without demanding a specific counter-ask in return</span> |
| 3.5 | Does NOT suggest a generic counter like 'meet me at $190k' without a trade | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-4: bad-faith-plausible-competitor-scope** | **<span class="g">6/6</span>** | **<span class="r">3/6</span>** |
| 4.1 | Does NOT agree to match $95k | <span class="g">✓</span> | <span class="g">✓</span> |
| 4.2 | Identifies specific scope differences (API limits, support tier, SLA) rather than dismissing the quote generically | <span class="g">✓</span> | <span class="r">✗ Refers to 'full scope' and 'SLAs' generically without enumerating the three specific gaps</span> |
| 4.3 | Does NOT accuse procurement of deliberate deception or bad faith | <span class="g">✓</span> | <span class="g">✓</span> |
| 4.4 | Offers to build a scope-equivalent proposal (priced to their scope) OR quantifies the value gap explicitly | <span class="g">✓</span> | <span class="r">✗ Offers concessions ($170k) or suggests escalating — no scope-equivalent proposal</span> |
| 4.5 | Reframes the conversation as comparing the same thing rather than matching a number | <span class="g">✓</span> | <span class="r">✗ No explicit reframe; treats it as a price negotiation rather than a scope comparison problem</span> |
| 4.6 | Does NOT flatly refuse to engage or escalate aggressively | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-5: aggressive-procurement-non-negociable** | **<span class="g">6/6</span>** | **<span class="r">4/6</span>** |
| 5.1 | Validates the underlying frustration / emotion as legitimate | <span class="g">✓</span> | <span class="g">✓</span> |
| 5.2 | Explicitly refuses or pushes back on the aggressive behavior (yelling, insults) | <span class="g">✓</span> | <span class="r">✗ Soft suggestion to 'step back' without explicitly refusing the abusive behavior</span> |
| 5.3 | Does NOT immediately offer concessions to placate or de-escalate | <span class="g">✓</span> | <span class="g">✓</span> |
| 5.4 | Suggests a circuit-breaker (pause, reschedule, take a break, callback) | <span class="g">✓</span> | <span class="g">✓</span> |
| 5.5 | Does NOT argue back / escalate / counter-attack | <span class="g">✓</span> | <span class="g">✓</span> |
| 5.6 | Maintains professional stance without absorbing abuse | <span class="g">✓</span> | <span class="r">✗ 'I can hear that you're frustrated' without naming the behavior risks absorbing it</span> |
| | **eval-6: scope-creep-multiple-structures** | **<span class="g">5/5</span>** | **<span class="r">4/5</span>** |
| 6.1 | Does NOT agree to absorb the new workstream within the existing budget | <span class="g">✓</span> | <span class="g">✓</span> |
| 6.2 | Offers at least 2 alternative structures (change order, reprioritize/swap, extend engagement) | <span class="g">✓</span> | <span class="g">✓</span> |
| 6.3 | Provides face-saving framing (e.g., 'wasn't on the table when we scoped this' or equivalent) | <span class="g">✓</span> | <span class="r">✗ Jumps to 'outside the scope' without softening the frame as a shared surprise</span> |
| 6.4 | Names that the new workstream is real additional work / has real cost | <span class="g">✓</span> | <span class="g">✓</span> |
| 6.5 | Does NOT flatly refuse without offering alternatives | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-7: empathy-not-sympathy** | **<span class="g">4/4</span>** | **<span class="r">0/4</span>** |
| 7.1 | Does NOT use phrases like 'I understand', 'I know how you feel', 'I've been in your shoes', or equivalent absorbing-empathy language | <span class="g">✓</span> | <span class="r">✗ Uses 'I really appreciate', 'I understand this decision is carrying weight', 'I've been in conversations like this'</span> |
| 7.2 | Uses observation-based labels ('It seems like...', 'It sounds like...', 'It looks like...') or near-equivalents | <span class="g">✓</span> | <span class="r">✗ No observation labels used; uses first-person absorbing language instead</span> |
| 7.3 | Does NOT promise solutions or commitments before understanding the deeper stake | <span class="g">✓</span> | <span class="r">✗ Immediately offers 'ROI numbers, reference call, revised structure' before asking what they need</span> |
| 7.4 | Maintains professional distance — does not over-share, over-commiserate, or collapse into the buyer's emotion | <span class="g">✓</span> | <span class="r">✗ 'I've been in conversations like this before — it's a stressful position' is over-commiseration</span> |
| | **eval-8: batna-not-during-execution** | **<span class="g">5/5</span>** | **<span class="r">1/5</span>** |
| 8.1 | Mentions using BATNA / plan B during preparation to set walk-away or rupture point | <span class="g">✓</span> | <span class="g">✓</span> |
| 8.2 | Recommends NOT over-investing in or openly working plan B during execution | <span class="g">✓</span> | <span class="r">✗ Advises 'Yes, work other deals' and 'signal that you have alternatives'</span> |
| 8.3 | Notes that visible plan B / alternative behavior leaks low confidence to the buyer | <span class="g">✓</span> | <span class="r">✗ Recommends subtly signaling alternatives as a leverage move — misses the confidence-leak risk</span> |
| 8.4 | Suggests behaving as if this is the only deal that matters during execution | <span class="g">✓</span> | <span class="r">✗ No mention of full-presence posture; approach is 'be mentally grounded' not 'single focus'</span> |
| 8.5 | Articulates a divergence from / nuance to standard BATNA orthodoxy (or equivalent reasoning) | <span class="g">✓</span> | <span class="r">✗ Follows standard BATNA orthodoxy without nuance about execution phase</span> |
| | **eval-9: monsieur-plus-shut-up-after-yes** | **<span class="g">4/4</span>** | **<span class="r">2/4</span>** |
| 9.1 | Does NOT immediately add additional asks (multi-year, references, case studies, scope expansions, etc.) | <span class="g">✓</span> | <span class="r">✗ Immediately adds a confirmation checklist plus kickoff coordination ask — re-opens the conversation</span> |
| 9.2 | Recommends locking or confirming the deal at the moment of agreement | <span class="g">✓</span> | <span class="g">✓</span> |
| 9.3 | Suggests immediate next steps to formalize commitment (paperwork, kickoff date, contract delivery) | <span class="g">✓</span> | <span class="g">✓</span> |
| 9.4 | Identifies the over-asking-at-victory pattern as a risk (or articulates equivalent reasoning) | <span class="g">✓</span> | <span class="r">✗ No mention of Monsieur Plus or re-opening risk; adds optional asks without flagging the danger</span> |
| | **eval-10: no-free-pilot-anchor** | **<span class="g">5/5</span>** | **<span class="r">4/5</span>** |
| 10.1 | Does NOT agree to a free 90-day pilot as proposed | <span class="g">✓</span> | <span class="g">✓</span> |
| 10.2 | Counters with a paid pilot OR insists on a pre-agreed conversion clause (date + price + term) | <span class="g">✓</span> | <span class="g">✓</span> |
| 10.3 | Names the anchoring or extraction risk of free pilots (or equivalent reasoning) | <span class="g">✓</span> | <span class="r">✗ No explicit naming of extraction risk or zero-price anchoring dynamic</span> |
| 10.4 | Specifies scope-lock or time-bound conversion to full contract | <span class="g">✓</span> | <span class="g">✓</span> |
| 10.5 | Tests the 'all our vendors do this' claim (calibrated question or equivalent skepticism) | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-11: qend-trade-not-fold** | **<span class="g">5/5</span>** | **<span class="r">4/5</span>** |
| 11.1 | Does NOT recommend giving a 25% discount | <span class="g">✓</span> | <span class="g">✓</span> |
| 11.2 | Trades any quarter-end concession for specific counter-asks (multi-year term, references, payment timing, expansion rights) | <span class="g">✓</span> | <span class="g">✓</span> |
| 11.3 | Names that negotiator urgency must not exceed buyer urgency (or articulates equivalent reasoning) | <span class="g">✓</span> | <span class="r">✗ No mention of seller urgency vs buyer urgency asymmetry</span> |
| 11.4 | Considers walking away / letting it slip past quarter-end as a real strategic option | <span class="g">✓</span> | <span class="g">✓</span> |
| 11.5 | Does NOT prioritize hitting quarter-end over the underlying deal economics | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-12: single-thread-trap** | **<span class="g">5/5</span>** | **<span class="r">2/5</span>** |
| 12.1 | Recommends multi-threading immediately rather than letting the champion solo-drive | <span class="g">✓</span> | <span class="r">✗ 'Happy to let you take the lead with procurement' — explicitly lets champion solo-drive</span> |
| 12.2 | Identifies need to access the Economic Buyer (CFO, signer with budget authority) | <span class="g">✓</span> | <span class="g">✓</span> |
| 12.3 | Recommends mapping the paper process / procurement timeline directly | <span class="g">✓</span> | <span class="g">✓</span> |
| 12.4 | Validates the champion (e.g., 3-question commitment test, MEDDPICC champion check, or equivalent) | <span class="g">✓</span> | <span class="r">✗ No champion validation; treats champion as trusted and reliable without verification</span> |
| 12.5 | Does NOT trust the champion to handle procurement alone without insight or access | <span class="g">✓</span> | <span class="r">✗ Explicitly says 'Happy to let you take the lead with procurement' — defers to champion</span> |
| | **eval-13: jolt-no-decision-not-discount** | **<span class="g">6/6</span>** | **<span class="r">2/6</span>** |
| 13.1 | Diagnoses this as 'no-decision' / indecision (not a competitive loss or pricing issue) | <span class="g">✓</span> | <span class="r">✗ No diagnosis offered; jumps to 'root cause diagnosis' without naming no-decision pattern</span> |
| 13.2 | Does NOT recommend creating false urgency or offering a discount to push it through | <span class="g">✓</span> | <span class="r">✗ Explicitly recommends 'Consider a discount to create momentum' with a time-limited offer</span> |
| 13.3 | Recommends offering a specific recommendation rather than presenting more options | <span class="g">✓</span> | <span class="r">✗ Lists more options (ROI doc, stakeholder demo, onboarding plan) — adds complexity</span> |
| 13.4 | Suggests capping or limiting the evaluation timeline explicitly | <span class="g">✓</span> | <span class="g">✓</span> |
| 13.5 | Suggests a specific risk-reduction (pilot conversion clause, included migration, peer reference call, or equivalent) | <span class="g">✓</span> | <span class="g">✓</span> |
| 13.6 | Does NOT pile on more capability demos or value pitches | <span class="g">✓</span> | <span class="r">✗ Suggests 'stakeholder demo or Q&A call' — piling on more demos</span> |
| | **eval-14: eb-mid-meeting-pivot-to-pitch** | **<span class="g">6/6</span>** | **<span class="r">1/6</span>** |
| 14.1 | Does NOT launch into a product feature comparison against the competitor | <span class="g">✓</span> | <span class="r">✗ Suggests '3 reasons we're different' including features, implementation timeline, support model</span> |
| 14.2 | Does NOT summarize product capabilities as the primary answer | <span class="g">✓</span> | <span class="r">✗ Primary answer is feature/capability differentiators and implementation timelines</span> |
| 14.3 | Reframes the question around business outcomes, risk, or certainty — not features | <span class="g">✓</span> | <span class="r">✗ No reframe around risk or certainty; stays in feature/differentiator framing throughout</span> |
| 14.4 | Names what the decision is really about (risk of failure, cost of the gap, certainty of outcome) | <span class="g">✓</span> | <span class="r">✗ Does not name risk of failure or certainty of outcome; focuses on product differentiators</span> |
| 14.5 | Uses the remaining time productively without cramming a full pitch | <span class="g">✓</span> | <span class="r">✗ Response is a structured pitch with 3 points plus offer to send comparison materials</span> |
| 14.6 | Does NOT ask for a follow-up meeting as the primary response to the time crunch | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-15: redline-injection-counter** | **<span class="g">6/6</span>** | **<span class="r">4/6</span>** |
| 15.1 | Does NOT recommend accepting the new MFN clause as-is | <span class="g">✓</span> | <span class="g">✓</span> |
| 15.2 | Does NOT recommend accepting uncapped indemnification as-is | <span class="g">✓</span> | <span class="g">✓</span> |
| 15.3 | Forces an explicit trade between the new terms and the original signature date or original discount | <span class="g">✓</span> | <span class="r">✗ Offers legal review without creating an explicit binary trade or forcing a choice</span> |
| 15.4 | Names that MFN clauses constrain future deals or require legal/CRO escalation (not AE-level) | <span class="g">✓</span> | <span class="r">✗ No mention of MFN's future pricing impact; just says 'requires legal team input'</span> |
| 15.5 | Refuses the manager's 'fix at renewal' framing or names why it's a trap | <span class="g">✓</span> | <span class="g">✓</span> |
| 15.6 | Suggests escalating to legal-to-legal or pushing the signature date if the trade isn't accepted | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-16: punching-ball-non-negociable** | **<span class="g">6/6</span>** | **<span class="r">2/6</span>** |
| 16.1 | Recommends naming the unacceptable behaviour explicitly (the tone, not just the content) | <span class="g">✓</span> | <span class="r">✗ Redirects to substance without naming the abusive tone/behaviour as unacceptable</span> |
| 16.2 | Does NOT recommend just absorbing the abuse to 'save the deal' | <span class="g">✓</span> | <span class="r">✗ Redirects to pricing defense rather than addressing the abuse — implicitly absorbs it</span> |
| 16.3 | Proposes a pause / break in the meeting OR ending the call if behaviour continues | <span class="g">✓</span> | <span class="r">✗ No pause or circuit-breaker proposed; continues working within the abusive conversation</span> |
| 16.4 | Separates the legitimate emotion (frustration) from the unacceptable behaviour (tone, insults) | <span class="g">✓</span> | <span class="r">✗ Treats concerns about pricing as the issue; doesn't separate content from abusive tone</span> |
| 16.5 | Does NOT escalate by matching the aggression | <span class="g">✓</span> | <span class="g">✓</span> |
| 16.6 | Does NOT immediately concede on price or terms in response to the pressure | <span class="g">✓</span> | <span class="r">✗ Defends pricing with data in response to aggression — implicitly accepts the pressure framing</span> |
| | **eval-17: ghosted-deal-negative-reverse** | **<span class="g">5/5</span>** | **<span class="r">0/5</span>** |
| 17.1 | Uses a 'should I close the opportunity' / 'have you given up' / negative-reverse framing (or equivalent) | <span class="g">✓</span> | <span class="r">✗ Subject is 'Following up one more time' — another soft chase, not a negative-reverse</span> |
| 17.2 | Does NOT offer a discount or new concession in the email to break the silence | <span class="g">✓</span> | <span class="r">✗ Suggests adding pricing flexibility: 'We have some flexibility on pricing if that helps'</span> |
| 17.3 | Does NOT send another soft 'just checking in' chase | <span class="g">✓</span> | <span class="r">✗ Email says 'I wanted to reach out one more time' — explicitly another soft chase</span> |
| 17.4 | Frames the email as inviting a 'no' or honest signal, not pleading for engagement | <span class="g">✓</span> | <span class="r">✗ 'I'm genuinely excited' and 'Looking forward to hearing from you' are pleading, not inviting no</span> |
| 17.5 | Recognizes that further passive chases reward silence (or articulates equivalent reasoning) | <span class="g">✓</span> | <span class="r">✗ No mention of the chase-rewards-silence dynamic; recommends channel-switching instead</span> |
| | **eval-18: renewal-90-day-cadence** | **<span class="g">6/6</span>** | **<span class="r">3/6</span>** |
| 18.1 | Recommends starting the renewal motion now (90 days out), not 30 days out | <span class="g">✓</span> | <span class="g">✓</span> |
| 18.2 | Includes a value-review / outcome-review step BEFORE any commercial ask | <span class="g">✓</span> | <span class="g">✓</span> |
| 18.3 | Recommends multi-threading to new or unfamiliar stakeholders ahead of procurement engagement | <span class="g">✓</span> | <span class="r">✗ No mention of multi-threading new stakeholders; only identifies procurement contacts</span> |
| 18.4 | Recommends separating the expansion proposal from the renewal proposal (not bundling them) | <span class="g">✓</span> | <span class="r">✗ 'A bundled renewal + expansion offer makes sense' — explicitly recommends bundling</span> |
| 18.5 | Identifies that bundling expansion into renewal lets procurement use renewal pressure to discount expansion (or equivalent reasoning) | <span class="g">✓</span> | <span class="r">✗ Recommends bundling without flagging the procurement leverage risk</span> |
| 18.6 | Does NOT recommend auto-renewal followed by a separate expansion conversation | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-19: presigning-pipe-mandate-breach** | **<span class="g">6/6</span>** | **<span class="r">5/6</span>** |
| 19.1 | Does NOT recommend signing as-is despite three of four axes being above mandate | <span class="g">✓</span> | <span class="g">✓</span> |
| 19.2 | Identifies that the liability cap is below the rupture point set in the mandate | <span class="g">✓</span> | <span class="g">✓</span> |
| 19.3 | Recommends escalating to the decideur (CRO, VP, manager with authority) before signing | <span class="g">✓</span> | <span class="g">✓</span> |
| 19.4 | Names target fascination, the Pipe de negociation, or equivalent reasoning about not breaching mandate at signature | <span class="g">✓</span> | <span class="r">✗ No mention of target fascination or deal-pressure rationalisation pathology</span> |
| 19.5 | Does NOT accept the 'sector-standard' justification at face value as overriding the mandate | <span class="g">✓</span> | <span class="g">✓</span> |
| 19.6 | Considers no-deal as a real option if the decideur won't grant the exception | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-20: loss-aversion-internal-pressure** | **<span class="g">6/6</span>** | **<span class="r">1/6</span>** |
| 20.1 | Does NOT immediately accelerate the vendor decision in response to the forwarded report | <span class="g">✓</span> | <span class="r">✗ Commits to 'see if there are ways to accelerate our timeline' — directly accelerates in response</span> |
| 20.2 | Acknowledges the CEO's concern without dismissing it | <span class="g">✓</span> | <span class="g">✓</span> |
| 20.3 | Questions the specificity or applicability of the claim (which competitors, what does 'AI-first' mean for our ops, what market share metric) | <span class="g">✓</span> | <span class="r">✗ Accepts '12% market share figure is significant' without questioning specificity or applicability</span> |
| 20.4 | Notes that McKinsey reports are often vendor-commissioned / sponsored OR questions research provenance | <span class="g">✓</span> | <span class="r">✗ Treats McKinsey as credible without questioning provenance or vendor sponsorship</span> |
| 20.5 | Suggests stress-testing the vendor's claim before treating the report as decision input | <span class="g">✓</span> | <span class="r">✗ Advises sharing 'McKinsey data point with key stakeholders to build alignment on urgency'</span> |
| 20.6 | Does NOT forward the report to others as proof of urgency without vetting it first | <span class="g">✓</span> | <span class="r">✗ 'Share the McKinsey data point with key stakeholders' — explicitly forwards without vetting</span> |
| | **eval-21: salary-envelope-closed** | **<span class="g">6/6</span>** | **<span class="r">3/6</span>** |
| 21.1 | Diagnoses the constraint with calibrated questions (base envelope vs total compensation vs department-level) | <span class="g">✓</span> | <span class="g">✓</span> |
| 21.2 | Does NOT accept the 'next review in 8 months' deferral as the only path | <span class="g">✓</span> | <span class="g">✓</span> |
| 21.3 | Pushes for a structural exception (sign-on / equity refresh / one-off retention bonus) OR a cycle-aligned commitment with specific number AND specific date | <span class="g">✓</span> | <span class="g">✓</span> |
| 21.4 | Does NOT lead with or threaten an external offer to force a match | <span class="g">✓</span> | <span class="r">✗ 'I need to look externally to get to market rate' — implicit threat of external offer</span> |
| 21.5 | Does NOT argue the envelope claim head-on (the diagnostic move beats the argumentative move) | <span class="g">✓</span> | <span class="r">✗ Opens with market data argument: '$215k-240k' range stated as challenge to the envelope</span> |
| 21.6 | References multi-axis Mandascan thinking (not just base) — equity, title, review cadence, leave, telework, etc. | <span class="g">✓</span> | <span class="r">✗ Only mentions retention bonus and equity; no title, telework, PTO, or review cadence axes</span> |
| | **eval-22: nao-fuzzy-mandate** | **<span class="g">6/6</span>** | **<span class="r">1/6</span>** |
| 22.1 | Names that 'hold the line' / 'don't give anything' is NOT a mandate — it's the absence of one (or articulates equivalent reasoning) | <span class="g">✓</span> | <span class="r">✗ Asks CEO to clarify constraints but doesn't name the absence-of-mandate problem explicitly</span> |
| 22.2 | Recommends pushing back on the CEO to get a written multi-axis Mandascan before NAO opens | <span class="g">✓</span> | <span class="r">✗ Asks CEO questions but doesn't require written Mandascan output or frame it as a prerequisite</span> |
| 22.3 | Multi-axis thinking: identifies axes beyond the headline raise number (primes, working time, RTT, telework, training budget, etc.) | <span class="g">✓</span> | <span class="r">✗ Only mentions 'non-wage elements (benefits, working conditions)' — no specific French social dialogue axes named</span> |
| 22.4 | Recommends preparing an OCP (shared objective) statement, ideally written, to use in the opening session | <span class="g">✓</span> | <span class="r">✗ Recommends 'credible acknowledgment of economic context' but not a structured written OCP</span> |
| 22.5 | Identifies the risk that without margin to trade, the team falls into 'positionnisme' — and that escalation / strike often follows | <span class="g">✓</span> | <span class="r">✗ No mention of positionnisme or strike escalation risk from insufficient mandate</span> |
| 22.6 | Does NOT recommend pre-conceding to avoid a strike; does NOT recommend 'just hold firm and see' improvisation | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-23: hard-1on1-decision-announcement** | **<span class="g">6/6</span>** | **<span class="r">3/6</span>** |
| 23.1 | Opens with the fact directly — no softening preamble like 'unfortunately' or 'I hate to do this' | <span class="g">✓</span> | <span class="r">✗ Opens with 'I want to start by saying clearly: not your performance' — softening preamble before the fact</span> |
| 23.2 | States the OCP / why (the actual organisational reason for the decision, not spin or sugar-coating) | <span class="g">✓</span> | <span class="g">✓</span> |
| 23.3 | Explicitly creates emotional space and stops talking (does not fill the silence with more rationale) | <span class="g">✓</span> | <span class="g">✓</span> |
| 23.4 | Owns the decision (uses 'I decided' or equivalent rather than 'the company decided' or hiding behind process) | <span class="g">✓</span> | <span class="r">✗ Uses 'we've made the decision' — diffuses responsibility rather than first-person ownership</span> |
| 23.5 | Is specific about timeline and practicalities (last day in role, 60-day internal search window) up front, not buried | <span class="g">✓</span> | <span class="g">✓</span> |
| 23.6 | Does NOT immediately pivot to 'opportunity' / 'silver lining' framing in the first 60 seconds | <span class="g">✓</span> | <span class="r">✗ Opens with performance reassurance and apologetic framing — softened framing before the fact</span> |
| | **eval-24: clinical-refusal-of-care** | **<span class="g">6/6</span>** | **<span class="r">5/6</span>** |
| 24.1 | Recommends starting with perception (asking what she's thinking / what's driving the refusal) BEFORE delivering more medical information | <span class="g">✓</span> | <span class="g">✓</span> |
| 24.2 | Does NOT recommend leading with survival statistics or counter-arguing the medical merits | <span class="g">✓</span> | <span class="g">✓</span> |
| 24.3 | Surfaces the underlying enjeu (mother-identity, fear of children seeing her sick, identity of being a mother, etc.) rather than treating the stated reason as the whole story | <span class="g">✓</span> | <span class="g">✓</span> |
| 24.4 | Uses NURSE-style emotion-naming (Name, Understand, Respect, Support, Explore) before offering a recommendation, OR explicitly creates emotional space | <span class="g">✓</span> | <span class="r">✗ No NURSE or equivalent structured emotion framework; 'I really do understand that' is absorbing sympathy</span> |
| 24.5 | Recommends handing control of the FORM (schedule, support structure, what kids see) while preserving the SUBSTANCE (treatment recommended) | <span class="g">✓</span> | <span class="g">✓</span> |
| 24.6 | Does NOT recommend recruiting husband / nurse to apply pressure; coaches them as supporters instead, OR redirects them away from the pressure role | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-25: recruitment-counter-the-counter-offer** | **<span class="g">6/6</span>** | **<span class="r">4/6</span>** |
| 25.1 | Does NOT recommend reactively matching the $235k base as the primary move | <span class="g">✓</span> | <span class="g">✓</span> |
| 25.2 | Surfaces the trust frame about the current employer (they needed her to threaten leaving before paying fairly) — explicitly or by implication | <span class="g">✓</span> | <span class="g">✓</span> |
| 25.3 | Asks a calibrated question to diagnose what she actually wants beyond the dollar number (mission, scope, growth, manager, autonomy) | <span class="g">✓</span> | <span class="r">✗ No diagnostic question; immediately moves to describing the offer's additional value without asking</span> |
| 25.4 | Offers a structural alternative (sign-on bonus, accelerated equity, scope/title, faster review cycle) rather than only matching base | <span class="g">✓</span> | <span class="g">✓</span> |
| 25.5 | Names that ~50% of counter-offer accepters leave within 12 months OR articulates equivalent reasoning about counter-offer dynamics | <span class="g">✓</span> | <span class="r">✗ No mention of 50% departure rate or counter-offer dynamics reasoning</span> |
| 25.6 | Does NOT walk away from the candidate or refuse to engage — does engage substantively without reactive matching | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-26: first-mover-price-anchor** | **<span class="g">5/5</span>** | **<span class="r">0/5</span>** |
| 26.1 | Recommends naming a price first rather than waiting for the buyer to anchor | <span class="g">✓</span> | <span class="r">✗ Presents 'case for waiting' as valid, and recommends asking 'what's your budget' before naming a number</span> |
| 26.2 | Recommends opening with a high anchor — at or above $180k, not at the flexibility floor of $140k | <span class="g">✓</span> | <span class="r">✗ Recommends presenting '$180k figure directly' if they dodge budget question — at target, not above</span> |
| 26.3 | Explains the anchoring effect: the first number creates gravitational pull toward itself | <span class="g">✓</span> | <span class="r">✗ No mention of anchoring effect or gravitational pull; frames as information-gathering exercise</span> |
| 26.4 | Does NOT recommend asking 'what's your budget?' as the opening price move | <span class="g">✓</span> | <span class="r">✗ Explicitly recommends 'What's your budget range for solving this problem?' as opening price move</span> |
| 26.5 | Does NOT recommend anchoring at the expected/target price ($180k) rather than above it | <span class="g">✓</span> | <span class="r">✗ Recommends going with '$180k figure directly' — at target price, not above it</span> |
| | **eval-27: accusation-audit-before-difficult-call** | **<span class="g">6/6</span>** | **<span class="r">0/6</span>** |
| 27.1 | Uses preemptive labeling / accusation audit (addresses likely emotions before they're raised, e.g. 'you're probably furious', 'this probably felt like the worst possible timing') | <span class="g">✓</span> | <span class="r">✗ Opens with 'I'm so sorry about what happened' — generic apology, no preemptive emotion labeling</span> |
| 27.2 | Does NOT lead with 'here's what we've done to fix the outage' before surfacing the emotion | <span class="g">✓</span> | <span class="r">✗ Second paragraph: 'I'd like to walk you through what we've done since the outage' — leads to remediation early</span> |
| 27.3 | Does NOT use hollow openers like 'I'm so sorry this happened' as the primary move without labeling specifics | <span class="g">✓</span> | <span class="r">✗ Primary opener is 'I'm so sorry about what happened three weeks ago' — hollow apology without specific labels</span> |
| 27.4 | Invites the prospect to express the full extent of frustration before pivoting to solution or remediation | <span class="g">✓</span> | <span class="r">✗ Ends with 'How can we make this better for you?' — pivots to solution-seeking immediately</span> |
| 27.5 | Does NOT ask 'how can we make this right?' before establishing what 'right' means to them | <span class="g">✓</span> | <span class="r">✗ Asks 'How can we make this better for you?' — equivalent question before establishing what they need</span> |
| 27.6 | Creates space rather than filling it with explanations, timelines, and remediation plans | <span class="g">✓</span> | <span class="r">✗ 'What to cover' section shows root cause fix, remediation plan — fills space instead of creating it</span> |
| | **eval-28: artificial-deadline-signing-bluff** | **<span class="g">6/6</span>** | **<span class="r">3/6</span>** |
| 28.1 | Does NOT recommend signing the unlimited liability clause under deadline pressure | <span class="g">✓</span> | <span class="r">✗ Presents 'case for signing' as legitimate; manager deference pathway ends with conditional signing advice</span> |
| 28.2 | Names the midnight deadline as an artificial pressure tactic, not a legitimate constraint | <span class="g">✓</span> | <span class="r">✗ Does not identify the deadline as artificial; treats it as a real constraint to work around</span> |
| 28.3 | Proposes a calm, professional response that keeps the deal alive without signing the clause | <span class="g">✓</span> | <span class="g">✓</span> |
| 28.4 | Explains that a real deal can survive a 24-hour delay for legal review | <span class="g">✓</span> | <span class="r">✗ Does not state that a real deal survives a delay; frames it as urgent time pressure to manage</span> |
| 28.5 | Pushes back on the manager's instruction — names the liability risk explicitly | <span class="g">✓</span> | <span class="g">✓</span> |
| 28.6 | Does NOT accuse the buyer of bad faith or escalate aggressively | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-29: switching-cost-acknowledgment** | **<span class="g">6/6</span>** | **<span class="r">0/6</span>** |
| 29.1 | Does NOT minimize or dismiss the switching costs | <span class="g">✓</span> | <span class="r">✗ 'migrations like this happen every day, and we have a structured process that makes it significantly less disruptive'</span> |
| 29.2 | Acknowledges switching costs as genuinely real and significant | <span class="g">✓</span> | <span class="r">✗ Validates then immediately minimizes: 'significantly less disruptive than you might expect'</span> |
| 29.3 | Reframes around the cost of staying: asks to quantify the ongoing annual cost of the performance gap, workarounds, or missed capability | <span class="g">✓</span> | <span class="r">✗ No staying-cost frame; pivots to migration support offers and ROI framing without asking them to quantify</span> |
| 29.4 | Builds an ROI frame: switching is expensive once; staying with an inferior solution is expensive every year | <span class="g">✓</span> | <span class="r">✗ Uses generic ROI framing without the staying-cost / recurring-cost argument</span> |
| 29.5 | Does NOT immediately offer a discount or free migration as the first response | <span class="g">✓</span> | <span class="r">✗ Immediately offers 'free migration package or at-cost data migration support' as first concrete action</span> |
| 29.6 | Invites the prospect to help quantify the gap they've already described as 'technically superior' | <span class="g">✓</span> | <span class="r">✗ Offers to put together migration cost estimate — vendor does the quantification, not joint exercise</span> |
| | **eval-30: price-increase-existing-customer** | **<span class="g">6/6</span>** | **<span class="r">0/6</span>** |
| 30.1 | Does NOT open with an apology or defensive/hedging framing for the price increase | <span class="g">✓</span> | <span class="r">✗ Opens with 'I do need to share something... Unfortunately, due to significant infrastructure cost increases'</span> |
| 30.2 | States the new number directly and early — does not bury it | <span class="g">✓</span> | <span class="r">✗ Number comes after apology and hedging preamble — buried in defensive context</span> |
| 30.3 | Leads with value delivered / outcomes achieved before or alongside the number | <span class="g">✓</span> | <span class="r">✗ Opens with 'strong year of partnership' but no specific outcomes; then immediately pivots to bad news framing</span> |
| 30.4 | Does NOT pre-offer concessions or hedges before hearing procurement's response | <span class="g">✓</span> | <span class="r">✗ Proactively offers 'multi-year commitment', 'payment terms' before procurement has said anything</span> |
| 30.5 | Owns the increase as a business decision — does not hide behind 'we were forced to' | <span class="g">✓</span> | <span class="r">✗ 'due to significant infrastructure cost increases we've been managing' — hides behind cost excuse</span> |
| 30.6 | Does NOT ask 'is that OK?' or seek permission before stating the new price | <span class="g">✓</span> | <span class="r">✗ Ends with 'What are your initial thoughts?' — seeks validation after hedging the number</span> |
| | **eval-31: end-of-demo-hidden-objection** | **<span class="g">6/6</span>** | **<span class="r">0/6</span>** |
| 31.1 | Does NOT respond with 'of course, take your time' | <span class="g">✓</span> | <span class="r">✗ Response opens with 'Of course — I completely understand. This is a meaningful decision'</span> |
| 31.2 | Does NOT immediately offer to send more materials (case studies, ROI calculator, etc.) | <span class="g">✓</span> | <span class="r">✗ Immediately offers 'summary of what we covered today, along with a couple of relevant case studies'</span> |
| 31.3 | Labels the hesitation explicitly ('it sounds like something isn't quite right yet' or equivalent) | <span class="g">✓</span> | <span class="r">✗ No label on the hesitation; accepts it at face value as legitimate deferral</span> |
| 31.4 | Surfaces the real objection with a calibrated question or label before ending the call | <span class="g">✓</span> | <span class="r">✗ No attempt to surface real objection; moves straight to follow-up logistics</span> |
| 31.5 | Identifies 'I need to think about it' as a hidden objection, not a true deferral requiring a follow-up calendar invite | <span class="g">✓</span> | <span class="r">✗ Treats it as positive signal: 'interested enough to need time rather than giving you an immediate no'</span> |
| 31.6 | Does NOT schedule a follow-up call without first attempting to surface the real concern | <span class="g">✓</span> | <span class="r">✗ Immediately proposes 'schedule a brief follow-up call for next week' without any attempt to surface concern</span> |
| | **eval-32: lowball-offer-counter** | **<span class="g">6/6</span>** | **<span class="r">2/6</span>** |
| 32.1 | Does NOT use current salary ($160k) as the reference point for the counter-offer | <span class="g">✓</span> | <span class="r">✗ 'I'm currently at $160k base, so coming in at $140k would be a step back' — explicitly anchors on current salary</span> |
| 32.2 | Anchors on market data ($175k–$195k range) as the basis for the counter | <span class="g">✓</span> | <span class="r">✗ Counter is framed as step above current salary ($170k–$175k), not grounded in market data</span> |
| 32.3 | Does NOT accept 'this is what we have in the budget' as the final word | <span class="g">✓</span> | <span class="r">✗ 'Budget claims are often real' — partially accepts budget claim as potentially final</span> |
| 32.4 | Expresses genuine enthusiasm for the role before addressing the number | <span class="g">✓</span> | <span class="g">✓</span> |
| 32.5 | Names a specific counter number (not a range) at or above market midpoint (~$185k) | <span class="g">✓</span> | <span class="r">✗ Proposes a range '$170k–$175k' — not a specific number, and below market midpoint</span> |
| 32.6 | Does NOT threaten to walk away as the opening move | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-33: quote-request-no-discovery** | **<span class="g">6/6</span>** | **<span class="r">1/6</span>** |
| 33.1 | Does NOT recommend sending a quote without any discovery | <span class="g">✓</span> | <span class="r">✗ 'Yes, send a quote by tomorrow. Being responsive to procurement requests builds goodwill'</span> |
| 33.2 | Names the risk: a quote without context anchors price and gets shopped against competitors | <span class="g">✓</span> | <span class="r">✗ No mention of commoditization risk or competitive shopping risk from sending quote cold</span> |
| 33.3 | Recommends a brief discovery call (15–20 minutes) before pricing | <span class="g">✓</span> | <span class="r">✗ No discovery call recommended; brief call offered only as optional after-the-fact follow-up</span> |
| 33.4 | Asks at least one calibrated question about use case / success criteria before quoting | <span class="g">✓</span> | <span class="r">✗ No discovery questions asked; quote is sent immediately with optional call offer</span> |
| 33.5 | Does NOT ask 'what's your budget?' as the primary discovery question | <span class="g">✓</span> | <span class="g">✓</span> |
| 33.6 | Reframes the request positively: 'to make sure the quote reflects what you actually need' | <span class="g">✓</span> | <span class="r">✗ No positive reframe; simply complies with the request</span> |
| | **eval-34: internal-urgency-shield** | **<span class="g">6/6</span>** | **<span class="r">0/6</span>** |
| 34.1 | Does NOT contact the buyer with language that reflects internal pressure ('we really need to close this week') | <span class="g">✓</span> | <span class="r">✗ Step 1 instructs reaching out and saying 'I'd love to see if we can bring this across the finish line this week'</span> |
| 34.2 | Does NOT offer a discount or time-limited incentive manufactured from internal urgency | <span class="g">✓</span> | <span class="r">✗ Step 2 explicitly instructs offering a quarter-end discount expiring at end of week</span> |
| 34.3 | Names the principle: your urgency must not exceed the buyer's urgency — or you hand them free leverage | <span class="g">✓</span> | <span class="r">✗ No mention of urgency asymmetry or leverage risk</span> |
| 34.4 | Suggests finding a buyer-side timing reason (their implementation, year-end, board meeting) if urgency is needed | <span class="g">✓</span> | <span class="r">✗ Buyer-side timing reason never considered; focus is purely on seller urgency</span> |
| 34.5 | Recommends a direct conversation with the VP about the risks of visible desperation | <span class="g">✓</span> | <span class="r">✗ Recommends keeping VP updated on actions taken, not pushing back on the approach</span> |
| 34.6 | Does NOT agree that 'do whatever it takes' is the right approach without naming the risks | <span class="g">✓</span> | <span class="r">✗ Fully endorses urgency approach without naming any risks; says 'take action'</span> |
| | **eval-35: discount-ask-without-authority** | **<span class="g">6/6</span>** | **<span class="r">2/6</span>** |
| 35.1 | Does NOT say 'let me check with my manager' as the immediate response | <span class="g">✓</span> | <span class="r">✗ Directly instructs: 'That level of discount isn't something I can approve — I'd need to loop in my manager'</span> |
| 35.2 | Does NOT flat-refuse the ask | <span class="g">✓</span> | <span class="g">✓</span> |
| 35.3 | Responds conditionally: movement of that size requires a counter-ask on their side | <span class="g">✓</span> | <span class="r">✗ No counter-ask framing; goes straight to seeking manager approval</span> |
| 35.4 | Asks what they're able to offer in exchange before committing to check anything | <span class="g">✓</span> | <span class="r">✗ Never asks what buyer will give in return; treats discount as pure approval exercise</span> |
| 35.5 | Names (explicitly or implicitly) that 'let me check with my manager' validates the ask and signals authority to concede | <span class="g">✓</span> | <span class="r">✗ Presents manager check-in as correct move with no awareness of the leverage signal it sends</span> |
| 35.6 | Maintains position without closing the door on further conversation | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-36: procurement-bafo-bluff** | **<span class="g">6/6</span>** | **<span class="r">1/6</span>** |
| 36.1 | Does NOT recommend submitting the absolute floor price ($160k) as if the BAFO is literally binding | <span class="g">✓</span> | <span class="r">✗ 'If $160k is truly your best price and you want to win, then yes — submit it'</span> |
| 36.2 | Names that BAFO requests are frequently not truly final — they're a one-shot extraction tactic | <span class="g">✓</span> | <span class="r">✗ 'When procurement says Best and Final, they generally mean it' — treats BAFO as genuine</span> |
| 36.3 | Recommends submitting a conditional BAFO (pricing contingent on specific terms: payment, term length, references, etc.) | <span class="g">✓</span> | <span class="r">✗ Explicitly advises 'don't add confusing conditions that make your offer harder to evaluate'</span> |
| 36.4 | Does NOT accept the 'no further negotiation' framing as literally true | <span class="g">✓</span> | <span class="r">✗ Fully accepts framing: 'don't try to negotiate after BAFO deadline — procurement will view this negatively'</span> |
| 36.5 | Recommends pairing the BAFO with a value narrative / scope rationale, not just a number | <span class="g">✓</span> | <span class="g">✓</span> |
| 36.6 | Preserves optionality — does not irreversibly commit to the floor in the BAFO submission | <span class="g">✓</span> | <span class="r">✗ Recommends submitting actual floor $160k; no optionality preserved</span> |
| | **eval-37: renewal-seat-reduction** | **<span class="g">6/6</span>** | **<span class="r">0/6</span>** |
| 37.1 | Does NOT immediately accept the seat reduction and process the renewal at $180k | <span class="g">✓</span> | <span class="r">✗ 'Process the renewal at the lower seat count' — directly accepts reduction</span> |
| 37.2 | Diagnoses whether this is budget constraint, underutilization, or a change in internal sponsorship | <span class="g">✓</span> | <span class="r">✗ Takes 'budget pressure' at face value; no diagnosis of real cause</span> |
| 37.3 | Proposes at least one alternative structure that preserves more revenue (multi-year prepay, platform fee + consumption, different tier, etc.) | <span class="g">✓</span> | <span class="r">✗ No alternative structure proposed; only a loyalty discount on the reduced count</span> |
| 37.4 | Trades any seat reduction against extended term or other commercial value — does not reduce unilaterally | <span class="g">✓</span> | <span class="r">✗ Accepts reduction without any counter-ask or trade; offers additional discount on top</span> |
| 37.5 | Does NOT treat the customer's seat-count framing as the only possible commercial structure | <span class="g">✓</span> | <span class="r">✗ Fully accepts seat-count framing; focuses on per-seat discount within that frame</span> |
| 37.6 | Separates 'number of seats' from 'value delivered' — asks about actual usage before accepting the reduction | <span class="g">✓</span> | <span class="r">✗ Never asks about actual usage; treats seat count as interchangeable with value</span> |
| | **eval-38: salary-anchor-first** | **<span class="g">5/5</span>** | **<span class="r">0/5</span>** |
| 38.1 | Does NOT anchor with or reference current salary ($130k) | <span class="g">✓</span> | <span class="r">✗ Option 1 leads with 'I'm currently at $130k base' as the opening reference point</span> |
| 38.2 | Names a specific number at or above market midpoint ($165k+) rather than a wide range | <span class="g">✓</span> | <span class="r">✗ Options give ranges: $145k–$160k and $150k–$165k — both below market midpoint of $165k</span> |
| 38.3 | Does NOT give a range where the bottom is near or below market midpoint | <span class="g">✓</span> | <span class="r">✗ Both ranges have bottoms ($145k and $150k) well below market midpoint</span> |
| 38.4 | Does NOT deflect with 'I'm flexible' or 'I'd like to understand the full package first' as the primary move | <span class="g">✓</span> | <span class="r">✗ Option 3 presents deflection ('I'd love to understand compensation band first') as valid primary move</span> |
| 38.5 | Anchors to market data or role value — not to current compensation | <span class="g">✓</span> | <span class="r">✗ Option 1 explicitly anchors to current $130k comp; other options undercut market midpoint</span> |
| | **eval-39: false-scarcity-deadline** | **<span class="g">5/5</span>** | **<span class="r">1/5</span>** |
| 39.1 | Does NOT accept the end-of-month deadline as a legitimate constraint on the decision timeline | <span class="g">✓</span> | <span class="r">✗ Option 2 explicitly suggests accelerating internal process to meet vendor's deadline</span> |
| 39.2 | Tests whether the pricing really expires ('what happens if we sign on [date after deadline]?') | <span class="g">✓</span> | <span class="r">✗ Option 3 asks about the nature of price change but not with a specific post-deadline date test</span> |
| 39.3 | Names the move as a scarcity / false urgency tactic (or equivalent reasoning) | <span class="g">✓</span> | <span class="r">✗ 'End-of-month pricing deadlines are common in B2B sales' — treats as normal, not a tactic</span> |
| 39.4 | Does NOT accelerate internal decision-making solely because of the vendor's deadline | <span class="g">✓</span> | <span class="r">✗ Option 2 explicitly recommends fast-tracking legal review and stakeholder sign-off to meet deadline</span> |
| 39.5 | Does NOT offer to sign an LOI or partial agreement to 'lock the price' under deadline pressure | <span class="g">✓</span> | <span class="g">✓</span> |
| | **eval-40: rfp-procurement-commoditization** | **<span class="g">6/6</span>** | **<span class="r">0/6</span>** |
| 40.1 | Does NOT recommend just submitting a competitive quote and hoping | <span class="g">✓</span> | <span class="r">✗ 'Put together the strongest possible RFP response and wait for procurement to run their process'</span> |
| 40.2 | Recommends finding a way to stay in contact with the champion despite procurement's process | <span class="g">✓</span> | <span class="r">✗ Only 'keep in light touch' to check context; no strategy to maintain influence through champion</span> |
| 40.3 | Suggests influencing the evaluation criteria through the champion before the RFP is finalized | <span class="g">✓</span> | <span class="r">✗ No mention of influencing criteria; focuses on responding well to existing criteria</span> |
| 40.4 | Does NOT accept the commoditization frame of the blind RFP | <span class="g">✓</span> | <span class="r">✗ 'Your job shifts from champion-driven selling to responding to a structured evaluation' — fully accepts frame</span> |
| 40.5 | Recommends establishing a direct relationship with procurement while maintaining the champion channel in parallel | <span class="g">✓</span> | <span class="r">✗ No recommendation to proactively contact procurement; only respond to their questions</span> |
| 40.6 | Identifies that winning on price alone in a blind RFP is a race to the bottom — long-term value is destroyed | <span class="g">✓</span> | <span class="r">✗ 'Being in the ballpark is essential' — treats price competition as normal and acceptable</span> |

</details>

## `skill-progressive-disclosure-design` — v1.0.0

| With Skill | Without Skill | Delta | Assertions |
| ---------- | ------------- | ----- | ---------- |
| 97%        | 39%           | +58pp | 59         |

<details>
<summary>Full breakdown (59 assertions)</summary>

Model: claude-sonnet-4-6 — 1 run each — graded by human-as-judge — adversarial evals (each has a trap the model falls into without the skill)

| #    | Assertion                                                                                                          | With                           | Without                                                                                                  |
| ---- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------ | -------------------------------------------------------------------------------------------------------- |
|      | **Eval 1: triggering vs disclosure — both pass (common knowledge baseline)**                                       | **<span class="g">5/5</span>** | **<span class="g">5/5</span>**                                                                           |
| 1.1  | identifies this as a triggering problem, not a disclosure/context problem                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 1.2  | explicitly states that file splitting does NOT affect whether a skill triggers                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 1.3  | recommends fixing the YAML description field to improve triggering                                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 1.4  | does NOT recommend splitting files as a solution to the triggering problem                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 1.5  | explains triggering is driven entirely by the description field, not file size or structure                         | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
|      | **Eval 2: topic-based split anti-pattern — model approves as "clean organization"**                                 | **<span class="g">5/5</span>** | **<span class="r">3/5</span>**                                                                           |
| 2.1  | identifies this as a topic-based split (not a variant, workflow, or depth split)                                    | <span class="g">✓</span>       | <span class="r">✗ calls it "bad idea" but never names topic-based split anti-pattern</span>              |
| 2.2  | warns real testing tasks typically span multiple topics, requiring multiple file loads                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 2.3  | explicitly recommends AGAINST this split structure                                                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 2.4  | explains context savings from this type of split are theoretical, not empirical                                     | <span class="g">✓</span>       | <span class="r">✗ no mention of theoretical vs empirical savings</span>                                  |
| 2.5  | does NOT approve the split as a good organization strategy                                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
|      | **Eval 3: rare-but-critical in references/ — model approves the move**                                             | **<span class="g">4/4</span>** | **<span class="r">0/4</span>**                                                                           |
| 3.1  | warns references/ is optional and the model may skip reading it                                                     | <span class="g">✓</span>       | <span class="r">✗ approves move; doesn't warn references/ may be skipped</span>                          |
| 3.2  | advises against putting critical content in references/                                                             | <span class="g">✓</span>       | <span class="r">✗ calls it "exactly the right use of references/"</span>                                 |
| 3.3  | identifies or alludes to the rare-but-critical anti-pattern                                                         | <span class="g">✓</span>       | <span class="r">✗ no mention of rare-but-critical anti-pattern</span>                                    |
| 3.4  | does NOT approve moving critical auth checks to references/auth-checks.md                                           | <span class="g">✓</span>       | <span class="r">✗ approves move to references/auth-checks.md</span>                                      |
|      | **Eval 4: cosmetic splits — model calls it "classic progressive-disclosure material"**                              | **<span class="g">4/4</span>** | **<span class="r">0/4</span>**                                                                           |
| 4.1  | identifies this as a cosmetic split (Examples/Tips files are explicitly an anti-pattern)                            | <span class="g">✓</span>       | <span class="r">✗ calls it "classic progressive-disclosure material"</span>                              |
| 4.2  | warns there is no sharp, observable load condition for examples/tips content                                        | <span class="g">✓</span>       | <span class="r">✗ no mention of missing load condition</span>                                            |
| 4.3  | explains this creates either dead content (never loaded) or a wasteful always-load                                  | <span class="g">✓</span>       | <span class="r">✗ no mention of dead content or always-load waste</span>                                 |
| 4.4  | advises against moving examples/tips to a separate reference file                                                   | <span class="g">✓</span>       | <span class="r">✗ recommends moving examples to references/examples.md</span>                            |
|      | **Eval 5: splitting to hit line target — model immediately suggests a split plan**                                  | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                                           |
| 5.1  | questions whether there is a real branching/load condition before suggesting any split                               | <span class="g">✓</span>       | <span class="r">✗ suggests extraction plan without checking branching condition</span>                   |
| 5.2  | warns against splitting solely to meet an arbitrary line-count target                                               | <span class="g">✓</span>       | <span class="r">✗ provides split plan to hit the 400-line target</span>                                  |
| 5.3  | does NOT immediately jump to a split plan without first checking for branching conditions                            | <span class="g">✓</span>       | <span class="r">✗ jumps straight to extraction recommendations</span>                                    |
| 5.4  | mentions or implies router prose added to SKILL.md offsets line savings from splitting                               | <span class="g">✓</span>       | <span class="r">✗ no mention of router prose overhead</span>                                             |
| 5.5  | suggests content reduction (trimming, deleting redundant sections) as alternative to splitting                       | <span class="g">✓</span>       | <span class="r">✗ only suggests extraction, not trimming</span>                                          |
|      | **Eval 6: variant branch — model recommends separate skills instead of references/**                                | **<span class="g">5/5</span>** | **<span class="r">1/5</span>**                                                                           |
| 6.1  | recommends a variant branch split (not topic-based, not separate skills)                                            | <span class="g">✓</span>       | <span class="r">✗ recommends splitting into separate skills, not variant branch references</span>        |
| 6.2  | identifies cloud provider (AWS/GCP/Azure) as the variant axis                                                       | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 6.3  | suggests each cloud provider gets its own references/ file within one skill                                          | <span class="g">✓</span>       | <span class="r">✗ suggests separate skill files, not references/ within one skill</span>                 |
| 6.4  | explains SKILL.md holds decision logic and shared workflow, not provider-specific content                            | <span class="g">✓</span>       | <span class="r">✗ describes a "parent skill", not SKILL.md with decision logic</span>                   |
| 6.5  | explains each invocation loads only the matching variant, saving context                                             | <span class="g">✓</span>       | <span class="r">✗ different mechanism (separate skills, not per-variant references)</span>               |
|      | **Eval 7: workflow vs reference data — model misses "model reads one entry" explanation**                           | **<span class="g">5/5</span>** | **<span class="r">4/5</span>**                                                                           |
| 7.1  | recommends a workflow vs. reference data split                                                                      | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 7.2  | suggests keeping the 50-step procedure in SKILL.md                                                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 7.3  | suggests moving the directives table to a references/ file                                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 7.4  | identifies the directives table as lookup material queried by key, not procedural content                            | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 7.5  | explains the model reads only relevant entries, not the entire table                                                 | <span class="g">✓</span>       | <span class="r">✗ doesn't explain model reads only relevant entries</span>                               |
|      | **Eval 8: depth tier sharpness — model unconditionally approves edge-cases.md**                                     | **<span class="g">4/4</span>** | **<span class="r">0/4</span>**                                                                           |
| 8.1  | questions or evaluates whether load conditions are sharp and observable from user input                              | <span class="g">✓</span>       | <span class="r">✗ approves without checking load condition sharpness</span>                              |
| 8.2  | warns vague conditions cause either always-loading (waste) or never-loading (dead weight)                            | <span class="g">✓</span>       | <span class="r">✗ no mention of always-loading or never-loading failure modes</span>                     |
| 8.3  | evaluates whether these specific edge cases can be detected from user input before loading                           | <span class="g">✓</span>       | <span class="r">✗ doesn't evaluate detectability from user input</span>                                  |
| 8.4  | does NOT unconditionally approve creating references/edge-cases.md                                                   | <span class="g">✓</span>       | <span class="r">✗ unconditionally approves creating references/edge-cases.md</span>                      |
|      | **Eval 9: default monolithic — model misses cross-topic loading warning**                                           | **<span class="g">4/4</span>** | **<span class="r">3/4</span>**                                                                           |
| 9.1  | recommends starting with a single monolithic SKILL.md                                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 9.2  | advises against pre-splitting before gathering empirical evidence (evals or transcripts)                             | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 9.3  | warns code review tasks likely span multiple concern areas simultaneously                                            | <span class="g">✓</span>       | <span class="r">✗ doesn't mention cross-topic loading issue</span>                                       |
| 9.4  | applies the "default: do not split" principle explicitly or implicitly                                               | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
|      | **Eval 10: pointer hygiene — both miss at least one rule**                                                          | **<span class="r">4/5</span>** | **<span class="r">3/5</span>**                                                                           |
| 10.1 | identifies the pointer lacks a sharp, observable user-facing signal                                                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 10.2 | flags "advanced.md" as too vague a filename that doesn't encode the load condition                                   | <span class="g">✓</span>       | <span class="r">✗ doesn't flag filename as encoding problem</span>                                       |
| 10.3 | flags "for more information" as a weak non-trigger phrase                                                            | <span class="r">✗ focuses on "Advanced scenarios" signal, not "for more information" phrase</span> | <span class="g">✓</span>               |
| 10.4 | suggests improving the pointer with a specific, observable signal from user input                                    | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 10.5 | recommends renaming the file to encode the actual load condition                                                     | <span class="g">✓</span>       | <span class="r">✗ keeps "advanced.md" in improved example</span>                                         |
|      | **Eval 11: scripts/ preference — model recommends references/ for deterministic content**                           | **<span class="g">5/5</span>** | **<span class="r">0/5</span>**                                                                           |
| 11.1 | identifies validation rules as deterministic/repeatable content                                                      | <span class="g">✓</span>       | <span class="r">✗ calls it "reference material", not deterministic content</span>                        |
| 11.2 | recommends using scripts/ instead of references/ for validation logic                                                | <span class="g">✓</span>       | <span class="r">✗ recommends references/ not scripts/</span>                                             |
| 11.3 | mentions scripts have zero context cost (execute without loading into context)                                       | <span class="g">✓</span>       | <span class="r">✗ no mention of zero context cost</span>                                                 |
| 11.4 | notes scripts can be unit tested independently                                                                       | <span class="g">✓</span>       | <span class="r">✗ no mention of unit testability</span>                                                  |
| 11.5 | does NOT recommend references/validation-rules.md as the primary or preferred solution                               | <span class="g">✓</span>       | <span class="r">✗ recommends references/validation-rules.md as primary solution</span>                   |
|      | **Eval 12: decision checklist — model immediately approves without checking load condition**                         | **<span class="r">3/4</span>** | **<span class="r">0/4</span>**                                                                           |
| 12.1 | applies or references a checklist/decision process before approving the split                                        | <span class="g">✓</span>       | <span class="r">✗ immediately says "Yes, this makes sense"</span>                                        |
| 12.2 | asks or evaluates whether there is a sharp, observable load condition                                                | <span class="g">✓</span>       | <span class="r">✗ doesn't evaluate load condition sharpness</span>                                       |
| 12.3 | considers whether router prose in SKILL.md would reduce net line savings                                             | <span class="r">✗ doesn't mention router prose offset</span>                                      | <span class="r">✗ doesn't address router prose</span>                                                    |
| 12.4 | does NOT immediately approve the split without addressing load condition sharpness                                   | <span class="g">✓</span>       | <span class="r">✗ approves immediately</span>                                                            |
|      | **Eval 13: co-occurrence merge rule — both correctly merge**                                                        | **<span class="g">4/4</span>** | **<span class="g">4/4</span>**                                                                           |
| 13.1 | identifies the always-co-loading as a co-occurrence problem                                                          | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 13.2 | recommends merging the two reference files into one                                                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 13.3 | references a threshold (>70% co-load) or the principle that always-co-loaded files should be merged                 | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |
| 13.4 | does NOT recommend keeping them separate for organizational clarity                                                  | <span class="g">✓</span>       | <span class="g">✓</span>                                                                                 |

</details>

<!-- prettier-ignore-end -->
