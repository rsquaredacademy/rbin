# Factor binning

Weight of evidence and information value for categorical data.

## Usage

``` r
rbin_factor(data = NULL, response = NULL, predictor = NULL, include_na = TRUE)

# S3 method for class 'rbin_factor'
plot(x, print_plot = TRUE, ...)
```

## Arguments

- data:

  A `data.frame` or `tibble`.

- response:

  Response variable; a binary variable coded as 0/1, a logical variable,
  or a two-level factor/character. For a two-level factor the first
  level is treated as 0 and the second as 1; for character data the two
  values are sorted and the second is treated as 1. Rows with a missing
  response are dropped with a warning.

- predictor:

  Bare or character name of a categorical column in `data`. Factor
  (including ordered), character, numeric, logical, `Date` and `POSIXct`
  columns are supported. Distinct values form distinct groups.

- include_na:

  logical; if `TRUE`, a separate bin is created for missing values.

- x:

  An object of class `rbin_factor`.

- print_plot:

  logical; if `TRUE`, prints the plot else returns a plot object.

- ...:

  further arguments passed to or from other methods.

## Value

A list of class `rbin_factor` with the following elements: `bins`, a
`data.frame` with one row per observed level (plus a final row for
missing values when present); `method`; and `vars`.

## Details

Both `response` and `predictor` accept bare column names, character
names, or variables holding character names. Groups and cumulative
counts follow first appearance, with missing values last. Factor levels
and the ordered class are preserved; an explicit `NA` level is a valid
category, distinct from a missing factor code. It precedes the final
missing-code group and is retained when `include_na = FALSE`. Numeric
`NaN` and `NA` share a missing-value group.

## Examples

``` r
bins <- rbin_factor(mbank, y, education)
bins
#> Binning Summary
#> ---------------------------
#> Method               Custom 
#> Response             y 
#> Predictor            education 
#> Levels               4 
#> Count                4521 
#> Goods                517 
#> Bads                 4004 
#> Entropy              0.51 
#> Information Value    0.05 
#> 
#> 
#>       level bin_count good  bad        woe          iv   entropy
#> 1  tertiary      1299  195 1104 -0.3133106 0.031785905 0.6101292
#> 2 secondary      2352  231 2121  0.1702190 0.014113157 0.4633093
#> 3   primary       691   66  625  0.2010906 0.005717878 0.4546110
#> 4   unknown       179   25  154 -0.2289295 0.002265111 0.5833603

# plot
plot(bins)

```
