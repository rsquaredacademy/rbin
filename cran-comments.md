This is rbin 0.3.0, incorporating both unreleased fix rounds and the fresh
whole-package and factor audits. CRAN currently has 0.2.1:

* bins with no observations no longer duplicate rows, inflate counts, IV or
  entropy, and the missing-value bin is labelled correctly;
* equal-frequency binning keeps tied values in one bin (cut points at sample
  quantiles), so groups are approximately equal and dummy variables always
  reproduce the summary counts; bin counts can therefore differ from 0.2.1;
* numeric and categorical dummy variables, winsorization borders, factor level
  combination, entropy of pure bins, large finite maxima and the binary
  response contract behave as documented;
* both RStudio addins use the same core code as the exported functions and
  accept `data.table` input and their default `data = NULL` argument;
* factor category keys, explicit NA levels, missing codes and NaN counts are
  preserved, quantile/equal-width boundaries are corrected, winsorized scoring
  applies the fitted clamp, infinite values can no longer produce NaN quantile
  cut points, and the numeric binning functions accept column names as strings
  as `rbin_factor()` does.

Metadata and documentation were updated as well (maintainer email, minimum
`data.table` version, reference DOI, `mbank` columns and return values).

## Test environments

* local Windows 11 x64, R 4.6.1 (2026-06-24 ucrt), clean `git archive` build
  followed by `R CMD check --as-cran` on the tarball
* Ubuntu 26.04, R 4.6.2 and R-devel 4.7.0
* win-builder: R-release 4.6.2 and R-devel (2026-11-16 r90914)
* GitHub Actions: macOS (release), Windows (release), Ubuntu (devel, release,
  oldrel-1)

## R CMD check results

0 errors | 0 warnings | 1 note

The note is from the CRAN incoming feasibility check:

```
New maintainer:
  Aravind Hebbali <aravindhebbali@rsquaredacademy.com>
Old maintainer(s):
  Aravind Hebbali <hebbali.aravind@gmail.com>
```

The maintainer address was changed to `aravindhebbali@rsquaredacademy.com` at
the maintainer's request; it is the same person.

## Reverse dependencies

`rbin` has no reverse dependencies on CRAN, so a reverse-dependency check was
not required.
