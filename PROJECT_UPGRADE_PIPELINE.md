# Project Upgrade Pipeline

This document is the intake and phase-gating policy for the project.

Its job is simple:

1. filter every raw idea before it affects the build
2. map accepted ideas to the correct phase
3. block implementation unless the active phase has an approved spec

## Core Rule

Before anything enters planning or implementation, ask:

> Does this improve the project in a way that belongs to the current capability sequence?

If not, it does not get built now.

## Non-Negotiable Operating Rule

No planning or implementation starts directly from raw ideas.

Every idea, brainstorm, outside suggestion, research note, user request, or LLM proposal must pass through this pipeline first.

## Intake Filter

Run every idea through these questions in order:

1. What concrete project problem does this solve?
2. Does the project currently have this problem?
3. Is this a current-phase problem or a future-phase problem?
4. Which phase owns this capability?
5. What breaks if we add it too early?
6. Does the active phase already have an approved spec?

If the answer to 6 is no, stop and refine the spec before implementation.

## Decision Outcomes

Every intake ends in exactly one outcome:

- `BUILD NOW`
- `DEFER TO PHASE 0`
- `DEFER TO PHASE 1`
- `DEFER TO PHASE 2`
- `DEFER TO PHASE 3`
- `DEFER TO PHASE 4`
- `DEFER TO PHASE 5`
- `DEFER TO PHASE 6`
- `DEFER TO PHASE 7`
- `REJECT`

## Phase Gating Rule

The roadmap is a capability unlock sequence, not a feature buffet.

Before implementation:

1. confirm the active phase
2. confirm no earlier phase gap blocks it
3. confirm `docs/specs/phase-x.md` exists
4. confirm the phase status is `Approved`
5. only then implement

If any of the above is false:

- stop implementation
- refine or write the phase spec
- do not patch around the process

## Source of Truth Files

- intake policy: `PROJECT_UPGRADE_PIPELINE.md`
- deferred accepted ideas: `PROJECT_PHASE_BACKLOG.md`
- executable phase specs: `docs/specs/phase-x.md`
- milestone continuity: `docs/compactions/`
- review outcomes: `docs/reviews/`
- proof artifacts: `verification/`

## Required Output Format For Triaged Ideas

Use this template:

```md
## Upgrade Name
<short name>

### Problem
<real problem only>

### Current Phase Relevance
<why it belongs now or not>

### Application to Project
<where it fits>

### Risk If Added Too Early
- Complexity:
- Workflow drift:
- False confidence:

### Decision
- BUILD NOW / DEFER TO PHASE X / REJECT
```

## Backlog Rule

If an idea passes the filter but does not belong in the active phase:

- add it to `PROJECT_PHASE_BACKLOG.md`
- place it under the correct future phase
- record why it is deferred
- do not let it leak into current implementation

## Compaction Rule

When writing milestone compactions:

- record verified state, not full speculation
- preserve the exact next move
- keep specs authoritative for status
- if a compaction claims a phase is accepted, verified, or complete, update the phase spec in the same change

## Default Behavior For Any Future Agent

If you are about to work on this project:

1. check the active phase
2. check the approved phase spec
3. run new ideas through this pipeline
4. add deferred items to the backlog
5. implement only what belongs to the approved active phase
