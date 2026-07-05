---
name: external-verification
description: Verify claims about external services, APIs, pricing, and requirements via web search before presenting them as facts. Use when the agent is about to state something about an external service, API capability, pricing, signup requirement, or third-party behavior. Prevents presenting assumptions as verified facts.
---

# External Verification

Never present assumptions about external services as facts. Verify via web search first.

## When to run

- Before stating API capabilities or limitations
- Before claiming pricing or free tier details
- Before saying "you need to register" or "no registration required"
- Before recommending a service or tool
- When user says "verify that" or "don't assume" or "use Fire Claw"

## The rule

**User's explicit directive:** "Don't just give suggestions without verifying. Use Fire Claw to confirm your assumptions. I don't want you to just give suggestions that can be verified online."

## Workflow

### Before making any external claim

1. **Identify the claim** — What am I about to say as fact?
2. **Check if it's verifiable** — Can I confirm this via official documentation?
3. **Fetch the source** — Get the official docs, not blog posts or forum answers
4. **Cite the source** — Always include the URL where you verified it
5. **Present with confidence level** — Verified vs "last known" vs "unverified"

### What requires verification

- API endpoints and their capabilities
- Authentication requirements (token needed? registration required?)
- Rate limits and quotas
- Free tier vs paid tier distinctions
- Pricing changes (services change pricing frequently)
- SDK versions and compatibility
- Deployment requirements (credit card needed? free tier available?)

### What doesn't require verification

- Well-known programming concepts
- Language syntax and standard library
- Code you just wrote and tested locally
- Mathematical formulas

## Output format

When presenting external claims, always include:

```
**Verified:** [claim] ([source](url))
```

or

```
**Last known:** [claim] — verify before relying on this
```

or

```
**Unverified:** [claim] — I haven't confirmed this
```

## Examples

### Bad
> "Alibaba Cloud free tier doesn't require a credit card."

### Good
> "Qwen Cloud (the AI API) has a free tier with no payment required ([source](https://docs.qwencloud.com/resources/free-quota)). However, Alibaba Cloud infrastructure services (ECS, Function Compute) may require credit card verification — I haven't confirmed the current requirement."

## Rules

- Never assume facts about external services
- Official docs > blog posts > forum answers > "I think"
- If you can't verify, say so explicitly
- Re-verify periodically — services change
- User caught agent pushing unverified hackathon post claims (wrong token expiry, wrong field name) — always check OpenAPI spec or official docs
