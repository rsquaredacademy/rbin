## Test environments
* local Windows 10 install, R 3.5.1
* ubuntu 14.04 (on travis-ci), R 3.5.1
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

This is a resubmission. As suggested, I have:

- used `\donttest` for examples with run time greater than 5 seconds
- ensured that functions do not write in the user's home filespace

