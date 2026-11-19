# rbin 0.3.0: rx3-L1 display fix (fx5)

2026-11-17. Worktree `F:/R/Packages/_worktrees/rbin-fx2`, branch
`task/rbin-fx2`, starting at `d654afd`. Checked source commit:
`707ee6f4ca89edaa0a8fee11e07a664bc8886342` (`fix: distinguish explicit NA
levels from missing codes in displays (fx5)`).

## Fix and regression coverage

Both print and plot use `factor_display_labels()` to detect genuine missing
values alongside another observed category that displays as NA: either a
literal `"NA"` string or an explicit NA factor level. Only the genuine missing
code displays as `(missing)`. The print method requests preservation of the
original label type when no collision exists, preserving ordinary formatting.
Stored levels, factor metadata and every summary value remain unchanged.

The `rbin_factor()` details and generated Rd document both triggers. NEWS
0.3.0 records rx3-L1. `.fx5-tmp/` is ignored by Git and excluded from builds.

New tests in `tests/testthat/test-fx5.R`:

* `rx3-L1: explicit NA levels and missing codes have distinct display labels`
  (8 assertions): the exact audit fixture, independent base-R summary values,
  stored typed labels, the entire printed table, plot labels, object preservation
  after print/plot and `include_na = FALSE`.
* `rx3-L1: literal NA, explicit NA level and missing code retain three bins`
  (10 assertions): three-way collisions for both factor and ordered inputs,
  independent summary values, typed labels, printed tables, plot labels and
  object preservation.
* `rx3-L1: ordinary printed summaries keep their typed level formatting`
  (8 assertions): exact ordinary printed tables and plot labels for character,
  factor and numeric inputs, including an unused explicit NA factor level.

## Actual-after output

Exact audit fixture:

```r
g <- structure(c(1L, 2L, 1L, NA_integer_),
               levels = c("a", NA), class = "factor")
d <- data.frame(y = c(0, 1, 0, 1), g = g)
b <- rbin_factor(d, y, g)
print(b)
```

Actual printed output:

```text
Binning Summary
---------------------------
Method               Custom
Response             y
Predictor            g
Levels               3
Count                4
Goods                2
Bads                 2
Entropy              0
Information Value    Inf


      level bin_count good bad  woe  iv entropy
1         a         2    0   2  Inf Inf       0
2        NA         1    1   0 -Inf Inf       0
3 (missing)         1    1   0 -Inf Inf       0
```

Actual plot labels, extracted with
`ggplot2::ggplot_build(plot(b, print_plot = FALSE))$layout$panel_params[[1]]$x$get_labels()`:
`c("a", "NA", "(missing)")`.
Stored level codes remain `c(1L, 2L, NA_integer_)`, with level metadata
`c("a", NA_character_)` and class `factor`.

The three-way fixture uses the same codes and response, with
`levels = c("NA", NA)`. Actual printed table:

```text
      level bin_count good bad  woe  iv entropy
1        NA         2    0   2  Inf Inf       0
2        NA         1    1   0 -Inf Inf       0
3 (missing)         1    1   0 -Inf Inf       0
```

Its actual plot labels are `c("NA", "NA", "(missing)")`. The two categories
remain separate bins, and their stored codes and metadata remain intact.
Evidence: `.fx5-tmp/actual-after.log` and `.fx5-tmp/document-repro.log`.

## Validation

`devtools::document()` completed. The exact requested full-suite expression ran:

```r
r <- as.data.frame(devtools::test(reporter = "summary"))
sum(r$failed) # 0
sum(r$error)  # 0
colSums(r[c("passed", "failed", "error", "skipped", "warning")])
# passed failed error skipped warning
#    703      0     0       0       0
```

This includes all 677 previous assertions and 26 new assertions in three test
groups. Existing snapshots passed without changes. Results:
`.fx5-tmp/full-tests.rds` and `.fx5-tmp/validate.log`.

Clean archive: `git archive HEAD` at `707ee6f`, extracted into the new, empty
`.fx5-tmp/src`. No test run modified that source before building it.
`R CMD build src` exited 0. Tarball `.fx5-tmp/rbin_0.3.0.tar.gz` has 94 entries,
including the new test file, and no scratch directories, website files,
`docs-dev` or `Rplots.pdf`.

Tarball MD5: **`6265d04e2f8167f28404f751e4c1411f`**.

Full `R CMD check --as-cran rbin_0.3.0.tar.gz` exited 0:
**0 errors / 0 warnings / 1 NOTE**. The check log was also counted explicitly
for ERROR, WARNING and NOTE statuses, independently of the exit code. Examples,
tests, vignette rebuilding, PDF and HTML manuals, loading/unloading and detritus
checks all passed. CRAN-mode tests report **691 passed / 0 failures / 0 warnings /
12 skipped**, with no test errors. All twelve skips are the existing six print
and six visual snapshot groups guarded by `skip_on_cran()`; all passed locally.

Every NOTE, verbatim (one):

```text
* checking CRAN incoming feasibility ... [30s] NOTE
Maintainer: 'Aravind Hebbali <aravindhebbali@rsquaredacademy.com>'

New maintainer:
  Aravind Hebbali <aravindhebbali@rsquaredacademy.com>
Old maintainer(s):
  Aravind Hebbali <hebbali.aravind@gmail.com>
```

This is the existing maintainer email-change NOTE documented in
`cran-comments.md`. No other NOTE occurred.

Both examples were verified again against the check's exact installed tarball
package, confirmed at `.fx5-tmp/rbin.Rcheck/rbin`. Assertions on plot labels,
stored typed levels and bin counts passed, and the printed output matches the
tables above. Evidence: `.fx5-tmp/verify-tarball.log`, `.fx5-tmp/build.log`,
`.fx5-tmp/check.log`, `.fx5-tmp/rbin.Rcheck/00check.log` and
`.fx5-tmp/rbin.Rcheck/tests/testthat.Rout`. Environment: Windows 11 x64 build
26300, R 4.6.1 (2026-06-24 ucrt).

Generated `tests/testthat/Rplots.pdf` files were deleted. All started R-heavy
commands completed; no server or watcher was started.

## Commands run

PowerShell 5.1 used separate statements and `;`, checking native exit codes
before dependent operations. All R-heavy commands used
`bash $HOME/.claude/bin/heavy-slot.sh pkg-rbin-fx5`; the wrapper reported that
the queue job already held its heavy slot. R executables are from
`C:/Program Files/R/R-4.6.1/bin/`.

Before each R command, `LANG`, `LC_ALL` and `LC_CTYPE` were set to `C`, and
`TMPDIR`, `TMP` and `TEMP` to the absolute `.fx5-tmp/` directory. Scratch scripts,
logs, temporary R files, the archive, source copy, tarball and check output all
stay in `.fx5-tmp/`.

Substantive commands, in addition to file reads, patches and status/diff review:

```powershell
bash $HOME/.claude/bin/heavy-slot.sh pkg-rbin-fx5 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' .fx5-tmp/validate.R
# devtools::document(); exact full-suite expression and counts above
bash $HOME/.claude/bin/heavy-slot.sh pkg-rbin-fx5 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' .fx5-tmp/document-repro.R
# regenerate Rd after sentence reflow; corrected actual-after driver
if (Test-Path -LiteralPath tests/testthat/Rplots.pdf) {
  Remove-Item -LiteralPath tests/testthat/Rplots.pdf
}
git diff --check
git add .Rbuildignore .gitignore NEWS.md R/rbin-factor.R man/rbin_factor.Rd tests/testthat/test-fx5.R
git commit -m 'fix: distinguish explicit NA levels from missing codes in displays (fx5)'
New-Item -ItemType Directory -Path .fx5-tmp/src
git archive --format=tar --output=.fx5-tmp/source.tar HEAD
tar -xf .fx5-tmp/source.tar -C .fx5-tmp/src
# Working directory .fx5-tmp; same absolute scratch environment:
bash $HOME/.claude/bin/heavy-slot.sh pkg-rbin-fx5 'C:/Program Files/R/R-4.6.1/bin/R.exe' CMD build src
bash $HOME/.claude/bin/heavy-slot.sh pkg-rbin-fx5 'C:/Program Files/R/R-4.6.1/bin/R.exe' CMD check --as-cran rbin_0.3.0.tar.gz
# Repository root:
Get-FileHash .fx5-tmp/rbin_0.3.0.tar.gz -Algorithm MD5
tar -tzf .fx5-tmp/rbin_0.3.0.tar.gz
$env:R_LIBS_USER=(Resolve-Path .fx5-tmp/rbin.Rcheck).Path
bash $HOME/.claude/bin/heavy-slot.sh pkg-rbin-fx5 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' .fx5-tmp/actual-after.R --installed
# Count ERROR/WARNING/NOTE status lines in 00check.log; inspect testthat.Rout.
# Delete generated tests/testthat/Rplots.pdf files; check final diff/status.
git diff --check
git add docs-dev/fx5-report.md
git commit -m 'docs: record rx3 display fix and clean archive verification (fx5)'
git status --short
```

The later report commit is build-excluded and does not change the checked
package source. No requested fix is deferred. All commits are local and end
in `(fx5)`. No push, gh/GitHub operation, stash, branch switch or merge was
performed.
