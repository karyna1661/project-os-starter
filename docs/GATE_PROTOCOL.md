# Gate Protocol

The phase gate script enforces the spec-driven workflow chain. Run it at three checkpoints to prevent the most common failure modes.

## When to Run

### Gate 1: Pre-Implementation (`pre-impl`)

Run **before writing any code** for a phase.

```
./scripts/phase-gate.sh pre-impl
# or on Windows:
.\scripts\phase-gate.ps1 -Gate pre-impl
```

What it checks:
- `ACTIVE_PHASE.md` exists and references a real spec
- Spec status is `Approved`
- Earlier phases are `Verified` (dependency chain intact)
- `SEC.json` is consistent

Why: Prevents implementing from raw ideas, prevents skipping the intake pipeline, prevents building on unverified foundations.

### Gate 2: Pre-Completion (`pre-complete`)

Run **before marking a phase complete** or claiming a milestone.

```
./scripts/phase-gate.sh pre-complete
# or on Windows:
.\scripts\phase-gate.ps1 -Gate pre-complete
```

What it checks:
- Spec status is `Implementing`
- Proof artifacts exist in `verification/`
- Compaction report exists in `docs/compactions/`
- SEC consistency check exists
- Review exists in `docs/reviews/`

Why: Prevents marking phases complete without proof, prevents skipping compaction, prevents skipping review.

### Gate 3: Pre-Demo (`pre-demo`)

Run **before recording a demo** or presenting to others.

```
./scripts/phase-gate.sh pre-demo
# or on Windows:
.\scripts\phase-gate.ps1 -Gate pre-demo
```

What it checks:
- All Gate 2 checks pass
- Spec status is `Verified`
- `MECHANISM_LOG.md` exists (mechanism-debrief completed)
- No unresolved `CRITICAL` or `HIGH` findings in latest review

Why: Prevents demos on unverified code, ensures you can explain what was built.

## Integration with Workflow

### In AGENTS.md

Add to Hard Rules:
```
Run phase-gate before implementation and before phase completion.
```

### In PROJECT_OS_CHECKLIST.md

Add to "Before Implementing Any Meaningful Change":
```
- Run `./scripts/phase-gate.sh pre-impl` (or PowerShell equivalent)
```

Add to "Before Accepting A Milestone":
```
- Run `./scripts/phase-gate.sh pre-complete` (or PowerShell equivalent)
```

### In CI (Optional)

Add to `.github/workflows/gate.yml` to enforce on push:
```yaml
- name: Phase Gate
  run: ./scripts/phase-gate.sh pre-impl
```

## Exit Codes

- `0` — Gate passed, safe to proceed
- `1` — Gate blocked, fix failing checks before proceeding

## Failure Handling

When a gate fails:
1. Read the failing check message
2. Fix the specific issue (create missing file, update status, add proof artifacts)
3. Re-run the gate
4. Do not bypass with `--no-verify` or similar
