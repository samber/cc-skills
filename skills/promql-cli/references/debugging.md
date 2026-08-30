# promql-cli — Debugging Methodology

## Core Rule: Isolate Before Aggregating

The most common debugging mistake is starting with aggregated metrics. Aggregation masks individual bad actors — a single overloaded pod looks fine when its metrics are averaged with 9 healthy ones. Always start by narrowing to a single instance, then broaden once you understand what's happening.

## USE Method (Utilization, Saturation, Errors)

For infrastructure components (CPU, memory, disk, network):

```bash
# Utilization — how busy is the resource?
promql 'avg by(instance)(rate(node_cpu_seconds_total{mode!="idle"}[5m]))' --start 1h --output graph

# Saturation — is the resource overloaded? (queue depth, wait time)
promql 'node_load1 / on(instance) count by(instance)(node_cpu_seconds_total{mode="idle"})' --start 1h

# Errors — are requests failing?
promql 'rate(node_disk_io_time_seconds_total[5m])' --start 1h --output graph
```

## RED Method (Rate, Errors, Duration)

For services and HTTP endpoints:

```bash
# Rate — requests per second
promql 'sum by(job)(rate(http_requests_total[5m]))' --start 1h --output graph

# Errors — error ratio
promql 'sum by(job)(rate(http_requests_total{status=~"5.."}[5m])) / sum by(job)(rate(http_requests_total[5m]))' --start 1h

# Duration — latency (requires histogram metric)
promql 'histogram_quantile(0.99, sum by(le, job)(rate(http_request_duration_seconds_bucket[5m])))' --start 1h --output graph
```

## Step-by-Step: Investigating a Latency Spike

**1. Identify the time window**

```bash
promql 'histogram_quantile(0.99, sum by(le)(rate(http_request_duration_seconds_bucket[5m])))' --start 6h --output graph
```

**2. Isolate by instance — don't aggregate yet**

```bash
# Remove the sum(), keep instance labels
promql 'histogram_quantile(0.99, rate(http_request_duration_seconds_bucket{job="api"}[5m]))' --start 2h --output graph
```

**3. Check resource pressure on the worst instance**

```bash
promql 'rate(node_cpu_seconds_total{mode!="idle", instance="bad-host:9100"}[5m])' --start 2h --output graph
promql 'node_memory_MemAvailable_bytes{instance="bad-host:9100"}' --start 2h --output graph
```

**4. Correlate with upstream dependencies**

```bash
promql 'rate(db_query_duration_seconds_sum{instance="bad-host:5432"}[5m]) / rate(db_query_duration_seconds_count{instance="bad-host:5432"}[5m])' --start 2h --output graph
```

## Step-by-Step: Investigating an Error Rate Spike

**1. Get the overall error rate**

```bash
promql 'sum(rate(http_requests_total{status=~"5.."}[5m])) / sum(rate(http_requests_total[5m]))' --start 3h --output graph
```

**2. Break down by endpoint**

```bash
promql 'sum by(handler)(rate(http_requests_total{status=~"5.."}[5m]))' --start 1h --output csv | sort -t, -k2 -rn | head -10
```

**3. Check for upstream failures (dependency error rates)**

```bash
promql 'rate(grpc_client_handled_total{grpc_code!="OK"}[5m])' --start 1h --output graph
```

## Diagnose: Useful Checks

**Diagnose:** 1- `promql 'up' --output table` — check which scrape targets are down; a missing instance explains missing metrics 2- `promql metrics | grep <service>` — discover what metrics a service actually exposes before querying 3- `promql meta <metric>` — confirm the metric type (counter vs gauge) before applying `rate()` or `increase()`

## Finding the Right Metrics

When you don't know which metrics or thresholds are meaningful for a given component, start with `promql metrics` and `promql meta` to discover what your Prometheus instance exposes. For reference, the Awesome Prometheus Alerts project (samber/awesome-prometheus-alerts) maintains a curated collection of battle-tested PromQL alert rules organized by exporter, covering:

| Domain | Exporters covered |
| --- | --- |
| Infrastructure | node-exporter, cAdvisor, blackbox, IPMI, Windows, Proxmox |
| Databases | MySQL, PostgreSQL, Redis, MongoDB, Elasticsearch, Cassandra, Clickhouse, and more |
| Message brokers | Kafka, RabbitMQ, Pulsar, NATS, Zookeeper |
| Proxies & mesh | Nginx, HAProxy, Traefik, Envoy, Istio, Linkerd |
| Runtimes | JVM, Golang, PHP-FPM, Ruby, Python |
| Orchestrators | Kubernetes, Nomad, Consul, Etcd |
| Storage | Ceph, MinIO, ZFS, OpenEBS |
| Observability | Thanos, Loki, Grafana Mimir, OpenTelemetry Collector |
| Cloud | AWS CloudWatch, GCP Stackdriver, Azure, DigitalOcean |

Standard alert expressions are valid PromQL — you can use similar patterns with promql-cli to inspect current values. Example workflow:

```bash
# 1. Discover relevant metrics in your Prometheus instance
# 2. Write a PromQL expression based on common alerting patterns
# 3. Run it to see the current value
promql 'node_filesystem_avail_bytes{fstype!="tmpfs"} / node_filesystem_size_bytes{fstype!="tmpfs"} * 100' --output table

# 4. Run as a range query to see the trend
promql 'node_filesystem_avail_bytes{fstype!="tmpfs"} / node_filesystem_size_bytes{fstype!="tmpfs"} * 100' --start 6h --output graph
```

**Exporter documentation** — when alert rules aren't enough, check the official exporter docs for the full list of exposed metrics and their semantics. Each exporter's README lists all metric names and labels.

## Listing Available Metrics

Use `promql metrics` to discover what's actually exposed in your Prometheus instance. On large production setups this can return thousands of metric names — always filter immediately or the output becomes unmanageable.

```bash
# ✗ Bad — dumps every metric name, potentially thousands of lines
promql metrics

# ✓ Good — filter by exporter prefix or keyword
promql metrics | grep '^node_'          # node-exporter metrics
promql metrics | grep '^container_'     # cAdvisor / Kubernetes metrics
promql metrics | grep '^pg_'            # PostgreSQL exporter
promql metrics | grep '^redis_'         # Redis exporter
promql metrics | grep '^kafka_'         # Kafka exporter
promql metrics | grep http              # any metric mentioning http
```

Once you have a metric name, drill into its labels and type:

```bash
promql labels <metric>         # list all label names
promql labels <metric> job     # list all values for a specific label
promql meta <metric>           # show metric type (counter/gauge/histogram) and help text
```

Label values help you understand the cardinality before running a query — a metric with hundreds of `instance` values will return a large result set unless filtered:

```bash
# Check how many instances exist before querying
promql labels http_requests_total instance

# Then filter down to the relevant one
promql 'rate(http_requests_total{instance="api-1:8080"}[5m])' --output table
```

## Query Cost & Cardinality

High-cardinality or wide time-range queries are expensive: Prometheus must scan and evaluate every matching time series for every step in the range. Always assess cost before running an unknown query.

**Check cardinality before querying an unfamiliar metric:**

```bash
promql 'count(metric_name)'                           # total time series count
promql 'count by(label)(metric_name)'                 # per-label cardinality breakdown
promql labels metric_name instance                    # list all values for a label
```

Only proceed with a full range query if the cardinality is manageable, or narrow with label filters first. A metric with 10,000 time series running over a 7-day range with a 1-minute step is ~10M data points — a likely timeout.

**Prefer targeted queries with many label filters over broad ones:**

```bash
# ✗ Bad — scans all instances, all jobs, all paths
promql 'rate(http_requests_total[5m])' --start 24h

# ✓ Good — scoped to exactly what we need
promql 'rate(http_requests_total{job="api", instance="api-1:8080", path="/v1/users"}[5m])' --start 1h
```

If label values are unknown at the start of a session, use `promql labels` and `promql labels <metric> <label>` to discover them before building the query.

**Prefer short intervals with multiple queries over one long query:**

```bash
# ✗ Bad — loads 30 days in one shot; likely slow or timeout
promql 'rate(http_requests_total[5m])' --start 720h --output graph

# ✓ Good — three focused queries, narrow then broaden
promql 'rate(http_requests_total{job="api"}[5m])' --start 1h --output graph   # recent
promql 'rate(http_requests_total{job="api"}[5m])' --start 1d --output graph   # today
promql 'rate(http_requests_total{job="api"}[5m])' --start 7d --output graph   # week trend
```

**Aggregate in Prometheus, not in the agent** — never pull raw series and sum/average in a Python script, shell pipeline, or via the Prometheus HTTP API. Push aggregation into PromQL; Prometheus collapses them server-side and the CLI returns a compact result:

```bash
# ✗ Bad — fetches all series as raw JSON, agent has to parse and aggregate
promql 'http_requests_total' --output json | python3 -c "import sys,json; ..."

# ✗ Bad — calls the HTTP API directly, bypasses CLI formatting and auth handling
curl http://prometheus:9090/api/v1/query?query=http_requests_total | jq ...

# ✓ Good — Prometheus aggregates server-side, CLI returns one row per job
promql 'sum by(job)(rate(http_requests_total[5m]))' --output table
```

**Prefer ASCII charts over raw data** — always reach for `--output graph` before `--output json` or `--output csv`. A sparkline conveys trend, spike, and plateau in a few dozen tokens; raw data with timestamps inflates context and forces the model to interpret numbers mentally. When exact values are also needed, run `--output graph` first to identify the relevant window, then `--output table` on that narrow range only.

```bash
# ✓ Good — trend visible at a glance, low token cost
promql 'rate(http_requests_total{job="api"}[5m])' --start 1h --output graph

# Then zoom in on the spike window only
promql 'rate(http_requests_total{job="api"}[5m])' --start 2024-01-15T14:00:00Z --end 2024-01-15T14:30:00Z --output table
```

**If a query takes >15s, it's too broad** — add label filters, shorten `--start`, or add an aggregation wrapper, then retry. A slow query is a signal, not a fluke: adapt all subsequent queries in the session to the same narrowed scope.

## Diagnosing Data Gaps

When a metric shows a gap (flat line, NaN, or missing data), verify whether the exporter was down before diagnosing application issues — a missing exporter looks identical to a metric dropping to zero.

```bash
# Was the exporter reachable during the gap?
promql 'up{job="my-service", instance="host:9100"}' --start 2h --output graph

# Was the scrape itself slow or failing?
promql 'scrape_duration_seconds{job="my-service"}' --start 2h --output graph
promql 'scrape_samples_scraped{job="my-service"}' --start 2h --output graph
```

A `0` value in `up` during the gap confirms the exporter (or the scrape target) was down — this is infrastructure, not application behavior. Only investigate the application metric if `up` stayed `1` throughout the gap window.
