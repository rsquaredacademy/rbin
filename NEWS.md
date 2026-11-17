# rbin 0.3.0

This release combines the unreleased 0.2.2 and 0.2.3 fixes and both fresh
audits. Results change from CRAN 0.2.1 for missing-value placement, winsorized
assignment, dropped missing responses, balanced rank groups and factor counts.

## Shared binning and response handling

* Empty intervals retain zero counts, undefined rates/WoE and zero IV/entropy;
  summaries join by bin ID and retain a separate final missing group (H01).
* Pure groups have entropy zero, including printed totals (H06).
* Responses must be 0/1, logical, or binary factor/character; factors use their
  first level as 0 and second as 1. Invalid responses error; missing responses
  are dropped with a warning. All methods accept data.table input (H12, H13, H14).
* Declared binary factor responses keep their coding when only one class is
  observed. Explicit NA response levels are treated as missing, while extra
  unused levels remain supported when two classes are observed (A2-M04, Hydrogen M3).
* Final numeric intervals have no upper bound, including when adding one to a
  large finite maximum has no effect (H11).
* Bin counts must be whole numbers; interval methods require at least two bins,
  and rank binning permits one bin (M03).

## Numeric binning and dummy variables

* `rbin_equal_length()` handles empty intervals and computes finite internal
  edges even when the finite range overflows; equal-width and winsorized
  methods reject infinite predictors (H01, A2-H05).
* `rbin_quantiles()` constructs probabilities directly as integer fractions,
  preserving exact cut-point membership and derived statistics (A2-H06).
* `rbin_winsorize()` treats supplied endpoints as clamp values, estimates only
  unspecified endpoints, rejects reversed limits, and handles missing predictors
  with `include_na = FALSE` (H04).
* `rbin_equal_freq()` balances sizes to differ by at most one, rejects more bins
  than observations, and keeps missing predictors in a separate final group (H02).
* `rbin_create()` preserves bin order, keeps columns for absent bins, makes
  colliding boundary labels distinct, and assigns values outside the training
  range to the outer intervals (H03, H10).
* `rbin_create()` rejects rank groups when ties cross boundaries, because value
  thresholds cannot reproduce those groups. Scoreable rank groups use names
  describing the actual scoring thresholds, including gaps (A2-H01, A2-L01).
* `rbin_create()` applies stored winsor clamp endpoints before scoring, including
  collapsed fitted ranges and limits outside the training range. Older saved
  winsorized objects without clamp metadata must be fitted again (A2-H02).
* Numeric WoE plots include the missing-predictor group (H15).

## Factor binning and dummy variables

* `rbin_factor()` groups on integer IDs, preserving distinct numeric and temporal
  categories whose display text collides, and preserving explicit NA factor
  levels separately from missing codes. NaN and NA numeric predictors share one
  missing bin; all retained observations contribute to counts and statistics
  (A2-H03, A2-H04, Hydrogen H1, Hydrogen H2, Hydrogen H3).
* `rbin_factor()` preserves ordered classes and explicit NA level metadata;
  `include_na = FALSE` removes missing codes while retaining explicit NA levels
  (Hydrogen M4, Hydrogen M5).
* `rbin_factor()` accepts bare, character and indirect column names, including
  long non-syntactic names, and labels missing plot ticks as NA (Hydrogen M2,
  Hydrogen M6).
* `rbin_factor_combine()` matches exact names without regex or substring effects
  and preserves ordered factors, explicit NA levels and unselected missing
  codes. Selecting NA consistently combines both kinds of NA with the new level
  (H05, A2-M01, Hydrogen H4, Hydrogen H5, Hydrogen M5).
* `rbin_factor_create()` preserves original columns, accepts character predictors,
  creates indicators from factor codes (including explicit NA levels), and makes
  generated names unique. Zero-level inputs return unchanged (H07, H08, H09,
  A2-M02, Hydrogen M1).

## Addins

* Both addins use the shared binning workers, drop missing responses with a
  warning, and accept data.table input (H13, H14).
* Both addins accept their default NULL argument and supplied data.frame
  expressions (H16).
* An explicitly changed, unresolved Data Name now validates instead of silently
  using the originally supplied frame (A2-M03).

## Documentation and metadata

* Maintainer email updated to aravindhebbali@rsquaredacademy.com (M01).
* Declare data.table >= 1.9.4 and testthat >= 3.1.7, the first version providing
  the mocking API used by the regression tests (M02, A2-M05).
* Submission comments describe only checks actually run (M04).
* Document all 17 mbank columns, correct S3 return structures/classes and the
  book DOI 10.1002/9781119201731 (M05, L01, L02).
* Regenerate README, vignette and website output, including reference examples,
  data documentation and NEWS (A2-M06).
* Manual cut-point documentation now distinguishes the integer +1 recipe from
  continuous open upper bounds (A2-L02).
* Factor documentation describes column-name arguments, supported predictor
  classes, group order and missing-value policies (Hydrogen L1, Hydrogen L2).
* Attaching the package no longer contacts CRAN for updates.

# rbin 0.2.1

This is a patch release for minor bug fixes.

# rbin 0.2.0

This is a minor release for bug fixes and internal changes.

# rbin 0.1.2

* This is a patch release to fix CRAN note.

# rbin 0.1.0

* Added a `NEWS.md` file to track changes to the package.
