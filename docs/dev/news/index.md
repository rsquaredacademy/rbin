# Changelog

## rbin (development version)

- Numeric binning methods and
  [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  treat a one-column matrix predictor, such as `scale(mbank["age"])`, as
  its underlying vector, keeping the numeric or character type. Matrices
  with more than one column are rejected with a message naming the
  predictor ([\#79](https://github.com/rsquaredacademy/rbin/issues/79)).
- `include_na` must be a single `TRUE` or `FALSE`, and winsorized
  `min_val` / `max_val` must each be a single finite number or `NULL`;
  invalid values stop with a message naming the argument
  ([\#80](https://github.com/rsquaredacademy/rbin/issues/80)).
- The RStudio addins report missing `shiny`, `miniUI` or `rstudioapi`
  regardless of
  [`interactive()`](https://rdrr.io/r/base/interactive.html). Manual
  binning treats blank cut-point boxes as missing (showing “Enter a
  value for every cut point”), requires at least two bins, and no longer
  offers an interactive install prompt
  ([\#80](https://github.com/rsquaredacademy/rbin/issues/80)).

## rbin 0.3.0

CRAN release: 2026-11-19

This release combines the unreleased 0.2.2 and 0.2.3 fixes and both
fresh audits. Results change from CRAN 0.2.1 for missing-value
placement, winsorized assignment, dropped missing responses, tie-aware
frequency groups and factor counts.

### Shared binning and response handling

- Character responses are sorted in byte (C-locale) order: uppercase
  before lowercase, ASCII before accented characters; use a factor to
  choose the event level. The second value is the event on every machine
  (fx6 opus M1).
- All numeric binning functions and
  [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  accept bare column names, strings and variables holding names,
  including long non-syntactic names, consistently with
  [`rbin_factor()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_factor.md)
  (rx2h-L2 / rx2d-L1).
- Empty intervals retain zero counts, undefined rates/WoE and zero
  IV/entropy; summaries join by bin ID and retain a separate final
  missing group (H01).
- Pure groups have entropy zero, including printed totals (H06).
- Responses must be 0/1, logical, or binary factor/character; factors
  use their first level as 0 and second as 1. Invalid responses error;
  missing responses are dropped with a warning. All methods accept
  data.table input (H12, H13, H14).
- Declared binary factor responses keep their coding when only one class
  is observed. Explicit NA response levels are treated as missing, while
  extra unused levels remain supported when two classes are observed
  (A2-M04, Hydrogen M3).
- Final numeric intervals have no upper bound, including when adding one
  to a large finite maximum has no effect (H11).
- Bin counts must be whole numbers; interval methods require at least
  two bins, and equal-frequency binning permits one bin (M03).

### Numeric binning and dummy variables

- [`rbin_equal_length()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_equal_length.md)
  and
  [`rbin_winsorize()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_winsorize.md)
  compute cut points only from values with absolute value up to 1e300
  (for
  [`rbin_winsorize()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_winsorize.md),
  the values after winsorizing) and otherwise stop with a message,
  because near the double-precision limit exact-cut membership would
  depend on the platform.
  [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  still scores any finite value into the first or last bin.

- Predictor classes: [`I()`](https://rdrr.io/r/base/AsIs.html) (AsIs)
  columns are binned as their numbers; `integer64` and `difftime`
  predictors are refused by the numeric methods and
  [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  with a message on how to convert them (difftime units can differ
  between fitting and scoring data); factor, Date and POSIXct predictors
  point to
  [`rbin_factor()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_factor.md)
  /
  [`rbin_factor_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_factor_create.md).
  [`rbin_factor()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_factor.md)
  accepts classed predictors except `integer64`.

- [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  rejects incompatible `bins` objects with a class diagnostic, while
  valid all-missing fits still produce no indicators (fx6 astra M7).

- Winsorized binning validates `winsor_rate` as a single number in \[0,
  0.5\], including when clamp endpoints are supplied.
  `remove_na = FALSE` gives a clear error for retained missing
  predictors (fx6 opus M2 / astra M8).

- Fitters and
  [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  reject `integer64` and other unsupported numeric classes before
  arithmetic, with conversion guidance for integer64 values within
  +/-2^53 (fx6 H2).

- Equal-width and winsorized cuts multiply the span before division,
  keeping observations on exact mathematical boundaries in the
  left-closed bin. Large integer spans no longer emit integer overflow
  warnings (fx6 H1, M6).

- Quantile binning rejects computed NA/NaN cut points, including
  interpolation between negative and positive infinity, while valid
  infinite cuts remain supported. Numeric assignment rejects unmatched
  non-missing values rather than putting them into a missing bin
  (rx2h-H1).

- Equal-frequency dummy names format all boundaries together, preserving
  the precision of the final `>=` threshold (rx2h-L1).

- Manual display bounds stay ordered when cuts lie outside the observed
  predictor range (rx2h-L3).

- [`rbin_equal_length()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_equal_length.md)
  handles empty intervals and computes finite internal edges even when
  the finite range overflows; equal-width and winsorized methods reject
  infinite predictors (H01, A2-H05).

- [`rbin_quantiles()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_quantiles.md)
  constructs probabilities directly as integer fractions, preserving
  exact cut-point membership and derived statistics (A2-H06).

- [`rbin_winsorize()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_winsorize.md)
  treats supplied endpoints as clamp values, estimates only unspecified
  endpoints, rejects reversed limits, and handles missing predictors
  with `include_na = FALSE` (H04).

- [`rbin_equal_freq()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_equal_freq.md)
  now keeps tied values together using empirical quantiles, returning
  fewer non-empty bins with a message when cuts coincide. Counts can
  differ from 0.2.1, and
  [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  dummies match the non-missing training summary. Untied sizes differ by
  at most one; more bins than observations still error and missing
  predictors retain a separate final group (H02, A2-H01).

- [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  preserves bin order, keeps columns for absent bins, makes colliding
  boundary labels distinct, and assigns values outside the training
  range to the outer intervals (H03, H10).

- [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  uses equal-frequency dummy names describing the actual scoring
  thresholds, including gaps (A2-L01).

- [`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
  applies stored winsor clamp endpoints before scoring, including
  collapsed fitted ranges and limits outside the training range. Older
  saved winsorized objects without clamp metadata must be fitted again
  (A2-H02).

- Numeric WoE plots include the missing-predictor group (H15).

### Factor binning and dummy variables

- Genuine missing values also display as `(missing)` when an explicit NA
  factor level is present, in both printed summaries and plot ticks
  (rx3-L1).
- Printed factor summaries and plot ticks label genuine missing values
  as `(missing)` when a literal `"NA"` category is also present,
  preserving the usual display and stored typed labels otherwise
  (rx2d-L2).
- [`rbin_factor()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_factor.md)
  groups on integer IDs, preserving distinct numeric and temporal
  categories whose display text collides, and preserving explicit NA
  factor levels separately from missing codes. NaN and NA numeric
  predictors share one missing bin; all retained observations contribute
  to counts and statistics (A2-H03, A2-H04, Hydrogen H1, Hydrogen H2,
  Hydrogen H3).
- [`rbin_factor()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_factor.md)
  preserves ordered classes and explicit NA level metadata;
  `include_na = FALSE` removes missing codes while retaining explicit NA
  levels (Hydrogen M4, Hydrogen M5).
- [`rbin_factor()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_factor.md)
  accepts bare, character and indirect column names, including long
  non-syntactic names, and labels missing plot ticks as NA (Hydrogen M2,
  Hydrogen M6).
- [`rbin_factor_combine()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_factor_combine.md)
  matches exact names without regex or substring effects and preserves
  ordered factors, explicit NA levels and unselected missing codes.
  Selecting NA consistently combines both kinds of NA with the new level
  (H05, A2-M01, Hydrogen H4, Hydrogen H5, Hydrogen M5).
- [`rbin_factor_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_factor_create.md)
  preserves original columns, accepts character predictors, creates
  indicators from factor codes (including explicit NA levels), and makes
  generated names unique. Zero-level inputs return unchanged (H07, H08,
  H09, A2-M02, Hydrogen M1).

### Addins

- Factor addin options use distinct IDs for literal `"NA"` and explicit
  NA levels; selecting the NA level combines the intended rows (fx6 H3).
- Both addins use the shared binning workers, drop missing responses
  with a warning, and accept data.table input (H13, H14).
- Both addins accept their default NULL argument and supplied data.frame
  expressions (H16).
- An explicitly changed, unresolved Data Name now validates instead of
  silently using the originally supplied frame (A2-M03).

### Documentation and metadata

- Maintainer email updated to <aravindhebbali@rsquaredacademy.com>
  (M01).
- Declare data.table \>= 1.9.4 and testthat \>= 3.1.7, the first version
  providing the mocking API used by the regression tests (M02, A2-M05).
- Submission comments describe only checks actually run (M04).
- Document all 17 mbank columns, correct S3 return structures/classes
  and the book DOI 10.1002/9781119201731 (M05, L01, L02).
- Regenerate README, vignette and website output, including reference
  examples, data documentation and NEWS (A2-M06).
- Manual cut-point documentation now distinguishes the integer +1 recipe
  from continuous open upper bounds (A2-L02).
- Factor documentation describes column-name arguments, supported
  predictor classes, group order and missing-value policies (Hydrogen
  L1, Hydrogen L2).
- Attaching the package no longer contacts CRAN for updates.

## rbin 0.2.1

CRAN release: 2024-11-05

This is a patch release for minor bug fixes.

## rbin 0.2.0

CRAN release: 2020-05-14

This is a minor release for bug fixes and internal changes.

## rbin 0.1.2

CRAN release: 2020-02-04

- This is a patch release to fix CRAN note.

## rbin 0.1.0

- Added a `NEWS.md` file to track changes to the package.
