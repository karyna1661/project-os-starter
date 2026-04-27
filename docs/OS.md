# Project OS Concepts

This document explains the deeper operating model behind Project OS Starter.

Use the [README.md](../README.md) for fast onboarding.
Use this file when you want to understand the system more deeply.

## What This System Is For

Project OS Starter is designed to make long-running builds compound instead of drift.

It does that by separating concerns that usually get blurred together:

- project identity
- idea intake
- current-phase scope
- implementation behavior
- review standards
- proof
- milestone state

## Why The Starter Exists

Projects go bad when:

- good ideas become current work too early
- implementation outruns the spec
- review happens against vibes instead of contracts
- proof is weaker than the milestone claim
- context lives only in private chat history

This starter is meant to reduce those failure modes.

The separation matters:

- `PROJECT_BRIEF.md` defines project identity and strategic shape
- `README.md` explains the starter repo and onboarding flow
- phase specs define approved phase scope
- SEC files define the shared execution contract for current work

## Build Mode And Review Mode

The repo uses two complementary working modes:

### Build Mode

Build Mode is the default execution discipline.

It emphasizes:

- naming assumptions
- choosing the simplest valid path
- making surgical changes
- avoiding speculative abstraction
- defining success as a concrete verification check

### Review Mode

Review Mode is the default evaluation discipline.

It emphasizes:

- findings first
- bugs and regressions over polish
- scope leakage detection
- invariant checking
- proof over confidence
- reality-tested behavior over plausible behavior
- simplicity over unnecessary abstraction

Build Mode helps you do the work well.
Review Mode helps you judge the work honestly.

## Shared Execution Context (SEC)

The Shared Execution Context is a lightweight layer that enables multiple developers or agents to work on the same repository with aligned context, constraints, and execution direction.

It consists of:

- `docs/SEC.json` -> machine-readable SEC summary for agents
- `docs/BUILD_CONTEXT.md` -> what we are building now
- `docs/PHASE_RULES.md` -> what is allowed / not allowed
- `docs/NEXT_STEPS.md` -> what to do next
- `docs/TASK_BOARD.md` -> who is doing what
- `docs/DEV_RULES.md` -> how to behave in the repo

SEC core files are the shared execution contract.

Optional companion artifact:

- `docs/DEFINITION_OF_DONE.md` -> what counts as complete

`DEFINITION_OF_DONE.md` is not part of SEC core.
It is a companion artifact that strengthens completion standards once execution context is already clear.

## Private Project OS vs Committed SEC

This starter assumes a practical compromise:

- the full private Project OS may remain outside the repo
- the Shared Execution Context must be exported into the repo when collaborators depend on it

That means:

- private planning can stay private
- committed SEC becomes the collaboration contract

## SEC Rule

If a decision affects how another collaborator or agent should build, it must exist in the repo in a shared contract form.

If the full private Project OS is not committed, SEC must be committed instead.

Without that export:

- collaborators re-interpret the repo from scratch
- phase boundaries drift
- future work leaks into current work
- duplicated work becomes more likely

## Recommended Reading Order For Agents

When an agent enters a collaborative repo, the recommended order is:

1. `ACTIVE_PHASE.md` if present, otherwise determine the active phase from `docs/specs/`
2. `SEC.json` if present
3. `BUILD_CONTEXT.md`
4. `PHASE_RULES.md`
5. `NEXT_STEPS.md`
6. `TASK_BOARD.md`
7. `DEV_RULES.md`
8. `DEFINITION_OF_DONE.md` if present

This keeps interpretation cost low and reduces the chance of acting on stale or incomplete context.

## SEC Freshness

SEC becomes more trustworthy when it includes freshness metadata.

At minimum, SEC should carry:

- status
- last updated date
- owner
- reviewer or review state
- source-of-truth note

This starter models that freshness information in `docs/SEC.json` and in the metadata headers of the SEC example files.

## What SEC Is Not

SEC is not:

- the full project strategy archive
- the full phase history
- a substitute for phase specs
- a substitute for review
- a place to dump every internal thought

SEC should stay lightweight and execution-oriented.

## Philosophy

The system works best when:

- the pipeline decides if an idea should enter now
- the spec defines what the current phase is
- Build Mode implements only that
- Review Mode judges whether it is good enough
- verification proves behavior
- compaction preserves state for the next session
- SEC exports only the shared execution surface needed by collaborators

That separation is the point.
