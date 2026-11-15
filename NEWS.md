# rbin 0.2.3

This is a patch release that fixes the correctness findings of the 0.2.2
pre-CRAN audit (H01--H16, M01--M05, L01--L02).

## Bug fixes

* (`H01`) Bins summaries are now joined to the interval definitions by bin ID,
  so empty intervals are kept with zero counts instead of being dropped and
  recycled across rows. Counts, IV and entropy no longer inflate, empty
  intervals no longer duplicate rows, and a present missing-value group is
  detected with `anyNA()` rather than by comparing row counts.
* (`H01`) `rbin_equal_length()` no longer fails with
  `arguments imply differing number of rows` when an interval is empty.
* (`H02`) `rbin_equal_freq()` now distributes the remainder across bins, so
  group sizes differ by at most one (99 observations in 10 bins gives nine
  groups of ten and one of nine; ten observations in six bins gives
  2, 2, 2, 2, 1, 1). More bins than observations is still rejected with a
  clear error.
* (`H03`, `H10`) `rbin_create()` builds every dummy column from the bin
  definitions, using numeric bin IDs internally. The columns are no longer
  permuted when labels sort differently as text, a scoring subset that is
  missing whole bins still receives the full set of columns, and distinct bins
  whose boundaries format identically get distinct labels and names.
* (`H04`) `rbin_winsorize()` now treats `min_val`/`max_val` as values to clamp
  to, as documented, instead of as numbers of rows. A default quantile is only
  computed for an endpoint that was not supplied, and `min_val > max_val` is an
  error.
* (`H05`) `rbin_factor_combine()` combines exact level names instead of
  running `gsub()`, so other levels are untouched, selected levels are mapped
  once, and regular-expression characters in level names are safe.
* (`H06`) Bins whose observations all belong to one class now have entropy 0
  (using the `0 log 0 = 0` convention) instead of `NaN`, including the printed
  total entropy.
* (`H07`, `H08`, `H09`) `rbin_factor_create()` preserves all original columns,
  accepts character predictors (converted to a factor first), and builds
  indicators from factor codes so an explicit `NA` level gets a real indicator
  column. Generated names never overwrite existing columns.
* (`H11`) The last numeric interval is unbounded on the right, so large finite
  maxima (for example `2e16`, where `2e16 + 1 == 2e16`) are binned instead of
  being treated as missing.
* (`H12`) The response must now be binary: 0/1, logical, or a two-level
  factor/character. A two-level factor uses its first level as 0 and its second
  as 1; character values are sorted and the second is used as 1. Other
  responses are rejected with an error instead of silently returning zero class
  counts. The contract is documented on every method.
* (`H13`, `H14`) `rbinAddin()` and `rbinFactorAddin()` now use the same core
  workers as the exported functions. Missing responses are dropped with the
  same warning, and `data.table` input works in both addins.
* (`H15`) Numeric WoE plots place every row at an explicit position and label
  the axis from the interval labels, so the missing-value bin is plotted
  instead of being removed as a missing coordinate.
* (`H16`) Both addins can be launched with their default `data = NULL`
  argument: the Data Name field starts empty and asks for valid input instead
  of failing with `object 'mydata' not found`. A data.frame supplied to the
  addin is used directly, so `rbinAddin(data = data.frame(...))` works.

## Documentation and metadata

* (`M01`) The maintainer email is now
  `aravindhebbali@rsquaredacademy.com`.
* (`M02`) `data.table (>= 1.9.4)` is declared, the first version exporting the
  `setDF()` and `setorder()` functions used at load time.
* (`M03`) NEWS now states the implemented behaviour precisely: equal-frequency
  binning rejects more bins than observations, supports a single bin, and the
  missing-response and data.table fixes apply to the addins as well.
* (`M04`) `cran-comments.md` lists only checks that were actually run.
* (`M05`) The `mbank` documentation describes all 17 columns, including
  `balance` and `day`; the nonexistent `day_of_week` description is removed.
* (`L01`) Rd return values now describe the actual S3 list/table structures
  and classes (`rbin_manual`, `rbin_quantiles`, `rbin_winsorize`, and
  `rbin_equal_freq` for equal-frequency plots).
* (`L02`) The reference DOI now points to the book
  (`10.1002/9781119201731`) rather than its bibliography record.

## Other changes

* Empty intervals are reported with zero counts and without rates or WoE;
  they contribute nothing to total IV or entropy.
* Equal-frequency binning now places missing predictor values in a separate
  final group built from the non-missing values, in line with the other
  methods.
* `bins` must be a whole number.
* The package no longer contacts CRAN for updates when it is attached.
