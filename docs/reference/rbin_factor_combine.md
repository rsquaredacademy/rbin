# Combine levels

Manually combine levels of categorical data.

## Usage

``` r
rbin_factor_combine(data, var, new_var, new_name)
```

## Arguments

- data:

  A `data.frame` or `tibble`.

- var:

  An object of class `factor`.

- new_var:

  A character vector; it should include the names of the levels to be
  combined.

- new_name:

  Name of the combined level.

## Value

A `tibble`.

## Examples

``` r
upper <- c("secondary", "tertiary")
out <- rbin_factor_combine(mbank, education, upper, "upper")
table(out$education)
#> 
#>   upper unknown primary 
#>    3651     179     691 

out <- rbin_factor_combine(mbank, education, c("secondary", "tertiary"), "upper")
table(out$education)
#> 
#>   upper unknown primary 
#>    3651     179     691 
```
