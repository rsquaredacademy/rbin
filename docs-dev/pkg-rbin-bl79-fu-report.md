# pkg-rbin-bl79-fu report

- Worktree: `F:/R/Packages/_worktrees/rbin-bl79`
- Branch: `task/rbin-bl79` (not switched; no push, no GitHub)
- Starting HEAD: `b19502a` ("Audit pkg-rbin-bl79 build"), on top of
  `b11b78e` ("Handle one-column matrix predictors and validate scalar arguments
  (#79, #80)") on `origin/develop` = `afdf6c3`.
- Scope: only the two findings in the brief, M1 and L1. Both are test-quality
  fixes. No package code (`R/`), `DESCRIPTION`, `NAMESPACE` or `NEWS.md` change.
  `DESCRIPTION` stays at `Version: 0.3.0`; no NEWS entry is needed because no
  behaviour changed.
- R 4.6.1 (ucrt), testthat 3.3.2, shiny 1.14.0, devtools 2.5.2.

## Files changed

- `tests/testthat/test-audit-addins.R`: M1 test now sets the cut-point box
  before the click, in a separate `setInputs()` call, and adds the
  one-filled/one-blank case (`n_bins = 3`, box 1 = 2, box 2 = NA).
- `tests/testthat/test-bl79-80.R`: L1 `rbin_create()` test now fits on both a
  vector and the one-column matrix, checks that the fitted bins agree, then
  scores the same values from a matrix column and a vector column and compares
  the dummy scores.
- `docs-dev/pkg-rbin-bl79-fu-report.md`: this report.

## M1 — blank cut point must exercise the #80 path

### Before

The old test set `create_bins = 1` in the same `session$setInputs()` call as
`n_bins = 2`, then set the box to `NA_real_` afterwards:

```r
session$setInputs(mydata = "dd", resp_var = "y", pred_var = "x",
                  n_bins = 2, create_bins = 1)
session$setInputs(`n_bins_ 1` = NA_real_)
expect_error(compute_bins(), "Enter a value for every cut point")
```

`testServer()` flushed the outputs when `n_bins` was set, so `compute_bins()`
ran while `input[["n_bins_ 1"]]` was still `NULL`. The length check failed on
`NULL`, `eventReactive` cached that error, and setting the box to `NA_real_`
afterwards did not re-trigger the event. The test therefore checked the
"box never set" case, not the blank/NA case that #80 is about.

Evidence on the pre-fix tree: the old blank-box block passes. Running the old
test block against `afdf6c3` gives `[ FAIL 1 | WARN 0 | SKIP 0 | PASS 2 ]`, and
the only failure is the separate `n_bins = 1` block at line 39
("cut_points must be a numeric vector of cut points"); the blank-box block
itself passes. This matches the audit's M1 table.

### After

The test now sets the box first and clicks in a separate call, so
`compute_bins()` sees `NA`:

```r
session$setInputs(mydata = "dd", resp_var = "y", pred_var = "x", n_bins = 2)
session$setInputs(`n_bins_ 1` = NA_real_)
session$setInputs(create_bins = 1)
expect_error(compute_bins(), "Enter a value for every cut point")
```

A second case with `n_bins = 3`, `n_bins_ 1 = 2`, `n_bins_ 2 = NA_real_` was
added, and the existing `n_bins = 1` silent-`req()` case is kept in its own
`setInputs()` calls.

Evidence on the pre-fix code (`afdf6c3`), using the new test unchanged:

```text
ERROR: 'test-fu-proof.R:34:5'
Error: cut_points must be a numeric vector of cut points
...
[ FAIL 2 | WARN 0 | SKIP 0 | PASS 0 ]
```

The first failure is the M1 blank-box case. On HEAD the same test passes.

## L1 — `rbin_create()` one-column matrix test is now a regression test

### Before

The old test fitted bins from the vector, called `rbin_create()` on a matrix
column and on a vector column, and compared only the generated dummy columns.
Old `rbin_create()` already scored a one-column numeric matrix correctly, so
the test passed on `afdf6c3` and could not catch a regression of the predictor
handling. It was a guard, not a regression test.

Evidence: the old L1 test passes on `afdf6c3` (part of the
`[ FAIL 1 | WARN 0 | SKIP 0 | PASS 2 ]` run above; the only failure was the
unrelated `n_bins = 1` addin case).

### After

The test now:

1. fits `rbin_quantiles()` on the vector predictor and on the one-column matrix
   predictor, and asserts that the fitted bins are equal (this is the #79 path
   that the old code rejected);
2. scores the same values from a matrix column and a vector column, both named
   `pred`, using the same bins object;
3. asserts that there are five dummy columns and that the matrix scores equal
   the vector scores, both as data frames and as matrices.

Evidence on the pre-fix code (`afdf6c3`), using the new test unchanged:

```text
ERROR: 'test-fu-proof.R:52:3'
Error: predictor must be a numeric variable for this binning method; use
rbin_factor() for categorical predictors
...
[ FAIL 2 | WARN 0 | SKIP 0 | PASS 0 ]
```

The second failure is L1, at the matrix fit. On HEAD the same test passes.

## Proof method (stash/revert, run, restore)

Both fixes are test-only, so there is no source diff from this round to stash.
Instead the package source was temporarily reverted to the pre-fix tree while
the new tests stayed in place:

```text
git checkout afdf6c3 -- R
Rscript <runtests_totals.R> <worktree> "fu-proof"
# FAIL 2 | WARN 0 | SKIP 0 | PASS 0
git checkout HEAD -- R
Rscript <runtests_totals.R> <worktree> "fu-proof"
# FAIL 0 | WARN 0 | SKIP 0 | PASS 5
rm tests/testthat/test-fu-proof.R
```

`test-fu-proof.R` was a temporary copy of the two new test blocks (no other
tests), so the run could not be affected by the old `n_bins = 1` and
missing-package tests that are expected to fail on the pre-fix code. It was
removed afterwards and is not part of the commit.

## Test totals

Full suite on the final HEAD, `devtools::test()` from a script file:

```text
[ FAIL 0 | WARN 0 | SKIP 0 | PASS 2863 ]
```

The previous round reported `PASS 2857`; this round adds 6 passing assertions.
The two changed test files on HEAD:

```text
[ FAIL 0 | WARN 0 | SKIP 0 | PASS 106 ]
```

## Commands run

```text
git status --short
git log --oneline -12
git branch --show-current
git diff --stat origin/develop..HEAD

# pre-fix tree for comparisons
git archive afdf6c3 | tar -x -C C:\Users\DELL\AppData\Local\Temp\rbin-fu-base

# scratch scripts (Rscript with a script file, not -e)
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/score.R <tree> <out.rds>
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/cmp.R
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/runtests.R <tree> "<filter>"
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/runtests_totals.R <tree> "<filter>"
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/fulltest.R   # devtools::test(worktree)

# old tests on the pre-fix tree
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/runtests_totals.R C:/Users/DELL/AppData/Local/Temp/rbin-fu-base "fu-proof-old"

# stash/revert proof on the worktree
cp <temp>/test-fu-proof.R tests/testthat/test-fu-proof.R
git checkout afdf6c3 -- R
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/runtests_totals.R F:/R/Packages/_worktrees/rbin-bl79 "fu-proof"
git checkout HEAD -- R
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/runtests_totals.R F:/R/Packages/_worktrees/rbin-bl79 "fu-proof"
rm tests/testthat/test-fu-proof.R

# final checks
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/runtests_totals.R F:/R/Packages/_worktrees/rbin-bl79 "bl79-80|audit-addins"
Rscript C:/Users/DELL/AppData/Local/Temp/rbin-fu/fulltest.R
git status --short
git diff
```

Scratch scripts and captured output are under
`C:/Users/DELL/AppData/Local/Temp/rbin-fu/`; the extracted pre-fix tree is
`C:/Users/DELL/AppData/Local/Temp/rbin-fu-base/`.

## Follow-ups (not touched in this round)

These are the remaining items from the audit report and the original builder
report. They are deliberately outside this small fix round.

1. **L2 (audit): remove the duplicate `check_bins()` definition.** A second,
   identical `check_bins <- function(bins) validate_bins(bins, 2L)` was added
   to `R/utils.R` at about line 477, while an identical definition already
   exists at about line 389. The duplicate is dead code and should be deleted;
   behaviour does not change because the two definitions are identical.

2. **L3 (audit): complete the docs and NEWS for matrix predictors.** The #79
   NEWS bullet mentions numeric binning methods and `rbin_create()` but not
   `rbin_factor()`, whose crash ("replacement has 1 row, data has 0") is also
   fixed and tested. The roxygen `@param predictor` text should say that
   one-column matrices (for example `scale(mbank["age"])`) are accepted as
   their underlying vector and that more than one column is rejected.

3. **Builder follow-up 1: document matrix predictors in roxygen.** Same as L3:
   state in `@param predictor` that one-column matrices are accepted and that
   multi-column matrices are rejected.

4. **Builder follow-up 2: add `^\.git$` to `.Rbuildignore`.** Checks run from
   a git worktree then no longer report the hidden `.git` NOTE.

5. **Builder follow-up 3: validate the remaining winsorized scalar
   arguments.** Consider applying the same scalar validation to `remove_na`
   and `type`, so every scalar argument names itself in an error message.

6. **Builder follow-up 4: consider a one-column matrix response.** Consider
   accepting a one-column matrix for the response as well, if that input shape
   is expected from users who build model matrices.
