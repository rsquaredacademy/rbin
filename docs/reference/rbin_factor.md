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

  Response variable.

- predictor:

  Predictor variable.

- include_na:

  logical; if `TRUE`, a separate bin is created for missing values.

- x:

  An object of class `rbin_factor`.

- print_plot:

  logical; if `TRUE`, prints the plot else returns a plot object.

- ...:

  further arguments passed to or from other methods.

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
