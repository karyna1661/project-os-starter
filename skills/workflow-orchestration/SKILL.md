---
name: workflow-orchestration
description: Enforces a fail-safe engineering workflow: plan-first on non-trivial tasks, subagent/context offloading, correction capture, verification-before-done, elegance checks, and autonomous bug fixing with minimal-impact changes.
---

# Workflow Orchestration

Use this skill when implementing non-trivial changes, debugging regressions, handling multi-step architecture work, or running reliability hardening.

## How to use

- `/workflow-orchestration`
  Apply this process to the current task.

- `/workflow-orchestration <task>`
  Produce an execution plan, run it, verify results, and report completion evidence.

## Operating Rules

### 1) Plan Mode Default

- Enter plan mode for any non-trivial task:
  - 3+ steps
  - architectural decisions
  - data model changes
  - cross-file refactors
- If implementation drifts, stop and re-plan immediately.
- Use plan mode for verification steps too, not only building.
- Write explicit technical specs before coding when ambiguity exists.

### 2) Subagent / Context Offloading Strategy

- Use parallel context gathering to keep the main execution thread clean.
- Offload search, exploration, and verification passes in parallel where possible.
- For complex tasks, split into focused workstreams and execute independently.
- Keep one clear owner path for final integration and decision-making.

### 3) Self-Improvement Loop

- After any user correction:
  - update `tasks/lessons.md` with:
    - what was wrong
    - root cause
    - prevention rule
- Convert recurring mistakes into explicit local rules.
- Re-read relevant lessons before starting related work.
- Iterate until the same class of mistake stops recurring.

### 4) Verification Before Done

- Never mark a task complete without objective proof.
- Verify behavior differences between baseline and changed paths where relevant.
- Run targeted tests, check logs, and confirm runtime behavior.
- Ask before finalizing: `Would a staff engineer approve this evidence?`

### 5) Demand Elegance (Balanced)

- For non-trivial changes, pause and ask: `Is there a simpler, cleaner design?`
- If a solution is hacky, redesign before shipping.
- Keep simple fixes simple; avoid over-engineering.
- Optimize for minimal, durable, maintainable change.

### 6) Autonomous Bug Fixing

- When given a bug report: diagnose and fix end-to-end.
- Start with failing signals: logs, errors, failing tests.
- Minimize user context-switching; avoid asking for avoidable hand-holding.
- If CI/test failures appear, own them and resolve or clearly isolate blocker causes.

## Task Management Workflow

1. **Plan First**
   - write a checkable plan to `tasks/todo.md`.
2. **Verify Plan**
   - confirm plan validity before implementation.
3. **Track Progress**
   - update task state while executing.
4. **Explain Changes**
   - provide high-level step summaries during work.
5. **Document Results**
   - add review/completion notes to `tasks/todo.md`.
6. **Capture Lessons**
   - append corrections/learning to `tasks/lessons.md`.

## Core Engineering Principles

- **Simplicity first**
  - use the smallest change that correctly solves the problem.
- **No laziness**
  - fix root causes, not temporary patches.
- **Minimal impact**
  - touch only what is required; avoid collateral regressions.

## Definition of Done

A task is done only when all are true:

1. Planned with checkable steps.
2. Implemented with minimal, coherent changes.
3. Verified with concrete evidence (tests/logs/runtime checks).
4. Documented in `tasks/todo.md`.
5. Lessons captured in `tasks/lessons.md` when corrections occurred.
