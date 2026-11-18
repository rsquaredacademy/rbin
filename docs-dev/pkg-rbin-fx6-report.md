# rbin 0.3.0 fix round 6

Date: 2026-11-18. Worktree: `F:/R/Packages/_worktrees/rbin-fx6`.
Branch: `task/rbin-fx6`. Baseline: `1bea39c`.
Checked package-source commit: `8f28090a781e72ef6082376c0b09dd66020acbbc`.
Version remains **0.3.0**. Both supplied audits were read in full. They remain
untracked and are absent from the source archive and package tarball.

## Finding dispositions and actual before/after values

### astra H1: exact equal-width boundaries — FIXED

`equal_width_cuts()` now computes `lo + (span * i) / bins` when that
intermediate product is finite. It no longer rounds `span / bins` before
multiplication. If the product overflows, it uses `lo + span * (i / bins)`;
if the span itself overflows, it retains the convex combination of finite
endpoints. Summary construction and dummy scoring use the same fitted cuts.

For `x = c(0,27,29,30,58)`, `y = c(0,0,1,0,1)`, 14 bins, both equal length
and winsorized binning with rate zero gave the following results:

| Value | Baseline | Fixed |
|---|---|---|
| Cut 7, printed with 17 significant digits | 29.000000000000004 | 29 |
| Counts, bins 7 and 8 | 2, 1 | 1, 2 |
| Goods | 1, 0 | 0, 1 |
| Bads | 1, 1 | 1, 1 |
| WoE | -0.4054651, Inf | Inf, -0.4054651 |
| IV | 0.06757752, Inf | Inf, 0.06757752 |
| Entropy | 1, 0 | 0, 1 |
| Dummy receiving the observation 29 | 7 | 8 |
| `mbank$previous`, 58 bins, counts 29:30 | 3, 0 | 0, 3 |

Tests in `tests/testthat/test-fx6-h1.R` assert exact membership, all summary
columns and every dummy value, rather than approximate equality of edges.
The integer grid has eight ranges: 0:58, -58:0, -29:29, 1:59, -13:97, 0:30,
0:127 and 17:76. Every range is fitted with bins 2 through 60 by both methods:
944 fits, compared against `1L + findInterval(x, min + span * i / bins)`.
The short witness and the shipped-data witness are tested with both methods.
Extreme-span fixtures cover both an overflowing span and an overflowing
intermediate product, with finite internal edges and exact row membership.

Baseline: 91 failing assertions, 1,826 passing assertions, no test errors,
one integer-overflow warning. Fixed: **1,917 passing assertions, no failures,
errors or warnings** across the three H1 test groups.

### astra H2: unsupported numeric predictor classes — FIXED by rejection

A shared class check rejects classed integer/double storage before numeric
arithmetic. It applies to all six fitters, including `rbin_factor()`, and to
`rbin_create()`. The categorical fitter continues to accept its documented
factor, Date and POSIXt categories; numeric interval fitters require ordinary
numeric storage. Nothing implicitly converts an integer64 predictor.

The diagnostic for the actual audit type is:

```text
unsupported predictor class 'integer64'; use as.numeric() when values are within +/-2^53
```

The real `bit64::as.integer64(1:8)` witness was rerun separately:

| API | Baseline | Fixed |
|---|---|---|
| Manual fit plus score | Summary 4,4; dummy sums 0,8 | Clear class error |
| Quantile fit plus score | Summary 3,5; dummy sums 0,8 | Clear class error |
| Equal-length fit plus score | Summary 3,5; dummy sums 0,8 | Clear class error |
| Equal-frequency fit | Computed-cut NA/NaN error | Clear class error |
| Winsorized fit | Only type==0 supported error | Clear class error |
| Factor fit | Eight one-row groups accepted | Clear class error |
| Score integer64 using a fit trained on plain numbers | Overflow warning and unmatched-value error | Clear class error |

`test-fx6-h2.R` constructs classed numeric predictors directly, avoiding a new
Suggests dependency solely to exercise rejection. It checks `integer64` and
an arbitrary numeric class on every fitter and the scorer, asserts the class
and conversion guidance in each diagnostic, and verifies the ordinary-double
control still has summary and dummy totals 4,4. Baseline: 14 failed and two
passed assertions. Fixed: **16 passed**. The separate actual-bit64 witnesses
are preserved in the before/after probe transcripts.

### astra H3: explicit NA versus literal NA in the factor addin — FIXED

The addin sends distinct option IDs (`level_1`, `level_2`, etc.). Its server
maps IDs back to the original typed levels, including an actual NA, and
validates unknown IDs. Labels are display text only. The explicit NA option
displays `(NA level)` and the literal category displays `NA`.

For the audit factor with codes `c(1L,2L,2L,NA_integer_)`, levels
`c("NA", NA)`, and response `c(0,1,1,0)`, the old HTML sent `value="NA"`
twice. Selecting the second option merged only the literal category:
`Merged = (count=1, good=0, bad=1)`, leaving groups of size two and one.
The fixed HTML sends `level_1` and `level_2`. Selecting the explicit NA option
gives `Merged = (3,2,1)` and preserves the literal category `(1,0,1)`.
Selecting the literal option preserves separate explicit-NA and missing-code
groups with counts 2 and 1.

`test-fx6-h3.R` exercises the real server with `MockShinySession`, extracts the
emitted HTML IDs, asserts their uniqueness, selects each option and asserts
actual group labels/counts/goods/bads. Baseline: three failed and three passed
assertions. Fixed: **six passed**. Existing addin tests now send the IDs that
the UI actually sends; their expected numerical values are unchanged.

### opus M1: character-response locale dependence — FIXED

`validate_response()` uses `sort(..., method = "radix")`. All six exported
fitters' response parameters and regenerated Rd files say:

> A character response is sorted in C-locale order (uppercase before lowercase)
> and the second value is the event; use a factor to choose the event level explicitly.

The audit response `c("no","Yes","no","no","Yes","no")` previously
gave goods/bads `(2,1)` in each bin in the C locale, and `(1,2)` in the English
locale. It now gives `(2,1)` in both. Choosing factor levels `c("no","Yes")`
still explicitly makes `Yes` the event, giving `(1,2)` in each bin.

`test-fx6-locale.R` checks all six fitters' complete summaries and explicit
factor-event controls in the available C, English_United States.utf8 and
en_US.UTF-8 collations on this machine, restoring the original collation.
Baseline: 12 failed and 24 passed assertions. Fixed: **36 passed**. NEWS
records the user-visible change.

### opus M2 / astra M8: winsor arguments — FIXED

`winsor_rate` must be one ordinary numeric scalar, finite and in [0, 0.5],
even when one or both clamp endpoints are supplied or the predictor is
constant. Invalid input gives:

```text
`winsor_rate` must be a single number in [0, 0.5]
```

Before: rate .6 or NA could give the unrelated `min_val`/`max_val` ordering
error; rate -.1 gave a raw probability error; .6 with `min_val=1` silently
fitted clamp `(1,2.2)`. All now give the named rate diagnostic.

`remove_na = FALSE` now explicitly rejects retained missing predictors,
including NaN and all-missing input, even when endpoints are supplied:

```text
`remove_na = FALSE` requires a predictor without missing values; use remove_na = TRUE
```

The documentation explains this contract. `include_na = FALSE` can first
remove missing predictors, after which `remove_na = FALSE` works. Missing
responses are still dropped before estimation as documented.

`test-fx6-winsor.R` asserts invalid-rate diagnostics across nine invalid input
forms and three endpoint configurations, a constant-data rejection, valid
rate-zero counts and rate-.5 clamp values. It also asserts six missing-value
diagnostics and the successful exclude-missing control. On the baseline each
of the two test groups stops with an unmatched raw error. Fixed: **30 and
seven passed assertions**, respectively. NEWS covers both changes.

### astra M7: incompatible fitted objects in rbin_create — FIXED

`rbin_create()` validates membership in its five documented numeric fit
classes before examining ranges. A factor fit, ordinary list, NULL, number
or data frame now gives a named `bins` diagnostic listing the supported
fitters. Previously a factor fit or ordinary list silently returned the
original two-column data unchanged.

`test-fx6-create.R` asserts these errors, verifies dummy totals for all five
numeric fit classes, and confirms valid all-missing quantile, equal-length
and winsorized fits still return unchanged data. Baseline: three failed
assertions followed by a test error on an invalid object. Fixed: **13 passed**.
NEWS records the new diagnostic.

### astra M9: CRAN comments on ties — FIXED documentation; runtime NOT A BUG

`cran-comments.md` now says tied values stay together, sizes are approximately
equal, the at-most-one size difference applies without ties, and heavy ties
that produce fewer bins give a requested/actual-bin-count message.

The audit witness `x=c(rep(1,6),2:3)`, four requested groups, correctly gives
counts and dummy sums **6,2**, with a **4-to-2 message**, both before and after.
`test-fx6-ties.R` asserts these values and the message: three assertions pass
on both trees. This runtime behavior was already correct.

Because CRAN comments are excluded from package builds, their regression
check is separate: `docs-dev/fx6-submission-check.R` asserts four values in
the actual submission text. It fails against `1bea39c` and passes after the
documentation correction. No package test depends on a build-excluded file.

### astra M6: integer-span overflow warnings — FIXED with H1

Endpoints are converted to double before subtraction. The integer witness
`c(-2000000000L,0L,2000000000L)` retains the correct counts **1,2**, now without
the two integer-overflow warnings. The H1/M6 test asserts no warning and exact
summary/dummy membership; it failed on the baseline. This was a small,
directly related arithmetic change in the function already being corrected.

## Fresh independent coverage comparisons

`docs-dev/fx6-coverage.R` reconstructs the two audits' described fixtures and
base-R calculations; the auditors' original external scripts were not supplied.
The two scripts were not available to rerun byte-for-byte. The committed
driver and full per-case CSVs make the recreated comparisons reviewable.

The driver uses independent `findInterval`, type-7/type-1 `quantile`,
`pmin`/`pmax`, integer category keys, `tabulate`, and explicit formulas for
all 16 reported summary columns. Counts, IDs and every dummy entry are exact
checks; derived floating values use tolerance 2e-14. It also checks total
entropy, empty-bin rules, bounds, numeric interval labels, variable names,
clamps, typed factor labels/metadata, warning counts and tie-message counts.
Scoring uses every original row, including rows omitted from fitting only
because the response is missing. Missing numeric predictors have all-NA
dummies. Factor scoring checks the documented level columns, including unused
levels, separately from the observed-level summary.

| Recreated comparison set | Before | After |
|---|---:|---:|
| opus coverage table, same method/case comparison counts | 171/171 OK | 171/171 OK |
| astra primary seven-method by eight-case table | 56/56 OK | 56/56 OK |
| astra primary cases repeated with include_na=FALSE wherever exposed | 48/48 OK | 48/48 OK |
| Targeted cuts, mbank previous, new scoring rows and all-missing cases | 12/16 OK | 16/16 OK |
| Total | **287/291 OK** | **291/291 OK** |

The opus comparisons cover mbank age/balance/pdays; 75% ties; NA/NaN
predictors with both inclusion policies; missing responses; pure bins;
factor responses with and without explicit NA levels; long names; job and
education factors; explicit NA predictor levels and missing codes; character
and numeric categories; pure levels; and combine/rebin/dummy behavior. Its
bin-count grid is 2,3,5,7,10,20 plus one for equal frequency.

The astra table covers Bank, Ties, Missing, Pure, One, Factor Y, Explicit and
Long for manual, quantile, equal frequency, equal length, winsorized, factor,
and factor-combine/summary/dummies. The Bank manual cuts are 29,34,40,51,56.
Targeted new rows contain tails, gaps, NA and NaN. Equal frequency's entirely
missing input remains an expected rejection, already exercised by the existing
test suite; the targeted all-missing comparisons cover the four methods that
accept it.

The four numerical changes in this comparison driver are exactly the two
methods on the exact midpoint and on mbank previous. The ordinary audit grids
remain correct, illustrating why their totals alone did not expose H1.
The more extensive 944-fit integer membership grid is in the package tests.

Full evidence:

* `docs-dev/fx6-coverage-before.csv` and `docs-dev/fx6-coverage-after.csv`;
* `docs-dev/fx6-probes-before.txt` and `docs-dev/fx6-probes-after.txt`, including
  the real integer64 and real addin-server witnesses;
* `docs-dev/fx6-coverage.R`, `docs-dev/fx6-probes.R` and
  `docs-dev/fx6-submission-check.R` for reproduction.

## Tests, documentation, archive build and CRAN check

All package tests ran in disposable copies below
`C:/Users/DELL/AppData/Local/Temp/rbin-fx6-20261118`, never in the worktree.
The baseline copy came from `git archive 1bea39c`; only the new regression
test files were added there. The fixed full-suite copy came from `git archive`
of the source fixes. Test-generated snapshots and graphics remain disposable.

The full requested test calculation was:

```r
r <- as.data.frame(devtools::test(reporter = "silent"))
sum(r$failed) # 0
sum(r$error)  # 0
colSums(r[c("passed", "failed", "error", "skipped", "warning")])
# passed failed error skipped warning
#   2731      0     0       0       0
```

This includes the existing 703 assertions and 2,028 new assertions. The
non-H1 baseline regression run reported 32 failed assertions and three test
errors; the H1 baseline run reported 91 failed assertions. Passing a test on
the baseline is claimed only for the already-correct tie behavior, not for its
incorrect CRAN submission text.

`devtools::document()` regenerated the six response parameter descriptions
and the winsor missing-value parameter. A final independent regeneration
printed only loading/updating messages, and `git diff --exit-code` returned
zero: **no documentation drift**. DESCRIPTION and NAMESPACE are unchanged.

The clean check source was a new `git archive HEAD` at `8f28090`, extracted
into `check-source`. No tests were run in that source directory before
`R CMD build check-source`. The build exited zero and produced
`rbin_0.3.0.tar.gz`. The separate `fixed-tests` directory was used for tests.

Tarball MD5: `e34fee90c84c55cc76777a811f8b059a`.
Tarball SHA256: `1c9dcb7cf67cfd3bb71eebaebabfb99e6c5e5a4db8a88cc967e234215aa3d2d3`.

`R CMD check --as-cran --no-manual rbin_0.3.0.tar.gz` exited zero:
**0 errors, 0 warnings, 1 NOTE**. The status lines in `00check.log` were also
counted separately from the process exit status. The sole NOTE is verbatim:

```text
* checking CRAN incoming feasibility ... [36s] NOTE
Maintainer: 'Aravind Hebbali <aravindhebbali@rsquaredacademy.com>'

New maintainer:
  Aravind Hebbali <aravindhebbali@rsquaredacademy.com>
Old maintainer(s):
  Aravind Hebbali <hebbali.aravind@gmail.com>
```

CRAN-mode package tests reported **2,719 passed, 0 failed, 0 warnings,
12 skipped**. The skips are the existing six print and six visual snapshot
groups guarded by `skip_on_cran()`; all passed in the local full suite.
The check's disposable installed-test copy deleted unused skipped snapshots;
the worktree snapshots remain unchanged. Examples, dependency checks,
loading/unloading, S3 checks, Rd checks, vignette rebuilding and detritus
checks passed. PDF manual checking was omitted by the requested `--no-manual`.

The tarball has 101 entries. Manifest inspection confirms neither supplied
root audit, any `docs-dev` file, Git metadata nor test-generated Rplots.pdf is
included. Existing legitimate files named `test-audit-*.R` remain included.
The environment was Windows 11 x64 build 26300, R 4.6.1 (2026-06-24 ucrt),
roxygen2 8.1.1. No unrelated check NOTE occurred.

The final report/evidence commit changes only build-excluded `docs-dev`
files; the checked package source remains the same. No win-builder, R-hub,
macOS check, submission or reverse-dependency run is claimed.

## Commands run

All shell commands use PowerShell-compatible statements and semicolons.
R is `C:/Program Files/R/R-4.6.1/bin/Rscript.exe` or the sibling `R.exe`.
Substantive commands are written out below; file inspection, patches and
ordinary `git diff`/`git status` reads are omitted from this reproduction block.

```powershell
$scratch = Join-Path $env:TEMP 'rbin-fx6-20261118'
New-Item -ItemType Directory -Path "$scratch/baseline" -Force
git archive --format=tar --output="$scratch/baseline.tar" 1bea39c
# Run tar in $scratch, with relative paths (the installed tar is MSYS tar):
tar -xf baseline.tar -C baseline
# Initial Windows absolute-path tar attempts failed; extracting relative to
# the scratch directory succeeded. Neither failure changed the repository.

# Add only each new test file to the disposable baseline copy.
Copy-Item tests/testthat/test-fx6-*.R "$scratch/baseline/tests/testthat/"
$env:LANG='C'; $env:LC_ALL='C'
& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' "$scratch/run-tests.R" "$scratch/baseline" fx6-h1
& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' "$scratch/run-tests.R" baseline 'fx6-(h2|h3|locale|winsor|create|ties)'
# The first fixed H1 test used a disposable file copy of tracked sources.
# The full suite used a fresh archive after all source fixes:
git archive --format=tar --output="$scratch/fixed.tar" HEAD
# In $scratch:
New-Item -ItemType Directory -Path fixed-tests -Force
tar -xf fixed.tar -C fixed-tests
& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' run-tests.R fixed-tests

# From the worktree, run the independent coverage/probe drivers:
& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' docs-dev/fx6-coverage.R "$scratch/baseline" "$scratch/coverage-before"
& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' docs-dev/fx6-coverage.R "$scratch/fixed-tests" "$scratch/coverage-after"
& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' docs-dev/fx6-probes.R "$scratch/baseline"
& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' docs-dev/fx6-probes.R "$scratch/fixed-tests"
& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' docs-dev/fx6-submission-check.R "$scratch/baseline"
& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' docs-dev/fx6-submission-check.R .
# The baseline submission check fails as expected; the fixed one passes.

& 'C:/Program Files/R/R-4.6.1/bin/Rscript.exe' -e 'devtools::document()'
git diff --exit-code
git diff --check
git archive --format=tar --output="$scratch/check-source.tar" HEAD
# In $scratch, with a new check-source directory:
New-Item -ItemType Directory -Path check-source -Force
tar -xf check-source.tar -C check-source
$env:LANG='C'; $env:LC_ALL='C'
$env:TMPDIR=(Get-Location).Path
$env:TMP=(Get-Location).Path
$env:TEMP=(Get-Location).Path
& 'C:/Program Files/R/R-4.6.1/bin/R.exe' CMD build check-source
& 'C:/Program Files/R/R-4.6.1/bin/R.exe' CMD check --as-cran --no-manual rbin_0.3.0.tar.gz
Get-FileHash rbin_0.3.0.tar.gz -Algorithm MD5
Get-FileHash rbin_0.3.0.tar.gz -Algorithm SHA256
tar -tzf rbin_0.3.0.tar.gz
```

The disposable `run-tests.R` changes directory to its first argument, calls
`testthat::set_max_fails(Inf)`, runs `devtools::test()` with the optional
second-argument filter and silent reporter, converts the result to a data
frame, saves it as RDS, and prints each group and sums of failed/error/passed/
skipped/warning. Logs include `h1-before.log`, `h1-after.log`,
`before-other.log`, `full-tests.log`, `coverage-before.log`,
`coverage-after.log`, `probes-before.log`, `probes-after.log`,
`submission-before.log`, `submission-after.log`, `document-final.log`,
`build.log`, `check.log`, and `rbin.Rcheck/00check.log` in the scratch directory.

## Local commits

1. `53e7926` — fix: preserve exact equal-width cut membership (rbin-fx6)
2. `39eaae5` — fix: reject unsupported numeric predictor classes (rbin-fx6)
3. `174bb6a` — fix: decode distinct factor addin category IDs (rbin-fx6)
4. `2f4674c` — fix: code character responses in C-locale order (rbin-fx6)
5. `fa75381` — fix: validate winsor rates and missing-value options (rbin-fx6)
6. `b4af992` — fix: require a numeric rbin fit for dummy creation (rbin-fx6)
7. `8f28090` — docs: correct CRAN comments on equal-frequency ties (rbin-fx6)
8. The final documentation commit records this report, comparison drivers and
   evidence, with the required `(rbin-fx6)` suffix.

No push, gh/GitHub command, branch switch or access to another worktree was
performed. No subagents were used.

## Follow-ups left open for a later release

* **astra M1 — Multi-line addin data expressions.** Both addins retain a
  vector-valued `deparse()` default name, while the widget sends a scalar.
  Normalize the display name to one string and test both real servers with a
  multi-line-deparsed frame expression. This was deliberately not included in
  the factor option-ID change.
* **astra M2 — Exact boundary text.** A lone cut such as
  `1 + .Machine$double.eps` can display as 1 although membership uses the
  correct larger double. Make display text round-trip or provide an exact
  lookup; assess changed labels and snapshot expectations separately.
* **astra M3 — Factor display collisions.** Literal `NA`, literal `(missing)`,
  an explicit NA level and a missing code can still share printed/plot text.
  Stored keys and statistics are correct. Choose collision-proof display
  labels and update existing display tests in a separate change. The addin's
  option IDs now remain distinct regardless of display text.
* **astra M4 — Historical upper-cut display endpoint.** For large maxima,
  `max + 1` can equal `max`. The fitter/scorer still place the maximum in the
  unbounded final bin, but public metadata can be misread as a strict scoring
  bound. Document the endpoint's display role or migrate it to Inf consistently.
* **astra M5 — Existing target in ordered combination.** When the target level
  already precedes selected levels, it stays in its existing position rather
  than moving to the first-selected position described in the documentation.
  Decide and document this ordinal policy before changing comparisons.
* **astra M6 is resolved in this round**, rather than deferred: widening
  before subtraction removed the integer-overflow warnings as part of H1.
* **opus L1 — Factor order.** Summaries follow first appearance rather than
  declared factor order, which is particularly unhelpful for ordered-factor
  trend plots. Define the desired compatibility policy and update plots/tests.
* **opus L2 — Observed summary versus declared dummy levels.** Summaries omit
  unobserved levels and follow appearance order; factor dummies include every
  declared level in level order. Row assignments remain correct. Reconcile or
  explicitly document the difference in sets and order.
* **opus L3 — Printed headers and return values.** The numeric Bins header
  counts the missing row, print methods invisibly return a table subset, and
  a single-class response prints IV NA without explanation. These cosmetic/
  S3-contract changes remain deferred.
