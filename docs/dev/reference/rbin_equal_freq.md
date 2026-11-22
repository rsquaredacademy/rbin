# `Equal frequency binning`

# `Equal frequency binning`

Source:
[`R/rbin-equal-freq.R`](https://github.com/rsquaredacademy/rbin/blob/HEAD/R/rbin-equal-freq.R)

`rbin_equal_freq.Rd`

Bin continuous data using the equal frequency binning method.

## Usage

``` r
rbin_equal_freq(data = NULL, response = NULL, predictor = NULL, bins = 10)

# S3 method for class 'rbin_equal_freq'
plot(x, print_plot = TRUE, ...)
```

## Arguments

- data:

  A `data.frame` or `tibble`.

- response:

  Bare column name, character name, or variable holding a character name
  in `data`. A binary variable coded as 0/1, a logical variable, or a
  two-level factor/character. For a two-level factor the first level is
  treated as 0 and the second as 1. A character response is sorted in
  byte (C-locale) order: uppercase before lowercase, ASCII before
  accented characters; use a factor to choose the event level. The
  second value is the event. Rows with a missing response are dropped
  with a warning.

- predictor:

  Bare column name, character name, or variable holding a character name
  in `data`. A numeric predictor variable.

- bins:

  Number of bins.

- x:

  An object of class `rbin_equal_freq`.

- print_plot:

  logical; if `TRUE`, prints the plot else returns a plot object.

- ...:

  further arguments passed to or from other methods.

## Value

A list of class `rbin_equal_freq` with the following elements: `bins`, a
`data.frame` with one row per group (plus a final row for missing values
when present); `method`; `vars`; `lower_cut`; and `upper_cut`.

## Details

Groups have approximately equal sizes and never split tied values. For
each `k = 1, ..., bins - 1`, take the smallest observed value whose
cumulative count reaches `k * n / bins`, where `n` is the number of
non-missing predictors (the type-1 empirical quantile). All observations
equal to that value stay in the lower group. The next distinct observed
value is the scoring cut. Repeated cuts and cuts beyond the maximum are
omitted; a message reports the requested and actual numbers of
non-missing bins when fewer bins result. No bin is empty. Without ties,
group sizes differ by at most one observation.

Both the top-level and table `lower_cut`/`upper_cut` fields contain the
actual left-closed, right-open scoring intervals. The first and last
intervals extend to negative and positive infinity; gaps go to the
preceding group.
[`rbin_create()`](https://rbin.rsquaredacademy.com/dev/reference/rbin_create.md)
reproduces the non-missing training counts using these intervals.
Missing predictor values form a separate final group, and the equal
frequency groups are built from non-missing values only. As with other
numeric methods, missing predictors produce missing dummy indicators.

## Examples

``` r
bins <- rbin_equal_freq(mbank, y, age, 10)
bins
#> Binning Summary
#> ------------------------------------
#> Method               Equal Frequency 
#> Response             y 
#> Predictor            age 
#> Bins                 10 
#> Count                4521 
#> Goods                517 
#> Bads                 4004 
#> Entropy              0.5 
#> Information Value    0.11 
#> 
#> 
#>    lower_cut upper_cut bin_count good bad  good_rate         woe           iv
#> 1       -Inf        30       521   85 436 0.16314779 -0.41201528 2.287466e-02
#> 2         30        32       386   45 341 0.11658031 -0.02178628 4.086635e-05
#> 3         32        35       582   57 525 0.09793814  0.17334073 3.617176e-03
#> 4         35        37       374   38 336 0.10160428  0.13251873 1.380198e-03
#> 5         37        40       497   44 453 0.08853119  0.28469623 7.980172e-03
#> 6         40        43       396   37 359 0.09343434  0.22539821 4.078267e-03
#> 7         43        47       461   43 418 0.09327549  0.22727505 4.823562e-03
#> 8         47        52       474   41 433 0.08649789  0.31015940 8.944433e-03
#> 9         52        57       441   47 394 0.10657596  0.07919704 5.933844e-04
#> 10        57       Inf       389   80 309 0.20565553 -0.69569162 5.396205e-02
#>      entropy
#> 1  0.6417872
#> 2  0.5194505
#> 3  0.4624254
#> 4  0.4740605
#> 5  0.4315480
#> 6  0.4478305
#> 7  0.4473095
#> 8  0.4246709
#> 9  0.4895008
#> 10 0.7330960

# plot
plot(bins)

```
