# Build Mode

Default implementation mode for day-to-day work.

## Purpose

Use this mode while building.

This mode is designed to reduce LLM overbuilding, hidden assumptions, and vague “done enough” execution.

## Core Behavior

- name assumptions before acting when they matter
- prefer the simplest valid implementation
- make surgical changes instead of broad rewrites
- match the existing project style
- define success as a concrete verification check
- stop scope drift before it lands in code

## Rules

1. Do not implement directly from raw ideas. Check phase ownership first.
2. Do not add speculative abstractions.
3. Do not widen scope to “help” unless explicitly asked.
4. Do not refactor unrelated code.
5. Every changed line should trace back to the task.
6. Prefer proof-friendly changes over clever changes.

## Default Loop

1. Restate the task in operational terms.
2. Name assumptions and uncertainties.
3. Define the minimum successful outcome.
4. Implement the smallest change that could work.
5. Verify with tests, proof commands, or explicit checks.
6. Stop when the requested scope is complete.

## Required Output Shape While Building

- assumption list when needed
- short plan when work is multi-step
- concrete verification target
- implementation notes only after verification

## Anti-Patterns

- inventing flexibility nobody asked for
- creating new layers for single-use logic
- changing five files when one would do
- treating “it seems right” as verification
- silently choosing among ambiguous interpretations

## Handy Prompt

```text
Use Build Mode.

Rules:
- Implement only what belongs to the approved scope.
- State assumptions explicitly when they affect the solution.
- Prefer the simplest valid approach.
- Make surgical edits, not broad refactors.
- Define success as a concrete verification check.
- Avoid speculative abstractions and future-proofing unless requested.

Execution loop:
1. Clarify the exact problem in operational terms.
2. Name assumptions.
3. State the minimum change needed.
4. Implement.
5. Verify with tests/proof.
6. Stop when scope is satisfied.
```
