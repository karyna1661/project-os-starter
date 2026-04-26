# Contributing

This repository is a template-style project operating system. Contributions should preserve clarity, portability, and project-agnostic usefulness.

## Contribution Standard

Changes should improve one of these:

- phase discipline
- implementation discipline
- review quality
- proof/verification workflow
- compaction/handoff quality
- repo usability for new projects

## Before Opening A Change

1. State the problem clearly
2. Explain why the change belongs in this repo instead of a specific downstream project
3. Keep the solution general-purpose
4. Avoid baking in stack-specific assumptions unless clearly isolated

## What Good Contributions Look Like

- clearer templates
- better review/checklist language
- stronger compaction guidance
- improved onboarding for new projects
- examples that teach the standard without overfitting to one domain

## What To Avoid

- domain-specific product logic
- stack-specific scaffolding as the default path
- adding extra process for its own sake
- turning the starter into a framework generator
- replacing explicit docs with vague meta-language

## Review Standard

This repo uses:

- Build Mode for implementation discipline
- Review Mode for findings-first evaluation

Contributions should be reviewed for:

- clarity
- scope discipline
- portability
- usefulness across project types

## Verification

For documentation-heavy changes, verification can be:

- structural sanity check of affected files
- consistency check against the project OS model
- proof that linked files and references are still correct
