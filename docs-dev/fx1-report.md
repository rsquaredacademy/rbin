# rbin pre-CRAN audit fixes (fx1)

Worktree: `F:/R/Packages/_worktrees/rbin-fx1`, branch `task/rbin-fx1`, based on
`origin/develop` at `176bda4` (rbin 0.2.2 prepared). Released version after the
fixes: **0.2.3** (next patch after 0.2.2).

The findings, reproducers and expected results are from
`F:/pm/notes/2026-11-14-pkgs/cx-rbin-audit.md`. Every High finding was fixed at
the root cause in shared code, and every fix has a testthat regression test
that uses the audit reproducer plus a variant input.

## Result by finding

| ID | Status | What changed |
| --- | --- | --- |
| H01 | fixed | Interval definitions and grouped summaries are joined by numeric bin ID. Empty intervals are kept with zero counts; the missing group is detected with `anyNA(bin)`, never by row count. Empty-bin rates/WoE are `NA`, their IV and entropy contributions are 0. All four numeric methods and the numeric addin share this code. |
| H02 | fixed | Equal-frequency sizes are `base` plus one extra observation for the first `rem` groups (`equal_freq_sizes()`), so group sizes differ by at most one. More bins than observations is still an explicit error. |
| H03 | fixed | `rbin_create()` uses numeric bin IDs from the bin definitions and rebuilds all indicator columns; labels are display-only. `format_boundaries()` falls back to 17 significant digits only when *different* values format identically, so labels and generated names are unique. |
| H04 | fixed | `winsor()` treats `min_val`/`max_val` as clamp values, computes a default quantile only for an unspecified endpoint, and rejects `min_val > max_val`. |
| H05 | fixed | `rbin_factor_combine()` maps exact level names once (`current_lev[current_lev %in% selected] <- new_name`) and rebuilds the factor; regex characters and substrings are inert. Shared with the addin. |
| H06 | fixed | `entropy_bin()` applies `0 log 0 = 0`, so pure bins have entropy 0 and the printed total is 0. |
| H07 | fixed | `rbin_factor_create()` appends an indicator block; original columns (including a column called `temp`) are preserved, in either column order. Generated names never overwrite existing columns. |
| H08 | fixed | Character predictors are converted to a factor (sorted levels) and get indicator columns; factor/character is documented and enforced. |
| H09 | fixed | Indicators come from integer factor codes, so an explicit `NA` level gets a real `g_NA` indicator (0/1), distinct from a genuinely missing code. |
| H10 | fixed | Dummy columns are built from the complete bin definition, so a scoring subset that lacks whole bins still gets every column (all-zero where absent). |
| H11 | fixed | The last numeric interval is unbounded on the right (`x >= lower[n]`), so `max(x) + 1 == max(x)` at 1e16/2e16 no longer misclassifies finite values. `lower_cut`/`upper_cut` stay display values. |
| H12 | fixed | `validate_response()` defines and enforces a binary contract (0/1, logical, or two-level factor/character; first level = 0, second = 1). It is applied in the shared prep used by every method and both addins. Non-binary responses error instead of returning zero class counts. Documented on every method. |
| H13 | fixed | Both addins call the same `*_impl()` workers as the exported functions, so missing responses are dropped with the same warning and all statistics are shared. |
| H14 | fixed | The addin's data reactive normalises to `data.frame` (`as.data.frame()`), so `data.table` input works in both addins. |
| H15 | fixed | `plot_bins()` uses explicit positions `1..n` and labels from the bin table (including the `NA` label), so the missing-value bin is plotted. Factor plots already did this. |
| H16 | fixed | `addin_initial_data()` initialises the Data Name field (empty when no data), uses a supplied data.frame directly, and `addin_data_reactive()` resolves names with `req()`/`validate()` instead of `get(input$mydata)` on an uninitialised variable. Both addins accept `data = NULL` and `data = <data.frame expression>`. |
| M01 | fixed | Maintainer is `Aravind Hebbali <aravindhebbali@rsquaredacademy.com>`; Rd regenerated. |
| M02 | fixed | `Imports: data.table (>= 1.9.4)`. |
| M03 | fixed | NEWS rewritten to state the implemented behaviour (more bins than observations is rejected clearly, equal-frequency supports one bin, missing-response/data.table fixes cover addins). |
| M04 | fixed | `cran-comments.md` lists only the local clean-archive check, explains the single incoming-feasibility note, and states that no remote platform runs or reverse-dependency check are claimed (rbin has no CRAN reverse dependencies). |
| M05 | fixed | `mbank` documentation now lists all 17 actual columns, including `balance` and `day`; `day_of_week` removed. |
| L01 | fixed | Rd return values describe the actual S3 lists/tables and classes (`rbin_manual`, `rbin_quantiles`, `rbin_winsorize`, `rbin_equal_freq` plot input); `rbin_winsorized` corrected to `rbin_winsorize`. |
| L02 | fixed | Reference DOI is `10.1002/9781119201731` (the book), not `.biblio`. |

No finding needed a design decision to be left open. Follow-ups are listed at
the end.

## Reproducers, before and after

Baseline (`176bda4`) output is in `.fx1-tmp/before.log`; after output is in
`.fx1-tmp/after2.log` and was re-verified against the installed final tarball
in `.fx1-tmp/verify-installed.log`.

### H01

```text
d <- data.frame(y=c(0,0,1,0,1,1), x=c(0,0,0,10,10,10)); rbin_manual(d,y,x,c(2,4,6))

before: bin_count 3,3,3,3  count 12  IV 0.9241962  entropy 1.836592
after:  bin_count 3,0,0,3  count  6  IV 0.4620981  entropy 0.9182958
```

Other manifestations:

```text
4 observations / 4 bins:   manual, equal_length, quantile, winsorize: 8 -> 4
rbin_equal_length(d,y,x,3): "arguments imply differing number of rows: 3, 2" -> 4 rows, total 4
rbin_quantiles(2 obs, bins=4): counts 2,2,2,2 -> 0,0,0,2 (total 2)
rbin_winsorize(1:10, bins=2, winsor_rate=.5): 10,10 -> 0,10
NA example: cut_point <2,<4,>=4 / bin 1,3,NA -> <2,<4,>=4,NA / bin 1,2,3,NA (counts 2,0,2,2)
all-missing predictor: count 4, entropy 2 -> count 2, entropy 1 (all four methods)
```

### H02

```text
99 observations, 10 bins: 9,9,9,9,9,9,9,9,9,18 -> 10,10,10,10,10,10,10,10,10,9
10 observations,  6 bins: 1,1,1,1,1,5            -> 2,2,2,2,1,1
```

### H03

```text
d <- data.frame(y=rep(0:1,3), x=c(0,1,3,4,11,12)); rbin_create(d,x,rbin_manual(d,y,x,c(2,10)))
before: x_<_2 = 0,0,1,1,0,0 (swapped)
after:  x_<_2 = 1,1,0,0,0,0; x_<_10 = 0,0,1,1,0,0; x_>=_10 = 0,0,0,0,1,1
```

Colliding boundaries:

```text
d <- data.frame(y=rep(0:1,3), x=c(0,.5,1+4e-16,1+6e-16,1.1,1.2))
rbin_manual(d,y,x,c(1,1+1e-15))
before labels: < 1, < 1, >= 1      rbin_create(): "'names' attribute [3] must be the same length as the vector [2]"
after  labels: < 1, < 1.0000000000000011, >= 1.0000000000000011
       columns: x_<_1, x_<_1.0000000000000011, x_>=_1.0000000000000011 (values 1,0,0 / 0,1,0 / 0,0,1)
```

### H04

```text
rbin_winsorize(d,y,seq(10,100,10),2,min_val=20,max_val=80)
before: lower 10,10; upper 10,11; counts 10,10
after:  lower 20,50; upper 50,81;  counts 4,6  (equals cut(pmin(pmax(x,20),80), c(-Inf,50,Inf)))
rbin_winsorize(d,y,x,2,max_val=60): upper_cut last 96.5 -> 61
min_val > max_val: now an error
```

### H05

```text
factor(c("a","aa","b")), select "a" -> z:      z,zz,b -> z,aa,b
factor(c("a","b","c")), select c("a","b")->"ab": aab,ab,c -> ab,ab,c
factor(c("a[","b","c")), select "a[":           regex error -> z,b,c
```

### H06

```text
pure bins (manual/quantile/equal-freq/factor): entropy NaN, total NaN -> 0, total 0
printed equal-frequency summary: "Entropy NaN" -> "Entropy 0"
```

### H07

```text
data.frame(g=factor(c("a","b","a")), temp=101:103)
before: columns g,g_a,g_b (temp lost)
after:  columns g,temp,g_a,g_b, temp = 101,102,103
data.frame(temp=101:103, g=...): "replacement has 0 rows, data has 3" -> works
```

### H08

```text
data.frame(g=c("a","b","a")): unchanged column only -> g, g_a (1,0,1), g_b (0,1,0)
```

### H09

```text
factor(c("a",NA,"a"), exclude=NULL): g_NA = NA,NA,NA -> 0,1,0
```

### H10

```text
rbin_create(d[1,,drop=FALSE], x, bins)
before: "'names' attribute [3] must be the same length as the vector [1]"
after:  one row with x_<_2=1, x_<_10=0, x_>=_10=0
```

### H11

```text
x = c(1e16,1e16,2e16,2e16), cut 1.5e16
before: bin 1,NA (counts 2,2)
after:  bin 1,2  (counts 2,2), same for equal-length, quantile and winsorized
```

### H12

```text
y = factor(c("no","yes","no","yes"))
before: good 0, bad 0, woe NaN, iv NaN per level/bin
after:  good 1, bad 1, woe 0, iv 0 per level/bin
numeric response outside 0/1 now errors with "response must be binary".
```

### H13

```text
addin, y = c(0,1,0,1,NA), x = 1:5, 2 bins cut 3
before: counts 2,3; good 1,NA; bad 1,NA; woe/iv NA
after:  counts 2,2; good 1,1;  bad 1,1;  woe/iv 0; warning "Dropping 1 row with missing response."
factor addin: same correction (a,b -> counts 2,2, good 1,1, bad 1,1)
```

### H14

```text
data.table(y=rep(0:1,2), x=1:4) in rbinAddin(): join error -> counts 2,2; good 1,1; bad 1,1; woe/iv 0
factor addin with a data.table: same join error -> counts 2,4, no NA class counts
```

### H15

```text
plot(rbin_manual(d,y,x,2.5), print_plot=FALSE), d$x = c(1,2,3,4,NA,NA)
before plotted x: 1, 2, NA (third point removed)
after  plotted x: 1, 2, 3 with labels < 2.5, >= 2.5, NA
```

### H16

```text
capture_gadget(rbinAddin, NULL), capture_gadget(rbinFactorAddin, NULL)
before: Error: object 'mydata' not found
after:  gadget opens with an empty Data Name field and a "Data not found"/entry message
rbinAddin(data = data.frame(y=0:1, x=1:2))
before: object 'data.frame(y = 0:1, x = 1:2)' not found
after:  supplied data.frame is available (names y, x)
```

## Tests added

New files (all in `tests/testthat/`):

* `test-audit-bins.R` — H01 (empty bins, all four methods, repeated quantile
  boundaries, winsor rate endpoint, NA labels, all-missing predictor), H02
  (balance/conservation, 99/10 and 23/5), H03 (column order, colliding
  boundaries), H04 (borders, one-sided defaults, invalid order), H06 (entropy
  and printed total), H11 (all four methods), H12 (factor/character/unused
  levels/invalid), H15 (`ggplot_build()` positions and labels), equal-frequency
  NA group, `rbin_create()` with equal-frequency bins.
* `test-audit-factor.R` — H05 (substring, regex characters, merge), H07
  (column preservation, both column orders, name collision), H08 (character),
  H09 (explicit NA level), factor NA group with `include_na` TRUE/FALSE.
* `test-audit-addins.R` — H13 (numeric and factor addins, warning and parity
  with complete-response core output), H14 (data.table in both addins), H16
  (NULL default, supplied data.frame, expression name). Only
  `get_active_document_context`/gadget launch are mocked through two internal
  indirection points; real UI/server callbacks run under `shiny::testServer()`.

Updated tests:

* `test-na-handling.R` — replaced the old, wrong small-sample equal-frequency
  expectations with balance and conservation assertions (H02).

Every new test fails on the audited 0.2.2 code (for H02 the old expectation is
replaced, and the new one fails on both 0.2.1 and 0.2.2).

## Checks

Environment: Windows 11 x64, R 4.6.1 (2026-06-24 ucrt), data.table 1.18.6.1,
ggplot2 4.0.3, testthat 3.3.2, vdiffr 1.0.9, shiny 1.14.0, roxygen2 8.1.1.

| Check | Result |
| --- | --- |
| `devtools::document()` | OK; Rd regenerated (roxygen2 8.1.1; DESCRIPTION metadata became `Config/roxygen2/version: 8.1.1`) |
| `devtools::test()` / `testthat::test_local()` | 240 passed, 0 failed, 0 warnings, 0 skips |
| clean `git archive` + `R CMD build` | `rbin_0.2.3.tar.gz`, 86 entries, no scratch/report files |
| `R CMD check --as-cran` on the tarball (full manual) | **0 errors, 0 warnings, 1 note** |
| `urlchecker::url_check()` | All URLs are correct (13 checked) |
| tests under `--as-cran` | 228 passed, 12 skipped (6 text snapshots + 6 vdiffr snapshots), 0 failed/warned |

The single note is the expected CRAN incoming-feasibility "New maintainer"
notice caused by M01 (`hebbali.aravind@gmail.com` ->
`aravindhebbali@rsquaredacademy.com`); it is explained in `cran-comments.md`.

Final tarball built from HEAD `f382e51`:

```text
rbin_0.2.3.tar.gz
SHA-256 7d879cf1777b09a9272e413e2d5d30f0d39811deaee02cac9ec0bfa12ab05d17
```

`R CMD check` was run on an earlier build of the same content
(SHA-256 `44e6099b05cf1425b30e2730c8757e566fdcac4b1189a84aa1b8596feb487354`);
a byte-for-byte comparison of the two archives shows that only the `Packaged:`
timestamp in `DESCRIPTION` differs (the commits after that build touch only the
excluded report and ignore files).

Full check log: `.fx1-tmp/finalcheck/rbin.Rcheck/00check.log`
(scratch, not committed).

`README.Rmd` was re-rendered with the installed tarball: numeric output matches
`README.md`; the only differences are the pre-existing Pandoc formatting
differences (`alt=""`, expanded sign-up div) noted in the audit. The README
plot images in `tools/` were refreshed for the new labelled x axis.

## Commands run (abridged)

```powershell
# baseline and after reproducers
Rscript .fx1-tmp/before.R
Rscript .fx1-tmp/verify-installed.R

# documentation and tests
Rscript -e "devtools::document()"
Rscript -e "devtools::test(reporter='summary')"
Rscript -e "library(testthat); res <- test_local(reporter='silent'); ..."

# clean archive build and check
git archive --format=tar --output=.fx1-tmp/final.tar HEAD
tar -xf .fx1-tmp/final.tar -C .fx1-tmp/final
R CMD build .fx1-tmp/final
R CMD check --as-cran .fx1-tmp/final/rbin_0.2.3.tar.gz

# URL check and README render
Rscript -e "urlchecker::url_check()"
Rscript -e ".libPaths(c('.fx1-tmp/lib', .libPaths())); rmarkdown::render('README.Rmd', ...)"
```

All R commands ran with `LANG=C`, `LC_ALL=C`, `LC_CTYPE=C` and `TMPDIR`/`TMP`/
`TEMP` inside `.fx1-tmp/`.

## Commits

1. `d7dd1c9` fix: correct binning, dummy and addin results (audit H01-H16)
2. `afc8cb0` docs: update metadata, docs and release notes for 0.2.3 (M01-M05, L01-L02)
3. `e664869` docs: record the single incoming-feasibility note (M04)
4. `d26216a` docs: refresh README plot images for labelled bin axes
5. `6f2f9df` docs: add fx1 report for the 0.2.2 audit fixes
6. `f382e51` chore: ignore local Rplots.pdf test artifact

## Follow-ups (not blockers, decisions or environment work)

1. Run win-builder (devel and release), R-hub and a macOS check before the CRAN
   submission; `cran-comments.md` deliberately claims none of them for this
   revision.
2. The declared `data.table (>= 1.9.4)` floor was inspected from CRAN archive
   sources but not installed and run on R 4.6; test the floor or raise the
   minimum to a version that has been exercised.
3. Supporting multi-class responses, or choosing a non-default event class,
   would require a new exported argument and therefore an API change; the
   binary contract is documented and non-binary input now errors.
4. `rbin_create()` still produces missing (not zero) dummies for rows with a
   missing predictor, and the separate missing bin has no dummy column. This is
   now documented in the Rd; confirm whether zero-filled dummies are preferred.
5. `rbin_equal_freq()` now assigns missing predictors to a separate final group
   instead of mixing them into the last rank group. This is documented and in
   NEWS because the method has no `include_na` argument; confirm the policy.
6. In `rbin_equal_freq()` objects, `$lower_cut`/`$upper_cut` remain rank
   indices while `$bins$lower_cut`/`$bins$upper_cut` hold values.
   `rbin_create()` now understands both, but renaming the list elements would
   change the public structure.
7. Empty intervals are presented with `NA` rates and WoE and contribute zero
   IV/entropy. Confirm this presentation is wanted before release.
8. roxygen2 8.1.1 replaced `RoxygenNote: 7.3.2` with
   `Config/roxygen2/version: 8.1.1`; regenerate with 7.3.2 if the maintainer
   wants to keep the old toolchain.
9. When a typed Data Name cannot be resolved, the addins fall back to the data
   object they were launched with. Confirm whether a hard "not found" error is
   preferred instead.
10. `tests/figs/` still contains the old vdiffr working renderings (tracked
    before this task); they are not used by `R CMD check`, but
    `vdiffr::manage_cases()` would refresh them.
