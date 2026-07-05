---
name: security-audit
description: Systematic security audit for codebases. Checks for exposed secrets, SQL injection, IDOR, race conditions, hardcoded credentials, and insecure defaults. Use when the user says "security audit", "check for vulnerabilities", "find security issues", "hardcode check", or before any production deployment.
---

# Security Audit

Systematically scan a codebase for common security vulnerabilities. Works on any language.

## When to run

- Before any production deployment
- Before making a repo public
- After major feature additions
- When user says "security check" or "audit for vulnerabilities"
- Before hackathon submission (public repos get scanned)

## Workflow

### Phase 1: Secrets and credentials

Scan for:
- Hardcoded API keys, tokens, passwords
- `.env` files committed to repo
- Credentials in config files
- Private keys in source code
- Connection strings with embedded passwords

Pattern examples:
```
grep -r "sk_live\|sk_test\|api_key\|password\|secret\|token\|credential" --include="*.{ts,js,py,rs,go,json,yaml,toml}"
grep -r "-----BEGIN.*PRIVATE KEY-----"
ls -la .env*
```

### Phase 2: Injection vulnerabilities

Check for:
- SQL injection (string concatenation in queries)
- Command injection (shell exec with user input)
- Path traversal (user-controlled file paths)
- Template injection

Pattern examples:
```
grep -r "query.*+\|execute.*f\"\|os\.system\|exec(" --include="*.{ts,js,py,rs}"
grep -r "readFile.*req\|open.*user" --include="*.{ts,js,py}"
```

### Phase 3: Authentication and authorization

Check for:
- IDOR (Insecure Direct Object Reference) — can user A access user B's data by changing an ID?
- Missing auth checks on endpoints
- Hardcoded user IDs or roles
- Missing rate limiting on sensitive endpoints
- Session fixation or missing secure flags

### Phase 4: Race conditions

Check for:
- Check-then-act patterns without locks
- Shared state mutations without atomicity
- Double-spend vulnerabilities in payment flows
- Non-idempotent operations that should be idempotent

### Phase 5: Data exposure

Check for:
- Sensitive data in logs
- Error messages that leak internals
- Stack traces in production responses
- PII stored without encryption
- Overly permissive CORS

### Phase 6: Report

Output structured findings:

```
## Security Audit

### CRITICAL
| File | Line | Issue | Impact |
|---|---|---|---|
| src/api/pay.ts | 42 | IDOR: no ownership check | Any user can access any payment |

### HIGH
| File | Line | Issue | Impact |
|---|---|---|---|
| src/db/query.ts | 15 | SQL injection via string concat | Data exfiltration |

### MEDIUM
| File | Line | Issue | Impact |
|---|---|---|---|
| src/auth.ts | 88 | No rate limiting on login | Brute force possible |

### LOW
| File | Line | Issue | Impact |
|---|---|---|---|
| src/utils.ts | 3 | Debug log in production | Information leakage |
```

## Rules

- Report first, fix only with approval
- Distinguish real vulnerabilities from theoretical ones
- Prioritize by actual impact, not theoretical severity
- Check for the specific patterns we've been burned by: IDOR, race conditions, hardcoded URLs, handle collision
