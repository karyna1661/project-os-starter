#!/usr/bin/env bash
# Phase Gate Script
# Validates the spec-driven workflow chain at any checkpoint.
# Run before implementation, before phase completion, and before demos.

set -euo pipefail

GATE="${1:-}"
if [[ -z "$GATE" ]] || [[ ! "$GATE" =~ ^(pre-impl|pre-complete|pre-demo)$ ]]; then
    echo "Usage: ./phase-gate.sh <pre-impl|pre-complete|pre-demo>"
    exit 1
fi

FAILED=0
PASSED=0

pass() {
    echo "  [PASS] $1"
    PASSED=$((PASSED + 1))
}

fail() {
    echo "  [FAIL] $1 — $2"
    FAILED=$((FAILED + 1))
}

get_spec_status() {
    local spec_path="$1"
    [[ -f "$spec_path" ]] || { echo ""; return; }
    grep -oP '`\K(Roadmapped|Spec Written|Approved|Implementing|Verified)' "$spec_path" | head -1
}

get_active_spec() {
    local active_path="docs/specs/ACTIVE_PHASE.md"
    [[ -f "$active_path" ]] || { echo ""; return; }
    grep -oP 'docs/specs/\K[^\s`]+\.md' "$active_path" | head -1
}

get_active_phase_num() {
    local spec
    spec=$(get_active_spec)
    echo "$spec" | grep -oP 'phase-\K\d+' | head -1
}

echo ""
echo "=== Phase Gate: $GATE ==="
echo ""

# --- Gate 1: Pre-Implementation ---
if [[ "$GATE" == "pre-impl" ]]; then
    echo "Gate 1: Pre-Implementation Checks"
    echo ""

    ACTIVE_PATH="docs/specs/ACTIVE_PHASE.md"
    if [[ -f "$ACTIVE_PATH" ]]; then
        pass "ACTIVE_PHASE.md exists"
    else
        fail "ACTIVE_PHASE.md exists" "Create docs/specs/ACTIVE_PHASE.md"
    fi

    SPEC_PATH="docs/specs/$(get_active_spec)"
    if [[ -n "$(get_active_spec)" ]] && [[ -f "$SPEC_PATH" ]]; then
        pass "ACTIVE_PHASE.md references a valid spec"
    else
        fail "ACTIVE_PHASE.md references a valid spec" "Fix the spec path in ACTIVE_PHASE.md"
        echo ""
        echo "=== Results ==="
        echo "  Passed: $PASSED"
        echo "  Failed: $FAILED"
        echo ""
        echo "GATE BLOCKED"
        exit 1
    fi

    STATUS=$(get_spec_status "$SPEC_PATH")
    if [[ "$STATUS" == "Approved" ]]; then
        pass "Spec status is 'Approved'"
    else
        fail "Spec status is 'Approved'" "Current status: '$STATUS' — spec must be Approved before implementation"
    fi

    # Check earlier phases are verified
    ACTIVE_NUM=$(get_active_phase_num)
    if [[ -n "$ACTIVE_NUM" ]] && [[ "$ACTIVE_NUM" -gt 0 ]]; then
        for ((i=0; i<ACTIVE_NUM; i++)); do
            PREV_SPEC="docs/specs/phase-$i.md"
            if [[ -f "$PREV_SPEC" ]]; then
                PREV_STATUS=$(get_spec_status "$PREV_SPEC")
                if [[ "$PREV_STATUS" == "Verified" ]]; then
                    pass "Phase $i is Verified"
                else
                    fail "Phase $i is Verified" "Phase $i status: '$PREV_STATUS' — earlier phases must be verified first"
                fi
            fi
        done
    fi

    # Check SEC.json
    if [[ -f "docs/SEC.json" ]]; then
        if grep -q '"active_phase"' "docs/SEC.json"; then
            pass "SEC.json has active_phase field"
        else
            fail "SEC.json has active_phase field" "SEC.json missing active_phase field"
        fi
    fi
fi

# --- Gate 2: Pre-Completion ---
if [[ "$GATE" == "pre-complete" ]]; then
    echo "Gate 2: Pre-Completion Checks"
    echo ""

    SPEC_PATH="docs/specs/$(get_active_spec)"
    if [[ -z "$(get_active_spec)" ]] || [[ ! -f "$SPEC_PATH" ]]; then
        echo "  [SKIP] No active phase spec found"
    else
        STATUS=$(get_spec_status "$SPEC_PATH")
        if [[ "$STATUS" == "Implementing" ]]; then
            pass "Spec status is 'Implementing'"
        else
            fail "Spec status is 'Implementing'" "Current status: '$STATUS'"
        fi

        # Check proof artifacts
        PHASE_NUM=$(get_active_phase_num)
        HAS_PROOF=false
        for dir in "verification/phase-$PHASE_NUM-proof" "verification/phase-$PHASE_NUM" "verification/proof"; do
            if [[ -d "$dir" ]] && [[ -n "$(ls -A "$dir" 2>/dev/null)" ]]; then
                HAS_PROOF=true
            fi
        done
        if $HAS_PROOF; then
            pass "Proof artifacts exist in verification/"
        else
            fail "Proof artifacts exist in verification/" "Add proof artifacts to verification/phase-$PHASE_NUM-proof/"
        fi

        # Check compaction
        HAS_COMPACTION=false
        if [[ -d "docs/compactions" ]]; then
            COUNT=$(find docs/compactions -name "*.md" ! -name "PROTOCOL.md" ! -name "INDEX.md" ! -name "README.md" | wc -l)
            if [[ "$COUNT" -gt 0 ]]; then
                HAS_COMPACTION=true
            fi
        fi
        if $HAS_COMPACTION; then
            pass "Compaction report exists"
        else
            fail "Compaction report exists" "Write a compaction to docs/compactions/ after phase completion"
        fi

        # Check SEC consistency
        if [[ -f "docs/SEC_CONSISTENCY_CHECK.md" ]]; then
            pass "SEC_CONSISTENCY_CHECK.md exists"
        else
            fail "SEC_CONSISTENCY_CHECK.md exists" "Create docs/SEC_CONSISTENCY_CHECK.md"
        fi

        # Check review
        HAS_REVIEW=false
        if [[ -d "docs/reviews" ]]; then
            COUNT=$(find docs/reviews -name "*.md" ! -name "README.md" | wc -l)
            if [[ "$COUNT" -gt 0 ]]; then
                HAS_REVIEW=true
            fi
        fi
        if $HAS_REVIEW; then
            pass "Review exists in docs/reviews/"
        else
            fail "Review exists in docs/reviews/" "Run a review using prompts/REVIEW_MODE.md and save to docs/reviews/"
        fi
    fi
fi

# --- Gate 3: Pre-Demo ---
if [[ "$GATE" == "pre-demo" ]]; then
    echo "Gate 3: Pre-Demo Checks"
    echo ""

    SPEC_PATH="docs/specs/$(get_active_spec)"
    if [[ -z "$(get_active_spec)" ]] || [[ ! -f "$SPEC_PATH" ]]; then
        echo "  [SKIP] No active phase spec found"
    else
        STATUS=$(get_spec_status "$SPEC_PATH")
        if [[ "$STATUS" == "Verified" ]]; then
            pass "Spec status is 'Verified'"
        else
            fail "Spec status is 'Verified'" "Current status: '$STATUS'"
        fi

        # Check MECHANISM_LOG.md
        if [[ -f "MECHANISM_LOG.md" ]]; then
            pass "MECHANISM_LOG.md exists"
        else
            fail "MECHANISM_LOG.md exists" "Run mechanism-debrief skill to create MECHANISM_LOG.md"
        fi

        # Check latest review for CRITICAL/HIGH
        if [[ -d "docs/reviews" ]]; then
            LATEST=$(find docs/reviews -name "*.md" ! -name "README.md" -printf '%T@ %p\n' 2>/dev/null | sort -rn | head -1 | cut -d' ' -f2-)
            if [[ -n "$LATEST" ]]; then
                if grep -qiE "CRITICAL|severity: critical" "$LATEST"; then
                    fail "No unresolved CRITICAL findings" "Resolve CRITICAL findings in latest review before demo"
                else
                    pass "No unresolved CRITICAL findings"
                fi
                if grep -qiE "HIGH|severity: high" "$LATEST"; then
                    fail "No unresolved HIGH findings" "Resolve HIGH findings in latest review before demo"
                else
                    pass "No unresolved HIGH findings"
                fi
            fi
        fi
    fi
fi

# --- Summary ---
echo ""
echo "=== Results ==="
echo "  Passed: $PASSED"
echo "  Failed: $FAILED"
echo ""

if [[ $FAILED -gt 0 ]]; then
    echo "GATE BLOCKED — fix the failing checks above before proceeding."
    exit 1
else
    echo "GATE PASSED — safe to proceed."
    exit 0
fi
