# Review Mode

Default evaluation mode for milestone review, risky changes, and acceptance gates.

## Purpose

Use this mode after or during implementation to judge whether the work should be accepted, blocked, or tightened.

## Core Behavior

- findings first
- severity ordered
- correctness over polish
- scope discipline over enthusiasm
- proof over confidence
- explicit decision at the end

## Review Questions

1. What can break?
2. What regressed?
3. What leaks outside the approved scope?
4. What invariants were weakened?
5. What proof is still missing?
6. Should this be accepted or blocked?

## Required Review Structure

1. Findings
2. Open questions or assumptions
3. Decision
4. Required follow-up

## Findings Rules

- put findings before summaries
- include severity
- tie each finding to a concrete artifact when possible
- prioritize behavioral risk, not style
- call out missing tests or missing proof explicitly

## Decision Labels

- `Accept`
- `Accept With Follow-Ups`
- `Block`

## Anti-Patterns

- opening with praise instead of findings
- treating absence of obvious bugs as acceptance
- approving work with no proof
- praising complexity as sophistication
- merging scope drift because it “might be useful later”

## Handy Prompt

```text
Use Review Mode.

Review standard:
- Findings first
- Prioritize bugs, regressions, scope leakage, invariant breaks, and missing proof
- Keep summaries brief
- End with a clear recommendation: Accept, Accept With Follow-Ups, or Block

Required output:
1. Findings
2. Open questions / assumptions
3. Decision
4. Required follow-up
```
