# pkg-rbin-bl79-rx: independent re-check

Date: 2026-11-19. Auditor: Codex (OpenAI family).
Worktree: `F:/R/Packages/_worktrees/rbin-bl79`; branch: `task/rbin-bl79`.
Audited HEAD: `34dcbd3f486b2dcf003bfcdba69c0d0f0d695293`.
Pre-follow-up: `b19502a41091f4531698df0e97d060b4ffb16722`.
Develop baseline: `afdf6c30be9c00c4b2d069cd0fd42ea0ee51e6df`.
C25 build: `b11b78e`.

## Verdict and scope

M1 and L1, the only Medium/Low findings the follow-up claims to fix, are
**FIXED**. Independent scratch mutations demonstrate that the revised tests
catch the relevant C25 regressions. The full source test suite passes, the
completed package check has no errors or warnings, and no ordinary-input
result regression was found. L2 and L3 remain open, as the follow-up states.

Read before judging: `F:/pm/notes/package-audit-stop-rule.md`,
`docs-dev/pkg-rbin-bl79-aud-report.md`, and
`docs-dev/pkg-rbin-bl79-fu-report.md`. Claims below were checked against the
diff and fresh runs, rather than accepted from those reports.

The stop rule is applied to the documented domain: ordinary supported
numeric/categorical predictors and binary responses, valid scalar arguments,
and the documented cut-point magnitude limit of `1e300` for equal-width and
post-winsorization calculations. This re-check does not extend that domain or
start another exotic floating-point audit. No High within that domain, no
ordinary-input regression, and no Medium misleading a typical user was found
in the requested scope.

The follow-up diff contains only its report and the two test files. Fresh
`git diff HEAD^ HEAD -- R DESCRIPTION NAMESPACE NEWS.md man` is empty.
There are no production functions changed by the follow-up itself; the
regression comparison also covers functions exercised by its revised tests
and the wider C25 changes.

## Findings re-checked

| Finding | Status | Fresh evidence |
|---|---|---|
| M1: blank-cut-point test did not exercise NA input | **FIXED** | Boxes are now set before the separate click (`test-audit-addins.R:203-207`, `212-216`). Both blank cases independently fail when only the NA filter is reverted in scratch, and pass on actual HEAD. |
| L1: one-column `rbin_create()` case was only a guard | **FIXED**, with the qualification below | The revised block now also fits the matrix predictor (`test-bl79-80.R:48`), then checks five dummy columns and vector/matrix score equality (`61-64`). It errors when only matrix normalization during fitting is reverted, and passes on HEAD. |
| L2: duplicate `check_bins()` definition | **STILL OPEN**, not claimed fixed | `rg -n '^check_bins <-' R/utils.R` returns identical definitions at lines 389 and 477. No behavior difference; Low cleanup. |
| L3: matrix documentation incomplete | **STILL OPEN**, not claimed fixed | NEWS lines 3-6 still mention numeric methods and `rbin_create()`, omitting `rbin_factor()`. Predictor help in `man/` still lacks one-column acceptance/multi-column rejection wording. Low documentation gap. |

L1 qualification: the combined test is now a regression test for matrix
**fitting**, followed by a useful scoring guard. Reverting only the scorer's
normalization still passes all six L1 assertions, because the old scorer
already handled a one-column numeric matrix. This is consistent with the
original audit; the revised test must not be described as proof of a newly
fixed one-column scoring bug.

## Fail-with-fix-reverted / pass-on-HEAD proof

All extraction, source reversions, scripts and outputs are outside the repo:

```text
C:/Users/DELL/AppData/Local/Temp/pkg-rbin-bl79-rx-20261119-152112/
```

`git archive --output=<scratch>/<name>.tar <revision>` followed by
`C:/Windows/System32/tar.exe -xf <archive> -C <scratch>/<name>` created the
copies. No source in the real worktree was reverted or edited.

`prepare-proof.R` extracts the actual revised test expressions using R's
parser. It keeps the L1 block unchanged and gives each of M1's three
`shiny::testServer()` expressions its own test with the original setup, so
both blank patterns are evaluated independently. Helpers are taken from the
same test file. `run-proof.R` loads one package tree per Rscript process and
runs this external `test-proof.R` with `testthat::test_file()`.

Because the follow-up is test-only, reverting it would merely remove its
assertions. The useful negative controls retain those revised assertions and
revert the corresponding production fixes from C25, as follows:

| Tree / exact scratch mutation | M1 single blank | M1 filled + blank | Existing n_bins=1 case | L1 block | Aggregate PASS / FAIL / ERROR |
|---|---|---|---|---|---|
| Actual HEAD worktree | PASS | PASS | PASS | 6 PASS | **9 / 0 / 0** |
| Archived HEAD, unchanged | PASS | PASS | PASS | 6 PASS | **9 / 0 / 0** |
| HEAD minus only `cut_points <- cut_points[!is.na(cut_points)]` in `rbin-addins.R` | FAIL | FAIL | PASS | 6 PASS | **7 / 2 / 0** |
| HEAD with only `prep_binning_data()` normalization changed back to `predictor = data[[predictor]]` | PASS | PASS | PASS | ERROR after 2 PASS | **5 / 0 / 1** |
| HEAD with only `rbin_create()` changed back to `x <- strip_asis(data[[pred]])` | PASS | PASS | PASS | 6 PASS | **9 / 0 / 0** |
| Develop baseline `afdf6c3`, revised tests retained externally | FAIL | FAIL | FAIL | ERROR after 2 PASS | **2 / 3 / 1** |

All proof runs have zero warnings and zero skips. Testthat reports assertion
failures separately from uncaught test errors in this table.

Output from the blank-filter mutation, once for each blank case:

```text
M1 isolated case 1: single blank
`compute_bins()` threw an error with unexpected message.
Expected match: "Enter a value for every cut point"
Actual message: "cut_points must be a numeric vector of cut points"

M1 isolated case 2: filled plus blank
`compute_bins()` threw an error with unexpected message.
Expected match: "Enter a value for every cut point"
Actual message: "cut_points must be a numeric vector of cut points"
TOTALS failed= 2 errors= 0 warnings= 0 skipped= 0 passed= 7
```

Output from reverting fitting normalization alone:

```text
Error: predictor must be a numeric variable for this binning method;
use rbin_factor() for categorical predictors
# at rbin_quantiles(d, y, pred_matrix, 5), test-proof.R:52
TOTALS failed= 0 errors= 1 warnings= 0 skipped= 0 passed= 5
```

Output from the actual audited worktree:

```text
TREE F:/R/Packages/_worktrees/rbin-bl79 PROOF test-proof.R
M1 isolated case 1: single blank                                      PASS 1
M1 isolated case 2: filled plus blank                                 PASS 1
M1 isolated case 3: n_bins=1                                          PASS 1
#79: rbin_create scores a one-column matrix predictor like the vector  PASS 6
TOTALS failed= 0 errors= 0 warnings= 0 skipped= 0 passed= 9
```

For the other negative control, `test-old-proof.R` extracts the old
click-before-box case and old L1 guard from `HEAD^`, excluding the unrelated
n_bins=1 block. Both pass on `afdf6c3`:

```text
TOTALS failed= 0 errors= 0 warnings= 0 skipped= 0 passed= 2
```

Logs and result objects are named `<tree>-test-proof.log/.rds`,
`rbin-bl79-test-proof.log/.rds`, and `base-test-old-proof.log/.rds` in scratch.
The separate full-suite run below also executes the committed tests in their
original, unsplit form.

## Full tests and package check

R 4.6.1 (ucrt), Windows 11 x64; testthat 3.3.2, devtools 2.5.2,
shiny 1.14.0, pkgload 1.5.3, rcmdcheck 1.4.0.
All R invocations use script files, never `Rscript -e`.

`fulltest.R` calls the FULL `devtools::test(pkg, reporter = "summary",
stop_on_failure = FALSE)` against the actual HEAD worktree and saves the
structured results. No filter is used.

```text
TOTALS tests= 107 expectations= 2863 failed= 0 errors= 0
warnings= 0 skipped= 0 passed= 2863
```

The two follow-up test files account for 106 passing expectations:
`test-audit-addins.R` = 35 and `test-bl79-80.R` = 71. Their failures, errors,
warnings and skips are all zero. The reported 2863 / 106 totals are confirmed.
Evidence: `fulltest.log`, `fulltest.rds`, `fulltest-totals.csv`.

Both check scripts call the requested FULL
`devtools::check(pkg, document = FALSE, args = "--no-manual", ...)`,
with external `check_dir` and `error_on = "never"` solely to retain results.
No tests, examples or vignettes are disabled. Devtools adds its normal
`--as-cran` option.

| Run | Errors | Warnings | Notes | Completion |
|---|---:|---:|---:|---|
| Initial inherited environment | 1 | 1 | 1 | Stopped at DESCRIPTION validation because child R startup emitted locale warnings. |
| Supported Windows C locale | **0** | **0** | **1** | Completed tests, examples, vignette checking/rebuild and final checks. |

The inherited environment had `LC_ALL=LANG=LC_CTYPE=C.UTF-8`; this Windows R
reported `Setting LC_COLLATE=C.UTF-8 failed` and similar startup warnings.
The second run sets those three process environment variables to `C` before
launching Rscript. DESCRIPTION validation then passes without package changes.
The initial failure is retained in `check-driver.log` and
`check/rbin.Rcheck/00check.log`; it is not presented as a passing check.

Completed output (`check-clean-driver.log`, `check-clean/rbin.Rcheck/00check.log`):

```text
* checking DESCRIPTION meta-information ... OK
* checking tests ... [41s] OK
* checking re-building of vignette outputs ... [14s] OK
* DONE
Status: 1 NOTE
CHECK TOTALS errors= 0 warnings= 0 notes= 1
```

The sole NOTE is the pre-existing worktree `.git` file included by the build;
`.Rbuildignore` does not exclude it. This is the builder's already-listed
packaging follow-up, not a test or result failure.

Installed-package test output from the completed check:

```text
[ FAIL 0 | WARN 0 | SKIP 1 | PASS 2849 ]
* source documentation is unavailable (1): 'test-fx7.R:82:3'
```

That test searches for NEWS and source R files, which are unavailable in the
installed-package layout. Its 14 source-documentation assertions all run in
the source suite, explaining 2849 versus 2863; no revised follow-up test is
skipped. Evidence: `check-clean/rbin.Rcheck/tests/testthat.Rout`.

## Ordinary-input regression comparison

`grid.R` loads `afdf6c3`, pre-follow-up `b19502a`, and archived HEAD in separate
Rscript processes. `compare-grid.R` compares the saved results. The 472 cells
include 468 successful cases and four deliberate ordinary validation errors.

The grid covers:

- age, balance and duration; bins 2/5/10; missing/no-missing predictors;
  `include_na` TRUE/FALSE; manual, equal length, quantiles, equal frequency,
  and winsorization;
- default winsorization, rates 0 and 0.1, type 1, explicit/two-sided and
  one-sided limits, and integer limits;
- full fit objects, bin tables, dummy columns and captured print output for
  numeric methods, plus captured warnings/messages;
- factor binning for job, marital, education and age, with missing/no-missing
  values and both `include_na` settings;
- bare names, named logical/numeric scalars, NULL/equal clamp endpoints,
  integer/double/AsIs columns, data.frame/tibble/data.table inputs, and
  logical/character/factor categorical predictors;
- valid real manual-addin callbacks for cuts 3.5, c(2,4), and c(2,3,4,5), each
  independently checked against direct `rbin_manual()` bins on every tree;
- expected errors for unsorted cuts, bins=1, reversed limits and a character
  predictor passed to a numeric method.

Fresh comparison output:

```text
PRE-FOLLOW-UP vs HEAD: cells= 472 identical= 472 regressions=0
Named limits clamp: min.low,max.high -> min,max ; values= 2,18
DEVELOP vs HEAD: cells= 472 identical= 435 clamp_storage_only= 36
clamp_names_only= 1 result_or_print_regressions=0
Successful cells= 468 expected-error cells=4
Valid addin cases=3; all identical to direct rbin_manual reference on all three trees
```

The 36 integer-limit cells differ only in integer versus double storage of
`fit$clamp`, as previously noted in I2. One additional cell with named limits
has canonical clamp names `min`/`max` instead of `min.low`/`max.high` because
validation strips the supplied scalar names. Values are exactly equal.
The comparator explicitly checks these two metadata-only differences and
requires the rest of each cell to be `identical()`; it does not mask numeric
or printed-output differences with a loose tolerance. All 472 cells are
fully identical across the follow-up itself. No valid ordinary call is newly
rejected. Evidence: `grid-base.rds`, `grid-pre-fu.rds`, `grid-head.rds`,
`grid-summary.log`.

## Reproduction and repository hygiene

Representative commands, all run from PowerShell with script-file arguments:

```powershell
Rscript <scratch>/fulltest.R F:/R/Packages/_worktrees/rbin-bl79 <scratch>
Rscript <scratch>/prepare-proof.R <scratch>
Rscript <scratch>/run-proof.R <scratch>/head <scratch>
Rscript <scratch>/run-proof.R <scratch>/base <scratch>
Rscript <scratch>/run-proof.R <scratch>/no-blank-fix <scratch>
Rscript <scratch>/run-proof.R <scratch>/no-matrix-fit-fix <scratch>
Rscript <scratch>/run-proof.R <scratch>/no-matrix-score-fix <scratch>
Rscript <scratch>/run-proof.R F:/R/Packages/_worktrees/rbin-bl79 <scratch>
Rscript <scratch>/run-proof.R <scratch>/base <scratch> test-old-proof.R
Rscript <scratch>/check.R F:/R/Packages/_worktrees/rbin-bl79 <scratch>
$env:LC_ALL = 'C'; $env:LANG = 'C'; $env:LC_CTYPE = 'C'
Rscript <scratch>/check-clean.R F:/R/Packages/_worktrees/rbin-bl79 <scratch>
Rscript <scratch>/grid.R <scratch>/base <scratch>
Rscript <scratch>/grid.R <scratch>/pre-fu <scratch>
Rscript <scratch>/grid.R <scratch>/head <scratch>
Rscript <scratch>/compare-grid.R <scratch>
```

The worktree was clean at entry. The source test runner rewrote snapshot line
endings in `tests/testthat/_snaps/bins.md` without a content diff; that generated
rewrite was restored to HEAD. No snapshot update is accepted or committed.
All source reversions were confined to external scratch copies. The only
retained repository change is this report. No package code, docs, tests,
version, NEWS or build-ignore change is included; no branch switch, push or
GitHub operation was performed.

Ready to merge into develop: yes
