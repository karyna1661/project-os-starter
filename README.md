# Project OS Starter

Project-agnostic operating system for LLM-assisted engineering.

This repo is meant to be cloned first when you start something new. It gives you a durable build discipline so the project compounds instead of drifting.

Use it when you want:

- spec-first execution instead of improvisation
- a clear boundary between current work and future ideas
- disciplined implementation with low LLM thrash
- findings-first review before accepting milestones
- proof artifacts that back up claims
- resumable context for long-running projects

This starter is intentionally project-agnostic. It works for:

- software products
- AI/agent systems
- infra/platform projects
- research-heavy builds
- internal tools
- solo founder projects
- experimental product ideas that need discipline early

## Core Model

The operating loop is:

1. Idea enters through the intake pipeline
2. Pipeline decides `BUILD NOW`, `DEFER`, or `REJECT`
3. Approved work is defined in a phase spec
4. Build Mode implements only the approved scope
5. Review Mode checks findings, regressions, invariants, and proof
6. Verification artifacts prove behavior
7. Compactions preserve resumable project state

## First 15 Minutes

If you just cloned this repo for a new project:

1. Edit [PROJECT_BRIEF.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/PROJECT_BRIEF.md)
2. Update [README.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/README.md) with the real project identity
3. Fill in [docs/specs/phase-0.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/docs/specs/phase-0.md)
4. Decide which phase is active and which ones are only placeholders
5. Read [PROJECT_UPGRADE_PIPELINE.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/PROJECT_UPGRADE_PIPELINE.md)
6. Use [prompts/BUILD_MODE.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/prompts/BUILD_MODE.md) as the default way of building
7. Use [prompts/REVIEW_MODE.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/prompts/REVIEW_MODE.md) before accepting anything meaningful

If you only do those seven things, the repo already starts acting like a real project OS.

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
  - copy-ready templates for specs, reviews, and compactions
- `prompts/`
  - Build Mode and Review Mode prompt files
- `verification/`
  - proof artifacts, command traces, screenshots, notes, and outputs

## How To Use This

### Day 1

1. Rename project-facing files as needed, or keep the defaults.
2. Edit `PROJECT_BRIEF.md` with your mission, user, constraints, and phase sequence.
3. Edit `README.md` with your project identity and mission.
4. Fill in `docs/specs/phase-0.md` and mark only the active phase as ready for writing.
4. Put all new ideas through `PROJECT_UPGRADE_PIPELINE.md`.
5. Use `prompts/BUILD_MODE.md` as the default implementation style.
6. Use `prompts/REVIEW_MODE.md` before accepting meaningful work.

### Every New Idea

1. Run it through `PROJECT_UPGRADE_PIPELINE.md`
2. Either:
   - build it now
   - defer it to `PROJECT_PHASE_BACKLOG.md`
   - reject it

### Every Meaningful Milestone

1. Produce proof in `verification/`
2. Run Review Mode
3. Write a compaction in `docs/compactions/`

## Recommended Default Workflow

- Default implementation posture: `Build Mode`
- Default evaluation posture: `Review Mode`
- Default milestone rule: no milestone is real without proof and compaction

## Customization Rules

This starter should be customized in these places first:

- project identity in `PROJECT_BRIEF.md`
- project mission and constraints in `README.md`
- phase sequence in `docs/specs/`
- project-specific invariants inside each phase spec
- verification commands in each phase spec
- allowlists, deployment rules, or safety constraints if relevant

Avoid customizing away the operating discipline unless you have a good reason.

The starter is strongest when it stays opinionated about:

- spec-first implementation
- explicit non-goals
- proof over vibes
- findings-first review
- resumable milestone state

## Included Examples

This starter includes three concrete examples so the standard is visible immediately:

- [PROJECT_BRIEF.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/PROJECT_BRIEF.md)
  - polished example project brief
- [docs/specs/example-phase-1.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/docs/specs/example-phase-1.md)
  - filled example phase spec
- [docs/reviews/example-review-phase-1.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/docs/reviews/example-review-phase-1.md)
  - findings-first example review artifact
- [docs/compactions/example-compaction.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/docs/compactions/example-compaction.md)
  - example milestone compaction

## Final Repo-Ready Files

This starter now also includes:

- [AGENTS.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/AGENTS.md)
  - default instructions for future agents
- [LICENSE](/c:/Users/hp/Downloads/regen-engine/project-os-starter/LICENSE)
  - MIT starter license
- [.gitignore](/c:/Users/hp/Downloads/regen-engine/project-os-starter/.gitignore)
  - common ignores for general project use
- [docs/templates/phase-start-checklist.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/docs/templates/phase-start-checklist.md)
  - start-of-phase checklist
- [docs/templates/review-checklist.md](/c:/Users/hp/Downloads/regen-engine/project-os-starter/docs/templates/review-checklist.md)
  - senior review checklist

You can keep these as references or replace them once the project has real artifacts.
