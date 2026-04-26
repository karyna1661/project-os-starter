# SEC_CONSISTENCY_CHECK

Use this checklist before milestone acceptance or when collaborative repo context may have drifted.

## Metadata
- Status: Example
- Last Updated: 2026-04-26
- Owner: repo maintainer
- Reviewed By: unreviewed-example
- Source Of Truth: starter example only; replace in a real project

## Checks
- `docs/specs/ACTIVE_PHASE.md` points to the real current phase
- `docs/SEC.json` points to the same active phase and file set
- `docs/BUILD_CONTEXT.md` describes the same current phase as `ACTIVE_PHASE.md`
- `docs/PHASE_RULES.md` matches what is allowed in the active phase
- `docs/NEXT_STEPS.md` reflects what should actually happen next
- `docs/TASK_BOARD.md` has clear owners for every task in `In Progress`
- `docs/DEV_RULES.md` still matches how collaborators are expected to behave
- `docs/DEFINITION_OF_DONE.md` still matches how completion is judged, if used

## If Any Check Fails
- update the stale SEC file in the same change
- do not rely on private planning context to bridge the gap
- commit the SEC correction before or alongside implementation changes that depend on it
