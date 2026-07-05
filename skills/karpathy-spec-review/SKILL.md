---
name: karpathy-spec-review
description: Cross-reference spec vs implementation before phase verification. Use when verifying a phase, reviewing implementation against spec, checking for spec drift, or before marking a milestone complete. Catches bugs that self-review misses by forcing explicit comparison between what was promised and what was built.
---

# Karpathy Spec Review

Before accepting any phase or milestone, cross-reference the spec against the actual implementation. Self-review misses drift; this forces explicit comparison.

## When to run

- Before marking any phase complete
- Before demo recording
- Before claiming a milestone has proof artifacts
- When user asks "verify this" or "check if this matches the spec"

## Workflow

### Phase 1: Read the spec

Find and read the active phase spec. Note:
- Exact acceptance criteria
- Explicit constraints ("no LLM in critical path", "deterministic only")
- Promised deliverables
- Explicitly excluded scope

### Phase 2: Read the implementation

Read every file the spec touches. For each acceptance criterion:
1. Find the code that implements it
2. Note the actual behavior (not what you think it does)
3. Check for hidden assumptions or silent deviations

### Phase 3: Cross-reference

Build a comparison table:

```
| Spec requirement | Implementation | Match? | Notes |
|---|---|---|---|
| "deterministic decide()" | rules_engine.py:42 | ✅ | Pure function, no LLM |
| "LLM explains only" | explain.py:15 | ⚠️ | LLM gets verdict as input but prompt says "you decide" — drift |
```

### Phase 4: Surface drift

For every mismatch:
- Name the drift explicitly
- Explain why it matters (or if it's acceptable)
- Recommend fix or confirm it's intentional

### Phase 5: Verdict

End with one of:
- **Accept** — spec and implementation match
- **Accept With Follow-Ups** — minor drift, non-blocking
- **Block** — critical drift that must be fixed before acceptance

## What this catches that self-review misses

- ReliefWeb filter overwrite (spec said "append", code said "replace")
- IFRC pagination cap (spec said "all pages", code capped at 50)
- Simplified impact_score (spec said "composite", code used raw count)
- LLM deciding instead of explaining (spec constraint violated silently)

## Rules

- Never skip this for phase completion
- Never approve without reading both spec AND implementation
- Drift is not always a bug — but it must be named and decided
- Cross-reference, don't just skim
