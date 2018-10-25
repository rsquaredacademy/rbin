
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
rbin_manual(marketing_bank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
#> # A tibble: 10 x 7
#>    cut_point bin_count  good   bad good_rate      woe         iv
#>    <chr>         <int> <int> <int>     <dbl>    <dbl>      <dbl>
#>  1 < 29            410    71   339    0.173  -0.484   0.0255    
#>  2 < 31            313    41   272    0.131  -0.155   0.00176   
#>  3 < 34            567    55   512    0.0970  0.184   0.00395   
#>  4 < 36            396    45   351    0.114   0.00712 0.00000443
#>  5 < 39            519    47   472    0.0906  0.260   0.00701   
#>  6 < 42            431    33   398    0.0766  0.443   0.0158    
#>  7 < 46            449    47   402    0.105   0.0993  0.000942  
#>  8 < 51            521    40   481    0.0768  0.440   0.0188    
#>  9 < 56            445    49   396    0.110   0.0426  0.000176  
#> 10 > 56            470    89   381    0.189  -0.593   0.0456
```

### Quantile Binning

``` r
rbin_quantiles(marketing_bank, y, age, 10)
#> # A tibble: 10 x 7
#>    cut_point bin_count  good   bad good_rate      woe         iv
#>    <chr>         <int> <int> <int>     <dbl>    <dbl>      <dbl>
#>  1 < 29            410    71   339    0.173  -0.484   0.0255    
#>  2 < 31            313    41   272    0.131  -0.155   0.00176   
#>  3 < 34            567    55   512    0.0970  0.184   0.00395   
#>  4 < 36            396    45   351    0.114   0.00712 0.00000443
#>  5 < 39            519    47   472    0.0906  0.260   0.00701   
#>  6 < 42            431    33   398    0.0766  0.443   0.0158    
#>  7 < 46            449    47   402    0.105   0.0993  0.000942  
#>  8 < 51            521    40   481    0.0768  0.440   0.0188    
#>  9 < 56            445    49   396    0.110   0.0426  0.000176  
#> 10 > 56            470    89   381    0.189  -0.593   0.0456
```

### Winsorized Binning

``` r
rbin_winsorize(marketing_bank, y, age, 10, winsor_rate = 0.05)
#> # A tibble: 10 x 7
#>    cut_point bin_count  good   bad good_rate    woe       iv
#>    <chr>         <int> <int> <int>     <dbl>  <dbl>    <dbl>
#>  1 < 30.2          723   112   611    0.155  -0.350 0.0224  
#>  2 < 33.4          567    55   512    0.0970  0.184 0.00395 
#>  3 < 36.6          573    58   515    0.101   0.137 0.00225 
#>  4 < 39.8          497    44   453    0.0885  0.285 0.00798 
#>  5 < 43            396    37   359    0.0934  0.225 0.00408 
#>  6 < 46.2          461    43   418    0.0933  0.227 0.00482 
#>  7 < 49.4          281    22   259    0.0783  0.419 0.00927 
#>  8 < 52.6          309    32   277    0.104   0.111 0.000811
#>  9 < 55.8          244    25   219    0.102   0.123 0.000781
#> 10 > 55.8          470    89   381    0.189  -0.593 0.0456
```

### Equal Length Binning

``` r
rbin_equal_length(marketing_bank, y, age, 10)
#> # A tibble: 10 x 7
#>    cut_point bin_count  good   bad good_rate     woe       iv
#>    <chr>         <int> <int> <int>     <dbl>   <dbl>    <dbl>
#>  1 < 24.6           85    24    61    0.282  -1.11   0.0347  
#>  2 < 31.2          822   106   716    0.129  -0.137  0.00358 
#>  3 < 37.8         1133   115  1018    0.102   0.134  0.00425 
#>  4 < 44.4          943    82   861    0.0870  0.304  0.0172  
#>  5 < 51            623    52   571    0.0835  0.349  0.0147  
#>  6 < 57.6          612    66   546    0.108   0.0660 0.000574
#>  7 < 64.2          229    43   186    0.188  -0.582  0.0214  
#>  8 < 70.8           34    12    22    0.353  -1.44   0.0255  
#>  9 < 77.4           25    13    12    0.52   -2.13   0.0471  
#> 10 > 77.4           15     4    11    0.267  -1.04   0.00517
```

### Equal Frequency Binning

``` r
rbin_equal_freq(marketing_bank, y, age, 10)
#> # A tibble: 20 x 8
#>    lower_cut upper_cut bin_count  good   bad good_rate      woe         iv
#>        <int>     <int>     <int> <int> <int>     <dbl>    <dbl>      <dbl>
#>  1        18        27       226    48   178    0.212  -0.736   0.0356    
#>  2        27        29       226    29   197    0.128  -0.131   0.000904  
#>  3        29        30       226    28   198    0.124  -0.0909  0.000428  
#>  4        30        31       226    25   201    0.111   0.0374  0.0000690 
#>  5        31        33       226    26   200    0.115  -0.00679 0.00000231
#>  6        33        34       226    18   208    0.0796  0.400   0.00686   
#>  7        34        35       226    25   201    0.111   0.0374  0.0000690 
#>  8        35        36       226    20   206    0.0885  0.285   0.00364   
#>  9        36        37       226    26   200    0.115  -0.00679 0.00000231
#> 10        37        39       226    21   205    0.0929  0.231   0.00245   
#> 11        39        40       226     9   217    0.0398  1.14    0.0418    
#> 12        40        42       226    28   198    0.124  -0.0909  0.000428  
#> 13        42        44       226    19   207    0.0841  0.341   0.00510   
#> 14        44        46       226    24   202    0.106   0.0832  0.000335  
#> 15        46        48       226    15   211    0.0664  0.597   0.0141    
#> 16        48        51       226    19   207    0.0841  0.341   0.00510   
#> 17        51        53       226    25   201    0.111   0.0374  0.0000690 
#> 18        53        56       226    25   201    0.111   0.0374  0.0000690 
#> 19        56        58       226    21   205    0.0929  0.231   0.00245   
#> 20        59        84       227    66   161    0.291  -1.16    0.101
```

Community Guidelines
--------------------

Please note that the \[34m'rbin'\[39m project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
