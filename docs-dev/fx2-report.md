# rbin 0.3.0 — fix round 2

2026-11-17; worktree `F:/R/Packages/_worktrees/rbin-fx2`, branch
`task/rbin-fx2`, starting at `0389f9726dfc280b9a67a4cc5e5d59f29fb65024`.
The aud2 whole-package audit and Hydrogen factor audit are both addressed:
**14 aud2 findings and 13 Hydrogen findings fixed; none partly fixed or deferred.**
Twin mappings below do not hide distinct manifestations: Hydrogen M5 also
covers the summary's ordered class, beyond aud2 M01's combination case.

No exports or arguments were added or removed. No push, GitHub operation,
stash, branch switch, merge, or edit of another worktree was performed.
All scratch is in the ignored, build-excluded `.fx2-tmp/` directory.

## Findings and actual-after results

Each result below equals the audit's expected value or an explicitly permitted
policy alternative. `n/g/b` means bin counts / goods / bads. Test paths are
relative to `tests/testthat/`; full titles appear in the next table. Reproducers
are also executable in [fx2-reproducers.R](fx2-reproducers.R), which prints
actual and expected values and stops on any discrepancy. It was run against
both source and the installed final package.

| aud2 ID | Hydrogen twin | Status | Test file / test key | Reproducer actual after |
|---|---|---|---|---|
| A2-H01 | — | fixed | `test-fx2-numeric.R`, N1 | Constant-data learned counts `2,2,2`; scoring errors `cannot score equal-frequency bins with ties across bin boundaries; use an interval binning method`. mbank scoring gives the same explicit error. Untied groups reproduce every learned indicator. |
| A2-H02 | — | fixed | `test-fx2-numeric.R`, N2 | Rate `.5`: dummy counts `0,10`, matching summary; limits `10,20` on `1:4`: `0,4`. Fitted clamps are stored and applied, including to new rows. |
| A2-H03 | H3; overlaps M4/M5 | fixed | `test-fx2-factor.R`, F1 | `n=2,1,2,1; g=1,0,1,1; b=1,1,1,0`; total 6, goods/bads 3/3, first WoE 0, total entropy `0.666666666666667`. Explicit NA level and missing code remain separate. |
| A2-H04 | H1 | fixed | `test-fx2-factor.R`, F2 | `n=2,3,1; g=1,0,1; b=1,3,0`; equal-sized variant `n=2,2,2; g=1,0,1; b=1,2,1`. Typed labels retain their exact values. |
| A2-H05 | — | fixed | `test-fx2-numeric.R`, N3 | Equal-width and winsorized: `n=3,0,3`, IV `0.462098120373297`, weighted entropy `0.918295834054490`; internal cuts finite. Infinite predictors reject explicitly. |
| A2-H06 | — | fixed | `test-fx2-numeric.R`, N4 | `1:11`: exact cuts `3,5,7,9`, counts `2,2,2,2,3`, IV `0.0924196240746594`, weighted entropy `0.977717045651224`. `1:16`: counts `3,3,3,3,4`. |
| A2-M01 | H5/M5; H4 is additional | fixed | `test-fx2-factor.R`, F4 | Unrelated rename: codes `1,3,2`, levels `A,b,NA`; ordered class `c("ordered","factor")`. Both NA kinds survive unselected. |
| A2-M02 | M1 | fixed | `test-fx2-factor.R`, F5 | All four zero-level empty/all-missing factor/character fixtures return the original frame unchanged with zero appended columns. Declared levels still get empty dummy columns. |
| A2-M03 | — | fixed | `test-fx2-addins.R`, A1 | Both real addin servers validate `Data 'nonexistent_new_data' not found.`; changing to a second bad name also validates, and a valid replacement returns the replacement frame. |
| A2-M04 | Related to M3, distinct defect | fixed | `test-fx2-factor.R`, F7 | All six binning exports, both directions: counts `2,2`; all-no goods `0,0`, bads `2,2`; all-yes goods `2,2`, bads `0,0`; class-dependent WoE/IV undefined as for numeric responses. |
| A2-M05 | — | fixed | `fx2-reproducers.R`, A2-M05 metadata/API checks | DESCRIPTION requires `testthat (>= 3.1.7)`; `getExportedValue("testthat", "with_mocked_bindings")` is callable in the check environment. The old-version binary was not installed. |
| A2-M06 | — | fixed | [fx2-verify-docs.R](fx2-verify-docs.R), six rendered-summary comparisons | mbank first/last rank counts `453,452`; first bad `376`, good rate `0.169977924944812`, WoE `-0.4612225444`, IV `0.0253811118`. Every printed summary line of all six reference examples matches current code in HTML and Markdown. README, vignette, images, NEWS and reference/data docs regenerated. |
| A2-L01 | — | fixed | `test-fx2-numeric.R`, N5 | Scoring `2,3,8,9`: names `x_<_9`, `x_>=_9`; indicators `1,1,1,0` and `0,0,0,1`, matching the conditions. |
| A2-L02 | — | fixed | `fx2-reproducers.R`, A2-L02 + regenerated Rd/site details | Cut 37 on `35,36,36.5,40` still correctly gives `3,1`; prose explicitly says the +1 recipe assumes integers and continuous bounds include all values strictly below the cut. |

Every Hydrogen ID is mapped explicitly, including NEW findings:

| Hydrogen ID | aud2 twin / NEW | Status | Test file / test key | Reproducer actual after |
|---|---|---|---|---|
| H1 | A2-H04 | fixed | `test-fx2-factor.R`, F2 | `1e10` / `1e10+1e-5`: `n=2,2; g=0,2; b=2,0`; distributions `good=0,1`, `bad=1,0`; WoE `Inf,-Inf`, IV `Inf,Inf`. |
| H2 | **NEW** | fixed | `test-fx2-factor.R`, F3 | NaN-only missing case `n=2,2; g=1,1; b=1,1`, WoE/IV 0. NaN plus NA: `n=2,4; g=1,2; b=1,2`, total 6. All-NaN predictor: one bin with count 2, proportion 1. |
| H3 | A2-H03 | fixed | `test-fx2-factor.R`, F1 | Four groups with `n=1,1,1,1; g=0,1,0,1; b=1,0,1,0`; totals 4/2/2. |
| H4 | **NEW** | fixed | `test-fx2-factor.R`, F4 | NA alone produces `a,b,missing`, levels `a,b,missing`; selecting `a,NA` produces `other,b,other`. Same policy applies with an explicit NA level plus a genuine missing code. |
| H5 | A2-M01 | fixed | `test-fx2-factor.R`, F4 | Unrelated rename retains levels `x,b,NA` and `is.na=FALSE,FALSE,FALSE`. |
| M1 | A2-M02 | fixed | `test-fx2-factor.R`, F5 | Empty/all-missing factor and character frames unchanged. |
| M2 | **NEW** | fixed | `test-fx2-factor.R`, F6 | String literals, variables holding strings and a long bare non-syntactic name return identical summary values to bare `y,g`. |
| M3 | **NEW**, related to A2-M04 | fixed | `test-fx2-factor.R`, F7 | `no,yes,NA` explicit-level response warns `Dropping 1 row with missing response.` and counts both remaining rows; `no,NA` errors `response must be binary; the factor has 1 level(s) present`, without a spurious drop warning. |
| M4 | **NEW metadata/policy**, shared fix with A2-H03 | fixed | `test-fx2-factor.R`, F1 | Levels remain `a,b,NA`, `is.na` for summary labels `FALSE,FALSE,FALSE`; `include_na=FALSE` retains all three explicit levels with counts `2,2,2`. |
| M5 | A2-M01 for combine; **NEW** for summary | fixed | `test-fx2-factor.R`, F1/F4 | `is.ordered()` is TRUE for both combined predictor and summary level. |
| M6 | **NEW** | fixed | `test-fx2-factor.R`, F8 | Built plot x-axis labels `a,b,NA` as strings, with no missing tick label. |
| L1 | **NEW** | fixed | `fx2-reproducers.R`, Hydrogen L1 Rd check | `var` is documented as the bare or character name of a factor or character column in `data`. |
| L2 | **NEW** | fixed | `test-fx2-factor.R`, F6; `fx2-reproducers.R`, Hydrogen L2 Rd check | Docs describe bare/string/indirect names, accepted predictor types, first-appearance cumulative order and final missing groups; bare-only limitation was removed by M2. |

## Regression test titles and baseline evidence

| Key | Exact testthat title |
|---|---|
| N1 | A2-H01: scoring rejects rank groups split across tied values |
| N2 | A2-H02: scoring applies the fitted winsor clamp even for collapsed ranges |
| N3 | A2-H05: equal widths stay finite over overflowing finite ranges |
| N4 | A2-H06: quantile probabilities preserve exact sample membership |
| N5 | A2-L01: equal frequency dummy names describe the scoring intervals |
| F1 | A2-H03 / Hydrogen H3 M4 M5: factor codes retain both NA kinds and order |
| F2 | A2-H04 / Hydrogen H1: typed category keys never join on display text |
| F3 | Hydrogen H2: NaN and NA predictor rows share a conserved missing bin |
| F4 | A2-M01 / Hydrogen H4 H5 M5: combining remaps codes and NA consistently |
| F5 | A2-M02 / Hydrogen M1: zero level predictors append zero dummy columns |
| F6 | Hydrogen M2: factor arguments resolve bare, string and indirect column names |
| F7 | A2-M04 / Hydrogen M3: response coding retains declared binary levels and drops NA levels |
| F8 | Hydrogen M6: factor plot labels identify missing bins |
| A1 | A2-M03: both addins validate a changed unresolved data name |

The original implementation was extracted with `git archive 0389f97` into
`.fx2-tmp/baseline`, and only the new tests/helpers were copied into it.
All **14 test groups fail or error on that pristine baseline**: 46 passed
assertions, 77 failed assertions, 4 test errors, 0 skipped. This includes the
exact audit cases and additional variants. Logs and the result table are
`.fx2-tmp/baseline-final.log` and `.fx2-tmp/baseline-tests.rds`.

The independent base-R helper computes counts, cumulative counts, proportions,
rates, distributions, WoE, distribution differences, IV, entropy and weighted
entropy without calling rbin's helpers. High tests compare all those fields
and the individual dummy cells where applicable. Coverage includes constant
and crossing ties plus mbank, collapsed clamps above/below the data and at
large finite values, both kinds of factor NA, unequal/equal-sized colliding
numeric groups, temporal/logical categories, all-NaN inputs, ordered factors,
overflow at scales 1e308 and 1.7e308, infinite inputs, and quantile lengths
11/16/21. Existing first-round tests also remain green.

## Implementation

* `R/rbin-core.R`: factor groups use integer IDs derived from typed keys, not
  their printed labels. Missing numeric keys are normalized before grouping;
  factor levels and genuine missing codes retain their distinct codes.
  Combination remaps integer codes while preserving level order/class.
* `R/utils.R`: shared summaries match typed IDs. Response validation retains
  declared binary coding, excludes explicit NA response levels from classes,
  and lets the existing missing-response path warn/drop those rows. Column
  resolution handles long symbol names without `deparse()` line wrapping.
* `R/rbin-equal-length.R`: overflowing finite ranges use convex combinations;
  generated edges must be finite and ordered. Infinite endpoints reject.
* `R/rbin-quantile.R`: internal probabilities are `seq_len(bins-1L)/bins`.
* `R/rbin-create-bins.R`: score using stored winsor clamps, reject ambiguous
  crossing ties, and label actual equal-frequency scoring intervals.
* `R/rbin-factor.R`: resolve column arguments consistently, preserve zero-level
  inputs during dummy creation, and render missing tick labels explicitly.
* `R/rbin-addins.R`: unresolved changed names cannot fall back to captured data.
* DESCRIPTION is 0.3.0 with testthat >=3.1.7. NEWS groups both unreleased rounds
  by function and retains each finding ID. The 0.2.1-and-older text, accidentally
  absent from the starting NEWS, was restored unchanged from `176bda4`.

## Needs decision — implemented policies and alternatives

These choices are implemented, tested and documented; no approval is required
to complete this fix round and no wrong-result path is left pending.

1. **Crossing rank ties:** reject dummy scoring. Alternatives are retaining
   training membership plus an explicit new-row tie policy, or changing rank
   binning to keep ties together with unequal group sizes. Either alternative
   changes the method's contract; this fix uses the audit's narrow rejection.
2. **NaN predictors:** merge with ordinary numeric NA in one final missing bin,
   consistent with `include_na`. Alternative: distinct NA and NaN bins.
3. **Selecting NA in factor combination:** combine both an explicit NA level
   and genuine missing codes. Alternatives: select only an explicit NA level,
   or reject NA selections. Unselected NA codes/levels stay distinct.
4. **Explicit NA predictor levels:** preserve as valid factor categories even
   under `include_na=FALSE`; only missing codes are excluded. Alternative:
   treat explicit NA levels as missing, losing factor-level semantics.
5. **Ordered combinations:** retain the ordered class and use the first
   selected level's position for the combined level. Alternative: discard
   ordering or require adjacent selections. Existing order is preserved.
6. **Saved older winsor fits:** require refitting if clamp metadata is absent.
   Inferring limits from display endpoints (especially `max+1`) is unreliable;
   guessing them would leave the original collapsed-range failure possible.

## Validation

`devtools::document()` completed and regenerated Rd with roxygen2 8.1.1.
The exact requested full-suite expression was run:

```r
r <- as.data.frame(devtools::test(reporter = "summary"))
colSums(r[c("passed", "failed", "error", "skipped")])
# passed failed error skipped
#    395      0     0       0
```

The source and final installed-package reproducer runs print
`All audit reproducer checks passed.`. The site verifier checks every printed
summary line, not just first/last counts, in all six reference HTML/Markdown
pages and checks corrected metadata/data/NEWS text. README and the vignette
were rendered from the fixed package; the archive build/check rebuilds the
vignette again.

The initial pkgdown article rebuild failed because its fresh R process could
not see a merely `load_all()`-loaded package. Installing into `.fx2-tmp/lib`
and exporting that directory as `R_LIBS_USER` resolved it. Final pkgdown
completed; Pandoc emits deprecation messages for `--mathml`/`--mathjax` from
the installed documentation toolchain. These are separate from R CMD check.

Clean archive source commit: `1f1bf83b22b715b08562e4bfe5988c446890eead`.
`git archive HEAD` was extracted into `.fx2-tmp/src`; the build and full
`R CMD check --as-cran` both exited 0. Later report/whitespace commits touch
only build-excluded files, so the checked package source is the final source.

| Check | Result |
|---|---|
| Full local test suite | **395 passed / 0 failed / 0 test errors / 0 skipped**, 0 warnings |
| Clean archive build | `rbin_0.3.0.tar.gz`, 90 entries; no scratch, docs-dev or website files |
| Full CRAN check including PDF/HTML manuals | **0 errors / 0 warnings / 1 NOTE** |
| Tests under CRAN check | **383 passed / 0 failed / 12 skipped**, 0 warnings; check succeeds |
| Final installed-tarball reproducers | All checks pass, including every audit ID |
| Final installed-tarball documentation verifier | All six complete printed reference summaries match HTML/Markdown |

The 12 CRAN skips are the six existing print snapshots and six existing visual
snapshots guarded by `skip_on_cran()`. They pass in the full local suite.
Full logs: `.fx2-tmp/document-test-final.log`, `.fx2-tmp/build.log`,
`.fx2-tmp/rbin.Rcheck/00check.log`, `.fx2-tmp/rbin.Rcheck/tests/testthat.Rout`,
`.fx2-tmp/reproducers-tarball.log`, `.fx2-tmp/verify-docs-tarball.log`.

Tarball: `.fx2-tmp/rbin_0.3.0.tar.gz`.
**MD5: `218e2ae61c8a0606e8e223a0e4996dc5`**.

Every NOTE, verbatim (one):

```text
* checking CRAN incoming feasibility ... [36s] NOTE
Maintainer: 'Aravind Hebbali <aravindhebbali@rsquaredacademy.com>'

New maintainer:
  Aravind Hebbali <aravindhebbali@rsquaredacademy.com>
Old maintainer(s):
  Aravind Hebbali <hebbali.aravind@gmail.com>
```

This is the same person with the corrected maintainer address from fix round
1; it remains explained in `cran-comments.md`. No other NOTE was emitted.
Examples, dependency analysis, vignette generation/rebuild, documentation,
manuals, loading/unloading and detritus checks all passed.

Environment: Windows 11 x64 build 26300, R 4.6.1 (2026-06-24 ucrt),
data.table 1.18.6.1, ggplot2 4.0.3, testthat 3.3.2, shiny 1.14.0,
roxygen2 8.1.1, pkgdown 2.2.1, rmarkdown 2.32. The final reproducibility
process confirms it loaded rbin 0.3.0 from
`.fx2-tmp/rbin.Rcheck/rbin`, the check's tarball installation.

## Commands run

All commands below ran from this worktree (or the explicitly shown scratch
subdirectory). `R` refers to `C:/Program Files/R/R-4.6.1/bin/R.exe`, and
`Rscript` to the sibling Rscript.exe. No simultaneous independent R jobs were
started. Final R-heavy work and commands that launch R child processes use:

```bash
bash ~/.claude/bin/heavy-slot.sh pkg-rbin-fx2 <command> <arguments>
```

The wrapper recognized the existing `pkg-rbin-fx2` queue job's counted slot.
PowerShell environment for final R runs:

```powershell
$env:LANG='C'; $env:LC_ALL='C'; $env:LC_CTYPE='C'
$env:TMPDIR=(Resolve-Path .fx2-tmp).Path
$env:TMP=$env:TMPDIR; $env:TEMP=$env:TMPDIR
$env:R_LIBS_USER=(Resolve-Path .fx2-tmp/lib).Path
```

Substantive commands (each R command below uses the wrapper above in final
verification; initial single-process targeted tests/documentation also ran
directly):

```powershell
git archive --format=tar --output=.fx2-tmp/baseline.tar 0389f97
tar -xf .fx2-tmp/baseline.tar -C .fx2-tmp/baseline
Copy-Item tests/testthat/*fx2*.R .fx2-tmp/baseline/tests/testthat/
Rscript .fx2-tmp/baseline-driver.R
Rscript -e "devtools::document(); r <- as.data.frame(devtools::test(reporter='summary')); print(colSums(r[c('passed','failed','error','skipped')]))"
R CMD INSTALL --no-multiarch --with-keep.source -l .fx2-tmp/lib .
Rscript .fx2-tmp/render.R
Rscript docs-dev/fx2-reproducers.R --installed
Rscript docs-dev/fx2-verify-docs.R
git diff --check
git archive --format=tar --output=.fx2-tmp/final-source.tar HEAD
tar -xf .fx2-tmp/final-source.tar -C .fx2-tmp/src
Push-Location .fx2-tmp
R CMD build src
R CMD check --as-cran rbin_0.3.0.tar.gz
Pop-Location
Get-FileHash .fx2-tmp/rbin_0.3.0.tar.gz -Algorithm MD5
# Verify the exact tarball installation used by check:
$env:R_LIBS_USER=(Resolve-Path .fx2-tmp/rbin.Rcheck).Path
Rscript docs-dev/fx2-reproducers.R --installed
Rscript docs-dev/fx2-verify-docs.R
```

The render script runs `rmarkdown::render('README.Rmd')` followed by
`pkgdown::build_site(new_process=FALSE, install=FALSE, devel=TRUE,
lazy=FALSE, preview=FALSE, quiet=FALSE)` and `pkgdown:::build_llm_docs()`.
Only generated preview HTML was moved to scratch; the requested README/site
output and image assets are committed. The pristine-baseline test driver sets
`testthat::set_max_fails(Inf)` and records every group's failed/error counts.

## Commits and follow-ups

* `10924b1` — fix: resolve aud2 and Hydrogen binning findings for 0.3.0 (fx2).
* `1f1bf83` — docs: regenerate README and site outputs for A2-M06 (fx2).
* This report and the final evidence are committed separately with an `(fx2)` suffix.

No finding is deferred. Remaining release work, written out in full:

1. Before CRAN submission, run win-builder release/devel, a macOS check and
   R-hub checks; this round claims only the local Windows clean-archive check.
2. If the maintainer wants dummy scoring for equal-frequency groups that split
   tied values, design an explicit training-membership and new-data tie policy
   (or choose unequal tie-preserving groups), then document/test that API.
   Until then the explicit rejection prevents inconsistent model columns.
3. Refit saved pre-0.3.0 winsorized objects before scoring; their true clamp
   endpoints cannot be recovered reliably from old display metadata.
4. The declared data.table 1.9.4 and testthat 3.1.7 floors were inspected rather
   than installed and run here; test supported dependency floors on a compatible
   R environment before promising old-toolchain compatibility.

All started build, render, test, verification and check processes completed.
No gadget, server, watcher or background R process was left running.
