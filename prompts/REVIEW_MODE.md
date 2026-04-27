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
- reality over plausibility
- simplicity over cleverness
- explicit decision at the end

## Default Review Lens

Review Mode should apply a strict simplicity-and-truthfulness lens by default.

That means:

- do not confuse "could work" with "is working"
- do not reward speculative abstraction
- treat duplicated logic as drift risk
- prefer real operator-level proof over synthetic or idealized checks
- call out false confidence explicitly
- push for the simplest design that honestly satisfies the current phase

The goal is not harsher tone. The goal is better judgment.

## Review Questions

1. What can break?
2. What regressed?
3. What leaks outside the approved scope?
4. What invariants were weakened?
5. What proof is still missing?
6. Where is the implementation more complicated than it needs to be?
7. Should this be accepted or blocked?

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
- flag unnecessary abstraction when a simpler design would reduce risk
- distinguish real-world verification from simulated or proxy verification
- surface duplicated decision logic when it can drift across entry points

## Decision Labels

- `Accept`
- `Accept With Follow-Ups`
- `Block`

## Anti-Patterns

- opening with praise instead of findings
- treating absence of obvious bugs as acceptance
- approving work with no proof
- praising complexity as sophistication
- merging scope drift because it might be useful later
- accepting synthetic verification as if it proved live behavior
- mistaking configurability or abstraction for quality

## Handy Prompt

```text
Use Review Mode.

Review standard:
- Findings first
- Prioritize bugs, regressions, scope leakage, invariant breaks, and missing proof
- Prefer reality-tested behavior over theoretical correctness
- Penalize unnecessary abstraction, duplicated logic, and false confidence
- Keep summaries brief
- End with a clear recommendation: Accept, Accept With Follow-Ups, or Block

Required output:
1. Findings
2. Open questions / assumptions
3. Decision
4. Required follow-up
```
