# Project OS Starter

Project-agnostic operating system for LLM-assisted engineering.

Use this as the first repo you clone when starting something new. It gives you a disciplined way to:

- gate ideas before they disrupt the build
- define work phase-by-phase
- implement with a clear default execution style
- review with findings-first discipline
- keep proof and milestone state durable

It is designed for:

- software products
- AI/agent systems
- infra/platform projects
- research-heavy builds
- internal tools
- solo founder projects

## What It Includes

- phase-gated build system
- Build Mode for implementation
- Review Mode for evaluation
- proof-first verification structure
- compaction workflow for resumable milestones
- optional Shared Execution Context (SEC) layer for multi-developer or multi-agent collaboration

## Core Model

The operating loop is:

1. Idea enters through the intake pipeline
2. Pipeline decides `BUILD NOW`, `DEFER`, or `REJECT`
3. Approved work is defined in a phase spec
4. Build Mode implements only the approved scope
5. Review Mode checks findings, regressions, invariants, and proof
6. Verification artifacts prove behavior
7. Compactions preserve resumable project state

For the deeper model, including SEC and the private-OS vs committed-context split, read [docs/OS.md](docs/OS.md).

## Quick Start

1. Edit [PROJECT_BRIEF.md](PROJECT_BRIEF.md)
2. Update [README.md](README.md) with the real project identity
3. Fill in [docs/specs/phase-0.md](docs/specs/phase-0.md)
4. Decide which phase is active
5. Read [PROJECT_UPGRADE_PIPELINE.md](PROJECT_UPGRADE_PIPELINE.md)
6. If the repo is collaborative, set up the SEC files under `docs/`
7. Use [prompts/BUILD_MODE.md](prompts/BUILD_MODE.md) as the default way of building
8. Use [prompts/REVIEW_MODE.md](prompts/REVIEW_MODE.md) before accepting meaningful work

## Shared Execution Context

SEC is the repo-visible collaboration layer for teams or multiple agents.

Core SEC files:

- `docs/BUILD_CONTEXT.md`
- `docs/PHASE_RULES.md`
- `docs/NEXT_STEPS.md`
- `docs/TASK_BOARD.md`
- `docs/DEV_RULES.md`

If collaborators or agents are working from the repo without access to the full private Project OS:

- SEC must exist in the repo
- SEC must be committed
- SEC becomes the shared execution contract for current work

Read the full SEC explanation in [docs/OS.md](docs/OS.md).

## Repo Layout

- `PROJECT_UPGRADE_PIPELINE.md`
  - intake firewall for ideas and phase mapping
- `PROJECT_BRIEF.md`
  - one-page project identity and constraints
- `PROJECT_PHASE_BACKLOG.md`
  - deferred ideas grouped by future phase
- `PROJECT_OS_CHECKLIST.md`
  - day-1 and milestone operating checklist
- `docs/specs/`
  - one phase spec per phase
- `docs/compactions/`
  - durable milestone reports and compaction protocol
- `docs/reviews/`
  - review artifacts and review decisions
- `docs/templates/`
  - copy-ready templates for specs, reviews, SEC, and compactions
- `prompts/`
  - Build Mode and Review Mode prompt files
- `verification/`
  - proof artifacts, command traces, screenshots, notes, and outputs

## Day 1

1. Rename project-facing files as needed, or keep the defaults.
2. Edit `PROJECT_BRIEF.md` with your mission, user, constraints, and phase sequence.
3. Edit `README.md` with your project identity and mission.
4. Fill in `docs/specs/phase-0.md` and mark only the active phase as ready for writing.
5. If the repo is collaborative, fill in the SEC files under `docs/`.
6. Put all new ideas through `PROJECT_UPGRADE_PIPELINE.md`.
7. Use `prompts/BUILD_MODE.md` as the default implementation style.
8. Use `prompts/REVIEW_MODE.md` before accepting meaningful work.

## Default Workflow

- Default implementation posture: `Build Mode`
- Default evaluation posture: `Review Mode`
- Default milestone rule: no milestone is real without proof and compaction

## Example Artifacts

Examples are included so the standard is visible immediately:

- [PROJECT_BRIEF.md](PROJECT_BRIEF.md)
- [docs/specs/example-phase-1.md](docs/specs/example-phase-1.md)
- [docs/reviews/example-review-phase-1.md](docs/reviews/example-review-phase-1.md)
- [docs/compactions/example-compaction.md](docs/compactions/example-compaction.md)
- [docs/BUILD_CONTEXT.md](docs/BUILD_CONTEXT.md)
- [docs/PHASE_RULES.md](docs/PHASE_RULES.md)
- [docs/NEXT_STEPS.md](docs/NEXT_STEPS.md)
- [docs/TASK_BOARD.md](docs/TASK_BOARD.md)
- [docs/DEV_RULES.md](docs/DEV_RULES.md)

You can keep these as references or replace them once the project has real artifacts.

## Repo-Ready Files

- [AGENTS.md](AGENTS.md)
- [LICENSE](LICENSE)
- [.gitignore](.gitignore)
- [docs/templates/phase-start-checklist.md](docs/templates/phase-start-checklist.md)
- [docs/templates/review-checklist.md](docs/templates/review-checklist.md)
