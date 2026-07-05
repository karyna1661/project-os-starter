---
name: dead-code-cleanup
description: Audit and remove dead code from a codebase. Finds unused exports, imports, functions, types, variables, and unreachable code paths. Use when the user says "find dead code", "clean up dead code", "audit unused code", "remove dead code", "what's unused", or "code cleanup". Works on any language (TypeScript, Python, Go, etc.).
---

# Dead Code Cleanup

Systematically find and remove code that is defined but never used. Works on any codebase.

## Workflow

### Phase 1: Scan

Run these grep/search patterns in parallel across the source tree:

1. **Unused exports** — For each `export function`, `export const`, `export type`, grep for import statements referencing that name. If zero imports found outside the defining file, it's dead.
2. **Unused imports** — For each `import` statement, grep for the imported name in the file body (after the import). If never referenced, the import is dead.
3. **Unused variables** — For each `const`/`let`/`var` declaration, check if the variable is read anywhere after assignment.
4. **Dead functions** — For each function definition, grep for call sites. If zero calls outside the defining file, it's dead.
5. **Dead types** — For each `type` or `interface` definition, grep for references. If never used in any other file, it's dead.
6. **Unreachable code** — Look for code after `return`, `throw`, `break`, `continue` statements. Look for always-false conditions.

### Phase 2: Classify

Categorize each finding:

| Category | Action | Example |
|---|---|---|
| **Safe to delete** | No consumers anywhere | Unused export never imported |
| **Orphaned by refactor** | Was used, reference removed | Old helper after migration |
| **Flag only** | May be needed later | Public API surface, test utilities |
| **Pre-existing** | Existed before current work | Don't delete without asking |

Rules:
- Never delete code that is actively used in a fallback path or error handler
- Never delete public API exports without confirming they're truly unused
- Never delete test files or test utilities
- Flag pre-existing dead code separately — let the user decide

### Phase 3: Report

Output a structured report:

```
## Dead Code Audit

### Safe to delete
| File | Line | Item | Type | Reason |
|---|---|---|---|---|
| path/to/file.ts | 42 | `foo()` | function | Never imported anywhere |

### Flag for review
| File | Line | Item | Type | Reason |
|---|---|---|---|---|
| path/to/file.ts | 10 | `Bar` type | type | Exported but never imported — may be public API |

### Pre-existing (not deleting)
| File | Line | Item | Type | Reason |
|---|---|---|---|---|
| path/to/file.ts | 5 | `baz()` | function | Dead but pre-existing — ask user |
```

### Phase 4: Clean Up (with user approval)

Only delete after the user approves. For each deletion:

1. Remove the dead code
2. Remove any orphaned imports that become unused as a result
3. Run type check / linter to verify no breakage
4. Report what was removed

## Language-Specific Patterns

### TypeScript / JavaScript
- `export function` / `export const` / `export type` — grep for `import.*{NAME}` or `import.*NAME from`
- `import { X }` — check if `X` is used in the file body
- Re-exports in `index.ts` — check if the index export is imported anywhere

### Python
- `def function_name` — grep for `function_name(` calls
- `class ClassName` — grep for `ClassName(` instantiation or type references
- `from module import name` — check if `name` is used

### Go
- `func FunctionName` — grep for `FunctionName(` calls
- Unexported functions (lowercase) — only check within the package

## Safety Rules

1. **Never auto-delete** — always report first, delete only with approval
2. **Run type check after deletion** — `npx tsc --noEmit` for TypeScript, equivalent for other languages
3. **One category at a time** — delete safe items first, then flag, then ask about pre-existing
4. **Preserve git history** — commit each category separately for easy revert
