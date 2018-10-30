
<!-- README.md is generated from README.Rmd. Please edit that file -->
rbin
====

> Tools for binning data

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/report)](https://cran.r-project.org/package=rbin) [![Travis-CI Build Status](https://travis-ci.org/rsquaredacademy/rbin.svg?branch=master)](https://travis-ci.org/rsquaredacademy/rbin) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/rsquaredacademy/rbin?branch=master&svg=true)](https://ci.appveyor.com/project/aravindhebbali/rbin) [![Coverage status](https://codecov.io/gh/rsquaredacademy/rbin/branch/master/graph/badge.svg)](https://codecov.io/github/rsquaredacademy/rbin?branch=master) ![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

Installation
------------

rbin is not available on CRAN yet. You can install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("rsquaredacademy/rbin")
```

Usage
-----

### Manual Binning

``` r
bins <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
bins 
#> Binning Summary
#> ---------------------------
#> Method               Manual 
#> Response             y 
#> Predictor            age 
#> Bins                 10 
#> Count                4521 
#> Goods                517 
#> Bads                 4004 
#> Information Value    0.12 
#> 
#> 
#> # A tibble: 10 x 6
#>    cut_point bin_count  good   bad      woe         iv
#>    <chr>         <int> <int> <int>    <dbl>      <dbl>
#>  1 < 29            410    71   339 -0.484   0.0255    
#>  2 < 31            313    41   272 -0.155   0.00176   
#>  3 < 34            567    55   512  0.184   0.00395   
#>  4 < 36            396    45   351  0.00712 0.00000443
#>  5 < 39            519    47   472  0.260   0.00701   
#>  6 < 42            431    33   398  0.443   0.0158    
#>  7 < 46            449    47   402  0.0993  0.000942  
#>  8 < 51            521    40   481  0.440   0.0188    
#>  9 < 56            445    49   396  0.0426  0.000176  
#> 10 >= 56           470    89   381 -0.593   0.0456

# plot
plot(bins)
```

<img src="tools/README-manual-1.png" width="100%" />

### Quantile Binning

``` r
bins <- rbin_quantiles(mbank, y, age, 10)
bins 
#> Binning Summary
#> -----------------------------
#> Method               Quantile 
#> Response             y 
#> Predictor            age 
#> Bins                 10 
#> Count                4521 
#> Goods                517 
#> Bads                 4004 
#> Information Value    0.12 
#> 
#> 
#> # A tibble: 10 x 6
#>    cut_point bin_count  good   bad      woe         iv
#>    <chr>         <int> <int> <int>    <dbl>      <dbl>
#>  1 < 29            410    71   339 -0.484   0.0255    
#>  2 < 31            313    41   272 -0.155   0.00176   
#>  3 < 34            567    55   512  0.184   0.00395   
#>  4 < 36            396    45   351  0.00712 0.00000443
#>  5 < 39            519    47   472  0.260   0.00701   
#>  6 < 42            431    33   398  0.443   0.0158    
#>  7 < 46            449    47   402  0.0993  0.000942  
#>  8 < 51            521    40   481  0.440   0.0188    
#>  9 < 56            445    49   396  0.0426  0.000176  
#> 10 >= 56           470    89   381 -0.593   0.0456

# plot
plot(bins)
```

<img src="tools/README-quantile-1.png" width="100%" />

### Winsorized Binning

``` r
bins <- rbin_winsorize(mbank, y, age, 10, winsor_rate = 0.05)
bins 
#> Binning Summary
#> ------------------------------
#> Method               Winsorize 
#> Response             y 
#> Predictor            age 
#> Bins                 10 
#> Count                4521 
#> Goods                517 
#> Bads                 4004 
#> Information Value    0.1 
#> 
#> 
#> # A tibble: 10 x 6
#>    cut_point bin_count  good   bad    woe       iv
#>    <chr>         <int> <int> <int>  <dbl>    <dbl>
#>  1 < 30.2          723   112   611 -0.350 0.0224  
#>  2 < 33.4          567    55   512  0.184 0.00395 
#>  3 < 36.6          573    58   515  0.137 0.00225 
#>  4 < 39.8          497    44   453  0.285 0.00798 
#>  5 < 43            396    37   359  0.225 0.00408 
#>  6 < 46.2          461    43   418  0.227 0.00482 
#>  7 < 49.4          281    22   259  0.419 0.00927 
#>  8 < 52.6          309    32   277  0.111 0.000811
#>  9 < 55.8          244    25   219  0.123 0.000781
#> 10 >= 55.8         470    89   381 -0.593 0.0456

# plot
plot(bins)
```

<img src="tools/README-winsorize-1.png" width="100%" />

### Equal Length Binning

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
#> Information Value    0.17 
#> 
#> 
#> # A tibble: 10 x 6
#>    cut_point bin_count  good   bad     woe       iv
#>    <chr>         <int> <int> <int>   <dbl>    <dbl>
#>  1 < 24.6           85    24    61 -1.11   0.0347  
#>  2 < 31.2          822   106   716 -0.137  0.00358 
#>  3 < 37.8         1133   115  1018  0.134  0.00425 
#>  4 < 44.4          943    82   861  0.304  0.0172  
#>  5 < 51            623    52   571  0.349  0.0147  
#>  6 < 57.6          612    66   546  0.0660 0.000574
#>  7 < 64.2          229    43   186 -0.582  0.0214  
#>  8 < 70.8           34    12    22 -1.44   0.0255  
#>  9 < 77.4           25    13    12 -2.13   0.0471  
#> 10 >= 77.4          15     4    11 -1.04   0.00517

# plot
plot(bins)
```

<img src="tools/README-equal_length-1.png" width="100%" />

Community Guidelines
--------------------

Please note that the \[34m'rbin'\[39m project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
