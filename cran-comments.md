This is a patch release that fixes the correctness findings of the internal
pre-release audit of 0.2.2:

* bins with no observations no longer duplicate rows, inflate counts, IV or
  entropy, and the missing-value bin is labelled correctly;
* equal-frequency groups are balanced (sizes differ by at most one);
* numeric and categorical dummy variables, winsorization borders, factor level
  combination, entropy of pure bins, large finite maxima and the binary
  response contract behave as documented;
* both RStudio addins use the same core code as the exported functions and
  accept `data.table` input and their default `data = NULL` argument.

Metadata and documentation were updated as well (maintainer email, minimum
`data.table` version, reference DOI, `mbank` columns and return values).

## Test environments

* local Windows 11 x64, R 4.6.1 (2026-06-24 ucrt), clean `git archive` build
  followed by `R CMD check --as-cran` on the tarball

No win-builder, R-hub or macOS results are claimed for this revision; no such
submission was made before this check.

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
