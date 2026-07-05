# Phase Gate Script
# Validates the spec-driven workflow chain at any checkpoint.
# Run before implementation, before phase completion, and before demos.

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("pre-impl", "pre-complete", "pre-demo")]
    [string]$Gate
)

$ErrorActionPreference = "Continue"
$failed = 0
$passed = 0

function Check($name, $condition, $message) {
    if ($condition) {
        Write-Host "  [PASS] $name" -ForegroundColor Green
        $script:passed++
    } else {
        Write-Host "  [FAIL] $name - $message" -ForegroundColor Red
        $script:failed++
    }
}

function Get-SpecStatus($specPath) {
    if (-not (Test-Path $specPath)) { return $null }
    $content = Get-Content $specPath -Raw
    if ($content -match '`(Roadmapped|Spec Written|Approved|Implementing|Verified)`') {
        return $Matches[1]
    }
    return $null
}

function Get-ActivePhaseSpec {
    $activePath = "docs/specs/ACTIVE_PHASE.md"
    if (-not (Test-Path $activePath)) { return $null }
    $content = Get-Content $activePath -Raw
    if ($content -match 'docs/specs/([^\s`]+\.md)') {
        return "docs/specs/$($Matches[1])"
    }
    return $null
}

function Get-ActivePhaseNumber {
    $spec = Get-ActivePhaseSpec
    if ($spec -match 'phase-(\d+)') {
        return [int]$Matches[1]
    }
    return $null
}

Write-Host ""
Write-Host "=== Phase Gate: $Gate ===" -ForegroundColor Cyan
Write-Host ""

# --- Gate 1: Pre-Implementation ---
if ($Gate -eq "pre-impl") {
    Write-Host "Gate 1: Pre-Implementation Checks" -ForegroundColor Yellow
    Write-Host ""

    # Check ACTIVE_PHASE.md exists
    $activePath = "docs/specs/ACTIVE_PHASE.md"
    Check "ACTIVE_PHASE.md exists" (Test-Path $activePath) "Create docs/specs/ACTIVE_PHASE.md"

    if (Test-Path $activePath) {
        $specPath = Get-ActivePhaseSpec
        Check "ACTIVE_PHASE.md references a valid spec" ($specPath -ne $null -and (Test-Path $specPath)) "Fix the spec path in ACTIVE_PHASE.md"

        if ($specPath -and (Test-Path $specPath)) {
            $status = Get-SpecStatus $specPath
            Check "Spec status is 'Approved'" ($status -eq "Approved") "Current status: '$status' - spec must be Approved before implementation"

            # Check earlier phases are verified
            $activeNum = Get-ActivePhaseNumber
            if ($null -ne $activeNum -and $activeNum -gt 0) {
                for ($i = 0; $i -lt $activeNum; $i++) {
                    $prevSpec = "docs/specs/phase-$i.md"
                    if (Test-Path $prevSpec) {
                        $prevStatus = Get-SpecStatus $prevSpec
                        Check "Phase $i is Verified" ($prevStatus -eq "Verified") "Phase $i status: '$prevStatus' - earlier phases must be verified first"
                    }
                }
            }

            # Check SEC.json consistency
            $secPath = "docs/SEC.json"
            if (Test-Path $secPath) {
                $sec = Get-Content $secPath -Raw | ConvertFrom-Json
                Check "SEC.json active_phase matches ACTIVE_PHASE.md" ($sec.active_phase -ne $null) "SEC.json missing active_phase field"
            }
        }
    }
}

# --- Gate 2: Pre-Completion ---
if ($Gate -eq "pre-complete") {
    Write-Host "Gate 2: Pre-Completion Checks" -ForegroundColor Yellow
    Write-Host ""

    $specPath = Get-ActivePhaseSpec
    if ($specPath -and (Test-Path $specPath)) {
        $status = Get-SpecStatus $specPath
        Check "Spec status is 'Implementing'" ($status -eq "Implementing") "Current status: '$status' - must be Implementing before completion"

        # Check proof artifacts exist
        $phaseNum = Get-ActivePhaseNumber
        $proofDirs = @(
            "verification/phase-$phaseNum-proof",
            "verification/phase-$phaseNum",
            "verification/proof"
        )
        $hasProof = $false
        foreach ($dir in $proofDirs) {
            if (Test-Path $dir) {
                $files = Get-ChildItem $dir -File -Recurse
                if ($files.Count -gt 0) { $hasProof = $true }
            }
        }
        Check "Proof artifacts exist in verification/" $hasProof "Add proof artifacts to verification/phase-$phaseNum-proof/"

        # Check compaction exists
        $compactionDir = "docs/compactions"
        $hasCompaction = $false
        if (Test-Path $compactionDir) {
            $compactions = Get-ChildItem $compactionDir -Filter "*.md" | Where-Object { $_.Name -ne "PROTOCOL.md" -and $_.Name -ne "INDEX.md" -and $_.Name -ne "README.md" }
            if ($compactions.Count -gt 0) { $hasCompaction = $true }
        }
        Check "Compaction report exists" $hasCompaction "Write a compaction to docs/compactions/ after phase completion"

        # Check SEC consistency
        $secCheckPath = "docs/SEC_CONSISTENCY_CHECK.md"
        Check "SEC_CONSISTENCY_CHECK.md exists" (Test-Path $secCheckPath) "Create docs/SEC_CONSISTENCY_CHECK.md"

        # Check review exists
        $reviewDir = "docs/reviews"
        $hasReview = $false
        if (Test-Path $reviewDir) {
            $reviews = Get-ChildItem $reviewDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" }
            if ($reviews.Count -gt 0) { $hasReview = $true }
        }
        Check "Review exists in docs/reviews/" $hasReview "Run a review using prompts/REVIEW_MODE.md and save to docs/reviews/"
    } else {
        Write-Host "  [SKIP] No active phase spec found" -ForegroundColor DarkGray
    }
}

# --- Gate 3: Pre-Demo ---
if ($Gate -eq "pre-demo") {
    Write-Host "Gate 3: Pre-Demo Checks" -ForegroundColor Yellow
    Write-Host ""

    # Run all Gate 2 checks first
    Write-Host "  (Running Gate 2 checks first...)" -ForegroundColor DarkGray

    $specPath = Get-ActivePhaseSpec
    if ($specPath -and (Test-Path $specPath)) {
        $status = Get-SpecStatus $specPath
        Check "Spec status is 'Verified'" ($status -eq "Verified") "Current status: '$status' - phase must be Verified before demo"

        # Check MECHANISM_LOG.md exists
        Check "MECHANISM_LOG.md exists" (Test-Path "MECHANISM_LOG.md") "Run mechanism-debrief skill to create MECHANISM_LOG.md"

        # Check no CRITICAL/HIGH findings in latest review
        $reviewDir = "docs/reviews"
        if (Test-Path $reviewDir) {
            $latestReview = Get-ChildItem $reviewDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" } | Sort-Object LastWriteTime -Descending | Select-Object -First 1
            if ($latestReview) {
                $reviewContent = Get-Content $latestReview.FullName -Raw
                $hasCritical = $reviewContent -match "CRITICAL|severity: critical"
                $hasHigh = $reviewContent -match "HIGH|severity: high"
                Check "No unresolved CRITICAL findings" (-not $hasCritical) "Resolve CRITICAL findings in latest review before demo"
                Check "No unresolved HIGH findings" (-not $hasHigh) "Resolve HIGH findings in latest review before demo"
            }
        }
    }
}

# --- Summary ---
Write-Host ""
Write-Host "=== Results ===" -ForegroundColor Cyan
Write-Host "  Passed: $passed" -ForegroundColor Green
Write-Host "  Failed: $failed" -ForegroundColor $(if ($failed -gt 0) { "Red" } else { "Green" })
Write-Host ""

if ($failed -gt 0) {
    Write-Host "GATE BLOCKED - fix the failing checks above before proceeding." -ForegroundColor Red
    exit 1
} else {
    Write-Host "GATE PASSED - safe to proceed." -ForegroundColor Green
    exit 0
}
