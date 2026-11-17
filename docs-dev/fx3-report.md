# rbin 0.3.0 — tie-aware equal-frequency binning (fx3)

2026-11-17. Worktree `F:/R/Packages/_worktrees/rbin-fx2`, branch
`task/rbin-fx2`, starting at `0337cae`. Aravind's option B is implemented.
The implementation and generated documentation commit is
`115f40210a5821cb84a74e9f19d11608f5fa7097`. The final clean-archive source
commit, including the test dependency declaration, is
`2f4f168e81092381fd4a9d09b2aa1475072fff0f`.

## Rule and scoring

After the existing response validation and missing-response removal, let `n`
be the number of non-missing predictors. For each `k = 1, ..., bins - 1`, take
the sorted observation at rank `ceiling(k * n / bins)`: the smallest observed
value whose cumulative count reaches the target (the type-1 empirical
quantile). All ties at that value stay in the lower group. The next distinct
observed value starts the next group. Repeated cuts and targets at the maximum
are omitted. Boundaries depend only on predictor values, not row order or
response values. Untied sizes differ by at most one; the remainder now follows
these empirical quantile targets rather than always going to the first bins.

For example, 70 zeroes followed by `1:30`, with 10 requested bins, gives counts
`70,10,10,10` and this message:

```text
Requested 10 equal-frequency bins; returning 4 non-missing bin(s) because tied values are kept together.
```

Constant data produces one populated bin and reports the requested and actual
numbers. No empty bins are returned. The existing error for more bins than
non-missing observations remains, as does the all-missing predictor error.

Both the top-level and summary-table `lower_cut`/`upper_cut` fields now contain
actual scoring intervals, with lower bounds `c(-Inf, cuts)` and upper bounds
`c(cuts, Inf)`. Intervals are left closed and right open, with an unbounded
last interval. New values in gaps go to the preceding group; new extremes go
to the outer groups. `rbin_create()` uses these same intervals. The old
crossing-ties check and its error message are removed. Dummy names retain
fx2's A2-L01 style: `age_<_30`, `age_<_32`, ..., `age_>=_57`; a single bin
uses `x_all`.

Missing predictors retain their final summary group and missing dummy
indicators; no missing-value dummy is added. Count reproduction therefore
compares non-missing dummy column sums to the non-missing summary rows, using
`na.rm = TRUE` when missing predictors are present. Missing responses still
warn and are removed before fitting. `include_na` behavior in the other
methods and all five retained fx2 policies are unchanged: NaN joins NA;
explicit NA selection combines missing values; explicit NA factor levels are
retained; ordered factors stay ordered; older winsorized fits without clamp
metadata require refitting.

## Before and after: mbank age, 10 bins

The before counts are the fx2 rank groups at `0337cae`, whose training dummy
creation errored because ties crossed boundaries. The after counts are also
the exact `colSums()` of the new training dummies.

| Bin | Before count | After count | After scoring interval |
|---|---:|---:|---|
| 1 | 453 | 521 | `[-Inf,30)` |
| 2 | 452 | 386 | `[30,32)` |
| 3 | 452 | 582 | `[32,35)` |
| 4 | 452 | 374 | `[35,37)` |
| 5 | 452 | 497 | `[37,40)` |
| 6 | 452 | 396 | `[40,43)` |
| 7 | 452 | 461 | `[43,47)` |
| 8 | 452 | 474 | `[47,52)` |
| 9 | 452 | 441 | `[52,57)` |
| 10 | 452 | 389 | `[57,Inf)` |

Both totals are 4,521 observations, 517 goods and 4,004 bads. The new first
row has 85 goods, 436 bads, good rate `85/521`, WoE `-0.412015279067964`
and IV `0.022874655321817`.

## Tests and snapshots

`tests/testthat/test-fx2-numeric.R` replaces N1's rejection expectation with
four test groups:

1. **A2-H01: tie-aware empirical quantiles reproduce training summaries**:
   constant data, mbank age with 10 and 5 bins, and 70% ties at the beginning,
   middle and end of the value range. Independent base-R cumulative counts
   establish expected membership. `fx2_expect_summary()` from `helper-fx2.R`
   independently checks every summary statistic, including counts, WoE, IV,
   entropy, cumulative counts, rates and proportions. Tests also compare all
   dummy cells and column sums, require no split tie groups or empty bins,
   check both copies of interval metadata, score zero rows, and reverse the
   training order to verify invariance.
2. **A2-H01: collapsed quantile cuts report requested and actual bin counts**:
   messages for 3-to-1 constant and 10-to-4 heavy-tie cases; explicit 6/4
   membership when the median's tied value goes to the lower group; single-bin
   dummy naming; no reduction message when two populated bins are possible.
3. **A2-H01: untied empirical quantiles differ in size by at most one**:
   lengths 9, 10, 23, 99 and 100, with 1, 2, 6 and n bins, including exact
   dummy-count reproduction and no reduction messages.
4. **A2-H01: ties retain missing predictors and supported frame inputs**:
   NA and NaN share the existing final missing group; data.frame, tibble and
   data.table inputs give identical fits and correct missing indicators.

The existing small-n test in `test-na-handling.R` now expects
`2,2,1,2,2,1` for untied `1:10` with six bins, following the documented
quantile targets. Existing response, input, factor, winsorization, addin,
interval and A2-L01 naming regressions remain in the passing suite.

Only two snapshots changed:

* `tests/testthat/_snaps/bins.md`, equal-frequency print section only:
  actual interval bounds, tie-preserving counts, class counts, rates, WoE,
  IV and entropy replace the split-rank results.
* `tests/testthat/_snaps/plots/ef-plot.svg`: corresponding WoE coordinates,
  y-axis ticks and actual interval labels change. The generated reference
  PNG was also visually inspected. The other five print and five plot
  snapshots are unchanged.

## Documentation

Roxygen details state the cumulative-count rule, which side receives ties,
cut collapse, messages, intervals and missing-value scoring. NEWS 0.3.0 has
one equal-frequency entry explaining the change from 0.2.1 and training
dummy-count agreement (A2-H01), replacing the rank/rejection policy.

README and introductory vignette sources now demonstrate equal-frequency
summaries, dummy column sums and plots. They previously lacked a dedicated
equal-frequency example. README Markdown, pkgdown home/article HTML and
Markdown, reference HTML/Markdown and plot PNG, NEWS output, search data and
LLM output were regenerated. README plot assets follow the existing mirrored
locations in `tools`, `man/figures`, `docs/tools` and
`docs/reference/figures`; the article has its own generated plot.

`docs-dev/fx2-reproducers.R` updates A2-H01 and A2-M06's numeric expectations.
`docs-dev/fx2-verify-docs.R` still checks every printed line of all six
reference examples, and now checks the equal-frequency summary in README and
article outputs plus the explicit new count vector. Its article parser
handles pkgdown's backticks/non-breaking spaces and its HTML parser handles
both reference output spans and highlighted comment spans. Source reproducers
and final documentation verification pass.

The first snapshot run found exactly the two intended differences (19 passed,
2 failed, 0 errors, 0 skipped); both new files were reviewed before acceptance.
The first render exposed the different article markup and a missing mirrored
README image. The parser and asset copies were corrected; `build_home()` and
the final verifier then succeeded. Pandoc's `--mathml`/`--mathjax` deprecation
messages and pkgdown's existing GitHub-icon aria-label advisory are separate
from R CMD check. Generated README preview HTML was moved into scratch.

## Validation and clean archive

All R-heavy commands used `bash ~/.claude/bin/heavy-slot.sh pkg-rbin-fx3`.
The wrapper reported that the `pkg-rbin-fx3` queue job's slot was already
counted. R jobs ran sequentially. All scratch is under ignored, build-excluded
`.fx3-tmp/`.

`devtools::document()` completed. The exact full-suite expression was run:

```r
r <- as.data.frame(devtools::test(reporter = "summary"))
sum(r$failed)  # 0
sum(r$error)   # 0
colSums(r[c("passed", "failed", "error", "skipped")])
# passed failed error skipped
#    551      0     0       0
```

The targeted numeric/missing suite had 366 passed, 0 failed, 0 errors and
0 skipped. The full suite had no warnings. Its results are saved in
`.fx3-tmp/full-tests.rds`. The final combined document/test/source-reproducer
run completed successfully; every audit reproducer passed after correcting
the demonstration's dummy-column selection. Its log is
`.fx3-tmp/document-test-reproducers-final.log`.

The first clean archive completed with 0 errors, 1 warning and 1 NOTE. The
warning was `'::' or ':::' import not declared from: 'tibble'`, caused by the
new real-tibble regression fixture. `tibble` is now declared in `Suggests`.
The full local suite and source reproducers were rerun successfully, and a
fresh archive was built and checked. First-attempt source, tarball and logs
are preserved in `.fx3-tmp/attempt1/`.

`git archive HEAD` from final source commit `2f4f168` was extracted into a new,
empty `.fx3-tmp/src`. `R CMD build src` and full
`R CMD check --as-cran rbin_0.3.0.tar.gz` both exited 0. The check log was
also inspected for ERROR and WARNING entries rather than relying on exit
status alone. The final result is **0 errors / 0 warnings / 1 NOTE**.

The CRAN-check tests report **539 passed / 0 failed / 0 warnings / 12 skipped**
and no test errors. All 12 skips are the existing six print and six visual
snapshots guarded by `skip_on_cran()`; all pass in the local full suite.
Examples, vignette generation and rebuilding, PDF and HTML manuals, dependency
analysis, loading/unloading and detritus checks passed.

Tarball: `.fx3-tmp/rbin_0.3.0.tar.gz`, 92 entries. Its contents contain no
scratch directories, `docs-dev` or website files.
**MD5: `15ca5552b96ec4f83727a2aa355437aa`.**

Every NOTE, verbatim (one):

```text
* checking CRAN incoming feasibility ... [29s] NOTE
Maintainer: 'Aravind Hebbali <aravindhebbali@rsquaredacademy.com>'

New maintainer:
  Aravind Hebbali <aravindhebbali@rsquaredacademy.com>
Old maintainer(s):
  Aravind Hebbali <hebbali.aravind@gmail.com>
```

This is the same maintainer email-change NOTE recorded in fx2 and explained
in `cran-comments.md`. No other NOTE was emitted.

The final verification process explicitly confirmed that rbin 0.3.0 was
loaded from `.fx3-tmp/rbin.Rcheck/rbin`, the check's exact tarball
installation. Every audit reproducer and every generated-documentation
comparison passed against that installation. The combined driver resets
`options(digits = 7)` between the high-precision reproducer and the printed
documentation comparisons.

Final evidence: `.fx3-tmp/document-test-reproducers-final.log`,
`.fx3-tmp/verify-docs-final.log`, `.fx3-tmp/build.log`,
`.fx3-tmp/rbin.Rcheck/00check.log`,
`.fx3-tmp/rbin.Rcheck/tests/testthat.Rout` and
`.fx3-tmp/verify-tarball.log`. This report is build-excluded; committing it
after the check does not change the checked package source.

Environment: Windows 11 x64 build 26300; R 4.6.1 (2026-06-24 ucrt),
data.table 1.18.6.1, ggplot2 4.0.3, testthat 3.3.2, shiny 1.14.0,
roxygen2 8.1.1, pkgdown 2.2.1 and rmarkdown 2.32.

## Commands run

PowerShell used separate statements and `;`, with explicit exit-code checks
between dependent native commands. `R` and `Rscript` below are the executables
in `C:/Program Files/R/R-4.6.1/bin/`. Each R invocation was prefixed with the
heavy-slot wrapper above. Environment for R runs:

```powershell
$env:LANG='C'; $env:LC_ALL='C'; $env:LC_CTYPE='C'
$env:TMPDIR=(Resolve-Path .fx3-tmp).Path
$env:TMP=$env:TMPDIR; $env:TEMP=$env:TMPDIR
$env:R_LIBS_USER=(Resolve-Path .fx3-tmp/lib).Path
```

Substantive commands, in addition to repository reads, diffs and local commits:

```text
Rscript .fx3-tmp/develop.R
  devtools::document()
  devtools::test(filter = "fx2-numeric|audit-bins|na-handling", reporter = "summary")
Rscript .fx3-tmp/snapshots.R
  devtools::test(filter = "^bins$|^plots$", reporter = "summary")
Move-Item tests/testthat/_snaps/bins.new.md tests/testthat/_snaps/bins.md -Force
Move-Item tests/testthat/_snaps/plots/ef-plot.new.svg tests/testthat/_snaps/plots/ef-plot.svg -Force
Rscript .fx3-tmp/validate.R
  devtools::document(); full test expression above; source reproducer
Rscript docs-dev/fx2-reproducers.R
R CMD INSTALL --no-multiarch --with-keep.source -l .fx3-tmp/lib .
Rscript .fx3-tmp/render.R
  devtools::load_all(".")
  rmarkdown::render("README.Rmd", quiet = TRUE, intermediates_dir = ".fx3-tmp")
  pkgdown::build_site(new_process = FALSE, install = FALSE, devel = TRUE,
                     lazy = FALSE, preview = FALSE, quiet = FALSE)
  pkgdown:::build_llm_docs()
Rscript .fx3-tmp/finish-docs.R
  pkgdown::build_home(preview = FALSE); source documentation verifier
Rscript docs-dev/fx2-verify-docs.R
git diff --check
git commit -m "fix: keep equal-frequency ties together and regenerate outputs (fx3)"
Rscript .fx3-tmp/validate.R
git commit -m "test: declare tibble used by frame input regression coverage (fx3)"
git archive --format=tar --output=.fx3-tmp/source.tar HEAD
tar -xf .fx3-tmp/source.tar -C .fx3-tmp/src
# Working directory .fx3-tmp, same absolute TMPDIR and R_LIBS_USER:
R CMD build src
R CMD check --as-cran rbin_0.3.0.tar.gz
Get-FileHash .fx3-tmp/rbin_0.3.0.tar.gz -Algorithm MD5
# Back at the repository root, using the check's exact tarball installation:
$env:R_LIBS_USER=(Resolve-Path .fx3-tmp/rbin.Rcheck).Path
Rscript .fx3-tmp/verify-tarball.R --installed
  source("docs-dev/fx2-reproducers.R")
  options(digits = 7)
  source("docs-dev/fx2-verify-docs.R")
```

The archive/build/check sequence ran once before and once after the test
dependency correction; the second sequence used a new, empty `.fx3-tmp/src`.

## Follow-ups and completion

The fx2 follow-up to decide a training/new-data tie policy is resolved by
option B and the implemented empirical-quantile intervals. No requested fx3
work is deferred. Remaining release work, written out in full:

1. Before CRAN submission, run win-builder release and devel, a macOS check
   and R-hub checks. This round records the local Windows clean-archive check;
   those other platforms were not run.
2. Refit saved pre-0.3.0 winsorized objects before scoring because their fitted
   clamp endpoints cannot be recovered reliably from the old display metadata.
3. Recompute previously saved split-rank equal-frequency fits to obtain the
   new tie-aware memberships and value-interval metadata. Loading an old
   serialized object does not recompute its training bins.
4. Test the declared data.table 1.9.4 and testthat 3.1.7 dependency floors on a
   compatible R environment before claiming old-toolchain compatibility.
   This round used the installed current dependencies.
5. The existing pkgdown navbar GitHub icon lacks an aria-label. Its advisory
   can be addressed in a separate website accessibility change; it does not
   affect binning results or the package check.

All started document, render, install, test, build, check and verification
processes completed. A final process inspection found no R, Rscript, Rterm,
Pandoc or pdflatex process running. No server, gadget or watcher was left
running. No push, gh/GitHub operation, stash, branch switch or merge was
performed. All commits are local and end in `(fx3)`.
