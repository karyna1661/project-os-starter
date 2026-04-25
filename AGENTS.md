# AGENTS

This repository uses a project operating system designed for disciplined, phase-based, LLM-assisted engineering.

## Default Working Order

1. Check the active phase in `docs/specs/`
2. Read the relevant phase spec
3. Run new ideas through `PROJECT_UPGRADE_PIPELINE.md`
4. Implement using `prompts/BUILD_MODE.md`
5. Review using `prompts/REVIEW_MODE.md`
6. Save proof artifacts in `verification/`
7. Write a compaction in `docs/compactions/`

## Hard Rules

- Do not implement directly from raw ideas.
- Do not widen scope beyond the approved phase.
- Do not treat backlog items as implementation approval.
- Do not claim a milestone without proof artifacts.
- Do not mark a phase complete without updating the phase spec honestly.

## Build Discipline

- State assumptions when they affect implementation.
- Prefer the simplest valid change.
- Make surgical edits.
- Avoid speculative abstractions.
- Define success as a concrete verification check.

## Review Discipline

- Findings first
- Prioritize bugs, regressions, scope leakage, invariant breaks, and missing proof
- Keep summaries brief
- End with `Accept`, `Accept With Follow-Ups`, or `Block`

## Source of Truth

- Intake and gating: `PROJECT_UPGRADE_PIPELINE.md`
- Deferred work: `PROJECT_PHASE_BACKLOG.md`
- Phase contracts: `docs/specs/`
- Compaction protocol: `docs/compactions/PROTOCOL.md`
- Review artifacts: `docs/reviews/`
- Proof artifacts: `verification/`
