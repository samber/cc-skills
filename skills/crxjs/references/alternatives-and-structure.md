# CRXJS Alternatives & Project Structure

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
