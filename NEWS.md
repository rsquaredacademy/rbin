# rbin 0.2.1.9000

* Missing predictor values are now placed in the last bin, so the bin labels
  and cumulative counts line up when `include_na = TRUE`.
* `rbin_create()` now assigns values outside the winsorized range to the first
  and last bins instead of returning missing dummy variables.
* `rbin_equal_freq()` no longer fails for small samples or when there are more
  bins than observations, and stops with an informative error when a bin would
  be empty.
* Rows with a missing response are now dropped with a warning instead of
  silently turning every WoE and IV value into `NA`.
* The package no longer contacts CRAN for updates when it is attached.
* `include_na = FALSE` now works with a missing predictor in
  `rbin_winsorize()`.
* `bins = 1` now gives an informative error instead of a cryptic failure.
* `data.table` inputs are now handled like `data.frame` inputs in every
  function.

# rbin 0.2.1

This is a patch release for minor bug fixes.

# rbin 0.2.0

This is a minor release for bug fixes and internal changes.

# rbin 0.1.2

* This is a patch release to fix CRAN note.

# rbin 0.1.0

* Added a `NEWS.md` file to track changes to the package.
