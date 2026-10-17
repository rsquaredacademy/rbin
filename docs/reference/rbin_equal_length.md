# Equal length binning

Bin continuous data using the equal length binning method.

## Usage

``` r
rbin_equal_length(
  data = NULL,
  response = NULL,
  predictor = NULL,
  bins = 10,
  include_na = TRUE
)

# S3 method for class 'rbin_equal_length'
plot(x, print_plot = TRUE, ...)
```

## Arguments

- data:

  A `data.frame` or `tibble`.

- response:

  Response variable.

- predictor:

  Predictor variable.

- bins:

  Number of bins.

- include_na:

  logical; if `TRUE`, a separate bin is created for missing values.

- x:

  An object of class `rbin_equal_length`.

- print_plot:

  logical; if `TRUE`, prints the plot else returns a plot object.

- ...:

  further arguments passed to or from other methods.

## Value

A `tibble`.

## Examples

``` r
bins <- rbin_equal_length(mbank, y, age, 10)
bins
#> Binning Summary
#> ---------------------------------
#> Method               Equal Length 
#> Response             y 
#> Predictor            age 
#> Bins                 10 
#> Count                4521 
#> Goods                517 
#> Bads                 4004 
#> Entropy              0.5 
#> Information Value    0.17 
#> 
#> 
#>    cut_point bin_count good  bad         woe           iv   entropy
#> 1     < 24.6        85   24   61 -1.11418623 0.0347480126 0.8586371
#> 2     < 31.2       822  106  716 -0.13676519 0.0035843196 0.5545619
#> 3     < 37.8      1133  115 1018  0.13365680 0.0042514380 0.4737339
#> 4     < 44.4       943   82  861  0.30436899 0.0171748162 0.4262287
#> 5       < 51       623   52  571  0.34913923 0.0146733167 0.4142794
#> 6     < 57.6       612   66  546  0.06595797 0.0005741022 0.4933757
#> 7     < 64.2       229   43  186 -0.58245971 0.0213871054 0.6967893
#> 8     < 70.8        34   12   22 -1.44087046 0.0255269312 0.9366674
#> 9     < 77.4        25   13   12 -2.12704897 0.0471100183 0.9988455
#> 10   >= 77.4        15    4   11 -1.03540535 0.0051663529 0.8366407

# plot
plot(bins)


```
