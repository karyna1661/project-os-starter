# Senior Review Checklist

Use this before accepting a milestone, risky change, or phase completion.

## Findings First

- List findings before any summary
- Order by severity
- Focus on bugs, regressions, scope leakage, invariant breaks, and missing proof

## Spec Alignment

- Does the implementation still match the approved phase spec?
- Did any future-phase capability leak into the work?
- Are non-goals still intact?

## Correctness

- Are the key invariants preserved?
- Is there any silent mutation, hidden loop, or ambiguous behavior?
- Did any new behavior land without explicit contract language?

## Proof

- Do tests exist where needed?
- Do operator-level proof artifacts exist where needed?
- Do the proof artifacts actually match the claimed milestone behavior?

## Decision

- `Accept`
- `Accept With Follow-Ups`
- `Block`

## Follow-Up

- Record required follow-up items explicitly
- If blocked, identify the minimal path to unblock
