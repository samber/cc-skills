---
name: crxjs
description: "CRXJS Chrome extension development — true HMR for popup, options, content scripts, side panels, manifest-driven builds, dynamic content script imports (`?script`, `?script&module`), and `defineManifest` for type-safe manifests. Uses Vite as its build tool. Use when the user mentions CRXJS, crxjs, @crxjs/vite-plugin, 'extension with hot reload', 'HMR for chrome extension', or wants to set up a CRXJS-based Chrome extension project with any framework (React, Vue, Svelte, Solid, Vanilla). Also trigger when the user has an existing CRXJS project and wants to add features, fix HMR issues, or configure content scripts with CRXJS. For general Chrome extension architecture (messaging, CSP, storage, permissions) -> See `samber/cc-skills@chrome-extension` skill."
user-invocable: true
license: MIT
compatibility: Designed for Claude Code or similar AI coding agents. Requires git, node.
metadata:
  author: samber
  version: "1.0.0"
  openclaw:
    emoji: "📝"
    homepage: https://github.com/samber/cc-skills
    requires:
      bins:
        - git
        - node
        - npm
allowed-tools: Read Edit Write Glob Grep Bash(git:*) Bash(gh:*) Bash(npm:*)
---

# CRXJS

CRXJS is a Chrome extension development tool that provides true HMR for popup, options, content scripts, and side panels. It reads your manifest to auto-generate the extension output, handles content script injection, and manages the service worker build. Under the hood it is a Vite plugin (`@crxjs/vite-plugin`).

## Current status

- **Package**: `@crxjs/vite-plugin` (v2.x stable, latest v2.4.0 as of March 2026)
- **Scaffolding**: `npm create crxjs@latest` (always use `@latest`)
- **Maintained by**: @Toumash and @FliPPeDround (since mid-2025)
- **GitHub**: github.com/crxjs/chrome-extension-tools (~4k stars)
- **Vite compatibility**: v3 through v8-beta

## Quick start

```bash
# Scaffold new project (picks framework interactively)
npm create crxjs@latest

# Or add to existing Vite project
npm install @crxjs/vite-plugin -D
```

## Vite config by framework

CRXJS is added as a Vite plugin. The setup varies slightly per framework.

### React

```typescript
// vite.config.ts
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { crx } from "@crxjs/vite-plugin";
import manifest from "./manifest.json";

export default defineConfig({
  plugins: [react(), crx({ manifest })],
});
```

Use `@vitejs/plugin-react` (not `plugin-react-swc`) for best HMR compatibility. If you must use SWC, cast the manifest:

```typescript
import { ManifestV3Export } from "@crxjs/vite-plugin";
const manifest = manifestJson as ManifestV3Export;
```

### Vue

```typescript
import vue from "@vitejs/plugin-vue";
import { crx } from "@crxjs/vite-plugin";
import manifest from "./manifest.json";

export default defineConfig({
  plugins: [vue(), crx({ manifest })],
});
```

### Svelte

```typescript
import { svelte } from "@sveltejs/vite-plugin-svelte";
import { crx } from "@crxjs/vite-plugin";
import manifest from "./manifest.json";

export default defineConfig({
  plugins: [svelte(), crx({ manifest })],
});
```

### Vanilla TypeScript

```typescript
import { crx } from "@crxjs/vite-plugin";
import manifest from "./manifest.json";

export default defineConfig({
  plugins: [crx({ manifest })],
});
```

## defineManifest — type-safe dynamic manifest

Instead of a static JSON file, use CRXJS's `defineManifest` for dynamic values and full TypeScript autocompletion:

```typescript
// manifest.ts
import { defineManifest } from "@crxjs/vite-plugin";
import pkg from "./package.json";

export default defineManifest((config) => ({
  manifest_version: 3,
  name: config.command === "serve" ? `[DEV] ${pkg.name}` : pkg.name,
  version: pkg.version,
  description: pkg.description,
  permissions: ["storage", "activeTab", "scripting"],
  action: {
    default_popup: "src/popup/index.html",
    default_icon: {
      "16": "public/icons/icon16.png",
      "48": "public/icons/icon48.png",
    },
  },
  background: {
    service_worker: "src/background/index.ts",
    type: "module",
  },
  content_scripts: [
    {
      matches: ["https://*/*"],
      js: ["src/content/index.ts"],
      css: ["src/content/styles.css"],
    },
  ],
  options_page: "src/options/index.html",
  side_panel: { default_path: "src/sidepanel/index.html" },
  icons: {
    "16": "public/icons/icon16.png",
    "48": "public/icons/icon48.png",
    "128": "public/icons/icon128.png",
  },
}));
```

Import in vite.config.ts:

```typescript
import manifest from "./manifest";
// ... crx({ manifest })
```

## Type declarations

Add to a `src/vite-env.d.ts` or `src/crxjs.d.ts`:

```typescript
/// <reference types="@crxjs/vite-plugin/client" />
```

This enables types for `?script` and `?script&module` imports.

## HMR behavior by context

| Context | HMR | How it works |
| --- | --- | --- |
| Popup | Full HMR | WebSocket-based, state preserved |
| Options page | Full HMR | Same as popup |
| Side panel | Full HMR | Same as popup |
| Content script (manifest) | True HMR | CRXJS injects loader + HMR client |
| Content script (dynamic) | True HMR | Via `?script` import |
| Service worker | Auto-reload | Changes trigger full extension reload |
| Main world scripts | No HMR | Skipped by CRXJS loader |

Content script HMR works because CRXJS generates a loader script that imports an HMR preamble, the HMR client, and your actual script — enabling real module-level HMR without full page reload. This is CRXJS's main differentiator.

## Dynamic content script imports

For content scripts injected programmatically (not in manifest), CRXJS provides special import suffixes:

```typescript
// background.ts — ?script gives you a resolved path for executeScript
import contentScript from "./content?script";

chrome.action.onClicked.addListener(async (tab) => {
  await chrome.scripting.executeScript({
    target: { tabId: tab.id! },
    files: [contentScript],
  });
});
```

For main world injection (no HMR):

```typescript
import mainWorldScript from "./inject?script&module";

await chrome.scripting.executeScript({
  target: { tabId },
  world: "MAIN",
  files: [mainWorldScript],
});
```

## CRXJS plugin options

```typescript
crx({
  manifest,
  browser: "chrome", // 'chrome' | 'firefox'
  contentScripts: {
    injectCss: true, // auto-inject CSS for content scripts
    hmrTimeout: 5000, // HMR connection timeout (ms)
  },
});
```

## Development workflow

```bash
# Start dev server (outputs to dist/ with HMR)
npm run dev

# 1. Open chrome://extensions
# 2. Enable "Developer mode"
# 3. Click "Load unpacked"
# 4. Select the dist/ directory
# 5. Edit code — popup/content scripts update instantly via HMR
# 6. Service worker changes trigger automatic extension reload
```

After loading once, subsequent `npm run dev` sessions reconnect automatically. No need to re-load the extension unless manifest.json changes.

## Production build

```bash
npm run build    # outputs to dist/
```

The dist/ directory is ready to zip and upload to Chrome Web Store:

```bash
cd dist && zip -r ../extension.zip .
```

Disable Vite's module preload to avoid CWS rejection of inline scripts:

```typescript
build: {
  modulePreload: false;
}
```

## Known issues and workarounds

### Tailwind CSS HMR in content scripts

New Tailwind classes may not trigger CSS updates in content scripts. **Workaround**: restart dev server after adding new utility classes. Improved in v2.4.0 but not fully resolved. Ensure `injectCss: true` in config.

### WebSocket connection errors (`ws://localhost:undefined/`)

**Cause**: port mismatch between dev server and HMR config. **Fix**: explicitly set both to the same value:

```typescript
server: {
  port: 5173,
  strictPort: true,
  hmr: { port: 5173 },
}
```

### "Manifest version 2 is deprecated" warning

If you see this, your manifest is being interpreted as MV2. **Fix**: ensure `"manifest_version": 3` is set.

### Content scripts not injecting on file:// URLs

Chrome requires the user to enable "Allow access to file URLs" in the extension settings at chrome://extensions. CRXJS cannot change this.

### HMR stops working after Chrome update

CRXJS's HMR relies on injecting a content script that connects to the dev server's WebSocket. Chrome security updates occasionally break this. **Fix**: update to the latest CRXJS version, which tracks Chrome changes.

## CRXJS vs alternatives

| Feature | CRXJS | WXT | Plasmo |
| --- | --- | --- | --- |
| Content script HMR | True HMR | File-based reload | Partial |
| Framework support | Any Vite framework | Any | React-focused |
| Abstraction level | Thin (Vite plugin) | Full framework | Full framework |
| Messaging helpers | None (use chrome.\* directly) | Built-in | Built-in |
| Storage wrappers | None | Built-in | Built-in |
| Cross-browser | Chrome + Firefox | Chrome + Firefox + Safari | Chrome + Firefox |
| File-based routing | No | Yes | Yes |
| Learning curve | Low (know Vite, know CRXJS) | Medium | Medium |

**Choose CRXJS when**: you want minimal abstraction over raw Chrome APIs and value content script HMR above all. CRXJS stays out of the way — no magic routing, no wrapper APIs, just your code with HMR.

**Choose WXT when**: you want conventions, built-in utilities, and cross-browser support.

**Choose Plasmo when**: you're React-focused and want the highest-level abstraction.

## Project structure (recommended)

```
my-extension/
├── src/
│   ├── background/
│   │   └── index.ts
│   ├── content/
│   │   ├── index.ts
│   │   └── styles.css
│   ├── popup/
│   │   ├── index.html        <- CRXJS resolves HTML entry points
│   │   ├── App.tsx
│   │   └── main.tsx
│   ├── options/
│   │   ├── index.html
│   │   └── main.tsx
│   ├── sidepanel/
│   │   ├── index.html
│   │   └── main.tsx
│   └── shared/
│       ├── messages.ts
│       └── storage.ts
├── public/
│   └── icons/
├── manifest.ts               <- or manifest.json
├── vite.config.ts
├── tsconfig.json
└── package.json
```

CRXJS resolves HTML files referenced in the manifest automatically. Your popup.html can use standard `<script type="module" src="./main.tsx">` and it works.

If you encounter a bug or unexpected behavior in CRXJS, open an issue at github.com/crxjs/chrome-extension-tools/issues.
