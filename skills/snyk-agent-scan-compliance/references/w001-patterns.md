# W001 — Prompt Injection via MCP Tool Calls: Pattern Catalog

W001 fires when the skill body contains explicit MCP server tool function names. The scanner treats direct tool-calling instructions in skill bodies as a prompt injection vector — an attacker could craft a skill body that hijacks the agent's tool usage.

## Core Principle

MCP tool names belong in the `allowed-tools` frontmatter field, never in the body. The body should describe _what capability is available_ without naming the tool function the agent must call.

## Before / After Table

| Triggering pattern | Safe reformulation |
| --- | --- |
| `Call the resolve-library-id tool to get the library ID` | `This skill is not exhaustive. Please refer to library documentation. Context7 can help as a discoverability platform.` |
| `Use the query-docs MCP tool to fetch the latest API reference` | `Library documentation and code examples are available for reference.` |
| `Run mcp__context7__resolve-library-id with the library name` | Omit entirely — the `allowed-tools` frontmatter entry is sufficient |
| `Invoke the MCP server to look up the schema` | `Schema documentation may be available from the library's official resources.` |
| `call query-docs` / `call resolve-library-id` | `Documentation can be retrieved via context7.` |
| `Use the MCP context7 server to fetch documentation` | `Context7 can help as a discoverability platform.` |
| `mcp__sequential-thinking__sequentialthinking` in body instructions | Remove; list in `allowed-tools` only |
| `call the X tool, then use its output to...` | Describe the capability passively: `X provides [capability].` |

## Safe Formulation Catalog

When a skill needs to hint that an MCP-powered capability is available, use one of these formulations:

```
Context7 can help as a discoverability platform.
```

```
This skill is not exhaustive. Please refer to library documentation and code examples for more information. Context7 can help as a discoverability platform.
```

```
Library documentation and code examples are available for reference.
```

```
Documentation for this library is available via standard discoverability tools.
```

## What IS Allowed

**In `allowed-tools` frontmatter** — tool names are expected here and not scanned as body text:

```yaml
allowed-tools: Read Edit Write Glob Grep Bash(go:*) Agent mcp__context7__resolve-library-id mcp__context7__query-docs
```

**In reference code blocks** — showing tool signatures in a code block for documentation purposes is generally lower risk, but prefer the passive formulations above to be safe.

## Pattern Categories

### 1. Direct function name references

Any MCP tool function name (`resolve-library-id`, `query-docs`, `mcp__*`) in body prose triggers W001.

**Fix:** Remove all direct tool function names from the body. The agent knows which tools are available from `allowed-tools`; it does not need body instructions to call them.

### 2. "Call / invoke / use the tool" instructions

Imperative instructions telling the agent to call a specific MCP tool by name trigger W001, even if the function name itself is not written in full.

**Fix:** Convert to a passive capability statement. The agent will use available tools as appropriate without being explicitly told to call them.

### 3. MCP server references

Referring to an MCP server by name in a context that implies the agent should invoke it triggers W001.

**Fix:** Use generic formulations: "documentation is available" rather than "use the MCP server".

### 4. Tool-call chains

Sequences like "call X tool, then use its output to call Y tool" are flagged because they constitute explicit MCP tool orchestration in the body.

**Fix:** Describe the end-to-end capability: "Documentation and schema information are available for reference."

## Frontmatter Offloading

MCP tool names are safe in frontmatter — only the body is scanned for W001. Move every tool name out of body prose and into `allowed-tools`.

| What to move | From body | To frontmatter |
| --- | --- | --- |
| MCP tool function names | `call resolve-library-id` in prose | `allowed-tools` list |
| MCP server references | `use the context7 MCP server` | omit from body; list tool in `allowed-tools` |

```yaml
# Safe — tool names in allowed-tools are not flagged
allowed-tools: Read Edit Write Glob Grep Agent mcp__context7__resolve-library-id mcp__context7__query-docs
```
