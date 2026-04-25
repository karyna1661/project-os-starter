# Project Brief

This file is the one-page identity of the project.

Replace the example content below with your actual project, but preserve the structure. The goal is to make future decisions easier by keeping mission, constraints, and phase logic visible in one place.

## Project Name
Northstar

## Mission
Help a small team turn repeated internal operational work into a dependable self-serve workflow without losing safety, reviewability, or human override.

## Primary User
- small operator teams
- technical founders
- internal platform owners

## Core Problem
Important work is being repeated manually, inconsistently, and without durable process memory. The team needs a system that can make repeated work easier without becoming opaque or over-automated too early.

## Product Shape
A dependable workflow system that starts local and reviewable, then gradually becomes more automated and more broadly usable as trust is earned.

## Constraints
- Technical:
  - keep the first version local-first
  - avoid distributed complexity early
  - prefer plain files and explicit interfaces before heavy infrastructure
- Product:
  - users must be able to understand what the system is doing
  - early value matters more than breadth
- Time:
  - optimize for fast, phase-based compounding rather than big-bang launches
- Safety:
  - operator override must remain available
  - automation should be gated by proof, not confidence alone

## Non-Goals
- becoming a general-purpose platform immediately
- adding networking before local value is proven
- building dashboards before the core loop is dependable
- hiding uncertainty behind polished output

## Success Signals
- the first useful loop works without manual babysitting
- repeated work becomes faster and less error-prone
- milestone claims are backed by proof artifacts
- the team can pause and resume work without rereading long chat history
- future ideas can be deferred cleanly instead of contaminating the current phase

## Phase Sequence Notes
- Phase 0:
  - execution foundation, local structure, and proof surfaces
- Phase 1:
  - first dependable loop that creates real user value
- Phase 2:
  - bounded expansion without weakening correctness
- Phase 3:
  - stronger matching, selection, routing, or disambiguation
- Phase 4:
  - observability once the system is worth measuring
- Phase 5:
  - calibration and correctness hardening
- Phase 6:
  - one bounded production-facing interface
- Phase 7:
  - shared or scaled capabilities only after local product value is proven

## Working Rules
- raw ideas do not go straight into implementation
- active phase spec is the implementation contract
- build mode is the default implementation posture
- review mode is required before milestone acceptance
- proof and compaction are mandatory for meaningful milestones
