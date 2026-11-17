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

  Bare or character name of a factor or character column in `data`.

- new_var:

  A character vector containing the names of levels to combine. An `NA`
  selects both an explicit `NA` level and missing factor codes.

- new_name:

  Name of the combined level.

## Value

A `data.frame` with the predictor's levels combined. The predictor keeps
its original position among the columns.

## Details

Levels are matched exactly, not as regular expressions. Only the
selected levels are renamed; other levels are left untouched even when
their names contain the selected name as a substring. Unselected
explicit `NA` levels and missing codes are preserved, as is the ordered
class. A combined level takes the position of its first selected level;
a new level for missing codes alone is appended at the end.

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
