# Project OS Checklist

## Day 1 Setup

- Define the project mission in `README.md`
- Decide the initial phase sequence in `docs/specs/`
- Mark only the active phase as `Approved` when it is truly ready
- Keep all raw ideas out of implementation until triaged
- If the repo is collaborative, initialize the Shared Execution Context (SEC) files under `docs/`
- If the full Project OS stays private, make sure SEC is committed as the shared collaboration contract
- Adopt `prompts/BUILD_MODE.md` as default implementation behavior
- Adopt `prompts/REVIEW_MODE.md` for milestone review
- Decide where proof artifacts will live under `verification/`

## Before Implementing Any Meaningful Change

- Check the active phase
- Read the relevant phase spec
- Re-state assumptions
- Define a simple success check
- Confirm the change belongs to this phase
- Confirm non-goals are still intact
- If the work changes shared execution behavior, update the SEC files
- If collaborators depend on repo context, make sure the SEC updates are committed

## Before Accepting A Milestone

- Proof artifacts exist
- Review findings have been addressed or explicitly accepted
- The spec still matches the implementation
- The phase status is updated honestly
- The SEC files still reflect what collaborators should do now
- A compaction report exists

## Red Flags

- Building from a chat idea without phase mapping
- "Small" changes entering without a spec
- Broad refactors justified as cleanup
- Tests passing but no operator-level proof
- No compaction after major work
- Repo-visible collaboration rules drifting away from actual work
- Review summary before findings
- Status documents drifting out of sync
