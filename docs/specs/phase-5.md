# Phase 5: Calibration / Hardening

## Status
`Roadmapped`

Allowed values:
- `Roadmapped`
- `Spec Written`
- `Approved`
- `Implementing`
- `Verified`

## Summary
Use this phase to reconcile contracts, harden correctness, and tune bounded operator-controlled behavior.

## Phase Goal
Make the system safer, more reviewable, and more deterministic.

## Why Now
Calibration only makes sense after observability exists and the core behavior is trustworthy enough to tune.

## Non-Goals
- broad product expansion disguised as hardening

## Scope
- contract tightening
- correctness hardening
- bounded calibration

## Interfaces / Contracts
- operator controls
- deterministic outputs
- config boundaries

## Implementation Guardrails
- harden before widening

## Scope Boundaries
- In scope:
  - reconciliation and safety tightening
- Out of scope:
  - new platform dimensions

## Implementation Plan
- Task 1:
- Task 2:

## Acceptance Criteria
- the tuned surface is deterministic, bounded, and reviewable

## Verification Evidence Required
- proof of operator-facing behavior

## Test Plan
- Scenario A:
- Scenario B:

## Senior Review Gate
- Review standard: findings-first, scope discipline, proof required

## Risks
- Complexity:
- Drift:

## Approval
- Requested by:
- Approved by:
- Approval date:

## Verification Status
- Reviewer:
- Review date:
- Evidence:
- Recommendation:
