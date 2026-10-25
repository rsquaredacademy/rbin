This is a patch release that fixes bugs in missing-value handling, dummy
creation from winsorized bins, equal-frequency binning of small samples, and
missing responses. It also stops the package contacting CRAN when attached,
handles `data.table` inputs, and gives clearer errors for `bins = 1`.

## Test environments

* local Windows 11, R 4.6.1
* TODO: win-builder (devel, release)
* TODO: R-hub
* TODO: macOS

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

TODO: revdepcheck
