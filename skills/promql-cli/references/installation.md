# promql-cli — Installation

Latest release: **v0.3.0** — macOS and Linux only (no official Windows binary). Please check the [releases](https://github.com/nalbury/promql-cli/releases) to find the latest version.

## macOS

### Pre-built binary (recommended)

```bash
# Intel (x86_64)
curl -L https://github.com/nalbury/promql-cli/releases/download/v0.3.0/promql-v0.3.0-darwin-amd64.tar.gz | tar xz
sudo mv promql /usr/local/bin/

# Apple Silicon (M1/M2/M3/M4/M+)
curl -L https://github.com/nalbury/promql-cli/releases/download/v0.3.0/promql-v0.3.0-darwin-arm64.tar.gz | tar xz
sudo mv promql /usr/local/bin/
```

### Build from source (requires Go 1.13+)

```bash
git clone https://github.com/nalbury/promql-cli.git
cd promql-cli
OS=darwin ARCH=amd64 INSTALL_PATH=/usr/local/bin make install   # Intel
OS=darwin ARCH=arm64 INSTALL_PATH=/usr/local/bin make install   # Apple Silicon
```

### go install

```bash
go install github.com/nalbury/promql-cli@latest
# Binary lands in $(go env GOPATH)/bin — ensure that's on your PATH
```

## Linux

### Pre-built binary (recommended)

```bash
# x86_64 (amd64)
curl -L https://github.com/nalbury/promql-cli/releases/download/v0.3.0/promql-v0.3.0-linux-amd64.tar.gz | tar xz
sudo mv promql /usr/local/bin/

# ARM64 (Raspberry Pi 4+, AWS Graviton, etc.)
curl -L https://github.com/nalbury/promql-cli/releases/download/v0.3.0/promql-v0.3.0-linux-arm64.tar.gz | tar xz
sudo mv promql /usr/local/bin/
```

### Build from source (requires Go 1.13+)

```bash
git clone https://github.com/nalbury/promql-cli.git
cd promql-cli
OS=linux ARCH=amd64 INSTALL_PATH=/usr/local/bin make install    # x86_64
OS=linux ARCH=arm64 INSTALL_PATH=/usr/local/bin make install    # ARM64
```

### go install

```bash
go install github.com/nalbury/promql-cli@latest
```

## Windows

No official Windows binary is provided. Options:

**WSL2 (recommended):** Install the Linux binary inside your WSL2 environment — full feature support.

**Build from source:**

```powershell
git clone https://github.com/nalbury/promql-cli.git
cd promql-cli
$env:GOOS="windows"; $env:GOARCH="amd64"; go build -o promql.exe ./
# Move promql.exe to a directory on your PATH
```

## Verify Installation

Test against your local Prometheus instance (default: [http://localhost:9090](http://localhost:9090)):

```bash
promql --version
promql 'up' --host http://localhost:9090
promql metrics --host http://localhost:9090 | head -20
```

## Configuration

By default promql-cli connects to `http://localhost:9090`. Override with `--host` or a config file:

```yaml
# ~/.promql-cli.yaml
host: http://prometheus.acme.org:9090
timeout: 30s
```

```bash
chmod 600 ~/.promql-cli.yaml   # file may contain tokens — restrict access
```

## Multi-Host Setup

Use separate config files per environment, switch with `--config`:

```yaml
# ~/.promql-cli-prod.yaml
host: https://prometheus-prod.acme.org:9090

# ~/.promql-cli-staging.yaml
host: https://prometheus-staging.acme.org:9090
```

```bash
promql --config ~/.promql-cli-prod.yaml 'up'
promql --config ~/.promql-cli-staging.yaml 'up'
```

## Authentication

Never pass tokens or passwords as CLI arguments — they appear in shell history (`~/.bash_history`, `~/.zsh_history`), in process listings (`ps aux`) and are sent to an LLM. Always store secrets in files under `$HOME` with restricted permissions.

**Bearer token:**

```bash
echo "your-token" > ~/.promql_token
chmod 600 ~/.promql_token
```

```yaml
# ~/.promql-cli.yaml  (chmod 600)
host: https://prometheus.acme.org:9090
token-file: ~/.promql_token # ✓ path to file — token never appears in CLI args
```

**Basic auth:**

```bash
echo "your-password" > ~/.promql_password
chmod 600 ~/.promql_password
```

```yaml
# ~/.promql-cli.yaml  (chmod 600)
host: https://prometheus.acme.org:9090
username: admin
password-file: ~/.promql_password # ✓ path to file — password never appears in CLI args
```

**TLS / mTLS:**

```yaml
host: https://prometheus.acme.org:9090
ca-cert: /path/to/ca.crt
client-cert: /path/to/client.crt # only for mTLS
client-key: /path/to/client.key # only for mTLS
insecure-skip-verify: false
```
