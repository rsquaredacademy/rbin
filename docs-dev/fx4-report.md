# rbin 0.3.0 — rx2 re-audit fixes (fx4)

2026-11-17. Worktree `F:/R/Packages/_worktrees/rbin-fx2`, branch
`task/rbin-fx2`, starting at `27a85bb`. The checked source commit is
`578d987c6737cf4caa3d9c94459ca5f9061c197d`:
`fix: resolve rx2 re-audit findings and refresh documentation (fx4)`.
All four Hydrogen findings and both DeepSeek findings are fixed; their
column-name findings describe the same defect. No finding is deferred.

## Findings, tests and actual-after results

All new tests are in `tests/testthat/test-fx4.R`. The actual-after log is
`.fx4-tmp/actual-after.log`; final installed verification is recorded separately.

| Finding | Status and implementation | Exact test title(s) | Reproducer actual after |
|---|---|---|---|
| rx2h-H1 (New-H1) | Fixed. Reject NA/NaN results immediately after quantile computation. Shared numeric assignment also rejects missing boundaries and any non-missing predictor left unmatched. Valid infinite boundaries remain supported. | `rx2h-H1: quantiles reject NaN cuts from opposite infinities`; `rx2h-H1: valid single-infinity quantiles retain their memberships`; `rx2h-H1: numeric assignment never treats an unmatched value as missing` | On `x = c(-Inf,-Inf,Inf,Inf)`, both 2 and 4 bins error with `computed cut points contain NA or NaN; cannot form numeric bins`, for both `include_na` settings. No false missing group is returned. On `x = c(1,2,3,4,Inf)`, 2 bins retain upper bounds `c(3,Inf)` and counts/dummy sums `c(2,3)`; 5 bins have upper bounds `c(1.8,2.6,3.4,Inf,Inf)` and counts/dummy sums `c(1,1,1,1,1)`. |
| rx2h-H1, other numeric methods | Fixed/tested. Manual cuts reject NA/NaN before assignment; equal-width cuts already reject infinite endpoints and invalid finite computations; winsorization already rejects infinite predictors; equal-frequency cuts select observed non-missing values without interpolation. All use the shared assignment guard. | `rx2h-H1: every other numeric method handles infinite predictors explicitly` | The same opposite-infinity fixture gives `equal-width binning requires finite predictor values` and `predictor must contain only finite or missing values for winsorization`. Equal-frequency requests for 2 or 4 bins return counts/dummy sums `c(2,2)` (the latter collapses with the existing message). Manual cut 0 returns `c(2,2)`; cuts `c(-Inf,0,Inf)` return `c(0,2,0,2)`. No non-missing row becomes a missing group. |
| rx2h-L1 (New-L1) | Fixed. `bin_ranges()` formats all equal-frequency boundaries in one `format_boundaries()` call, including the final repeated threshold. | `rx2h-L1: final equal-frequency dummy boundary retains shared precision` | On the audit's close-double fixture, names are `c("y","x","x_<_1.0000000000000011","x_<_1.000000000000002","x_>=_1.000000000000002")`. All six dummy rows also match their expected groups. |
| rx2h-L2 (New-L2) / rx2d-L1 | Fixed. All five numeric fitters resolve both arguments with the same `column_name()` helper used by `rbin_factor()`. `rbin_create()` already used it and now has explicit regression coverage. Every response/predictor parameter documents bare names, character names and variables holding character names consistently, including factor APIs. | `rx2h-L2 / rx2d-L1: numeric APIs resolve bare, string, indirect and long names` | Audit fixture `rbin_manual(d,"y","x",2.5)` returns counts `c(2,2)`. For every numeric fitter, whole-object comparisons with bare calls return `TRUE` for strings and indirect names; both corresponding `rbin_create()` comparisons return `TRUE`. Long non-syntactic response and predictor names (>60 characters) also produce identical results across bare, indirect and programmatic string calls. |
| rx2h-L3 (New-L3) | Fixed. First lower bound is the smaller of the observed minimum and first cut; final upper bound is the larger of the old maximum-plus-one display bound and final cut. | `rx2h-L3: manual display bounds stay ordered outside the observed range` | Exact audit fixture `y=c(0,1), x=c(10,20), cuts=c(2,3)` gives lower bounds `c(2,2,3)`, upper bounds `c(2,3,21)` and counts `c(0,0,2)`. Additional below-range, above-range and spanning cuts on `1:4` all satisfy `lower_cut <= upper_cut` and reproduce counts with dummies. Above-range cuts `c(5,10)` give lower `c(1,5,10)`, upper `c(5,10,10)`, counts `c(4,0,0)`. |
| rx2d-L2 | Fixed at display time in both print and plot methods, using shared label formatting. Stored typed labels and factor metadata are preserved. Only genuine missing values get the new label when a literal `"NA"` category is present. | `rx2d-L2: literal NA and genuine missing bins have distinct display labels` | Audit fixture `g=c("NA","NA",NA,NA)` prints summary levels `NA` and `(missing)` with counts `c(2,2)`, goods/bads `c(1,1)`, WoE/IV `c(0,0)`. Plot labels are `c("NA","(missing)")`; stored levels remain `c("NA",NA)`. Character, factor and ordered inputs pass. With a literal NA string, explicit NA factor level and missing code, plot labels are `c("NA","NA","(missing)")`; only the missing code is relabelled. Ordinary `a`/missing output remains `c("a","NA")`, and `include_na=FALSE` adds no missing label. |

## Preserved policies and documentation

Every fx2/fx3 regression remains in the passing suite, including independent
base-R summary comparisons and all twelve unchanged print/visual snapshots.
All six established choices remain:

1. Aravind's option B: equal-frequency empirical quantile targets keep ties
   together, omit collapsed cuts, report fewer bins and score using the same
   value intervals. The mbank age counts remain
   `521,386,582,374,497,396,461,474,441,389`.
2. Numeric NaN and NA share a missing-value group.
3. Selecting NA explicitly in factor combination selects both explicit NA
   levels and genuinely missing codes.
4. Explicit NA factor levels remain categories, distinct from missing codes,
   and remain present with `include_na=FALSE`.
5. Ordered factors retain their class and ordering metadata.
6. Older winsorized objects lacking fitted clamp metadata require refitting.

NEWS 0.3.0 records rx2h-H1, rx2h-L1, rx2h-L2/rx2d-L1, rx2h-L3 and rx2d-L2.
Roxygen regenerated all eight affected Rd pages. The corresponding pkgdown
HTML/Markdown pages, NEWS, search and LLM outputs were regenerated; existing
README/article examples still agree with every printed summary line. Changes
to generated home output only remove trailing whitespace from existing results.

## Validation

All R-heavy commands ran sequentially through
`bash ~/.claude/bin/heavy-slot.sh pkg-rbin-fx4`. The wrapper reported that the
queue job's heavy slot was already counted. All scratch is in `.fx4-tmp/`,
which is gitignored and excluded from R builds. The local tests' generated
`Rplots.pdf` was moved from `tests/testthat/` into this scratch directory.

`devtools::document()` completed. The exact requested test expression ran:

```r
r <- as.data.frame(devtools::test(reporter = "summary"))
sum(r$failed)  # 0
sum(r$error)   # 0
colSums(r[c("passed", "failed", "error", "skipped")])
# passed failed error skipped
#    677      0     0       0
```

There are 126 new passing assertions in eight fx4 test groups, in addition to
the previous 551 passing assertions. No test warnings or skips occurred.
Results: `.fx4-tmp/full-tests.rds` and `.fx4-tmp/validate-final.log`.
Every `docs-dev/fx2-reproducers.R` check passes. Generated-document verification
also passes (`.fx4-tmp/render-final.log`).

The first site render stopped because the fresh scratch library had no installed
`rbin` for its vignette subprocess. Installing the package into `.fx4-tmp/lib`
and rerunning the render resolved it. Pandoc's existing `--mathml`/`--mathjax`
deprecation messages and pkgdown's GitHub-icon aria-label advisory are rendering
messages, separate from the package check. No snapshots were rewritten.

`git archive HEAD` from source commit `578d987` was extracted into a new,
empty `.fx4-tmp/src`. `R CMD build src` and full
`R CMD check --as-cran rbin_0.3.0.tar.gz` both exited 0. The check log was
inspected for errors and warnings, independently of its exit status:
**0 errors / 0 warnings / 1 NOTE**. Examples, vignette rebuilding, PDF and HTML
manuals, dependencies, loading/unloading and detritus checks all passed.

The CRAN-mode tests report **665 passed / 0 failures / 0 errors / 0 warnings /
12 skipped**. All twelve skips are the existing six print and six visual
snapshot groups guarded by `skip_on_cran()`; all pass locally.

Tarball: `.fx4-tmp/rbin_0.3.0.tar.gz`, 93 entries (one new test file relative
to fx3), with no scratch directories, `docs-dev` or website files.
**MD5: `3c20c734aa3c5a0a976c3ffc18095bc7`.**

Every NOTE, verbatim (one):

```text
* checking CRAN incoming feasibility ... [36s] NOTE
Maintainer: 'Aravind Hebbali <aravindhebbali@rsquaredacademy.com>'

New maintainer:
  Aravind Hebbali <aravindhebbali@rsquaredacademy.com>
Old maintainer(s):
  Aravind Hebbali <hebbali.aravind@gmail.com>
```

This is the same maintainer email-change NOTE recorded in fx2/fx3 and
explained in `cran-comments.md`. No other NOTE was emitted.

Final verification explicitly confirmed that `rbin` was loaded from
`.fx4-tmp/rbin.Rcheck/rbin`, the check's exact tarball installation. Every
fx2 audit reproducer, every generated-document comparison, and the new fx4
actual-after cases passed there. The exact rx2h-L3 audit fixture was also
asserted there. The verification driver resets `options(digits=7)` between
the high-precision fx2 reproducer and documentation comparisons.

Evidence: `.fx4-tmp/build.log`, `.fx4-tmp/check.log`,
`.fx4-tmp/rbin.Rcheck/00check.log`,
`.fx4-tmp/rbin.Rcheck/tests/testthat.Rout` and
`.fx4-tmp/verify-tarball.log`. Environment: Windows 11 x64 build 26300,
R 4.6.1 (2026-06-24 ucrt). This report is build-excluded; its later commit
does not change the checked package source.

## Commands run

PowerShell 5.1 used separate statements and `;`, with exit-code checks between
dependent native commands. R executables are from
`C:/Program Files/R/R-4.6.1/bin/`. Each R command below used the heavy-slot
wrapper shown above. Before R runs:

```powershell
$env:LANG='C'; $env:LC_ALL='C'; $env:LC_CTYPE='C'
$env:TMPDIR=(Resolve-Path .fx4-tmp).Path
$env:TMP=$env:TMPDIR; $env:TEMP=$env:TMPDIR
$env:R_LIBS_USER=(Resolve-Path .fx4-tmp/lib).Path
```

Substantive commands, in addition to file reads, edits, diffs and status checks:

```text
Rscript .fx4-tmp/validate.R
  devtools::document()
  exact full-suite expression above
  source("docs-dev/fx2-reproducers.R")
Rscript .fx4-tmp/render.R
  devtools::load_all(".")
  pkgdown::build_site(new_process=FALSE, install=FALSE, devel=TRUE,
                      lazy=FALSE, preview=FALSE, quiet=FALSE)
  pkgdown:::build_llm_docs()
  source("docs-dev/fx2-verify-docs.R")
R CMD INSTALL --no-multiarch --with-keep.source -l .fx4-tmp/lib .
Rscript .fx4-tmp/render.R
git restore -- docs/CONTRIBUTING.html
Rscript .fx4-tmp/validate.R
Rscript .fx4-tmp/reproducers.R
Move-Item -LiteralPath tests/testthat/Rplots.pdf -Destination .fx4-tmp/local-tests-Rplots.pdf
git diff --check
git add .Rbuildignore .gitignore NEWS.md R man docs tests/testthat/test-fx4.R
git commit -m "fix: resolve rx2 re-audit findings and refresh documentation (fx4)"
git archive --format=tar --output=.fx4-tmp/source.tar HEAD
tar -xf .fx4-tmp/source.tar -C .fx4-tmp/src
# Working directory .fx4-tmp; same absolute TMPDIR and R_LIBS_USER:
R CMD build src
R CMD check --as-cran rbin_0.3.0.tar.gz
Get-FileHash .fx4-tmp/rbin_0.3.0.tar.gz -Algorithm MD5
# Repository root, using the check's exact tarball installation:
$env:R_LIBS_USER=(Resolve-Path .fx4-tmp/rbin.Rcheck).Path
Rscript .fx4-tmp/verify-tarball.R --installed
  source("docs-dev/fx2-reproducers.R")
  options(digits=7)
  source("docs-dev/fx2-verify-docs.R")
  source(".fx4-tmp/reproducers.R")
  exact rx2h-L3 audit fixture and assertions
git add docs-dev/fx4-report.md
git commit -m "docs: record rx2 fixes and clean archive verification (fx4)"
```

The initial validation had 674 passing assertions; adding the valid infinite
interior-cut fixture brought the final run to 677. The first render's log is
`.fx4-tmp/render.log`; the successful rerun is `.fx4-tmp/render-final.log`.
The unrelated generated blank line in `docs/CONTRIBUTING.html` was restored.

## Follow-ups

No requested finding is deferred. Remaining release follow-ups, written out
in full from fx3:

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
5. The existing pkgdown navbar GitHub icon lacks an aria-label. Address its
   advisory in a separate website accessibility change; it does not affect
   binning results or the package check.

All started document, install, render, test, build, check and verification
processes completed. The final process inspection found no R, Rscript,
Rterm, Pandoc or pdflatex process running. No gadget, server or watcher was
started. All commits are local and end in `(fx4)`. No push, gh/GitHub
operation, stash, branch switch or merge was performed.
