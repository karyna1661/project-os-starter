# Context Compaction Protocol

This protocol makes the compaction workflow usable across IDEs and agents.

## Purpose

Reduce active context after meaningful milestones while preserving the verified state needed to resume work without rereading the full thread.

This protocol does not authorize implementation. It preserves state; the phase spec remains the gate.

## When To Compact

Compact intentionally:

- after a successful proof
- after a spec or architecture decision is locked
- after a failed experiment changes direction
- before a large implementation phase
- whenever the thread becomes noisy to resume from

Default rule: compact at least once per major milestone.

## Output Contract

Create:

1. one read-only report in `docs/compactions/`
2. one updated line in `docs/compactions/INDEX.md`

Filename format:

`YYYY-MM-DD-HHMM-<slug>.md`

## Required Sections

Every report must include:

- `Upgrade Name`
- `Problem`
- `Current State`
- `What Happened`
- `Insight from Work`
- `Application to Project`
- `Architecture Changes`
- `Current vs Target Gap`
- `Risk`
- `Decision`
- `Immediate Next Move`
- `Resume Context`

## Resume Context Contract

End every report with:

- current objective
- last verified state
- open risks
- exact next command or next decision
- files that matter
- what not to revisit

## Quality Rules

- keep verified facts only
- drop superseded exploration
- keep the report shorter than the full thread
- preserve exact commands only when they proved something or are next
- note whether new ideas were built now, deferred, or rejected
