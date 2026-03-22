---
name: promql-cli
description: CLI for querying Prometheus and PromQL-compatible engines (Thanos, Cortex, VictoriaMetrics, Grafana Mimir, Grafana Tempo...) — instant queries, range queries, metric discovery (metrics/labels/meta subcommands), output formats (table/csv/json/graph). Apply when executing PromQL queries, troubleshooting performance issues on a software having observability, investigating latency/error rates/saturation, or analyzing time series data.
license: MIT
compatibility: Requires promql-cli and jq
user-invocable: false
metadata:
  author: samber
  version: "1.1.0"
  openclaw:
    emoji: "📊"
    homepage: https://github.com/samber/cc-skills
    install:
      - kind: go
        package: github.com/nalbury/promql-cli
        bins: [promql]
      - kind: brew
        formula: jq
        bins: [jq]
    requires:
      bins:
        - promql
        - jq
allowed-tools: Read Edit Write Glob Grep Agent Bash(promql:*) mcp__context7__resolve-library-id mcp__context7__query-docs
---

# promql-cli — Prometheus Query CLI Skill

`promql-cli` (github.com/nalbury/promql-cli) is a Go CLI for querying, analyzing, and visualizing Prometheus metrics, plus PromQL fundamentals.

## Reference Files

Read the relevant reference file(s) before executing tasks:

| File | When to read |
| --- | --- |
| `references/installation.md` | User needs to install promql-cli or set up configuration (hosts, auth, token, password, multi-host) |
| `references/usage.md` | User wants to discover metrics/exporters/labels, run queries, or choose output formats |
| `references/graphing.md` | User wants to visualize Prometheus data as an ASCII chart in the terminal |
| `references/debugging.md` | User is investigating a performance issue, latency, errors, or saturation |
| `references/promql-reference.md` | User needs help writing PromQL, understanding metric types, functions, or aggregations |

For most tasks, read `references/usage.md`. For PromQL help, read `references/promql-reference.md`. When debugging, read both `references/debugging.md` and `references/promql-reference.md`.

## Setup Check

Before running any query, verify that a host is configured:

```bash
promql 'up'   # succeeds if host is reachable; fails with connection error if not configured
# or
promql --host xxx 'up'
```

Recognize these errors as a configuration/auth problem and refer to `references/installation.md`:

| Error | Cause |
| --- | --- |
| `dial tcp ... connection refused` | No host running at the configured address |
| `dial tcp ... no such host` | Hostname not resolved — wrong host in config |
| `error querying prometheus: ...401...` | Bearer token missing or invalid |
| `error querying prometheus: ...403...` | Token valid but insufficient permissions |
| `please specify an authentication type` | Auth flags partially set — use config file instead |

If any of these appear, **do not create config files on behalf of the user** — config files may contain credentials (tokens, passwords) that must never pass through an LLM. Instead, guide the user to set it up themselves:

> "Please create `~/.promql-cli.yaml` manually with your Prometheus host (and credentials if needed). See `references/installation.md` for the exact format. Let me know once it's ready."

Only after the user confirms the config is in place should you proceed with queries.

## Quick Command Reference

```bash
promql 'up'                                          # instant query
promql 'rate(http_requests_total[5m])' --start 1h    # range query (ASCII graph)
promql 'up' --output csv                             # CSV output
promql 'up' --output json                            # JSON output
promql metrics                                       # list all metric names
promql labels <metric>                               # list labels for a metric
promql meta <metric>                                 # show metric type and help
promql --config ~/.promql-cli-prod.yaml 'up'         # target a specific host
```

## Key Principles

1. **Use `rate()` on counters, never raw values** — raw counters only ever increase; the absolute value is meaningless. `rate()` gives the per-second change rate, which is what you actually care about.
2. **When debugging, isolate a single instance** — aggregating across replicas masks per-instance anomalies. A single overloaded pod hidden behind healthy peers won't show up in averages.
3. **Filter early with label matchers in the innermost selector** — Prometheus evaluates selectors before functions, so filtering late means scanning all time series. Early filters reduce data scanned and query latency.
4. **For histograms, keep `le` in the `by` clause** before `histogram_quantile()` — the function needs all `le` buckets to interpolate percentiles; dropping `le` early produces `NaN` or wrong results.
5. **Prefer `--output graph` for range queries** — ASCII sparklines convey trend direction (rising, falling, spiking) in a compact format that LLMs parse well; raw timestamp tables require mental modeling.
6. **Store credentials in `~/.promql-cli.yaml` and `~/.promql_token`, chmod 600** — passing tokens as CLI args exposes them in shell history and process listings.

This skill is not exhaustive. Please refer to the [official promql-cli documentation](https://github.com/nalbury/promql-cli) and examples for up-to-date information. Context7 can help as a discoverability platform.

If you encounter a bug or unexpected behavior in promql-cli itself, open an issue at https://github.com/nalbury/promql-cli/issues.
