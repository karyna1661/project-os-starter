# DEV_RULES

This file is meant to be committed when private Project OS context is not shared.

## Metadata
- Status: <active|draft|example>
- Last Updated: <YYYY-MM-DD>
- Owner: <owner>
- Reviewed By: <reviewer or review state>
- Source Of Truth: commit the real SEC version of this file when private Project OS context is not shared

## General Rules
- do not refactor unrelated code
- do not introduce new architecture unless required by the approved scope
- keep changes minimal and focused
- follow existing repo patterns before inventing new ones
- prefer explicit simple implementations over speculative abstraction

## Collaboration Rules
- read the active phase spec before implementing
- read the Shared Execution Context (SEC) files before implementing when they exist
- update shared context when implementation-affecting decisions change
- keep ownership boundaries clear when multiple collaborators are active

## Verification Rules
- do not call work done without verification
- match proof claims to actual artifacts
