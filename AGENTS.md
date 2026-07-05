# AGENTS

This repository uses a project operating system designed for disciplined, phase-based, LLM-assisted engineering.

## Default Working Order

1. Check the active phase in `docs/specs/`
2. Read the relevant phase spec
3. If present, read the Shared Execution Context (SEC) files under `docs/`
4. Run new ideas through `PROJECT_UPGRADE_PIPELINE.md`
5. Implement using `prompts/BUILD_MODE.md`
6. Review using `prompts/REVIEW_MODE.md`
7. Save proof artifacts in `verification/`
8. Write a compaction in `docs/compactions/`

## Agent Reading Order

When entering a collaborative repo, read files in this order:

1. `docs/specs/ACTIVE_PHASE.md` if present, otherwise determine the active phase from `docs/specs/`
2. `PROJECT_BRIEF.md`
3. `docs/SEC.json` if present
4. `docs/BUILD_CONTEXT.md`
5. `docs/PHASE_RULES.md`
6. `docs/NEXT_STEPS.md`
7. `docs/TASK_BOARD.md`
8. `docs/DEV_RULES.md`
9. `docs/DEFINITION_OF_DONE.md` if present

Use this order to answer:

- what phase is active
- what kind of project this is
- what machine-readable context says
- what is allowed
- what should be done next
- who owns what
- how to behave while implementing
- what counts as done

## Hard Rules

- Do not implement directly from raw ideas.
- Do not widen scope beyond the approved phase.
- Do not treat backlog items as implementation approval.
- Do not claim a milestone without proof artifacts.
- Do not mark a phase complete without updating the phase spec honestly.
- Do not ignore SEC files when they exist; they are the repo-visible collaboration contract.
- If the full private Project OS is not shared in the repo, treat committed SEC files as the authoritative collaboration surface.
- **Always write compaction after phase completion** — after every phase is marked complete, automatically write a compaction report to `docs/compactions/` using the protocol in `docs/compactions/PROTOCOL.md`. Do not wait for the user to ask. This is automatic behavior, not optional.

## Build Discipline

- State assumptions when they affect implementation.
- Prefer the simplest valid change.
- Make surgical edits.
- Avoid speculative abstractions.
- Define success as a concrete verification check.

## Review Discipline

- Findings first
- Prioritize bugs, regressions, scope leakage, invariant breaks, and missing proof
- Prefer reality-tested behavior over theoretical correctness
- Penalize unnecessary abstraction, duplicated logic, and false confidence
- Keep summaries brief
- End with `Accept`, `Accept With Follow-Ups`, or `Block`

## Source of Truth

- Intake and gating: `PROJECT_UPGRADE_PIPELINE.md`
- Deferred work: `PROJECT_PHASE_BACKLOG.md`
- Active phase pointer: `docs/specs/ACTIVE_PHASE.md`
- Phase contracts: `docs/specs/`
- Structured SEC summary: `docs/SEC.json`
- Shared collaboration surface: `docs/BUILD_CONTEXT.md`, `docs/PHASE_RULES.md`, `docs/NEXT_STEPS.md`, `docs/TASK_BOARD.md`, `docs/DEV_RULES.md`
- Shared completion companion: `docs/DEFINITION_OF_DONE.md`
- SEC consistency check: `docs/SEC_CONSISTENCY_CHECK.md`
- Compaction protocol: `docs/compactions/PROTOCOL.md`
- Review artifacts: `docs/reviews/`
- Proof artifacts: `verification/`

## Recommended Skills

Load these skills from `skills/` when the task matches:

- **karpathy-spec-review** — Cross-reference spec vs implementation before phase verification
- **security-audit** — Systematic security scan before deployment or going public
- **external-verification** — Verify external claims via web search before presenting as facts
- **dead-code-cleanup** — Find and remove unused code
- **mechanism-debrief** — Explain what was built after implementation
- **workflow-orchestration** — Enforce fail-safe engineering workflow with plan-first, verification, and bug fixing
- **karpathy-guidelines** — Behavioral guidelines to reduce common LLM coding mistakes
