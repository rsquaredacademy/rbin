# pkg-rbin-bl79-aud — audit of the rbin #79 / #80 build

- Worktree: `F:/R/Packages/_worktrees/rbin-bl79`, branch `task/rbin-bl79`
- Audited range: `git diff origin/develop..HEAD`, i.e. one commit,
  `b11b78e Handle one-column matrix predictors and validate scalar arguments (#79, #80)`,
  on top of `origin/develop` = `afdf6c3`.
- Brief: `F:/pm/notes/2026-11-15-day/briefs/pkg-rbin-bl79-brief.md`. Builder report: `docs-dev/pkg-rbin-bl79-report.md`.
- R 4.6.1 (ucrt), testthat 3.3.2, shiny 1.14.0. No package code was changed during the audit.

## Summary

Both issues are fixed as the brief asks. Re-running the reprexes on the old and new trees shows that every
one-column matrix shape now gives the same bins as the matching vector, for all five numeric
methods, `rbin_factor()` and `rbin_create()`. Multi-column matrices are rejected with a message naming the predictor. Out of
322 ordinary calls, all give the same numbers as `origin/develop`. `devtools::test()` passes
(2857 / 0 failures). No wrong result was found inside the documented domain.

The main problem is in the tests. The new addin test for "blank cut point" never reaches the NA
path, so it also passes on the old code (Medium, M1). The other findings are Low or Info.

## Findings

### High

None.

### Medium

**M1. The blank-cut-point addin test passes on the old code, so it would not catch a regression of the #80 fix.**
In `tests/testthat/test-audit-addins.R` ("#80: manual addin treats blank cut points as missing and needs two
bins"), the test sets `create_bins = 1` in the same `setInputs()` call as `n_bins = 2`, before it sets the box.
`testServer` flushes the outputs at that point, so `compute_bins()` runs while `input[["n_bins_ 1"]]` is still
`NULL`. The length check fails on `NULL`, and `eventReactive` caches that error. Setting the box to `NA_real_` afterwards does not
re-trigger the event. So the test checks the "box never set" case, which both trees already handled. It never checks
the "box blank (NA)" case that #80 is about.

Reprex (scratch `addin.R`; gadget launch mocked the same way as `capture_gadget()`):

```r
shiny::testServer(gadget$server, {
  session$setInputs(mydata = "dd", resp_var = "y", pred_var = "x", n_bins = 2, create_bins = 1)
  input[["n_bins_ 1"]]                 # NULL at click time
  session$setInputs(`n_bins_ 1` = NA_real_)
  compute_bins()
})
```

| tree | builder's order (click first, then the box) | correct order (box = NA, then click) |
|---|---|---|
| origin/develop | silent error "Enter a value for every cut point." (**test passes on old code**) | `simpleError`: "cut_points must be a numeric vector of cut points" |
| HEAD | silent error "Enter a value for every cut point." | silent error "Enter a value for every cut point." |

- Expected: a test that fails on `origin/develop`.
- Actual: the test passes on both trees.

The behaviour itself is fixed; see "Passing checks" (1). Suggested fix: set the box(es) first and then
`session$setInputs(create_bins = 1)` in a separate call. Also add a case with one box filled and one box blank
(`n_bins = 3`, `n_bins_ 1 = 2`, `n_bins_ 2 = NA`). Both orderings are shown in the table above.

### Low

**L1. The `rbin_create()` matrix test is a guard, not a regression test.** `#79: rbin_create scores a one-column
matrix predictor` passes on `origin/develop`, because the old `rbin_create()` already scored a one-column matrix
correctly (the scratch reprex gives 5/5 identical dummy columns on both trees). The builder's report admits this
("did not error before"). The test is still useful as a guard. What actually changed in `rbin_create()` is the
multi-column case: the old code failed with "arguments imply differing number of rows: 4521, 9042", and the new code says
"predictor 'two_cols' is a matrix with 2 columns ...". That case is tested in the multi-column test, which fails on the old code.

**L2. A second, duplicate `check_bins()` definition was added.** In the `R/utils.R` diff, the removed `check_suggests()` was
replaced by `check_bins <- function(bins) validate_bins(bins, 2L)` (now `R/utils.R` line ~477). An identical
definition already exists at line ~389. Because the two are identical, behaviour does not change. It is dead code that
should be deleted.

**L3. Docs and NEWS are incomplete about which functions accept matrices.** The #79 NEWS bullet says "Numeric binning methods and
`rbin_create()` treat a one-column matrix predictor ...". It does not mention `rbin_factor()`, whose crash ("replacement has
1 row, data has 0") is also fixed and tested. No roxygen `@param predictor` was updated to say that one-column matrices are
accepted. The builder lists this as follow-up 1. The behaviour is consistent; this is a documentation gap only.

### Info (no action needed, or required by the brief)

- **I1. Tighter validation, as the brief requires.** These inputs used to be accepted silently and now error with the new
  messages. `include_na = 1`, `0` and `"TRUE"` used to bin as TRUE/FALSE. `min_val = -Inf`, `max_val = Inf`, `min_val = TRUE`
  and a difftime `min_val` used to run. All of these are outside the documented domain (`include_na`: "logical"). The brief
  explicitly requires "single TRUE/FALSE" and "single finite number or NULL". `max_val = Inf` was the only
  way to say "no upper clamp". The workaround is `max_val = max(x)` or `winsor_rate = 0`. A NEWS bullet covers the change.
- **I2. `clamp` metadata type.** When integer limits are passed (`min_val = 29L`), `rbin_winsorize()$clamp` is now a named double
  instead of a named integer, because `validate_limit()` returns `as.numeric(value)`. The values, bins, print output and
  `rbin_create()` scoring are the same. This is the only difference in the 322-call grid (12 cells; `all.equal` is TRUE).
- **I3. Duplicate `globalVariables()` entry.** `utils::globalVariables()` already removes duplicates, so removing the
  duplicate `"bad"` is cosmetic. The registered set is the same on both trees.

## Passing checks

1. **Each issue in the brief is fixed (reprexes re-run on both trees; scratch `reprex.R`, `addin.R`, `oldtests.R`).**
   - #79 issue reprex, `d$age_z <- scale(mbank["age"])`:

     | call | origin/develop | HEAD |
     |---|---|---|
     | `rbin_quantiles(d, y, age_z, 5)` | ERROR predictor must be a numeric variable ... | OK, 5 bins |
     | `rbin_factor(d, y, age_z)` | ERROR replacement has 1 row, data has 0 | OK, 67 levels |

   - On HEAD, matrix and vector inputs give the same bins (`all.equal` TRUE) for manual, equal_length, quantiles, winsorize
     (default and explicit limits), equal_freq and factor. The same holds with NAs in the predictor (`include_na`
     TRUE and FALSE), for an integer one-column matrix, a character one-column matrix (`rbin_factor`), a logical
     one-column matrix, an `I()`-wrapped matrix, a tibble matrix column and an unnamed matrix. `rbin_create()`
     dummies are the same for matrix and vector.
   - A character one-column matrix given to a numeric method still gives the correct "must be numeric" error.
   - Multi-column matrices: quantiles, factor and `rbin_create()` all stop with "predictor 'two' is a matrix with 2 columns;
     supply a vector or a one-column matrix". On the old code these were misleading errors or a row-count crash.
   - #80 `include_na`: `NA`, `c(TRUE, FALSE)`, `1`, `0`, `"TRUE"`, `logical()`, `NULL` and `"yes"` all give "`include_na` must be a
     single TRUE or FALSE" in manual, equal_length, quantiles, winsorize and factor. On the old code they gave "missing value where
     TRUE/FALSE needed", "the condition has length > 1", ... or were silently accepted.
   - #80 `min_val`/`max_val`: `NA`, `NA_real_`, `NaN`, `±Inf`, `c(1, 2)`, `numeric()`, `"1"`, `TRUE` and difftime all give
     "`min_val` (`max_val`) must be a single finite number or NULL". On the old code they gave misleading
     "`min_val` must be less than or equal to `max_val`" or "'length = 2' in coercion", or were silently accepted.
   - Addin, blank boxes (correct click order): `n_bins = 2` with box NA, `n_bins = 3` with one box blank, and both boxes
     blank all give the silent validate "Enter a value for every cut point." on HEAD. On the old code they gave the
     error "cut_points must be a numeric vector of cut points".
   - Addin `n_bins`: values `1`, `NA`, `0`, `-3` and `NULL` all give a silent `req()` stop on HEAD. On the old code `1` gave
     "cut_points must be ...", `NA` gave "NA/NaN argument" and `NULL` gave "argument of length 0".
   - Missing packages (`try_pkg` mocked to NA): both `rbinAddin()` and `rbinFactorAddin()` stop with "The following
     package(s) must be installed to use this addin: shiny, miniUI, rstudioapi" on HEAD (Rscript, non-interactive).
     The old code went on and built the gadget (returned the mocked gadget list).
   - `check_suggests` no longer exists in the namespace. The `menu` and `install.packages` imports are removed and NAMESPACE
     is regenerated to match.
2. **Ordinary inputs give the same numbers as origin/develop.** The scratch `grid.R` was run in separate Rscripts with
   `pkgload::load_all()` on the extracted base and on HEAD, and compared with scratch `compare.R`. The grid has 322 calls:
   - manual, quantiles, equal_length, winsorize (default, `winsor_rate = 0.1`, `type = 1`, explicit and one-sided
     limits, integer limits) and equal_freq, at bins 2/5/10;
   - predictors age, balance and duration, with and without NAs, `include_na` TRUE/FALSE;
   - `rbin_factor` on 4 predictors × NA/no-NA × `include_na`;
   - bare-name calls, integer/logical/numeric predictors, tibble and data.table inputs, a named `include_na = c(a = TRUE)`;
   - `rbin_create()` for every numeric method, including NA data and tibble input;
   - `rbin_factor_combine()`, `rbin_factor_create()`;
   - 4 expected-error cells.

   Result: 310 cells are `identical()`, and 12 differ only in the clamp storage type (I2; `all.equal` TRUE, print output
   identical). The 4 expected-error cells give the same message on both trees.
3. **New errors do not reject valid inputs.** `include_na = TRUE/FALSE/T`, named logical scalars, `min_val`/`max_val` as
   double, integer or named numeric, one-sided limits, `min_val == max_val`, and `NULL` limits all still run. Valid addin
   input (`n_bins = 3`, boxes 2 and 4; `n_bins = 2`, box 3.5) gives the same bins on both trees. The existing "`min_val` must be
   less than or equal to `max_val`" check still fires. The only inputs newly rejected are the ones in I1.
4. **Tests are meaningful.** The builder's `test-bl79-80.R` was run against `origin/develop` with `testthat::test_file()`:
   4 of 5 tests error there (matrix bins, multi-column, `include_na`, `min_val`/`max_val`), and all 5 pass on HEAD. The
   missing-package and `n_bins = 1` addin tests fail on the old code. Exceptions: M1 (blank box) and L1 (`rbin_create`
   guard).
5. **Docs/NEWS match behaviour.** NEWS has a new `# rbin (development version)` heading above `# rbin 0.3.0`, with bullets
   that describe the #79 and #80 behaviour accurately (gaps noted in L3). DESCRIPTION Version is unchanged (0.3.0).
   The existing `@param include_na` "logical" doc agrees with the new check.
6. **`devtools::test()` on HEAD:** `FAIL 0 | ERROR 0 | SKIP 0 | WARN 0 | PASS 2857`, which matches the builder's report.
   `R CMD check` was not re-run; it was not part of this audit's checklist.

## Commands run

```text
git status; git log --oneline origin/develop..HEAD; git diff --stat origin/develop..HEAD
git diff origin/develop..HEAD -- NAMESPACE NEWS.md R/ tests/
git grep -n "check_bins\|validate_bins" origin/develop -- R tests ; git grep ... HEAD -- R tests
git grep -n "include_na\|min_val\|max_val" -- R ; git grep -n "data\[\[" -- R ; git grep ... -- man
# base extraction (the PowerShell 5.1 pipe corrupts binary tar data, so the same pipe was run through cmd):
cmd /c "git archive origin/develop | C:\Windows\System32\tar.exe -x -C %TEMP%\pkg-rbin-bl79-aud-base"
Rscript scratch/grid.R  <base> grid-base.rds ; Rscript scratch/grid.R <HEAD> grid-head.rds ; Rscript scratch/compare.R ; Rscript scratch/diff1.R
Rscript scratch/reprex.R   <base> ; Rscript scratch/reprex.R   <HEAD>
Rscript scratch/oldtests.R <base> <HEAD> ; Rscript scratch/oldtests.R <HEAD> <HEAD>
Rscript scratch/addin.R    <base> ; Rscript scratch/addin.R    <HEAD>
Rscript scratch/fulltest.R          # devtools::test("F:/R/Packages/_worktrees/rbin-bl79")
```

The scratch scripts and their outputs are in
`C:/Users/DELL/.gemini/antigravity-cli/brain/321b5e03-db3b-4913-ac41-104e19bd52df/scratch/`. Every script calls
`pkgload::load_all(<tree>)` in its own Rscript process.

Any wrong result left inside the domain: no
