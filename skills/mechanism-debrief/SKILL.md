---
name: mechanism-debrief
description: Use this skill whenever an agent finishes building, generating, or substantially modifying a component, feature, or module — especially when the user is directing an AI agent to implement something rather than writing it themselves. Also trigger this when the user asks "can you explain what we built," "walk me through this," is preparing a demo or interview explanation of a project, or is doing a redesign/refactor of existing AI-generated code. The point is to force a mechanism-level explanation (not a code read-through) immediately after implementation, before moving to the next component, so the user never accumulates a system they directed but can't narrate. Trigger proactively after any non-trivial build step even if the user doesn't ask.
---

# Mechanism Debrief

## The problem this solves

Directing an AI agent to build something gives you understanding of the *what* (the goal, the architecture you specified) but not automatically the *how* (the actual mechanism that delivers it). That gap is invisible until you're in a demo, an interview, or a redesign — at which point you discover you can defend the blueprint but not the machine. Redesigns are the worst trigger point: they touch the seams between components, which is exactly what gets skipped if each piece was only ever understood in isolation.

The fix is not "read more code." It's a short, structured debrief immediately after each component lands, that extracts the *runtime story* — not syntax — and stores it so it accumulates into a demo script instead of evaporating.

## When to run this

- Right after the agent finishes a discrete, working component (a loop, an integration, a pipeline stage, an API route, a scoring function, an MCP tool call, etc.) — don't wait for the user to ask.
- Before the user says "ok next" and moves to the next component.
- Before any redesign/refactor of existing AI-generated code — run it on the *current* implementation first, so the redesign is grounded in actual understanding rather than the original blueprint in the user's head.
- When the user is prepping a demo or explaining a project to a non-technical audience.

## How to run the debrief

Do not paste code and call it an explanation. Walk through these in plain language, one at a time, as a short back-and-forth — not a wall of text dumped at once:

1. **Trigger** — What event or call actually starts this component running? (a function call, a webhook, a cron tick, a message arriving)
2. **Inputs** — What data does it receive, and where does that data come from (which other component, an external API, a user action)?
3. **Core transformation** — What is the one or two-step thing it actually *does* to the input? Name the specific function/method responsible if there's a clear one — not to memorize syntax, but so the user has a hook to point to.
4. **Decision points** — Where does it branch, and on what condition? (This is usually where "the LLM decides" vs "deterministic logic decides" lives — surface that distinction explicitly, since it's often the most demo-worthy detail.)
5. **Output / handoff** — What does it produce, and which component or system consumes that next?
6. **Failure mode** — What happens if this component fails or gets bad input? (Even a one-line answer here makes someone sound like they understand production concerns.)

Ask the user to restate step 3 and step 4 back in their own words before moving on. If they can't, that's the actual gap — stay there, don't proceed. This is the one non-negotiable check: a debrief that ends without the user successfully restating the core transformation and decision points has not done its job.

Keep total debrief to 5-10 minutes of exchange. This is a checkpoint, not a tutorial.

## Output: append to a running project narration log

After each debrief, append a short entry to a file in the project's working directory (create it if it doesn't exist): `MECHANISM_LOG.md`

Format per entry:

```
## [Component name]
- Trigger: ...
- Inputs: ...
- Core transformation: ...
- Decision point(s): ...
- Output/handoff: ...
- Failure mode: ...
- (one sentence, in plain English, suitable for saying out loud to a non-technical interviewer)
```

This file is the point. By the time a project ships, `MECHANISM_LOG.md` is the demo script and the interview answer key, built incrementally instead of reconstructed under pressure right before a deadline.

## Special case: redesigns

If the user is about to redesign/refactor something, run the debrief on the *current state* of the code first, even if it was built a while ago and even if the user seems unsure whether they "still need this." The redesign conversation should start from a debrief, not from the original intent — the two have often drifted apart, and that drift is usually exactly where comprehension was lost the first time.

## Tone

This is collaborative, not a quiz to make the user feel exposed. Frame it as "let's lock this in while it's fresh" rather than "do you actually understand this." If the user gets a step wrong or vague, that's useful signal, not a failure — flag it plainly and re-explain, then have them restate again. 