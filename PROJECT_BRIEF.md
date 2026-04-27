# Project Brief

This file is the one-page identity of the project.

This starter ships with an example brief. Rewrite it for the actual project after cloning.

Use this file for project identity only:
- what kind of project this is
- what problem it exists to solve
- what shape it should grow into

Do not use this file as the current execution contract.
Use phase specs and SEC files for what should be built right now.

Replace the example content below with your actual project, but preserve the structure. The goal is to make future decisions easier by keeping mission, constraints, and phase logic visible in one place.

## Project Name
Northstar

## Mission
Help a small team turn repeated high-friction work into a dependable product, workflow, tool, or system without losing safety, reviewability, or human override.

## Primary User
- small operator teams
- technical founders
- internal platform owners
- any small team trying to make one important loop dependable before broadening scope

## Core Problem
Important work is being handled manually, inconsistently, or without durable process memory. The team needs a system that makes important work more dependable without becoming opaque, over-automated, or collaboration-hostile too early.

## Product Shape
A dependable system that starts narrow, local, and reviewable, then gradually becomes more automated and more broadly usable as trust is earned.

## Constraints
- Technical:
  - keep the first version local-first
  - avoid distributed complexity early
  - prefer plain files and explicit interfaces before heavy infrastructure
- Product:
  - users must be able to understand what the system is doing
  - early value matters more than breadth
  - if work is collaborative, the execution contract must be exportable into repo-visible files
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
- turning the starter into a domain-specific framework

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
  - stronger selection, routing, or disambiguation where the product needs it
- Phase 4:
  - observability once the system is worth measuring
- Phase 5:
  - calibration and correctness hardening
- Phase 6:
  - one bounded production-facing or collaborator-facing interface
- Phase 7:
  - shared, scaled, or broader operational capabilities only after local product value is proven

## Working Rules
- raw ideas do not go straight into implementation
- active phase spec is the implementation contract
- build mode is the default implementation posture
- review mode is required before milestone acceptance
- proof and compaction are mandatory for meaningful milestones
