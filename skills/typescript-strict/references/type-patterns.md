# Advanced Type Patterns

Loaded on demand — keep SKILL.md focused on fundamentals.

## Template literal types

Use to derive string unions from existing ones, keeping definitions in sync automatically:

```ts
type HttpMethod = "GET" | "POST" | "PUT" | "DELETE"
type EventName  = `on${Capitalize<Lowercase<HttpMethod>>}` 
// → "onGet" | "onPost" | "onPut" | "onDelete"
```

## Mapped types

Transform every property of a type without repeating the shape:

```ts
// Make all fields required and non-nullable
type Required<T> = { [K in keyof T]-?: NonNullable<T[K]> }

// Deep readonly
type DeepReadonly<T> = {
  readonly [K in keyof T]: T[K] extends object ? DeepReadonly<T[K]> : T[K]
}
```

## Conditional types

Use `infer` to extract types from structures:

```ts
// Unwrap Promise<T> → T
type Awaited<T> = T extends Promise<infer U> ? Awaited<U> : T

// Extract function return type
type ReturnType<T> = T extends (...args: any[]) => infer R ? R : never
```

Avoid deep conditional type chains — they make error messages unreadable and slow the compiler. Flatten with intermediate named types.

## Utility types cheatsheet

| Utility | What it does |
|---|---|
| `Partial<T>` | All fields optional |
| `Required<T>` | All fields required |
| `Readonly<T>` | All fields readonly |
| `Pick<T, K>` | Keep only keys K |
| `Omit<T, K>` | Drop keys K |
| `Exclude<T, U>` | Remove U from union T |
| `Extract<T, U>` | Keep only U from union T |
| `NonNullable<T>` | Remove null and undefined |
| `ReturnType<T>` | Function return type |
| `Parameters<T>` | Function parameter tuple |
| `InstanceType<T>` | Constructor instance type |

## Variance and function types

With `strictFunctionTypes`, method positions are bivariant (for legacy compatibility) but function properties are contravariant in parameters:

```ts
type Handler = { handle: (e: MouseEvent) => void }  // bivariant — less safe
type Handler = { handle(e: MouseEvent): void }        // same; method syntax is bivariant

// Use function property syntax when you want contravariant checking:
type Processor = { process: (input: string) => void } // strictFunctionTypes applies
```

## Index signatures vs. mapped types

```ts
// ✗ Index signature — too permissive, any string key is valid
type Bag = { [key: string]: unknown }

// ✓ Mapped type — keys are constrained to a known union
type EventMap = { [K in EventName]: () => void }

// ✓ Record utility — idiomatic shorthand
type Registry = Record<string, Handler>
```

Use `noPropertyAccessFromIndexSignature: true` (see tsconfig section) to force bracket notation on index signatures, making accesses visually distinct from known properties.
