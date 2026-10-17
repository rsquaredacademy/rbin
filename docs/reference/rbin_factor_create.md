# Create dummy variables

Create dummy variables for categorical data.

## Usage

``` r
rbin_factor_create(data, predictor)
```

## Arguments

- data:

  A `data.frame` or `tibble`.

- predictor:

  Variable for which dummy variables must be created.

## Value

A `tibble` with dummy variables.

## Examples

``` r
upper <- c("secondary", "tertiary")
out <- rbin_factor_combine(mbank, education, upper, "upper")
rbin_factor_create(out, education)
#>      age           job  marital default balance housing loan   contact day
#> 1     34    technician  married      no     297     yes   no  cellular  29
#> 2     49      services  married      no     180     yes  yes   unknown   2
#> 3     38        admin.   single      no     262      no   no  cellular   3
#> 4     47      services  married      no     367     yes   no  cellular  12
#> 5     51 self-employed   single      no    1640     yes   no   unknown  15
#> 6     40    unemployed  married      no    3382     yes   no   unknown  14
#> 7     58       retired  married      no    1227      no   no  cellular  14
#> 8     32    unemployed  married      no     309     yes   no telephone  13
#> 9     46   blue-collar  married      no     922     yes   no telephone  18
#> 10    32      services  married      no       0      no   no  cellular  21
#> 11    32      services  married      no     414     yes   no  cellular   3
#> 12    50   blue-collar  married      no       0      no   no   unknown   9
#> 13    41    management  married      no    2226      no   no  cellular   7
#> 14    38      services divorced      no       0     yes   no  cellular  20
#> 15    31 self-employed  married     yes     147     yes   no  cellular  11
#> 16    42        admin.   single      no     283     yes   no   unknown  19
#> 17    56       retired  married      no      -1      no   no  cellular  27
#> 18    54    management divorced      no     901      no   no   unknown  20
#> 19    42    management  married      no     372     yes   no telephone  31
#> 20    58      services  married      no     627      no   no  cellular  13
#> 21    51        admin.  married      no      26     yes   no telephone  28
#> 22    44    management  married      no     438     yes   no telephone   9
#> 23    51    management   single      no    -461     yes   no   unknown  28
#> 24    41    management  married      no    -195      no  yes  cellular  20
#> 25    57    technician  married      no   16063     yes   no   unknown  30
#> 26    32    management   single      no    3097     yes   no  cellular  20
#> 27    32    management  married      no    1232      no   no  cellular  25
#> 28    45    management  married      no    4693      no  yes  cellular   9
#> 29    56  entrepreneur  married      no     196      no   no  cellular  19
#> 30    38    technician  married      no       0     yes   no   unknown  21
#> 31    54 self-employed  married      no     990      no   no  cellular   3
#> 32    53    unemployed   single      no     183      no   no  cellular   9
#> 33    36    management   single      no     219      no   no  cellular   3
#> 34    37   blue-collar  married      no     -97     yes   no   unknown   5
#> 35    31      services   single      no     222     yes   no  cellular  13
#> 36    42    technician  married      no     234      no   no  cellular   4
#> 37    34      services   single      no      25     yes  yes  cellular   9
#> 38    37    technician  married      no    1762      no   no  cellular  16
#> 39    59   blue-collar  married      no      80     yes   no telephone  31
#> 40    54    management  married     yes       0     yes  yes  cellular   6
#> 41    54   blue-collar  married      no    1357     yes  yes  cellular   5
#> 42    59        admin.  married      no    -198     yes  yes  cellular   8
#> 43    33    management   single      no    2059      no   no  cellular  29
#> 44    24      services   single      no     258     yes   no  cellular  18
#> 45    29    technician   single      no    2269     yes   no  cellular  20
#> 46    49   blue-collar  married      no       0      no   no  cellular  14
#> 47    37    technician  married      no      77     yes  yes  cellular  21
#> 48    28   blue-collar  married      no     254     yes   no  cellular  20
#> 49    82       retired  married      no     103      no   no  cellular   1
#> 50    57   blue-collar  married      no     452     yes   no   unknown  13
#> 51    39    technician   single      no   45248     yes   no   unknown   6
#> 52    39    management   single      no       0      no   no  cellular  25
#> 53    33    technician  married      no     620      no   no  cellular  14
#> 54    32   blue-collar  married      no    2263      no   no  cellular   7
#> 55    24   blue-collar   single      no    8594     yes   no   unknown  28
#> 56    52    technician  married      no     306      no   no  cellular  25
#> 57    32    management   single      no   10281      no   no  cellular  22
#> 58    33    technician   single      no     469      no   no  cellular  26
#> 59    31    management   single      no      86      no   no  cellular  29
#> 60    42    management  married      no     477     yes   no   unknown   5
#> 61    27   blue-collar  married      no       1     yes   no  cellular   5
#> 62    32    technician  married      no       0     yes  yes  cellular  10
#> 63    30    management   single      no       0     yes   no  cellular   5
#> 64    42        admin. divorced      no    -172     yes  yes   unknown   4
#> 65    43   blue-collar  married      no    2706     yes  yes   unknown  14
#> 66    27    technician   single      no     808     yes   no  cellular  15
#> 67    57    technician divorced      no     164      no   no   unknown   9
#> 68    32    unemployed   single      no     331     yes   no   unknown   9
#> 69    31        admin.   single      no    1374     yes   no  cellular  18
#> 70    36   blue-collar  married      no       0     yes   no  cellular  18
#> 71    31    management  married      no     625     yes   no  cellular   7
#> 72    39   blue-collar  married      no     747     yes  yes  cellular  19
#> 73    42      services  married      no     124     yes   no  cellular   2
#> 74    68       retired  married      no       0      no   no telephone  15
#> 75    56    technician  married      no     787      no  yes  cellular   9
#> 76    46    technician divorced      no     405     yes   no   unknown  15
#> 77    35        admin.  married      no    -272      no  yes  cellular  29
#> 78    50      services  married      no   57435     yes   no  cellular  21
#> 79    50   blue-collar  married      no     167      no   no  cellular  19
#> 80    60     housemaid divorced      no    2063      no   no  cellular  21
#> 81    32    technician  married      no       0     yes   no  cellular   2
#> 82    30        admin.   single      no     255      no   no  cellular  27
#> 83    48      services   single      no     204     yes   no  cellular  22
#> 84    30        admin.   single      no     648      no   no  cellular  19
#> 85    31   blue-collar  married      no      33     yes   no  cellular  24
#> 86    45   blue-collar  married      no     430      no  yes  cellular  21
#> 87    35   blue-collar  married      no     260     yes   no telephone  13
#> 88    26        admin.   single      no       0     yes   no  cellular  13
#> 89    32        admin.  married      no    1604      no  yes  cellular   7
#> 90    50    technician  married      no    -568     yes  yes   unknown  28
#> 91    34    technician  married      no     966     yes   no  cellular  18
#> 92    29   blue-collar  married      no     356     yes   no   unknown   4
#> 93    29   blue-collar  married      no    2378     yes  yes  cellular  20
#> 94    75       retired divorced      no     852      no   no  cellular  16
#> 95    72       retired  married      no    1388      no   no telephone  20
#> 96    48   blue-collar  married      no    1230     yes  yes   unknown   7
#> 97    37    management  married      no    9895     yes   no  cellular  20
#> 98    34    technician   single      no   27446     yes   no  cellular  21
#> 99    44    management  married      no    1880     yes   no  cellular  18
#> 100   35      services  married      no       0     yes   no   unknown  21
#> 101   28       student  married      no     803     yes   no  cellular  25
#> 102   25   blue-collar   single      no     158     yes  yes  cellular  16
#> 103   51   blue-collar  married      no     328      no   no   unknown   4
#> 104   44    unemployed divorced      no     522      no   no  cellular   7
#> 105   47   blue-collar  married      no     550     yes   no   unknown   7
#> 106   59       retired divorced      no     602      no   no   unknown  20
#> 107   38   blue-collar  married      no     467     yes   no   unknown  16
#> 108   39    management   single      no    1682     yes   no   unknown   2
#> 109   43    technician divorced      no     305     yes   no  cellular   5
#> 110   45    management divorced      no   24598     yes   no   unknown   5
#> 111   24   blue-collar   single      no    2129     yes  yes telephone  18
#> 112   24 self-employed   single      no     931     yes   no   unknown  28
#> 113   69    technician  married      no    9064      no   no  cellular   7
#> 114   37   blue-collar   single      no    2188      no   no   unknown  16
#> 115   29    technician   single      no    -803     yes  yes  cellular   6
#> 116   51   blue-collar  married      no     -11      no   no telephone  16
#> 117   26       student   single      no    5296      no   no telephone  12
#> 118   53        admin. divorced      no     122      no   no  cellular  27
#> 119   41      services  married      no    6687     yes   no  cellular  21
#> 120   42   blue-collar  married      no     902     yes   no   unknown  14
#> 121   25  entrepreneur  married      no      30     yes   no  cellular  24
#> 122   39    technician   single      no    1048     yes  yes  cellular   8
#> 123   50      services  married      no    1687      no   no  cellular  19
#> 124   55   blue-collar  married      no     771      no   no  cellular  29
#> 125   34        admin.   single      no     663     yes   no  cellular  20
#> 126   31    technician divorced      no    2287     yes   no   unknown  21
#> 127   32    technician   single     yes      -1      no   no  cellular  29
#> 128   56   blue-collar  married      no    1686      no   no telephone  17
#> 129   51   blue-collar  married      no    1779     yes   no   unknown  15
#> 130   25   blue-collar  married      no     316     yes  yes   unknown  19
#> 131   33    management divorced      no     312     yes  yes  cellular  13
#> 132   54    management  married     yes    5249     yes   no  cellular  17
#> 133   34  entrepreneur  married      no       2     yes  yes  cellular   5
#> 134   39    technician   single      no     175      no  yes   unknown  16
#> 135   45    technician  married      no     406     yes   no  cellular   3
#> 136   43   blue-collar  married      no    -454     yes   no   unknown   7
#> 137   54    technician divorced      no     -11     yes   no  cellular  12
#> 138   34      services divorced      no      27     yes   no  cellular   6
#> 139   45    technician  married      no    3395     yes   no  cellular  18
#> 140   38      services divorced      no      49     yes   no  cellular  18
#> 141   33   blue-collar divorced      no       1      no   no   unknown  16
#> 142   27       student   single      no      24     yes   no  cellular   2
#> 143   53    management divorced      no    2894     yes   no  cellular   5
#> 144   32        admin.   single      no    6042     yes   no  cellular  15
#> 145   37   blue-collar   single      no     481      no   no  cellular  18
#> 146   51   blue-collar  married      no    7098      no   no  cellular   6
#> 147   55       retired  married      no     123      no   no  cellular  28
#> 148   61       retired  married      no     280     yes   no   unknown  15
#> 149   41    technician  married      no     139      no   no  cellular  18
#> 150   39   blue-collar  married      no    1042     yes   no   unknown   8
#> 151   34   blue-collar   single      no    1423     yes   no  cellular  21
#> 152   37    management  married      no     591     yes   no  cellular   7
#> 153   30    management  married      no    1235      no   no  cellular  28
#> 154   54    unemployed divorced      no    3721     yes   no  cellular  30
#> 155   47    technician divorced      no    1851     yes   no   unknown  19
#> 156   32    unemployed  married      no     283     yes   no  cellular  22
#> 157   42        admin.   single      no    2095     yes   no  cellular  21
#> 158   52   blue-collar divorced      no     -97     yes  yes   unknown   9
#> 159   83       retired   single      no    3349      no   no telephone  12
#> 160   42    technician   single      no       0     yes   no   unknown   7
#> 161   38    management   single      no    3141      no   no  cellular   9
#> 162   56    unemployed  married      no    -246      no  yes  cellular  28
#> 163   52    management divorced      no       0      no   no  cellular   4
#> 164   56      services divorced      no    1877     yes   no   unknown  30
#> 165   55    technician  married      no       0     yes  yes  cellular   2
#> 166   56    technician divorced      no    3450      no   no  cellular  10
#> 167   29    technician   single      no     673     yes   no  cellular   9
#> 168   73       retired  married      no     542      no   no  cellular  26
#> 169   62     housemaid  married      no       2      no   no  cellular   3
#> 170   56    management  married      no    -762     yes  yes  cellular  11
#> 171   36    technician  married      no    1653     yes  yes   unknown  27
#> 172   32   blue-collar  married      no      50     yes   no  cellular  13
#> 173   48    management  married      no   14530     yes  yes telephone  29
#> 174   31        admin.   single      no     358     yes   no   unknown  14
#> 175   26   blue-collar   single      no    3145      no   no  cellular  28
#> 176   27   blue-collar   single      no    1311     yes   no   unknown  13
#> 177   56      services  married      no     486      no  yes telephone  21
#> 178   31    management   single      no      34      no   no  cellular  22
#> 179   36   blue-collar  married      no       0      no   no   unknown   5
#> 180   53    technician  married      no    6921     yes   no  cellular  19
#> 181   39   blue-collar  married      no      98      no   no  cellular  31
#> 182   82       retired divorced      no     928      no   no telephone  23
#> 183   30    technician  married      no     671      no   no  cellular  11
#> 184   31    technician  married      no     535      no   no  cellular   8
#> 185   47 self-employed  married      no     -80     yes   no  cellular   6
#> 186   58    unemployed  married      no    3884      no   no   unknown   9
#> 187   55    management  married      no    1402     yes   no  cellular  17
#> 188   25        admin.   single      no     425      no   no  cellular  27
#> 189   31   blue-collar   single      no    -161      no   no  cellular  11
#> 190   53    technician  married      no    2647     yes   no   unknown  30
#> 191   43   blue-collar  married      no     517     yes   no  cellular  20
#> 192   56  entrepreneur  married      no      40      no  yes  cellular  11
#> 193   51    technician  married      no    8758      no   no telephone  31
#> 194   34        admin.  married      no     764      no   no  cellular   9
#> 195   45    management  married      no     446      no   no  cellular   6
#> 196   60   blue-collar  married      no       5      no   no  cellular  29
#> 197   46    management   single      no    6651      no   no  cellular  23
#> 198   40  entrepreneur  married      no       0     yes   no  cellular  22
#> 199   53    management  married      no     913     yes   no   unknown   9
#> 200   57        admin.  married      no     596      no   no  cellular  29
#> 201   25   blue-collar   single      no    -221     yes   no   unknown  23
#> 202   31    unemployed divorced      no     756      no   no  cellular  20
#> 203   64       retired  married      no    1612      no   no  cellular  18
#> 204   37        admin.  married      no    1314     yes   no  cellular  12
#> 205   30        admin.   single      no    1009     yes   no  cellular  29
#> 206   37        admin.   single      no     781      no   no  cellular  20
#> 207   48   blue-collar  married      no    5078     yes   no telephone   8
#> 208   48   blue-collar  married      no       8      no   no  cellular  20
#> 209   50      services  married      no    1134      no   no   unknown  18
#> 210   38        admin.  married      no     689     yes   no  cellular  25
#> 211   43 self-employed  married      no     634     yes   no  cellular  17
#> 212   31    technician   single      no       9      no   no  cellular   7
#> 213   48    management  married      no    1147      no   no  cellular   3
#> 214   40        admin.   single      no     963     yes   no  cellular   7
#> 215   63  entrepreneur  married      no    3904      no   no telephone   4
#> 216   41    management  married      no      23      no   no  cellular  22
#> 217   23      services   single      no     665     yes   no   unknown  28
#> 218   29    management   single      no     536      no   no  cellular  29
#> 219   52   blue-collar   single     yes    -517      no  yes  cellular  10
#> 220   44  entrepreneur  married     yes    -848     yes   no   unknown  19
#> 221   39    technician  married      no     375     yes  yes telephone  17
#> 222   49   blue-collar  married      no     371     yes   no  cellular  31
#> 223   34        admin.  married      no      95     yes   no  cellular  18
#> 224   33    technician  married      no     148      no   no  cellular  27
#> 225   51   blue-collar divorced      no     886      no   no   unknown  17
#> 226   24    management   single      no       1      no   no  cellular  14
#> 227   34      services  married      no     142     yes   no   unknown   8
#> 228   50   blue-collar  married      no     506     yes   no telephone   7
#> 229   44   blue-collar  married      no     129     yes  yes   unknown   5
#> 230   57   blue-collar divorced      no    1299      no   no  cellular  27
#> 231   26       student   single      no      19      no   no telephone  30
#> 232   29   blue-collar  married      no     163     yes  yes  cellular  29
#> 233   50   blue-collar  married      no       0      no   no   unknown   5
#> 234   52    management  married      no    4096     yes   no   unknown   4
#> 235   31        admin.  married      no       0     yes  yes  cellular  18
#> 236   32   blue-collar   single      no      33      no   no  cellular  23
#> 237   33    technician   single      no       0      no   no  cellular  26
#> 238   33        admin.   single      no    1779     yes   no   unknown  21
#> 239   41    unemployed divorced      no    -198     yes   no  cellular  17
#> 240   28    technician  married      no     107     yes   no  cellular  29
#> 241   41  entrepreneur   single      no    7264      no  yes   unknown   1
#> 242   32   blue-collar  married      no     289     yes   no   unknown   8
#> 243   48      services  married      no    1155     yes   no   unknown  16
#> 244   45 self-employed divorced      no     963     yes   no  cellular  12
#> 245   39   blue-collar  married      no       0     yes   no  cellular  18
#> 246   36        admin. divorced      no     -37     yes   no   unknown  27
#> 247   60       retired  married      no    3932     yes   no   unknown  14
#> 248   42        admin.   single      no    -247     yes  yes  cellular  18
#> 249   34   blue-collar   single      no     505     yes   no   unknown  13
#> 250   40    management divorced      no     205      no   no  cellular  25
#> 251   26     housemaid   single      no      93      no   no  cellular  11
#> 252   42      services  married      no    1545     yes   no  cellular  17
#> 253   47    management  married      no    1147      no   no  cellular  27
#> 254   35   blue-collar  married      no     765     yes   no   unknown  29
#> 255   24       student   single      no     822      no   no  cellular  27
#> 256   42    management divorced      no     461     yes   no   unknown   3
#> 257   53      services  married      no      76     yes   no   unknown  19
#> 258   44    technician divorced      no     316     yes   no  cellular  21
#> 259   44 self-employed   single      no      97     yes   no   unknown   6
#> 260   43   blue-collar  married      no     -41      no   no   unknown  20
#> 261   28   blue-collar   single      no    2340     yes   no   unknown  19
#> 262   53      services  married      no    2618     yes   no  cellular   5
#> 263   23       student   single      no    1062      no   no telephone  27
#> 264   32      services  married      no     206     yes  yes   unknown  12
#> 265   27   blue-collar  married      no     191     yes   no  cellular  20
#> 266   55    technician   single      no      11      no   no   unknown  20
#> 267   48        admin.  married      no       0     yes   no  cellular   8
#> 268   32   blue-collar  married      no     827     yes   no   unknown  23
#> 269   45   blue-collar  married      no     351     yes   no   unknown  19
#> 270   38    technician  married      no      54     yes  yes  cellular   5
#> 271   53   blue-collar divorced      no      -1     yes   no  cellular   2
#> 272   26    technician   single      no     941      no  yes  cellular  25
#> 273   34  entrepreneur  married      no     223      no  yes  cellular  11
#> 274   31    management   single      no      53     yes   no  cellular   7
#> 275   45  entrepreneur divorced      no       0     yes   no  cellular  13
#> 276   56    management divorced      no     310      no   no   unknown  20
#> 277   38   blue-collar  married      no     635     yes   no   unknown   3
#> 278   39    management   single      no     668      no   no  cellular  14
#> 279   26      services   single      no    1700     yes   no  cellular   7
#> 280   35       student divorced      no    2755     yes   no  cellular  14
#> 281   30    management   single      no       0      no   no  cellular  28
#> 282   41      services divorced      no      83      no   no   unknown  20
#> 283   47  entrepreneur  married      no       0      no   no   unknown   5
#> 284   38      services  married      no   10189     yes   no  cellular  18
#> 285   61    management  married      no    5157      no   no  cellular  13
#> 286   35   blue-collar  married      no    4366     yes   no   unknown  28
#> 287   30   blue-collar  married     yes     -18      no   no   unknown   3
#> 288   35    technician  married      no     561     yes   no  cellular  22
#> 289   35    technician  married      no    -255     yes   no  cellular  13
#> 290   32   blue-collar  married      no     391     yes   no  cellular  17
#> 291   40      services  married      no    9374     yes   no  cellular  21
#> 292   30      services   single      no     695     yes   no   unknown  20
#> 293   21       student   single      no      71      no   no  cellular  13
#> 294   38    technician  married      no       0      no   no  cellular  26
#> 295   54  entrepreneur divorced      no   20527      no   no telephone  20
#> 296   35   blue-collar   single      no     219     yes  yes   unknown  29
#> 297   45   blue-collar  married      no     491     yes  yes  cellular  12
#> 298   37    technician   single      no    -272      no  yes  cellular  20
#> 299   42  entrepreneur  married      no     859      no   no  cellular  29
#> 300   34        admin.  married      no     -33     yes  yes  cellular  10
#> 301   38     housemaid  married      no    1508      no  yes  cellular   8
#> 302   36    management  married      no     918      no   no  cellular  28
#> 303   30    technician  married      no     606     yes   no  cellular  30
#> 304   44    technician divorced      no     414     yes  yes   unknown   6
#> 305   50   blue-collar  married      no     325     yes   no  cellular  17
#> 306   42        admin.   single      no     734     yes   no  cellular  16
#> 307   64       retired  married      no      43      no   no  cellular  11
#> 308   31  entrepreneur  married      no       0     yes   no   unknown  23
#> 309   35  entrepreneur  married      no       0      no   no  cellular  18
#> 310   58    management divorced      no    4256      no   no  cellular  22
#> 311   44    management  married      no     474     yes  yes   unknown  14
#> 312   79       retired divorced      no     336      no   no  cellular   6
#> 313   37        admin. divorced      no       0     yes  yes  cellular  14
#> 314   36      services   single      no    9713     yes   no   unknown  27
#> 315   57       retired  married      no    4451      no  yes  cellular   7
#> 316   32    technician   single      no    -138      no   no  cellular  16
#> 317   26    unemployed   single      no     771      no   no  cellular  22
#> 318   25      services   single      no     333      no  yes  cellular  15
#> 319   39        admin.  married      no     563     yes   no  cellular   4
#> 320   40   blue-collar  married      no    4795     yes   no  cellular  17
#> 321   50   blue-collar  married      no     157      no   no  cellular  27
#> 322   38    technician   single      no     178     yes   no  cellular   7
#> 323   31    management   single      no       0      no   no  cellular  28
#> 324   45   blue-collar  married      no       0     yes   no  cellular  21
#> 325   57    management divorced      no     236      no   no  cellular  18
#> 326   30    management   single      no     536      no   no  cellular   2
#> 327   36        admin.  married      no    3308      no  yes  cellular  31
#> 328   32   blue-collar   single      no    1211     yes   no   unknown  19
#> 329   41        admin.  married      no    1705      no   no  cellular  30
#> 330   59     housemaid  married      no       5      no  yes telephone  22
#> 331   58    unemployed  married      no    4967      no   no telephone   4
#> 332   26        admin.  married      no     284      no   no   unknown  10
#> 333   50   blue-collar divorced      no     -19     yes   no  cellular  21
#> 334   38   blue-collar  married      no     168     yes  yes telephone  13
#> 335   36        admin.   single      no     148     yes   no  cellular  15
#> 336   28    technician   single      no     386      no   no  cellular  25
#> 337   52  entrepreneur  married      no    3332     yes  yes  cellular  13
#> 338   35     housemaid  married      no       0      no   no  cellular  18
#> 339   35   blue-collar  married      no       0     yes   no  cellular   8
#> 340   39    technician  married      no    2765     yes  yes   unknown  20
#> 341   53    technician  married      no    3398      no  yes telephone  20
#> 342   52  entrepreneur  married      no     330      no  yes  cellular   4
#> 343   41   blue-collar  married      no    2152     yes   no  cellular  17
#> 344   50    technician  married      no    8001      no   no   unknown   6
#> 345   57 self-employed  married      no    2109      no   no  cellular  21
#> 346   56    management  married      no      79      no   no  cellular   7
#> 347   34    management   single      no    -578     yes   no  cellular  18
#> 348   41   blue-collar  married      no     449     yes  yes  cellular  12
#> 349   54    management divorced      no    5253     yes  yes  cellular   7
#> 350   66     housemaid divorced      no    3701      no   no telephone   3
#> 351   28    management  married      no     395      no   no   unknown  21
#> 352   22       student   single      no     722     yes   no  cellular   2
#> 353   50    technician  married      no       4      no   no  cellular  10
#> 354   35    management   single      no       0     yes   no   unknown  30
#> 355   37  entrepreneur  married      no    7944      no   no  cellular  21
#> 356   30    management   single      no      59     yes  yes   unknown   8
#> 357   38        admin.   single      no     221     yes   no  cellular   4
#> 358   36   blue-collar  married      no     330     yes   no  cellular  13
#> 359   43    management   single      no    3872     yes   no  cellular   9
#> 360   42   blue-collar  married      no    3052     yes   no   unknown  27
#> 361   28   blue-collar   single      no     362     yes   no   unknown  19
#> 362   37    management  married      no    5355      no   no telephone  17
#> 363   39    management  married      no     285     yes   no  cellular  15
#> 364   34      services   single      no    3648     yes   no  cellular   5
#> 365   55    unemployed  married      no    4809     yes   no  cellular  21
#> 366   37  entrepreneur  married      no     298      no   no  cellular  27
#> 367   29    technician   single      no    1185     yes   no   unknown  26
#> 368   34    technician  married      no       2     yes   no  cellular  25
#> 369   42      services   single      no     838     yes   no  cellular  19
#> 370   32        admin.  married      no     552     yes   no  cellular   6
#> 371   32   blue-collar  married      no    2561     yes   no   unknown  20
#> 372   34   blue-collar  married      no     351      no  yes  cellular  14
#> 373   39   blue-collar  married      no     161     yes   no  cellular  18
#> 374   35   blue-collar  married      no    -167     yes   no  cellular  15
#> 375   55       retired  married      no    3948      no   no  cellular  19
#> 376   31        admin.  married      no     -36     yes  yes   unknown   4
#> 377   59       retired  married      no     374      no   no  cellular  29
#> 378   34    management  married      no     362     yes   no   unknown  30
#> 379   53      services   single      no    1162     yes   no  cellular  18
#> 380   38   blue-collar  married      no       0      no   no   unknown  20
#> 381   41    management  married      no    5936      no   no  cellular  29
#> 382   46   blue-collar  married      no     853      no   no  cellular  11
#> 383   31        admin.  married      no       2     yes  yes  cellular  12
#> 384   27      services   single      no     814     yes   no  cellular   7
#> 385   51   blue-collar  married      no       0      no   no   unknown   8
#> 386   40    technician divorced      no      16     yes   no telephone  12
#> 387   49    management  married      no     865      no   no  cellular  28
#> 388   39     housemaid  married      no    1444      no   no telephone  25
#> 389   50   blue-collar  married      no     278      no   no   unknown  20
#> 390   45    management  married      no      77     yes   no  cellular  17
#> 391   46   blue-collar  married      no     265     yes   no   unknown   5
#> 392   39   blue-collar  married      no     541     yes   no  cellular   2
#> 393   61 self-employed divorced      no   52587      no   no  cellular  15
#> 394   37    technician   single      no     -59     yes   no  cellular  22
#> 395   38    technician  married      no      90     yes  yes   unknown   8
#> 396   32    management  married      no    1660     yes   no  cellular  11
#> 397   51        admin.  married      no     924     yes   no   unknown  16
#> 398   38    technician   single      no     553     yes   no  cellular  15
#> 399   39     housemaid  married      no       0     yes   no  cellular  29
#> 400   42    management  married      no      36      no   no  cellular  21
#> 401   43 self-employed  married      no    5317      no   no  cellular  31
#> 402   38    technician   single      no      61     yes   no  cellular  13
#> 403   49    management divorced      no    1598     yes   no  cellular  12
#> 404   58       retired  married      no    4007      no   no  cellular  30
#> 405   39   blue-collar   single      no    1537      no  yes   unknown   5
#> 406   50    management  married      no     782      no   no  cellular  16
#> 407   28    management  married      no      12     yes   no  cellular   9
#> 408   51   blue-collar  married      no      51      no  yes  cellular  20
#> 409   47    technician  married      no      72      no   no   unknown  29
#> 410   30        admin.   single      no       5      no  yes  cellular  11
#> 411   55    technician divorced      no     852      no   no  cellular  20
#> 412   40    management   single      no    -222     yes   no  cellular   8
#> 413   33    technician   single      no     129     yes   no   unknown   8
#> 414   31    technician   single      no     694     yes   no   unknown   6
#> 415   33    technician  married      no     145     yes   no  cellular  20
#> 416   58       retired  married      no     928      no   no telephone   4
#> 417   48  entrepreneur  married      no      86     yes   no   unknown  13
#> 418   28        admin.   single      no     731     yes   no   unknown   5
#> 419   38    unemployed   single      no    7159      no   no telephone  30
#> 420   44   blue-collar  married      no     294     yes   no  cellular   2
#> 421   31    management  married      no    1126      no   no   unknown  14
#> 422   46       unknown  married      no    2911      no   no telephone   7
#> 423   32    management   single      no    1804     yes   no   unknown  20
#> 424   36    management   single      no     601      no   no  cellular   2
#> 425   47     housemaid  married      no    1692     yes   no  cellular  30
#> 426   29    unemployed   single      no    1311      no   no  cellular  28
#> 427   35    management   single      no     342      no  yes  cellular   2
#> 428   43  entrepreneur  married      no     210      no   no  cellular  29
#> 429   34    management  married      no    1770     yes   no   unknown   6
#> 430   30    technician   single      no    1416      no   no telephone  19
#> 431   59      services  married      no     196     yes   no telephone  20
#> 432   50    management divorced      no     405      no   no  cellular   2
#> 433   35   blue-collar  married      no     463     yes   no   unknown  21
#> 434   37        admin.   single      no     192     yes   no   unknown  23
#> 435   45   blue-collar  married      no     487     yes   no  cellular  19
#> 436   54        admin. divorced      no    -288     yes   no   unknown  27
#> 437   64    management  married      no    3951      no   no  cellular  28
#> 438   48    management  married      no       0      no  yes  cellular   6
#> 439   62    unemployed  married      no     532      no   no  cellular  31
#> 440   53   blue-collar  married      no    1388      no   no  cellular   7
#> 441   59   blue-collar  married      no       0      no   no   unknown  18
#> 442   43        admin.   single      no     445     yes   no   unknown  19
#> 443   48    management  married      no       2      no   no  cellular  15
#> 444   40    management  married      no   -1212     yes   no  cellular  15
#> 445   46   blue-collar  married      no    5164     yes   no   unknown   5
#> 446   36      services   single      no     616     yes  yes   unknown  12
#> 447   36    technician  married      no     571     yes  yes  cellular  31
#> 448   29      services  married      no     182     yes   no telephone  13
#> 449   29       student   single      no    1093     yes   no   unknown  29
#> 450   39   blue-collar divorced      no     382      no   no  cellular  18
#> 451   38 self-employed  married      no     173      no   no  cellular  18
#> 452   55   blue-collar  married      no     176      no  yes  cellular  22
#> 453   30    management  married      no     367      no   no  cellular   4
#> 454   33    technician   single      no     231     yes   no   unknown  27
#> 455   42    technician  married      no     233      no   no  cellular  20
#> 456   29    management  married      no     318     yes   no  cellular  18
#> 457   43    unemployed  married      no       9     yes  yes  cellular   6
#> 458   46    management   single      no     502      no   no  cellular  25
#> 459   32   blue-collar   single      no     259     yes   no  cellular   8
#> 460   33      services  married      no    1631     yes   no  cellular  20
#> 461   55    technician  married      no     284      no   no  cellular  22
#> 462   36    management  married      no       0     yes   no  cellular  20
#> 463   47  entrepreneur  married      no    1481     yes   no  cellular   6
#> 464   45 self-employed  married      no    3080      no   no  cellular  19
#> 465   30    management   single      no     135      no   no  cellular  14
#> 466   41    management  married      no    5883      no   no  cellular  20
#> 467   75       retired divorced      no    3881     yes   no  cellular   4
#> 468   43    technician divorced      no    1648      no   no  cellular  17
#> 469   46     housemaid  married      no     271     yes   no  cellular  30
#> 470   23      services   single      no      75     yes   no   unknown  15
#> 471   35    technician   single      no     354     yes   no  cellular   4
#> 472   30        admin.  married      no      40     yes  yes  cellular   7
#> 473   48    unemployed   single      no      63      no   no  cellular  30
#> 474   32      services   single      no     459     yes   no   unknown   8
#> 475   49      services  married      no       0      no   no  cellular  26
#> 476   37   blue-collar  married      no     223     yes   no  cellular  14
#> 477   35      services  married      no      74     yes   no   unknown  27
#> 478   58    management  married      no    2769     yes   no  cellular  11
#> 479   53    technician  married      no    4323     yes   no   unknown  15
#> 480   44    technician  married      no    4580     yes   no   unknown  15
#> 481   42        admin.  married      no    -306     yes   no  cellular  17
#> 482   43    technician  married      no    2643      no   no telephone   4
#> 483   53  entrepreneur  married      no    -257     yes  yes   unknown  18
#> 484   28    technician   single      no     441      no  yes  cellular   9
#> 485   27   blue-collar   single     yes      -2     yes  yes   unknown  14
#> 486   54    technician  married      no   10185      no   no  cellular  12
#> 487   33        admin.  married      no    2374     yes   no  cellular  14
#> 488   69       retired  married      no     473      no   no  cellular  21
#> 489   39    management   single      no    3281      no   no   unknown   9
#> 490   50    technician  married      no     423      no   no telephone   7
#> 491   52    technician  married      no    1373      no   no  cellular  27
#> 492   60       retired  married      no    2557     yes   no  cellular   2
#> 493   57    technician  married      no    3858      no   no  cellular  27
#> 494   42    technician  married      no     334     yes   no  cellular  20
#> 495   52   blue-collar divorced      no    1250      no   no   unknown  16
#> 496   40    technician  married      no     657     yes   no  cellular  30
#> 497   32    technician  married      no    1951     yes   no  cellular   8
#> 498   37        admin.   single      no     515     yes   no  cellular  20
#> 499   36    management   single      no     181     yes   no  cellular  13
#> 500   60       retired  married      no    -222      no   no  cellular  17
#> 501   31      services   single     yes      68     yes   no   unknown   9
#> 502   39   blue-collar   single      no       0     yes   no  cellular  14
#> 503   49      services   single      no    3061     yes   no   unknown  15
#> 504   39    management  married      no     691     yes  yes  cellular  16
#> 505   45     housemaid divorced      no     544      no   no   unknown  11
#> 506   34   blue-collar  married      no     355     yes   no  cellular  18
#> 507   53        admin.  married      no    6280      no   no  cellular   4
#> 508   38    technician   single      no     227      no   no  cellular  13
#> 509   28        admin.   single      no     419     yes   no   unknown  28
#> 510   53     housemaid  married     yes     945      no   no  cellular  29
#> 511   27   blue-collar   single      no     940     yes   no  cellular  15
#> 512   30    technician   single      no    2567      no   no  cellular  18
#> 513   33    management  married      no      56     yes   no   unknown  21
#> 514   37    technician   single      no    1609      no  yes   unknown  20
#> 515   30    management   single      no     364      no   no  cellular  30
#> 516   53   blue-collar  married      no    -864     yes   no   unknown   9
#> 517   27    management   single      no    1137     yes   no  cellular   8
#> 518   37   blue-collar  married      no     374     yes   no   unknown   7
#> 519   27    management   single      no    2786      no   no  cellular  15
#> 520   40   blue-collar   single      no     366     yes  yes  cellular  28
#> 521   76     housemaid  married      no    1483      no   no  cellular   2
#> 522   32   blue-collar  married      no    1779     yes   no  cellular  13
#> 523   52        admin.  married      no     722      no   no  cellular  26
#> 524   45        admin.   single      no     341     yes  yes  cellular   5
#> 525   34    management divorced      no     157     yes   no  cellular  12
#> 526   43    management   single      no     776      no   no telephone  18
#> 527   38        admin.  married      no     505     yes  yes  cellular  21
#> 528   60     housemaid  married      no     182      no   no  cellular  26
#> 529   33   blue-collar   single      no     498      no   no  cellular  12
#> 530   29    management  married      no     991      no   no  cellular   7
#> 531   41    technician  married      no    2851      no   no  cellular  18
#> 532   38   blue-collar  married      no    1807      no   no   unknown   7
#> 533   40   blue-collar  married      no    -310     yes  yes  cellular  26
#> 534   41  entrepreneur divorced      no    -413     yes   no   unknown   8
#> 535   45        admin.  married      no    -405      no   no  cellular  31
#> 536   31    unemployed   single      no     315      no   no  cellular  30
#> 537   33    technician  married      no     575      no  yes  cellular   4
#> 538   30      services  married      no       0     yes   no  cellular  21
#> 539   40     housemaid  married      no     116      no   no  cellular  11
#> 540   49        admin.  married      no     635      no   no  cellular  25
#> 541   31      services  married      no    2050     yes   no  cellular  18
#> 542   33      services   single      no     523     yes   no   unknown  28
#> 543   47    technician divorced      no      84      no   no  cellular   8
#> 544   35        admin. divorced      no    3636      no  yes  cellular  21
#> 545   42      services  married      no    3465     yes  yes  cellular  16
#> 546   47     housemaid  married      no    1765      no   no  cellular   8
#> 547   30 self-employed   single      no     635      no  yes  cellular  14
#> 548   51   blue-collar  married      no     653     yes  yes   unknown   6
#> 549   30      services   single      no     631     yes   no  cellular  18
#> 550   56    management  married      no     586      no   no telephone  10
#> 551   37   blue-collar  married      no    1407     yes   no  cellular  21
#> 552   55        admin. divorced      no    3524     yes   no   unknown  19
#> 553   32    management   single      no     112     yes   no  cellular   5
#> 554   52    management  married      no    6873     yes   no  cellular  21
#> 555   43     housemaid divorced      no       0      no   no   unknown  11
#> 556   47        admin.   single      no    3696      no   no  cellular  12
#> 557   58  entrepreneur  married      no     670     yes   no  cellular  12
#> 558   37    unemployed  married      no    7620      no   no telephone  25
#> 559   32    unemployed   single      no    2706      no   no  cellular  21
#> 560   50    management  married      no       5      no   no   unknown   3
#> 561   42        admin. divorced      no     936      no   no  cellular  30
#> 562   32    technician   single      no    1454     yes   no  cellular  20
#> 563   33    technician   single      no    1500      no   no  cellular   7
#> 564   30        admin.   single      no     305      no   no  cellular   4
#> 565   38  entrepreneur   single      no    2543      no   no  cellular  11
#> 566   32    technician  married      no    1242     yes   no   unknown   2
#> 567   28    management   single      no     492      no   no  cellular   2
#> 568   50    unemployed  married      no    3357      no   no  cellular   9
#> 569   27       student   single      no    1390      no   no  cellular  30
#> 570   41        admin.  married      no   16517      no   no  cellular  18
#> 571   54      services divorced      no    2398     yes   no  cellular  17
#> 572   39    technician  married     yes    -183     yes   no   unknown  14
#> 573   34        admin.  married      no     635     yes   no   unknown  26
#> 574   37      services  married      no    1616     yes   no  cellular  28
#> 575   20       student   single      no     602     yes   no  cellular   6
#> 576   53       retired divorced      no     797      no   no   unknown  20
#> 577   30      services   single      no     677     yes   no  cellular  21
#> 578   29  entrepreneur   single      no     430      no  yes  cellular  29
#> 579   47    technician  married      no     434     yes  yes  cellular   5
#> 580   44    management  married      no   12392     yes   no  cellular  13
#> 581   26     housemaid  married      no    -759     yes   no  cellular  11
#> 582   31   blue-collar  married      no     295     yes   no  cellular  12
#> 583   37    management  married      no       0      no   no   unknown  16
#> 584   63       retired  married      no   12067      no   no telephone  29
#> 585   37    management   single      no    8066      no   no telephone  13
#> 586   27        admin.  married      no     249     yes   no  cellular  13
#> 587   26    management   single      no      55      no  yes  cellular  16
#> 588   30    technician  married      no       0      no   no  cellular  28
#> 589   50   blue-collar  married      no      65     yes   no telephone  12
#> 590   34   blue-collar divorced      no    1614     yes   no  cellular  15
#> 591   39   blue-collar divorced      no     412      no   no   unknown  28
#> 592   54    management divorced      no    5475      no   no  cellular  22
#> 593   32   blue-collar   single      no    2137      no   no  cellular  13
#> 594   50   blue-collar  married      no      89     yes   no   unknown   9
#> 595   27       student   single      no    1134      no   no  cellular  21
#> 596   32    technician  married      no     221     yes   no   unknown  23
#> 597   29       student   single      no      48      no   no  cellular  26
#> 598   58       unknown  married      no     208      no   no  cellular   8
#> 599   34      services   single      no      88      no   no  cellular   5
#> 600   50    technician  married      no    1616     yes  yes   unknown   4
#> 601   31    technician   single      no    -167     yes   no   unknown   2
#> 602   58    management divorced      no   26254     yes   no  cellular  21
#> 603   34   blue-collar  married      no    1298     yes   no   unknown  20
#> 604   58   blue-collar divorced      no     820     yes   no  cellular   7
#> 605   38  entrepreneur divorced      no      36      no   no  cellular  18
#> 606   59    technician  married      no    2342      no  yes telephone  23
#> 607   40    unemployed  married      no    1872      no   no  cellular  21
#> 608   35      services  married      no     528      no   no   unknown   7
#> 609   32    technician  married      no      79     yes   no  cellular  25
#> 610   32     housemaid divorced      no    -613     yes   no  cellular  15
#> 611   29        admin.   single      no     260     yes   no  cellular   4
#> 612   53    management divorced      no    6388     yes   no telephone  23
#> 613   44    technician  married      no     398     yes   no   unknown  28
#> 614   36        admin.  married      no     313     yes   no telephone   4
#> 615   38    technician  married      no    5115     yes   no  cellular  27
#> 616   46   blue-collar  married      no     -29     yes   no   unknown  12
#> 617   62       retired  married      no    3340      no   no  cellular   4
#> 618   36   blue-collar divorced      no    3202     yes   no   unknown  21
#> 619   35 self-employed  married      no      -3      no   no   unknown   9
#> 620   35   blue-collar   single      no     218     yes   no  cellular  20
#> 621   35    technician divorced      no    2823     yes   no  cellular  26
#> 622   33    unemployed   single      no    4874      no   no telephone  22
#> 623   49    technician  married      no     905      no   no  cellular  12
#> 624   46    management  married      no    3570      no   no  cellular  13
#> 625   57  entrepreneur  married      no     975     yes  yes  cellular  22
#> 626   58    technician  married      no     289      no   no telephone  21
#> 627   51  entrepreneur  married      no   36935     yes   no  cellular  21
#> 628   31    unemployed  married      no      24     yes   no  cellular  19
#> 629   26        admin.   single      no     140     yes   no  cellular  15
#> 630   42    management  married      no       4     yes   no  cellular   8
#> 631   46   blue-collar  married      no     536     yes   no   unknown  15
#> 632   25    technician  married      no    -559     yes   no  cellular  14
#> 633   58       retired  married      no    1227      no   no  cellular   2
#> 634   35    technician   single      no    2471     yes  yes  cellular  25
#> 635   54    management divorced      no     300     yes   no  cellular   7
#> 636   33    technician  married      no    6419      no   no  cellular   7
#> 637   31        admin.  married      no     454     yes   no   unknown   4
#> 638   45    technician  married      no    3388      no   no   unknown  19
#> 639   50        admin.  married      no     176      no   no  cellular  29
#> 640   28 self-employed  married      no       0     yes   no   unknown   9
#> 641   51    management  married      no    1421     yes   no  cellular   7
#> 642   37      services  married      no       0      no   no   unknown  20
#> 643   40        admin.  married      no       0     yes   no   unknown  20
#> 644   36    unemployed  married      no    7222     yes   no  cellular   4
#> 645   36    technician   single      no    5436     yes   no   unknown  20
#> 646   35    technician   single      no      27     yes   no  cellular  25
#> 647   29     housemaid   single      no      19      no   no  cellular   5
#> 648   36   blue-collar  married      no     723     yes   no  cellular  31
#> 649   50    unemployed  married      no     525     yes   no telephone  18
#> 650   52      services divorced      no    2455      no   no  cellular  25
#> 651   34 self-employed  married      no      47      no   no  cellular   4
#> 652   53    management  married      no    4928     yes   no   unknown  15
#> 653   29      services   single      no    -158     yes   no   unknown   7
#> 654   36    management  married      no     105      no   no  cellular  28
#> 655   31    technician  married      no      28      no   no  cellular  21
#> 656   33    technician   single      no    6325      no   no  cellular  13
#> 657   39    management  married      no       0      no   no   unknown  27
#> 658   45 self-employed divorced      no    -139     yes   no   unknown   7
#> 659   46    unemployed  married      no    1040      no   no telephone  12
#> 660   52      services  married      no     337     yes   no   unknown  19
#> 661   38   blue-collar  married      no     171     yes  yes   unknown  20
#> 662   25       student   single      no    2354      no   no  cellular  30
#> 663   60    management   single      no       0      no  yes  cellular  23
#> 664   49    management  married      no     412      no   no  cellular  21
#> 665   65       retired  married      no    1973      no   no telephone  21
#> 666   43    technician   single      no     293     yes   no   unknown  15
#> 667   33      services  married      no     210     yes  yes   unknown  20
#> 668   43 self-employed  married      no     819      no   no   unknown  20
#> 669   26    management   single      no     948     yes   no  cellular  17
#> 670   36        admin.  married      no     957     yes   no   unknown  21
#> 671   53   blue-collar  married      no       0      no   no telephone  31
#> 672   47   blue-collar  married      no    3696     yes   no  cellular  19
#> 673   57    management  married      no    4547      no   no  cellular   7
#> 674   37    management   single      no    8311     yes   no  cellular  16
#> 675   23   blue-collar   single     yes    -207     yes   no   unknown   3
#> 676   38    technician   single      no       0     yes   no   unknown   6
#> 677   39  entrepreneur  married      no    1654      no   no  cellular  17
#> 678   61       retired  married      no    2557     yes   no  cellular  10
#> 679   60       retired  married      no    1720      no   no telephone   6
#> 680   55        admin.  married      no     859      no   no telephone  12
#> 681   50      services  married      no    2603      no   no  cellular  18
#> 682   38   blue-collar  married      no     702      no   no   unknown  17
#> 683   38    management   single      no     574     yes   no  cellular  28
#> 684   52   blue-collar  married      no    -164      no   no  cellular  22
#> 685   32        admin.  married      no    1974     yes   no   unknown  30
#> 686   33        admin.   single      no    2557     yes   no  cellular  18
#> 687   19       student   single      no     108      no   no  cellular   9
#> 688   47        admin.  married      no     175     yes   no  cellular  26
#> 689   44    management divorced      no     388     yes   no telephone  13
#> 690   47    management   single      no       0      no   no  cellular  12
#> 691   41        admin.  married      no       2     yes   no   unknown  19
#> 692   37    technician  married      no    1707     yes   no  cellular  26
#> 693   34    technician   single      no     666      no   no  cellular  21
#> 694   38    technician  married      no    -267      no   no  cellular  11
#> 695   30       student  married      no     324      no   no  cellular  25
#> 696   22        admin.   single      no     118     yes   no   unknown  16
#> 697   29   blue-collar   single      no     161      no  yes  cellular   7
#> 698   54 self-employed  married      no     542      no   no telephone   6
#> 699   31    technician  married      no    -292     yes  yes   unknown   3
#> 700   36        admin.  married      no     421     yes   no  cellular  20
#> 701   39   blue-collar  married      no    1360     yes   no  cellular  13
#> 702   46    management  married      no     700      no  yes  cellular   7
#> 703   56 self-employed  married      no    1539      no   no  cellular  28
#> 704   22      services   single      no     395     yes   no   unknown  13
#> 705   35        admin.   single      no    1537     yes   no  cellular   5
#> 706   46        admin.  married      no     526      no  yes  cellular  31
#> 707   27      services  married      no     100      no   no  cellular  16
#> 708   50    management  married      no     619     yes   no telephone  25
#> 709   30    management  married      no    1825     yes   no   unknown   9
#> 710   39    management divorced      no     401      no   no   unknown   6
#> 711   47        admin.  married      no    1156      no  yes   unknown   3
#> 712   35   blue-collar   single      no     142     yes   no  cellular   7
#> 713   28    management   single      no     265     yes   no  cellular  25
#> 714   48   blue-collar  married      no     762     yes   no   unknown  12
#> 715   33    technician  married      no       0     yes   no  cellular   4
#> 716   36      services  married      no     812     yes  yes  cellular   2
#> 717   38      services  married      no     611     yes  yes   unknown  18
#> 718   41    technician  married      no     130      no   no   unknown  17
#> 719   57        admin.  married      no    -967     yes   no telephone  15
#> 720   35        admin.   single      no     148     yes   no   unknown   6
#> 721   41        admin. divorced      no       4     yes   no  cellular   5
#> 722   41     housemaid   single      no      21      no   no   unknown   6
#> 723   31      services   single      no   11386     yes   no  cellular  20
#> 724   34    management   single      no     673     yes  yes  cellular  20
#> 725   34      services  married      no    1553     yes   no  cellular  20
#> 726   43      services   single      no     193     yes   no   unknown   8
#> 727   52      services  married      no     992     yes   no  cellular  27
#> 728   31 self-employed   single      no     762      no   no  cellular  11
#> 729   31    technician   single      no     335     yes   no   unknown  28
#> 730   41    management   single      no    3371     yes  yes  cellular  13
#> 731   38   blue-collar  married      no      49     yes   no   unknown   9
#> 732   70       retired divorced      no     482      no   no telephone  14
#> 733   19       student   single      no    1803      no   no  cellular  23
#> 734   38   blue-collar  married      no     132     yes   no  cellular  14
#> 735   39       retired   single      no     -79      no   no   unknown   9
#> 736   36    management  married      no    1352      no   no   unknown  19
#> 737   56    technician  married      no     147      no   no  cellular  12
#> 738   29    management   single      no     308      no   no  cellular   4
#> 739   33    management  married      no     -14     yes   no  cellular  20
#> 740   48   blue-collar  married      no     794      no   no  cellular  11
#> 741   43   blue-collar  married      no     794     yes   no  cellular  13
#> 742   44    technician  married      no     331     yes   no  cellular  20
#> 743   31    management   single      no     347     yes   no  cellular  27
#> 744   54   blue-collar  married      no    2255      no   no  cellular  25
#> 745   37 self-employed  married      no     129      no   no  cellular  18
#> 746   28 self-employed   single      no     442      no   no  cellular  19
#> 747   39        admin.  married     yes       0      no   no   unknown  29
#> 748   29    unemployed  married      no     596      no   no  cellular  30
#> 749   44   blue-collar  married      no    -431     yes   no   unknown  29
#> 750   46   blue-collar  married      no    9083     yes   no  cellular   8
#> 751   37    management   single      no      24     yes  yes  cellular  11
#> 752   42   blue-collar  married      no    -150     yes   no  cellular  20
#> 753   18       student   single      no     156      no   no  cellular   4
#> 754   39        admin.  married      no    -982     yes  yes  cellular  19
#> 755   58 self-employed  married      no    1407     yes   no   unknown  30
#> 756   30   blue-collar   single      no     155     yes  yes  cellular   9
#> 757   31       student   single      no    4951      no   no  cellular  17
#> 758   30       student   single      no       0      no   no  cellular   6
#> 759   44    management  married      no    7454      no   no   unknown   5
#> 760   30    technician   single      no    6683      no   no  cellular  30
#> 761   27       student   single      no       0      no   no   unknown   8
#> 762   43    management  married      no     248      no   no  cellular   7
#> 763   33    management   single      no    3161     yes   no  cellular   2
#> 764   40   blue-collar  married      no     252     yes  yes  cellular   9
#> 765   35    technician   single      no    1529      no   no   unknown  23
#> 766   41     housemaid  married      no     304      no   no  cellular  20
#> 767   31   blue-collar  married      no      42     yes   no   unknown   9
#> 768   50   blue-collar  married      no     480     yes   no   unknown  20
#> 769   59   blue-collar  married      no       0      no   no telephone  24
#> 770   57       retired  married      no    -157      no   no  cellular  28
#> 771   46        admin.  married      no       0     yes  yes  cellular  20
#> 772   52   blue-collar  married      no    1860      no   no   unknown  20
#> 773   47   blue-collar  married      no      85      no   no  cellular  25
#> 774   46      services   single      no     454      no   no  cellular  24
#> 775   40    management  married      no     229     yes   no  cellular  14
#> 776   34      services divorced      no     202     yes   no   unknown  15
#> 777   38   blue-collar   single      no    1137      no   no  cellular  13
#> 778   52   blue-collar  married      no     568     yes   no telephone  17
#> 779   50        admin.  married      no    -221      no  yes   unknown   3
#> 780   50   blue-collar  married      no      37     yes  yes  cellular  31
#> 781   27   blue-collar  married      no      52      no  yes  cellular   7
#> 782   35    management  married      no    1650      no   no  cellular   8
#> 783   30      services   single      no     542     yes   no   unknown   7
#> 784   53    management  married      no    2693      no   no  cellular  21
#> 785   19       student   single      no     134      no   no  cellular  27
#> 786   36        admin.  married      no     194     yes  yes  cellular   7
#> 787   53      services  married      no    2719     yes   no   unknown  30
#> 788   30   blue-collar  married      no     364     yes  yes  cellular   4
#> 789   53    technician divorced      no      45      no   no   unknown  28
#> 790   30        admin.   single     yes    -242      no   no   unknown   4
#> 791   27      services   single      no       1     yes  yes   unknown   2
#> 792   51   blue-collar  married      no    -286     yes   no   unknown   9
#> 793   27        admin.   single      no     261     yes  yes  cellular   3
#> 794   46    management   single      no    5993      no   no  cellular  20
#> 795   44    technician  married      no     358      no   no   unknown   5
#> 796   39    management  married      no    1112      no   no  cellular   6
#> 797   47    technician  married      no    -401     yes   no   unknown  23
#> 798   35    technician divorced      no     515     yes  yes  cellular  29
#> 799   37   blue-collar  married      no       6     yes   no  cellular  12
#> 800   40 self-employed  married      no     355     yes   no  cellular  17
#> 801   50   blue-collar  married      no      40     yes   no   unknown   8
#> 802   24       student   single      no       0      no   no  cellular  13
#> 803   34     housemaid  married      no     -97     yes  yes  cellular   8
#> 804   55    management divorced      no    2625     yes   no  cellular   5
#> 805   39        admin.  married      no     260     yes   no  cellular  13
#> 806   34       unknown  married      no    4535      no   no  cellular   6
#> 807   51    management  married      no     346      no   no  cellular  12
#> 808   44 self-employed  married      no     335      no   no  cellular   2
#> 809   48    technician  married      no     101     yes   no  cellular  29
#> 810   45  entrepreneur  married      no     245     yes   no   unknown  14
#> 811   37        admin. divorced      no       0      no   no  cellular  24
#> 812   35        admin.  married      no     147     yes  yes  cellular  29
#> 813   47   blue-collar  married      no     863     yes   no   unknown  19
#> 814   35   blue-collar  married      no     270     yes  yes  cellular   6
#> 815   32    unemployed  married      no      10     yes   no   unknown   6
#> 816   39      services  married      no    1116     yes   no  cellular  30
#> 817   41   blue-collar  married      no    1165      no   no   unknown  12
#> 818   43    technician  married      no     533     yes   no  cellular  31
#> 819   61    management  married      no    6016      no   no  cellular   4
#> 820   50    management  married      no      85      no  yes  cellular   1
#> 821   42   blue-collar  married      no     505     yes   no  cellular  15
#> 822   47    management  married      no      -1      no   no  cellular   6
#> 823   34    management  married      no      63      no   no  cellular  18
#> 824   32    management  married      no    3517     yes   no   unknown  27
#> 825   31      services  married      no    1670      no   no  cellular  18
#> 826   44       retired  married      no     779     yes   no   unknown  21
#> 827   45        admin.  married      no     142     yes  yes   unknown  29
#> 828   39        admin.   single      no       0     yes   no   unknown   6
#> 829   57       retired  married      no     211     yes   no   unknown   5
#> 830   37   blue-collar  married      no      14     yes   no  cellular  31
#> 831   39    management  married      no    1034     yes   no   unknown  30
#> 832   69       retired divorced      no    4572      no   no  cellular  27
#> 833   46    technician  married      no       0     yes   no  cellular  19
#> 834   33    technician  married      no       0     yes   no   unknown   7
#> 835   42     housemaid  married      no     341      no   no   unknown  24
#> 836   32    management   single      no     593     yes   no  cellular  13
#> 837   53    management  married      no     694      no   no   unknown  18
#> 838   54      services   single      no     492      no   no   unknown   6
#> 839   37 self-employed   single      no     125      no   no   unknown   5
#> 840   43    management  married      no     587     yes   no  cellular   5
#> 841   32   blue-collar  married      no     335     yes   no  cellular  13
#> 842   40   blue-collar  married      no     104     yes   no  cellular  13
#> 843   44    technician  married      no    7863      no   no  cellular  26
#> 844   31   blue-collar   single      no    1124     yes   no  cellular  18
#> 845   45   blue-collar  married      no     803     yes   no  cellular   4
#> 846   26        admin.   single      no     483     yes   no  cellular  18
#> 847   46    management  married      no    9678     yes   no  cellular  17
#> 848   46    technician  married      no     591      no   no telephone  29
#> 849   59      services  married      no     -22     yes   no   unknown  26
#> 850   32   blue-collar  married      no     -94     yes  yes  cellular  11
#> 851   37    management   single      no   22125      no  yes  cellular  21
#> 852   54    technician  married      no       0      no   no  cellular  30
#> 853   53      services  married      no      -2     yes  yes  cellular  16
#> 854   47        admin.  married      no    3676      no   no  cellular  15
#> 855   52      services divorced      no      36     yes  yes  cellular  11
#> 856   46   blue-collar   single      no       0     yes   no  cellular   8
#> 857   24       student   single      no   23878      no   no  cellular  26
#> 858   47   blue-collar  married      no     259      no   no  cellular  25
#> 859   33 self-employed  married      no    1676     yes   no  cellular  12
#> 860   30    management  married      no      24     yes   no  cellular  29
#> 861   51 self-employed divorced      no     154     yes   no   unknown  15
#> 862   46      services  married     yes     130      no   no  cellular  20
#> 863   56    technician   single      no     145     yes   no telephone   6
#> 864   42    unemployed  married      no     576      no   no  cellular   3
#> 865   39        admin.  married      no      15      no   no   unknown   5
#> 866   46     housemaid  married      no     269      no   no  cellular   8
#> 867   26    management   single      no    1623      no   no  cellular   2
#> 868   36        admin.   single      no     449     yes   no   unknown  20
#> 869   35    management divorced      no    6997     yes   no  cellular   9
#> 870   40    unemployed   single      no      97     yes  yes  cellular   2
#> 871   60      services  married      no    8837     yes   no   unknown  16
#> 872   41   blue-collar divorced      no    2195     yes   no   unknown   3
#> 873   37 self-employed  married      no    8230     yes   no  cellular  17
#> 874   48   blue-collar   single      no    -269      no   no  cellular   2
#> 875   44    technician  married      no    1226     yes  yes  cellular  29
#> 876   32   blue-collar  married     yes    -148     yes   no  cellular   4
#> 877   52      services divorced      no     238     yes   no  cellular   6
#> 878   19       student   single      no     526      no   no  cellular   1
#> 879   62    technician  married      no     635      no   no  cellular  22
#> 880   34   blue-collar  married      no       7     yes  yes  cellular   2
#> 881   45    technician  married      no    -847      no  yes  cellular  22
#> 882   47    technician  married      no    1059     yes   no  cellular  21
#> 883   41    technician  married      no     902      no   no   unknown  16
#> 884   80       retired  married      no    1468      no   no  cellular  13
#> 885   32    technician   single      no      82      no   no  cellular  18
#> 886   31    management  married      no     877      no   no  cellular   9
#> 887   39    management   single      no    2258     yes   no  cellular  31
#> 888   27    management   single      no    6791      no   no  cellular  24
#> 889   42  entrepreneur  married      no    -480     yes  yes   unknown   2
#> 890   40      services divorced      no     160      no   no  cellular  14
#> 891   30    technician   single      no       0      no   no  cellular  22
#> 892   35   blue-collar   single      no     546     yes   no  cellular  13
#> 893   30    management   single      no    1761     yes   no  cellular  15
#> 894   44      services divorced      no     396     yes  yes   unknown   7
#> 895   45   blue-collar  married      no    1335     yes   no  cellular  12
#> 896   36      services   single      no     174     yes   no   unknown   7
#> 897   27  entrepreneur  married      no      97     yes  yes  cellular  18
#> 898   25   blue-collar   single      no       0     yes   no   unknown  15
#> 899   32   blue-collar   single      no    1137     yes  yes  cellular   6
#> 900   34    technician  married      no     555     yes   no  cellular   7
#> 901   45   blue-collar  married      no      42     yes   no   unknown  19
#> 902   38   blue-collar   single      no     522     yes   no   unknown  29
#> 903   37 self-employed   single      no     281     yes   no   unknown   5
#> 904   57    technician  married      no   27069      no  yes   unknown  20
#> 905   25      services   single      no    2022      no   no  cellular  29
#> 906   38    management   single      no    1495     yes   no  cellular  30
#> 907   25    technician   single      no    1693      no   no  cellular   5
#> 908   41     housemaid  married      no    1529      no   no  cellular   7
#> 909   27    management   single      no     148     yes   no  cellular  31
#> 910   57   blue-collar  married      no      24      no   no   unknown  16
#> 911   33 self-employed  married      no     483     yes   no  cellular   3
#> 912   46   blue-collar  married      no     877      no   no  cellular  29
#> 913   30    technician  married      no    3418      no   no  cellular  25
#> 914   43      services  married      no    2557     yes   no telephone  15
#> 915   32    technician divorced      no       2     yes   no   unknown  11
#> 916   51   blue-collar  married      no    2832     yes   no  cellular  20
#> 917   43    management  married      no       0     yes   no  cellular  17
#> 918   28   blue-collar  married      no      86     yes  yes   unknown  15
#> 919   34        admin.  married      no    1406     yes   no  cellular  27
#> 920   30    management  married      no   11391     yes   no  cellular  20
#> 921   27    management  married      no    1918      no   no  cellular   9
#> 922   42        admin. divorced      no    2129      no   no  cellular  13
#> 923   38        admin.   single      no    -327      no   no  cellular  22
#> 924   36   blue-collar   single      no     736     yes   no  cellular  16
#> 925   50    management   single      no     297     yes   no   unknown   5
#> 926   34   blue-collar  married      no    2308     yes   no   unknown   7
#> 927   49    management  married      no      99     yes   no  cellular   6
#> 928   24       student   single      no     382      no   no  cellular  13
#> 929   57    management divorced      no       0      no   no   unknown  16
#> 930   29        admin.  married      no     535      no   no  cellular  11
#> 931   29   blue-collar   single      no     770     yes   no  cellular  17
#> 932   79       retired  married      no    2661      no   no  cellular  10
#> 933   31   blue-collar  married      no    3659      no   no   unknown   2
#> 934   31        admin.   single      no    3323     yes   no  cellular   9
#> 935   41    management  married      no      20     yes   no  cellular  17
#> 936   56       retired divorced      no     275     yes  yes  cellular  10
#> 937   38    technician  married      no   -1038      no  yes  cellular  23
#> 938   37   blue-collar   single      no     690     yes   no  cellular  18
#> 939   41    technician  married      no     994      no   no  cellular  22
#> 940   31    management   single      no     775     yes   no  cellular  20
#> 941   27       student   single      no     279      no   no  cellular  12
#> 942   52  entrepreneur divorced      no     105      no  yes telephone  22
#> 943   27   blue-collar   single      no     484     yes   no  cellular  15
#> 944   40   blue-collar  married      no       0     yes   no   unknown   6
#> 945   23      services   single      no     870      no   no  cellular   6
#> 946   43    management  married      no      -8     yes   no   unknown  20
#> 947   41      services  married      no     124     yes   no   unknown  16
#> 948   46        admin. divorced      no    1203      no   no  cellular  30
#> 949   31        admin.   single      no     355     yes   no  cellular  12
#> 950   48   blue-collar  married      no     448     yes   no   unknown   8
#> 951   46    technician  married      no    2501      no   no  cellular  26
#> 952   33   blue-collar  married      no      53      no   no  cellular  20
#> 953   65       retired  married      no   23421      no   no  cellular   2
#> 954   65       retired  married      no    3713      no   no  cellular   7
#> 955   27       student   single      no   16173     yes   no   unknown  28
#> 956   27        admin.  married      no      53     yes   no  cellular  18
#> 957   39    management  married      no     271     yes   no  cellular   8
#> 958   30        admin.   single      no     732      no   no  cellular  20
#> 959   55    management  married      no     338     yes   no  cellular  14
#> 960   58       retired  married      no     662     yes   no  cellular   2
#> 961   35        admin.  married      no    1994      no   no  cellular   9
#> 962   52    unemployed  married      no      94      no   no  cellular   4
#> 963   34        admin. divorced      no     -75      no   no  cellular   3
#> 964   37    technician  married      no     732      no   no  cellular  25
#> 965   29    technician  married      no     767     yes   no  cellular   5
#> 966   28    management   single      no    1335      no  yes   unknown   4
#> 967   60       unknown  married      no    4722      no   no   unknown  20
#> 968   44    unemployed  married      no     280     yes   no   unknown   5
#> 969   36   blue-collar  married      no      29     yes  yes  cellular  31
#> 970   27   blue-collar   single      no    1049      no   no telephone  29
#> 971   42   blue-collar divorced      no     299     yes   no  cellular  29
#> 972   35   blue-collar  married      no    2643     yes   no  cellular   2
#> 973   61       unknown   single      no      50      no   no telephone  21
#> 974   31    technician   single      no    1214      no   no  cellular   3
#> 975   29    management  married      no     103     yes   no  cellular  17
#> 976   40   blue-collar  married      no     326     yes  yes  cellular   7
#> 977   53   blue-collar  married      no    4793     yes   no telephone  20
#> 978   35    management  married      no     272     yes  yes  cellular  11
#> 979   26    management   single      no     962     yes   no  cellular   8
#> 980   51       retired  married      no     965     yes   no  cellular  28
#> 981   55       retired  married      no     -90     yes  yes   unknown   7
#> 982   47    management  married      no    6637     yes   no  cellular  17
#> 983   46   blue-collar  married      no     431     yes   no  cellular  14
#> 984   28    management   single      no    4937     yes   no telephone  13
#> 985   47      services  married      no     216     yes   no  cellular  12
#> 986   29        admin.  married      no     943     yes   no   unknown   4
#> 987   45  entrepreneur  married      no       1      no   no  cellular  19
#> 988   41    management  married      no    5585      no   no   unknown   9
#> 989   33 self-employed  married      no    -103     yes   no   unknown  28
#> 990   32    management  married      no    4733      no   no  cellular  30
#> 991   55     housemaid  married      no     139      no   no  cellular  22
#> 992   29    management  married      no      16     yes   no  cellular  16
#> 993   35    management  married      no     616      no  yes  cellular   7
#> 994   55    management  married      no    1433      no   no   unknown  12
#> 995   31 self-employed   single      no    2589      no   no  cellular  21
#> 996   56    management  married      no    5282      no   no  cellular  17
#> 997   43   blue-collar  married      no     232      no  yes  cellular  15
#> 998   33    management divorced      no     893     yes   no  cellular  29
#> 999   48       retired divorced      no     666     yes   no  cellular  15
#> 1000  45        admin.  married      no     180     yes   no   unknown   9
#> 1001  31      services  married      no    -732     yes   no   unknown   8
#> 1002  56    management  married      no    1390     yes   no  cellular  18
#> 1003  57     housemaid  married      no     501     yes  yes  cellular  11
#> 1004  30        admin.   single      no     382     yes   no  cellular  19
#> 1005  51   blue-collar divorced      no     -28      no  yes   unknown   2
#> 1006  33 self-employed  married      no     666     yes   no  cellular  16
#> 1007  43    management  married      no    1800      no   no telephone  29
#> 1008  55    technician   single      no    3339     yes   no   unknown   2
#> 1009  30    technician  married      no     526     yes  yes   unknown  26
#> 1010  36    unemployed  married     yes    -318     yes   no   unknown  15
#> 1011  50    management  married      no    2910      no   no telephone  19
#> 1012  31   blue-collar   single      no     411      no   no  cellular  21
#> 1013  55    technician  married      no       0      no   no  cellular  17
#> 1014  31    management   single      no     471      no   no  cellular  29
#> 1015  54       retired divorced      no    2761      no   no  cellular  16
#> 1016  59    technician  married      no    4243     yes   no   unknown  29
#> 1017  38  entrepreneur  married      no     197      no   no   unknown  17
#> 1018  46    management divorced      no     225     yes   no  cellular  14
#> 1019  54   blue-collar  married      no    1765     yes   no   unknown  14
#> 1020  58       retired divorced      no     312      no   no  cellular   7
#> 1021  71       retired divorced      no    3104      no   no telephone  12
#> 1022  45       unknown  married      no    2834      no   no  cellular   4
#> 1023  32    unemployed  married      no    2400     yes  yes  cellular   5
#> 1024  46      services  married      no      72     yes   no  cellular  15
#> 1025  48    management divorced      no     148      no   no  cellular  12
#> 1026  53      services divorced      no     765     yes   no  cellular  14
#> 1027  40   blue-collar   single      no    3571     yes   no  cellular  10
#> 1028  55    management divorced      no     608     yes   no  cellular   7
#> 1029  32      services   single      no    -408     yes   no   unknown  23
#> 1030  38    management divorced      no    5455     yes   no   unknown  27
#> 1031  35   blue-collar   single      no     907     yes  yes   unknown   8
#> 1032  39 self-employed  married      no     266      no   no  cellular  11
#> 1033  43   blue-collar  married      no      30      no   no  cellular  14
#> 1034  48   blue-collar  married      no     554      no   no   unknown  16
#> 1035  35 self-employed  married      no    1340      no  yes  cellular  19
#> 1036  58        admin.  married      no    2777     yes   no telephone   2
#> 1037  28   blue-collar  married      no     -26      no  yes  cellular  30
#> 1038  36   blue-collar  married      no    -742     yes  yes  cellular  31
#> 1039  44    management  married      no    1242     yes   no  cellular   6
#> 1040  36    technician  married      no     361      no   no  cellular   6
#> 1041  37    technician divorced      no    1176      no  yes   unknown  21
#> 1042  52    technician  married      no     876      no   no  cellular   4
#> 1043  33    management  married      no     876      no   no   unknown  20
#> 1044  52    management divorced      no      12     yes   no   unknown  30
#> 1045  50    management  married      no    1165      no   no  cellular  16
#> 1046  36    management   single      no    4788     yes   no  cellular  16
#> 1047  34    technician   single      no    2660     yes   no  cellular  15
#> 1048  54    management divorced      no     155     yes   no   unknown  14
#> 1049  32      services  married      no    2578      no   no  cellular  29
#> 1050  48    management   single      no    -295      no  yes  cellular  28
#> 1051  34    technician   single      no       0      no   no telephone  10
#> 1052  32   blue-collar   single      no     181     yes   no  cellular   6
#> 1053  53   blue-collar  married      no    1311      no   no telephone  14
#> 1054  52    technician  married      no    2709     yes   no telephone   9
#> 1055  36   blue-collar  married      no     537      no  yes  cellular   7
#> 1056  42      services  married      no     146     yes  yes  cellular  15
#> 1057  38  entrepreneur  married      no    1134     yes   no  cellular   7
#> 1058  48  entrepreneur   single      no       0     yes   no  cellular   6
#> 1059  30      services   single      no     732     yes   no  cellular  17
#> 1060  36    technician divorced      no     556     yes   no  cellular  18
#> 1061  48    management divorced     yes    -625     yes   no   unknown  29
#> 1062  38    management   single      no    3813      no   no  cellular   7
#> 1063  27    management  married      no      33     yes   no  cellular  18
#> 1064  48        admin. divorced      no    -480      no   no  cellular  18
#> 1065  36   blue-collar  married      no    -453     yes   no   unknown  19
#> 1066  41  entrepreneur  married      no     187      no  yes  cellular  21
#> 1067  46    technician   single      no       0      no   no  cellular  19
#> 1068  60   blue-collar divorced      no       0     yes   no   unknown  29
#> 1069  40   blue-collar  married      no      98     yes   no  cellular  11
#> 1070  46   blue-collar  married     yes    -388      no   no  cellular  18
#> 1071  45    management  married      no    9711      no   no   unknown  19
#> 1072  30    management  married      no     168     yes   no  cellular  18
#> 1073  60        admin.  married      no      39     yes  yes   unknown   5
#> 1074  34    management   single      no     382      no   no  cellular   3
#> 1075  37   blue-collar   single      no    2032     yes   no   unknown  21
#> 1076  28    management  married      no    3694      no  yes  cellular   8
#> 1077  43      services divorced      no     957      no  yes  cellular  22
#> 1078  56   blue-collar  married      no     690     yes   no   unknown  15
#> 1079  30    management  married      no     859     yes   no   unknown  20
#> 1080  49   blue-collar divorced      no     235      no   no  cellular  29
#> 1081  41    management  married      no   27696      no   no  cellular  12
#> 1082  28    technician  married      no     858     yes   no  cellular  17
#> 1083  36    management   single      no    3875     yes   no  cellular  11
#> 1084  35      services divorced      no     440     yes   no  cellular   5
#> 1085  39    technician  married      no     192     yes  yes   unknown  29
#> 1086  32    technician  married      no     344     yes   no  cellular  20
#> 1087  50   blue-collar  married      no   12519     yes   no  cellular  21
#> 1088  49 self-employed  married      no     294     yes   no   unknown   2
#> 1089  40   blue-collar  married      no    4608     yes   no telephone  19
#> 1090  41        admin. divorced      no    1634     yes  yes  cellular  12
#> 1091  26        admin.   single      no    1327      no   no  cellular  30
#> 1092  37    management  married      no     238      no   no  cellular   3
#> 1093  50    technician  married      no    -353     yes  yes  cellular  18
#> 1094  57       retired   single      no     976     yes   no  cellular   9
#> 1095  33    technician divorced      no    1480     yes   no  cellular   5
#> 1096  55    management  married      no    1185      no   no   unknown   5
#> 1097  39    management   single      no     139      no   no  cellular  22
#> 1098  51        admin.  married      no     531     yes   no   unknown   5
#> 1099  27 self-employed   single      no     168      no   no  cellular  12
#> 1100  80       retired  married      no    8304      no   no telephone   9
#> 1101  36    management   single      no     811      no   no  cellular   6
#> 1102  44      services  married      no    4786     yes  yes  cellular  12
#> 1103  46    technician  married      no    1465     yes   no   unknown  14
#> 1104  39   blue-collar  married      no     579     yes  yes  cellular   5
#> 1105  31   blue-collar  married      no     591     yes   no   unknown  14
#> 1106  59     housemaid  married      no     352      no   no telephone  21
#> 1107  59    management  married      no    7049      no   no   unknown  11
#> 1108  30    management   single      no    8101     yes   no  cellular  21
#> 1109  31    management   single      no       3      no   no  cellular   4
#> 1110  66     housemaid  married      no      40      no   no telephone  14
#> 1111  53   blue-collar  married      no    4380      no   no telephone  19
#> 1112  59 self-employed  married      no    3800      no  yes  cellular   9
#> 1113  26   blue-collar  married      no    -219     yes  yes   unknown  15
#> 1114  35   blue-collar  married      no    4723     yes   no   unknown  16
#> 1115  36    management  married      no    2326     yes   no  cellular  20
#> 1116  31    technician   single      no    1166     yes   no   unknown   3
#> 1117  30        admin.  married      no     874     yes   no  cellular  22
#> 1118  33    management  married      no     307      no   no   unknown  16
#> 1119  57    technician  married      no       0      no   no  cellular  16
#> 1120  27        admin.   single      no     110     yes   no   unknown  28
#> 1121  37     housemaid   single      no    1358      no   no telephone  28
#> 1122  47    management   single      no      86      no   no  cellular  30
#> 1123  39    management  married      no    1423     yes   no telephone  21
#> 1124  32    technician divorced      no    2870      no   no  cellular  18
#> 1125  33     housemaid  married      no       0      no   no  cellular   8
#> 1126  51  entrepreneur   single      no     440      no   no   unknown  18
#> 1127  45    technician   single      no       0      no   no  cellular  18
#> 1128  43    technician divorced      no    1413     yes   no telephone  28
#> 1129  53     housemaid divorced      no     292      no   no   unknown  12
#> 1130  55    technician  married      no     273     yes   no  cellular  29
#> 1131  36 self-employed  married      no    1245     yes   no  cellular   9
#> 1132  34   blue-collar  married      no    -480     yes  yes  cellular   8
#> 1133  37     housemaid   single      no       0      no   no  cellular  28
#> 1134  46   blue-collar  married      no     572     yes   no   unknown   3
#> 1135  37    management  married      no     247      no   no  cellular   9
#> 1136  29    technician  married      no     428      no   no  cellular  14
#> 1137  40    management   single      no    1247     yes   no  cellular   9
#> 1138  34   blue-collar divorced      no    1125     yes  yes  cellular  19
#> 1139  59   blue-collar  married      no    -162     yes  yes   unknown  20
#> 1140  41      services  married      no     803     yes   no  cellular   9
#> 1141  27        admin.  married      no    4144     yes   no   unknown   4
#> 1142  33    management   single      no     372     yes  yes  cellular   6
#> 1143  36   blue-collar  married      no     199     yes   no   unknown  12
#> 1144  37      services  married      no     -24     yes   no   unknown  27
#> 1145  52        admin.  married      no       0      no   no  cellular  22
#> 1146  51    management divorced      no     119      no   no   unknown   5
#> 1147  32    technician   single      no      28     yes   no  cellular  17
#> 1148  45    management  married      no    -191     yes   no  cellular  18
#> 1149  38    management  married      no    2656      no   no  cellular   8
#> 1150  57       retired divorced     yes       0      no  yes  cellular  24
#> 1151  24    management   single      no      66     yes   no   unknown  26
#> 1152  46    management  married      no      10     yes   no  cellular  29
#> 1153  46    management  married      no     477     yes   no   unknown  20
#> 1154  51    management  married      no    -714      no   no  cellular  18
#> 1155  48    management  married     yes    -998     yes   no  cellular  18
#> 1156  44    management  married      no    6203     yes  yes  cellular  17
#> 1157  37   blue-collar   single      no    2390     yes   no  cellular  20
#> 1158  35    management   single      no     714     yes   no  cellular  26
#> 1159  40  entrepreneur  married      no    2252      no   no   unknown  12
#> 1160  35    management   single      no     244     yes   no   unknown  12
#> 1161  34        admin.  married      no     445      no   no  cellular  19
#> 1162  32   blue-collar  married      no      25     yes   no  cellular   6
#> 1163  37    management   single      no     242      no  yes  cellular  28
#> 1164  53   blue-collar  married      no     252      no   no  cellular  31
#> 1165  56       retired  married      no       5      no   no  cellular  23
#> 1166  37        admin.   single      no    1113     yes   no   unknown   9
#> 1167  52        admin.  married      no       0      no  yes telephone   9
#> 1168  29      services  married      no       3     yes   no  cellular  10
#> 1169  56    unemployed  married      no     216      no   no   unknown  19
#> 1170  41   blue-collar  married      no    4910     yes   no  cellular   3
#> 1171  56    management  married      no    -155     yes   no  cellular  17
#> 1172  37     housemaid divorced      no    1040     yes   no  cellular  13
#> 1173  55       retired  married      no     991      no   no  cellular  11
#> 1174  53    management divorced      no    3158      no   no  cellular  31
#> 1175  47      services  married      no     665     yes   no  cellular  20
#> 1176  48   blue-collar   single      no     339      no  yes telephone  14
#> 1177  79       retired divorced      no    1910      no   no telephone  24
#> 1178  58    technician  married      no    -205     yes   no   unknown   3
#> 1179  32        admin.   single      no     212      no   no  cellular   7
#> 1180  59    management   single      no     181     yes   no   unknown   9
#> 1181  34    management   single      no     681      no   no  cellular   6
#> 1182  44        admin.  married      no     348     yes  yes  cellular  16
#> 1183  48    management  married      no    1167     yes  yes  cellular  26
#> 1184  50    management  married      no    8345      no   no   unknown  11
#> 1185  43    management  married      no    8167     yes   no   unknown  19
#> 1186  34   blue-collar  married      no       0     yes  yes   unknown  20
#> 1187  36    technician   single      no    1044     yes   no  cellular  20
#> 1188  53    technician  married      no    2242      no   no  cellular  10
#> 1189  29        admin.   single      no     345     yes  yes  cellular  30
#> 1190  52    technician  married      no     668     yes   no  cellular  31
#> 1191  39    management  married      no     151     yes   no   unknown  21
#> 1192  45    management  married      no    2897      no   no  cellular   2
#> 1193  41    technician   single      no    5365     yes   no  cellular   7
#> 1194  39    management  married      no     763     yes   no  cellular  11
#> 1195  27       student   single      no     672      no   no  cellular  18
#> 1196  37    management  married      no    3723      no   no  cellular  22
#> 1197  46   blue-collar  married      no      -3     yes   no  cellular  29
#> 1198  40      services  married      no    3164     yes   no  cellular   3
#> 1199  57    management divorced      no     429     yes   no  cellular  17
#> 1200  26   blue-collar   single      no     474     yes   no  cellular  15
#> 1201  28      services   single      no     341     yes   no  cellular  15
#> 1202  34   blue-collar  married      no     800      no   no  cellular   5
#> 1203  29        admin.   single      no     788     yes   no  cellular  18
#> 1204  35   blue-collar  married      no    2708     yes   no   unknown  30
#> 1205  59   blue-collar  married      no     202     yes   no   unknown   7
#> 1206  54   blue-collar   single      no    1555     yes   no telephone  30
#> 1207  32    management  married      no     905      no   no  cellular  12
#> 1208  57       retired  married      no    5313      no   no  cellular  16
#> 1209  39    unemployed   single      no    -114     yes   no  cellular   3
#> 1210  41        admin.   single      no    5219     yes   no  cellular  17
#> 1211  31    management   single      no     357     yes   no   unknown  23
#> 1212  37    unemployed  married      no      86      no   no  cellular  29
#> 1213  52        admin.  married      no    3703     yes   no  cellular  23
#> 1214  39    management   single      no     416      no   no  cellular   9
#> 1215  23        admin.   single      no       0     yes   no  cellular  17
#> 1216  46    management divorced      no     507     yes   no  cellular   1
#> 1217  34        admin.   single      no     458     yes   no   unknown  20
#> 1218  31   blue-collar divorced      no    -209     yes   no  cellular   8
#> 1219  38    technician  married      no    2000     yes   no  cellular   7
#> 1220  28    management  married      no      82     yes  yes   unknown  16
#> 1221  41        admin.   single      no     882     yes  yes   unknown  28
#> 1222  30   blue-collar  married      no     -71     yes   no  cellular   6
#> 1223  34    management   single      no    1494     yes   no  cellular  18
#> 1224  56        admin. divorced      no     985      no  yes  cellular  18
#> 1225  32     housemaid  married      no       7      no  yes   unknown  27
#> 1226  39        admin.  married      no     260     yes   no  cellular  17
#> 1227  26   blue-collar   single      no      52     yes   no  cellular  20
#> 1228  35   blue-collar divorced      no    3547     yes   no  cellular  19
#> 1229  30      services   single      no    3485      no   no  cellular   2
#> 1230  44   blue-collar  married      no     701      no  yes  cellular  21
#> 1231  57       retired  married      no      70     yes  yes   unknown  16
#> 1232  52    management  married      no    1392      no   no  cellular  28
#> 1233  30    management  married      no     151      no   no  cellular  21
#> 1234  41   blue-collar  married      no     946     yes   no   unknown   6
#> 1235  61    management  married      no    1471      no   no  cellular  12
#> 1236  52    management  married      no    1545      no   no   unknown  20
#> 1237  60        admin. divorced      no     791     yes   no   unknown  13
#> 1238  50    management  married      no    2130      no   no  cellular  20
#> 1239  45   blue-collar  married      no     900     yes   no   unknown   9
#> 1240  51    management  married      no    1612     yes   no  cellular  18
#> 1241  38    management  married      no    5432     yes  yes  cellular  17
#> 1242  47   blue-collar  married      no    1092      no  yes   unknown  30
#> 1243  43    management  married      no    1050     yes  yes  cellular  18
#> 1244  36    technician  married      no      -8     yes   no   unknown  26
#> 1245  54   blue-collar  married      no     781     yes   no   unknown   9
#> 1246  38       unknown   single      no       0      no   no  cellular  11
#> 1247  56    technician  married      no     203     yes   no  cellular   5
#> 1248  31    technician   single      no     102     yes   no telephone  17
#> 1249  33    management   single      no       0      no   no  cellular  20
#> 1250  57    unemployed  married      no     381      no   no  cellular  29
#> 1251  44    management  married      no    -600     yes   no  cellular  18
#> 1252  32    management   single      no       0     yes   no  cellular  30
#> 1253  35    technician  married      no     944      no   no  cellular   8
#> 1254  49      services  married      no     725      no  yes   unknown  14
#> 1255  23    management   single      no    2143      no   no  cellular  30
#> 1256  49        admin.  married      no     255     yes   no  cellular  30
#> 1257  53   blue-collar  married      no      70     yes   no   unknown   5
#> 1258  34  entrepreneur  married      no    -506      no   no  cellular  29
#> 1259  57   blue-collar  married      no    3109      no   no  cellular   2
#> 1260  37      services  married      no      78     yes   no   unknown   7
#> 1261  27        admin.  married      no     941     yes   no  cellular  11
#> 1262  40      services  married      no      33      no   no   unknown  26
#> 1263  38    management  married      no       0     yes   no  cellular  30
#> 1264  40   blue-collar  married      no     105     yes   no  cellular  14
#> 1265  28   blue-collar   single      no      56     yes   no   unknown  23
#> 1266  36 self-employed  married      no    1006     yes   no  cellular  21
#> 1267  39   blue-collar  married      no    2366     yes   no  cellular  16
#> 1268  40    technician   single      no    1646     yes   no  cellular   4
#> 1269  34   blue-collar divorced      no     368      no  yes  cellular   7
#> 1270  29       student   single      no     652     yes   no  cellular  22
#> 1271  43        admin.   single      no    -247     yes  yes  cellular   2
#> 1272  35   blue-collar  married      no       0     yes  yes   unknown  29
#> 1273  37    management  married      no    3794      no   no  cellular  18
#> 1274  31        admin.  married      no      62      no   no  cellular  17
#> 1275  41    management   single      no    1286     yes   no telephone  17
#> 1276  36    management  married      no    2309     yes   no  cellular   8
#> 1277  33   blue-collar  married      no     249     yes   no  cellular  31
#> 1278  30    management   single      no   19358      no   no  cellular  19
#> 1279  52   blue-collar  married      no     289     yes   no   unknown  21
#> 1280  40    management  married      no       0     yes  yes  cellular  24
#> 1281  38      services  married      no      53      no   no  cellular   4
#> 1282  60       retired  married      no    2868      no   no   unknown  20
#> 1283  32 self-employed  married      no     514     yes   no  cellular  11
#> 1284  44    technician  married      no     135     yes   no  cellular   8
#> 1285  31 self-employed  married      no      94      no   no  cellular  22
#> 1286  29    unemployed   single      no     550      no   no  cellular  29
#> 1287  37    management  married      no    5205     yes   no   unknown  23
#> 1288  33    technician  married      no    2362     yes   no  cellular  26
#> 1289  34    technician   single      no    1313      no   no  cellular  22
#> 1290  30    management  married      no    8623      no   no  cellular   8
#> 1291  47      services  married      no     543     yes   no   unknown  15
#> 1292  41    management divorced      no      47     yes   no   unknown   8
#> 1293  58    management  married      no    3658      no   no  cellular   4
#> 1294  42 self-employed  married      no     596     yes   no   unknown  19
#> 1295  46   blue-collar  married      no     174     yes  yes   unknown   8
#> 1296  29    management   single      no     345      no   no  cellular  16
#> 1297  32    technician   single      no     723      no   no  cellular  28
#> 1298  24        admin.   single      no     507     yes   no   unknown  13
#> 1299  28        admin.  married      no     576     yes  yes  cellular  18
#> 1300  36    technician divorced      no     515     yes  yes  cellular   8
#> 1301  32      services   single      no     406     yes   no   unknown   6
#> 1302  40   blue-collar   single      no     322     yes   no  cellular   7
#> 1303  48    technician  married      no    2688      no  yes  cellular  26
#> 1304  52    management  married      no     193      no   no  cellular  30
#> 1305  39    technician divorced      no     394     yes   no   unknown  29
#> 1306  32      services   single      no     101     yes   no  cellular  11
#> 1307  42 self-employed  married      no    6383      no   no  cellular  27
#> 1308  27      services   single      no    1636     yes   no   unknown  28
#> 1309  60    management divorced      no       0      no   no  cellular   5
#> 1310  24    unemployed  married      no       6      no   no   unknown  17
#> 1311  57      services  married      no     668     yes  yes telephone  18
#> 1312  39 self-employed  married      no    1492     yes   no  cellular  25
#> 1313  30      services   single      no     438     yes   no  cellular  18
#> 1314  50    technician  married      no    2313      no   no  cellular   5
#> 1315  49    management  married      no       1      no   no telephone   4
#> 1316  54   blue-collar  married      no    1223     yes   no  cellular   7
#> 1317  49  entrepreneur  married      no     388     yes   no   unknown  16
#> 1318  42      services  married      no     120     yes   no  cellular  17
#> 1319  42      services  married      no     473     yes   no  cellular  30
#> 1320  35   blue-collar  married      no      26     yes   no   unknown   2
#> 1321  49        admin.  married      no    -962     yes   no  cellular  19
#> 1322  42   blue-collar   single      no     382     yes   no  cellular  13
#> 1323  29       student   single      no    2929      no   no  cellular   5
#> 1324  42    management divorced      no     764      no  yes  cellular  21
#> 1325  35 self-employed   single      no       0     yes  yes  cellular  18
#> 1326  52      services  married      no    2257     yes   no   unknown  14
#> 1327  48       retired  married     yes    -285      no  yes  cellular  19
#> 1328  42      services  married      no     199      no   no  cellular  30
#> 1329  51       unknown   single      no       0      no   no   unknown   5
#> 1330  48   blue-collar   single      no     574      no   no  cellular  12
#> 1331  31    technician   single      no     538     yes   no  cellular  17
#> 1332  33   blue-collar divorced      no     176     yes   no   unknown  12
#> 1333  62  entrepreneur  married      no    3904      no   no telephone  29
#> 1334  29   blue-collar  married      no       1     yes   no   unknown   6
#> 1335  28   blue-collar   single      no     431     yes   no  cellular  13
#> 1336  37    management  married      no     789     yes  yes  cellular  11
#> 1337  34    technician  married      no       1      no  yes   unknown  25
#> 1338  42       retired  married      no     127      no  yes  cellular  17
#> 1339  32    technician   single      no     502     yes   no telephone  20
#> 1340  42    technician  married      no     849      no   no  cellular  13
#> 1341  30   blue-collar  married      no    1780     yes   no   unknown  28
#> 1342  31   blue-collar  married      no     822     yes   no   unknown  13
#> 1343  45   blue-collar  married      no     146     yes  yes   unknown   5
#> 1344  54    management  married      no      11      no   no   unknown  14
#> 1345  38        admin.  married      no    3632     yes  yes  cellular  13
#> 1346  36      services  married      no       0      no   no   unknown  29
#> 1347  28        admin.   single      no     230      no   no  cellular  25
#> 1348  49    technician  married      no      15      no   no   unknown   6
#> 1349  34      services   single      no    3080      no   no  cellular  29
#> 1350  52  entrepreneur divorced      no     302      no   no   unknown  19
#> 1351  39   blue-collar  married      no       0     yes   no   unknown  26
#> 1352  39    management  married      no     197     yes   no  cellular  15
#> 1353  71       retired   single      no    1285      no   no telephone  27
#> 1354  48   blue-collar  married      no    1143     yes   no  cellular  17
#> 1355  27    management   single      no     406      no   no  cellular   9
#> 1356  66 self-employed  married      no     147      no   no telephone  12
#> 1357  36    management divorced      no      59      no   no  cellular  13
#> 1358  49 self-employed  married      no      99     yes  yes  cellular  31
#> 1359  51   blue-collar  married      no     814     yes   no  cellular  14
#> 1360  46 self-employed  married      no     -80     yes   no   unknown  12
#> 1361  54   blue-collar  married      no     175     yes   no  cellular   3
#> 1362  57  entrepreneur divorced      no     873      no   no   unknown  17
#> 1363  56 self-employed  married      no     350      no   no  cellular   3
#> 1364  39   blue-collar  married      no    2805     yes   no   unknown  26
#> 1365  61     housemaid  married      no     368      no   no  cellular   8
#> 1366  50   blue-collar  married      no    1329     yes  yes telephone   4
#> 1367  53   blue-collar divorced      no     235      no   no  cellular  30
#> 1368  30   blue-collar  married      no    -166     yes  yes   unknown  13
#> 1369  49     housemaid  married      no     360      no   no   unknown  30
#> 1370  44      services  married      no   29312      no   no   unknown  13
#> 1371  24   blue-collar   single      no    1857     yes   no  cellular   8
#> 1372  30        admin.   single      no     110      no   no  cellular  28
#> 1373  34   blue-collar  married      no     187     yes   no   unknown  12
#> 1374  33      services  married      no      28      no   no  cellular  29
#> 1375  27   blue-collar   single      no     100     yes   no  cellular  11
#> 1376  42   blue-collar divorced      no      28     yes   no  cellular   8
#> 1377  45    unemployed   single      no     382     yes  yes  cellular  18
#> 1378  34        admin.  married      no    1183     yes   no  cellular  20
#> 1379  36  entrepreneur  married      no     229     yes   no  cellular  28
#> 1380  51    management  married      no     346      no   no  cellular  11
#> 1381  27    management   single      no     102      no   no   unknown  26
#> 1382  45    management  married      no    5888     yes   no   unknown  26
#> 1383  34   blue-collar  married      no    3990     yes   no  cellular  24
#> 1384  38    management  married      no    7124      no   no   unknown  16
#> 1385  53    technician divorced      no     447     yes  yes  cellular  11
#> 1386  59       retired divorced      no     914      no   no  cellular  28
#> 1387  36   blue-collar  married      no     801     yes  yes  cellular  18
#> 1388  33        admin.   single      no     572     yes   no  cellular  14
#> 1389  33        admin.   single      no    -371     yes  yes  cellular  18
#> 1390  37        admin. divorced      no    -165     yes   no   unknown   3
#> 1391  34    technician   single      no     649      no   no  cellular   7
#> 1392  35   blue-collar   single      no       0     yes   no  cellular   8
#> 1393  27      services  married      no     199      no   no  cellular   4
#> 1394  57    unemployed  married      no    7357      no   no  cellular   5
#> 1395  33    technician  married      no      48      no   no  cellular  27
#> 1396  53       retired  married      no    2269      no   no  cellular  17
#> 1397  36   blue-collar   single      no     103     yes   no  cellular  15
#> 1398  52    management  married      no    1065     yes  yes   unknown  30
#> 1399  31   blue-collar  married      no      99     yes   no  cellular  17
#> 1400  30    management   single      no      61     yes   no telephone   5
#> 1401  60    management  married      no      79      no   no   unknown  11
#> 1402  40      services  married      no    1116     yes   no  cellular  12
#> 1403  53    technician  married      no       0      no   no  cellular  22
#> 1404  30        admin.   single      no    1018     yes   no  cellular  29
#> 1405  26    technician  married      no      47     yes   no   unknown   9
#> 1406  30    management   single      no    2995     yes   no  cellular  18
#> 1407  24       student   single      no     486      no   no  cellular  26
#> 1408  34    management   single      no     127      no   no  cellular  27
#> 1409  41        admin.  married      no    4178      no   no   unknown  20
#> 1410  31   blue-collar  married      no     360     yes   no   unknown  23
#> 1411  39   blue-collar  married      no    1386     yes  yes   unknown   4
#> 1412  40 self-employed  married      no    1498      no   no  cellular   4
#> 1413  39        admin. divorced      no     458      no   no  cellular  21
#> 1414  41    technician divorced      no     258      no   no  cellular  13
#> 1415  35    management  married      no    2123     yes   no  cellular  21
#> 1416  34    management  married      no      11     yes   no  cellular  18
#> 1417  29        admin.  married      no   22171     yes   no  cellular  18
#> 1418  58    management  married      no    2729      no   no   unknown  18
#> 1419  36    management  married      no      86     yes   no  cellular   3
#> 1420  40      services  married      no     771     yes   no  cellular  15
#> 1421  35      services  married      no     586     yes  yes  cellular  17
#> 1422  34    management  married      no      53     yes  yes  cellular  29
#> 1423  45  entrepreneur divorced      no       0     yes   no   unknown  13
#> 1424  34   blue-collar  married      no    2137      no   no   unknown   9
#> 1425  33        admin.   single      no    1221     yes   no   unknown  23
#> 1426  48   blue-collar  married      no     729     yes   no telephone  15
#> 1427  34   blue-collar  married      no     -78     yes   no   unknown   9
#> 1428  35    technician   single      no     103     yes   no   unknown  26
#> 1429  35   blue-collar  married      no       0     yes   no   unknown   6
#> 1430  39   blue-collar  married      no     521      no  yes  cellular  10
#> 1431  27    management   single      no    2489      no   no  cellular  15
#> 1432  36  entrepreneur  married      no     177     yes   no   unknown  12
#> 1433  38   blue-collar  married      no    1731     yes  yes  cellular  14
#> 1434  51        admin.  married      no     227      no   no  cellular   5
#> 1435  35    technician  married      no     128      no  yes  cellular  29
#> 1436  37   blue-collar   single      no    1222      no   no   unknown  27
#> 1437  59    technician  married      no    4263      no  yes  cellular  20
#> 1438  38    technician  married      no    1004     yes   no  cellular  16
#> 1439  46   blue-collar  married      no     942      no   no  cellular  18
#> 1440  73       retired  married      no    3443      no   no telephone   4
#> 1441  24    technician  married      no     691     yes   no   unknown  19
#> 1442  51    technician  married      no     180     yes   no  cellular  20
#> 1443  50    management  married      no     830      no   no   unknown   2
#> 1444  39    technician  married      no     130      no   no  cellular   8
#> 1445  52   blue-collar  married      no      33      no  yes  cellular  13
#> 1446  46    technician  married      no     179      no  yes   unknown  18
#> 1447  34      services   single      no     194     yes  yes  cellular  15
#> 1448  36    management   single      no       0     yes  yes  cellular   7
#> 1449  46   blue-collar  married      no     624     yes   no  cellular  16
#> 1450  32   blue-collar   single      no    3662      no   no telephone  28
#> 1451  62   blue-collar  married      no     272      no   no  cellular  11
#> 1452  36    management  married      no     190     yes   no  cellular   5
#> 1453  51 self-employed  married      no     126     yes   no  cellular  10
#> 1454  31  entrepreneur divorced      no    1767      no   no telephone  25
#> 1455  45    technician  married      no    1003     yes   no   unknown   4
#> 1456  43    technician  married      no    -330     yes  yes  cellular   8
#> 1457  49   blue-collar  married      no     457     yes  yes   unknown  28
#> 1458  60       retired  married      no    3461      no   no  cellular   3
#> 1459  50    technician  married      no    1518      no  yes  cellular  31
#> 1460  30      services  married      no      33      no   no  cellular  18
#> 1461  46   blue-collar  married      no     310     yes   no  cellular  24
#> 1462  44    management  married      no     -68      no  yes  cellular  25
#> 1463  45    technician  married      no    2776     yes   no  cellular  27
#> 1464  46   blue-collar  married      no     243     yes   no   unknown   3
#> 1465  42       unknown   single     yes      61      no   no   unknown  20
#> 1466  43   blue-collar   single      no       0      no   no   unknown   9
#> 1467  46    management divorced      no       3     yes  yes  cellular   5
#> 1468  33   blue-collar  married      no     983      no   no   unknown   8
#> 1469  32        admin.   single      no     739     yes   no  cellular  20
#> 1470  50   blue-collar  married      no     280     yes   no   unknown  18
#> 1471  46      services  married      no     311     yes  yes  cellular  15
#> 1472  28     housemaid  married      no       5      no   no  cellular  28
#> 1473  38   blue-collar divorced      no    1686     yes   no   unknown  19
#> 1474  44   blue-collar   single      no     712     yes  yes  cellular   6
#> 1475  24        admin.   single      no     845     yes   no   unknown  13
#> 1476  28       student   single      no     949     yes   no   unknown  28
#> 1477  29   blue-collar   single      no    3508     yes   no  cellular  17
#> 1478  46    technician divorced      no     119     yes   no   unknown  27
#> 1479  77       retired  married      no       0      no   no  cellular  27
#> 1480  37    technician   single      no     876     yes   no   unknown  23
#> 1481  52   blue-collar   single      no     210     yes   no   unknown  12
#> 1482  48    management divorced      no    5978      no   no  cellular  28
#> 1483  43      services  married      no    2478     yes   no   unknown  12
#> 1484  57        admin.  married      no     407     yes  yes  cellular  15
#> 1485  34      services  married      no    -211     yes   no   unknown   4
#> 1486  37    technician   single      no     181      no   no  cellular   5
#> 1487  50   blue-collar  married      no     562     yes   no  cellular   8
#> 1488  34    management  married      no     105     yes   no   unknown   6
#> 1489  48   blue-collar  married      no     341     yes  yes   unknown  26
#> 1490  28      services   single      no    2992     yes   no  cellular  30
#> 1491  31        admin.   single      no    1016     yes   no   unknown  20
#> 1492  35   blue-collar  married      no    5639     yes   no  cellular  20
#> 1493  46    management  married      no      48      no   no   unknown  13
#> 1494  33    management  married      no       0     yes   no   unknown   6
#> 1495  56    technician  married      no     675     yes   no   unknown  29
#> 1496  60       retired divorced      no    1582      no  yes   unknown  18
#> 1497  52   blue-collar  married      no    1141     yes   no  cellular  12
#> 1498  43    technician   single      no    4990     yes   no  cellular  22
#> 1499  29        admin.   single      no     454      no   no telephone  16
#> 1500  27        admin.  married      no      73     yes   no  cellular   5
#> 1501  50   blue-collar  married      no     253     yes  yes  cellular   5
#> 1502  46  entrepreneur  married      no     583     yes   no   unknown  20
#> 1503  49        admin.  married      no    5361      no   no  cellular   7
#> 1504  27        admin.  married      no     639      no  yes  cellular  14
#> 1505  37   blue-collar  married      no     398     yes   no   unknown  19
#> 1506  37   blue-collar  married      no    1222     yes   no  cellular   6
#> 1507  35    technician  married      no     518     yes   no  cellular  30
#> 1508  29   blue-collar   single      no     992     yes  yes   unknown  28
#> 1509  30    management  married      no       0      no   no  cellular   7
#> 1510  58      services  married      no     307      no   no telephone  25
#> 1511  33     housemaid  married      no    2054      no   no  cellular  25
#> 1512  33    technician  married      no     105     yes  yes   unknown  20
#> 1513  39    management  married      no    3518     yes   no  cellular   8
#> 1514  26        admin.  married      no     233     yes   no  cellular  21
#> 1515  54    management  married      no    2216     yes   no  cellular  13
#> 1516  60    technician  married      no    -247     yes   no telephone  12
#> 1517  40   blue-collar  married      no    1386     yes  yes  cellular  20
#> 1518  42    technician  married      no     422     yes   no  cellular  16
#> 1519  58    management  married      no    1602      no   no  cellular  21
#> 1520  56    technician  married      no    1750      no   no  cellular  19
#> 1521  45   blue-collar   single      no     695     yes   no  cellular  21
#> 1522  61        admin.  married      no    1541      no   no  cellular  20
#> 1523  36       unknown   single      no    1070      no   no   unknown   5
#> 1524  34    management divorced      no    1173      no  yes  cellular  18
#> 1525  33        admin.   single      no   21854     yes   no  cellular  20
#> 1526  42    technician  married      no      33      no   no telephone  22
#> 1527  35  entrepreneur  married      no    -394     yes   no  cellular  20
#> 1528  57    management  married      no    6900      no   no  cellular  23
#> 1529  39    management  married      no       0     yes  yes  cellular  17
#> 1530  49   blue-collar  married      no     783     yes   no   unknown  12
#> 1531  27   blue-collar  married      no     409     yes   no  cellular  18
#> 1532  34        admin.   single      no    1880     yes   no   unknown  23
#> 1533  30    management   single      no    -383     yes   no  cellular  18
#> 1534  36   blue-collar   single      no    1598     yes   no  cellular   5
#> 1535  51  entrepreneur  married      no     538      no   no  cellular  18
#> 1536  35    technician   single      no    2288      no   no telephone  28
#> 1537  30    technician   single      no    1289     yes   no   unknown  21
#> 1538  38    management  married      no     484     yes   no  cellular   8
#> 1539  43   blue-collar   single      no       2     yes   no  cellular  30
#> 1540  55      services divorced      no     935      no   no  cellular  14
#> 1541  37   blue-collar  married      no    3370     yes   no  cellular  20
#> 1542  32    technician  married      no     587     yes   no   unknown  23
#> 1543  36   blue-collar  married      no       0     yes   no  cellular  30
#> 1544  31      services  married      no     447      no   no  cellular  19
#> 1545  27      services  married      no       8     yes   no   unknown   6
#> 1546  30      services  married      no    -932      no   no   unknown  27
#> 1547  32   blue-collar  married      no     400      no   no  cellular  20
#> 1548  44   blue-collar  married      no    -237     yes   no telephone  10
#> 1549  50    management  married      no    1854     yes  yes   unknown   3
#> 1550  24        admin.   single      no     454     yes   no  cellular  15
#> 1551  41    technician divorced      no    3465     yes   no  cellular  11
#> 1552  43   blue-collar  married      no     547      no  yes   unknown   9
#> 1553  23        admin.   single      no     897     yes   no  cellular   8
#> 1554  35    management  married      no       0     yes   no  cellular  20
#> 1555  56   blue-collar  married      no     397     yes   no  cellular  13
#> 1556  39   blue-collar  married      no    7653      no   no   unknown  11
#> 1557  44    management  married      no     392     yes   no   unknown   9
#> 1558  37      services  married      no       0     yes   no  cellular  12
#> 1559  33  entrepreneur divorced      no     596      no  yes  cellular   5
#> 1560  21       student   single      no     423      no   no telephone  18
#> 1561  30    management   single      no    2317     yes   no   unknown  26
#> 1562  38   blue-collar divorced      no     595     yes   no  cellular   7
#> 1563  35   blue-collar  married      no     994     yes   no   unknown  23
#> 1564  51   blue-collar divorced      no     104      no   no  cellular   9
#> 1565  35    management  married      no    3168      no   no  cellular  22
#> 1566  38      services  married      no    4644     yes   no telephone  18
#> 1567  27    management   single      no       3     yes  yes  cellular  22
#> 1568  58   blue-collar  married      no    3109      no   no  cellular  29
#> 1569  47    technician  married      no    1280      no   no  cellular   8
#> 1570  54       retired  married      no       0     yes   no   unknown  13
#> 1571  34    management   single      no    1049     yes   no  cellular  11
#> 1572  42     housemaid   single      no    5774     yes   no   unknown  15
#> 1573  29    management   single      no    1026      no   no  cellular  12
#> 1574  35 self-employed  married      no    1820     yes  yes  cellular  29
#> 1575  52      services  married      no     911      no   no   unknown  20
#> 1576  38 self-employed  married      no    -165     yes   no   unknown  21
#> 1577  47    technician  married      no    2106     yes   no   unknown   6
#> 1578  34    unemployed  married      no     309      no   no  cellular   5
#> 1579  41   blue-collar  married      no       0     yes   no  cellular   3
#> 1580  44    management  married      no     368      no   no  cellular   9
#> 1581  28      services   single      no      45     yes   no   unknown  16
#> 1582  54      services divorced      no       0     yes   no  cellular  16
#> 1583  49   blue-collar  married      no   11317     yes   no   unknown  14
#> 1584  53    technician  married      no    4930      no  yes  cellular   2
#> 1585  43    management  married      no      79      no   no  cellular  26
#> 1586  57    unemployed divorced      no    1088      no   no  cellular  29
#> 1587  55      services  married      no    -747     yes   no  cellular  15
#> 1588  36    unemployed   single      no     605      no   no  cellular  30
#> 1589  50       retired  married      no      14      no  yes telephone  23
#> 1590  46   blue-collar  married      no     596     yes   no   unknown   3
#> 1591  55      services  married      no    1695     yes   no   unknown   3
#> 1592  37   blue-collar  married      no    1114     yes  yes  cellular   6
#> 1593  31  entrepreneur  married      no     312      no   no  cellular  29
#> 1594  54    technician   single      no    3233      no   no   unknown  20
#> 1595  36   blue-collar  married      no    1993     yes  yes  cellular  13
#> 1596  40  entrepreneur  married      no       0     yes  yes   unknown  15
#> 1597  32   blue-collar   single      no      33     yes   no  cellular  18
#> 1598  56    management  married      no      31     yes   no  cellular  12
#> 1599  39    technician   single      no    1043      no   no  cellular  18
#> 1600  45 self-employed  married      no    2278      no   no   unknown  17
#> 1601  42    technician  married      no     738      no   no   unknown  20
#> 1602  37 self-employed divorced      no    1513      no   no   unknown  30
#> 1603  40    technician   single      no      57      no  yes  cellular   6
#> 1604  31    management   single      no      59     yes  yes  cellular   6
#> 1605  30      services   single      no     399     yes  yes   unknown  23
#> 1606  44    management  married      no      27     yes   no   unknown  29
#> 1607  49   blue-collar  married      no    1387     yes  yes   unknown   9
#> 1608  59    management  married      no    5956      no   no  cellular   3
#> 1609  31    management   single      no     291     yes   no  cellular  15
#> 1610  32    management   single      no    2223      no   no   unknown   9
#> 1611  46   blue-collar  married      no     874      no   no  cellular   6
#> 1612  40      services  married      no    5248     yes  yes  cellular  20
#> 1613  50    management  married      no       4      no   no  cellular  17
#> 1614  52    management  married      no    1177     yes   no   unknown  29
#> 1615  31    technician  married      no    4089      no   no  cellular  12
#> 1616  31        admin.  married      no      23      no   no  cellular  28
#> 1617  34    management  married      no    1778      no   no  cellular   5
#> 1618  34    technician  married      no     260     yes   no  cellular  17
#> 1619  53    management  married      no       0     yes   no  cellular   9
#> 1620  35    management   single      no     578     yes   no  cellular  19
#> 1621  35        admin.  married      no     100     yes   no  cellular  14
#> 1622  32   blue-collar divorced      no    -156     yes   no  cellular  24
#> 1623  39   blue-collar  married      no     660     yes  yes  cellular  20
#> 1624  51   blue-collar divorced      no     113      no   no  cellular  15
#> 1625  61       retired divorced      no    4243      no   no  cellular  30
#> 1626  33    management  married      no     296      no   no  cellular  13
#> 1627  25    technician   single      no    1135     yes   no   unknown  12
#> 1628  26      services  married      no     104      no   no   unknown  14
#> 1629  32        admin.   single      no     184     yes   no   unknown   8
#> 1630  27      services divorced      no     397      no  yes  cellular  30
#> 1631  32    management  married      no   14611     yes   no  cellular  17
#> 1632  52    technician  married      no     945      no   no   unknown  20
#> 1633  60       retired  married      no      78      no  yes   unknown  27
#> 1634  34    technician  married      no    1524     yes   no  cellular  16
#> 1635  37   blue-collar divorced      no      48     yes   no   unknown   8
#> 1636  19       student   single      no      60      no   no  cellular  14
#> 1637  48    management  married      no    1744      no   no   unknown   9
#> 1638  48      services divorced      no    -203     yes   no  cellular  18
#> 1639  32   blue-collar divorced      no    -289     yes  yes  cellular  21
#> 1640  36    management  married      no    -267      no   no  cellular  21
#> 1641  47       unknown  married      no       0      no   no   unknown   6
#> 1642  30   blue-collar   single      no     953     yes   no   unknown   2
#> 1643  45    technician divorced      no     299     yes   no  cellular  28
#> 1644  49   blue-collar  married      no       0      no  yes  cellular   9
#> 1645  48   blue-collar  married      no     104      no   no  cellular   8
#> 1646  25    technician   single      no      31      no   no  cellular   2
#> 1647  54   blue-collar divorced      no    2656     yes   no  cellular  15
#> 1648  47   blue-collar  married      no    2642      no   no  cellular  13
#> 1649  49    technician divorced      no     790     yes   no  cellular   7
#> 1650  28    technician  married      no    1198      no  yes  cellular  10
#> 1651  32   blue-collar   single      no    2696     yes   no  cellular  20
#> 1652  49    management divorced      no    1253     yes   no  cellular  14
#> 1653  55    management  married      no     979      no  yes  cellular   8
#> 1654  45        admin.  married      no       0      no   no  cellular  19
#> 1655  34    unemployed  married      no     428     yes   no  cellular   7
#> 1656  40    management  married      no    8963      no   no  cellular   3
#> 1657  35    technician  married      no       2      no   no telephone  28
#> 1658  31    technician   single      no    1710     yes   no   unknown  23
#> 1659  28      services   single      no     117     yes   no  cellular  11
#> 1660  48    technician  married      no       0     yes   no  cellular  21
#> 1661  52    management  married      no       0      no   no   unknown   5
#> 1662  39     housemaid   single      no    1340      no   no   unknown  18
#> 1663  36   blue-collar  married      no     345     yes   no  cellular  20
#> 1664  29      services  married      no     -62     yes  yes  cellular  25
#> 1665  34        admin.  married      no     920      no   no  cellular  14
#> 1666  43    technician   single      no     572      no   no  cellular  17
#> 1667  38    technician  married      no       0     yes   no  cellular   4
#> 1668  36    management divorced      no    -978     yes   no  cellular  13
#> 1669  44   blue-collar  married      no    2185     yes   no   unknown  16
#> 1670  56       retired divorced      no    1005      no  yes  cellular  30
#> 1671  57 self-employed   single      no    3277      no   no   unknown   5
#> 1672  40    technician   single      no     191     yes   no  cellular  18
#> 1673  23        admin.   single      no    4681     yes   no   unknown  28
#> 1674  36    technician  married      no    -456     yes   no  cellular  11
#> 1675  47        admin.   single      no     303     yes  yes  cellular  28
#> 1676  48    management   single      no     399      no  yes  cellular   7
#> 1677  28    technician   single      no    2000      no   no telephone   3
#> 1678  32    management   single      no       0      no   no  cellular  29
#> 1679  44    technician  married      no     945     yes   no  cellular   4
#> 1680  52     housemaid divorced      no    4306      no   no  cellular  22
#> 1681  44 self-employed  married      no     706      no   no   unknown   5
#> 1682  45    unemployed  married      no    -407     yes   no  cellular  15
#> 1683  48   blue-collar  married      no     865     yes   no  cellular  13
#> 1684  28  entrepreneur  married      no     490     yes   no  cellular  17
#> 1685  29    management  married      no      20     yes   no  cellular  12
#> 1686  27    management   single      no     170      no   no  cellular  29
#> 1687  32    management   single      no    1088     yes   no  cellular   6
#> 1688  35   blue-collar   single      no    -759     yes   no  cellular  31
#> 1689  38  entrepreneur  married      no     898     yes   no  cellular  20
#> 1690  32    technician divorced      no     210     yes  yes   unknown   7
#> 1691  31      services  married      no    -489     yes  yes  cellular  19
#> 1692  41        admin.   single      no       0     yes  yes  cellular   7
#> 1693  34    technician  married      no       1      no   no  cellular  22
#> 1694  54        admin.  married      no    3965     yes   no   unknown  15
#> 1695  30    management  married      no     805      no   no  cellular  10
#> 1696  26       student   single      no    1164      no   no  cellular   9
#> 1697  39   blue-collar  married      no     481      no   no  cellular   4
#> 1698  29      services  married      no    1432      no   no  cellular  22
#> 1699  31      services divorced      no    1016     yes   no  cellular   6
#> 1700  33   blue-collar  married      no     596     yes   no  cellular  18
#> 1701  34   blue-collar  married      no     123     yes   no  cellular   8
#> 1702  41    unemployed  married      no    1666      no   no   unknown   9
#> 1703  28    technician   single      no     205     yes   no   unknown  12
#> 1704  35   blue-collar   single      no    -276     yes   no  cellular  13
#> 1705  35   blue-collar   single      no    1253      no   no   unknown  29
#> 1706  29    technician   single      no   22008     yes   no   unknown  28
#> 1707  30    management  married      no       0     yes   no  cellular   9
#> 1708  50   blue-collar  married      no    2590     yes   no telephone  20
#> 1709  57     housemaid divorced      no    3767      no   no  cellular   2
#> 1710  41   blue-collar  married      no     -56     yes   no  cellular  13
#> 1711  32     housemaid  married      no     344     yes   no   unknown   9
#> 1712  54      services  married      no    1059      no   no  cellular   7
#> 1713  25    management   single      no     667      no   no  cellular  29
#> 1714  42    management  married      no    2580     yes   no   unknown  16
#> 1715  36   blue-collar  married      no    -231      no  yes  cellular  15
#> 1716  41    technician  married      no     767     yes  yes   unknown   6
#> 1717  40    unemployed divorced      no    1694      no   no  cellular  12
#> 1718  41    technician  married      no     744     yes   no   unknown  14
#> 1719  40  entrepreneur  married      no    3676     yes  yes   unknown  15
#> 1720  27      services   single      no    9965     yes   no  cellular  22
#> 1721  54    management  married      no       0      no   no  cellular  14
#> 1722  29        admin.   single      no     422     yes   no  cellular   7
#> 1723  39   blue-collar  married      no     507     yes   no   unknown   8
#> 1724  33    technician   single      no    -325     yes   no  cellular  15
#> 1725  28      services   single      no     129     yes   no  cellular  18
#> 1726  36    technician divorced      no     566     yes   no   unknown  20
#> 1727  43   blue-collar  married      no     445     yes   no   unknown  15
#> 1728  50    management divorced      no       0      no   no  cellular  29
#> 1729  49    technician  married      no     808     yes   no  cellular  28
#> 1730  34    management  married      no     240     yes   no   unknown  23
#> 1731  33    technician divorced     yes      10     yes  yes  cellular  18
#> 1732  53    technician  married      no    4807      no   no telephone  19
#> 1733  43    unemployed  married      no     519      no   no   unknown  20
#> 1734  32    management   single      no     739     yes   no  cellular   2
#> 1735  56    management divorced      no      94      no   no   unknown   4
#> 1736  26    management   single      no     205      no   no   unknown  26
#> 1737  46   blue-collar  married      no     296     yes   no   unknown   4
#> 1738  45    technician  married      no    -149     yes   no  cellular  14
#> 1739  42   blue-collar   single      no     985      no   no  cellular  20
#> 1740  39    management   single      no     113     yes   no telephone  27
#> 1741  38    management   single      no    8669     yes   no telephone  20
#> 1742  35    technician  married      no    7050      no   no  cellular  11
#> 1743  53 self-employed  married      no       1     yes  yes   unknown  23
#> 1744  29    management  married      no     246     yes   no   unknown   9
#> 1745  36    technician   single      no    -206     yes   no  cellular  14
#> 1746  25      services   single      no    -107     yes   no  cellular  14
#> 1747  44    management divorced      no     193      no  yes  cellular   8
#> 1748  49    technician  married      no      25     yes  yes  cellular  19
#> 1749  30    technician   single      no    1286      no   no telephone  28
#> 1750  49   blue-collar divorced      no      24     yes   no  cellular  11
#> 1751  53 self-employed  married      no    4397     yes   no   unknown  12
#> 1752  28  entrepreneur  married      no    4064      no  yes  cellular  11
#> 1753  29    management   single      no     307     yes   no  cellular   2
#> 1754  28    technician   single      no     183     yes  yes   unknown  28
#> 1755  53    management  married      no     490     yes   no   unknown  28
#> 1756  35      services divorced      no     877     yes   no  cellular  15
#> 1757  32    management  married      no    -383     yes   no   unknown  27
#> 1758  26   blue-collar   single      no     123      no  yes  cellular   7
#> 1759  34    technician  married      no    4248     yes   no  cellular  20
#> 1760  43   blue-collar  married      no       3     yes   no telephone  13
#> 1761  32        admin.  married      no     277     yes   no   unknown   3
#> 1762  24       student   single      no    1925      no   no  cellular  11
#> 1763  50   blue-collar  married      no     -37     yes   no   unknown  12
#> 1764  53        admin.   single      no    1178     yes   no   unknown  15
#> 1765  51    management  married      no     873      no   no  cellular  29
#> 1766  30    technician   single      no      53      no   no  cellular  29
#> 1767  54    technician  married      no      25     yes   no telephone   2
#> 1768  35   blue-collar   single      no     109     yes   no   unknown   7
#> 1769  30    technician   single      no    2832      no   no  cellular  18
#> 1770  45      services  married      no     350     yes  yes   unknown  13
#> 1771  56       retired  married      no     393      no  yes  cellular  26
#> 1772  33    management  married      no    3713     yes   no  cellular  20
#> 1773  54      services  married      no     158     yes   no   unknown  19
#> 1774  39   blue-collar   single      no      10     yes   no telephone  15
#> 1775  29      services   single      no       0      no   no  cellular  17
#> 1776  49     housemaid divorced      no     164     yes   no   unknown   9
#> 1777  25       student   single      no     722     yes   no   unknown  19
#> 1778  40    technician   single      no    1175      no   no  cellular  14
#> 1779  52        admin.  married      no     190      no   no  cellular  27
#> 1780  35    technician  married     yes     -29     yes  yes   unknown  21
#> 1781  43   blue-collar  married      no     582     yes   no telephone  11
#> 1782  32   blue-collar  married      no     950     yes  yes  cellular  20
#> 1783  55    management  married      no    2537      no   no  cellular  19
#> 1784  34      services  married      no       0      no   no   unknown  27
#> 1785  60   blue-collar  married      no       0      no   no  cellular  21
#> 1786  57        admin.  married      no     567     yes   no  cellular   2
#> 1787  58   blue-collar  married      no    1075     yes   no  cellular  18
#> 1788  26   blue-collar   single      no     535     yes   no   unknown   9
#> 1789  59        admin.  married      no    1001      no   no   unknown   6
#> 1790  58      services  married      no     553      no  yes telephone  17
#> 1791  49    management  married      no    2187      no   no  cellular  25
#> 1792  37      services  married      no    3429     yes  yes  cellular   8
#> 1793  47    technician  married      no     179     yes   no  cellular  18
#> 1794  39      services divorced      no    -152     yes   no  cellular   3
#> 1795  58      services  married      no     818      no   no  cellular  22
#> 1796  30 self-employed  married      no     805     yes   no   unknown   1
#> 1797  44  entrepreneur  married      no    6649     yes   no  cellular  19
#> 1798  27   blue-collar  married      no     556     yes   no  cellular   9
#> 1799  42   blue-collar  married      no    1598     yes  yes  cellular  16
#> 1800  25    management  married      no     127     yes   no  cellular  18
#> 1801  32   blue-collar  married      no     113     yes  yes   unknown  20
#> 1802  55    technician  married      no       0     yes   no   unknown  30
#> 1803  55      services  married      no    2877      no   no  cellular   9
#> 1804  40      services   single      no     326     yes   no  cellular  18
#> 1805  35        admin. divorced      no      45     yes   no   unknown  29
#> 1806  25    unemployed  married      no     285     yes   no   unknown  29
#> 1807  36   blue-collar  married      no    -400     yes  yes  cellular   6
#> 1808  32    technician  married      no    6172     yes   no  cellular   4
#> 1809  49    technician  married      no    1982     yes  yes  cellular  22
#> 1810  56      services  married      no     219     yes   no   unknown   7
#> 1811  32    management  married      no    1388     yes   no  cellular  13
#> 1812  26 self-employed   single      no    3044     yes  yes  cellular  17
#> 1813  33        admin.  married      no       7     yes   no  cellular  20
#> 1814  37    technician  married      no     127     yes   no  cellular  25
#> 1815  45    technician  married      no    1412     yes   no  cellular  11
#> 1816  49     housemaid  married      no      78      no   no telephone  10
#> 1817  28        admin.   single      no    1104     yes   no  cellular  28
#> 1818  30   blue-collar   single      no     694     yes  yes  cellular  18
#> 1819  31    technician  married      no     585     yes   no telephone  11
#> 1820  54        admin. divorced      no       0      no   no  cellular  14
#> 1821  27   blue-collar  married      no      72     yes   no   unknown  19
#> 1822  34    technician  married      no      30      no   no  cellular  19
#> 1823  41 self-employed  married      no     305     yes   no  cellular  13
#> 1824  58    technician  married      no     589     yes   no  cellular  10
#> 1825  31   blue-collar   single      no    5972      no   no telephone  20
#> 1826  38    management divorced      no    -980     yes   no   unknown  20
#> 1827  30        admin.  married      no      35     yes  yes  cellular  21
#> 1828  36    technician  married      no     154     yes   no  cellular  18
#> 1829  51    technician  married      no    2506      no   no  cellular  30
#> 1830  53   blue-collar  married      no     208      no   no   unknown  20
#> 1831  27       student   single      no    3687      no   no  cellular   8
#> 1832  25   blue-collar  married      no     -23     yes   no  cellular  25
#> 1833  56    technician divorced      no    1593     yes   no  cellular  31
#> 1834  43        admin.  married      no     324      no   no  cellular   8
#> 1835  28      services   single      no     168     yes   no  cellular   7
#> 1836  53       retired divorced      no    -477      no   no  cellular  17
#> 1837  28 self-employed   single      no       0     yes   no  cellular  29
#> 1838  57    technician divorced      no     114      no   no  cellular  19
#> 1839  24       student   single      no     474      no   no  cellular  12
#> 1840  51   blue-collar  married      no      19      no   no  cellular  26
#> 1841  38      services  married      no     433      no   no   unknown  11
#> 1842  32      services   single      no     -23      no   no  cellular  10
#> 1843  51    management divorced      no     492      no  yes  cellular  29
#> 1844  45   blue-collar  married      no    -149     yes   no   unknown  15
#> 1845  33   blue-collar  married      no       0      no   no   unknown   7
#> 1846  51      services  married      no       0      no  yes   unknown  26
#> 1847  31    technician   single      no     845     yes   no  cellular  22
#> 1848  34 self-employed  married      no     191      no   no  cellular   8
#> 1849  42      services  married      no    3236      no   no   unknown  18
#> 1850  52      services divorced      no    -644      no   no  cellular  18
#> 1851  74       retired  married      no    1843      no   no  cellular  15
#> 1852  56       unknown  married      no   15088      no   no  cellular  11
#> 1853  43 self-employed  married      no   10072      no   no  cellular  12
#> 1854  44    technician  married      no       0     yes   no   unknown   5
#> 1855  41   blue-collar  married      no    3803     yes   no  cellular  20
#> 1856  38   blue-collar   single      no     745     yes   no   unknown  21
#> 1857  40    technician   single      no     693      no   no  cellular  30
#> 1858  42   blue-collar  married      no    2717     yes  yes  cellular  20
#> 1859  48       retired  married      no       4      no  yes  cellular  23
#> 1860  55   blue-collar  married      no     660      no   no   unknown   5
#> 1861  38   blue-collar   single      no      10     yes   no   unknown   3
#> 1862  37    management divorced      no    1775      no   no  cellular  15
#> 1863  42    unemployed  married     yes    -581     yes   no  cellular  13
#> 1864  42    technician  married      no    4791     yes   no   unknown  30
#> 1865  28    technician  married      no     139     yes  yes  cellular   8
#> 1866  54      services  married      no    1301     yes   no   unknown  13
#> 1867  43    management  married      no    2886      no   no  cellular  20
#> 1868  31    management divorced      no    1742     yes   no  cellular  20
#> 1869  50  entrepreneur  married     yes     537     yes   no   unknown  20
#> 1870  72       retired  married      no     796      no   no  cellular  24
#> 1871  54   blue-collar  married      no    1827      no   no  cellular  20
#> 1872  57        admin.  married      no    2137      no   no telephone   8
#> 1873  42    management  married      no    -700     yes   no   unknown  14
#> 1874  47     housemaid   single      no    3232      no   no telephone  16
#> 1875  60        admin.  married      no       0      no   no  cellular   5
#> 1876  41   blue-collar divorced      no    1498      no   no   unknown  20
#> 1877  31 self-employed  married      no       0     yes   no  cellular  30
#> 1878  49    technician  married      no    -215     yes   no   unknown  26
#> 1879  60     housemaid  married      no     211      no   no  cellular  26
#> 1880  36     housemaid  married     yes   -1941     yes   no   unknown  16
#> 1881  37    management   single      no     455     yes   no  cellular  13
#> 1882  34   blue-collar  married      no    1451     yes   no  cellular   9
#> 1883  57    management  married      no    1171      no   no  cellular   8
#> 1884  34        admin.  married      no     899     yes   no   unknown  12
#> 1885  46      services divorced      no     755      no   no  cellular  28
#> 1886  36        admin.  married      no     542     yes   no   unknown  18
#> 1887  35    management  married      no    5367      no   no  cellular   2
#> 1888  40    management  married      no     270      no   no   unknown  16
#> 1889  30    management divorced      no    -274     yes  yes  cellular  19
#> 1890  53    management  married      no    2240     yes   no  cellular   2
#> 1891  31    technician  married      no     344     yes   no   unknown   7
#> 1892  39    management  married      no     575      no   no   unknown   6
#> 1893  57        admin. divorced      no   18268     yes   no  cellular  19
#> 1894  54    unemployed  married      no    6427     yes   no telephone  19
#> 1895  35        admin.  married      no    -488     yes   no   unknown   2
#> 1896  34   blue-collar  married      no    1031     yes   no   unknown  29
#> 1897  30       student   single      no    -145      no  yes  cellular   8
#> 1898  39        admin.  married      no       0      no   no  cellular  17
#> 1899  49 self-employed  married      no    1103      no   no  cellular  12
#> 1900  58 self-employed  married      no    1187     yes   no  cellular   6
#> 1901  37     housemaid  married      no       0     yes   no  cellular  24
#> 1902  34      services  married      no     184     yes   no  cellular  18
#> 1903  41    technician   single      no      -3      no   no  cellular   8
#> 1904  23       student   single      no     556     yes   no  cellular  15
#> 1905  47      services  married      no    1496     yes   no   unknown  16
#> 1906  35   blue-collar   single      no    1277     yes   no  cellular  20
#> 1907  42        admin. divorced      no      24     yes   no  cellular   6
#> 1908  49   blue-collar  married      no     352     yes   no   unknown   9
#> 1909  37        admin.   single      no     262      no   no  cellular   7
#> 1910  31   blue-collar   single      no    4978     yes   no  cellular  12
#> 1911  41    technician  married      no    2125     yes  yes  cellular  21
#> 1912  36    technician   single      no      98      no   no  cellular  30
#> 1913  29   blue-collar   single      no      98      no   no  cellular  10
#> 1914  39        admin.  married      no     441      no   no   unknown   6
#> 1915  53       retired  married      no     366      no  yes  cellular  16
#> 1916  36   blue-collar   single      no     168     yes   no telephone  12
#> 1917  33    technician  married      no     180      no   no  cellular   4
#> 1918  29   blue-collar   single      no    1166     yes   no   unknown  16
#> 1919  43       retired  married      no    7298      no   no   unknown  11
#> 1920  32   blue-collar  married      no    1518     yes   no telephone   6
#> 1921  44    technician  married      no     851     yes   no  cellular  11
#> 1922  50   blue-collar  married      no    2190      no   no   unknown  17
#> 1923  37    technician  married      no    4596     yes   no  cellular   7
#> 1924  31    technician   single      no    1166     yes   no  cellular  21
#> 1925  36   blue-collar  married      no     108     yes   no  cellular   5
#> 1926  38   blue-collar  married      no    -152      no   no   unknown  20
#> 1927  55   blue-collar divorced      no     962      no  yes telephone  28
#> 1928  43    management  married      no    9261     yes   no  cellular  17
#> 1929  40   blue-collar  married      no       0     yes   no  cellular  11
#> 1930  38    technician   single      no    2442      no   no  cellular  27
#> 1931  36    management   single      no    4123      no   no  cellular  11
#> 1932  43    management divorced      no    3163     yes   no  cellular  22
#> 1933  43      services divorced      no    1040     yes   no   unknown  19
#> 1934  33   blue-collar divorced      no     474      no   no  cellular  22
#> 1935  30    management   single      no    2186     yes   no   unknown   3
#> 1936  54   blue-collar  married      no     844      no   no telephone   5
#> 1937  41  entrepreneur  married      no     221     yes   no   unknown  14
#> 1938  46     housemaid   single      no   10889      no   no  cellular  19
#> 1939  50   blue-collar  married      no     565     yes  yes  cellular  28
#> 1940  36   blue-collar  married     yes      13      no  yes  cellular   3
#> 1941  43    management divorced      no     481     yes   no  cellular   3
#> 1942  32   blue-collar divorced      no       8     yes   no  cellular  16
#> 1943  25       student   single      no    2975      no   no  cellular   2
#> 1944  33   blue-collar  married      no     331     yes   no  cellular  14
#> 1945  41      services  married      no    3992     yes   no telephone  20
#> 1946  70  entrepreneur  married      no   15265      no   no  cellular  17
#> 1947  37      services  married      no    -224      no   no   unknown  18
#> 1948  52    management  married      no    4873      no   no telephone   6
#> 1949  31  entrepreneur   single      no     544      no  yes  cellular   5
#> 1950  31    technician   single      no    1819     yes   no   unknown  15
#> 1951  45    management   single      no     142      no  yes  cellular   6
#> 1952  47   blue-collar  married      no    4666      no   no   unknown  14
#> 1953  50      services  married      no    5699     yes   no   unknown   5
#> 1954  49   blue-collar  married      no      90     yes   no   unknown   7
#> 1955  38    management   single      no    2346     yes   no  cellular  28
#> 1956  28    management  married      no       3     yes   no  cellular  14
#> 1957  42    management  married      no    2608     yes   no   unknown  29
#> 1958  30   blue-collar  married      no    -269     yes   no   unknown  27
#> 1959  37    management   single      no    1572      no   no  cellular  13
#> 1960  58       retired divorced      no     439      no  yes  cellular  10
#> 1961  46        admin.   single      no    2889     yes   no  cellular   5
#> 1962  33    management   single      no     641     yes   no  cellular   4
#> 1963  31 self-employed  married      no       0     yes   no  cellular  20
#> 1964  42        admin.   single      no     -76     yes   no   unknown   5
#> 1965  35      services   single      no     739     yes   no  cellular   4
#> 1966  32    management  married     yes       2      no   no  cellular   8
#> 1967  31        admin.   single      no      43      no   no   unknown   1
#> 1968  37      services  married      no     -21     yes  yes   unknown  23
#> 1969  44  entrepreneur divorced      no     134     yes   no  cellular  12
#> 1970  43        admin.  married      no    1138      no   no  cellular  16
#> 1971  31    technician   single      no    1109      no   no  cellular   5
#> 1972  37      services   single      no    3715     yes   no   unknown  20
#> 1973  41    technician  married      no     201      no  yes  cellular  14
#> 1974  32   blue-collar  married      no     150     yes   no   unknown   9
#> 1975  58    management divorced      no      44     yes   no  cellular  29
#> 1976  38    technician divorced     yes    -530     yes   no   unknown  21
#> 1977  52        admin.  married      no     199      no   no  cellular  28
#> 1978  33      services   single      no    1595     yes   no   unknown  26
#> 1979  31    unemployed  married      no     213     yes   no   unknown   9
#> 1980  52    management  married      no     258      no   no   unknown  14
#> 1981  30      services   single      no    3516     yes   no   unknown  29
#> 1982  31    technician   single      no    1626      no   no  cellular   7
#> 1983  42    management  married      no     202      no   no   unknown   6
#> 1984  43   blue-collar  married     yes    -635     yes   no   unknown  20
#> 1985  58    technician   single      no     388      no   no  cellular  19
#> 1986  32      services  married      no    1977     yes  yes  cellular  18
#> 1987  53       retired  married      no    1778      no   no  cellular  19
#> 1988  33        admin.   single      no     395     yes   no   unknown  12
#> 1989  47   blue-collar  married      no     -18      no  yes  cellular  22
#> 1990  36 self-employed  married      no     254     yes   no telephone  17
#> 1991  58  entrepreneur  married      no       0      no  yes  cellular  30
#> 1992  35    management  married      no      24     yes   no  cellular   8
#> 1993  23       student   single      no     107      no   no  cellular  13
#> 1994  37   blue-collar  married      no    2939     yes   no  cellular   4
#> 1995  33    management divorced      no     321      no  yes  cellular  30
#> 1996  35      services  married      no      31      no  yes  cellular  19
#> 1997  57    management  married      no    1832     yes   no  cellular   2
#> 1998  36    technician  married      no     696     yes   no  cellular   5
#> 1999  31        admin.   single      no    2076      no  yes  cellular  18
#> 2000  47       unknown  married      no    1880      no   no   unknown  18
#> 2001  45    unemployed   single      no    2249     yes   no  cellular   9
#> 2002  37    technician   single      no     971      no   no  cellular  19
#> 2003  33        admin. divorced      no     661     yes   no  cellular  11
#> 2004  24    management   single      no     507      no   no  cellular   3
#> 2005  46   blue-collar  married      no    5461     yes   no  cellular  13
#> 2006  43   blue-collar  married      no    1127     yes   no  cellular  17
#> 2007  30        admin.  married      no     215      no  yes  cellular   4
#> 2008  46        admin.   single      no     849     yes   no   unknown   5
#> 2009  47   blue-collar  married      no      17      no   no  cellular   8
#> 2010  49    technician  married      no    8422     yes   no  cellular  20
#> 2011  50   blue-collar  married      no     378     yes   no  cellular  28
#> 2012  61       retired  married      no    1058      no   no  cellular  27
#> 2013  31   blue-collar  married      no     251     yes   no   unknown   7
#> 2014  31    management  married      no    2344     yes   no  cellular  14
#> 2015  48   blue-collar  married      no    5058      no   no   unknown  20
#> 2016  28        admin.   single      no    1540     yes   no   unknown   2
#> 2017  27    unemployed   single      no    -446     yes   no   unknown  26
#> 2018  35        admin.   single      no     777      no  yes  cellular  28
#> 2019  43    unemployed  married      no       0     yes   no   unknown   6
#> 2020  36    technician  married      no    1508      no   no  cellular  29
#> 2021  39    management divorced      no     295      no   no  cellular  28
#> 2022  27       student   single      no    2245      no   no  cellular  18
#> 2023  34        admin.  married      no      79     yes   no   unknown  23
#> 2024  46   blue-collar  married      no    1303      no   no  cellular   4
#> 2025  39   blue-collar   single      no      29     yes   no   unknown   7
#> 2026  44     housemaid  married      no    3706      no   no   unknown  17
#> 2027  35   blue-collar   single      no    4963     yes   no  cellular  14
#> 2028  30        admin.  married      no     518     yes   no  cellular   8
#> 2029  26    technician  married      no     267     yes   no  cellular  28
#> 2030  26       student   single      no     316      no   no  cellular  18
#> 2031  28        admin.   single      no     520     yes   no  cellular  15
#> 2032  39   blue-collar  married      no     474     yes  yes   unknown  26
#> 2033  31   blue-collar  married      no     512     yes   no  cellular  18
#> 2034  55    management divorced      no    1633      no   no telephone   2
#> 2035  57      services   single      no    2236     yes   no   unknown  14
#> 2036  41    technician   single      no    2701     yes   no  cellular   6
#> 2037  26   blue-collar   single      no      36      no  yes  cellular  31
#> 2038  56    management  married      no     870      no   no  cellular  16
#> 2039  42        admin. divorced      no     153     yes   no   unknown  16
#> 2040  37    management   single      no    1730      no   no  cellular  19
#> 2041  55        admin.   single     yes     986      no  yes  cellular   2
#> 2042  23    technician   single      no       4     yes   no  cellular   8
#> 2043  35      services divorced      no     440     yes   no   unknown   2
#> 2044  34        admin. divorced      no    1186     yes  yes  cellular  18
#> 2045  35    technician divorced      no    -281      no   no  cellular   4
#> 2046  50   blue-collar divorced      no     388      no   no  cellular   5
#> 2047  47 self-employed  married      no    4420     yes  yes  cellular  20
#> 2048  43    management   single      no       0      no   no   unknown  20
#> 2049  58   blue-collar  married      no     343     yes   no   unknown  26
#> 2050  35    management divorced      no     788     yes   no   unknown   7
#> 2051  32 self-employed  married      no      67      no   no  cellular   5
#> 2052  39   blue-collar  married      no     295     yes   no  cellular   3
#> 2053  46   blue-collar  married      no       0     yes   no telephone  11
#> 2054  60   blue-collar  married      no      93      no  yes   unknown  27
#> 2055  29    management   single      no    1739     yes   no  cellular   3
#> 2056  34  entrepreneur  married      no    1076     yes   no  cellular   5
#> 2057  34      services  married      no     404     yes   no  cellular   9
#> 2058  30        admin.   single      no    4925     yes   no  cellular  21
#> 2059  41 self-employed  married      no     323     yes   no  cellular  17
#> 2060  55       retired  married      no     868      no   no   unknown  19
#> 2061  33    management  married      no    2744     yes   no telephone  19
#> 2062  36   blue-collar divorced      no     719     yes   no   unknown  13
#> 2063  34       student   single      no    1281      no   no  cellular  30
#> 2064  51      services  married      no    -553     yes   no   unknown   4
#> 2065  58     housemaid  married      no     497      no   no   unknown  11
#> 2066  25 self-employed   single      no     882     yes   no  cellular  13
#> 2067  50   blue-collar  married      no    4121     yes  yes  cellular  20
#> 2068  50    management  married      no     536      no   no   unknown  20
#> 2069  51  entrepreneur  married      no     726     yes  yes  cellular  15
#> 2070  56       retired  married      no       0      no   no  cellular  26
#> 2071  52        admin.  married      no    2851      no  yes telephone   2
#> 2072  41   blue-collar  married      no     232      no   no telephone   8
#> 2073  48        admin. divorced      no       0      no  yes  cellular  11
#> 2074  36    technician  married      no      98      no   no  cellular   4
#> 2075  31    management   single      no   12857     yes   no telephone   4
#> 2076  39    management   single      no    1509      no   no  cellular  11
#> 2077  45    unemployed  married      no    2040      no   no telephone   2
#> 2078  57   blue-collar  married      no    1460      no   no   unknown  13
#> 2079  44    management  married      no     170      no   no  cellular   4
#> 2080  42    management   single      no     196     yes   no   unknown  12
#> 2081  38   blue-collar  married      no    1099     yes   no  cellular  15
#> 2082  41     housemaid  married      no     783     yes   no   unknown  30
#> 2083  34    technician  married      no    1137      no   no  cellular  29
#> 2084  37      services   single      no    -196     yes   no   unknown   7
#> 2085  43        admin.   single      no       6      no   no   unknown  16
#> 2086  46        admin.  married      no    9319     yes   no  cellular  21
#> 2087  41   blue-collar   single      no    1564     yes   no  cellular  12
#> 2088  27   blue-collar   single      no     140      no   no telephone  28
#> 2089  44   blue-collar  married      no     195     yes   no   unknown  16
#> 2090  35   blue-collar  married      no    -461      no   no   unknown  23
#> 2091  30    management   single      no       0     yes   no  cellular   2
#> 2092  36  entrepreneur  married      no     302     yes   no  cellular  17
#> 2093  41       unknown   single      no    1259      no   no   unknown  11
#> 2094  61       retired divorced      no    1857     yes   no   unknown  28
#> 2095  38    management  married      no    1221     yes   no   unknown   3
#> 2096  36    technician  married      no    1731     yes  yes   unknown  28
#> 2097  34       student   single      no    1281      no   no  cellular  25
#> 2098  46    technician  married      no    9299      no   no  cellular  19
#> 2099  31     housemaid   single      no     287     yes   no  cellular  19
#> 2100  43    management divorced      no    -173      no  yes  cellular  18
#> 2101  37   blue-collar   single      no     240     yes   no   unknown   6
#> 2102  37      services  married      no       0     yes  yes   unknown  12
#> 2103  56      services  married      no     966      no  yes  cellular  10
#> 2104  26    unemployed   single      no     461      no   no  cellular  28
#> 2105  42    unemployed  married      no     259     yes   no   unknown  15
#> 2106  31    technician  married      no    -720     yes   no   unknown  17
#> 2107  39     housemaid  married      no      94      no   no  cellular   6
#> 2108  34   blue-collar  married      no     405     yes   no   unknown  21
#> 2109  57        admin.  married      no    1218      no   no  cellular  29
#> 2110  48    unemployed  married      no    1571     yes   no  cellular  24
#> 2111  49    management   single      no       1     yes   no   unknown   6
#> 2112  44    technician  married      no    4389      no   no  cellular  29
#> 2113  46    technician  married      no    4176     yes   no   unknown  12
#> 2114  50    unemployed  married      no     297     yes   no  cellular  31
#> 2115  58    technician  married      no    5618     yes   no   unknown  15
#> 2116  61       retired  married      no    1257      no   no  cellular  10
#> 2117  49   blue-collar  married      no    1350      no   no  cellular  18
#> 2118  56      services divorced      no    6101      no   no  cellular  14
#> 2119  26       student   single      no     826      no   no  cellular  29
#> 2120  44      services  married      no    -230     yes  yes   unknown  27
#> 2121  37        admin.  married      no    1207     yes   no telephone   6
#> 2122  58   blue-collar  married      no       0      no   no telephone  13
#> 2123  30      services   single     yes    -366     yes   no  cellular  18
#> 2124  37        admin.  married      no     801      no   no  cellular  11
#> 2125  36    technician   single      no     333      no   no  cellular   7
#> 2126  59    management  married      no     518      no   no  cellular  11
#> 2127  27      services  married      no       0     yes   no  cellular  22
#> 2128  42    unemployed  married      no    1270     yes   no   unknown  15
#> 2129  36        admin. divorced      no     181     yes   no  cellular   7
#> 2130  46    management   single      no     311     yes  yes  cellular  27
#> 2131  35    technician   single      no       0      no   no  cellular  14
#> 2132  24        admin.   single      no     120     yes   no  cellular  18
#> 2133  71       retired divorced      no       0      no   no  cellular  26
#> 2134  41   blue-collar  married      no    2717     yes  yes  cellular  24
#> 2135  25   blue-collar   single      no    1429     yes   no   unknown  29
#> 2136  52 self-employed  married      no    1066     yes   no   unknown  16
#> 2137  55   blue-collar  married      no    3485      no   no  cellular  18
#> 2138  52        admin.  married      no    4493      no   no  cellular  21
#> 2139  29   blue-collar  married      no     415     yes   no  cellular  11
#> 2140  44   blue-collar   single      no    1593     yes   no  cellular  19
#> 2141  46    management  married      no      21     yes   no  cellular   7
#> 2142  39   blue-collar  married      no    3045      no   no  cellular   4
#> 2143  28      services   single      no     348     yes   no   unknown  21
#> 2144  54    management  married      no     384     yes   no  cellular  12
#> 2145  47    technician  married      no      11      no   no  cellular  21
#> 2146  42   blue-collar  married      no       0     yes   no  cellular  30
#> 2147  40    technician  married      no    -282     yes   no   unknown   6
#> 2148  31    management  married      no    1224     yes  yes  cellular  20
#> 2149  37 self-employed  married      no    1146      no  yes  cellular   9
#> 2150  45      services  married      no      27     yes  yes  cellular  31
#> 2151  22      services   single      no     652      no   no telephone  31
#> 2152  44        admin.   single      no    2524      no   no   unknown  19
#> 2153  59      services  married      no      64     yes  yes telephone  12
#> 2154  27        admin.   single      no    3638      no   no  cellular  11
#> 2155  34   blue-collar  married      no    -204     yes   no  cellular  14
#> 2156  56    management  married      no     208      no  yes telephone  31
#> 2157  33      services  married      no    -384     yes   no   unknown  28
#> 2158  28       student   single      no    2306      no   no  cellular  29
#> 2159  26    management   single      no      45      no   no  cellular  10
#> 2160  57    management divorced      no    6468     yes   no  cellular  31
#> 2161  52        admin.  married      no    1746      no   no  cellular  30
#> 2162  49    technician  married      no     313      no   no  cellular   9
#> 2163  44     housemaid  married      no    1109     yes  yes  cellular  29
#> 2164  30   blue-collar   single      no     183     yes   no  cellular  18
#> 2165  29        admin.   single      no     200     yes   no  cellular  18
#> 2166  43      services divorced      no    -145     yes   no  cellular  28
#> 2167  35    technician  married      no     150      no   no  cellular  18
#> 2168  34   blue-collar   single      no    1599     yes   no  cellular  12
#> 2169  34    management  married      no     179     yes   no  cellular  20
#> 2170  39  entrepreneur  married      no       4     yes  yes  cellular   2
#> 2171  33   blue-collar divorced      no    3546     yes   no   unknown  23
#> 2172  33    management  married      no     149     yes  yes  cellular  22
#> 2173  41    management divorced      no     276     yes   no   unknown   7
#> 2174  40    management  married      no     569      no   no  cellular  20
#> 2175  44      services divorced      no      20      no   no   unknown   9
#> 2176  56   blue-collar divorced      no      12      no   no  cellular   8
#> 2177  35    management  married      no    5057     yes   no   unknown   4
#> 2178  31    technician   single      no     830     yes   no  cellular   9
#> 2179  32      services   single      no     785      no   no  cellular   3
#> 2180  60    management  married      no     358      no   no   unknown  18
#> 2181  35    management   single      no    1750     yes   no  cellular  30
#> 2182  40        admin.  married      no    1412      no   no  cellular  31
#> 2183  37    technician  married      no     720     yes   no  cellular  14
#> 2184  35   blue-collar  married      no     914     yes   no   unknown  27
#> 2185  58        admin.  married      no    3735      no   no  cellular  17
#> 2186  46        admin. divorced      no     289      no  yes  cellular  21
#> 2187  37    management  married      no    6771      no   no  cellular   7
#> 2188  26       student   single      no     279      no   no  cellular   7
#> 2189  28    technician   single      no    4513     yes   no   unknown  27
#> 2190  48   blue-collar  married      no     238     yes  yes  cellular   2
#> 2191  36    management  married      no   11675     yes   no  cellular  20
#> 2192  39    technician  married      no      52      no   no  cellular  12
#> 2193  40        admin. divorced      no       6      no   no   unknown  11
#> 2194  56    management divorced      no       0      no   no   unknown   6
#> 2195  32        admin.   single      no    2692     yes   no  cellular  18
#> 2196  34   blue-collar  married      no    6411     yes  yes   unknown   9
#> 2197  28    management  married      no     247      no   no  cellular   6
#> 2198  46    technician  married      no    2207     yes   no   unknown  16
#> 2199  33   blue-collar divorced      no     -53     yes   no   unknown  26
#> 2200  51      services divorced      no       0      no   no telephone  30
#> 2201  59       retired  married      no       0      no   no   unknown  18
#> 2202  28   blue-collar  married      no     -65     yes   no  cellular   4
#> 2203  52    unemployed  married      no    1639      no   no  cellular   8
#> 2204  30    management   single      no     220     yes   no  cellular   4
#> 2205  41    management  married      no     850      no   no   unknown   6
#> 2206  37        admin.  married      no      55     yes  yes  cellular  27
#> 2207  35 self-employed   single      no     398      no   no  cellular   5
#> 2208  50  entrepreneur  married      no    2410      no   no  cellular  21
#> 2209  29    management  married      no       0     yes   no  cellular   6
#> 2210  54    technician  married      no     415     yes   no   unknown  19
#> 2211  27    management   single      no    3104     yes   no   unknown  28
#> 2212  32    management divorced      no     530     yes   no  cellular   3
#> 2213  39     housemaid  married      no     562      no   no  cellular  12
#> 2214  28    technician   single      no     584     yes   no  cellular  13
#> 2215  54        admin.  married      no      19      no   no  cellular  26
#> 2216  27      services   single      no     167      no  yes  cellular   8
#> 2217  35    management  married      no    3161      no   no  cellular   8
#> 2218  30    technician  married      no     817     yes   no  cellular  21
#> 2219  44  entrepreneur  married      no     242      no  yes  cellular  21
#> 2220  24        admin.   single      no      66     yes   no   unknown   3
#> 2221  33  entrepreneur   single      no    1481     yes   no  cellular  13
#> 2222  46   blue-collar  married      no       5      no   no  cellular  18
#> 2223  27    technician   single      no     235     yes   no  cellular  12
#> 2224  34    technician   single     yes      -1      no   no  cellular  27
#> 2225  55    technician divorced      no    3450      no   no  cellular  11
#> 2226  33      services  married      no    4434     yes   no   unknown  20
#> 2227  35    technician  married      no      18     yes  yes  cellular  14
#> 2228  33    unemployed   single      no     237     yes   no  cellular   4
#> 2229  51  entrepreneur  married      no    3188     yes  yes  cellular  19
#> 2230  57    technician divorced      no       0     yes   no   unknown  14
#> 2231  59        admin.  married      no    1914     yes   no  cellular   7
#> 2232  36      services   single      no     461      no   no  cellular  18
#> 2233  57    technician  married      no     -40      no  yes  cellular   7
#> 2234  46    management  married      no       0      no   no  cellular  27
#> 2235  44  entrepreneur  married      no     692      no   no   unknown  18
#> 2236  56    management  married      no     154      no   no  cellular  25
#> 2237  35    management   single      no    1496     yes   no  cellular  22
#> 2238  40  entrepreneur  married      no      70      no   no  cellular  20
#> 2239  30        admin.   single      no      52      no  yes  cellular   7
#> 2240  31        admin.   single      no      78     yes   no  cellular  11
#> 2241  36      services   single      no      72     yes   no   unknown   8
#> 2242  32   blue-collar  married      no     143     yes  yes  cellular  18
#> 2243  36   blue-collar  married      no    1554     yes   no   unknown  12
#> 2244  30       student   single      no      34     yes   no   unknown   6
#> 2245  59    unemployed divorced      no    7469      no   no  cellular  22
#> 2246  29        admin.  married      no     453     yes   no  cellular  17
#> 2247  53        admin. divorced      no    -112      no   no   unknown  19
#> 2248  41    unemployed  married      no     121     yes   no   unknown   9
#> 2249  24       student   single      no      82     yes   no   unknown   5
#> 2250  30    unemployed   single      no    -306     yes   no   unknown   3
#> 2251  31      services   single      no       0     yes   no  cellular  17
#> 2252  49 self-employed divorced      no    3293      no   no  cellular   8
#> 2253  30    unemployed  married      no    1566      no   no  cellular  19
#> 2254  43      services  married      no       0     yes   no   unknown  14
#> 2255  34   blue-collar  married      no     587     yes   no   unknown   4
#> 2256  44    technician  married      no     858      no   no   unknown  30
#> 2257  35      services  married      no    2179      no   no  cellular  20
#> 2258  36    management   single      no     202      no   no  cellular  13
#> 2259  43        admin.  married      no    1625     yes  yes  cellular  21
#> 2260  29   blue-collar   single      no     455      no   no telephone  21
#> 2261  41        admin.  married      no    3138      no   no  cellular  14
#> 2262  35   blue-collar  married      no    -465      no   no  cellular  12
#> 2263  57   blue-collar  married      no    4148      no   no   unknown  18
#> 2264  43   blue-collar divorced      no     110     yes  yes   unknown   6
#> 2265  37    technician  married      no    5287     yes  yes  cellular  19
#> 2266  35    technician  married      no    1140     yes   no  cellular  14
#> 2267  26   blue-collar  married      no    5795     yes   no  cellular  14
#> 2268  37    technician  married      no    1733     yes   no  cellular  12
#> 2269  54       retired   single      no     515     yes   no   unknown  17
#> 2270  58   blue-collar  married      no       0     yes   no   unknown  19
#> 2271  49    management  married      no     322      no   no  cellular   6
#> 2272  39    management  married      no    5142      no   no  cellular   3
#> 2273  29       student  married      no   10596     yes   no  cellular  12
#> 2274  38      services  married      no    5000      no   no  cellular   4
#> 2275  56    management divorced      no     -59      no  yes  cellular  28
#> 2276  27      services   single      no    9636     yes   no   unknown  28
#> 2277  56  entrepreneur  married      no   16125      no   no telephone   7
#> 2278  42   blue-collar  married      no    1123     yes   no   unknown  29
#> 2279  19       student   single      no     424      no   no  cellular  30
#> 2280  44   blue-collar  married      no    1308      no   no  cellular  30
#> 2281  31        admin.   single      no     483     yes  yes  cellular  20
#> 2282  47    technician divorced      no     442     yes   no  cellular  11
#> 2283  42    management  married      no   27696      no   no  cellular  12
#> 2284  53        admin. divorced      no    2647     yes   no  cellular   9
#> 2285  50   blue-collar  married      no    1203     yes  yes   unknown  28
#> 2286  33    management  married      no      91      no   no  cellular  10
#> 2287  32    management   single      no     703     yes   no  cellular  17
#> 2288  38        admin.  married      no    1209      no   no  cellular  31
#> 2289  34        admin. divorced      no     183      no  yes   unknown   4
#> 2290  27      services   single      no    -266      no  yes  cellular  10
#> 2291  50   blue-collar   single      no     496     yes   no  cellular   8
#> 2292  30 self-employed  married     yes   -1083     yes   no  cellular   6
#> 2293  33    technician   single      no     318     yes   no  cellular  14
#> 2294  58        admin. divorced      no    3058     yes   no telephone  11
#> 2295  32    technician   single      no    3818      no   no  cellular  18
#> 2296  27   blue-collar  married      no    1535     yes   no  cellular  15
#> 2297  24    technician   single      no    -192     yes   no   unknown  13
#> 2298  57    management  married      no     929      no   no  cellular  19
#> 2299  59    management divorced      no      51      no   no  cellular  28
#> 2300  51        admin. divorced      no    2717      no   no   unknown   9
#> 2301  46    management  married      no    7331      no   no  cellular  11
#> 2302  35    technician   single      no     175     yes   no  cellular  29
#> 2303  41    technician   single      no    1147     yes   no   unknown  20
#> 2304  40       retired   single      no       0      no   no   unknown   5
#> 2305  34   blue-collar  married      no    2720     yes   no  cellular  21
#> 2306  30   blue-collar   single      no     445     yes   no  cellular  16
#> 2307  33   blue-collar   single      no    4404     yes   no  cellular  20
#> 2308  48     housemaid divorced      no    1583      no  yes telephone  18
#> 2309  36    management  married      no     332     yes   no  cellular  22
#> 2310  30   blue-collar  married      no     313     yes  yes  cellular   6
#> 2311  37    unemployed   single      no    1648     yes   no   unknown   5
#> 2312  47      services  married      no     459      no   no  cellular  19
#> 2313  33   blue-collar  married      no     833     yes  yes  cellular  18
#> 2314  24       student   single      no   23878      no   no  cellular  18
#> 2315  32      services   single      no    1987     yes   no telephone  15
#> 2316  45   blue-collar   single      no     615     yes   no  cellular  15
#> 2317  53 self-employed  married      no    -488     yes   no  cellular   6
#> 2318  55    management divorced      no     204     yes   no  cellular  11
#> 2319  32    management  married      no    -360     yes   no  cellular  21
#> 2320  35    technician divorced      no       0      no   no   unknown  21
#> 2321  48    technician  married      no    9207      no   no  cellular  18
#> 2322  43    technician divorced      no    1612      no   no  cellular  28
#> 2323  34    management   single      no    -444     yes  yes  cellular  17
#> 2324  58    management  married      no    2360      no   no   unknown  15
#> 2325  33    management   single      no     383     yes   no  cellular   9
#> 2326  32    unemployed   single      no    8304      no   no  cellular   2
#> 2327  43    management  married      no     536     yes   no  cellular  14
#> 2328  34   blue-collar  married      no     283      no  yes   unknown   6
#> 2329  42  entrepreneur  married      no     718     yes   no  cellular  14
#> 2330  47   blue-collar  married     yes      25     yes  yes  cellular   7
#> 2331  39   blue-collar  married      no     879     yes   no   unknown  26
#> 2332  48       unknown  married      no    2261      no   no   unknown  18
#> 2333  24      services   single      no    -141     yes   no   unknown   4
#> 2334  36      services  married      no       0     yes   no  cellular   8
#> 2335  47    technician divorced      no    4135     yes   no   unknown  14
#> 2336  45   blue-collar  married      no     532     yes   no   unknown  14
#> 2337  33      services  married      no       0     yes  yes  cellular   7
#> 2338  31   blue-collar   single      no    2089     yes   no   unknown  20
#> 2339  32    technician   single      no      14     yes  yes  cellular  16
#> 2340  47      services  married      no    -835     yes  yes   unknown  25
#> 2341  27    technician   single      no       8     yes   no   unknown  20
#> 2342  37   blue-collar   single      no   13156     yes   no   unknown  21
#> 2343  52        admin.   single      no    2398     yes   no  cellular   3
#> 2344  41    technician  married      no      -4      no   no  cellular  20
#> 2345  33    technician  married      no    1029     yes   no  cellular   9
#> 2346  32   blue-collar   single      no      22      no   no  cellular   7
#> 2347  52    technician divorced      no     511      no  yes  cellular  20
#> 2348  34        admin.  married      no     798     yes   no  cellular   8
#> 2349  61    management  married      no       0     yes   no  cellular  15
#> 2350  40   blue-collar divorced      no      71     yes   no  cellular   8
#> 2351  30   blue-collar   single      no     327     yes   no telephone  18
#> 2352  42    technician   single      no     -15      no   no  cellular  17
#> 2353  26        admin.   single      no     338      no   no  cellular  29
#> 2354  27    management  married      no    1531     yes   no  cellular  15
#> 2355  31    management   single      no     241     yes   no  cellular  24
#> 2356  34    technician   single      no    1161     yes   no   unknown  21
#> 2357  51    management divorced      no     292      no   no  cellular  26
#> 2358  60      services  married      no     594     yes   no  cellular   3
#> 2359  32    management   single      no       2     yes   no  cellular  11
#> 2360  49   blue-collar divorced      no      39     yes   no  cellular  13
#> 2361  38       unknown  married      no     653      no   no telephone  29
#> 2362  37   blue-collar  married      no     660     yes  yes   unknown  20
#> 2363  45  entrepreneur  married      no     369     yes   no   unknown  19
#> 2364  33    unemployed   single      no     170     yes   no   unknown   3
#> 2365  55   blue-collar  married      no       0      no   no   unknown  17
#> 2366  37    management  married      no    1276      no   no  cellular  14
#> 2367  31      services  married      no     356     yes   no   unknown  20
#> 2368  32    technician  married      no    -300      no   no  cellular  28
#> 2369  34    management   single      no     549      no   no  cellular   6
#> 2370  36   blue-collar   single      no    1089     yes   no telephone  11
#> 2371  35        admin.   single      no     368     yes   no   unknown  16
#> 2372  30    management   single      no     440     yes   no  cellular  11
#> 2373  40    management  married      no     373     yes  yes   unknown  13
#> 2374  26     housemaid   single     yes   -1006     yes  yes  cellular  21
#> 2375  70       retired  married      no    2626      no   no  cellular   2
#> 2376  43    management  married      no    3518      no   no  cellular  15
#> 2377  29        admin.  married      no     387     yes  yes   unknown  14
#> 2378  31        admin. divorced      no    1890     yes   no  cellular  21
#> 2379  28    technician  married      no    -302     yes   no  cellular  13
#> 2380  53    technician  married      no    6671     yes  yes  cellular  30
#> 2381  46        admin.  married      no     186     yes   no  cellular  11
#> 2382  30    management   single      no    2344     yes   no  cellular  20
#> 2383  26   blue-collar   single      no     102     yes   no   unknown  16
#> 2384  47    technician  married      no    1375     yes  yes   unknown   2
#> 2385  55    technician   single      no      99     yes   no  cellular  12
#> 2386  54        admin.  married      no    4943      no   no  cellular  12
#> 2387  41   blue-collar   single      no     925     yes   no telephone  13
#> 2388  34        admin.  married      no     396     yes   no  cellular  16
#> 2389  30   blue-collar  married      no     365      no   no   unknown   1
#> 2390  67       retired  married      no    1443      no   no  cellular   8
#> 2391  33   blue-collar   single      no       0      no   no telephone  25
#> 2392  35    management  married      no     387     yes   no  cellular  16
#> 2393  36        admin.   single      no    5871      no   no  cellular  19
#> 2394  55       retired  married      no      39      no   no  cellular  27
#> 2395  39    management   single      no    1234      no   no telephone  29
#> 2396  55    technician  married      no     240     yes   no  cellular   2
#> 2397  37    management  married      no     308     yes   no   unknown   7
#> 2398  39    management  married      no     568     yes  yes   unknown  30
#> 2399  49        admin.  married      no      82     yes   no   unknown   6
#> 2400  48    unemployed  married      no     484      no   no  cellular  18
#> 2401  53       retired divorced      no    1126      no   no   unknown  20
#> 2402  46    technician  married      no    1740     yes   no  cellular  11
#> 2403  48    technician  married      no     454     yes   no  cellular  10
#> 2404  50   blue-collar  married      no      26     yes   no  cellular   7
#> 2405  38      services  married      no    3259     yes   no   unknown  19
#> 2406  30   blue-collar divorced      no    4591     yes   no  cellular  19
#> 2407  52      services  married      no    2420     yes   no   unknown  19
#> 2408  31   blue-collar  married      no      33      no   no   unknown   4
#> 2409  25        admin.  married      no     894     yes   no   unknown  28
#> 2410  30  entrepreneur   single      no     999      no   no  cellular  22
#> 2411  49   blue-collar  married      no     154     yes   no   unknown   5
#> 2412  42   blue-collar  married      no      15     yes   no   unknown   6
#> 2413  50    technician  married      no    3176      no   no  cellular   7
#> 2414  35    technician  married      no    1364     yes  yes  cellular  20
#> 2415  29   blue-collar  married      no    -114     yes   no  cellular  15
#> 2416  55   blue-collar  married      no      23      no   no  cellular  13
#> 2417  31    management divorced      no     106     yes   no  cellular   5
#> 2418  27      services   single      no     430     yes   no   unknown  23
#> 2419  29   blue-collar  married      no     844     yes   no   unknown  27
#> 2420  57     housemaid divorced      no   11632      no   no telephone  30
#> 2421  20       student   single      no     556     yes   no   unknown  27
#> 2422  29   blue-collar  married      no    1171     yes   no   unknown  28
#> 2423  59   blue-collar  married      no       0     yes  yes  cellular  21
#> 2424  37  entrepreneur  married      no       0      no   no  cellular  25
#> 2425  46    management  married      no    1489     yes   no   unknown  20
#> 2426  42    management  married      no    1773      no   no  cellular   9
#> 2427  52    technician  married      no       7      no   no   unknown   6
#> 2428  38    technician   single      no       9     yes   no   unknown   6
#> 2429  46 self-employed  married      no     156      no   no  cellular  20
#> 2430  40    technician divorced      no     348     yes   no  cellular   5
#> 2431  41    management  married      no    6526      no   no   unknown  15
#> 2432  40    technician  married      no     265      no   no   unknown  18
#> 2433  58    management  married      no    1021      no   no   unknown  18
#> 2434  47    management  married      no    2010      no   no telephone   4
#> 2435  46   blue-collar  married      no     143     yes   no   unknown   7
#> 2436  58   blue-collar  married      no     381      no   no  cellular  11
#> 2437  48      services   single      no    1499     yes   no  cellular  12
#> 2438  42      services  married      no     412     yes   no telephone  19
#> 2439  30    management   single      no    1571      no   no  cellular   5
#> 2440  48    technician  married     yes     295      no  yes  cellular  17
#> 2441  28   blue-collar  married      no       0     yes   no  cellular  15
#> 2442  36 self-employed  married      no     188     yes  yes  cellular   4
#> 2443  40    management  married      no     472     yes   no   unknown  30
#> 2444  51   blue-collar divorced      no     325     yes   no   unknown   6
#> 2445  40        admin.  married      no     153     yes   no   unknown  14
#> 2446  50    management divorced      no      30      no   no  cellular  20
#> 2447  46   blue-collar  married      no     176      no   no   unknown  29
#> 2448  40   blue-collar  married      no    2880     yes   no   unknown   6
#> 2449  43    technician  married      no     463      no   no   unknown   3
#> 2450  37    management  married      no     725      no   no  cellular  26
#> 2451  47    management  married     yes       0      no  yes  cellular  22
#> 2452  31   blue-collar   single      no       0     yes   no  cellular   7
#> 2453  37   blue-collar  married      no     298     yes   no  cellular  31
#> 2454  38   blue-collar  married      no     861     yes   no  cellular  11
#> 2455  40        admin.  married      no    2591     yes  yes  cellular   7
#> 2456  43    technician  married      no     764     yes   no  cellular  14
#> 2457  34   blue-collar  married      no    6352     yes   no  cellular   5
#> 2458  50    management   single      no     486      no  yes   unknown  11
#> 2459  44    technician  married      no       0      no  yes  cellular   4
#> 2460  66       retired  married      no    1004      no   no  cellular  28
#> 2461  42    technician  married      no     314      no   no  cellular  27
#> 2462  54        admin. divorced      no     791      no  yes  cellular  10
#> 2463  30        admin. divorced      no     370     yes   no   unknown  15
#> 2464  58    management  married      no    7387      no   no telephone  17
#> 2465  33    technician  married      no     503      no   no  cellular  29
#> 2466  37    management divorced      no      88      no   no  cellular   2
#> 2467  34   blue-collar  married      no    -703     yes   no  cellular  18
#> 2468  34    management divorced      no     488     yes   no   unknown  16
#> 2469  34    management  married      no       0      no   no  cellular   3
#> 2470  49   blue-collar  married      no     141      no   no  cellular   6
#> 2471  29      services   single      no      95     yes   no   unknown  13
#> 2472  46        admin.  married      no      68     yes   no  cellular  27
#> 2473  42    management  married      no    1323     yes  yes   unknown  15
#> 2474  54        admin.   single      no    3344     yes   no  cellular  14
#> 2475  32    management   single      no     697      no   no  cellular   7
#> 2476  38    unemployed   single      no    1354     yes   no  cellular  13
#> 2477  30    management   single      no    3384      no   no  cellular   4
#> 2478  28   blue-collar  married      no      17      no   no   unknown  28
#> 2479  61       retired  married      no     483      no   no  cellular  23
#> 2480  27    management   single      no     616     yes   no  cellular  22
#> 2481  65       retired  married      no    1153      no   no  cellular   3
#> 2482  35     housemaid  married      no     113     yes   no  cellular  17
#> 2483  56       retired  married      no     102     yes   no telephone  11
#> 2484  32    management   single      no    1834     yes   no   unknown   2
#> 2485  32    technician  married      no    4790     yes   no  cellular  22
#> 2486  37    technician   single      no    3943      no   no  cellular   6
#> 2487  35   blue-collar  married      no     378     yes   no   unknown  16
#> 2488  37    management  married      no       0     yes   no   unknown  12
#> 2489  39   blue-collar   single      no      48      no   no  cellular   3
#> 2490  37      services   single      no     608      no   no  cellular  14
#> 2491  44   blue-collar  married      no     617     yes   no   unknown  13
#> 2492  67       retired   single      no    3377      no   no telephone  23
#> 2493  46 self-employed  married      no    2295     yes   no   unknown  11
#> 2494  39        admin.   single      no       0      no  yes   unknown  19
#> 2495  58 self-employed  married      no    8014     yes   no  cellular  19
#> 2496  33        admin.  married      no    2468     yes  yes  cellular   6
#> 2497  32        admin.   single      no     642     yes   no  cellular   5
#> 2498  42      services  married      no    -437     yes  yes   unknown  27
#> 2499  45     housemaid  married      no       0      no   no   unknown   9
#> 2500  33    technician   single      no     261     yes   no   unknown  14
#> 2501  60       unknown  married      no    2450      no   no   unknown   9
#> 2502  50   blue-collar  married      no    1389     yes   no  cellular  17
#> 2503  36    management   single      no       0     yes   no   unknown   3
#> 2504  31        admin.  married      no    -581     yes   no   unknown   2
#> 2505  25        admin.   single      no     285      no   no  cellular   3
#> 2506  34        admin.  married      no    1551     yes  yes  cellular   8
#> 2507  26       student   single      no     655      no   no  cellular  16
#> 2508  31    management  married      no     242     yes   no  cellular   9
#> 2509  28    technician   single      no    1026     yes   no  cellular  13
#> 2510  42   blue-collar  married     yes    -204     yes   no  cellular  11
#> 2511  38      services   single      no    -196     yes   no  cellular   2
#> 2512  38   blue-collar  married      no    2283     yes   no  cellular  14
#> 2513  53        admin. divorced      no    2687     yes   no  cellular  29
#> 2514  43   blue-collar  married      no    1211     yes   no   unknown   6
#> 2515  32      services   single      no    2881      no   no  cellular   2
#> 2516  49 self-employed divorced      no    3293      no   no  cellular  24
#> 2517  46    technician  married      no    1975     yes   no  cellular   8
#> 2518  54    unemployed   single      no     380      no   no  cellular  17
#> 2519  34    management  married      no    2026     yes   no   unknown  17
#> 2520  43    management  married      no       0     yes   no  cellular  17
#> 2521  36    management   single      no     112     yes   no  cellular  15
#> 2522  33    technician  married      no    -160     yes   no  cellular  21
#> 2523  74       retired  married      no       0      no   no telephone  13
#> 2524  33        admin.   single      no     555     yes   no  cellular   9
#> 2525  23    management  married      no     175     yes   no   unknown  26
#> 2526  59    management  married      no     771      no   no telephone  13
#> 2527  60       retired  married      no    2196      no   no  cellular  15
#> 2528  36      services divorced      no    -330     yes  yes   unknown  27
#> 2529  33   blue-collar  married      no     312     yes   no   unknown   4
#> 2530  39   blue-collar divorced     yes    -202     yes  yes  cellular  15
#> 2531  35    management   single      no     996      no   no   unknown  20
#> 2532  40  entrepreneur  married      no    6403      no   no  cellular  22
#> 2533  34        admin.  married      no      21      no  yes  cellular   2
#> 2534  51   blue-collar  married      no     480     yes   no  cellular  12
#> 2535  43    technician   single      no     463     yes   no  cellular  17
#> 2536  45    management  married      no    1134      no  yes  cellular   9
#> 2537  32      services  married      no      59     yes  yes   unknown   9
#> 2538  39       unknown   single      no       0      no   no telephone  28
#> 2539  37   blue-collar  married      no      20      no  yes telephone  15
#> 2540  29        admin.  married      no     624     yes   no   unknown  12
#> 2541  44        admin.   single     yes    -612     yes   no  cellular  31
#> 2542  31      services  married      no   11512     yes   no   unknown  21
#> 2543  29 self-employed   single      no    3290      no   no  cellular  12
#> 2544  49    unemployed  married     yes      11     yes   no telephone  31
#> 2545  58      services divorced      no    -158      no   no telephone  18
#> 2546  64     housemaid  married      no      67      no   no telephone  25
#> 2547  62    management  married      no    7458      no   no  cellular  30
#> 2548  59 self-employed  married      no     185      no   no  cellular  22
#> 2549  52    technician  married      no     371     yes  yes  cellular  21
#> 2550  37      services   single      no     459      no   no telephone  16
#> 2551  34  entrepreneur   single     yes    1709      no  yes  cellular  18
#> 2552  56   blue-collar  married      no     551      no   no   unknown  29
#> 2553  46    management divorced      no     675      no  yes   unknown  12
#> 2554  59    management  married      no    4152     yes   no  cellular   1
#> 2555  32   blue-collar   single      no    -255      no  yes   unknown   2
#> 2556  46    technician divorced      no       0     yes  yes  cellular   8
#> 2557  39        admin.  married      no     168     yes   no  cellular  19
#> 2558  46   blue-collar  married      no    5393     yes   no  cellular  20
#> 2559  44      services  married      no     742      no   no telephone  30
#> 2560  35    technician   single      no     744     yes   no  cellular   7
#> 2561  54      services  married      no     198     yes   no  cellular  31
#> 2562  35    technician divorced      no       0      no   no  cellular  24
#> 2563  51  entrepreneur   single      no       0      no   no  cellular  30
#> 2564  34      services  married      no    1442      no   no  cellular  11
#> 2565  77       retired  married      no    4112      no   no telephone  26
#> 2566  45   blue-collar  married      no    4646     yes   no   unknown  13
#> 2567  45        admin. divorced      no    1201      no   no  cellular  30
#> 2568  46    technician  married      no    1028     yes   no  cellular   2
#> 2569  28      services  married      no     462     yes  yes  cellular   5
#> 2570  45   blue-collar  married      no     196     yes   no  cellular   2
#> 2571  28     housemaid   single      no     781     yes   no  cellular  17
#> 2572  29      services  married      no    -597      no   no  cellular   7
#> 2573  37      services   single      no     248     yes   no  cellular   8
#> 2574  58    unemployed   single      no    1013     yes   no  cellular  30
#> 2575  31      services  married      no     338     yes   no  cellular  28
#> 2576  40        admin.  married      no     824     yes   no  cellular  17
#> 2577  32        admin.   single      no     131     yes   no  cellular  22
#> 2578  82       retired  married      no     276      no   no telephone  17
#> 2579  29        admin.   single      no      65     yes   no  cellular  14
#> 2580  42      services divorced      no     241     yes   no   unknown  19
#> 2581  56     housemaid divorced      no    1866      no  yes  cellular   1
#> 2582  32   blue-collar  married      no    1914     yes   no  cellular  14
#> 2583  54   blue-collar  married      no    1487     yes   no   unknown  14
#> 2584  46    technician  married      no       0     yes   no telephone  31
#> 2585  31    technician  married      no       0      no   no  cellular  20
#> 2586  47   blue-collar  married      no       0      no   no  cellular  26
#> 2587  34    management divorced      no      27      no  yes  cellular  19
#> 2588  47   blue-collar divorced      no    1480     yes   no  cellular  15
#> 2589  35        admin.   single      no     994      no   no  cellular   2
#> 2590  38    management  married      no     546      no   no  cellular  22
#> 2591  33    management divorced      no     723     yes   no   unknown  27
#> 2592  49    technician  married      no    3635     yes   no  cellular   5
#> 2593  35    technician  married      no    -288     yes  yes  cellular  30
#> 2594  40      services  married      no    1117     yes   no   unknown  13
#> 2595  48 self-employed  married      no    1175     yes  yes  cellular  19
#> 2596  43        admin.  married      no     323     yes  yes  cellular  12
#> 2597  29    management  married      no       1     yes  yes   unknown  16
#> 2598  60       retired  married      no       3      no   no   unknown  18
#> 2599  39        admin.  married      no     104     yes   no   unknown   6
#> 2600  31   blue-collar  married      no     297     yes   no   unknown  12
#> 2601  51   blue-collar  married      no    4695      no   no  cellular  29
#> 2602  33   blue-collar  married      no     308     yes   no  cellular  13
#> 2603  39   blue-collar  married      no     315     yes   no  cellular  15
#> 2604  28      services  married      no     376      no  yes telephone  29
#> 2605  50   blue-collar  married      no    -581     yes   no  cellular  14
#> 2606  77       retired  married      no    2590      no   no telephone  15
#> 2607  49    technician  married      no    6138      no   no   unknown  20
#> 2608  48        admin.  married      no       3     yes   no   unknown  27
#> 2609  34    management  married      no     176      no   no  cellular  18
#> 2610  42    technician   single      no     146      no   no  cellular   8
#> 2611  49  entrepreneur  married      no     687      no   no  cellular  18
#> 2612  56       retired  married      no   16432      no   no  cellular  19
#> 2613  29    unemployed  married      no      39      no  yes  cellular  18
#> 2614  33      services   single      no     406     yes   no  cellular   5
#> 2615  34    management   single      no    1012     yes  yes  cellular  15
#> 2616  57    unemployed  married      no     209      no   no   unknown  19
#> 2617  42    unemployed  married      no    -523     yes   no  cellular  11
#> 2618  54      services  married      no     869      no   no  cellular  14
#> 2619  43    management divorced      no      51      no   no  cellular   2
#> 2620  52  entrepreneur   single      no    3469     yes   no  cellular  20
#> 2621  45   blue-collar  married      no     248     yes   no   unknown   6
#> 2622  36    management  married      no     953     yes  yes telephone   4
#> 2623  27    management   single      no       0     yes   no  cellular   1
#> 2624  47    management   single      no    -246     yes   no  cellular   5
#> 2625  37    technician   single      no     363     yes   no  cellular  21
#> 2626  34   blue-collar  married      no      41     yes   no  cellular   6
#> 2627  59    management  married      no    3428     yes  yes  cellular  19
#> 2628  56    management  married      no    1803      no   no  cellular  20
#> 2629  50    management  married      no    2717     yes   no  cellular  18
#> 2630  59   blue-collar  married      no      99     yes   no  cellular   5
#> 2631  45        admin.  married      no    -299     yes   no  cellular   8
#> 2632  32    technician  married      no     903     yes   no  cellular  23
#> 2633  43   blue-collar  married      no      46     yes   no  cellular  15
#> 2634  31      services   single      no      13      no  yes  cellular   6
#> 2635  46    technician   single     yes   -1124     yes  yes   unknown   9
#> 2636  38   blue-collar   single      no     334     yes   no  cellular  18
#> 2637  31    management   single      no      18      no   no  cellular   8
#> 2638  43    technician  married      no    1485      no   no  cellular  21
#> 2639  58       retired  married      no      69      no   no  cellular  29
#> 2640  36    management  married      no     406      no   no  cellular  14
#> 2641  33   blue-collar   single      no     127     yes   no   unknown  29
#> 2642  30      services   single      no      44      no   no   unknown  16
#> 2643  38  entrepreneur   single     yes       0     yes   no  cellular  18
#> 2644  48    technician  married      no     504      no  yes  cellular   6
#> 2645  35    technician   single      no       2      no   no  cellular  11
#> 2646  36   blue-collar  married      no    -417     yes   no   unknown  27
#> 2647  41        admin.   single      no    1322     yes   no  cellular  29
#> 2648  52    management  married      no    2578      no   no  cellular  17
#> 2649  36    management divorced      no    2397      no   no  cellular  25
#> 2650  49    management  married      no    1533      no   no  cellular  17
#> 2651  42    management  married      no    4014     yes   no  cellular  21
#> 2652  55    management  married      no      86      no   no telephone  16
#> 2653  52        admin.   single      no    2332      no   no  cellular  29
#> 2654  51  entrepreneur  married      no    3404      no   no  cellular  31
#> 2655  55    technician  married      no     199      no   no  cellular  11
#> 2656  50      services  married      no     901     yes   no   unknown  20
#> 2657  48      services   single      no     848     yes   no   unknown  15
#> 2658  46    management  married      no     144      no   no  cellular  22
#> 2659  36      services  married      no    1746     yes   no   unknown  26
#> 2660  34   blue-collar  married      no    -185     yes  yes   unknown  13
#> 2661  33  entrepreneur  married      no    3140     yes  yes  cellular  21
#> 2662  27    technician   single      no     629     yes  yes   unknown  18
#> 2663  32      services  married      no     109     yes   no   unknown   2
#> 2664  27    management   single      no     442     yes   no   unknown  28
#> 2665  33   blue-collar   single      no    6285     yes   no   unknown   2
#> 2666  50    technician  married      no       0     yes   no   unknown   2
#> 2667  40   blue-collar  married      no    3316      no   no   unknown  19
#> 2668  41    management  married      no    1409      no   no  cellular   5
#> 2669  25    technician divorced      no      86      no  yes  cellular   8
#> 2670  37   blue-collar  married      no      53     yes   no   unknown  19
#> 2671  54 self-employed  married      no     368      no   no  cellular  18
#> 2672  39    management  married      no    -468     yes  yes  cellular   8
#> 2673  31    management  married      no     777     yes   no  cellular   3
#> 2674  30  entrepreneur  married      no    2551     yes   no   unknown   5
#> 2675  67       retired   single      no     491      no   no telephone   6
#> 2676  46   blue-collar  married      no    2944      no   no   unknown  20
#> 2677  26    management   single      no     157     yes   no  cellular  30
#> 2678  38        admin.   single      no     245     yes  yes  cellular  17
#> 2679  45    management  married      no    1847      no   no   unknown  16
#> 2680  40    management   single      no     269     yes   no  cellular  27
#> 2681  29    technician   single      no      18      no   no  cellular   3
#> 2682  38    management  married      no     465     yes  yes  cellular  15
#> 2683  57       retired  married      no    9367      no   no  cellular  14
#> 2684  36   blue-collar  married      no     142     yes   no  cellular  17
#> 2685  20       student   single      no     291      no   no telephone  11
#> 2686  28        admin.   single      no     551      no  yes  cellular   8
#> 2687  39    technician divorced      no     807     yes  yes  cellular  13
#> 2688  39    technician  married      no     616      no   no telephone   8
#> 2689  51    technician  married      no     371     yes  yes  cellular  21
#> 2690  37    technician  married      no    6384     yes  yes  cellular   3
#> 2691  35        admin.   single      no    2452     yes   no   unknown   5
#> 2692  35    management  married      no     972     yes  yes  cellular  25
#> 2693  34        admin.  married      no      10      no   no  cellular  21
#> 2694  38    technician  married      no     114      no   no  cellular  11
#> 2695  34      services  married      no     798     yes   no   unknown   2
#> 2696  30    management  married      no    1185     yes   no  cellular  18
#> 2697  29      services   single      no     703     yes   no   unknown   7
#> 2698  32 self-employed  married      no     102     yes   no  cellular  18
#> 2699  40   blue-collar  married      no     874      no   no   unknown  14
#> 2700  49   blue-collar  married      no     391     yes   no   unknown   4
#> 2701  46  entrepreneur  married      no       0      no   no  cellular   2
#> 2702  51 self-employed  married      no     146      no   no  cellular  15
#> 2703  46        admin.  married      no     120     yes   no   unknown  14
#> 2704  59    management   single      no     671     yes  yes   unknown  15
#> 2705  50       retired  married      no       4     yes  yes  cellular  11
#> 2706  56    technician  married      no     589     yes   no   unknown  23
#> 2707  47    management  married      no    -521     yes   no  cellular   3
#> 2708  70       retired divorced      no     482      no   no telephone  14
#> 2709  49    management  married      no     470      no   no  cellular  18
#> 2710  60       retired  married      no     209      no   no  cellular  14
#> 2711  29        admin.   single      no    2083     yes   no   unknown   3
#> 2712  34 self-employed  married      no    1545     yes   no  cellular  20
#> 2713  53   blue-collar  married      no    4641      no   no   unknown  16
#> 2714  52    technician  married      no       0      no   no  cellular   2
#> 2715  76       retired  married      no    4112      no   no telephone  23
#> 2716  47   blue-collar  married      no     373     yes   no  cellular  11
#> 2717  34   blue-collar  married      no   17946     yes   no  cellular   6
#> 2718  34   blue-collar   single      no      62     yes   no  cellular  14
#> 2719  55    management  married      no    1691     yes   no  cellular  13
#> 2720  39    management divorced      no    4692     yes   no telephone  19
#> 2721  33    management  married      no     808     yes   no  cellular  19
#> 2722  35    management  married      no       0      no   no  cellular  25
#> 2723  52    management divorced      no     427      no  yes telephone  20
#> 2724  30    management   single      no     604      no  yes  cellular   2
#> 2725  31    technician   single      no     754      no   no  cellular   7
#> 2726  41   blue-collar  married      no     167      no   no   unknown  20
#> 2727  38      services  married      no      15     yes   no  cellular  18
#> 2728  37    technician  married      no     332     yes   no  cellular  19
#> 2729  35      services divorced      no    -718     yes   no  cellular  21
#> 2730  33        admin.   single      no     303      no   no   unknown   8
#> 2731  24       student   single      no     834      no   no  cellular   9
#> 2732  36   blue-collar  married      no    1023     yes   no  cellular   4
#> 2733  38    management   single      no      83      no  yes telephone  15
#> 2734  46     housemaid  married      no     184      no   no  cellular   3
#> 2735  24   blue-collar  married      no    -254     yes  yes   unknown  27
#> 2736  38    technician  married      no    -255     yes  yes  cellular  24
#> 2737  43  entrepreneur  married      no     903     yes   no  cellular   7
#> 2738  33    technician  married      no    1021     yes   no   unknown   3
#> 2739  38        admin.  married      no    4583     yes   no  cellular  17
#> 2740  34    management   single      no   13014      no   no  cellular  12
#> 2741  26        admin.   single      no     102      no  yes  cellular   8
#> 2742  27    management   single      no   12956     yes   no   unknown  29
#> 2743  54       retired  married      no    3846     yes  yes   unknown  19
#> 2744  62    management  married      no       0      no   no  cellular  13
#> 2745  37     housemaid  married      no    2410      no   no  cellular   4
#> 2746  25    unemployed  married      no     157     yes   no  cellular  28
#> 2747  38    management  married      no    3500     yes   no  cellular  16
#> 2748  56    unemployed divorced      no     438      no   no   unknown  20
#> 2749  52    unemployed  married      no      94      no   no  cellular  10
#> 2750  54        admin.  married      no     140      no   no telephone  27
#> 2751  59    management divorced      no      14      no  yes  cellular  28
#> 2752  38        admin.  married      no    1839      no   no   unknown  23
#> 2753  30    technician   single      no     237     yes   no  cellular   5
#> 2754  30       student   single      no      25      no   no telephone  30
#> 2755  33   blue-collar  married      no      80     yes   no  cellular  18
#> 2756  34    management  married      no     557     yes   no  cellular  29
#> 2757  66       unknown divorced      no    1993     yes   no  cellular   6
#> 2758  38    technician  married      no     525     yes  yes telephone  18
#> 2759  35    technician   single      no      33      no   no  cellular  29
#> 2760  31    management  married      no     713     yes   no   unknown   9
#> 2761  45   blue-collar  married      no     850      no   no  cellular  19
#> 2762  62    management  married      no       0      no   no  cellular   3
#> 2763  52   blue-collar  married      no     262      no   no   unknown  18
#> 2764  24       student   single      no    1234      no   no telephone  26
#> 2765  46        admin.  married      no     154      no   no  cellular  22
#> 2766  57    technician  married      no    1276     yes   no  cellular  14
#> 2767  37   blue-collar  married      no      95     yes   no  cellular   5
#> 2768  56       retired  married      no     728      no   no  cellular  18
#> 2769  43   blue-collar  married     yes     128     yes   no  cellular   3
#> 2770  43    management  married      no     348      no  yes  cellular  15
#> 2771  40    technician  married      no    -396     yes   no   unknown  26
#> 2772  56    technician divorced      no     397     yes   no   unknown   8
#> 2773  38    technician  married      no     275     yes   no  cellular   3
#> 2774  33    management divorced      no    2695     yes   no  cellular  12
#> 2775  37  entrepreneur  married      no    1134     yes   no   unknown   9
#> 2776  83       retired divorced      no      20      no   no  cellular  27
#> 2777  29    technician  married      no    4557      no   no  cellular  28
#> 2778  47    technician  married      no    3519      no  yes telephone  22
#> 2779  39    management  married      no     794     yes   no  cellular   4
#> 2780  48    management  married      no     732      no   no  cellular  13
#> 2781  27    unemployed   single      no     799      no   no  cellular   9
#> 2782  31    technician  married      no      15      no   no   unknown   2
#> 2783  54   blue-collar  married      no     211      no   no  cellular  25
#> 2784  40    technician divorced      no       0      no   no  cellular  29
#> 2785  39   blue-collar  married      no     281      no   no   unknown  20
#> 2786  34   blue-collar   single      no     152     yes   no  cellular  23
#> 2787  52    technician  married      no    1785      no   no  cellular  10
#> 2788  43   blue-collar  married      no     197     yes   no  cellular  17
#> 2789  40    management  married      no      20     yes   no   unknown  19
#> 2790  41   blue-collar  married      no    -664     yes  yes  cellular  13
#> 2791  56    technician  married      no     225     yes   no   unknown  12
#> 2792  39   blue-collar  married      no    2003     yes   no   unknown  21
#> 2793  21       student   single      no    1596      no   no  cellular  26
#> 2794  50      services  married      no       1      no   no telephone  11
#> 2795  32    management  married      no    2172     yes   no  cellular  22
#> 2796  30    management   single      no     147      no   no  cellular   9
#> 2797  38    management  married      no       0     yes   no   unknown  27
#> 2798  34    technician  married      no     -56     yes   no  cellular  13
#> 2799  44   blue-collar  married      no     300     yes   no   unknown  13
#> 2800  31     housemaid  married      no      25      no   no  cellular  21
#> 2801  36  entrepreneur divorced      no     299     yes   no  cellular  18
#> 2802  59    management  married      no    5314      no   no  cellular  20
#> 2803  29      services   single      no       0     yes   no   unknown  20
#> 2804  43   blue-collar  married      no     699     yes  yes  cellular  20
#> 2805  51   blue-collar  married      no     303     yes   no   unknown   3
#> 2806  30    management  married      no     604      no   no  cellular  25
#> 2807  33    technician  married      no       0      no   no   unknown   9
#> 2808  31        admin.   single      no       0      no   no  cellular  17
#> 2809  34   blue-collar  married      no     205     yes  yes  cellular   7
#> 2810  52    unemployed  married      no     255      no  yes  cellular  10
#> 2811  44   blue-collar  married      no     476      no   no  cellular  14
#> 2812  36 self-employed  married      no     328     yes  yes  cellular  23
#> 2813  55    management  married      no       0      no   no   unknown  16
#> 2814  57       retired  married      no     523      no  yes  cellular   2
#> 2815  41    management  married      no     226      no   no  cellular  28
#> 2816  35    management   single      no    1756      no   no  cellular  20
#> 2817  50   blue-collar  married      no    2610     yes  yes   unknown  20
#> 2818  55        admin. divorced      no     789     yes   no   unknown  13
#> 2819  35        admin.  married      no    1055      no   no  cellular   2
#> 2820  33    management   single      no     -61      no   no   unknown  28
#> 2821  35    management  married      no      93      no   no  cellular   4
#> 2822  35 self-employed divorced      no    3443      no   no  cellular  30
#> 2823  51     housemaid  married      no    2239      no   no  cellular  27
#> 2824  26    technician   single      no    1256      no   no   unknown  26
#> 2825  46   blue-collar  married      no      85     yes   no  cellular  17
#> 2826  54  entrepreneur  married      no       0      no   no   unknown   9
#> 2827  21    technician   single      no     360      no   no  cellular  26
#> 2828  45     housemaid  married      no      40     yes   no  cellular   2
#> 2829  36   blue-collar divorced      no     107     yes   no  cellular  31
#> 2830  65       retired divorced      no     744      no   no  cellular   5
#> 2831  26   blue-collar   single      no      96     yes   no   unknown  12
#> 2832  46      services  married      no    2420      no   no  cellular  19
#> 2833  57    management  married      no    3250      no   no  cellular  20
#> 2834  48        admin.  married      no     257     yes   no telephone   8
#> 2835  30      services divorced      no      63     yes   no   unknown  29
#> 2836  46        admin.  married      no    3145     yes   no  cellular   5
#> 2837  28    management  married      no    1480     yes   no  cellular  18
#> 2838  35        admin.   single      no    1721      no   no telephone  30
#> 2839  30    technician  married      no    -280     yes   no  cellular  17
#> 2840  31    technician   single      no      25      no   no  cellular  26
#> 2841  23   blue-collar   single      no    8627     yes   no  cellular  15
#> 2842  41    unemployed divorced      no     271     yes   no   unknown  19
#> 2843  47    technician  married      no   17206     yes   no  cellular  19
#> 2844  55     housemaid  married      no     127     yes   no telephone  21
#> 2845  44    technician divorced      no      12      no   no  cellular  11
#> 2846  38    management  married      no    1074      no   no  cellular   8
#> 2847  49    technician   single      no    -188     yes  yes  cellular  17
#> 2848  27   blue-collar   single      no     -15     yes  yes  cellular  15
#> 2849  57    management  married      no       0     yes  yes   unknown  20
#> 2850  30      services   single      no    1788      no   no  cellular   4
#> 2851  35    management   single      no     592      no  yes   unknown  14
#> 2852  41    technician divorced      no     475     yes   no  cellular  28
#> 2853  28   blue-collar  married      no      83     yes   no  cellular  15
#> 2854  41   blue-collar  married     yes      76      no  yes  cellular  10
#> 2855  37    management   single      no     509     yes   no  cellular   6
#> 2856  25      services   single      no      32     yes   no   unknown  16
#> 2857  27   blue-collar   single      no    2752     yes   no  cellular  18
#> 2858  41    management  married      no     280     yes   no  cellular  27
#> 2859  46   blue-collar  married      no    1109     yes   no  cellular  19
#> 2860  28        admin.  married      no     -97     yes   no  cellular  13
#> 2861  23    technician   single      no     283     yes   no  cellular  22
#> 2862  36        admin. divorced      no     543     yes   no  cellular  11
#> 2863  45       unknown divorced      no       0      no   no  cellular  21
#> 2864  32    technician   single      no     418      no  yes  cellular  14
#> 2865  38    technician  married      no     254     yes   no   unknown  27
#> 2866  26   blue-collar   single      no       8     yes   no  cellular  13
#> 2867  27   blue-collar   single      no     541     yes   no  cellular  12
#> 2868  36  entrepreneur  married      no       0     yes   no  cellular   9
#> 2869  39 self-employed  married      no    -176     yes   no   unknown  15
#> 2870  38  entrepreneur   single      no    -281     yes   no   unknown  27
#> 2871  28    technician  married      no    1180     yes   no   unknown  29
#> 2872  52        admin.  married      no     692     yes   no  cellular  12
#> 2873  35    technician  married      no     118      no   no  cellular   6
#> 2874  30    technician   single      no     341      no   no   unknown  23
#> 2875  44    management divorced      no      71     yes   no  cellular   7
#> 2876  35    technician   single      no     632      no   no  cellular   7
#> 2877  30    management   single      no     156     yes   no   unknown   9
#> 2878  49        admin.   single      no     981     yes   no telephone  21
#> 2879  39   blue-collar  married      no    2952     yes   no   unknown  12
#> 2880  47    management   single      no    1187      no   no  cellular  31
#> 2881  33   blue-collar   single      no    1794     yes   no  cellular  12
#> 2882  18       student   single      no     108      no   no  cellular   8
#> 2883  41      services  married      no     450     yes   no  cellular  17
#> 2884  44    management  married      no     677     yes   no   unknown  12
#> 2885  22     housemaid   single      no     650     yes   no   unknown  12
#> 2886  48   blue-collar  married      no    1778     yes   no telephone   8
#> 2887  42    technician divorced      no       0     yes   no   unknown  30
#> 2888  44        admin.  married      no      26     yes   no  cellular  21
#> 2889  39 self-employed  married      no    2165     yes   no  cellular  18
#> 2890  25   blue-collar   single      no    1857     yes   no  cellular  13
#> 2891  34      services   single      no     258     yes   no   unknown   4
#> 2892  32    technician   single      no       0      no   no  cellular  21
#> 2893  30        admin.   single      no     873      no   no  cellular   7
#> 2894  32      services  married      no     182      no   no  cellular   5
#> 2895  33    management  married      no       1     yes  yes  cellular  21
#> 2896  33    technician   single      no    1393     yes   no  cellular  18
#> 2897  33  entrepreneur  married      no    -886     yes  yes  cellular  25
#> 2898  31   blue-collar  married      no    1354     yes  yes  cellular  17
#> 2899  40    technician  married      no    4441     yes   no  cellular  20
#> 2900  35        admin.   single      no      57     yes   no  cellular  18
#> 2901  29 self-employed   single      no     476     yes   no  cellular  18
#> 2902  36 self-employed   single      no     351      no   no  cellular  30
#> 2903  43     housemaid  married      no    5233      no   no   unknown  18
#> 2904  27    management   single      no    2849      no   no  cellular   5
#> 2905  37      services divorced      no     731     yes   no  cellular   5
#> 2906  37    technician  married      no    1142     yes   no  cellular  17
#> 2907  52    management  married      no       0      no   no  cellular  12
#> 2908  40    management  married      no     572      no   no  cellular   2
#> 2909  34    technician   single      no     124      no   no telephone  14
#> 2910  48    technician   single      no     329      no   no  cellular  23
#> 2911  40        admin.  married      no       0      no   no  cellular  28
#> 2912  50   blue-collar  married      no     289      no   no   unknown   6
#> 2913  36    management  married      no     753      no   no  cellular  26
#> 2914  35    management  married      no    -126      no   no  cellular  22
#> 2915  18       student   single      no     608      no   no  cellular  13
#> 2916  26    technician  married      no    2026      no   no  cellular  22
#> 2917  26   blue-collar   single      no     311     yes   no  cellular   7
#> 2918  56       retired  married      no    5879      no   no   unknown  20
#> 2919  57    management  married      no    2155      no  yes  cellular  11
#> 2920  53   blue-collar  married      no     148     yes   no  cellular   7
#> 2921  38    technician   single      no    1369     yes   no  cellular   3
#> 2922  29    management  married      no     147     yes  yes   unknown   7
#> 2923  36 self-employed  married      no     506      no   no  cellular   3
#> 2924  48    management  married      no   -1080     yes  yes  cellular  18
#> 2925  32    technician  married      no    2688      no   no  cellular  14
#> 2926  30    management  married      no       0      no   no  cellular  22
#> 2927  36   blue-collar  married      no    7265      no   no   unknown  17
#> 2928  48    unemployed  married      no   11371     yes   no  cellular  30
#> 2929  32    technician   single      no      10      no   no  cellular  19
#> 2930  55   blue-collar  married      no    7561      no   no   unknown   6
#> 2931  30    management   single      no     119      no   no  cellular  28
#> 2932  33    technician  married      no       0     yes   no  cellular   8
#> 2933  30    technician   single      no    3096     yes   no  cellular  11
#> 2934  38    management  married      no   10357      no   no  cellular  15
#> 2935  43   blue-collar  married      no    1559     yes   no   unknown  30
#> 2936  52   blue-collar  married      no    2206     yes   no   unknown  15
#> 2937  30      services  married      no     683     yes   no  cellular  15
#> 2938  34      services   single      no       2     yes   no  cellular  15
#> 2939  28    technician   single      no     113      no   no  cellular  13
#> 2940  24   blue-collar  married      no     142     yes  yes   unknown  16
#> 2941  43   blue-collar  married      no    2047     yes   no   unknown  13
#> 2942  36    technician   single      no      97      no   no  cellular  28
#> 2943  25 self-employed   single      no     557      no   no telephone   5
#> 2944  27      services  married      no       0     yes   no  cellular  17
#> 2945  22       student   single      no     948      no   no telephone  25
#> 2946  58    management  married      no    -382      no   no telephone   5
#> 2947  31    management   single      no     170     yes  yes  cellular   5
#> 2948  29  entrepreneur   single      no     404      no   no  cellular  30
#> 2949  35     housemaid  married      no     738     yes   no  cellular   5
#> 2950  29      services  married      no     549     yes   no   unknown   5
#> 2951  32    technician  married      no     901     yes   no   unknown  21
#> 2952  30        admin.  married      no     116     yes   no  cellular  31
#> 2953  37      services  married      no    1694     yes  yes  cellular  29
#> 2954  24      services  married      no    1354     yes  yes  cellular  18
#> 2955  29        admin.   single      no    1751      no   no  cellular  30
#> 2956  51     housemaid  married      no     294      no   no  cellular  20
#> 2957  28   blue-collar  married      no     417     yes  yes  cellular   6
#> 2958  25    unemployed  married      no     715      no   no  cellular   4
#> 2959  43    technician   single      no     257     yes   no  cellular   2
#> 2960  47    management divorced      no    2105      no  yes  cellular  21
#> 2961  35     housemaid   single      no    4378      no   no   unknown   9
#> 2962  60 self-employed  married      no      46     yes   no   unknown   6
#> 2963  35   blue-collar  married      no    1602     yes  yes   unknown  20
#> 2964  34      services   single      no      34     yes  yes   unknown  29
#> 2965  38    technician   single      no      25     yes   no  cellular   1
#> 2966  54    technician  married      no       0      no   no telephone  30
#> 2967  48   blue-collar  married      no     264      no   no  cellular   6
#> 2968  48 self-employed  married      no    1204     yes   no   unknown  19
#> 2969  39    management  married      no       0     yes   no  cellular  11
#> 2970  52    technician  married      no     989      no   no  cellular  11
#> 2971  42   blue-collar   single      no    4930      no   no   unknown  18
#> 2972  53      services divorced      no    -291     yes  yes   unknown   7
#> 2973  31   blue-collar  married      no     -45     yes   no   unknown   2
#> 2974  47    technician  married      no    1430     yes   no  cellular  24
#> 2975  59     housemaid  married      no    1100      no   no  cellular  18
#> 2976  38        admin.  married      no       8     yes   no   unknown   7
#> 2977  39   blue-collar  married      no    2133     yes  yes   unknown  16
#> 2978  35    technician   single      no    7546     yes   no  cellular  28
#> 2979  73       retired  married      no     934      no   no  cellular  14
#> 2980  45    technician divorced      no     378     yes  yes  cellular  13
#> 2981  58    management divorced      no     108      no   no  cellular  12
#> 2982  47    management  married      no   -1379     yes   no   unknown  27
#> 2983  48    management   single      no     830      no   no  cellular  25
#> 2984  39  entrepreneur  married      no       0     yes   no   unknown  15
#> 2985  41    technician   single      no     143      no   no  cellular  20
#> 2986  29    technician   single      no     740     yes   no   unknown  28
#> 2987  58       retired  married      no    1980      no   no  cellular   5
#> 2988  53   blue-collar  married      no    1794     yes   no  cellular  17
#> 2989  52        admin.  married      no    2281     yes  yes telephone   4
#> 2990  33    management   single      no    1973     yes   no   unknown  28
#> 2991  36    unemployed   single      no     536      no   no  cellular  19
#> 2992  32    management   single      no       3     yes   no   unknown   8
#> 2993  81       retired divorced      no       0      no   no telephone  15
#> 2994  37      services  married      no     616     yes   no  cellular  17
#> 2995  30    management  married      no     623     yes   no   unknown  29
#> 2996  20       student   single      no      53      no   no  cellular  11
#> 2997  38      services  married      no     -93     yes   no   unknown   3
#> 2998  40    technician divorced      no     568     yes   no   unknown  24
#> 2999  55   blue-collar  married      no     119      no   no  cellular  29
#> 3000  30        admin.  married     yes      23      no  yes  cellular   4
#> 3001  55   blue-collar  married      no     663     yes   no  cellular   6
#> 3002  30   blue-collar  married      no       0      no  yes  cellular  21
#> 3003  47      services  married      no    1160     yes   no   unknown  27
#> 3004  30    management   single      no     872     yes   no  cellular  15
#> 3005  32   blue-collar  married      no     180     yes   no  cellular  14
#> 3006  31    management   single      no      37      no   no  cellular   8
#> 3007  52    management  married      no    1339     yes   no  cellular  22
#> 3008  36   blue-collar  married      no       6      no   no   unknown  20
#> 3009  63       retired  married      no     474      no   no  cellular  25
#> 3010  35        admin.  married      no    3187     yes   no  cellular   3
#> 3011  32    management   single      no     914     yes   no  cellular  20
#> 3012  44   blue-collar  married      no       0     yes   no telephone   5
#> 3013  32   blue-collar   single      no    3044     yes   no  cellular  20
#> 3014  45   blue-collar  married      no    1003     yes   no  cellular  14
#> 3015  41    management divorced      no    3355      no   no  cellular  14
#> 3016  44    technician  married      no     964      no   no  cellular  29
#> 3017  59    management divorced      no   13308     yes   no   unknown  13
#> 3018  31    management  married      no    1755     yes   no   unknown  21
#> 3019  39   blue-collar  married      no     467     yes   no  cellular  16
#> 3020  40    management divorced      no    3355      no   no  cellular   1
#> 3021  36    management   single      no     317      no   no   unknown  16
#> 3022  31    technician divorced      no       0      no   no  cellular  29
#> 3023  29    management   single      no     722     yes   no telephone  18
#> 3024  45   blue-collar  married      no     185      no   no  cellular  18
#> 3025  37    technician  married      no     603      no   no   unknown  18
#> 3026  24   blue-collar   single      no    -398     yes   no  cellular  18
#> 3027  37    management   single      no     105     yes   no  cellular   8
#> 3028  30    technician   single      no     985     yes   no  cellular  19
#> 3029  33   blue-collar  married      no       0      no   no   unknown  23
#> 3030  59   blue-collar  married      no     914      no   no  cellular  11
#> 3031  33    management   single      no     417     yes   no  cellular   4
#> 3032  40   blue-collar   single      no      29      no   no telephone   7
#> 3033  40   blue-collar  married      no    1802     yes   no  cellular  17
#> 3034  75 self-employed  married      no    4984      no   no telephone  28
#> 3035  34   blue-collar   single      no      47     yes   no  cellular  14
#> 3036  24      services   single      no      11     yes   no   unknown  27
#> 3037  37   blue-collar   single      no     277     yes   no   unknown   3
#> 3038  51    technician divorced      no     548      no   no   unknown  12
#> 3039  39        admin.  married      no    2783     yes   no  cellular  12
#> 3040  50   blue-collar  married      no       5      no   no   unknown  19
#> 3041  35  entrepreneur  married      no     753      no   no  cellular   7
#> 3042  29    management   single      no      91     yes   no telephone  28
#> 3043  37   blue-collar  married      no    1534     yes   no   unknown   3
#> 3044  32    technician   single      no      43      no   no  cellular   5
#> 3045  41      services  married      no     373     yes   no   unknown  30
#> 3046  32    management   single      no     718     yes   no  cellular  15
#> 3047  56   blue-collar  married      no     345     yes   no telephone  22
#> 3048  35    management   single      no       4     yes   no   unknown  30
#> 3049  37   blue-collar  married      no       0     yes   no   unknown  26
#> 3050  31    technician   single      no     319      no  yes  cellular   7
#> 3051  36    management  married      no      22      no   no  cellular   2
#> 3052  25      services  married      no     806     yes  yes  cellular  15
#> 3053  40        admin.   single      no    2360     yes   no  cellular  20
#> 3054  57     housemaid  married      no     151     yes   no  cellular  18
#> 3055  31    technician   single      no    -348     yes   no  cellular  18
#> 3056  53       retired  married      no     136      no   no   unknown  16
#> 3057  32      services   single      no      72      no   no  cellular  28
#> 3058  33        admin.   single      no   12704     yes   no  cellular  21
#> 3059  45      services  married      no    6397     yes   no   unknown   5
#> 3060  42    technician  married      no     525      no   no  cellular  17
#> 3061  30 self-employed  married      no    1930      no   no  cellular  20
#> 3062  28    unemployed   single      no      16      no   no  cellular  12
#> 3063  47    technician  married      no     826     yes   no telephone  18
#> 3064  27        admin. divorced      no      76     yes   no   unknown   4
#> 3065  60     housemaid  married      no       0      no   no telephone   4
#> 3066  58  entrepreneur  married      no    1153     yes  yes telephone  12
#> 3067  39    management  married      no       0      no   no  cellular  28
#> 3068  30   blue-collar   single      no      23     yes   no   unknown   6
#> 3069  60        admin. divorced      no     162      no   no   unknown  27
#> 3070  42    management  married      no    3841     yes   no  cellular  25
#> 3071  59       retired  married      no    2396      no   no  cellular  27
#> 3072  38    management  married      no    1617     yes   no  cellular  16
#> 3073  30    management  married      no     131     yes   no  cellular  11
#> 3074  38   blue-collar divorced      no    -138     yes   no  cellular  18
#> 3075  52       retired  married      no     414      no   no  cellular  28
#> 3076  33    management   single      no   12686     yes   no  cellular   5
#> 3077  50   blue-collar  married      no    -522     yes   no  cellular  13
#> 3078  35     housemaid   single      no     608     yes  yes   unknown   2
#> 3079  52    unemployed  married      no      -9      no   no   unknown   9
#> 3080  41   blue-collar  married      no       0      no   no   unknown   5
#> 3081  40    technician divorced      no    1871     yes   no  cellular  17
#> 3082  34   blue-collar divorced      no       0     yes   no  cellular   5
#> 3083  26        admin.  married      no       0      no   no   unknown  27
#> 3084  51    technician  married      no     117      no   no  cellular  18
#> 3085  52    management divorced      no     944      no  yes   unknown   9
#> 3086  37   blue-collar  married      no       7     yes  yes  cellular   7
#> 3087  53   blue-collar  married      no      25      no   no  cellular  22
#> 3088  28   blue-collar   single      no    1103     yes   no   unknown   4
#> 3089  39      services divorced      no    -718     yes   no   unknown   2
#> 3090  26 self-employed   single      no    1393      no   no  cellular   3
#> 3091  47      services  married      no     440     yes   no   unknown  12
#> 3092  32  entrepreneur  married      no     -25     yes   no  cellular   7
#> 3093  35   blue-collar   single      no     448      no  yes  cellular  20
#> 3094  35   blue-collar divorced      no       0      no   no  cellular  15
#> 3095  31    management   single      no     783     yes   no  cellular   2
#> 3096  54     housemaid  married      no     209     yes  yes  cellular  25
#> 3097  49   blue-collar  married      no     188     yes   no   unknown  23
#> 3098  54   blue-collar  married      no     489     yes  yes  cellular  20
#> 3099  33    management  married      no     332     yes  yes  cellular  28
#> 3100  38    technician   single      no    1711      no   no  cellular  20
#> 3101  34    management   single      no    6766      no   no  cellular  28
#> 3102  60    technician  married      no      91      no   no  cellular  27
#> 3103  35    technician  married      no    4508     yes   no  cellular  18
#> 3104  28    unemployed   single      no    1055      no   no  cellular  28
#> 3105  32   blue-collar divorced      no      88     yes   no   unknown   8
#> 3106  48    management divorced      no     174      no   no  cellular   6
#> 3107  52      services  married      no    1135     yes  yes   unknown  13
#> 3108  52    management   single      no     597      no   no  cellular  25
#> 3109  38    management   single      no     455     yes   no  cellular  19
#> 3110  39    management  married      no    1654      no  yes  cellular  21
#> 3111  50  entrepreneur  married      no    5420     yes   no  cellular  17
#> 3112  30    management   single      no     424      no   no  cellular  16
#> 3113  26  entrepreneur   single      no      81      no   no  cellular  21
#> 3114  57    management  married      no       0      no   no   unknown  19
#> 3115  42    technician  married      no     613     yes   no  cellular  11
#> 3116  32    unemployed   single      no     104      no   no  cellular   4
#> 3117  56       retired  married      no      63      no   no  cellular  19
#> 3118  49    technician  married      no    -142     yes  yes  cellular  23
#> 3119  48   blue-collar divorced      no     -18     yes   no   unknown   8
#> 3120  35   blue-collar divorced      no       0     yes   no   unknown   8
#> 3121  59    management  married      no    5397      no   no  cellular  23
#> 3122  36    technician   single      no      53      no  yes  cellular  18
#> 3123  37      services  married      no      50     yes   no   unknown   8
#> 3124  31        admin.   single      no     144     yes   no  cellular  21
#> 3125  35   blue-collar  married      no    1287     yes   no  cellular  14
#> 3126  35    technician  married      no      14     yes   no telephone  18
#> 3127  38    management  married      no    -469     yes   no   unknown  16
#> 3128  35   blue-collar divorced      no    3102     yes   no  cellular  20
#> 3129  32    technician   single      no    1849     yes   no  cellular   7
#> 3130  57        admin.  married      no       5      no   no   unknown  20
#> 3131  44        admin.  married      no    1206      no   no  cellular  19
#> 3132  32 self-employed   single      no     123     yes   no   unknown   9
#> 3133  26       student   single      no     -41     yes   no   unknown   8
#> 3134  30      services   single      no    1649     yes   no   unknown  23
#> 3135  32   blue-collar  married      no    -428     yes   no   unknown  13
#> 3136  59       retired  married      no    -411      no   no  cellular  29
#> 3137  70       retired  married      no     647      no   no telephone  10
#> 3138  30   blue-collar   single      no     334      no   no  cellular  12
#> 3139  39  entrepreneur  married      no     580     yes   no   unknown  14
#> 3140  27    technician   single      no      41     yes  yes  cellular  25
#> 3141  60   blue-collar  married      no     104     yes   no   unknown   5
#> 3142  35 self-employed  married      no     980      no   no  cellular   2
#> 3143  43    technician divorced      no     -36     yes   no  cellular  17
#> 3144  73       retired divorced      no    1092      no   no  cellular   7
#> 3145  35    management   single      no      71     yes   no   unknown  21
#> 3146  41      services  married      no     510     yes   no   unknown   9
#> 3147  33    technician  married      no    1072      no  yes   unknown  29
#> 3148  34  entrepreneur  married      no     121     yes   no telephone  18
#> 3149  30    technician  married     yes    -315     yes   no   unknown   8
#> 3150  34        admin.  married      no     287     yes   no   unknown   2
#> 3151  39   blue-collar   single      no     175      no   no  cellular  12
#> 3152  44        admin. divorced      no       0      no   no  cellular  14
#> 3153  30   blue-collar   single      no     906     yes  yes   unknown  21
#> 3154  30    technician  married      no    -280     yes   no  cellular  25
#> 3155  44      services  married      no       0     yes  yes  cellular  11
#> 3156  49        admin.  married      no    1096     yes   no  cellular  17
#> 3157  36    unemployed divorced      no    2178     yes   no  cellular  30
#> 3158  31 self-employed  married      no       0     yes   no  cellular  22
#> 3159  42   blue-collar divorced      no     103     yes   no  cellular   6
#> 3160  58       unknown  married      no      15      no   no  cellular  11
#> 3161  31        admin.  married      no    1262     yes   no  cellular  20
#> 3162  42    unemployed  married      no    1289      no   no  cellular  15
#> 3163  25    technician  married      no     839     yes   no  cellular  18
#> 3164  42    management  married      no    1680     yes   no   unknown   6
#> 3165  38   blue-collar  married      no    1102     yes   no   unknown  23
#> 3166  52    unemployed  married      no    2142      no   no  cellular   8
#> 3167  44   blue-collar   single      no    1593     yes   no   unknown  29
#> 3168  43    management   single      no     359     yes   no telephone  12
#> 3169  36    management  married      no    8277     yes   no  cellular  18
#> 3170  25   blue-collar   single      no     335     yes   no   unknown  13
#> 3171  45   blue-collar  married      no     -96      no   no  cellular  28
#> 3172  28   blue-collar  married      no       0     yes  yes   unknown  17
#> 3173  45        admin.  married      no     251     yes   no  cellular   5
#> 3174  35    management  married      no     697      no   no  cellular   5
#> 3175  43   blue-collar  married      no     245     yes  yes  cellular  12
#> 3176  50   blue-collar  married      no     180     yes   no  cellular  16
#> 3177  36        admin.   single      no     587     yes   no  cellular  13
#> 3178  44   blue-collar  married      no      88     yes   no  cellular   2
#> 3179  49        admin.   single      no       0      no   no  cellular  19
#> 3180  37     housemaid divorced      no       0     yes  yes  cellular  21
#> 3181  42   blue-collar  married      no    1556      no  yes  cellular   8
#> 3182  29   blue-collar   single      no     348     yes   no   unknown   9
#> 3183  32    technician   single      no     190     yes  yes   unknown   9
#> 3184  26       student   single      no    1209     yes   no  cellular   7
#> 3185  50    management   single      no    3537      no   no   unknown  24
#> 3186  38    management  married      no     590      no   no  cellular  31
#> 3187  54   blue-collar  married      no    1291     yes   no   unknown   5
#> 3188  34    technician   single      no     612      no   no  cellular  25
#> 3189  41      services   single      no     397     yes   no   unknown  20
#> 3190  31        admin.   single      no     507     yes   no  cellular  13
#> 3191  42    management  married      no     478      no  yes  cellular   8
#> 3192  44    management  married      no     -61      no   no  cellular  11
#> 3193  24      services  married      no     183     yes   no  cellular  18
#> 3194  38    management  married      no     272     yes   no  cellular  24
#> 3195  48    technician  married      no     220      no   no  cellular  28
#> 3196  36  entrepreneur divorced      no    2996     yes   no  cellular  14
#> 3197  49    management  married      no    2005      no   no   unknown  16
#> 3198  56     housemaid divorced     yes    1238      no   no   unknown   5
#> 3199  71       retired  married      no    2651      no   no  cellular  24
#> 3200  47        admin.  married      no    1210      no   no  cellular  26
#> 3201  52    management  married      no     583      no   no  cellular  18
#> 3202  37      services  married      no     102     yes   no  cellular  31
#> 3203  40    management divorced      no     -78     yes   no   unknown  27
#> 3204  30      services  married      no    1743     yes   no  cellular   5
#> 3205  35    management   single      no       0      no   no  cellular  21
#> 3206  38    technician  married      no     508     yes   no  cellular  18
#> 3207  52   blue-collar  married      no     779     yes   no   unknown  16
#> 3208  49    management  married      no    3840     yes   no   unknown  15
#> 3209  59    management   single      no     911      no  yes   unknown   5
#> 3210  47      services divorced      no      91     yes   no  cellular  17
#> 3211  43   blue-collar  married      no     632     yes   no   unknown  15
#> 3212  25    technician   single      no     102      no  yes  cellular   8
#> 3213  26   blue-collar   single      no     619     yes  yes   unknown  27
#> 3214  45      services  married      no     507      no  yes  cellular  21
#> 3215  26    technician   single      no    1216     yes   no  cellular  16
#> 3216  67       retired  married      no    4416      no   no  cellular  29
#> 3217  32    management  married      no    1544     yes   no  cellular   7
#> 3218  83     housemaid  married      no    2140      no   no  cellular   6
#> 3219  28   blue-collar  married      no     486     yes   no   unknown   8
#> 3220  39   blue-collar  married      no     519     yes  yes   unknown  26
#> 3221  41      services  married      no       0     yes  yes  cellular   4
#> 3222  47 self-employed  married      no    2830     yes   no telephone  20
#> 3223  49    management divorced      no   20727      no   no  cellular  20
#> 3224  59   blue-collar  married      no     448      no   no   unknown   8
#> 3225  25    management   single      no     145      no   no  cellular   7
#> 3226  57   blue-collar  married      no     630     yes   no   unknown  29
#> 3227  50   blue-collar  married      no     170     yes  yes   unknown  19
#> 3228  26   blue-collar   single      no     339     yes   no   unknown  26
#> 3229  42    technician   single      no    1882     yes   no   unknown  15
#> 3230  33    management   single      no     206      no   no  cellular  21
#> 3231  29   blue-collar  married      no    1280     yes   no   unknown  28
#> 3232  55   blue-collar  married      no       0      no   no   unknown  12
#> 3233  26    technician   single      no     342      no   no  cellular  14
#> 3234  36    unemployed   single      no     577     yes   no   unknown  30
#> 3235  31   blue-collar  married      no     457     yes   no  cellular  11
#> 3236  38     housemaid divorced      no     216      no   no  cellular   7
#> 3237  42    management   single      no    1608      no   no  cellular  28
#> 3238  29      services   single      no    1788      no   no  cellular  27
#> 3239  34        admin.  married      no      19     yes  yes  cellular  13
#> 3240  25       student   single      no      58      no   no  cellular  24
#> 3241  27        admin.  married      no    1417     yes   no  cellular  15
#> 3242  43 self-employed  married      no      64      no   no   unknown   6
#> 3243  41    management   single      no     335      no   no  cellular  30
#> 3244  46   blue-collar  married      no    -339     yes  yes  cellular  11
#> 3245  38    technician  married      no       0      no   no  cellular  25
#> 3246  33      services  married      no     546     yes  yes   unknown   9
#> 3247  35  entrepreneur  married      no    2723     yes  yes  cellular   8
#> 3248  46   blue-collar  married      no    2121     yes   no   unknown  14
#> 3249  32    management  married      no     141      no   no  cellular   2
#> 3250  35    technician   single      no     -54     yes   no   unknown  30
#> 3251  54 self-employed  married      no     153     yes   no   unknown   5
#> 3252  32    technician  married      no       0     yes   no  cellular  18
#> 3253  55   blue-collar  married      no    2854     yes   no  cellular   7
#> 3254  30        admin.  married      no    1589     yes   no  cellular  18
#> 3255  36  entrepreneur  married      no     600      no   no  cellular  21
#> 3256  39    unemployed divorced      no     193     yes   no   unknown  15
#> 3257  50 self-employed  married      no    4012      no   no  cellular  19
#> 3258  56        admin. divorced      no    3337     yes   no telephone  17
#> 3259  72       retired  married      no       0      no   no  cellular  28
#> 3260  46   blue-collar  married      no     633     yes   no   unknown  12
#> 3261  36    technician divorced      no     119      no   no  cellular  23
#> 3262  38      services  married      no     497     yes  yes   unknown  19
#> 3263  51    technician  married      no     825      no   no  cellular  17
#> 3264  32    management  married      no     184     yes   no  cellular  14
#> 3265  32   blue-collar  married      no     944      no   no  cellular  13
#> 3266  51   blue-collar  married     yes    -283     yes   no   unknown  12
#> 3267  31    unemployed   single      no     209     yes   no  cellular   6
#> 3268  33    technician divorced      no     751     yes   no  cellular  18
#> 3269  38    technician divorced      no    1425     yes   no  cellular  15
#> 3270  39   blue-collar  married      no    1254     yes   no  cellular  15
#> 3271  33   blue-collar  married      no     327     yes   no  cellular  21
#> 3272  46    management divorced      no       0      no   no  cellular  20
#> 3273  45       retired divorced      no     261      no   no   unknown   9
#> 3274  59       retired  married      no    7586      no   no  cellular  12
#> 3275  25   blue-collar   single     yes      15     yes   no telephone   6
#> 3276  36   blue-collar   single      no    2390     yes   no   unknown  20
#> 3277  33  entrepreneur  married      no     135     yes   no  cellular  17
#> 3278  46  entrepreneur  married      no     757      no   no   unknown  16
#> 3279  43  entrepreneur  married      no       0     yes   no telephone   6
#> 3280  33      services  married      no     260     yes   no  cellular  31
#> 3281  46    management  married      no      71     yes   no  cellular  19
#> 3282  34    management  married      no      15      no   no  cellular  25
#> 3283  44      services   single      no     862     yes   no  cellular   3
#> 3284  56      services  married      no     530     yes   no   unknown  20
#> 3285  42        admin.  married      no     976     yes   no  cellular  18
#> 3286  45    management  married      no    4758     yes   no  cellular   5
#> 3287  58        admin.  married      no     879     yes   no   unknown  16
#> 3288  30    management  married      no       3     yes   no  cellular  22
#> 3289  51   blue-collar  married      no    7816     yes   no   unknown  12
#> 3290  53       retired  married      no    1296     yes   no   unknown  17
#> 3291  42    technician  married      no     246     yes   no telephone  12
#> 3292  33   blue-collar  married      no     478     yes   no  cellular   7
#> 3293  32   blue-collar   single      no    3845     yes   no  cellular  18
#> 3294  59   blue-collar divorced      no      61     yes   no  cellular  13
#> 3295  58    management divorced      no    3498      no   no  cellular  19
#> 3296  31    unemployed   single      no     167      no   no  cellular  20
#> 3297  69       retired  married      no     324      no   no  cellular   4
#> 3298  51   blue-collar   single      no      60      no   no   unknown   3
#> 3299  30    technician  married      no     616     yes   no  cellular   6
#> 3300  33    unemployed   single      no     617      no   no  cellular   2
#> 3301  34        admin.   single      no      18     yes   no  cellular   6
#> 3302  48    technician divorced      no    1290      no   no   unknown  16
#> 3303  45     housemaid  married      no     360      no   no  cellular   3
#> 3304  36   blue-collar  married      no    8135     yes   no   unknown  20
#> 3305  39    technician   single      no    1674      no   no  cellular  15
#> 3306  58    management  married      no    1016      no   no telephone  11
#> 3307  36   blue-collar   single      no    2235     yes   no  cellular  20
#> 3308  34      services  married      no    -451     yes  yes  cellular  23
#> 3309  36    management   single      no     124     yes   no telephone  24
#> 3310  40    management  married      no     752      no  yes   unknown  17
#> 3311  33    management   single      no     215     yes   no  cellular  28
#> 3312  55       retired  married      no    -185      no  yes telephone   2
#> 3313  45 self-employed  married      no    -124      no   no  cellular  25
#> 3314  31       student   single      no      93      no   no  cellular  19
#> 3315  51      services  married      no     144      no  yes   unknown  27
#> 3316  54    technician divorced      no     255     yes   no   unknown  27
#> 3317  48       retired  married      no    1591      no   no  cellular  31
#> 3318  28        admin. divorced      no     451     yes   no  cellular  13
#> 3319  57   blue-collar  married      no     162     yes   no   unknown   6
#> 3320  60       retired  married      no     597      no   no  cellular  15
#> 3321  51   blue-collar  married      no     230     yes   no  cellular  17
#> 3322  47        admin.  married      no      70     yes   no  cellular   5
#> 3323  40    management divorced      no     490     yes   no   unknown   7
#> 3324  43   blue-collar   single      no   13620     yes   no  cellular  20
#> 3325  50    unemployed  married      no    5164      no   no   unknown  12
#> 3326  41    technician  married      no    -329      no   no telephone   5
#> 3327  30    technician   single      no     419     yes  yes   unknown  28
#> 3328  45  entrepreneur  married      no    3133     yes  yes  cellular  10
#> 3329  23      services  married      no    2673     yes   no   unknown   5
#> 3330  31      services  married      no    1004      no   no  cellular   5
#> 3331  25        admin.   single      no     760     yes   no  cellular  27
#> 3332  34    management  married      no       0      no   no  cellular  22
#> 3333  55   blue-collar  married      no    3957      no  yes  cellular   4
#> 3334  29        admin.   single      no     428     yes  yes  cellular   7
#> 3335  58 self-employed  married      no     327      no  yes  cellular  14
#> 3336  30        admin.  married      no     401      no   no  cellular  19
#> 3337  51       unknown  married      no     167      no   no   unknown  18
#> 3338  32    management  married      no     258     yes  yes  cellular  18
#> 3339  28       student   single      no     970      no   no telephone   4
#> 3340  44    management  married      no     839      no   no  cellular   8
#> 3341  38     housemaid divorced      no    4312      no   no  cellular  15
#> 3342  57       retired  married      no    1408      no   no   unknown  21
#> 3343  34    management  married      no     581     yes   no   unknown  29
#> 3344  54   blue-collar divorced      no    1145     yes   no  cellular   7
#> 3345  33     housemaid  married      no      10     yes   no  cellular  20
#> 3346  34    management   single      no      84      no   no  cellular   5
#> 3347  55    technician  married      no      77     yes   no   unknown  23
#> 3348  52      services  married      no      -1      no  yes   unknown  26
#> 3349  38    management  married      no     389     yes   no   unknown   6
#> 3350  55        admin.  married      no     183     yes   no   unknown   6
#> 3351  45    technician  married      no    1441     yes   no  cellular  18
#> 3352  36   blue-collar  married      no     975     yes   no  cellular   7
#> 3353  56      services   single      no     -40     yes   no  cellular  15
#> 3354  38        admin.  married      no     545      no   no   unknown  12
#> 3355  29    management  married      no      55     yes   no  cellular  10
#> 3356  30   blue-collar  married      no    5956     yes  yes  cellular  20
#> 3357  28      services  married      no    1214      no   no   unknown  28
#> 3358  56    management  married      no    7747      no   no   unknown   5
#> 3359  49   blue-collar  married      no    3028     yes   no  cellular  12
#> 3360  58       retired divorced      no    5253      no   no  cellular   9
#> 3361  59       retired  married      no    3382     yes   no   unknown  13
#> 3362  36    management   single      no     442     yes  yes  cellular  29
#> 3363  53    management  married      no    7067      no   no   unknown   6
#> 3364  55   blue-collar  married      no     135     yes   no  cellular  15
#> 3365  33   blue-collar divorced      no    -131     yes   no   unknown  16
#> 3366  48   blue-collar  married      no     893      no   no  cellular  13
#> 3367  32   blue-collar  married      no       0     yes  yes  cellular  28
#> 3368  26    management   single      no    1438      no   no  cellular  27
#> 3369  56    unemployed divorced      no     282      no   no  cellular  28
#> 3370  32   blue-collar   single      no      53     yes   no  cellular  18
#> 3371  50      services   single      no     321      no   no telephone  22
#> 3372  40  entrepreneur  married      no    1089     yes  yes   unknown  13
#> 3373  46      services  married      no     244      no   no  cellular  21
#> 3374  36  entrepreneur  married      no     546      no   no  cellular   9
#> 3375  48    management  married      no    4006      no   no  cellular  25
#> 3376  54     housemaid divorced      no    1241      no   no   unknown  20
#> 3377  52    management  married      no     324      no   no  cellular   9
#> 3378  38   blue-collar  married      no     190     yes   no telephone  19
#> 3379  41   blue-collar  married      no    1885     yes   no  cellular   7
#> 3380  37    management  married      no     142      no   no   unknown  20
#> 3381  33      services  married      no      39     yes   no   unknown   4
#> 3382  54    technician divorced      no    2156     yes   no  cellular   3
#> 3383  30    technician  married      no    -287     yes   no  cellular  14
#> 3384  45    technician  married      no    2359      no   no  cellular  18
#> 3385  68       retired  married      no    1316      no   no telephone   4
#> 3386  25      services   single      no    -439     yes   no   unknown  12
#> 3387  27   blue-collar  married      no       0      no   no telephone   2
#> 3388  44   blue-collar  married      no    1071     yes   no  cellular  11
#> 3389  27    management   single      no     831     yes   no  cellular  21
#> 3390  29   blue-collar   single      no     445     yes   no   unknown  21
#> 3391  37      services   single      no     253     yes  yes   unknown   9
#> 3392  52        admin.  married      no    -462     yes   no  cellular   9
#> 3393  58       retired  married      no    1241      no   no  cellular  18
#> 3394  58    management divorced      no    2986      no   no  cellular  16
#> 3395  37   blue-collar  married      no     131     yes   no   unknown   9
#> 3396  37   blue-collar  married      no     -29     yes  yes  cellular  15
#> 3397  30        admin.   single      no    1223     yes   no  cellular  30
#> 3398  34     housemaid   single      no    1408     yes   no   unknown  23
#> 3399  26    technician   single      no       7     yes   no  cellular  22
#> 3400  55    management   single      no     111      no   no  cellular  16
#> 3401  58       retired  married      no     630      no   no   unknown   9
#> 3402  40    management divorced      no     823      no   no  cellular  13
#> 3403  32    management   single      no    1131     yes   no   unknown  20
#> 3404  51        admin.   single      no     895      no   no  cellular  23
#> 3405  45  entrepreneur  married      no    4688      no   no  cellular   7
#> 3406  57       retired divorced      no     720      no   no telephone  17
#> 3407  57       retired  married      no     478      no   no  cellular  30
#> 3408  54   blue-collar divorced      no     190     yes   no   unknown  15
#> 3409  30    technician  married      no       0     yes   no   unknown  23
#> 3410  40      services  married      no    1358      no   no   unknown  19
#> 3411  53    management   single      no       0      no   no   unknown  20
#> 3412  33    technician  married     yes      72     yes   no   unknown   6
#> 3413  40    technician   single      no      34      no   no  cellular  20
#> 3414  41    management   single      no    1253      no   no  cellular  21
#> 3415  50    management  married      no    2488     yes   no   unknown  29
#> 3416  31        admin.   single      no     253     yes   no  cellular  13
#> 3417  49        admin.  married      no    1101      no   no  cellular  18
#> 3418  41    technician  married      no     634      no   no  cellular   7
#> 3419  60    technician  married      no    4243     yes   no  cellular   4
#> 3420  34    technician  married      no    2069      no   no  cellular  20
#> 3421  32    technician  married      no    1879      no   no   unknown  19
#> 3422  53       retired  married      no     357      no   no   unknown  18
#> 3423  34   blue-collar  married      no     277      no  yes   unknown   3
#> 3424  29        admin.   single      no     171     yes   no   unknown  11
#> 3425  38   blue-collar  married      no      35     yes   no   unknown  28
#> 3426  31    technician   single      no     127     yes   no  cellular  16
#> 3427  37   blue-collar  married      no    5643     yes   no   unknown  21
#> 3428  30      services   single      no     148      no  yes  cellular   7
#> 3429  32   blue-collar   single      no      18     yes  yes  cellular   6
#> 3430  30 self-employed   single      no     280      no   no telephone   5
#> 3431  41    technician  married      no     354      no   no  cellular  29
#> 3432  47    management  married      no    1493      no   no  cellular  31
#> 3433  34    technician   single      no    1866      no   no  cellular   4
#> 3434  38   blue-collar  married      no    1165     yes   no  cellular  13
#> 3435  41    technician divorced      no    1545      no  yes  cellular  13
#> 3436  27    technician   single      no     434     yes   no   unknown  13
#> 3437  33       student  married      no     476     yes   no  cellular  12
#> 3438  38      services   single      no     322     yes   no   unknown  26
#> 3439  41    management  married      no    2031     yes   no   unknown  20
#> 3440  37    unemployed divorced      no      74     yes   no   unknown   7
#> 3441  26    management   single      no    1720      no   no  cellular   3
#> 3442  36      services  married      no       0     yes   no  cellular   6
#> 3443  28       student  married      no     327     yes   no  cellular  15
#> 3444  59    management  married      no     101      no  yes   unknown   9
#> 3445  35    management   single      no    4788     yes   no   unknown   3
#> 3446  43       unknown   single      no     181      no   no telephone  28
#> 3447  50   blue-collar divorced      no    -333      no  yes  cellular  30
#> 3448  24      services   single      no       0      no   no   unknown  16
#> 3449  32    technician  married      no     500      no   no  cellular   6
#> 3450  41    technician  married      no    1043     yes  yes   unknown  14
#> 3451  39    management  married      no     399      no   no  cellular   9
#> 3452  50       retired   single      no     208      no   no   unknown   9
#> 3453  40    management  married      no    1576     yes  yes   unknown  29
#> 3454  50    management  married      no     346      no   no  cellular   4
#> 3455  63   blue-collar  married      no     641      no   no  cellular  27
#> 3456  31    technician divorced      no     105     yes   no  cellular  16
#> 3457  34      services  married      no    1337      no   no  cellular  12
#> 3458  28   blue-collar   single      no     121      no   no  cellular   4
#> 3459  32    technician  married      no    -410     yes  yes  cellular  12
#> 3460  32   blue-collar  married     yes      -1     yes   no   unknown   9
#> 3461  52      services  married      no    -585     yes  yes   unknown  27
#> 3462  43       unknown  married      no    2113      no   no  cellular  29
#> 3463  43    unemployed  married      no      58     yes   no  cellular   9
#> 3464  23    management   single      no      85     yes   no   unknown  19
#> 3465  47    technician  married      no    1115     yes   no telephone  23
#> 3466  52    management  married      no    4173      no  yes  cellular  21
#> 3467  37 self-employed  married      no    2203      no  yes  cellular   5
#> 3468  31    management   single      no      15      no   no  cellular  11
#> 3469  40     housemaid  married      no    4136     yes   no  cellular  11
#> 3470  42    management  married      no     261      no   no  cellular  27
#> 3471  33   blue-collar  married      no     392     yes   no   unknown  23
#> 3472  40       retired   single      no    1400      no   no   unknown  20
#> 3473  51    management  married      no     615     yes   no  cellular  17
#> 3474  53    unemployed   single      no       4      no   no  cellular  30
#> 3475  36    management   single      no     339      no   no  cellular  21
#> 3476  34    technician  married      no    1553      no   no  cellular  20
#> 3477  30    management  married      no      14      no   no  cellular  24
#> 3478  29   blue-collar  married      no     258     yes   no   unknown  26
#> 3479  38        admin.  married      no       3     yes  yes   unknown   5
#> 3480  41   blue-collar  married      no     620      no   no  cellular  28
#> 3481  33    management   single      no     -67     yes   no   unknown   5
#> 3482  28      services   single      no     430     yes   no  cellular   8
#> 3483  47       unknown  married      no     270      no   no  cellular   6
#> 3484  36        admin.   single      no    1328      no   no  cellular  30
#> 3485  57   blue-collar  married      no      93     yes   no telephone  17
#> 3486  36    management  married      no    1825     yes   no  cellular  14
#> 3487  51    technician  married      no     573     yes  yes   unknown  14
#> 3488  51   blue-collar  married      no     541      no   no  cellular  11
#> 3489  40   blue-collar  married      no    2133     yes  yes  cellular   6
#> 3490  45    technician   single      no     410     yes   no   unknown  30
#> 3491  52        admin.  married      no    2347      no  yes  cellular  12
#> 3492  35  entrepreneur   single      no     145     yes   no  cellular  18
#> 3493  33    unemployed  married     yes    -108     yes  yes  cellular  19
#> 3494  38        admin. divorced      no     382     yes   no  cellular  17
#> 3495  36   blue-collar  married      no      13      no   no   unknown   3
#> 3496  75       retired  married      no    3504      no   no telephone   9
#> 3497  31        admin.   single      no    1801     yes   no  cellular  12
#> 3498  33    management   single      no    1308      no   no  cellular   7
#> 3499  31   blue-collar  married      no     136      no   no  cellular  12
#> 3500  56    unemployed  married      no      12      no   no  cellular  12
#> 3501  37    technician  married      no    -421     yes   no   unknown   6
#> 3502  33    management   single      no    1271     yes   no  cellular  15
#> 3503  30    technician  married      no    -910     yes   no  cellular  15
#> 3504  56      services  married      no    1150      no  yes  cellular  17
#> 3505  35   blue-collar  married      no    -102     yes   no  cellular  14
#> 3506  56       unknown  married      no     778      no   no   unknown  20
#> 3507  58      services  married      no      74      no   no  cellular  29
#> 3508  67 self-employed  married      no    1979      no   no  cellular  10
#> 3509  38    management  married      no       0     yes   no telephone  12
#> 3510  37    management divorced     yes      -1     yes  yes  cellular   7
#> 3511  57   blue-collar  married      no    8195     yes   no   unknown  19
#> 3512  35  entrepreneur  married      no      24     yes   no   unknown  20
#> 3513  27   blue-collar   single      no       1     yes   no  cellular  18
#> 3514  33    management  married      no     801      no   no  cellular  19
#> 3515  37   blue-collar  married      no    3517     yes   no   unknown  23
#> 3516  37    management  married      no     222     yes   no  cellular  20
#> 3517  56       retired  married      no    1906      no  yes   unknown  19
#> 3518  55        admin.  married      no     128      no   no  cellular  20
#> 3519  40   blue-collar  married      no       0     yes   no   unknown   3
#> 3520  41   blue-collar  married      no    5560     yes   no  cellular  12
#> 3521  27   blue-collar  married      no     613     yes   no   unknown  19
#> 3522  49    management  married      no   17432      no   no  cellular  17
#> 3523  54    management divorced      no    1692     yes   no  cellular  29
#> 3524  42 self-employed  married      no    1385      no   no  cellular  25
#> 3525  34    technician   single      no       0      no   no  cellular  28
#> 3526  34    technician  married      no     932     yes   no  cellular   4
#> 3527  38        admin.  married      no     257     yes   no  cellular  15
#> 3528  33  entrepreneur  married     yes     -54      no  yes  cellular   8
#> 3529  26   blue-collar  married      no     818      no   no  cellular   9
#> 3530  35   blue-collar  married      no    1257     yes   no  cellular  20
#> 3531  48    management   single      no      61     yes   no   unknown  28
#> 3532  64       retired  married      no     380      no   no  cellular  25
#> 3533  31        admin.  married      no    1229      no   no  cellular  12
#> 3534  39      services  married      no    1970     yes   no   unknown   8
#> 3535  38    management  married      no       0     yes   no   unknown  20
#> 3536  40   blue-collar  married      no    2562     yes   no   unknown  15
#> 3537  49   blue-collar  married     yes     -98     yes   no  cellular  20
#> 3538  36    management  married      no    1604     yes   no   unknown  11
#> 3539  51       unknown  married      no    1585      no   no telephone  30
#> 3540  58    technician   single      no     409      no  yes  cellular  14
#> 3541  33    technician   single      no    2481      no   no  cellular  12
#> 3542  28   blue-collar   single      no    2845     yes   no   unknown  12
#> 3543  42   blue-collar  married      no    1320      no   no   unknown  15
#> 3544  52 self-employed  married      no       9      no  yes   unknown   6
#> 3545  54    management divorced      no     496      no   no  cellular  13
#> 3546  60       retired divorced      no     514      no   no  cellular  16
#> 3547  31        admin.   single      no      40      no   no  cellular   4
#> 3548  32   blue-collar   single      no     760     yes   no  cellular  16
#> 3549  53        admin.  married      no    1796      no   no telephone   5
#> 3550  28 self-employed   single      no       0     yes   no  cellular  21
#> 3551  47    technician  married      no     834      no  yes  cellular  21
#> 3552  29   blue-collar   single      no    -138     yes  yes   unknown   8
#> 3553  78       retired  married      no    3208      no   no telephone  20
#> 3554  43  entrepreneur  married      no      59      no   no   unknown  13
#> 3555  27        admin.  married      no      73      no   no  cellular  10
#> 3556  51   blue-collar  married      no       0     yes   no  cellular  10
#> 3557  52   blue-collar  married      no     -27      no   no  cellular  28
#> 3558  49 self-employed  married      no     358     yes  yes   unknown  13
#> 3559  35      services  married      no    1659     yes   no  cellular   3
#> 3560  58      services  married      no    1667     yes  yes   unknown   6
#> 3561  36    management  married      no     255      no   no  cellular  25
#> 3562  58   blue-collar  married      no    2592     yes   no   unknown  25
#> 3563  51     housemaid  married      no    1275      no   no   unknown   6
#> 3564  42    technician  married      no    3228      no   no  cellular  21
#> 3565  37    management  married      no    2401      no   no  cellular   6
#> 3566  44   blue-collar  married      no    3610     yes   no   unknown  29
#> 3567  38   blue-collar divorced      no     727     yes   no   unknown  16
#> 3568  34   blue-collar  married      no     452     yes   no   unknown  15
#> 3569  31    unemployed   single      no    1489     yes   no  cellular   3
#> 3570  32      services   single      no      81     yes   no   unknown   7
#> 3571  54    management divorced      no    -125      no  yes  cellular   8
#> 3572  38   blue-collar   single      no     162     yes   no   unknown   8
#> 3573  40     housemaid  married      no     864      no   no  cellular  14
#> 3574  30      services   single      no     187     yes   no   unknown  23
#> 3575  43  entrepreneur  married      no       0      no   no telephone  24
#> 3576  39    management  married      no   21111     yes   no   unknown  26
#> 3577  29    management   single      no      21     yes   no  cellular  14
#> 3578  46   blue-collar   single      no      76     yes   no   unknown   7
#> 3579  28    technician   single      no     154     yes   no  cellular  18
#> 3580  50    management  married      no    4654      no   no  cellular  17
#> 3581  29    technician   single      no     359     yes   no  cellular   8
#> 3582  39   blue-collar  married      no     648     yes   no  cellular  29
#> 3583  38    technician  married      no       0     yes   no  cellular  22
#> 3584  57    unemployed  married      no    5126     yes   no  cellular   2
#> 3585  54 self-employed divorced      no     351     yes   no   unknown   6
#> 3586  52      services  married      no     540     yes   no  cellular  11
#> 3587  50 self-employed  married      no       0     yes   no telephone  12
#> 3588  30    technician   single      no      18      no   no   unknown  19
#> 3589  49    management  married      no     350      no   no  cellular  12
#> 3590  40        admin.   single      no     419      no  yes  cellular  28
#> 3591  42   blue-collar   single      no     419      no   no  cellular   7
#> 3592  52    management  married      no    4675      no   no  cellular  12
#> 3593  31    technician  married      no    3192     yes   no  cellular   7
#> 3594  33 self-employed   single      no    4996      no   no  cellular  20
#> 3595  26    technician   single      no     174     yes   no   unknown  30
#> 3596  36   blue-collar   single      no     507     yes   no  cellular  22
#> 3597  29    management   single      no       0     yes   no  cellular  22
#> 3598  42   blue-collar  married      no    1657     yes  yes  cellular  17
#> 3599  47    technician  married      no    2394      no  yes   unknown  20
#> 3600  33    management   single      no    -298      no   no  cellular  22
#> 3601  34        admin.  married      no     -44     yes  yes  cellular  17
#> 3602  57    technician  married      no    1070      no   no   unknown  19
#> 3603  36   blue-collar  married      no     274     yes   no   unknown  16
#> 3604  57        admin.  married      no   16873      no   no  cellular  14
#> 3605  36        admin.  married      no     786     yes  yes  cellular  10
#> 3606  29    technician   single      no     525     yes   no  cellular  16
#> 3607  32    technician   single      no      35      no   no  cellular  28
#> 3608  30        admin.   single      no     223     yes   no   unknown   6
#> 3609  41        admin.  married      no    -306     yes   no   unknown  15
#> 3610  50    management  married      no     463      no  yes  cellular  17
#> 3611  50    technician divorced      no     636     yes   no  cellular   6
#> 3612  41    unemployed divorced      no     487      no   no  cellular  16
#> 3613  36    management  married      no     873     yes   no   unknown  21
#> 3614  35    management  married      no     267     yes   no   unknown   7
#> 3615  63   blue-collar  married      no     115      no   no telephone  27
#> 3616  25    technician   single      no     -55     yes  yes  cellular   7
#> 3617  33   blue-collar  married      no       0     yes  yes   unknown  20
#> 3618  37      services  married      no    4760     yes   no  cellular  20
#> 3619  28  entrepreneur   single      no     219     yes   no   unknown  27
#> 3620  43   blue-collar  married      no     232     yes   no telephone   8
#> 3621  34   blue-collar  married      no       0     yes   no  cellular  17
#> 3622  26    technician   single      no    -525     yes  yes  cellular  22
#> 3623  57    technician  married      no      -1      no   no   unknown  14
#> 3624  20       student   single      no    1191      no   no  cellular  28
#> 3625  52    management  married      no    7192      no   no  cellular   4
#> 3626  39      services   single      no     410      no   no   unknown  19
#> 3627  32      services  married      no       0     yes   no  cellular  28
#> 3628  54        admin.   single      no      15     yes   no  cellular   4
#> 3629  39      services  married      no      18     yes  yes  cellular  20
#> 3630  31   blue-collar   single      no     530      no  yes  cellular  18
#> 3631  25       student   single      no     715      no   no  cellular  26
#> 3632  59    technician  married      no     478      no   no  cellular  11
#> 3633  39        admin.   single      no     470     yes   no   unknown  20
#> 3634  47    technician  married      no      11      no   no  cellular  20
#> 3635  22      services   single      no      35     yes   no   unknown  28
#> 3636  26    unemployed   single      no    3511      no   no  cellular  30
#> 3637  37      services  married      no     655      no   no  cellular  13
#> 3638  52      services divorced      no      43     yes  yes  cellular  11
#> 3639  28        admin.   single      no     392     yes  yes  cellular   4
#> 3640  46      services  married      no       0     yes   no  cellular  22
#> 3641  30        admin.   single      no     523      no  yes  cellular   3
#> 3642  30    technician  married      no    1338     yes  yes  cellular  10
#> 3643  34        admin.   single      no     239      no   no   unknown   5
#> 3644  51     housemaid  married      no    1521      no   no   unknown   6
#> 3645  46  entrepreneur  married      no       0     yes  yes  cellular   6
#> 3646  70       retired  married      no    2815      no   no  cellular  26
#> 3647  41    technician  married      no       0      no   no   unknown  20
#> 3648  32    technician   single      no       0     yes   no   unknown  21
#> 3649  32   blue-collar   single      no      60     yes   no  cellular  28
#> 3650  50    management  married      no       0     yes   no  cellular  19
#> 3651  38        admin.  married      no     505     yes  yes   unknown  17
#> 3652  32        admin.   single      no    8866      no   no  cellular  18
#> 3653  30   blue-collar   single      no    1472     yes   no  cellular  20
#> 3654  39   blue-collar  married      no     -99      no   no  cellular  17
#> 3655  30    technician   single      no    2731     yes   no  cellular  14
#> 3656  44  entrepreneur  married      no    -165     yes  yes   unknown   4
#> 3657  45   blue-collar  married      no    2128     yes   no   unknown  19
#> 3658  56 self-employed  married      no     800      no  yes  cellular   9
#> 3659  37    management  married      no    1330     yes   no  cellular  29
#> 3660  30   blue-collar  married      no     837     yes   no  cellular  15
#> 3661  54      services  married      no       8     yes   no  cellular  14
#> 3662  53        admin.  married      no    -375     yes   no   unknown  23
#> 3663  27       student   single      no    5169     yes   no  cellular   3
#> 3664  36    management  married      no     162     yes   no  cellular   8
#> 3665  43  entrepreneur   single      no      42      no   no  cellular   7
#> 3666  52     housemaid  married      no     335      no   no  cellular  22
#> 3667  48   blue-collar  married      no   10724      no   no   unknown  20
#> 3668  39    management   single      no     416      no   no  cellular  23
#> 3669  35   blue-collar  married      no    4822     yes   no   unknown  20
#> 3670  76       retired divorced      no    3049      no   no  cellular  24
#> 3671  40      services  married      no     191     yes   no  cellular  18
#> 3672  57       retired  married      no    4908      no   no  cellular  30
#> 3673  59   blue-collar  married      no    -546      no   no  cellular  25
#> 3674  45     housemaid  married      no     698     yes   no   unknown  17
#> 3675  37    technician  married      no     143      no   no  cellular  27
#> 3676  28    technician   single      no    -481     yes  yes  cellular   2
#> 3677  57    unemployed  married      no    3867     yes   no   unknown  12
#> 3678  45   blue-collar  married      no     292     yes   no  cellular  29
#> 3679  58     housemaid  married      no    4605      no   no  cellular  11
#> 3680  30   blue-collar  married      no    -529     yes   no  cellular  12
#> 3681  48   blue-collar  married      no    1738     yes   no  cellular  15
#> 3682  61 self-employed  married      no    4162      no   no  cellular  10
#> 3683  34    management   single      no     524      no   no   unknown  13
#> 3684  43    technician divorced      no     101      no   no  cellular  19
#> 3685  44    technician   single      no    2403     yes   no   unknown  30
#> 3686  29   blue-collar  married      no      50      no   no  cellular   8
#> 3687  37   blue-collar  married      no     357     yes   no  cellular  15
#> 3688  41    unemployed divorced      no    1281      no   no  cellular  31
#> 3689  34    technician  married      no    1795     yes   no  cellular  29
#> 3690  40   blue-collar  married      no      98     yes   no   unknown   2
#> 3691  59 self-employed  married      no    2013      no   no  cellular  17
#> 3692  35 self-employed  married      no     506      no   no  cellular  27
#> 3693  58    management divorced      no    1573     yes  yes  cellular  17
#> 3694  20      services   single      no    -103     yes   no   unknown  13
#> 3695  55    technician divorced      no     184      no   no   unknown  13
#> 3696  51   blue-collar  married      no     955      no  yes  cellular  17
#> 3697  31 self-employed   single      no    1788      no   no  cellular  27
#> 3698  52    management  married      no     547      no   no  cellular   5
#> 3699  31    management   single      no      62     yes   no  cellular  18
#> 3700  34   blue-collar  married      no    1575     yes   no   unknown  27
#> 3701  32    management   single      no     623      no   no  cellular   6
#> 3702  36        admin.   single      no      47      no  yes  cellular   9
#> 3703  41   blue-collar  married      no    1293      no   no telephone  31
#> 3704  34   blue-collar  married      no    1221     yes   no  cellular   6
#> 3705  25   blue-collar   single      no    -143     yes  yes   unknown  27
#> 3706  44    unemployed divorced      no     757      no   no   unknown  30
#> 3707  52   blue-collar  married      no     -98     yes   no   unknown   7
#> 3708  34    management   single      no    -292     yes   no  cellular  11
#> 3709  31   blue-collar  married      no     347      no   no telephone  20
#> 3710  57        admin.  married      no    5888      no  yes   unknown  11
#> 3711  29        admin.   single      no      41     yes   no  cellular  13
#> 3712  27    technician   single      no     372     yes  yes  cellular  25
#> 3713  37    management divorced      no     481     yes   no  cellular  19
#> 3714  35    technician  married      no     650     yes   no  cellular  14
#> 3715  59      services  married      no      33     yes   no  cellular  11
#> 3716  31        admin.   single      no     358     yes   no   unknown  15
#> 3717  56        admin.  married      no     370      no   no  cellular  26
#> 3718  30      services   single      no     179     yes   no   unknown  29
#> 3719  30        admin.   single      no     239     yes   no  cellular   7
#> 3720  32    management  married      no     393      no   no  cellular  28
#> 3721  39      services  married      no     949     yes   no  cellular  29
#> 3722  46 self-employed  married      no     917      no   no  cellular   9
#> 3723  29    management   single      no     765      no   no  cellular  16
#> 3724  57    technician  married      no       0      no   no   unknown  20
#> 3725  46        admin. divorced      no    -637     yes   no  cellular  17
#> 3726  37    unemployed  married      no    3051     yes   no  cellular  20
#> 3727  55    management divorced      no    5399      no  yes  cellular  30
#> 3728  42   blue-collar  married      no     -10     yes   no   unknown   9
#> 3729  53    unemployed  married      no    2248     yes   no  cellular  30
#> 3730  40   blue-collar  married      no     718     yes  yes telephone  13
#> 3731  32      services   single      no     385     yes   no  cellular  14
#> 3732  44    management  married      no    6203     yes  yes   unknown  13
#> 3733  60     housemaid  married      no    1043      no   no  cellular  18
#> 3734  24       student   single      no    1847      no   no  cellular   9
#> 3735  41   blue-collar  married      no     348     yes   no   unknown  14
#> 3736  40        admin.  married      no     100     yes   no  cellular   9
#> 3737  31   blue-collar  married      no    4728     yes   no  cellular  19
#> 3738  35  entrepreneur   single      no      16      no   no  cellular  17
#> 3739  32   blue-collar  married      no     157     yes   no   unknown  20
#> 3740  32   blue-collar  married      no      14     yes   no   unknown   2
#> 3741  39    management  married     yes      47      no   no  cellular  21
#> 3742  40   blue-collar   single      no     446     yes   no  cellular   8
#> 3743  39   blue-collar divorced      no      94     yes   no   unknown  29
#> 3744  36    management divorced      no     563      no   no   unknown  20
#> 3745  40    management  married      no    1468      no   no  cellular   8
#> 3746  60       retired  married      no      60     yes   no   unknown   5
#> 3747  52     housemaid  married      no    1466      no  yes  cellular  20
#> 3748  42    technician   single      no    -411     yes   no  cellular  12
#> 3749  39    management divorced      no     132     yes   no  cellular   9
#> 3750  31   blue-collar  married      no     990     yes  yes  cellular   7
#> 3751  57      services  married      no       4      no   no  cellular  21
#> 3752  30      services   single      no    3405      no   no  cellular  29
#> 3753  30    technician   single      no     106     yes   no  cellular  13
#> 3754  69       retired divorced      no    6850      no   no telephone   3
#> 3755  39    management   single      no    1877     yes   no   unknown   6
#> 3756  27        admin. divorced      no       0      no  yes  cellular  14
#> 3757  30  entrepreneur   single      no     -63     yes   no   unknown   3
#> 3758  35        admin.  married      no      69     yes  yes   unknown   6
#> 3759  41    unemployed  married      no     819      no   no  cellular   9
#> 3760  41        admin. divorced      no    2970      no  yes   unknown  27
#> 3761  32  entrepreneur  married      no     604      no   no  cellular  29
#> 3762  32   blue-collar   single      no    2093      no   no  cellular  24
#> 3763  56    unemployed  married      no    2629      no   no  cellular  16
#> 3764  28    management   single      no     672      no   no  cellular   4
#> 3765  30      services   single      no     862     yes  yes   unknown  20
#> 3766  44    management  married      no    3091     yes   no   unknown  17
#> 3767  43        admin. divorced      no    3350     yes  yes   unknown  29
#> 3768  37    management  married      no     156      no   no  cellular  19
#> 3769  27      services   single      no     118     yes  yes   unknown  12
#> 3770  48    unemployed  married      no    5462      no   no   unknown   6
#> 3771  28    management   single      no     866      no   no  cellular  23
#> 3772  41   blue-collar  married      no    2689     yes   no  cellular  15
#> 3773  27   blue-collar   single      no    3675      no   no   unknown  12
#> 3774  29   blue-collar  married      no       0     yes   no  cellular  16
#> 3775  37     housemaid  married      no     589     yes   no  cellular  25
#> 3776  39    technician  married      no     697      no   no  cellular  15
#> 3777  34    management   single      no    1040     yes   no   unknown  20
#> 3778  39    technician  married      no     394      no   no  cellular  11
#> 3779  69     housemaid  married      no    1080      no   no  cellular  22
#> 3780  39   blue-collar   single      no     254      no   no  cellular  27
#> 3781  35        admin.   single      no     663     yes   no  cellular   2
#> 3782  34    technician  married     yes      91      no   no  cellular  29
#> 3783  35      services   single      no     313     yes   no  cellular  11
#> 3784  32   blue-collar  married      no    3166     yes   no  cellular  20
#> 3785  33    management   single      no    3655      no   no  cellular  19
#> 3786  39   blue-collar  married      no     599     yes   no   unknown   6
#> 3787  37     housemaid  married      no    1558      no   no  cellular   6
#> 3788  31   blue-collar   single      no     573     yes   no telephone   5
#> 3789  37    technician  married      no      41      no   no  cellular  29
#> 3790  39   blue-collar  married      no   10483      no   no   unknown   9
#> 3791  35   blue-collar  married      no     628     yes   no   unknown  29
#> 3792  38      services  married      no     309      no   no   unknown  12
#> 3793  37    management   single      no     715     yes   no   unknown  20
#> 3794  32        admin. divorced      no     281     yes   no   unknown   8
#> 3795  41    management   single      no    4594     yes   no   unknown   4
#> 3796  49    technician  married      no    2344     yes   no   unknown  30
#> 3797  52    technician  married      no     234      no   no  cellular  17
#> 3798  38  entrepreneur  married      no    3249     yes   no   unknown   2
#> 3799  57   blue-collar  married      no     668      no   no telephone  17
#> 3800  28        admin.   single      no    -103     yes   no   unknown  12
#> 3801  46      services  married      no    -780      no  yes  cellular   5
#> 3802  47   blue-collar  married      no    1533      no  yes  cellular  18
#> 3803  43   blue-collar  married      no     704     yes   no telephone  11
#> 3804  35      services  married      no    2918      no  yes  cellular  16
#> 3805  30  entrepreneur  married      no    1539     yes  yes   unknown  27
#> 3806  39   blue-collar divorced      no     241     yes   no  cellular  18
#> 3807  54    technician  married      no      87     yes   no  cellular  12
#> 3808  56       retired divorced      no       4      no   no   unknown  17
#> 3809  43    management divorced      no    7702      no   no  cellular  22
#> 3810  38      services  married      no       0     yes  yes  cellular  11
#> 3811  40    technician  married      no     335     yes   no   unknown   2
#> 3812  33    management  married      no     271     yes   no  cellular  13
#> 3813  27   blue-collar  married      no     373     yes   no   unknown   4
#> 3814  43    technician  married      no     629      no   no  cellular   5
#> 3815  44    management  married      no      58     yes   no  cellular  14
#> 3816  32    management   single      no    2629      no   no  cellular  28
#> 3817  52    management  married      no       0      no   no  cellular  30
#> 3818  64       retired  married      no     466     yes   no  cellular  18
#> 3819  48    technician   single      no     540     yes   no  cellular  17
#> 3820  36    technician  married      no    1327      no   no  cellular  29
#> 3821  47 self-employed  married      no       0      no   no   unknown  26
#> 3822  41      services   single      no      92      no   no  cellular  21
#> 3823  38  entrepreneur   single      no     185      no   no  cellular   5
#> 3824  35    technician   single      no     399     yes   no  cellular  13
#> 3825  40    management divorced      no     290     yes   no   unknown  27
#> 3826  38        admin.  married      no    -650      no   no   unknown  16
#> 3827  45      services  married      no      22     yes   no   unknown   8
#> 3828  30      services  married      no     699     yes   no   unknown  29
#> 3829  49    technician  married      no       0      no  yes  cellular  28
#> 3830  46        admin.   single      no    1693     yes   no  cellular  20
#> 3831  37 self-employed  married      no     804     yes   no  cellular  19
#> 3832  36   blue-collar divorced      no    2843      no   no  cellular  14
#> 3833  37    management  married      no     393     yes   no  cellular  12
#> 3834  53   blue-collar  married      no    3815      no   no   unknown  24
#> 3835  38   blue-collar  married      no    4321      no   no  cellular  18
#> 3836  39       unknown   single      no       0      no   no   unknown   6
#> 3837  35    unemployed   single      no     145      no   no  cellular  17
#> 3838  47   blue-collar  married      no    -245     yes  yes   unknown  12
#> 3839  32    management   single      no   12686     yes   no   unknown   3
#> 3840  35    management  married      no    4943     yes   no  cellular  18
#> 3841  42    management  married      no     275      no   no   unknown   5
#> 3842  57       retired  married      no     573      no   no   unknown  20
#> 3843  38    unemployed  married      no     338      no   no   unknown  19
#> 3844  37        admin.  married      no       0     yes   no  cellular  22
#> 3845  59       retired  married      no    5521     yes  yes   unknown  13
#> 3846  40   blue-collar  married      no     598     yes   no  cellular  31
#> 3847  40    technician   single      no    2141      no   no  cellular  18
#> 3848  35   blue-collar  married      no     807     yes   no   unknown  29
#> 3849  35   blue-collar  married      no    2054     yes   no   unknown  20
#> 3850  39    unemployed  married      no    -455     yes   no   unknown  23
#> 3851  34    management  married      no     443      no   no  cellular  18
#> 3852  33   blue-collar   single      no   15341      no   no  cellular  20
#> 3853  38    management   single      no     673     yes   no   unknown   7
#> 3854  35    technician   single      no    2144     yes   no  cellular  30
#> 3855  44    technician  married      no     584      no   no  cellular  30
#> 3856  49    management  married      no    2037      no   no   unknown   5
#> 3857  45     housemaid divorced      no     221      no   no   unknown  12
#> 3858  30       student   single      no    4468      no   no  cellular   2
#> 3859  26        admin.  married      no    -401     yes  yes   unknown   4
#> 3860  33      services   single      no    1268     yes   no  cellular   6
#> 3861  32    technician   single      no    1107      no   no  cellular  27
#> 3862  55        admin.  married      no    1662      no   no  cellular   4
#> 3863  34    management  married      no    3301     yes   no  cellular  17
#> 3864  48   blue-collar divorced      no     183      no   no   unknown   9
#> 3865  46      services  married      no      53      no  yes  cellular  28
#> 3866  43    management  married      no      40      no   no  cellular  10
#> 3867  33   blue-collar  married      no     372     yes   no   unknown   6
#> 3868  47    management   single      no     124      no   no  cellular  29
#> 3869  33    management   single      no     417     yes   no  cellular   6
#> 3870  30   blue-collar  married      no   10395     yes   no  cellular  20
#> 3871  31      services  married     yes      29      no   no  cellular  21
#> 3872  31   blue-collar divorced      no       6     yes   no  cellular  29
#> 3873  41       retired   single      no    2579      no   no  cellular  27
#> 3874  37   blue-collar  married      no     204     yes   no   unknown  21
#> 3875  38   blue-collar  married      no       0      no   no   unknown  13
#> 3876  32   blue-collar  married      no     783     yes   no   unknown  21
#> 3877  40      services  married      no    2469      no  yes   unknown  19
#> 3878  55    technician  married      no    3207      no   no  cellular  28
#> 3879  53    technician  married      no     -46      no   no  cellular  29
#> 3880  42    management  married      no       0      no   no  cellular   6
#> 3881  34    management divorced      no     221      no   no  cellular   8
#> 3882  46    management  married      no    2466      no   no telephone   1
#> 3883  51    management  married      no    2455     yes   no  cellular  21
#> 3884  37    management  married      no     708     yes   no  cellular  27
#> 3885  54        admin.  married      no    1342     yes   no  cellular   2
#> 3886  40    technician  married      no       6     yes   no  cellular  16
#> 3887  37   blue-collar   single      no     292      no   no   unknown   8
#> 3888  33    management  married      no      62     yes   no  cellular   2
#> 3889  44        admin. divorced      no       0      no   no  cellular  17
#> 3890  46        admin.  married      no       0     yes   no  cellular  25
#> 3891  31    technician   single      no     696      no  yes  cellular  11
#> 3892  36    technician  married      no     465      no   no  cellular  14
#> 3893  34    technician   single      no       0      no   no  cellular  19
#> 3894  27      services  married      no      54     yes   no  cellular  18
#> 3895  44   blue-collar   single      no      36     yes   no  cellular  15
#> 3896  50        admin. divorced     yes    2405     yes   no  cellular   6
#> 3897  27    technician   single      no     555      no   no   unknown  11
#> 3898  40    technician   single      no     281     yes   no  cellular  11
#> 3899  52    technician   single      no      36     yes   no   unknown  16
#> 3900  30    technician  married      no     371      no   no  cellular   7
#> 3901  32     housemaid  married      no     216      no  yes  cellular   9
#> 3902  48   blue-collar   single      no     244     yes   no  cellular  15
#> 3903  33    technician divorced     yes       6      no   no  cellular  22
#> 3904  38    technician  married      no     634      no   no   unknown  19
#> 3905  25    technician  married      no     776     yes   no   unknown  27
#> 3906  31       student   single      no       0      no   no  cellular  22
#> 3907  46       unknown   single      no       0      no   no   unknown  17
#> 3908  57    management  married      no    7162      no   no  cellular  17
#> 3909  27   blue-collar  married      no    -413      no  yes   unknown  27
#> 3910  47    technician  married      no       0      no   no telephone  14
#> 3911  30   blue-collar   single      no      80     yes  yes  cellular   5
#> 3912  35    management   single      no       0      no   no  cellular  21
#> 3913  34   blue-collar  married      no     161     yes  yes   unknown  20
#> 3914  47    management  married      no       0     yes   no  cellular   4
#> 3915  29    technician   single      no     323      no   no  cellular   3
#> 3916  26   blue-collar  married      no     624     yes   no  cellular   5
#> 3917  34    management  married      no    1557     yes  yes   unknown  13
#> 3918  59       retired  married      no      56      no   no   unknown   5
#> 3919  38        admin.   single      no    3239      no   no   unknown   5
#> 3920  45   blue-collar  married      no    4022     yes   no  cellular  29
#> 3921  31    technician   single      no    4979      no  yes  cellular  27
#> 3922  31   blue-collar   single      no     509     yes   no   unknown  23
#> 3923  48    technician  married      no    1526      no   no  cellular   6
#> 3924  30    technician   single      no    2734      no   no  cellular  21
#> 3925  53  entrepreneur   single      no      62     yes   no   unknown  30
#> 3926  44    technician divorced      no    -865     yes   no  cellular  20
#> 3927  30    management  married      no     451      no   no  cellular   5
#> 3928  46  entrepreneur  married      no       0     yes  yes  cellular  29
#> 3929  28   blue-collar  married      no    1958     yes   no   unknown   3
#> 3930  33    management   single     yes      -5      no   no  cellular  18
#> 3931  38    technician   single      no      38      no   no   unknown  16
#> 3932  33   blue-collar  married      no     240     yes   no   unknown  21
#> 3933  52   blue-collar  married      no    2144     yes   no   unknown  30
#> 3934  32    technician divorced      no      53      no   no  cellular  22
#> 3935  39   blue-collar  married      no    7304     yes   no   unknown  28
#> 3936  32    management   single      no     813      no   no  cellular  28
#> 3937  55   blue-collar  married      no     828     yes   no   unknown  30
#> 3938  51   blue-collar  married      no   21614      no   no  cellular  29
#> 3939  82       retired  married      no     278      no   no  cellular  16
#> 3940  36   blue-collar  married      no      79     yes  yes  cellular   2
#> 3941  55     housemaid  married      no    2152      no   no   unknown  19
#> 3942  43   blue-collar  married      no    1311     yes   no   unknown  14
#> 3943  33        admin.  married      no    4012      no  yes   unknown   8
#> 3944  44    technician  married      no     564     yes   no  cellular  13
#> 3945  47      services  married      no       5      no   no  cellular  28
#> 3946  36   blue-collar  married      no     141     yes   no   unknown  23
#> 3947  32   blue-collar  married      no       4     yes  yes  cellular   8
#> 3948  60    technician  married      no    1139      no   no  cellular   6
#> 3949  59       retired  married      no    3079      no   no telephone  31
#> 3950  33   blue-collar  married     yes    -542     yes   no  cellular   6
#> 3951  35      services  married      no     618      no   no  cellular  12
#> 3952  48    management  married     yes     -13     yes   no  cellular  15
#> 3953  32   blue-collar  married      no    9714     yes   no  cellular  15
#> 3954  30      services   single      no    -114     yes   no  cellular  21
#> 3955  39    management  married      no    1802      no   no  cellular  20
#> 3956  41   blue-collar  married      no    1172     yes   no   unknown  15
#> 3957  54    technician divorced      no     447     yes   no   unknown  14
#> 3958  84       retired divorced      no    1680      no   no telephone   6
#> 3959  47     housemaid   single      no    3232      no   no telephone   6
#> 3960  28      services divorced      no      89      no   no   unknown   6
#> 3961  32   blue-collar  married      no    5075     yes   no telephone  20
#> 3962  55     housemaid divorced      no     603      no   no telephone  31
#> 3963  30   blue-collar  married      no     578     yes  yes  cellular  17
#> 3964  42    management  married      no    2187     yes   no  cellular  17
#> 3965  34    management   single      no    1891     yes   no   unknown   9
#> 3966  28    management   single      no     637     yes   no  cellular   4
#> 3967  35        admin.  married      no    3863     yes   no  cellular  20
#> 3968  34   blue-collar  married      no     152      no   no  cellular  25
#> 3969  33    management  married      no     110     yes  yes  cellular  17
#> 3970  40    management  married      no   24450      no   no  cellular  25
#> 3971  67       retired  married      no     696      no   no telephone   4
#> 3972  25    technician divorced      no    2317     yes   no  cellular   7
#> 3973  44    management   single      no     295     yes   no   unknown  12
#> 3974  32    management   single      no    2551     yes   no  cellular  21
#> 3975  28    technician   single      no     280     yes   no   unknown  14
#> 3976  28        admin.   single      no      -7      no  yes   unknown  26
#> 3977  51    technician  married      no      58     yes   no  cellular  17
#> 3978  29    technician   single      no      47     yes   no   unknown  16
#> 3979  50    management  married      no    5124     yes   no  cellular  18
#> 3980  32   blue-collar   single      no    -578      no   no   unknown   9
#> 3981  58   blue-collar  married      no    2516     yes   no  cellular  16
#> 3982  24      services  married      no       0     yes   no   unknown  27
#> 3983  52    technician  married      no     230     yes  yes  cellular  21
#> 3984  33  entrepreneur  married      no      82     yes   no  cellular  18
#> 3985  40    management  married      no     542     yes   no  cellular  20
#> 3986  37        admin.  married      no    1967      no   no  cellular  27
#> 3987  41      services  married      no     471     yes   no  cellular  13
#> 3988  32  entrepreneur  married      no    3083      no   no  cellular  22
#> 3989  43        admin.  married      no       0     yes   no  cellular  17
#> 3990  34        admin.  married      no      75     yes  yes  cellular  25
#> 3991  38  entrepreneur  married      no     680     yes   no   unknown  19
#> 3992  53    management divorced      no     443      no   no   unknown   9
#> 3993  52    management   single      no     556      no   no  cellular  13
#> 3994  40    management   single      no     269     yes   no  cellular  15
#> 3995  34        admin.  married      no    2552     yes  yes  cellular  25
#> 3996  30    management   single      no     112     yes   no   unknown   7
#> 3997  37    technician  married      no     135     yes   no  cellular  12
#> 3998  36       student   single      no     129      no   no  cellular  28
#> 3999  48    unemployed  married      no    1296      no   no  cellular   5
#> 4000  45   blue-collar   single     yes       0     yes   no  cellular  14
#> 4001  37   blue-collar divorced      no      33     yes   no   unknown   6
#> 4002  26       student   single      no     611      no   no  cellular  13
#> 4003  48        admin. divorced      no    1180      no   no  cellular  27
#> 4004  33    unemployed divorced      no     385      no   no telephone  27
#> 4005  24       student  married      no     146      no   no  cellular  26
#> 4006  60        admin. divorced      no     663      no  yes  cellular  30
#> 4007  35   blue-collar  married      no    1330      no   no  cellular  10
#> 4008  57    technician  married      no    3240     yes   no   unknown  14
#> 4009  56       retired  married      no      -1     yes   no   unknown   2
#> 4010  32  entrepreneur   single      no    1770      no  yes  cellular   4
#> 4011  43  entrepreneur  married      no     629     yes   no  cellular   2
#> 4012  48      services  married      no   11516      no   no   unknown  11
#> 4013  36    technician  married      no    4932     yes   no  cellular  21
#> 4014  38       retired   single      no      44      no   no   unknown  29
#> 4015  47    management  married      no    1122     yes   no  cellular  20
#> 4016  37        admin.  married      no    1123      no  yes   unknown  28
#> 4017  53  entrepreneur  married      no    1046     yes  yes  cellular  30
#> 4018  30    technician divorced      no    2262     yes   no   unknown  28
#> 4019  40    management   single      no    1509      no   no  cellular  15
#> 4020  50    management divorced      no     100     yes  yes  cellular  13
#> 4021  51    management  married      no    -516     yes   no  cellular  18
#> 4022  50    management  married     yes     421      no   no  cellular  20
#> 4023  36    technician   single      no     966      no   no  cellular   8
#> 4024  50        admin.   single      no     424     yes   no   unknown  12
#> 4025  31        admin.  married      no     879     yes   no  cellular  13
#> 4026  30    management  married      no     419     yes   no  cellular   4
#> 4027  68       retired  married      no    2820      no   no  cellular   3
#> 4028  29        admin.  married      no      26     yes   no   unknown  28
#> 4029  30   blue-collar  married      no    9194     yes   no   unknown  23
#> 4030  36    management  married      no    3770     yes   no  cellular  31
#> 4031  39   blue-collar  married      no     292      no   no   unknown  12
#> 4032  26 self-employed  married     yes     254     yes  yes  cellular  25
#> 4033  52   blue-collar   single      no     359     yes   no  cellular  30
#> 4034  33 self-employed  married      no     711     yes   no  cellular  18
#> 4035  32    technician   single      no     210     yes   no  cellular  16
#> 4036  43    management  married      no     657      no   no   unknown  18
#> 4037  50   blue-collar  married      no    9585     yes   no telephone  31
#> 4038  55       retired  married      no     103     yes  yes  cellular  17
#> 4039  47   blue-collar  married      no    1756     yes   no   unknown  16
#> 4040  40        admin.   single      no     739     yes   no   unknown  16
#> 4041  41     housemaid  married      no     876      no   no   unknown  19
#> 4042  28   blue-collar   single      no    2700      no   no  cellular   3
#> 4043  53   blue-collar  married      no     436     yes   no   unknown  29
#> 4044  31 self-employed  married      no    1015      no   no  cellular   8
#> 4045  32    management divorced      no     222      no  yes  cellular  15
#> 4046  35        admin.  married      no     214     yes  yes   unknown   5
#> 4047  38        admin. divorced      no     308     yes   no   unknown   6
#> 4048  29 self-employed   single      no    5406      no   no   unknown   9
#> 4049  34    technician   single      no    1259     yes   no  cellular   6
#> 4050  55    management  married      no     621      no  yes  cellular   2
#> 4051  33      services  married      no     703      no   no  cellular  18
#> 4052  33    technician   single      no     213      no   no  cellular  21
#> 4053  45    management divorced      no     959      no   no   unknown  18
#> 4054  31    management   single      no    1494      no   no  cellular  13
#> 4055  37    technician  married      no    1610      no   no   unknown  16
#> 4056  40    management  married      no     185      no   no  cellular  21
#> 4057  30    technician  married      no     455     yes   no  cellular  21
#> 4058  39    management divorced      no    5009     yes   no  cellular  15
#> 4059  50        admin.  married      no     167      no  yes  cellular  19
#> 4060  46     housemaid  married      no    1175      no   no  cellular   7
#> 4061  34    management   single      no     431      no   no  cellular  16
#> 4062  48    management divorced      no    1144     yes   no  cellular  17
#> 4063  48   blue-collar divorced      no      65     yes   no  cellular  14
#> 4064  27    unemployed   single      no     259     yes   no  cellular  18
#> 4065  44      services  married      no       3     yes   no  cellular   7
#> 4066  50    management  married      no   11528     yes   no   unknown  30
#> 4067  44    management  married      no     167      no   no  cellular  27
#> 4068  39    technician  married      no       0      no   no  cellular   6
#> 4069  38   blue-collar  married      no    2685      no   no   unknown  20
#> 4070  33      services   single      no     310     yes   no  cellular  12
#> 4071  48   blue-collar   single      no    1938     yes   no   unknown   4
#> 4072  30   blue-collar  married      no    4389     yes   no  cellular  30
#> 4073  24    technician   single      no     139      no   no  cellular  14
#> 4074  31      services  married      no     288      no   no  cellular  30
#> 4075  42   blue-collar  married      no       1      no   no  cellular  15
#> 4076  32    management   single      no   19985      no   no  cellular   9
#> 4077  59       retired divorced      no     337     yes   no   unknown  15
#> 4078  33    unemployed   single      no     177      no   no   unknown   8
#> 4079  40   blue-collar  married      no    3462     yes   no  cellular   9
#> 4080  28    technician  married      no      58     yes   no  cellular  14
#> 4081  35   blue-collar divorced      no     300     yes   no   unknown  13
#> 4082  47        admin.   single      no    3531     yes   no  cellular   7
#> 4083  44    management  married      no    6945      no   no  cellular  14
#> 4084  38    technician  married      no    1997     yes   no  cellular   6
#> 4085  52      services  married      no     145      no   no  cellular  22
#> 4086  33    technician  married      no    1126     yes   no   unknown   6
#> 4087  33        admin. divorced      no    1762     yes   no  cellular  19
#> 4088  59    technician  married      no     283      no   no  cellular  25
#> 4089  48    technician  married      no     150     yes   no  cellular   9
#> 4090  32   blue-collar   single      no       7     yes   no  cellular  13
#> 4091  35      services  married      no    1453     yes   no   unknown  28
#> 4092  51    management  married      no       0     yes   no  cellular  15
#> 4093  48      services   single      no    -139      no   no  cellular  13
#> 4094  43   blue-collar  married      no     408     yes   no   unknown  14
#> 4095  56    unemployed divorced      no     109      no   no  cellular  15
#> 4096  33    management   single      no    -359      no   no telephone  29
#> 4097  52    management divorced      no       0     yes  yes  cellular  30
#> 4098  38      services  married      no     129     yes   no  cellular   5
#> 4099  40 self-employed   single      no    1693     yes   no  cellular  17
#> 4100  28 self-employed   single      no     159      no   no  cellular  14
#> 4101  29   blue-collar  married      no     486     yes   no  cellular   6
#> 4102  26       student   single      no   13887      no   no  cellular  10
#> 4103  48    technician  married      no    1637     yes   no   unknown  11
#> 4104  45      services   single      no     482     yes  yes   unknown  30
#> 4105  24   blue-collar  married      no      32      no   no   unknown  13
#> 4106  40      services  married      no     939     yes   no  cellular  22
#> 4107  32    management  married      no     376     yes   no  cellular  23
#> 4108  42   blue-collar  married      no       0     yes  yes  cellular   7
#> 4109  35   blue-collar  married      no     360     yes   no telephone  20
#> 4110  31   blue-collar  married      no    9714     yes   no   unknown  19
#> 4111  58       retired   single      no     999      no   no  cellular  25
#> 4112  37    technician   single      no    1130      no   no  cellular  26
#> 4113  34   blue-collar  married      no    1710     yes  yes   unknown  19
#> 4114  36   blue-collar  married      no       0     yes   no   unknown   6
#> 4115  53        admin.  married      no     234     yes   no telephone  13
#> 4116  58   blue-collar  married      no       0      no   no  cellular  26
#> 4117  59    technician  married      no     135     yes  yes  cellular  23
#> 4118  46   blue-collar   single      no     332      no   no  cellular  30
#> 4119  49    technician divorced      no     229      no   no  cellular   8
#> 4120  62    management divorced      no    1619      no   no  cellular  19
#> 4121  34    technician   single     yes      -2      no  yes  cellular   8
#> 4122  34    management  married      no     651      no   no  cellular  20
#> 4123  29    technician   single      no     309     yes   no   unknown  13
#> 4124  42        admin.  married      no    -150      no  yes  cellular   8
#> 4125  57    management  married      no     473      no   no  cellular   1
#> 4126  32   blue-collar  married      no     363     yes   no   unknown  13
#> 4127  46    management  married      no      37     yes   no  cellular  30
#> 4128  49     housemaid  married      no    3376      no   no   unknown   9
#> 4129  41   blue-collar  married      no      16      no   no  cellular  29
#> 4130  30    management   single      no    3410     yes   no  cellular  18
#> 4131  41   blue-collar  married      no     343     yes   no   unknown  14
#> 4132  60   blue-collar  married      no    1407     yes   no  cellular  14
#> 4133  44    management  married      no   -1746     yes   no   unknown  20
#> 4134  43   blue-collar  married      no     953     yes   no   unknown  19
#> 4135  41    management  married      no    1468     yes   no  cellular  31
#> 4136  52    technician  married      no       0     yes   no  cellular  10
#> 4137  51   blue-collar  married      no       0      no   no  cellular   7
#> 4138  50   blue-collar divorced      no      31     yes   no   unknown   9
#> 4139  30   blue-collar   single      no     546     yes   no   unknown  21
#> 4140  41 self-employed  married      no       0      no   no  cellular   8
#> 4141  41        admin.  married      no    2661     yes   no telephone  24
#> 4142  47    management  married      no      33     yes  yes   unknown  20
#> 4143  31    technician  married      no    1197     yes   no   unknown  24
#> 4144  40      services divorced      no    5745     yes  yes   unknown  23
#> 4145  43    management  married      no     370      no   no  cellular  28
#> 4146  42     housemaid divorced      no     314      no   no   unknown   9
#> 4147  38   blue-collar   single      no    1012     yes  yes telephone  17
#> 4148  38   blue-collar  married      no     566     yes  yes telephone  17
#> 4149  40    technician  married      no     826      no   no   unknown  24
#> 4150  39   blue-collar  married      no    1096      no   no   unknown  20
#> 4151  27        admin.  married      no    1033     yes   no   unknown   9
#> 4152  31    management  married      no     392      no   no  cellular  26
#> 4153  35    management  married      no     724     yes   no  cellular  18
#> 4154  27    technician   single      no    1996     yes   no  cellular   5
#> 4155  34    technician  married      no     222     yes   no   unknown  12
#> 4156  40      services  married      no      88     yes   no   unknown   9
#> 4157  35  entrepreneur   single      no     475      no  yes  cellular  21
#> 4158  56       retired   single      no     352      no   no  cellular  19
#> 4159  50   blue-collar  married      no      84     yes   no   unknown  29
#> 4160  42 self-employed  married      no   21861      no   no   unknown   5
#> 4161  27     housemaid  married      no       0      no  yes  cellular  17
#> 4162  57   blue-collar divorced      no    1795     yes   no   unknown  19
#> 4163  32   blue-collar   single      no    1475     yes   no  cellular  21
#> 4164  54 self-employed  married      no    1510      no   no telephone   5
#> 4165  59    technician divorced      no    2735      no   no  cellular   3
#> 4166  45    technician  married      no    3583     yes   no   unknown  15
#> 4167  31    management   single      no     533      no   no  cellular  12
#> 4168  47    management  married      no       0      no   no  cellular   4
#> 4169  48   blue-collar   single      no    3688     yes   no  cellular  17
#> 4170  42        admin. divorced     yes     723      no   no  cellular  20
#> 4171  27        admin.   single      no     313      no  yes  cellular   3
#> 4172  30    management   single      no    1028      no   no  cellular   4
#> 4173  32   blue-collar  married      no    -460     yes  yes  cellular  29
#> 4174  42    unemployed divorced      no    1699      no  yes  cellular  17
#> 4175  40   blue-collar  married      no     137      no  yes  cellular  10
#> 4176  44    management  married      no       0     yes  yes  cellular  18
#> 4177  55    unemployed  married      no     549      no   no  cellular  18
#> 4178  41    management  married      no     526     yes   no  cellular  15
#> 4179  35    management   single      no     824     yes   no  cellular  16
#> 4180  41  entrepreneur   single      no     791     yes   no  cellular   5
#> 4181  27      services  married      no     311     yes   no  cellular  15
#> 4182  32   blue-collar   single      no    1036     yes  yes   unknown  30
#> 4183  55    technician  married      no       0      no   no   unknown   6
#> 4184  40   blue-collar  married      no     187     yes   no  cellular  15
#> 4185  37   blue-collar  married      no     604     yes   no  cellular   7
#> 4186  33    management   single      no     896     yes   no  cellular  19
#> 4187  30    technician   single      no    2325      no   no  cellular  10
#> 4188  36    management  married      no     812      no   no  cellular   7
#> 4189  37    technician   single      no    1255     yes   no   unknown  30
#> 4190  38   blue-collar  married      no     264     yes   no telephone  31
#> 4191  46        admin.   single      no    1544     yes   no   unknown  29
#> 4192  52    technician  married      no     337     yes   no  cellular   8
#> 4193  27    management  married      no     -41     yes   no   unknown  16
#> 4194  43   blue-collar  married      no    -509     yes   no   unknown   6
#> 4195  31    management   single      no     933     yes   no  cellular   9
#> 4196  44       retired  married      no    2692      no   no   unknown  12
#> 4197  39   blue-collar  married      no       0     yes   no  cellular  30
#> 4198  26 self-employed   single      no    1153      no   no  cellular   4
#> 4199  34    management   single      no      14     yes   no telephone   4
#> 4200  36    technician  married      no    2473      no   no  cellular  28
#> 4201  34    management   single      no       0     yes   no   unknown   2
#> 4202  39    technician  married      no       0     yes   no   unknown   5
#> 4203  35      services  married      no     764      no   no  cellular  12
#> 4204  30 self-employed  married      no    -517     yes  yes  cellular  22
#> 4205  52   blue-collar  married      no      60      no  yes  cellular  26
#> 4206  54   blue-collar  married      no      95      no   no  cellular  25
#> 4207  35      services  married      no     181     yes   no  cellular  31
#> 4208  61    management  married      no     997      no   no  cellular  22
#> 4209  41    management  married      no    1199     yes   no  cellular  18
#> 4210  40    technician divorced      no     237      no   no  cellular  25
#> 4211  64       retired  married      no     493      no   no  cellular  17
#> 4212  46    technician divorced      no     477     yes   no   unknown   6
#> 4213  28       student   single      no     221     yes   no  cellular  15
#> 4214  42    technician   single      no      -1      no   no  cellular  29
#> 4215  35    management  married      no     481      no   no  cellular  13
#> 4216  38   blue-collar  married      no     292     yes  yes   unknown   6
#> 4217  45    technician divorced      no     159     yes   no   unknown  26
#> 4218  36    management divorced      no    5195     yes   no   unknown   2
#> 4219  41   blue-collar  married      no    -692     yes   no  cellular  16
#> 4220  43    management divorced      no       0     yes   no   unknown   8
#> 4221  36    management  married      no    3874      no   no  cellular  25
#> 4222  41      services  married      no     108     yes  yes   unknown  13
#> 4223  23       student   single      no       0      no   no  cellular   7
#> 4224  46     housemaid  married      no    1000      no   no  cellular  18
#> 4225  40        admin.  married      no      67      no  yes   unknown  20
#> 4226  30   blue-collar  married      no     136      no   no  cellular  18
#> 4227  47    technician divorced      no      48      no   no   unknown  27
#> 4228  62       retired  married      no    2557     yes   no  cellular  14
#> 4229  47        admin.  married      no    1934      no  yes  cellular  14
#> 4230  36    management  married      no       0     yes  yes  cellular  14
#> 4231  35    management  married      no     802     yes   no  cellular   6
#> 4232  46   blue-collar  married      no     -27     yes   no  cellular  11
#> 4233  31        admin.   single      no    4129      no   no  cellular   2
#> 4234  25   blue-collar  married      no    -306     yes   no   unknown  20
#> 4235  59       retired  married     yes      -1      no   no  cellular   5
#> 4236  30      services  married      no    1286     yes  yes  cellular  17
#> 4237  52      services  married      no    2618     yes   no  cellular  21
#> 4238  31    technician   single      no     418      no   no  cellular   7
#> 4239  54       retired  married      no    1379      no   no   unknown  11
#> 4240  41      services  married      no     572     yes   no  cellular  11
#> 4241  45    management  married      no    2953     yes  yes  cellular   5
#> 4242  45   blue-collar   single      no    -100     yes   no  cellular   9
#> 4243  37   blue-collar  married      no     704     yes   no  cellular  31
#> 4244  36    technician  married      no      99     yes  yes  cellular  17
#> 4245  41    unemployed  married      no     183     yes   no  cellular  29
#> 4246  49  entrepreneur divorced     yes    -736      no   no  cellular  31
#> 4247  26    technician   single     yes    -454      no  yes  cellular  18
#> 4248  23        admin.   single      no     290     yes   no   unknown  12
#> 4249  35      services  married      no    1359      no   no   unknown  17
#> 4250  41   blue-collar   single      no     363     yes   no   unknown   8
#> 4251  40        admin.  married      no    3138      no   no  cellular  12
#> 4252  45   blue-collar  married      no     185      no   no  cellular  25
#> 4253  42    technician divorced      no     611     yes   no  cellular  16
#> 4254  38   blue-collar  married      no       0      no   no   unknown   6
#> 4255  46        admin.  married      no     547      no  yes  cellular   4
#> 4256  34      services   single      no     528     yes   no  cellular   2
#> 4257  26    management divorced      no     667      no   no telephone  19
#> 4258  35        admin.  married     yes      76      no  yes   unknown  17
#> 4259  30    unemployed   single     yes    -770     yes   no   unknown  28
#> 4260  40    technician   single      no     445     yes   no  cellular  24
#> 4261  37    unemployed  married      no     117      no   no  cellular  12
#> 4262  49    technician divorced      no       7     yes  yes  cellular  17
#> 4263  27    technician  married      no    2735     yes   no  cellular  29
#> 4264  40      services   single      no     546     yes   no   unknown   6
#> 4265  33    management divorced      no    1897     yes  yes   unknown   2
#> 4266  53   blue-collar divorced      no    -376     yes   no  cellular   9
#> 4267  58    technician  married      no    1692     yes   no telephone  17
#> 4268  52      services  married      no    1625      no   no  cellular   8
#> 4269  42    technician  married      no    2030     yes  yes  cellular   9
#> 4270  57       retired  married      no     592      no  yes  cellular  28
#> 4271  42    management   single      no     100      no   no  cellular   7
#> 4272  32    technician  married      no    8023      no   no  cellular  17
#> 4273  34    management   single      no   11350     yes   no  cellular  20
#> 4274  76       retired divorced      no      86      no   no  cellular  12
#> 4275  33        admin.   single      no     892     yes   no   unknown  21
#> 4276  35    management   single      no     747      no   no  cellular   4
#> 4277  35    technician  married      no    1067      no  yes  cellular  12
#> 4278  33   blue-collar   single      no     433     yes   no  cellular  15
#> 4279  54        admin.  married      no    5084     yes  yes  cellular   8
#> 4280  58       retired   single      no    6570      no   no  cellular  21
#> 4281  37 self-employed  married      no    2260     yes   no   unknown  30
#> 4282  39      services   single      no     300     yes  yes   unknown  28
#> 4283  41    management divorced      no    1064      no   no  cellular  25
#> 4284  56      services  married      no      17      no  yes  cellular  25
#> 4285  31        admin.   single      no    5527     yes   no   unknown  21
#> 4286  46    technician  married      no     718     yes   no  cellular   6
#> 4287  35    management  married      no    1613     yes   no  cellular  18
#> 4288  50    unemployed  married      no     -13     yes   no   unknown  14
#> 4289  57    technician  married      no    3082     yes  yes  cellular  20
#> 4290  58        admin.  married      no    1142      no   no telephone   4
#> 4291  37        admin.  married      no    1415     yes   no  cellular  12
#> 4292  33    technician  married      no     804      no  yes telephone  18
#> 4293  34  entrepreneur  married      no     145     yes  yes  cellular  18
#> 4294  37      services  married      no     692     yes   no telephone  20
#> 4295  34    management   single      no    2343      no   no telephone  21
#> 4296  48    technician divorced      no     791      no   no  cellular   7
#> 4297  29        admin.  married      no     795     yes  yes  cellular  10
#> 4298  59     housemaid  married      no       0      no   no telephone  27
#> 4299  59       retired  married      no    -119     yes   no   unknown   6
#> 4300  43    management divorced      no     350     yes   no   unknown   4
#> 4301  38   blue-collar  married      no       0     yes   no  cellular  17
#> 4302  67    management  married      no     694      no   no  cellular   7
#> 4303  40      services   single      no     224     yes   no  cellular  17
#> 4304  30   blue-collar  married      no     282     yes  yes   unknown  23
#> 4305  31        admin.  married      no     799     yes   no  cellular   7
#> 4306  50    unemployed divorced      no      64      no   no  cellular  31
#> 4307  26       unknown divorced      no    -295     yes   no  cellular   7
#> 4308  44    technician  married      no    2981     yes  yes  cellular  22
#> 4309  32    management   single      no    -252     yes   no  cellular  15
#> 4310  53    management  married      no   32464      no   no  cellular  19
#> 4311  26   blue-collar   single      no    -887     yes   no  cellular  18
#> 4312  38    technician divorced      no     273     yes   no   unknown  20
#> 4313  26      services   single      no     212     yes   no  cellular  15
#> 4314  44        admin.  married      no    1248     yes  yes  cellular   8
#> 4315  58       retired  married      no     188      no   no  cellular  14
#> 4316  42    technician  married      no    1812     yes   no  cellular  31
#> 4317  54    management  married      no    2895     yes   no  cellular   9
#> 4318  53   blue-collar  married      no     392      no   no  cellular  26
#> 4319  46    technician  married      no     363     yes   no  cellular   6
#> 4320  41  entrepreneur  married      no     373      no   no   unknown  16
#> 4321  43        admin.   single      no      87     yes   no   unknown   7
#> 4322  29    unemployed   single      no     670     yes   no   unknown  26
#> 4323  51       retired  married      no    2525      no   no   unknown  11
#> 4324  50      services  married      no    1501      no   no  cellular  21
#> 4325  41   blue-collar  married      no     389     yes   no   unknown  16
#> 4326  30    management   single      no    4889      no   no  cellular  11
#> 4327  38   blue-collar  married      no     625     yes  yes  cellular  11
#> 4328  48    management   single      no      86      no   no  cellular  28
#> 4329  55    technician  married      no       0      no   no  cellular  29
#> 4330  38    technician divorced      no    1294     yes   no   unknown  29
#> 4331  43        admin.  married      no    -879     yes   no   unknown  20
#> 4332  25   blue-collar   single      no    1857     yes   no  cellular  12
#> 4333  36    unemployed divorced      no    1366      no  yes  cellular   2
#> 4334  30   blue-collar  married      no     194     yes   no  cellular   8
#> 4335  42      services   single      no    3403     yes   no  cellular  30
#> 4336  48    technician  married      no    1152     yes   no  cellular  21
#> 4337  43   blue-collar  married      no    1335     yes   no   unknown   6
#> 4338  37    management  married      no       0     yes   no  cellular  14
#> 4339  38    management   single      no    -145     yes   no  cellular  21
#> 4340  38    technician  married      no     751     yes   no  cellular   3
#> 4341  55   blue-collar  married      no     431     yes   no   unknown  12
#> 4342  52   blue-collar  married      no    1319      no   no telephone  30
#> 4343  28        admin.   single      no    1507      no   no  cellular   7
#> 4344  33    management   single      no     215     yes   no  cellular  27
#> 4345  30    unemployed   single      no     306      no   no   unknown  26
#> 4346  42      services   single      no       0     yes   no  cellular  14
#> 4347  29      services  married      no      19     yes   no  cellular  29
#> 4348  45        admin.  married      no    5511      no   no  cellular   2
#> 4349  49    management  married      no     362     yes   no   unknown   4
#> 4350  33    technician   single      no    2412     yes   no  cellular  14
#> 4351  53   blue-collar  married      no     111      no   no   unknown  20
#> 4352  40   blue-collar  married      no    -450     yes   no  cellular  15
#> 4353  29   blue-collar  married      no     457     yes   no  cellular  20
#> 4354  56       retired  married      no     307      no  yes  cellular   8
#> 4355  36        admin.  married      no     231     yes  yes   unknown   6
#> 4356  49   blue-collar divorced      no   10613      no  yes  cellular   4
#> 4357  38   blue-collar  married      no     376     yes   no   unknown   7
#> 4358  28        admin.   single      no    3029     yes   no  cellular  18
#> 4359  30    technician  married      no    8351      no   no  cellular  11
#> 4360  33    technician   single      no     555      no  yes  cellular   4
#> 4361  52     housemaid  married      no    2337     yes   no  cellular  24
#> 4362  37   blue-collar   single      no       0     yes  yes  cellular  22
#> 4363  59    technician  married      no     -91      no   no   unknown  25
#> 4364  44    technician  married      no    8938     yes   no   unknown   3
#> 4365  32    technician divorced      no    2558      no   no   unknown   5
#> 4366  59      services  married      no     108      no   no  cellular  11
#> 4367  31   blue-collar  married      no    2929     yes   no  cellular  20
#> 4368  26      services   single      no       0      no   no  cellular  29
#> 4369  52    technician  married      no   22755     yes   no   unknown  29
#> 4370  43    management  married      no    2987      no   no  cellular  11
#> 4371  36    technician  married      no     911     yes  yes  cellular   4
#> 4372  58    management  married      no    1517     yes   no telephone  29
#> 4373  39        admin.  married      no    1108      no   no  cellular  21
#> 4374  55   blue-collar   single      no      39     yes   no   unknown  26
#> 4375  35    management  married      no    2123     yes   no  cellular  20
#> 4376  26      services   single     yes      74      no   no  cellular   8
#> 4377  30    management   single      no     162     yes   no   unknown  20
#> 4378  36    management  married      no     393     yes   no  cellular  30
#> 4379  41        admin.  married      no    2498      no   no  cellular  12
#> 4380  34   blue-collar  married      no    1221     yes   no  cellular   5
#> 4381  45   blue-collar  married      no     665      no   no   unknown   9
#> 4382  51    technician divorced      no    4596      no   no  cellular   8
#> 4383  47    management  married      no    2889      no   no telephone  29
#> 4384  36   blue-collar  married      no    -318     yes   no  cellular  14
#> 4385  41    technician  married      no     871     yes   no   unknown   6
#> 4386  63    technician  married      no     973      no   no  cellular  25
#> 4387  39        admin.  married      no    1022     yes  yes  cellular  28
#> 4388  39    management  married      no     551      no  yes  cellular   7
#> 4389  30    technician   single      no       5      no   no  cellular  19
#> 4390  47      services divorced      no     164      no   no   unknown   5
#> 4391  29   blue-collar  married      no       0     yes   no   unknown  13
#> 4392  60    technician  married      no       0      no   no  cellular  19
#> 4393  46   blue-collar  married      no       7      no   no   unknown  17
#> 4394  36    management   single      no     515     yes   no  cellular  21
#> 4395  53       retired  married      no    1139     yes   no  cellular  18
#> 4396  49      services  married      no    4713     yes   no telephone  21
#> 4397  37        admin.   single      no    3049     yes  yes   unknown  29
#> 4398  33        admin. divorced      no     140     yes   no   unknown   8
#> 4399  62       retired  married      no     298      no   no  cellular  17
#> 4400  31    technician  married      no    4315     yes   no   unknown  21
#> 4401  30      services   single      no     -97     yes   no   unknown   4
#> 4402  41     housemaid  married      no      39      no   no  cellular  21
#> 4403  37    management  married      no     784     yes   no  cellular   9
#> 4404  39   blue-collar   single      no    1672     yes   no  cellular  20
#> 4405  31   blue-collar   single      no      17     yes   no  cellular  12
#> 4406  34        admin.  married      no     507     yes   no   unknown   6
#> 4407  34    technician   single      no    2047     yes   no  cellular  28
#> 4408  28      services   single      no    1820     yes   no  cellular   5
#> 4409  43        admin.  married      no    -150      no  yes  cellular  21
#> 4410  51   blue-collar  married      no    1238      no   no   unknown  18
#> 4411  46     housemaid  married      no      75      no   no   unknown   9
#> 4412  26   blue-collar   single      no     191     yes   no  cellular   6
#> 4413  40 self-employed  married      no       2      no   no  cellular  22
#> 4414  46   blue-collar  married      no     292     yes   no  cellular  20
#> 4415  51    management   single      no    5341      no   no  cellular  30
#> 4416  31   blue-collar  married      no      99     yes   no  cellular  29
#> 4417  37        admin.  married      no     190     yes   no   unknown   5
#> 4418  42    technician  married      no    -556     yes   no  cellular  19
#> 4419  27        admin.  married      no     133     yes  yes   unknown   9
#> 4420  53 self-employed  married      no     167     yes   no  cellular   7
#> 4421  35        admin.  married      no    1145     yes   no  cellular   2
#> 4422  28   blue-collar   single      no     369     yes   no   unknown  23
#> 4423  30    management   single      no    3259     yes   no  cellular  23
#> 4424  59       retired  married      no      82      no   no  cellular  28
#> 4425  30        admin.   single      no     270      no   no  cellular  30
#> 4426  30   blue-collar  married      no     187     yes   no   unknown  26
#> 4427  41    management  married      no     -98     yes  yes  cellular  23
#> 4428  43   blue-collar  married      no    7727     yes   no   unknown  15
#> 4429  33      services  married      no     740      no  yes   unknown  30
#> 4430  48       unknown  married      no       3      no   no  cellular  19
#> 4431  36 self-employed   single      no       0     yes   no  cellular  30
#> 4432  35    technician  married      no     328     yes   no  cellular  22
#> 4433  31        admin.  married      no     223      no   no  cellular   6
#> 4434  48    technician   single      no     469      no  yes  cellular   9
#> 4435  60       retired  married      no     878      no   no  cellular  13
#> 4436  35 self-employed   single      no     353      no   no  cellular  12
#> 4437  50    technician  married      no     349     yes   no telephone  28
#> 4438  53   blue-collar divorced      no    -473     yes   no   unknown  28
#> 4439  27        admin.   single      no    3672     yes   no  cellular  15
#> 4440  32   blue-collar  married      no    2198      no   no  cellular  15
#> 4441  76       retired  married      no    2223      no   no telephone   4
#> 4442  44    management divorced      no    5773      no   no   unknown  23
#> 4443  40    management  married      no    1308      no   no telephone   3
#> 4444  34    technician  married      no    3160     yes   no  cellular  13
#> 4445  33      services  married      no     233      no   no  cellular  29
#> 4446  33   blue-collar  married      no    1464     yes   no   unknown  23
#> 4447  56     housemaid  married      no    1922     yes   no  cellular  24
#> 4448  47     housemaid  married      no     333      no   no telephone  21
#> 4449  30        admin.   single      no     726      no   no  cellular  29
#> 4450  48    technician  married      no    1939     yes  yes  cellular   6
#> 4451  40   blue-collar divorced      no    4168     yes   no  cellular  29
#> 4452  56       retired divorced      no    -154     yes   no   unknown  27
#> 4453  36 self-employed   single      no    3560      no   no  cellular  18
#> 4454  54    management  married      no    1411      no   no  cellular  12
#> 4455  47   blue-collar  married      no     209      no   no  cellular  27
#> 4456  56    management  married      no      73     yes   no  cellular   8
#> 4457  47      services  married      no     439     yes   no  cellular  20
#> 4458  34   blue-collar  married      no       0     yes  yes  cellular   5
#> 4459  32        admin.   single      no       1      no   no  cellular   2
#> 4460  41    management  married      no       4     yes   no  cellular  15
#> 4461  48        admin.  married      no    1800     yes   no   unknown  18
#> 4462  34    technician   single      no    1227      no   no telephone  17
#> 4463  36    management  married      no    1041     yes   no  cellular  14
#> 4464  36   blue-collar  married      no     106     yes   no  cellular  29
#> 4465  37   blue-collar  married      no     693      no   no  cellular  20
#> 4466  46  entrepreneur  married      no       0      no  yes  cellular  18
#> 4467  41    management  married      no     456     yes   no  cellular  11
#> 4468  33   blue-collar   single      no     179      no   no  cellular  14
#> 4469  58   blue-collar divorced      no     474     yes  yes  cellular  18
#> 4470  31       student   single      no     430      no   no  cellular   5
#> 4471  31    management   single      no     874     yes   no  cellular   7
#> 4472  34    management  married      no     271     yes   no  cellular  15
#> 4473  48  entrepreneur  married      no       0     yes   no  cellular  17
#> 4474  42   blue-collar   single      no      22     yes   no  cellular  14
#> 4475  40    technician  married      no     286      no   no  cellular  30
#> 4476  36    management  married      no      10      no  yes   unknown  28
#> 4477  46    technician  married      no     536     yes   no   unknown  16
#> 4478  66  entrepreneur  married      no       0      no   no telephone  12
#> 4479  30    technician   single      no    1572     yes  yes   unknown  23
#> 4480  46   blue-collar   single      no     324     yes   no   unknown  30
#> 4481  62    management  married      no    2785      no   no  cellular   6
#> 4482  48   blue-collar  married      no       0      no   no  cellular  19
#> 4483  32    management  married      no      92      no   no   unknown   3
#> 4484  57    management  married      no     163      no   no  cellular   6
#> 4485  36        admin. divorced      no     289     yes  yes  cellular  28
#> 4486  38    management divorced      no    6368     yes   no  cellular   4
#> 4487  41      services divorced      no     308      no   no  cellular  31
#> 4488  48    technician   single      no    1245      no   no  cellular  13
#> 4489  57       retired  married      no    1335      no   no  cellular  19
#> 4490  46    management divorced      no     233     yes  yes  cellular  14
#> 4491  67       retired  married      no     258      no   no  cellular  17
#> 4492  35    management  married      no     674      no   no  cellular   8
#> 4493  57        admin.  married      no    2038      no   no  cellular   9
#> 4494  40    technician  married      no       0      no   no  cellular  15
#> 4495  45        admin.  married      no     476      no   no  cellular   6
#> 4496  31    technician   single      no       0      no   no  cellular  29
#> 4497  45        admin.  married      no    1435     yes   no  cellular  11
#> 4498  43   blue-collar  married      no     601     yes   no  cellular  16
#> 4499  52   blue-collar  married      no     372     yes   no  cellular   8
#> 4500  53    technician  married      no     284      no   no  cellular   1
#> 4501  32    technician   single      no     705      no   no  cellular  17
#> 4502  52   blue-collar  married      no     655     yes  yes  cellular  31
#> 4503  40      services  married      no       0     yes  yes  cellular   2
#> 4504  43  entrepreneur  married      no     641     yes  yes   unknown   2
#> 4505  32    technician  married      no       2     yes  yes  cellular   8
#> 4506  48        admin. divorced      no     771     yes   no   unknown   2
#> 4507  45   blue-collar  married      no     644     yes   no telephone  12
#> 4508  51        admin.  married      no     194      no  yes  cellular  22
#> 4509  33   blue-collar  married      no    1050     yes   no   unknown  26
#> 4510  32    management   single      no     863     yes   no   unknown  20
#> 4511  35      services  married      no     372     yes   no  cellular  11
#> 4512  31    management  married      no    3739      no   no  cellular  11
#> 4513  43   blue-collar  married      no       0     yes  yes   unknown  29
#> 4514  34   blue-collar divorced      no       0      no  yes   unknown  21
#> 4515  29        admin.   single      no    1448      no   no  cellular  10
#> 4516  38    technician  married      no      79     yes   no  cellular  20
#> 4517  39        admin.  married      no      70     yes   no  cellular  31
#> 4518  42        admin.  married      no    1133     yes   no  cellular   4
#> 4519  54 self-employed  married      no      66     yes   no telephone  12
#> 4520  45   blue-collar  married      no     -60      no   no  cellular  31
#> 4521  32    technician   single      no     703     yes   no  cellular   3
#>      month duration campaign pdays previous poutcome y education
#> 1      jan      375        2    -1        0  unknown 0     upper
#> 2      jun      392        3    -1        0  unknown 0     upper
#> 3      feb      315        2   180        6  failure 1     upper
#> 4      may      309        1   306        4  success 1     upper
#> 5      may       67        4    -1        0  unknown 0     upper
#> 6      may      125        1    -1        0  unknown 0     upper
#> 7      aug      182        2    37        2  failure 0     upper
#> 8      may      185        1   370        3  failure 0   primary
#> 9      nov      296        2    -1        0  unknown 0     upper
#> 10     nov       80        1    -1        0  unknown 0     upper
#> 11     feb      236        2   272        1  failure 0     upper
#> 12     jun      199        4    -1        0  unknown 0   primary
#> 13     aug      182        2    99        1  failure 1     upper
#> 14     nov      250        1   155        2  failure 0   primary
#> 15     may       12        5    -1        0  unknown 0     upper
#> 16     jun      446        1    -1        0  unknown 0     upper
#> 17     aug       89       23    -1        0  unknown 0   primary
#> 18     jun        7        3    -1        0  unknown 0   unknown
#> 19     jul      130        8    -1        0  unknown 0     upper
#> 20     aug      110        4    -1        0  unknown 0     upper
#> 21     aug       51        3    -1        0  unknown 0     upper
#> 22     jul       42        1    -1        0  unknown 0     upper
#> 23     may       33        2    -1        0  unknown 0   unknown
#> 24     nov      112        1    -1        0  unknown 0     upper
#> 25     may      352        3    -1        0  unknown 0     upper
#> 26     nov      167        1    -1        0  unknown 0     upper
#> 27     aug       97        4    -1        0  unknown 0     upper
#> 28     jul      148        2    -1        0  unknown 0     upper
#> 29     nov      312        3    -1        0  unknown 0     upper
#> 30     may       73        1    -1        0  unknown 0     upper
#> 31     jun      244        2    -1        0  unknown 1     upper
#> 32     jun      835        2    -1        0  unknown 0   primary
#> 33     feb       22        6   196        6  failure 0     upper
#> 34     jun      135        2    -1        0  unknown 0     upper
#> 35     may      168        2    -1        0  unknown 0     upper
#> 36     feb      765        2    -1        0  unknown 0     upper
#> 37     apr       96        4   314        8    other 0   primary
#> 38     apr      334        2    -1        0  unknown 1     upper
#> 39     jul       46       21    -1        0  unknown 0   primary
#> 40     may       95        1    -1        0  unknown 0   primary
#> 41     may      305        5   349        7    other 0   primary
#> 42     may      206        1    -1        0  unknown 0     upper
#> 43     aug      106        2    -1        0  unknown 0     upper
#> 44     may      248        1    -1        0  unknown 0     upper
#> 45     apr       53        1   346        1  failure 0     upper
#> 46     aug      189        4    -1        0  unknown 0     upper
#> 47     nov       44        1    -1        0  unknown 0     upper
#> 48     apr      149        2    -1        0  unknown 0   primary
#> 49     sep      368        1    -1        0  unknown 0   primary
#> 50     may      139        4    -1        0  unknown 0   primary
#> 51     may     1623        1    -1        0  unknown 1   unknown
#> 52     aug      342        5    -1        0  unknown 0     upper
#> 53     aug      106        2    -1        0  unknown 0     upper
#> 54     may      113        2    -1        0  unknown 0     upper
#> 55     may      181        1    -1        0  unknown 0     upper
#> 56     aug      265        4    -1        0  unknown 0     upper
#> 57     apr      400        1    -1        0  unknown 1     upper
#> 58     aug      158        9    -1        0  unknown 0     upper
#> 59     jan      100        1   170        4  failure 0     upper
#> 60     jun      517        3    -1        0  unknown 0     upper
#> 61     may       49        2    -1        0  unknown 0   primary
#> 62     jul      428        1    -1        0  unknown 0     upper
#> 63     may      381        1   342        7  failure 0     upper
#> 64     jun      179        1    -1        0  unknown 0     upper
#> 65     may       44        1    -1        0  unknown 0     upper
#> 66     may      578        1   364        1    other 0     upper
#> 67     jun      139        2    -1        0  unknown 0     upper
#> 68     may      211        2    -1        0  unknown 0     upper
#> 69     may      290        2   370        1  failure 0     upper
#> 70     nov      618        2    -1        0  unknown 0   primary
#> 71     apr      424        1   138        1  failure 0     upper
#> 72     nov      209        2   180        1    other 0     upper
#> 73     feb      164        2   262        2  failure 0   primary
#> 74     jan      814        1    -1        0  unknown 0   primary
#> 75     jul       92        1    -1        0  unknown 0     upper
#> 76     may      231        1    -1        0  unknown 0     upper
#> 77     jan      309        1   197       13    other 0     upper
#> 78     nov      319        3    -1        0  unknown 0     upper
#> 79     nov      189        1    -1        0  unknown 0   primary
#> 80     aug       54        5    86        3  failure 0     upper
#> 81     jun      149        1    -1        0  unknown 0     upper
#> 82     jan      143        1    -1        0  unknown 1     upper
#> 83     jul      134        1    -1        0  unknown 0   primary
#> 84     oct       54        1    -1        0  unknown 0     upper
#> 85     jul      901        2    -1        0  unknown 1   primary
#> 86     aug      140        2    -1        0  unknown 0     upper
#> 87     may      155        6    -1        0  unknown 0     upper
#> 88     may      204        3    -1        0  unknown 0     upper
#> 89     jul      625        1    -1        0  unknown 1     upper
#> 90     may      860        2    -1        0  unknown 0     upper
#> 91     may       16        4   273        7    other 0     upper
#> 92     jun      169        2    -1        0  unknown 0   unknown
#> 93     apr      239        1   276        6  failure 0     upper
#> 94     sep      228        1   185        1  failure 0   primary
#> 95     oct      513        1    -1        0  unknown 1   primary
#> 96     may      152        3    -1        0  unknown 0     upper
#> 97     nov      352        3    -1        0  unknown 0     upper
#> 98     nov      203        2    -1        0  unknown 0     upper
#> 99     nov       34        1   124        6  failure 0   primary
#> 100    may      190        5    -1        0  unknown 0     upper
#> 101    may      324        1    -1        0  unknown 0     upper
#> 102    jul      231        2    -1        0  unknown 0     upper
#> 103    jul      203        1    -1        0  unknown 0     upper
#> 104    apr      411        1    -1        0  unknown 0     upper
#> 105    may      113        1    -1        0  unknown 0   primary
#> 106    jun       89        3    -1        0  unknown 0     upper
#> 107    may      379        1    -1        0  unknown 0   primary
#> 108    jun      174        1    -1        0  unknown 0     upper
#> 109    may      674        2   250        4  failure 0     upper
#> 110    may      313        3    -1        0  unknown 0     upper
#> 111    may       51        1    -1        0  unknown 0   primary
#> 112    may      200        4    -1        0  unknown 0     upper
#> 113    aug      714        1    -1        0  unknown 1     upper
#> 114    may      193        8    -1        0  unknown 0   unknown
#> 115    may      827        1   329        9  failure 0     upper
#> 116    jul      126        4    -1        0  unknown 0   primary
#> 117    aug      127        1    -1        0  unknown 0     upper
#> 118    apr       98        1    -1        0  unknown 0     upper
#> 119    nov       41        2   123        3  failure 0     upper
#> 120    may       71        1    -1        0  unknown 0     upper
#> 121    jul      254        2    -1        0  unknown 0     upper
#> 122    apr      201        2    -1        0  unknown 0     upper
#> 123    aug      205        5    -1        0  unknown 0     upper
#> 124    aug       98       19    -1        0  unknown 0   primary
#> 125    apr      111        1    -1        0  unknown 0     upper
#> 126    may       97        1    -1        0  unknown 0     upper
#> 127    aug      185        2    -1        0  unknown 0     upper
#> 128    apr      100        2    -1        0  unknown 0     upper
#> 129    may       99        2    -1        0  unknown 0     upper
#> 130    may      360        2    -1        0  unknown 0     upper
#> 131    may       23        1   359        3  failure 0     upper
#> 132    nov      108        1    -1        0  unknown 0     upper
#> 133    may      184        1   167        6  failure 0     upper
#> 134    jun      757        2    -1        0  unknown 0     upper
#> 135    jun      240        1   307       10    other 0     upper
#> 136    may      322        2    -1        0  unknown 0   primary
#> 137    may      168        4    -1        0  unknown 0     upper
#> 138    may      192        1    -1        0  unknown 0     upper
#> 139    nov       92        1   188        1  failure 0     upper
#> 140    may       43        1   367        2  success 0     upper
#> 141    jun       66        5    -1        0  unknown 0     upper
#> 142    feb      344        2    -1        0  unknown 0     upper
#> 143    may      163        1    -1        0  unknown 0     upper
#> 144    may      183        1   361        1  failure 0     upper
#> 145    may       11        8    -1        0  unknown 0     upper
#> 146    aug     1471        7    -1        0  unknown 1   primary
#> 147    aug       70        8    -1        0  unknown 0     upper
#> 148    may       88        3    -1        0  unknown 0     upper
#> 149    aug      781        2    -1        0  unknown 0     upper
#> 150    may       58        2    -1        0  unknown 0     upper
#> 151    nov       55        2    -1        0  unknown 0     upper
#> 152    may      181        2   255        5  failure 0     upper
#> 153    jan      119        2    -1        0  unknown 0     upper
#> 154    jul      163        1    -1        0  unknown 0     upper
#> 155    may      140        2    -1        0  unknown 0     upper
#> 156    jul      151        2    -1        0  unknown 0     upper
#> 157    nov      752        3    -1        0  unknown 0     upper
#> 158    may      167        4    -1        0  unknown 0   primary
#> 159    feb       89        1    -1        0  unknown 0   primary
#> 160    may      275        4    -1        0  unknown 0     upper
#> 161    nov      347        4   189        2  success 1     upper
#> 162    jan      461        2   204        2  failure 0     upper
#> 163    feb       74        1    -1        0  unknown 0     upper
#> 164    may       86        1    -1        0  unknown 0   unknown
#> 165    mar      116        1    -1        0  unknown 1     upper
#> 166    aug      507        1   181        2  success 1     upper
#> 167    feb      835        3    -1        0  unknown 1     upper
#> 168    oct      355        1   180        5  failure 1   primary
#> 169    nov      322        1    -1        0  unknown 1     upper
#> 170    jul      348        2    -1        0  unknown 0     upper
#> 171    may      336       10    -1        0  unknown 0   primary
#> 172    may      275        1   370        2  failure 0   primary
#> 173    jul      863       10    -1        0  unknown 0     upper
#> 174    may      180        1    -1        0  unknown 0     upper
#> 175    dec     1141        1   209        1    other 1     upper
#> 176    may      805        2    -1        0  unknown 0     upper
#> 177    jul     1877        1    -1        0  unknown 1   primary
#> 178    aug      121        1    -1        0  unknown 0     upper
#> 179    jun      174        1    -1        0  unknown 0     upper
#> 180    nov      130        3   188        2    other 0   unknown
#> 181    jul      119        1    -1        0  unknown 0     upper
#> 182    sep      217        2   188        3    other 0   primary
#> 183    aug       96        2    -1        0  unknown 0     upper
#> 184    aug       81        2    -1        0  unknown 0     upper
#> 185    feb      150        3   270        2  failure 0     upper
#> 186    jul      399        8    -1        0  unknown 0   primary
#> 187    nov       66        1    -1        0  unknown 0     upper
#> 188    may      100        1    -1        0  unknown 0     upper
#> 189    jul      196        2    -1        0  unknown 0     upper
#> 190    may      121        1    -1        0  unknown 0     upper
#> 191    apr      138        2   263        7  failure 0   primary
#> 192    jul      123        2    -1        0  unknown 0     upper
#> 193    jul       92        2    -1        0  unknown 0     upper
#> 194    feb       89        2    -1        0  unknown 0     upper
#> 195    aug      304        3    -1        0  unknown 1     upper
#> 196    jan      533        1    92        1  success 1   primary
#> 197    mar      233        1    -1        0  unknown 0     upper
#> 198    jul      117        1    -1        0  unknown 0     upper
#> 199    may      244        4    -1        0  unknown 0     upper
#> 200    jan       90        1    -1        0  unknown 0   unknown
#> 201    may      250        1    -1        0  unknown 0   primary
#> 202    jul      355        2    -1        0  unknown 1     upper
#> 203    may      336        1    89        5  failure 1     upper
#> 204    feb      118        4   210        3  failure 1     upper
#> 205    jan      253        1    -1        0  unknown 0     upper
#> 206    aug       75        1    -1        0  unknown 0     upper
#> 207    may      139        1    -1        0  unknown 0     upper
#> 208    aug       43        2    -1        0  unknown 0   primary
#> 209    jun       53        2    -1        0  unknown 0     upper
#> 210    jul      270        1    -1        0  unknown 0     upper
#> 211    nov       65        1   131        1  failure 0     upper
#> 212    jul      167        2    -1        0  unknown 0     upper
#> 213    dec      155        1   120        3  success 1     upper
#> 214    apr      479        1    -1        0  unknown 0     upper
#> 215    aug      250        2   187        2  success 1     upper
#> 216    aug       80        2    -1        0  unknown 0     upper
#> 217    may     1183        1    -1        0  unknown 1     upper
#> 218    jan      418        2    -1        0  unknown 0     upper
#> 219    jul      340        1    -1        0  unknown 0     upper
#> 220    may      468        1    -1        0  unknown 0     upper
#> 221    apr      777        2    -1        0  unknown 0     upper
#> 222    jul       18       44    -1        0  unknown 0   primary
#> 223    may      114        4   364       22    other 0     upper
#> 224    aug       15       20    -1        0  unknown 0     upper
#> 225    jun      167        1    -1        0  unknown 0   primary
#> 226    may      396        5    -1        0  unknown 1     upper
#> 227    may      159        4    -1        0  unknown 0     upper
#> 228    aug      430        4    -1        0  unknown 0   primary
#> 229    may      189        2    -1        0  unknown 0     upper
#> 230    nov      142        2    -1        0  unknown 0   primary
#> 231    apr      268        1    -1        0  unknown 0   unknown
#> 232    jan       80        2    -1        0  unknown 0   primary
#> 233    may      233        3    -1        0  unknown 0   primary
#> 234    jun      208        4    -1        0  unknown 0     upper
#> 235    nov       79        3    -1        0  unknown 0     upper
#> 236    jul      118        1    -1        0  unknown 0   primary
#> 237    aug       73        4    -1        0  unknown 0     upper
#> 238    may      175        2    -1        0  unknown 0     upper
#> 239    nov      165        1    -1        0  unknown 0     upper
#> 240    jul      122       13    -1        0  unknown 0     upper
#> 241    jul      125        3    -1        0  unknown 0   primary
#> 242    may       23        4    -1        0  unknown 0   primary
#> 243    may      557        4    -1        0  unknown 0   unknown
#> 244    may      528        5    -1        0  unknown 1     upper
#> 245    nov      420        2    -1        0  unknown 0     upper
#> 246    may      151        1    -1        0  unknown 0     upper
#> 247    may      407        2    -1        0  unknown 0     upper
#> 248    nov      104        2    28        2  success 0     upper
#> 249    may      351        1    -1        0  unknown 0   primary
#> 250    jul      357        1    -1        0  unknown 0     upper
#> 251    jul      255        3    -1        0  unknown 0     upper
#> 252    apr      426        3   323        3  failure 0     upper
#> 253    feb      204        1    -1        0  unknown 0     upper
#> 254    may      418        8    -1        0  unknown 0     upper
#> 255    oct      184        1    91        2  failure 1     upper
#> 256    jun       72        1    -1        0  unknown 0     upper
#> 257    jun      237        2    -1        0  unknown 0     upper
#> 258    jul      163        3    -1        0  unknown 0     upper
#> 259    jun      153        4    -1        0  unknown 0     upper
#> 260    jun        8        3    -1        0  unknown 0   primary
#> 261    jun      399        1    -1        0  unknown 0   primary
#> 262    may      185        2   165        2  failure 0   primary
#> 263    sep      379        3    -1        0  unknown 0     upper
#> 264    may      370        1    -1        0  unknown 0     upper
#> 265    apr      401        2    -1        0  unknown 0     upper
#> 266    jun       14        2    -1        0  unknown 0     upper
#> 267    may       85        1   168        2  failure 0   unknown
#> 268    may      230        2    -1        0  unknown 0   primary
#> 269    jun       66        1    -1        0  unknown 0   primary
#> 270    may      236        1   287        2  failure 0     upper
#> 271    feb      138        3     5        1    other 0   primary
#> 272    jul      784        1    -1        0  unknown 1     upper
#> 273    aug      103        6    -1        0  unknown 0     upper
#> 274    aug      165        3    -1        0  unknown 0     upper
#> 275    may      325        2    -1        0  unknown 0     upper
#> 276    jun       75        4    -1        0  unknown 0     upper
#> 277    jun      157        2    -1        0  unknown 0   primary
#> 278    aug      297        2    -1        0  unknown 0     upper
#> 279    may       13        5    -1        0  unknown 0     upper
#> 280    may      177        2   345        3    other 0   primary
#> 281    aug       62        7    -1        0  unknown 0     upper
#> 282    may      834        6    -1        0  unknown 0     upper
#> 283    jun     1446        1    -1        0  unknown 1     upper
#> 284    jul      482        2    -1        0  unknown 0   unknown
#> 285    mar      432        1    -1        0  unknown 0     upper
#> 286    may      173        3    -1        0  unknown 0   primary
#> 287    jun      157        2    -1        0  unknown 0     upper
#> 288    jul       95        1    -1        0  unknown 0     upper
#> 289    may      196        3   265        2  failure 0     upper
#> 290    apr      728        1    -1        0  unknown 0   primary
#> 291    nov        7        8   185        1  failure 0     upper
#> 292    may      203        1    -1        0  unknown 0     upper
#> 293    jan      169        2    -1        0  unknown 1     upper
#> 294    aug       65        4    -1        0  unknown 0     upper
#> 295    nov       66        1    -1        0  unknown 0     upper
#> 296    may      161        1    -1        0  unknown 0     upper
#> 297    may       63        5   370        1    other 0   primary
#> 298    nov      104        3   139        6  failure 0     upper
#> 299    jul      180       10    -1        0  unknown 0     upper
#> 300    jul      961        1    -1        0  unknown 1     upper
#> 301    jul      306        2    -1        0  unknown 0     upper
#> 302    aug       58        8    -1        0  unknown 0     upper
#> 303    apr      551        1    -1        0  unknown 0     upper
#> 304    jun       81        2    -1        0  unknown 0     upper
#> 305    apr      150        1    -1        0  unknown 0     upper
#> 306    apr      332        2   317        3  failure 0     upper
#> 307    mar      117        1    91        1  success 0   primary
#> 308    may      275        2    -1        0  unknown 0     upper
#> 309    nov      150        4    -1        0  unknown 0     upper
#> 310    may      121        1    -1        0  unknown 0     upper
#> 311    may      183        4    -1        0  unknown 0     upper
#> 312    oct      386        1   184        1    other 0   primary
#> 313    may       17        7    -1        0  unknown 0     upper
#> 314    may       72        3    -1        0  unknown 0     upper
#> 315    sep      133        3    -1        0  unknown 0     upper
#> 316    jul      278        2    -1        0  unknown 0     upper
#> 317    jun      113        1   109        1  failure 0     upper
#> 318    jul     1056        2    -1        0  unknown 1     upper
#> 319    may      190        3    -1        0  unknown 0     upper
#> 320    apr       57        1    -1        0  unknown 0     upper
#> 321    aug       50        4    -1        0  unknown 0   primary
#> 322    may      184        1   351        1  failure 0     upper
#> 323    aug       35       31    -1        0  unknown 0     upper
#> 324    jul       81        4    -1        0  unknown 0   primary
#> 325    nov      120        2    -1        0  unknown 0     upper
#> 326    jul      309        1    -1        0  unknown 1     upper
#> 327    jul      119        2    -1        0  unknown 0     upper
#> 328    may      206        4    -1        0  unknown 0     upper
#> 329    jul       92        3    -1        0  unknown 0     upper
#> 330    jul      204        2    -1        0  unknown 0   primary
#> 331    feb      176        3    -1        0  unknown 0   primary
#> 332    aug       11        1    -1        0  unknown 0     upper
#> 333    jul      407       11    -1        0  unknown 0   primary
#> 334    may      212        3    -1        0  unknown 0   primary
#> 335    may     1357        4   374        2  failure 1     upper
#> 336    may      867        1    -1        0  unknown 1     upper
#> 337    may      182        4    -1        0  unknown 0     upper
#> 338    aug       65        3    -1        0  unknown 0   primary
#> 339    may      265        1   290        2  failure 0   primary
#> 340    jun      116        3    -1        0  unknown 0     upper
#> 341    nov       88        6   113       13    other 0     upper
#> 342    feb      228        1    -1        0  unknown 0     upper
#> 343    nov      369        1    -1        0  unknown 0     upper
#> 344    jun       52        1    -1        0  unknown 0     upper
#> 345    aug      107        6    -1        0  unknown 0     upper
#> 346    aug       82        2    -1        0  unknown 0     upper
#> 347    may      767        2    -1        0  unknown 1     upper
#> 348    may      313        2    -1        0  unknown 0     upper
#> 349    jul       17       19    -1        0  unknown 0     upper
#> 350    mar      834        1    -1        0  unknown 1   primary
#> 351    may      178        1    -1        0  unknown 0     upper
#> 352    apr      108        1    -1        0  unknown 0     upper
#> 353    jul      200        5    -1        0  unknown 0     upper
#> 354    may      147        1    -1        0  unknown 0     upper
#> 355    nov      102        1    -1        0  unknown 0     upper
#> 356    may      202        1    -1        0  unknown 0     upper
#> 357    feb       93        2   274        2  failure 0     upper
#> 358    may      777        2    -1        0  unknown 0     upper
#> 359    jul      225        2    -1        0  unknown 0     upper
#> 360    may       32        1    -1        0  unknown 0     upper
#> 361    may      263        1    -1        0  unknown 0     upper
#> 362    feb      466        4    -1        0  unknown 1     upper
#> 363    jul      838        3    -1        0  unknown 1     upper
#> 364    feb      288        1    -1        0  unknown 0   primary
#> 365    nov      223        2   186        3    other 0     upper
#> 366    aug      183        5    -1        0  unknown 0     upper
#> 367    may      536        1    -1        0  unknown 0     upper
#> 368    aug      324        4    -1        0  unknown 0     upper
#> 369    nov      266        2    -1        0  unknown 0     upper
#> 370    may       98        2    -1        0  unknown 0     upper
#> 371    may      135        2    -1        0  unknown 0     upper
#> 372    jul      326       11    -1        0  unknown 0   primary
#> 373    may       98        2    -1        0  unknown 0     upper
#> 374    may      195        3   359        1  failure 0   primary
#> 375    nov      149        1   170        2  failure 0     upper
#> 376    jul       64        1    -1        0  unknown 0     upper
#> 377    aug      272        2    -1        0  unknown 0     upper
#> 378    may       38        3    -1        0  unknown 0     upper
#> 379    may      185        1   178        1  failure 0     upper
#> 380    jun      152        5    -1        0  unknown 0     upper
#> 381    aug      709       11    -1        0  unknown 0     upper
#> 382    jul     1187        3    -1        0  unknown 0     upper
#> 383    may      703        4    -1        0  unknown 1     upper
#> 384    may       62        2    -1        0  unknown 0     upper
#> 385    may      384        1    -1        0  unknown 0   primary
#> 386    may       34       12   347        5    other 0     upper
#> 387    jan      280        1    -1        0  unknown 0     upper
#> 388    jul      362        8    -1        0  unknown 1     upper
#> 389    jun      250        3    -1        0  unknown 0     upper
#> 390    nov       59        1    -1        0  unknown 0     upper
#> 391    may      541        1    -1        0  unknown 0     upper
#> 392    feb      361        2   258        1    other 0   primary
#> 393    feb      394        3   189        1  success 1     upper
#> 394    jul       70        1    -1        0  unknown 0     upper
#> 395    may       20        2    -1        0  unknown 0   unknown
#> 396    jul     1389        2    -1        0  unknown 0     upper
#> 397    jun      215        3    -1        0  unknown 0     upper
#> 398    may      178        2   270        8    other 0     upper
#> 399    jul      218        4    -1        0  unknown 0     upper
#> 400    nov      664        3    -1        0  unknown 1     upper
#> 401    jul      244        2    -1        0  unknown 0     upper
#> 402    may      109        1   359        8  failure 0     upper
#> 403    may       76        2   348        1  failure 0     upper
#> 404    nov      598        4    -1        0  unknown 0   primary
#> 405    jun      805        2    -1        0  unknown 0   primary
#> 406    jul      335        1    -1        0  unknown 0     upper
#> 407    sep      202        1    -1        0  unknown 1     upper
#> 408    aug      214        8    -1        0  unknown 0     upper
#> 409    may      278        1    -1        0  unknown 0     upper
#> 410    jul       58        1    -1        0  unknown 0     upper
#> 411    aug       83        6    -1        0  unknown 0     upper
#> 412    may      291        1   337        1  failure 0     upper
#> 413    may      128        1    -1        0  unknown 0     upper
#> 414    jun      431        2    -1        0  unknown 0   unknown
#> 415    nov      262        3    -1        0  unknown 0     upper
#> 416    aug      152        2    -1        0  unknown 0   unknown
#> 417    may       98        1    -1        0  unknown 0     upper
#> 418    jun      718       13    -1        0  unknown 0   unknown
#> 419    jul      285        2    -1        0  unknown 0     upper
#> 420    feb      246        1   259        2  failure 0     upper
#> 421    jun       20        1    -1        0  unknown 0     upper
#> 422    jul       41        9    -1        0  unknown 0   unknown
#> 423    jun       73        3    -1        0  unknown 0     upper
#> 424    feb      237        2    -1        0  unknown 0   unknown
#> 425    jan      592        1    -1        0  unknown 0     upper
#> 426    aug      622        1    -1        0  unknown 1     upper
#> 427    feb      427        4    -1        0  unknown 0   unknown
#> 428    jul      646        2    -1        0  unknown 0     upper
#> 429    nov       26        1   101       11    other 0     upper
#> 430    nov      519        2    -1        0  unknown 0     upper
#> 431    apr      205        1    -1        0  unknown 0   primary
#> 432    jul      146        1    91        6  failure 0     upper
#> 433    may      104        1    -1        0  unknown 0     upper
#> 434    may      105        2    -1        0  unknown 0     upper
#> 435    aug      110        4    -1        0  unknown 0   primary
#> 436    may      138        2    -1        0  unknown 0     upper
#> 437    jan      134        1    91        1  success 1     upper
#> 438    feb     1423        3    -1        0  unknown 0     upper
#> 439    aug      298        2   300        1    other 0   primary
#> 440    aug      139        4    -1        0  unknown 0   primary
#> 441    jun      368        1    -1        0  unknown 0     upper
#> 442    may      546        2    -1        0  unknown 0     upper
#> 443    sep      103        1    91        2  failure 0     upper
#> 444    may     1259        2   333       18  failure 0     upper
#> 445    jun      267       11    -1        0  unknown 0   primary
#> 446    may      156        3    -1        0  unknown 0     upper
#> 447    jul       46        3    -1        0  unknown 0     upper
#> 448    may       38        3    -1        0  unknown 0     upper
#> 449    may      368        2    -1        0  unknown 0     upper
#> 450    jun      201        3    -1        0  unknown 0     upper
#> 451    aug      205        4    -1        0  unknown 0     upper
#> 452    aug      140       11    -1        0  unknown 0     upper
#> 453    feb      170        2    -1        0  unknown 0     upper
#> 454    may      198        2    -1        0  unknown 0     upper
#> 455    aug      143        4    -1        0  unknown 0     upper
#> 456    may     1434        2   356        4  failure 0     upper
#> 457    may      472        1    -1        0  unknown 0   primary
#> 458    jul       18        2    -1        0  unknown 0     upper
#> 459    may      158        3   354        1  failure 0     upper
#> 460    nov      366        6    -1        0  unknown 0     upper
#> 461    jul       70        9    -1        0  unknown 0   primary
#> 462    apr      142        3   150        3  failure 0     upper
#> 463    may       64        2   364        3  failure 0   unknown
#> 464    nov      296        1    -1        0  unknown 0     upper
#> 465    aug      112        2    -1        0  unknown 0     upper
#> 466    nov      182        2    -1        0  unknown 0     upper
#> 467    feb      136        3    -1        0  unknown 1   primary
#> 468    nov       80        1    -1        0  unknown 0     upper
#> 469    jul     1013       29    -1        0  unknown 1     upper
#> 470    may      448        4    -1        0  unknown 0     upper
#> 471    aug      146        3    -1        0  unknown 0     upper
#> 472    jul      174        1    -1        0  unknown 0   primary
#> 473    jul       29        4    -1        0  unknown 0   primary
#> 474    may      202        2    -1        0  unknown 0     upper
#> 475    aug      189        4    -1        0  unknown 0     upper
#> 476    jul      144        2    -1        0  unknown 0     upper
#> 477    may      112        1    -1        0  unknown 0     upper
#> 478    jul       94        2    -1        0  unknown 0   primary
#> 479    may       58        5    -1        0  unknown 0     upper
#> 480    may      911        2    -1        0  unknown 1     upper
#> 481    aug      308        1   459        1  success 1   primary
#> 482    may      331        5    -1        0  unknown 1     upper
#> 483    jun      249        5    -1        0  unknown 0   primary
#> 484    jul      171        2    -1        0  unknown 0     upper
#> 485    may      123        5    -1        0  unknown 0     upper
#> 486    feb      251        1   186        3  success 1     upper
#> 487    apr      706        2    -1        0  unknown 0     upper
#> 488    oct      110        1   106        2  failure 0     upper
#> 489    jun       90        4    -1        0  unknown 0     upper
#> 490    aug      204        4    -1        0  unknown 0     upper
#> 491    oct      157        1    -1        0  unknown 0     upper
#> 492    feb      415        1    -1        0  unknown 1     upper
#> 493    mar      558        1    -1        0  unknown 0     upper
#> 494    apr       18        5   335        9    other 0     upper
#> 495    jun      342        1    -1        0  unknown 0   primary
#> 496    jul      159        2    -1        0  unknown 0     upper
#> 497    apr      518        2   261        2  failure 0     upper
#> 498    apr       59        1    -1        0  unknown 0     upper
#> 499    may      159        2   278        4  failure 0     upper
#> 500    jul       82        2    -1        0  unknown 0     upper
#> 501    may      169        2    -1        0  unknown 0     upper
#> 502    may        9       10   330       10    other 0     upper
#> 503    may      155        2    -1        0  unknown 0     upper
#> 504    apr      517        1   255        1  failure 0     upper
#> 505    jun      110        1    -1        0  unknown 0   primary
#> 506    may      189        3   348        3  failure 0     upper
#> 507    aug      441        2    -1        0  unknown 0   primary
#> 508    aug       95        4    -1        0  unknown 0     upper
#> 509    may      158        2    -1        0  unknown 0     upper
#> 510    jan       82        2    -1        0  unknown 0   primary
#> 511    may      141        1   343        3  failure 0     upper
#> 512    jun      813        4    -1        0  unknown 1     upper
#> 513    may      255        1    -1        0  unknown 0     upper
#> 514    jun       10       19    -1        0  unknown 0     upper
#> 515    apr      306        2    -1        0  unknown 1     upper
#> 516    may      322        5    -1        0  unknown 0   primary
#> 517    may       26        1    -1        0  unknown 0     upper
#> 518    may      944        3    -1        0  unknown 0     upper
#> 519    jun      270        2   377        3  success 0     upper
#> 520    jan      168        2   205        1  failure 0   primary
#> 521    aug       90        4    -1        0  unknown 0   primary
#> 522    may      191        1   342        2  failure 0     upper
#> 523    oct       99        2   185        3  failure 0     upper
#> 524    may       77        2    -1        0  unknown 0     upper
#> 525    aug      117        2    -1        0  unknown 0     upper
#> 526    may       52        9    -1        0  unknown 0     upper
#> 527    nov      119        1   157        2  failure 0     upper
#> 528    apr      166        5   181        5  failure 0   primary
#> 529    aug      338        2   104        1  success 1     upper
#> 530    may      109        2    -1        0  unknown 0     upper
#> 531    aug      296        3    -1        0  unknown 0     upper
#> 532    may      348        3    -1        0  unknown 0   primary
#> 533    may      133        2   363        5  failure 0   primary
#> 534    may      170        2    -1        0  unknown 0     upper
#> 535    jul      189        3    -1        0  unknown 0     upper
#> 536    jan      130        1     2        1    other 0     upper
#> 537    feb      254        2    -1        0  unknown 0     upper
#> 538    nov      681        4    -1        0  unknown 1     upper
#> 539    aug     1099        4    -1        0  unknown 0     upper
#> 540    aug      220        3    -1        0  unknown 0     upper
#> 541    nov      271        5    -1        0  unknown 0     upper
#> 542    may       86        1    -1        0  unknown 1   unknown
#> 543    aug       49        2    -1        0  unknown 0     upper
#> 544    nov      808        2    -1        0  unknown 1     upper
#> 545    jul     1039        2    -1        0  unknown 1     upper
#> 546    aug       59        3    -1        0  unknown 0     upper
#> 547    jul      209        2    -1        0  unknown 0     upper
#> 548    may      208        1    -1        0  unknown 0   primary
#> 549    may       98        1    -1        0  unknown 0     upper
#> 550    jul      123        1    -1        0  unknown 0     upper
#> 551    nov       14        7    -1        0  unknown 0     upper
#> 552    may      492        6    -1        0  unknown 0     upper
#> 553    may      118        1    -1        0  unknown 0     upper
#> 554    nov      235        2    -1        0  unknown 0     upper
#> 555    jun      643        1    -1        0  unknown 0   primary
#> 556    jul      250        2   181        4  success 1     upper
#> 557    may     1272        1    -1        0  unknown 1     upper
#> 558    may      100        3    -1        0  unknown 0     upper
#> 559    nov      462        3    -1        0  unknown 0     upper
#> 560    jul       24        1    -1        0  unknown 0     upper
#> 561    jan      931        1    -1        0  unknown 1     upper
#> 562    apr      190        1   335        1    other 0     upper
#> 563    aug      133        4    -1        0  unknown 0     upper
#> 564    feb      227        2    -1        0  unknown 1     upper
#> 565    nov      357        3    93        5  success 1     upper
#> 566    jun      183        3    -1        0  unknown 0     upper
#> 567    jul      281        1    -1        0  unknown 0     upper
#> 568    jun      239        4    -1        0  unknown 1     upper
#> 569    apr      152        1    -1        0  unknown 0     upper
#> 570    nov     1268        2    -1        0  unknown 0     upper
#> 571    nov       73        1    -1        0  unknown 0     upper
#> 572    may      202        2    -1        0  unknown 0     upper
#> 573    may      247        1    -1        0  unknown 0     upper
#> 574    jul      418        3    -1        0  unknown 0     upper
#> 575    may      373        4    -1        0  unknown 0     upper
#> 576    jun       14        6    -1        0  unknown 0     upper
#> 577    nov      108        1    -1        0  unknown 0     upper
#> 578    jan      624        2    -1        0  unknown 0     upper
#> 579    may      278        1    -1        0  unknown 0   primary
#> 580    may      177        3   343        1    other 0     upper
#> 581    jul      191        1    -1        0  unknown 0     upper
#> 582    may      235        6    -1        0  unknown 0   primary
#> 583    jun      637        6    -1        0  unknown 1     upper
#> 584    apr      660        1   191        1  failure 1   primary
#> 585    aug       57        1    -1        0  unknown 0     upper
#> 586    may      307        2    -1        0  unknown 0     upper
#> 587    jul      165        5    -1        0  unknown 0     upper
#> 588    aug      140        9    -1        0  unknown 0     upper
#> 589    may       11        1    -1        0  unknown 0   primary
#> 590    may      228        2   297        1    other 0     upper
#> 591    may      210        1    -1        0  unknown 0     upper
#> 592    jul      321        4    -1        0  unknown 1     upper
#> 593    may      423        1   349        1  failure 0     upper
#> 594    may      210        3    -1        0  unknown 0   primary
#> 595    oct      825        1   183        4  success 1     upper
#> 596    may      224        4    -1        0  unknown 0     upper
#> 597    feb       51        1    -1        0  unknown 0     upper
#> 598    aug      121        2    -1        0  unknown 0     upper
#> 599    jun      206        1    99        1  failure 0     upper
#> 600    jun      142       11    -1        0  unknown 0     upper
#> 601    jun       41        5    -1        0  unknown 0     upper
#> 602    nov       53        1    31        1  failure 0     upper
#> 603    may      120        1    -1        0  unknown 0     upper
#> 604    jul      200        4    -1        0  unknown 0   primary
#> 605    nov       84        2    -1        0  unknown 0     upper
#> 606    jul      226        1    -1        0  unknown 0     upper
#> 607    nov      112        1    -1        0  unknown 0     upper
#> 608    may      274        2    -1        0  unknown 0     upper
#> 609    aug      417        4    -1        0  unknown 0     upper
#> 610    apr      266        2    -1        0  unknown 0     upper
#> 611    feb      453        2   273        2  failure 0     upper
#> 612    jul      203        2    -1        0  unknown 0     upper
#> 613    may      140        5    -1        0  unknown 0     upper
#> 614    feb      403        2    -1        0  unknown 0     upper
#> 615    feb       99        1   102        6  success 1     upper
#> 616    may      322        1    -1        0  unknown 0   primary
#> 617    aug      259        1    35        1  failure 0     upper
#> 618    may      290        2    -1        0  unknown 0   primary
#> 619    jun      438        5    -1        0  unknown 0     upper
#> 620    apr       93        4    -1        0  unknown 0     upper
#> 621    feb       74        1    24        1  failure 0     upper
#> 622    feb      363        2    -1        0  unknown 0     upper
#> 623    aug       90        1    68        1  success 0     upper
#> 624    aug       69        2    -1        0  unknown 0     upper
#> 625    jul      236        4    -1        0  unknown 0   unknown
#> 626    nov      182        2    -1        0  unknown 0     upper
#> 627    nov       41        1    -1        0  unknown 0     upper
#> 628    nov      631        1    -1        0  unknown 0     upper
#> 629    may      103        5    -1        0  unknown 0     upper
#> 630    may      579        2   295        1  success 1     upper
#> 631    may      164        2    -1        0  unknown 0     upper
#> 632    jul      189        3    -1        0  unknown 0     upper
#> 633    feb      277        1    -1        0  unknown 0     upper
#> 634    jul      136        5    -1        0  unknown 0     upper
#> 635    may      329        1   168        2  success 0     upper
#> 636    aug      419        3    -1        0  unknown 0     upper
#> 637    jun      119        1    -1        0  unknown 0     upper
#> 638    jun       36        7    -1        0  unknown 0   primary
#> 639    jul      155        2    -1        0  unknown 0     upper
#> 640    jul      139        1    -1        0  unknown 0     upper
#> 641    jul      152        5    -1        0  unknown 0     upper
#> 642    jun       12       14    -1        0  unknown 0     upper
#> 643    may       88        2    -1        0  unknown 0     upper
#> 644    nov      116        4   154        1  failure 0     upper
#> 645    may      443        1    -1        0  unknown 0     upper
#> 646    may      214        1   305        1    other 1     upper
#> 647    feb      110        2    64        2  success 1     upper
#> 648    jul      101        2    -1        0  unknown 0     upper
#> 649    nov      177        2    -1        0  unknown 0     upper
#> 650    jul      289        1    -1        0  unknown 0     upper
#> 651    feb      362        2   169        2  failure 0     upper
#> 652    may      738        7    -1        0  unknown 0     upper
#> 653    may      128        2    -1        0  unknown 0     upper
#> 654    jan       76        1    -1        0  unknown 0     upper
#> 655    aug      175        2    -1        0  unknown 0     upper
#> 656    aug      206        2    -1        0  unknown 0     upper
#> 657    may      205        8    -1        0  unknown 0     upper
#> 658    may      152        3    -1        0  unknown 0     upper
#> 659    aug      542        1    78        5  failure 0     upper
#> 660    may       85        3    -1        0  unknown 0   unknown
#> 661    may      172        1    -1        0  unknown 0     upper
#> 662    apr      149        1    84        7  success 0     upper
#> 663    jul      151        1    -1        0  unknown 0     upper
#> 664    nov      233        1    -1        0  unknown 0     upper
#> 665    apr      396        3    -1        0  unknown 1     upper
#> 666    may       49        1    -1        0  unknown 0     upper
#> 667    may      201        1    -1        0  unknown 0     upper
#> 668    jun      285        4    -1        0  unknown 0     upper
#> 669    aug      125        1    -1        0  unknown 0     upper
#> 670    may      206        1    -1        0  unknown 0     upper
#> 671    jul       36        4    -1        0  unknown 0     upper
#> 672    nov      635        3   170        2  failure 0     upper
#> 673    aug      314        4    -1        0  unknown 0     upper
#> 674    apr      474        2    -1        0  unknown 0     upper
#> 675    jun      277        1    -1        0  unknown 0     upper
#> 676    jun       64        1    -1        0  unknown 0     upper
#> 677    nov      376        1    -1        0  unknown 0     upper
#> 678    feb      158        2    92        5  success 1     upper
#> 679    aug      115        5    -1        0  unknown 0   primary
#> 680    may      148        6   308        1  failure 0     upper
#> 681    nov      114        1    -1        0  unknown 0   primary
#> 682    jun       92        2    -1        0  unknown 0     upper
#> 683    jan       62        1    -1        0  unknown 0     upper
#> 684    aug      314        4    -1        0  unknown 0     upper
#> 685    may      104        3    -1        0  unknown 0     upper
#> 686    may      186        1    -1        0  unknown 0     upper
#> 687    mar      273        2   182        1  success 1   unknown
#> 688    aug      102        7    -1        0  unknown 0     upper
#> 689    may      246        2   370        2  success 0     upper
#> 690    aug      138        2    -1        0  unknown 0     upper
#> 691    jun       64        1    -1        0  unknown 0     upper
#> 692    jul      546        2   784        3  failure 1     upper
#> 693    aug     1503        2    -1        0  unknown 1     upper
#> 694    aug      220        1    -1        0  unknown 0     upper
#> 695    aug      585        4    -1        0  unknown 0     upper
#> 696    may      270        1    -1        0  unknown 0     upper
#> 697    jul      295        1    -1        0  unknown 0   primary
#> 698    feb       48        5    -1        0  unknown 0     upper
#> 699    jun      186        1    -1        0  unknown 0     upper
#> 700    apr      246        2   334        3    other 0     upper
#> 701    may      247        1    -1        0  unknown 0     upper
#> 702    jul      136        1    -1        0  unknown 0     upper
#> 703    aug      149       14    -1        0  unknown 0     upper
#> 704    may       70        1    -1        0  unknown 0     upper
#> 705    may       84        5    -1        0  unknown 0     upper
#> 706    jul      251        3    -1        0  unknown 0     upper
#> 707    jul       57        2    -1        0  unknown 0     upper
#> 708    jul      219        2    -1        0  unknown 0     upper
#> 709    may      164        1    -1        0  unknown 0     upper
#> 710    jun      126        1    -1        0  unknown 0   unknown
#> 711    jul       74        5    -1        0  unknown 0     upper
#> 712    may      266        2   168        1  failure 0     upper
#> 713    jul      194        2    -1        0  unknown 0     upper
#> 714    may       81        4    -1        0  unknown 0   primary
#> 715    feb       56        1   274        2  failure 0     upper
#> 716    feb      138        2    -1        0  unknown 0     upper
#> 717    jun       61        3    -1        0  unknown 0     upper
#> 718    jun      160        3    -1        0  unknown 0     upper
#> 719    may        8        7    -1        0  unknown 0     upper
#> 720    may      128        2    -1        0  unknown 0     upper
#> 721    feb      232        1   211        1  failure 0     upper
#> 722    jun      264        1    -1        0  unknown 0   primary
#> 723    nov      356        1    -1        0  unknown 0     upper
#> 724    nov      271        1   184        1  failure 0     upper
#> 725    apr        6        6   328        8  failure 0     upper
#> 726    may       74        7    -1        0  unknown 0   unknown
#> 727    oct      424        1   515        1  failure 1     upper
#> 728    aug      312        3    -1        0  unknown 0     upper
#> 729    may       87        5    -1        0  unknown 0     upper
#> 730    may      204        2    -1        0  unknown 0     upper
#> 731    may      408        2    -1        0  unknown 0     upper
#> 732    jul      413        1   181        3  success 1   primary
#> 733    jun      124        1   105        1  failure 0     upper
#> 734    may      797        2    -1        0  unknown 0   primary
#> 735    may      180        1    -1        0  unknown 0   primary
#> 736    jun     2028        1    -1        0  unknown 1     upper
#> 737    apr      203        1    -1        0  unknown 0     upper
#> 738    feb      162        2   184        1  failure 0     upper
#> 739    apr      856        3    -1        0  unknown 0     upper
#> 740    aug      135        6    -1        0  unknown 0     upper
#> 741    may       38        3    -1        0  unknown 0   primary
#> 742    aug      256        4    -1        0  unknown 0     upper
#> 743    aug       59        6    -1        0  unknown 0     upper
#> 744    aug      304        6    -1        0  unknown 0     upper
#> 745    aug      128        2    -1        0  unknown 0     upper
#> 746    jun      474        3    95        3    other 1     upper
#> 747    may       59        3    -1        0  unknown 0     upper
#> 748    jan      510        2    -1        0  unknown 0     upper
#> 749    may       52        8    -1        0  unknown 0     upper
#> 750    may      389        1    -1        0  unknown 0   primary
#> 751    aug      232        4    -1        0  unknown 0     upper
#> 752    apr      233        3    -1        0  unknown 0     upper
#> 753    nov      298        2    82        4    other 0     upper
#> 754    nov      287        3   117        2    other 0     upper
#> 755    may       58        1    -1        0  unknown 0     upper
#> 756    jul     1426        3    -1        0  unknown 1     upper
#> 757    sep      285        3    81        3  failure 1     upper
#> 758    feb       10        5    -1        0  unknown 0     upper
#> 759    jun      243        1    -1        0  unknown 0     upper
#> 760    jan      180        1    -1        0  unknown 0     upper
#> 761    may       93        2    -1        0  unknown 0     upper
#> 762    aug      229        4    -1        0  unknown 0     upper
#> 763    apr      313        3    -1        0  unknown 1     upper
#> 764    jul      140        3    -1        0  unknown 0     upper
#> 765    may       95        4    -1        0  unknown 0     upper
#> 766    aug      132        1    -1        0  unknown 0     upper
#> 767    may      210        3    -1        0  unknown 0     upper
#> 768    jun       99        5    -1        0  unknown 0   primary
#> 769    jul      393        3    -1        0  unknown 0     upper
#> 770    aug       31        9    -1        0  unknown 0   unknown
#> 771    apr      239        2   259        2  failure 0     upper
#> 772    jun      496        3    -1        0  unknown 0     upper
#> 773    aug      454        4    -1        0  unknown 0   primary
#> 774    apr      155        9    -1        0  unknown 0   unknown
#> 775    may      183        3    -1        0  unknown 0     upper
#> 776    may      318        1    -1        0  unknown 0     upper
#> 777    may      316        1    -1        0  unknown 0     upper
#> 778    apr      246        1   317        1  failure 0     upper
#> 779    jul       90        1    -1        0  unknown 0     upper
#> 780    jul       28        2    -1        0  unknown 0     upper
#> 781    jul      185        1    -1        0  unknown 0   primary
#> 782    aug      885        5    -1        0  unknown 0     upper
#> 783    may      435        2    -1        0  unknown 0     upper
#> 784    nov      140        1    -1        0  unknown 0     upper
#> 785    mar      271        2    -1        0  unknown 1   primary
#> 786    sep      120        3    -1        0  unknown 0     upper
#> 787    may       80        2    -1        0  unknown 0     upper
#> 788    feb      331        1    -1        0  unknown 0     upper
#> 789    may      171        6    -1        0  unknown 0     upper
#> 790    jun      276        1    -1        0  unknown 0     upper
#> 791    jun      162        3    -1        0  unknown 0     upper
#> 792    may       70        1    -1        0  unknown 0     upper
#> 793    jun      592        4    -1        0  unknown 1     upper
#> 794    may      165        1    56        3  failure 0     upper
#> 795    jun      179        1    -1        0  unknown 0     upper
#> 796    aug      232        2    -1        0  unknown 0     upper
#> 797    may       78        1    -1        0  unknown 0     upper
#> 798    aug      114        3    -1        0  unknown 0     upper
#> 799    may      136        2    -1        0  unknown 0     upper
#> 800    jul     1390        2    -1        0  unknown 0     upper
#> 801    may      152        1    -1        0  unknown 0   primary
#> 802    aug       74        2    -1        0  unknown 0     upper
#> 803    jul      119        2    -1        0  unknown 0     upper
#> 804    may      286        1   252        3  failure 0     upper
#> 805    nov      226        1    94        4  success 1     upper
#> 806    aug       54        3    -1        0  unknown 0   unknown
#> 807    feb      122        1    92        5  success 1     upper
#> 808    feb      105        1    -1        0  unknown 0     upper
#> 809    jan      414        2   192        3  failure 0     upper
#> 810    may      126        3    -1        0  unknown 0     upper
#> 811    jul       91        1    -1        0  unknown 0     upper
#> 812    jan       41        1   184        7  failure 0     upper
#> 813    may      943        2    -1        0  unknown 1     upper
#> 814    apr      332        2   335        1  failure 0     upper
#> 815    may      501        4    -1        0  unknown 0     upper
#> 816    jul      486        2    -1        0  unknown 0     upper
#> 817    jun       69        3    -1        0  unknown 0     upper
#> 818    jul      228        2    -1        0  unknown 0     upper
#> 819    nov      199        1   275        3  success 0     upper
#> 820    jun      141        1    -1        0  unknown 0     upper
#> 821    may      117        1    -1        0  unknown 0     upper
#> 822    aug      302        4    -1        0  unknown 0     upper
#> 823    nov       83        1   102        2  failure 0     upper
#> 824    may       57        5    -1        0  unknown 0     upper
#> 825    jul      185        2    -1        0  unknown 0     upper
#> 826    may      233        3    -1        0  unknown 0   primary
#> 827    may      110        3    -1        0  unknown 0     upper
#> 828    may      174        2    -1        0  unknown 0     upper
#> 829    may      248        2    -1        0  unknown 0     upper
#> 830    jul       38       18    -1        0  unknown 0     upper
#> 831    may      306        1    -1        0  unknown 0     upper
#> 832    jan      185        2    92        3  success 0     upper
#> 833    nov      161        2    -1        0  unknown 0     upper
#> 834    may      432        1    -1        0  unknown 0     upper
#> 835    jun      790        3    -1        0  unknown 0     upper
#> 836    may       86        3    -1        0  unknown 0     upper
#> 837    jun      130        6    -1        0  unknown 0     upper
#> 838    jun      330        1    -1        0  unknown 0     upper
#> 839    jun       56        1    -1        0  unknown 0     upper
#> 840    feb       11        6   231        9  failure 0   unknown
#> 841    may      240        3   370        1  failure 0     upper
#> 842    may      277        2   343        2  failure 0   primary
#> 843    aug       59        6    -1        0  unknown 0     upper
#> 844    may       82        4    -1        0  unknown 0     upper
#> 845    may      742        4    -1        0  unknown 1   primary
#> 846    may      305        2    -1        0  unknown 0     upper
#> 847    nov      318        1    -1        0  unknown 0     upper
#> 848    aug       81        2    -1        0  unknown 0     upper
#> 849    may      748        3    -1        0  unknown 1     upper
#> 850    may      308        1    -1        0  unknown 0   primary
#> 851    nov      331        2    -1        0  unknown 1     upper
#> 852    jan      491        1    -1        0  unknown 0   unknown
#> 853    apr      144        2    -1        0  unknown 0     upper
#> 854    jul      415        2   342        1    other 1     upper
#> 855    may      930        1    -1        0  unknown 1     upper
#> 856    may      120        2    -1        0  unknown 0     upper
#> 857    may      133        1    97        1  success 1     upper
#> 858    aug       83        5    -1        0  unknown 0   primary
#> 859    mar      102        2   184        2  failure 0     upper
#> 860    jan      207        2    -1        0  unknown 0     upper
#> 861    may      285        1    -1        0  unknown 0     upper
#> 862    aug       95        2    -1        0  unknown 0     upper
#> 863    feb      124        2     9        2    other 0   primary
#> 864    jun      447        2    96        1  success 1     upper
#> 865    jun      256        2    -1        0  unknown 0     upper
#> 866    aug      188        5    -1        0  unknown 0   primary
#> 867    jun      479        1    -1        0  unknown 1     upper
#> 868    jun      136        3    -1        0  unknown 0     upper
#> 869    jul     1121        1    -1        0  unknown 1     upper
#> 870    feb       73        1   252        1  failure 0     upper
#> 871    may      144        4    -1        0  unknown 0     upper
#> 872    jun      211        5    -1        0  unknown 0   primary
#> 873    nov       51        1    -1        0  unknown 0     upper
#> 874    feb      167        1   263        3    other 0     upper
#> 875    jul       51        2    -1        0  unknown 0     upper
#> 876    may      326        3   357       15    other 0   primary
#> 877    may      101        1   362        5    other 0     upper
#> 878    jul      174        1   199        3  failure 0     upper
#> 879    apr      292        4   247        1    other 0   unknown
#> 880    feb      171        2   193        2    other 0     upper
#> 881    jul      312        1    -1        0  unknown 0     upper
#> 882    nov       58        1   127        1  failure 0     upper
#> 883    jun       35        6    -1        0  unknown 0     upper
#> 884    jul      256        2   181        3  success 0   primary
#> 885    aug       66        4    -1        0  unknown 0     upper
#> 886    jun      192        1    93        7    other 1     upper
#> 887    jul      255        2    -1        0  unknown 0     upper
#> 888    jun      136        5    94       30  failure 0     upper
#> 889    jun      351        6    -1        0  unknown 0     upper
#> 890    jul      123        3    -1        0  unknown 0     upper
#> 891    aug      121        2    -1        0  unknown 0     upper
#> 892    may      161        2    -1        0  unknown 0     upper
#> 893    may      229        2   294        1    other 0     upper
#> 894    may      396        4    -1        0  unknown 0     upper
#> 895    may       88        2    -1        0  unknown 0   primary
#> 896    may      223        2    -1        0  unknown 0     upper
#> 897    may       13        3    -1        0  unknown 0     upper
#> 898    may      244        2    -1        0  unknown 0     upper
#> 899    may      274        1    -1        0  unknown 0   primary
#> 900    aug      144       18    -1        0  unknown 0     upper
#> 901    may      125        5    -1        0  unknown 0     upper
#> 902    may      347        2    -1        0  unknown 0     upper
#> 903    jun      869        2    -1        0  unknown 0     upper
#> 904    jun      174        3    -1        0  unknown 0     upper
#> 905    jul      276        8    97       12    other 1   unknown
#> 906    jan      339        2    -1        0  unknown 0     upper
#> 907    jun       96        2    -1        0  unknown 0     upper
#> 908    jul       61        6    -1        0  unknown 0   primary
#> 909    jul      632       18    -1        0  unknown 0     upper
#> 910    jun      109        2    -1        0  unknown 0   primary
#> 911    feb      280        2    -1        0  unknown 0     upper
#> 912    aug      339        2    -1        0  unknown 0     upper
#> 913    aug      211        7    -1        0  unknown 0     upper
#> 914    apr      165        2   327        3  failure 1   primary
#> 915    jun      354       17    -1        0  unknown 0     upper
#> 916    apr      122        4   238       12    other 0   primary
#> 917    nov      110        1    -1        0  unknown 0     upper
#> 918    may      918        1    -1        0  unknown 0     upper
#> 919    may      145        1    -1        0  unknown 1     upper
#> 920    nov      319        1   105        2    other 0     upper
#> 921    feb       61        1    -1        0  unknown 0     upper
#> 922    aug      633        1   182        2    other 1     upper
#> 923    jul      345        5    -1        0  unknown 0     upper
#> 924    apr      114        2   304        2  failure 0   primary
#> 925    may      119        1    -1        0  unknown 0     upper
#> 926    may     1062        1    -1        0  unknown 0     upper
#> 927    may      687        2   343        1  failure 1     upper
#> 928    aug      103        1   105        2  success 0     upper
#> 929    jun      335        3    -1        0  unknown 0   unknown
#> 930    oct      185        2    -1        0  unknown 0     upper
#> 931    apr      341        1    -1        0  unknown 0     upper
#> 932    nov      254        5    -1        0  unknown 1     upper
#> 933    jun      180        1    -1        0  unknown 0     upper
#> 934    apr      337        2    -1        0  unknown 0     upper
#> 935    nov       99        1   151        2  failure 0     upper
#> 936    jul      323        1    -1        0  unknown 0     upper
#> 937    jul      222        1    -1        0  unknown 0   primary
#> 938    nov      105        1   179        2  failure 0     upper
#> 939    aug      117        4    -1        0  unknown 0     upper
#> 940    apr      207        1   308        2  failure 0     upper
#> 941    oct      323        1    -1        0  unknown 1     upper
#> 942    jul      275        4    -1        0  unknown 0     upper
#> 943    apr      309        2    -1        0  unknown 0     upper
#> 944    may      225        1    -1        0  unknown 0     upper
#> 945    jul      316        4    -1        0  unknown 1     upper
#> 946    may      473        2    -1        0  unknown 0     upper
#> 947    may      393        2    -1        0  unknown 0   primary
#> 948    jul      227        8    -1        0  unknown 0     upper
#> 949    may      609        1    -1        0  unknown 1     upper
#> 950    may      189        1    -1        0  unknown 0   primary
#> 951    may      323        1    -1        0  unknown 0     upper
#> 952    nov      113        1    -1        0  unknown 0     upper
#> 953    feb      432        1    -1        0  unknown 0     upper
#> 954    apr       43        3    -1        0  unknown 0   primary
#> 955    may      489        1    -1        0  unknown 0     upper
#> 956    jul      362        2    -1        0  unknown 0     upper
#> 957    apr      101        1    -1        0  unknown 0     upper
#> 958    nov      179        1    -1        0  unknown 0     upper
#> 959    may        8        4   300        5  failure 0   primary
#> 960    feb      389        1    -1        0  unknown 0   unknown
#> 961    jul       64        1    -1        0  unknown 0   primary
#> 962    may      223        9     4        1  success 0     upper
#> 963    feb      151        1    -1        0  unknown 0     upper
#> 964    may      354        1    -1        0  unknown 0     upper
#> 965    feb      253        1    -1        0  unknown 0     upper
#> 966    nov       15        1    -1        0  unknown 0     upper
#> 967    jun      459        3    -1        0  unknown 0   primary
#> 968    jun      193        2    -1        0  unknown 0   primary
#> 969    jul      345        1    -1        0  unknown 0     upper
#> 970    jan      389        3    -1        0  unknown 0     upper
#> 971    jan      305        2   261        2  failure 0   primary
#> 972    apr       96        3   330        1    other 0     upper
#> 973    jul      465        6    -1        0  unknown 0   primary
#> 974    feb       39        1    -1        0  unknown 0     upper
#> 975    apr      368        1   336        2  failure 0     upper
#> 976    jul      112        1    -1        0  unknown 0     upper
#> 977    apr       26        4   150        5  failure 0   primary
#> 978    jul      163        2    -1        0  unknown 0     upper
#> 979    may      132        1    -1        0  unknown 0     upper
#> 980    jan       67        1    -1        0  unknown 0     upper
#> 981    may      634        2    -1        0  unknown 0   primary
#> 982    apr      174        2    -1        0  unknown 0     upper
#> 983    may      157        4   367        1  failure 0     upper
#> 984    may      421        3    -1        0  unknown 0     upper
#> 985    may      104        3   371        2  failure 0     upper
#> 986    jun      355        1    -1        0  unknown 0     upper
#> 987    nov      401        1    -1        0  unknown 0     upper
#> 988    jun      772        1    -1        0  unknown 0     upper
#> 989    may      268        1    -1        0  unknown 0     upper
#> 990    apr      532        1    -1        0  unknown 1     upper
#> 991    aug      256        2    -1        0  unknown 0     upper
#> 992    jul      605        6    -1        0  unknown 0     upper
#> 993    aug       92        2    -1        0  unknown 0     upper
#> 994    jun      298        3    -1        0  unknown 0     upper
#> 995    nov      614        1    -1        0  unknown 1     upper
#> 996    nov      113        1    -1        0  unknown 0     upper
#> 997    may       45        1    -1        0  unknown 0   primary
#> 998    jan      259        1   259        9  failure 0     upper
#> 999    may       10        5    -1        0  unknown 0   primary
#> 1000   may      218        1    -1        0  unknown 0     upper
#> 1001   may        6        2    -1        0  unknown 0   primary
#> 1002   nov      543        1    -1        0  unknown 1     upper
#> 1003   feb      105        7   188        2  failure 0   primary
#> 1004   nov      369        1   191        1  failure 0     upper
#> 1005   jul      220        2    -1        0  unknown 0   primary
#> 1006   apr      297        1    -1        0  unknown 0     upper
#> 1007   jul      103        3    -1        0  unknown 0     upper
#> 1008   jun       63        1    -1        0  unknown 0     upper
#> 1009   jun      677        3    -1        0  unknown 1     upper
#> 1010   may      133        2    -1        0  unknown 0     upper
#> 1011   nov      433        1   113        1  failure 0     upper
#> 1012   may       91        3   361        1  failure 0     upper
#> 1013   nov      501        1    -1        0  unknown 0     upper
#> 1014   aug      153        2    -1        0  unknown 0     upper
#> 1015   jul      771        1    -1        0  unknown 0     upper
#> 1016   may      233        1    -1        0  unknown 0   primary
#> 1017   jun      979        9    -1        0  unknown 0     upper
#> 1018   may      201        1   345        1    other 0     upper
#> 1019   may      188        1    -1        0  unknown 0     upper
#> 1020   aug      398        2    -1        0  unknown 0     upper
#> 1021   apr      271        1   187        1  failure 0     upper
#> 1022   aug      112        1    -1        0  unknown 0   unknown
#> 1023   feb      450        3    -1        0  unknown 0     upper
#> 1024   may      165        3    -1        0  unknown 0   unknown
#> 1025   aug      152        2    -1        0  unknown 0     upper
#> 1026   may      959        3   174        7    other 1     upper
#> 1027   jul      262        1    -1        0  unknown 0     upper
#> 1028   may      161        2    -1        0  unknown 0     upper
#> 1029   may      253        2    -1        0  unknown 0     upper
#> 1030   may      204        3    -1        0  unknown 0     upper
#> 1031   may      242        1    -1        0  unknown 0     upper
#> 1032   may      102        2    -1        0  unknown 0     upper
#> 1033   may       60        5   371        2  failure 0     upper
#> 1034   jun      263        8    -1        0  unknown 0   primary
#> 1035   nov      169        1    -1        0  unknown 0     upper
#> 1036   nov      214        3    -1        0  unknown 0     upper
#> 1037   jan       81        1    -1        0  unknown 0     upper
#> 1038   jul      110        3    -1        0  unknown 0   unknown
#> 1039   aug      384        6    -1        0  unknown 0     upper
#> 1040   aug      188        4    -1        0  unknown 0     upper
#> 1041   may      282        2    -1        0  unknown 0     upper
#> 1042   may      601        3    -1        0  unknown 1     upper
#> 1043   may     1287        2    -1        0  unknown 0     upper
#> 1044   may       33        5    -1        0  unknown 0     upper
#> 1045   jul      455        1    -1        0  unknown 1     upper
#> 1046   apr      241        2   317        1  failure 0     upper
#> 1047   apr      158        2   329        1  failure 0     upper
#> 1048   may       75        1    -1        0  unknown 0     upper
#> 1049   jul       86        3    -1        0  unknown 0     upper
#> 1050   jan      121        1   190        2  failure 0     upper
#> 1051   jul      185        1    -1        0  unknown 0     upper
#> 1052   may       90        1    -1        0  unknown 0   primary
#> 1053   apr       61        3    -1        0  unknown 0   primary
#> 1054   feb       48        7    -1        0  unknown 0   unknown
#> 1055   jul      206        6    -1        0  unknown 0     upper
#> 1056   may      670        4   346        1  failure 1     upper
#> 1057   may      249        4   332        3  failure 0   unknown
#> 1058   may      236        1    -1        0  unknown 0     upper
#> 1059   apr      358        2    -1        0  unknown 0     upper
#> 1060   nov      154        3   189        1  failure 0     upper
#> 1061   may      125        2    -1        0  unknown 0     upper
#> 1062   aug      117        2    -1        0  unknown 0     upper
#> 1063   jul      337        1    -1        0  unknown 0     upper
#> 1064   may      380        2   355        1  failure 0     upper
#> 1065   jun      130        1    -1        0  unknown 0   primary
#> 1066   jul      354        1    -1        0  unknown 0     upper
#> 1067   aug       42        1    -1        0  unknown 0     upper
#> 1068   may     1207        1    -1        0  unknown 1     upper
#> 1069   may      240        2   343        5  failure 0   primary
#> 1070   nov      295        2    -1        0  unknown 0     upper
#> 1071   jun      416        3    -1        0  unknown 0     upper
#> 1072   may      229        2   355        1  failure 0     upper
#> 1073   may      208        1    -1        0  unknown 0     upper
#> 1074   nov      193        1    -1        0  unknown 0     upper
#> 1075   may      158        2    -1        0  unknown 0     upper
#> 1076   jul       70        2    -1        0  unknown 0     upper
#> 1077   jul      145        4    -1        0  unknown 0     upper
#> 1078   may      309        2    -1        0  unknown 0   primary
#> 1079   may      249        3    -1        0  unknown 0     upper
#> 1080   jan      626        1    -1        0  unknown 0   primary
#> 1081   feb      138        2   184        3  success 1     upper
#> 1082   jul      602        1    -1        0  unknown 0     upper
#> 1083   may      212        1    -1        0  unknown 0     upper
#> 1084   feb      103        1   248        1  failure 0     upper
#> 1085   may      217        5    -1        0  unknown 0     upper
#> 1086   nov      179        1   197        1  failure 0     upper
#> 1087   nov      615        3    34        1  failure 1   primary
#> 1088   jun      230        3    -1        0  unknown 0     upper
#> 1089   nov      111        2   156        1  failure 0   primary
#> 1090   may       16        5    -1        0  unknown 0     upper
#> 1091   mar      171        4    -1        0  unknown 0     upper
#> 1092   feb      185        1    92        1  success 1     upper
#> 1093   nov      162        1   175        2  failure 0     upper
#> 1094   jul       98        1    -1        0  unknown 0     upper
#> 1095   may      223        1    -1        0  unknown 0     upper
#> 1096   may      677        1    -1        0  unknown 0   unknown
#> 1097   aug      109        2    -1        0  unknown 0     upper
#> 1098   may      267        2    -1        0  unknown 0     upper
#> 1099   nov      123        1   196        1  success 1     upper
#> 1100   jun      712        1    64       12  failure 1     upper
#> 1101   mar      229        1    -1        0  unknown 1     upper
#> 1102   may      267        1    -1        0  unknown 0     upper
#> 1103   may       86        2    -1        0  unknown 0     upper
#> 1104   may       98        4    -1        0  unknown 0   primary
#> 1105   may      287        3    -1        0  unknown 0   primary
#> 1106   jul      132       10    -1        0  unknown 0   primary
#> 1107   jun      647        2    -1        0  unknown 0     upper
#> 1108   nov       49        1    -1        0  unknown 0     upper
#> 1109   feb      406        2    -1        0  unknown 0     upper
#> 1110   oct      290        2    -1        0  unknown 1   primary
#> 1111   aug      223        7    -1        0  unknown 0     upper
#> 1112   jul       70        1    -1        0  unknown 0     upper
#> 1113   may      311        5    -1        0  unknown 0   primary
#> 1114   jun       57        8    -1        0  unknown 0     upper
#> 1115   nov        7        5    -1        0  unknown 0     upper
#> 1116   jun      207        1    -1        0  unknown 0     upper
#> 1117   jul       93        2    -1        0  unknown 0     upper
#> 1118   may      806        4    -1        0  unknown 0     upper
#> 1119   jul      214        1    -1        0  unknown 0   primary
#> 1120   may      135        1    -1        0  unknown 0     upper
#> 1121   jan      119        1    -1        0  unknown 0     upper
#> 1122   apr      387        3    87        1  success 1     upper
#> 1123   jul      733        3    -1        0  unknown 1     upper
#> 1124   aug       91        4    -1        0  unknown 0     upper
#> 1125   aug      138        2    -1        0  unknown 0   primary
#> 1126   jun      392        1    -1        0  unknown 0     upper
#> 1127   aug      773        4    -1        0  unknown 1     upper
#> 1128   jul       75        3    -1        0  unknown 0     upper
#> 1129   jun       92        2    -1        0  unknown 0     upper
#> 1130   jan       84        3   183        3  failure 0     upper
#> 1131   feb        8        7   248        9  success 0     upper
#> 1132   jul      225        1    -1        0  unknown 0   primary
#> 1133   jan      399        1    -1        0  unknown 0   primary
#> 1134   jun      288        2    -1        0  unknown 0     upper
#> 1135   jul      366        1    -1        0  unknown 0   unknown
#> 1136   jul      131        4    -1        0  unknown 0     upper
#> 1137   jul      157        1    -1        0  unknown 0     upper
#> 1138   nov      141        2    -1        0  unknown 0     upper
#> 1139   jun      122        1    -1        0  unknown 0     upper
#> 1140   apr      592        4   316        3  failure 1     upper
#> 1141   jun      132        1    -1        0  unknown 0     upper
#> 1142   may      155        1    -1        0  unknown 0     upper
#> 1143   may      165        4    -1        0  unknown 0   primary
#> 1144   may      147        1    -1        0  unknown 0     upper
#> 1145   apr       91        2   275        1  failure 0     upper
#> 1146   jun      112        2    -1        0  unknown 0     upper
#> 1147   apr      598        1   150        1  failure 0     upper
#> 1148   jul      178        3    -1        0  unknown 0     upper
#> 1149   jul      230        2    -1        0  unknown 0     upper
#> 1150   jul      125        2    -1        0  unknown 0   primary
#> 1151   may      109        2    -1        0  unknown 0     upper
#> 1152   jul      122        7    -1        0  unknown 0     upper
#> 1153   may      128        6    -1        0  unknown 0     upper
#> 1154   jul       83        2    -1        0  unknown 0     upper
#> 1155   nov      173        1    -1        0  unknown 0     upper
#> 1156   nov       58        1   188        1  failure 0     upper
#> 1157   apr       20        2   335       12  failure 0     upper
#> 1158   aug      135       22    -1        0  unknown 0     upper
#> 1159   jun      144        1    -1        0  unknown 0     upper
#> 1160   may      225        1    -1        0  unknown 0     upper
#> 1161   aug      256        2    -1        0  unknown 0     upper
#> 1162   may       28        2   345        3    other 0     upper
#> 1163   jul      124        3    -1        0  unknown 0   unknown
#> 1164   jul      727        4    -1        0  unknown 1   primary
#> 1165   jul      122        3    -1        0  unknown 0     upper
#> 1166   may      237        1    -1        0  unknown 0     upper
#> 1167   jul       60        1    -1        0  unknown 0     upper
#> 1168   jul      183        1    -1        0  unknown 0     upper
#> 1169   jun       77        1    -1        0  unknown 0     upper
#> 1170   apr     1090        1    -1        0  unknown 0     upper
#> 1171   nov      282        1    -1        0  unknown 0   primary
#> 1172   may      199        1   173        2  failure 0     upper
#> 1173   jul      593        2    -1        0  unknown 0     upper
#> 1174   jul      126       23    -1        0  unknown 0     upper
#> 1175   aug      251        3    -1        0  unknown 0     upper
#> 1176   jul      123        4    -1        0  unknown 0     upper
#> 1177   feb       98        2    -1        0  unknown 0   primary
#> 1178   jun      497        2    -1        0  unknown 0   unknown
#> 1179   jul      830        5    -1        0  unknown 1     upper
#> 1180   may      485        1    -1        0  unknown 0     upper
#> 1181   aug      637        2    -1        0  unknown 1     upper
#> 1182   feb      170        2    -1        0  unknown 1     upper
#> 1183   jan      122        4    50        4    other 0     upper
#> 1184   jun      561        1    -1        0  unknown 0   unknown
#> 1185   may      114        2    -1        0  unknown 0   primary
#> 1186   jun       34       29    -1        0  unknown 0   primary
#> 1187   aug       15       19    -1        0  unknown 0     upper
#> 1188   jul      154       14    -1        0  unknown 0   unknown
#> 1189   jul       98       13    -1        0  unknown 0     upper
#> 1190   jul      212        4    -1        0  unknown 0   unknown
#> 1191   may      692        1    -1        0  unknown 0     upper
#> 1192   jul      301        2    88        5  failure 0     upper
#> 1193   may      412        2    -1        0  unknown 0     upper
#> 1194   may      877        7   300        2    other 1     upper
#> 1195   mar      236        2    -1        0  unknown 0     upper
#> 1196   may      354        1    -1        0  unknown 1     upper
#> 1197   jan       79        2   265        2  failure 0     upper
#> 1198   apr      329        2    -1        0  unknown 0     upper
#> 1199   jul      245        1    -1        0  unknown 0     upper
#> 1200   may      504        2    -1        0  unknown 0     upper
#> 1201   may      437        3   347        3    other 1     upper
#> 1202   apr      144        1    -1        0  unknown 1     upper
#> 1203   jul      264        2    -1        0  unknown 0     upper
#> 1204   may      178        2    -1        0  unknown 0   primary
#> 1205   may      173        1    -1        0  unknown 0     upper
#> 1206   jan      258        5   248        2  failure 0   unknown
#> 1207   feb      666        4    -1        0  unknown 1     upper
#> 1208   dec      283        2   196        1  success 1     upper
#> 1209   feb      372        1    -1        0  unknown 1     upper
#> 1210   apr       46        4    -1        0  unknown 0     upper
#> 1211   may       77        3    -1        0  unknown 0     upper
#> 1212   jan     1424        1    -1        0  unknown 0     upper
#> 1213   jul      152        1    -1        0  unknown 0     upper
#> 1214   jul      427        1    -1        0  unknown 0     upper
#> 1215   apr      171        2    -1        0  unknown 0     upper
#> 1216   apr     1196        1    -1        0  unknown 1     upper
#> 1217   may      211        1    -1        0  unknown 0     upper
#> 1218   may      154        3   367        2  failure 0     upper
#> 1219   may      198        2    -1        0  unknown 0     upper
#> 1220   may      225        1    -1        0  unknown 0     upper
#> 1221   may      145        2    -1        0  unknown 0     upper
#> 1222   may      165        2    -1        0  unknown 0     upper
#> 1223   nov      596        1   182        1    other 1     upper
#> 1224   aug      150        2    -1        0  unknown 0     upper
#> 1225   jun      110        1    -1        0  unknown 0   primary
#> 1226   apr      146        1   281        1  failure 0     upper
#> 1227   apr      271        1   300        2  success 0   primary
#> 1228   nov      289        1    -1        0  unknown 0     upper
#> 1229   feb      142        2    -1        0  unknown 0     upper
#> 1230   nov      103        1   141        2  failure 0     upper
#> 1231   may      186        5    -1        0  unknown 0   primary
#> 1232   jan     1121        2   205        3  failure 0     upper
#> 1233   aug      121        1    -1        0  unknown 0     upper
#> 1234   may      325        1    -1        0  unknown 0     upper
#> 1235   aug      331        2    -1        0  unknown 0     upper
#> 1236   jun      115        4    -1        0  unknown 0     upper
#> 1237   may      144        1    -1        0  unknown 0   unknown
#> 1238   aug      203        4    -1        0  unknown 0     upper
#> 1239   jun      213        1    -1        0  unknown 0   primary
#> 1240   nov       61        2   131        1  failure 0     upper
#> 1241   apr      707        1   149        2  failure 0     upper
#> 1242   may       41        8    -1        0  unknown 0   primary
#> 1243   jul       67       11    -1        0  unknown 0     upper
#> 1244   may      180        2    -1        0  unknown 0     upper
#> 1245   may      103        2    -1        0  unknown 0   primary
#> 1246   sep      260        3    95        3  success 1     upper
#> 1247   aug      335        3    -1        0  unknown 0     upper
#> 1248   apr      460        2   345        2  failure 0     upper
#> 1249   aug      291        1    -1        0  unknown 0     upper
#> 1250   jan      126        1    -1        0  unknown 0   unknown
#> 1251   aug      360        1    -1        0  unknown 0     upper
#> 1252   apr      370        3    -1        0  unknown 1     upper
#> 1253   aug      351        2    -1        0  unknown 0     upper
#> 1254   jul       70        1    -1        0  unknown 0     upper
#> 1255   mar      180        2    -1        0  unknown 1     upper
#> 1256   mar       96        6    -1        0  unknown 0     upper
#> 1257   may      611        2    -1        0  unknown 0     upper
#> 1258   aug       19       16    -1        0  unknown 0   unknown
#> 1259   jun      482        2    -1        0  unknown 1   primary
#> 1260   may      295        2    -1        0  unknown 0     upper
#> 1261   jul      124        1    -1        0  unknown 0     upper
#> 1262   may       70        3    -1        0  unknown 0   primary
#> 1263   apr      571        1    -1        0  unknown 1     upper
#> 1264   may      143        2   370        2  failure 0   primary
#> 1265   may       66        1    -1        0  unknown 0     upper
#> 1266   nov       89        2    -1        0  unknown 0     upper
#> 1267   apr     1007        3   325        4  failure 0   primary
#> 1268   aug      173        1    92        5  success 1     upper
#> 1269   jul     2201        1    -1        0  unknown 0     upper
#> 1270   jul      285        1    -1        0  unknown 0     upper
#> 1271   feb      751        2    76        4  failure 1     upper
#> 1272   may      543        1    -1        0  unknown 1     upper
#> 1273   aug      147        1   379        1  failure 0     upper
#> 1274   apr      346        2    -1        0  unknown 0     upper
#> 1275   nov      661        4    -1        0  unknown 0     upper
#> 1276   jul      268        2    -1        0  unknown 0     upper
#> 1277   jul       61        4    -1        0  unknown 0     upper
#> 1278   nov      258        2    -1        0  unknown 0     upper
#> 1279   may       45       13    -1        0  unknown 0     upper
#> 1280   jul       53        1    -1        0  unknown 0     upper
#> 1281   feb      226        1    -1        0  unknown 0     upper
#> 1282   jun       42        7    -1        0  unknown 0     upper
#> 1283   jul      812        1    -1        0  unknown 1     upper
#> 1284   may      262        3    -1        0  unknown 0     upper
#> 1285   aug      579        2    -1        0  unknown 1     upper
#> 1286   jan      801        1    -1        0  unknown 1   primary
#> 1287   may      493        2    -1        0  unknown 0     upper
#> 1288   aug      271        4    -1        0  unknown 0     upper
#> 1289   jul      427        2    94        4  failure 0     upper
#> 1290   apr      163        3    -1        0  unknown 0     upper
#> 1291   may      141        1    -1        0  unknown 0     upper
#> 1292   may      160        1    -1        0  unknown 0     upper
#> 1293   may       55        2    -1        0  unknown 0   unknown
#> 1294   may       66        9    -1        0  unknown 0     upper
#> 1295   may      108        3    -1        0  unknown 0   primary
#> 1296   sep      106        1    -1        0  unknown 0   unknown
#> 1297   aug       68       27    -1        0  unknown 0     upper
#> 1298   may      210        3    -1        0  unknown 0     upper
#> 1299   may       20        6    -1        0  unknown 0     upper
#> 1300   may      104        4   252        3  failure 0     upper
#> 1301   may      227        1    -1        0  unknown 0     upper
#> 1302   may      201        1    -1        0  unknown 0     upper
#> 1303   aug      610        2    -1        0  unknown 0     upper
#> 1304   apr      381        1   269        1  failure 1     upper
#> 1305   may      184        1    -1        0  unknown 0     upper
#> 1306   may      369        1    -1        0  unknown 0     upper
#> 1307   aug      111        5    -1        0  unknown 0     upper
#> 1308   may      282        2    -1        0  unknown 0     upper
#> 1309   aug      603        3    -1        0  unknown 1     upper
#> 1310   jun       21        1    -1        0  unknown 0     upper
#> 1311   may       12        5    -1        0  unknown 0     upper
#> 1312   jul     1106        1    -1        0  unknown 0     upper
#> 1313   may       98        1   178        1  failure 0     upper
#> 1314   aug      553        1    -1        0  unknown 1     upper
#> 1315   may     1076        3   175        1  success 1     upper
#> 1316   may      369        1    -1        0  unknown 0     upper
#> 1317   jun      142        2    -1        0  unknown 0     upper
#> 1318   apr      179        1    -1        0  unknown 0     upper
#> 1319   jan       54        1    -1        0  unknown 0   primary
#> 1320   jun      277        2    -1        0  unknown 0     upper
#> 1321   aug      295        2    -1        0  unknown 0     upper
#> 1322   may      294        1    -1        0  unknown 0     upper
#> 1323   may      232        1    89        4    other 1   unknown
#> 1324   nov      127        3    -1        0  unknown 0     upper
#> 1325   may      185        1    -1        0  unknown 0     upper
#> 1326   may      203        1    -1        0  unknown 0     upper
#> 1327   nov      157        1    -1        0  unknown 0   primary
#> 1328   jan      217        2    -1        0  unknown 0     upper
#> 1329   jun      409        1    -1        0  unknown 0   unknown
#> 1330   may      328        2    -1        0  unknown 0     upper
#> 1331   apr      660        3    -1        0  unknown 0     upper
#> 1332   may      157        5    -1        0  unknown 0     upper
#> 1333   jan      403        2    -1        0  unknown 1     upper
#> 1334   may      215        1    -1        0  unknown 0     upper
#> 1335   may       68        2   363        2  failure 0   primary
#> 1336   aug       93        1   190        2    other 0     upper
#> 1337   jun       53        1    -1        0  unknown 0     upper
#> 1338   jul      199        2    -1        0  unknown 0   primary
#> 1339   nov      442        4    -1        0  unknown 0     upper
#> 1340   aug      403        2    -1        0  unknown 0     upper
#> 1341   may      116       12    -1        0  unknown 0     upper
#> 1342   may      185        6    -1        0  unknown 0     upper
#> 1343   jun       22       15    -1        0  unknown 0     upper
#> 1344   may      452        2    -1        0  unknown 0     upper
#> 1345   may      323        1    -1        0  unknown 0     upper
#> 1346   may      752        2    -1        0  unknown 0     upper
#> 1347   jul      118        3    -1        0  unknown 0     upper
#> 1348   may       92        2    -1        0  unknown 0   unknown
#> 1349   jan       27        1    -1        0  unknown 0     upper
#> 1350   jun      169        2    -1        0  unknown 0     upper
#> 1351   may      470        1    -1        0  unknown 0   unknown
#> 1352   may      193        1    -1        0  unknown 0   primary
#> 1353   jul      195        2    -1        0  unknown 0     upper
#> 1354   apr      264        1   317        1  failure 0     upper
#> 1355   feb      269        9    -1        0  unknown 0     upper
#> 1356   jan      411        1    -1        0  unknown 1     upper
#> 1357   aug      526        2    -1        0  unknown 1     upper
#> 1358   aug       83        1    -1        0  unknown 0     upper
#> 1359   may       17        8    -1        0  unknown 0     upper
#> 1360   may      112        2    -1        0  unknown 0     upper
#> 1361   feb       94        4   271        4  failure 0     upper
#> 1362   jun      441        3    -1        0  unknown 0     upper
#> 1363   feb       83        3    -1        0  unknown 0     upper
#> 1364   may      102       23    -1        0  unknown 0   primary
#> 1365   aug       62        3    -1        0  unknown 0   primary
#> 1366   jul      141        2    -1        0  unknown 0     upper
#> 1367   jul      241        2    -1        0  unknown 0   primary
#> 1368   may      255        5    -1        0  unknown 0     upper
#> 1369   jun        6        1    -1        0  unknown 0   primary
#> 1370   may      226        1    -1        0  unknown 0     upper
#> 1371   oct      147        1    92        5    other 1     upper
#> 1372   jul      132        4    -1        0  unknown 0     upper
#> 1373   may      379        2    -1        0  unknown 0     upper
#> 1374   aug       73        2    -1        0  unknown 0     upper
#> 1375   may      177        4   367        1  failure 0     upper
#> 1376   may      213        5    -1        0  unknown 0   primary
#> 1377   may      182        1    -1        0  unknown 0     upper
#> 1378   apr      575        2    -1        0  unknown 0     upper
#> 1379   jul      258        2    -1        0  unknown 0     upper
#> 1380   aug      237        1   180        6  success 1     upper
#> 1381   jul        9        1    -1        0  unknown 0     upper
#> 1382   may       45        5    -1        0  unknown 0     upper
#> 1383   jul      633        7    -1        0  unknown 0     upper
#> 1384   jun      301        6    -1        0  unknown 0     upper
#> 1385   jul      108        1    -1        0  unknown 0     upper
#> 1386   jan      192        1    -1        0  unknown 0     upper
#> 1387   nov      250        2    -1        0  unknown 0     upper
#> 1388   apr      344        1    74        2  failure 1     upper
#> 1389   may      221        2   350        4    other 0     upper
#> 1390   jun       48        2    -1        0  unknown 0     upper
#> 1391   aug      124        3    -1        0  unknown 0     upper
#> 1392   may      237        1   368        1    other 0     upper
#> 1393   feb      108        2   195        6  failure 0     upper
#> 1394   feb      604        1    -1        0  unknown 0     upper
#> 1395   aug       34       14    -1        0  unknown 0     upper
#> 1396   nov     1091        2   150        1  success 1     upper
#> 1397   may      200        5    -1        0  unknown 0     upper
#> 1398   may      159        1    -1        0  unknown 0     upper
#> 1399   apr      193        2   322        1    other 0   primary
#> 1400   may       36        7   165        5    other 0     upper
#> 1401   jun       48        3    -1        0  unknown 0     upper
#> 1402   may      350        5   286        2  failure 0     upper
#> 1403   aug       77        9    -1        0  unknown 0     upper
#> 1404   jan       58        1    -1        0  unknown 0     upper
#> 1405   may      282        2    -1        0  unknown 0     upper
#> 1406   nov      329        1    -1        0  unknown 0     upper
#> 1407   feb      281        2   270        2    other 0     upper
#> 1408   aug       63        6    -1        0  unknown 0     upper
#> 1409   jun      168        2    -1        0  unknown 0     upper
#> 1410   may      395        1    -1        0  unknown 0     upper
#> 1411   jun      193        2    -1        0  unknown 0     upper
#> 1412   feb       62        1    -1        0  unknown 0     upper
#> 1413   nov      744        2    -1        0  unknown 0     upper
#> 1414   aug      104        6    -1        0  unknown 0     upper
#> 1415   jul      249        3    -1        0  unknown 0     upper
#> 1416   nov      123        1   124        1  failure 0     upper
#> 1417   may       44        1   355        3  failure 0     upper
#> 1418   jun      188        1    -1        0  unknown 0     upper
#> 1419   sep      104        1   380        3  failure 0     upper
#> 1420   may      173        4    -1        0  unknown 0     upper
#> 1421   apr       96        2   344        2  failure 0     upper
#> 1422   aug      256        2    -1        0  unknown 0     upper
#> 1423   may      170        1    -1        0  unknown 0     upper
#> 1424   may      245        4    -1        0  unknown 0     upper
#> 1425   may      245        1    -1        0  unknown 0     upper
#> 1426   jul      277        1    -1        0  unknown 0     upper
#> 1427   may      198        1    -1        0  unknown 0   primary
#> 1428   may      290        2    -1        0  unknown 0     upper
#> 1429   may      154        2    -1        0  unknown 0   primary
#> 1430   jul      149        1    -1        0  unknown 0   primary
#> 1431   jul      323        2   163        2    other 1     upper
#> 1432   may       63        5    -1        0  unknown 0   primary
#> 1433   may      162        2   350        4  failure 0     upper
#> 1434   aug      231        1    -1        0  unknown 0     upper
#> 1435   jan      456        1   205        2    other 0     upper
#> 1436   may      212        2    -1        0  unknown 0     upper
#> 1437   nov      426        2    -1        0  unknown 0     upper
#> 1438   apr      444        2    -1        0  unknown 0     upper
#> 1439   nov      240        3   119        2  failure 0     upper
#> 1440   sep      770        3    -1        0  unknown 1   unknown
#> 1441   jun       93        2    -1        0  unknown 0     upper
#> 1442   aug      154        2    -1        0  unknown 0     upper
#> 1443   jul       60        2    -1        0  unknown 0     upper
#> 1444   jul      202        2    -1        0  unknown 0     upper
#> 1445   may      204        1   331        3  success 0     upper
#> 1446   jun      129        1    -1        0  unknown 0     upper
#> 1447   apr      149        1   268        2    other 0     upper
#> 1448   aug      122        5    -1        0  unknown 0     upper
#> 1449   apr      201        1    -1        0  unknown 0     upper
#> 1450   jan      309        1    -1        0  unknown 0     upper
#> 1451   aug      146        1   286        2  failure 1     upper
#> 1452   feb      217        1    -1        0  unknown 0     upper
#> 1453   jul      412        1    -1        0  unknown 0     upper
#> 1454   jul      395        6    -1        0  unknown 0     upper
#> 1455   jun       71        1    -1        0  unknown 0     upper
#> 1456   may      105        1    -1        0  unknown 0     upper
#> 1457   may      189        2    -1        0  unknown 0     upper
#> 1458   feb      128        2    -1        0  unknown 0     upper
#> 1459   jul      321        2    -1        0  unknown 0     upper
#> 1460   nov       36        1    -1        0  unknown 0     upper
#> 1461   jul       58        2    -1        0  unknown 0     upper
#> 1462   aug      121        4    -1        0  unknown 0     upper
#> 1463   jul      287        2   181        1  success 1     upper
#> 1464   jun      310        4    -1        0  unknown 0     upper
#> 1465   jun      115        1    -1        0  unknown 0   unknown
#> 1466   may       71        3    -1        0  unknown 0   primary
#> 1467   aug      328        1    -1        0  unknown 0     upper
#> 1468   sep        9        1    -1        0  unknown 0     upper
#> 1469   nov       91        3    -1        0  unknown 0     upper
#> 1470   jun       61       23    -1        0  unknown 0   primary
#> 1471   jul      232        3    -1        0  unknown 0     upper
#> 1472   jan       30        1    -1        0  unknown 0   primary
#> 1473   jun        9       28    -1        0  unknown 0     upper
#> 1474   apr      740        3    -1        0  unknown 1     upper
#> 1475   may      105        1    -1        0  unknown 0     upper
#> 1476   may     1730        1    -1        0  unknown 1     upper
#> 1477   apr      462        1    -1        0  unknown 0   primary
#> 1478   may      106        1    -1        0  unknown 0     upper
#> 1479   sep      990        4    -1        0  unknown 0     upper
#> 1480   may      213        4    -1        0  unknown 0     upper
#> 1481   may      154        1    -1        0  unknown 0   primary
#> 1482   jan       58        1    -1        0  unknown 0     upper
#> 1483   jun      157        1    -1        0  unknown 0     upper
#> 1484   may      166        3    -1        0  unknown 0     upper
#> 1485   jun       16        8    -1        0  unknown 0     upper
#> 1486   aug      140        1    -1        0  unknown 0     upper
#> 1487   apr      280        2    -1        0  unknown 0     upper
#> 1488   may      314        3    -1        0  unknown 0     upper
#> 1489   jun      251        3    -1        0  unknown 0     upper
#> 1490   jan      337        4    -1        0  unknown 0     upper
#> 1491   jun        9        5    -1        0  unknown 0     upper
#> 1492   nov      945        2    -1        0  unknown 1     upper
#> 1493   may      120        1    -1        0  unknown 0     upper
#> 1494   may      290        1    -1        0  unknown 0     upper
#> 1495   may      137        1    -1        0  unknown 0   primary
#> 1496   jun      159        1    -1        0  unknown 0   primary
#> 1497   may       22        5    -1        0  unknown 0   primary
#> 1498   aug       88       10    -1        0  unknown 0     upper
#> 1499   jul      127       11    -1        0  unknown 0     upper
#> 1500   feb      140        1    -1        0  unknown 0     upper
#> 1501   may      475        2    -1        0  unknown 0     upper
#> 1502   may      137        2    -1        0  unknown 0     upper
#> 1503   aug       70        1    -1        0  unknown 0     upper
#> 1504   jul      243        3    -1        0  unknown 0     upper
#> 1505   may      206        1    -1        0  unknown 0     upper
#> 1506   may      206        1    -1        0  unknown 0   primary
#> 1507   apr      616        1    -1        0  unknown 1     upper
#> 1508   may      456        2    -1        0  unknown 0     upper
#> 1509   aug       74        1    -1        0  unknown 0     upper
#> 1510   mar      282        2    -1        0  unknown 0     upper
#> 1511   aug      472        6    -1        0  unknown 1   primary
#> 1512   may      360        1    -1        0  unknown 0     upper
#> 1513   may      440        1    -1        0  unknown 0     upper
#> 1514   jul      236        3    -1        0  unknown 0     upper
#> 1515   oct      167        1    -1        0  unknown 0     upper
#> 1516   may      472        2   351        1  failure 0     upper
#> 1517   apr      396        3   151        4    other 0     upper
#> 1518   jul      400        1    -1        0  unknown 0     upper
#> 1519   nov     1032       10   115        3  failure 0     upper
#> 1520   aug      629        7    -1        0  unknown 0     upper
#> 1521   jul      167        1    -1        0  unknown 0   primary
#> 1522   oct       59        1   104        3  failure 0     upper
#> 1523   jun      346        3    -1        0  unknown 0   unknown
#> 1524   jul       93        1    -1        0  unknown 0     upper
#> 1525   nov      215        2    -1        0  unknown 0     upper
#> 1526   jul      158        5    -1        0  unknown 0     upper
#> 1527   nov      217        3    -1        0  unknown 0   primary
#> 1528   oct      255        4   185        2  failure 1   primary
#> 1529   jul      301        1    -1        0  unknown 0     upper
#> 1530   may      166        4    -1        0  unknown 0     upper
#> 1531   may      525        1    -1        0  unknown 1   unknown
#> 1532   may      297        1    -1        0  unknown 0     upper
#> 1533   may      170        1    -1        0  unknown 0     upper
#> 1534   feb      208        1    -1        0  unknown 0     upper
#> 1535   nov     1122        4    -1        0  unknown 1   primary
#> 1536   may       32        2    -1        0  unknown 0     upper
#> 1537   may     1697        2    -1        0  unknown 1     upper
#> 1538   aug      173        8    -1        0  unknown 0     upper
#> 1539   jul      783        3    -1        0  unknown 0   primary
#> 1540   jul       65        2    -1        0  unknown 0     upper
#> 1541   nov      156        4    -1        0  unknown 0   primary
#> 1542   may      203        1    -1        0  unknown 0     upper
#> 1543   jul      184        6    -1        0  unknown 0     upper
#> 1544   mar      220        3    -1        0  unknown 1     upper
#> 1545   may       88        3    -1        0  unknown 0     upper
#> 1546   may      349        3    -1        0  unknown 0     upper
#> 1547   oct       76        2    -1        0  unknown 0   primary
#> 1548   jul       73        1    -1        0  unknown 0   primary
#> 1549   jun      119        2    -1        0  unknown 0     upper
#> 1550   jun      139        1    -1        0  unknown 0     upper
#> 1551   aug      389        4    -1        0  unknown 0     upper
#> 1552   jun       96        6    -1        0  unknown 0   primary
#> 1553   feb      190        2   280        8  failure 1     upper
#> 1554   nov      197        4    30        1  failure 0     upper
#> 1555   aug      240        2    -1        0  unknown 0   primary
#> 1556   jun      165        2    -1        0  unknown 0     upper
#> 1557   may      124        2    -1        0  unknown 0     upper
#> 1558   may      631        1   344        1  success 0   primary
#> 1559   feb      308        1   213        1    other 0   primary
#> 1560   jan      287        5   285        5  success 1   primary
#> 1561   may      260        5    -1        0  unknown 0     upper
#> 1562   may      245        3    -1        0  unknown 0     upper
#> 1563   may     1349        8    -1        0  unknown 1   primary
#> 1564   jul       71        1    -1        0  unknown 0     upper
#> 1565   aug       24       30    -1        0  unknown 0     upper
#> 1566   nov       55        2    -1        0  unknown 0   unknown
#> 1567   jul      506        1    -1        0  unknown 0     upper
#> 1568   jun      295        1   287        4  success 1   primary
#> 1569   may       51        1    -1        0  unknown 0   primary
#> 1570   may      106        1    -1        0  unknown 0   primary
#> 1571   jul       55        1    -1        0  unknown 0     upper
#> 1572   may       54        2    -1        0  unknown 0   primary
#> 1573   feb      138        2    92        2  success 1     upper
#> 1574   jan      120        1    -1        0  unknown 0     upper
#> 1575   jun       29        2    -1        0  unknown 0   primary
#> 1576   may      230        2    -1        0  unknown 0     upper
#> 1577   may      168        1    -1        0  unknown 0   unknown
#> 1578   feb      578        1    -1        0  unknown 1   primary
#> 1579   feb      182        2    -1        0  unknown 0     upper
#> 1580   jul       73        3    -1        0  unknown 0     upper
#> 1581   may      345        1    -1        0  unknown 0     upper
#> 1582   apr      263        1    -1        0  unknown 0   unknown
#> 1583   may      208        1    -1        0  unknown 0   primary
#> 1584   feb      228        2    -1        0  unknown 0     upper
#> 1585   may      640        1    -1        0  unknown 1     upper
#> 1586   jul     1697        1    -1        0  unknown 0     upper
#> 1587   may      265        7    -1        0  unknown 0   primary
#> 1588   jan      410        2    -1        0  unknown 0     upper
#> 1589   jul       83        4    -1        0  unknown 0   primary
#> 1590   jun      404       13    -1        0  unknown 0   primary
#> 1591   jun       69        2    -1        0  unknown 0     upper
#> 1592   may      133        1    -1        0  unknown 0     upper
#> 1593   jan      468        2    -1        0  unknown 0     upper
#> 1594   jun       17        3    -1        0  unknown 0     upper
#> 1595   may      174        1   359        2    other 0   primary
#> 1596   may      435        1    -1        0  unknown 0     upper
#> 1597   may      125        1   368        4  failure 0     upper
#> 1598   may      215        2    -1        0  unknown 0   primary
#> 1599   aug      195       10    -1        0  unknown 0     upper
#> 1600   nov     1735        2    -1        0  unknown 0     upper
#> 1601   jun       20        3    -1        0  unknown 0     upper
#> 1602   may      510        1    -1        0  unknown 0     upper
#> 1603   aug      102        4    -1        0  unknown 0     upper
#> 1604   may     1347        2   363        1  failure 1     upper
#> 1605   may      158        3    -1        0  unknown 0     upper
#> 1606   may      158        1    -1        0  unknown 0     upper
#> 1607   may      161        2    -1        0  unknown 0   primary
#> 1608   feb      541        1    -1        0  unknown 0     upper
#> 1609   may       48        1    -1        0  unknown 0     upper
#> 1610   dec       10        1    -1        0  unknown 0     upper
#> 1611   aug      996        1    -1        0  unknown 1   primary
#> 1612   nov      194        4   188        8    other 0     upper
#> 1613   nov      223        1    96        2  failure 0     upper
#> 1614   may      473        1    -1        0  unknown 0     upper
#> 1615   aug      433        3    -1        0  unknown 0     upper
#> 1616   aug      322        7    -1        0  unknown 0     upper
#> 1617   feb       99        1    93        3  success 0     upper
#> 1618   apr       20        2   238        2  failure 0     upper
#> 1619   jul      296        1    -1        0  unknown 0     upper
#> 1620   nov      112        1    -1        0  unknown 0     upper
#> 1621   may      171        4    -1        0  unknown 0     upper
#> 1622   jul      129        2    -1        0  unknown 0   primary
#> 1623   nov      180        1   185        2  failure 0     upper
#> 1624   may       71        3    -1        0  unknown 0     upper
#> 1625   apr      315        1   182        2  success 1     upper
#> 1626   aug      142        4    -1        0  unknown 0     upper
#> 1627   may      396        3    -1        0  unknown 0     upper
#> 1628   may        7        1    -1        0  unknown 0     upper
#> 1629   may      230        4    -1        0  unknown 0     upper
#> 1630   jul      192        3    -1        0  unknown 0     upper
#> 1631   jul       67        1    -1        0  unknown 0     upper
#> 1632   jun       16        8    -1        0  unknown 0     upper
#> 1633   jun      151        2    -1        0  unknown 0     upper
#> 1634   apr      399        1    -1        0  unknown 0     upper
#> 1635   may      133        2    -1        0  unknown 0     upper
#> 1636   aug      253        1    -1        0  unknown 0   unknown
#> 1637   jun      181        1    -1        0  unknown 0   primary
#> 1638   may      156        5   297        1    other 0     upper
#> 1639   jul      808        5    -1        0  unknown 0     upper
#> 1640   jul      368        2    -1        0  unknown 0     upper
#> 1641   jun      466        2    -1        0  unknown 0   unknown
#> 1642   jun      747        2    -1        0  unknown 1     upper
#> 1643   jan      368        1    -1        0  unknown 0     upper
#> 1644   jul      625        1    -1        0  unknown 1     upper
#> 1645   aug      103        4    -1        0  unknown 0   primary
#> 1646   aug      300        3    -1        0  unknown 0     upper
#> 1647   apr     1187        2   320        2  success 0   primary
#> 1648   aug      310        2    -1        0  unknown 0   primary
#> 1649   aug      324        3    -1        0  unknown 0     upper
#> 1650   jul       57        3    -1        0  unknown 0     upper
#> 1651   nov      564        2   183        1  failure 0     upper
#> 1652   may       83        2    -1        0  unknown 0     upper
#> 1653   jul      123        1    -1        0  unknown 0     upper
#> 1654   aug      145       10    -1        0  unknown 0     upper
#> 1655   apr      221        2   267        3    other 0     upper
#> 1656   jun      203        2    -1        0  unknown 0     upper
#> 1657   jan      653        3    -1        0  unknown 0     upper
#> 1658   may      385        1    -1        0  unknown 0     upper
#> 1659   may      133        1    -1        0  unknown 0     upper
#> 1660   jul      112        1    -1        0  unknown 0     upper
#> 1661   jun       85        3    -1        0  unknown 0   primary
#> 1662   jun      113        2    -1        0  unknown 0   primary
#> 1663   apr      223        1    -1        0  unknown 0   primary
#> 1664   jul      126        1    -1        0  unknown 0     upper
#> 1665   may      526        3   179        3  success 1     upper
#> 1666   nov       80        2    -1        0  unknown 0   unknown
#> 1667   aug       71        1    -1        0  unknown 0     upper
#> 1668   may       62        3    -1        0  unknown 0     upper
#> 1669   may      698        1    -1        0  unknown 0     upper
#> 1670   jul       69        4    -1        0  unknown 0     upper
#> 1671   jun      127        4    -1        0  unknown 0     upper
#> 1672   may       19        4   374        1    other 0     upper
#> 1673   may      507        2    -1        0  unknown 0     upper
#> 1674   jul      252        1    -1        0  unknown 0     upper
#> 1675   jul      152        4    -1        0  unknown 0     upper
#> 1676   aug      126        1    -1        0  unknown 0     upper
#> 1677   feb      226        2    -1        0  unknown 0     upper
#> 1678   aug      255        2    -1        0  unknown 0     upper
#> 1679   aug      190        1    -1        0  unknown 0     upper
#> 1680   jul      107        2    -1        0  unknown 0     upper
#> 1681   nov      204        1    -1        0  unknown 1     upper
#> 1682   may      320        3   371        2  failure 0     upper
#> 1683   may       78        2    -1        0  unknown 0     upper
#> 1684   apr      728        1   316        3    other 0     upper
#> 1685   may      418        1    -1        0  unknown 0     upper
#> 1686   jan       76        2    -1        0  unknown 0     upper
#> 1687   apr      317        1   363        2  success 1     upper
#> 1688   jul      142        2    -1        0  unknown 0   primary
#> 1689   nov       80        5   198        2  failure 0     upper
#> 1690   may      188        2    -1        0  unknown 0     upper
#> 1691   nov      392        3    -1        0  unknown 0     upper
#> 1692   jul      166        1    -1        0  unknown 0     upper
#> 1693   jul      344        3    -1        0  unknown 0     upper
#> 1694   may      138        2    -1        0  unknown 0   unknown
#> 1695   aug      134        3   194        1  failure 0     upper
#> 1696   jul      116        1   301        1    other 0     upper
#> 1697   feb       38        8    -1        0  unknown 0     upper
#> 1698   jul      728        8    -1        0  unknown 0     upper
#> 1699   may       20        1   342        1  failure 0     upper
#> 1700   nov       77        1   127        3  failure 0     upper
#> 1701   jul      218        3    -1        0  unknown 0     upper
#> 1702   jun      291        3    -1        0  unknown 0     upper
#> 1703   may       92        3    -1        0  unknown 0     upper
#> 1704   may      850        1    -1        0  unknown 1   primary
#> 1705   may     2260        2    -1        0  unknown 0     upper
#> 1706   may      139        2    -1        0  unknown 0     upper
#> 1707   jul      127        1    -1        0  unknown 0     upper
#> 1708   nov      281        2   195        6  failure 0   primary
#> 1709   feb       19        6    -1        0  unknown 0     upper
#> 1710   apr      137        1   333        2    other 0     upper
#> 1711   may       85        2    -1        0  unknown 0   primary
#> 1712   aug      147        3    -1        0  unknown 0   primary
#> 1713   oct      408        2    -1        0  unknown 0     upper
#> 1714   jun      154        3    -1        0  unknown 0     upper
#> 1715   jul      779        2    -1        0  unknown 0     upper
#> 1716   may      204        1    -1        0  unknown 0     upper
#> 1717   aug      473        6    -1        0  unknown 1     upper
#> 1718   may      125        1    -1        0  unknown 0     upper
#> 1719   may      101        1    -1        0  unknown 0   primary
#> 1720   jul      662        1    -1        0  unknown 0     upper
#> 1721   aug      260        7    -1        0  unknown 0     upper
#> 1722   may      103        1   363        1  failure 0     upper
#> 1723   may      136        2    -1        0  unknown 0     upper
#> 1724   jul      159        6    -1        0  unknown 0     upper
#> 1725   may       32        2    -1        0  unknown 0     upper
#> 1726   may      129        2    -1        0  unknown 0     upper
#> 1727   sep      173        1    -1        0  unknown 0   primary
#> 1728   aug      128        2    -1        0  unknown 0     upper
#> 1729   jan     1232        1    -1        0  unknown 1     upper
#> 1730   may      260        3    -1        0  unknown 0     upper
#> 1731   nov      167        5    -1        0  unknown 0     upper
#> 1732   feb      255        3    -1        0  unknown 0     upper
#> 1733   jun      973        2    -1        0  unknown 1   primary
#> 1734   feb      266        2    -1        0  unknown 0     upper
#> 1735   jul      121        1    -1        0  unknown 0     upper
#> 1736   may      111        1    -1        0  unknown 0     upper
#> 1737   jun       92        2    -1        0  unknown 0   primary
#> 1738   jul      287        2    -1        0  unknown 0     upper
#> 1739   nov      141        2    -1        0  unknown 0     upper
#> 1740   aug       23        9    -1        0  unknown 0     upper
#> 1741   apr        5        3   150        6  failure 0     upper
#> 1742   aug      222        3   182        4  success 1     upper
#> 1743   may      178        1    -1        0  unknown 0     upper
#> 1744   may       45        1    -1        0  unknown 0     upper
#> 1745   may      419        1   360        4  failure 0     upper
#> 1746   may      156        1    -1        0  unknown 0     upper
#> 1747   jul      104        2    -1        0  unknown 0     upper
#> 1748   aug       51        2    -1        0  unknown 0     upper
#> 1749   aug       44       12    -1        0  unknown 0     upper
#> 1750   may      701        1   362        1  success 1   primary
#> 1751   jun      252        1    -1        0  unknown 0     upper
#> 1752   may       93        2    -1        0  unknown 0     upper
#> 1753   jun      690        1    -1        0  unknown 1     upper
#> 1754   may       62        2    -1        0  unknown 0     upper
#> 1755   may      103        2    -1        0  unknown 0     upper
#> 1756   apr       61        3    -1        0  unknown 0     upper
#> 1757   may      241        1    -1        0  unknown 0     upper
#> 1758   jul      209        1    -1        0  unknown 0     upper
#> 1759   apr      627        5    -1        0  unknown 0     upper
#> 1760   may       26        1   174        2  failure 0     upper
#> 1761   jun      231       12    -1        0  unknown 0     upper
#> 1762   aug     1363        1    -1        0  unknown 1     upper
#> 1763   may       78        3    -1        0  unknown 0   primary
#> 1764   may      295        2    -1        0  unknown 0     upper
#> 1765   jan      273        1    -1        0  unknown 0     upper
#> 1766   apr      375        1    -1        0  unknown 1     upper
#> 1767   mar       88        3    -1        0  unknown 0     upper
#> 1768   may       83        2    -1        0  unknown 0   primary
#> 1769   aug      350        6    -1        0  unknown 0     upper
#> 1770   may      146        1    -1        0  unknown 0     upper
#> 1771   jul      183        1   221        2  failure 1     upper
#> 1772   nov      175        1    -1        0  unknown 0     upper
#> 1773   may      198        1    -1        0  unknown 0     upper
#> 1774   may       23        3   346       10  failure 0   unknown
#> 1775   jul       58        1    -1        0  unknown 0     upper
#> 1776   may     1080        5    -1        0  unknown 0   primary
#> 1777   jun      172        1    -1        0  unknown 0     upper
#> 1778   apr      184        1    -1        0  unknown 1     upper
#> 1779   aug      276        3    -1        0  unknown 0     upper
#> 1780   may      208        3    -1        0  unknown 0     upper
#> 1781   may      544        3    -1        0  unknown 0   primary
#> 1782   apr      219        4    -1        0  unknown 0     upper
#> 1783   aug       97        5    -1        0  unknown 0     upper
#> 1784   may       56        2    -1        0  unknown 0     upper
#> 1785   aug      111        2    -1        0  unknown 0     upper
#> 1786   feb       87        2   265        3    other 0     upper
#> 1787   may       42        1    -1        0  unknown 0     upper
#> 1788   jun       21       37    -1        0  unknown 0   primary
#> 1789   jun      175        2    -1        0  unknown 0     upper
#> 1790   jul      109        3    -1        0  unknown 0     upper
#> 1791   nov       92        2    -1        0  unknown 0     upper
#> 1792   may      151        4   171       11    other 0     upper
#> 1793   may       55        1    -1        0  unknown 0     upper
#> 1794   apr      179        3    -1        0  unknown 0     upper
#> 1795   aug      283        1    -1        0  unknown 0     upper
#> 1796   sep       20        1   478        2    other 0     upper
#> 1797   nov      354        2    -1        0  unknown 0     upper
#> 1798   feb       11        7    -1        0  unknown 0     upper
#> 1799   apr     1463        2    -1        0  unknown 1     upper
#> 1800   may      695        2    -1        0  unknown 0     upper
#> 1801   may      235        2    -1        0  unknown 0     upper
#> 1802   may      119        2    -1        0  unknown 0     upper
#> 1803   aug      305        1    91        2    other 0     upper
#> 1804   nov      124        1   175        1  failure 0     upper
#> 1805   may      167        1    -1        0  unknown 0     upper
#> 1806   may      859        2    -1        0  unknown 0     upper
#> 1807   may      362        2   307        1  failure 0   unknown
#> 1808   feb       93        1    -1        0  unknown 0     upper
#> 1809   aug       73       15    -1        0  unknown 0     upper
#> 1810   may      130        4    -1        0  unknown 0   primary
#> 1811   aug      102        1   105        1  success 0     upper
#> 1812   apr      550        1   325        1    other 0     upper
#> 1813   nov      203        1    -1        0  unknown 0     upper
#> 1814   aug      192        1   193        1  success 1     upper
#> 1815   may      764        4    -1        0  unknown 0     upper
#> 1816   jul      139        1    -1        0  unknown 0   primary
#> 1817   jul       73        7    -1        0  unknown 0     upper
#> 1818   may      599        1   306        4  success 0   unknown
#> 1819   nov      133        1    -1        0  unknown 0     upper
#> 1820   jul      191        3    -1        0  unknown 0   unknown
#> 1821   may      105        1    -1        0  unknown 0     upper
#> 1822   aug      193        2    -1        0  unknown 0     upper
#> 1823   may      174        2    -1        0  unknown 0     upper
#> 1824   feb      511        3   183        6  success 1     upper
#> 1825   nov       59        1    -1        0  unknown 0   primary
#> 1826   may       91        1    -1        0  unknown 0     upper
#> 1827   nov       91        2    -1        0  unknown 0     upper
#> 1828   nov      231        1    96        2    other 0     upper
#> 1829   nov      210        3    -1        0  unknown 0     upper
#> 1830   jun      333       15    -1        0  unknown 0     upper
#> 1831   apr      335        2    -1        0  unknown 0     upper
#> 1832   jul      936        1    -1        0  unknown 0     upper
#> 1833   jul      434        4    -1        0  unknown 0     upper
#> 1834   aug      629        4    -1        0  unknown 0     upper
#> 1835   may      128        1    -1        0  unknown 0     upper
#> 1836   jul      235        2    -1        0  unknown 0     upper
#> 1837   jan      379        1   192        1  failure 0     upper
#> 1838   aug      281        2    -1        0  unknown 0     upper
#> 1839   aug      249        1   104        1  success 0   primary
#> 1840   aug       26       10    -1        0  unknown 0   primary
#> 1841   jun      148        1    -1        0  unknown 0     upper
#> 1842   jul      182        1    -1        0  unknown 0     upper
#> 1843   jul       54        7    -1        0  unknown 0     upper
#> 1844   may      644        2    -1        0  unknown 0     upper
#> 1845   may      107        1    -1        0  unknown 0     upper
#> 1846   jun      565        3    -1        0  unknown 0     upper
#> 1847   oct      168        2    -1        0  unknown 0     upper
#> 1848   jul       59        1    -1        0  unknown 0     upper
#> 1849   jun      521       11    -1        0  unknown 0     upper
#> 1850   aug      119        3    -1        0  unknown 0   primary
#> 1851   mar      192        1   185        2  success 1     upper
#> 1852   aug      179        4    -1        0  unknown 0   unknown
#> 1853   may       98        1    77        5  failure 0     upper
#> 1854   may      225        2    -1        0  unknown 0     upper
#> 1855   nov      611        3    -1        0  unknown 0   primary
#> 1856   may      281       15    -1        0  unknown 0     upper
#> 1857   jan      427        1    -1        0  unknown 0     upper
#> 1858   apr      181        2   270        2  failure 0     upper
#> 1859   jul       70        5    -1        0  unknown 0     upper
#> 1860   jun      348        1    -1        0  unknown 0     upper
#> 1861   jun      266       10    -1        0  unknown 0   unknown
#> 1862   jul      514        5    -1        0  unknown 1     upper
#> 1863   may      224        1   370        2  failure 0   primary
#> 1864   may       88        2    -1        0  unknown 0     upper
#> 1865   apr       72        1    -1        0  unknown 0     upper
#> 1866   may      173        1    -1        0  unknown 0     upper
#> 1867   nov      230        1    -1        0  unknown 0     upper
#> 1868   apr      156        1    -1        0  unknown 0     upper
#> 1869   jun       11       15    -1        0  unknown 0   primary
#> 1870   apr      173        2    -1        0  unknown 0   primary
#> 1871   apr      167        1   350        1  failure 0   unknown
#> 1872   jul      132        7    -1        0  unknown 0     upper
#> 1873   may      110        1    -1        0  unknown 0     upper
#> 1874   mar      294        1   274        2  failure 0     upper
#> 1875   aug      202        1    -1        0  unknown 0     upper
#> 1876   jun       10        2    -1        0  unknown 0   primary
#> 1877   jul     1037       24    -1        0  unknown 0     upper
#> 1878   may      155        2    -1        0  unknown 0     upper
#> 1879   feb      480        2   189        1  failure 0   primary
#> 1880   jun      505        1    -1        0  unknown 0     upper
#> 1881   aug      904        6    -1        0  unknown 1     upper
#> 1882   apr      765        3    -1        0  unknown 0   primary
#> 1883   aug      448        5    -1        0  unknown 0     upper
#> 1884   nov      114        1   170        3  failure 1     upper
#> 1885   jan      246        1    -1        0  unknown 0     upper
#> 1886   jun      604        6    -1        0  unknown 0     upper
#> 1887   jun       80        1    92        1  failure 0     upper
#> 1888   jun      362        3    -1        0  unknown 0     upper
#> 1889   aug      166        2    -1        0  unknown 0     upper
#> 1890   jun      282        2   385        1  success 1   unknown
#> 1891   may      123        1    -1        0  unknown 0     upper
#> 1892   jun      109        1    -1        0  unknown 0     upper
#> 1893   nov       68        1    -1        0  unknown 0     upper
#> 1894   nov       53        1    -1        0  unknown 0   primary
#> 1895   jun       97        4    -1        0  unknown 0     upper
#> 1896   may      751        3    -1        0  unknown 1   primary
#> 1897   jul      154        1    -1        0  unknown 0   unknown
#> 1898   nov      106        1    -1        0  unknown 0   primary
#> 1899   aug      428        2    -1        0  unknown 0     upper
#> 1900   may      228        2    -1        0  unknown 0   unknown
#> 1901   jul      347        5    -1        0  unknown 0   primary
#> 1902   nov       87        1    -1        0  unknown 0     upper
#> 1903   jul      413        1    -1        0  unknown 0     upper
#> 1904   may      170        2    -1        0  unknown 0     upper
#> 1905   may      211        2    -1        0  unknown 0   primary
#> 1906   apr      143        4    -1        0  unknown 0   primary
#> 1907   may      219        2    -1        0  unknown 0     upper
#> 1908   may      188        2    -1        0  unknown 0   primary
#> 1909   aug      305        1   179        5    other 0     upper
#> 1910   may      313        1    -1        0  unknown 0     upper
#> 1911   nov      285        3   116        4  failure 0     upper
#> 1912   jan      771        1    -1        0  unknown 1     upper
#> 1913   aug      170        2    -1        0  unknown 0     upper
#> 1914   jun      101        2    -1        0  unknown 0     upper
#> 1915   jul      171        6    -1        0  unknown 0     upper
#> 1916   may       52        1    -1        0  unknown 0     upper
#> 1917   aug      561        1   435        3  failure 1     upper
#> 1918   may       33        1    -1        0  unknown 0     upper
#> 1919   jun       36        2    -1        0  unknown 0   primary
#> 1920   feb       35        3    -1        0  unknown 0   primary
#> 1921   jul       47        2    -1        0  unknown 0     upper
#> 1922   jun      269        1    -1        0  unknown 0   primary
#> 1923   may      218        2   211        4  success 0     upper
#> 1924   nov      119        2   171        1  failure 0     upper
#> 1925   may      348        1    -1        0  unknown 0     upper
#> 1926   may      100        1    -1        0  unknown 0     upper
#> 1927   jan       88        2    -1        0  unknown 0   primary
#> 1928   apr      273        2   254        2  failure 0     upper
#> 1929   may       54        1    -1        0  unknown 0     upper
#> 1930   may      161        1   100        3  success 0     upper
#> 1931   aug      146        2    -1        0  unknown 0     upper
#> 1932   jul      211        3    -1        0  unknown 0     upper
#> 1933   may      552        3    -1        0  unknown 1     upper
#> 1934   jul      400        2    -1        0  unknown 0     upper
#> 1935   jun      366        1    -1        0  unknown 0     upper
#> 1936   feb        8        7   189       18    other 0     upper
#> 1937   may       57        2    -1        0  unknown 0     upper
#> 1938   oct      167        3    -1        0  unknown 0   primary
#> 1939   aug       36        3    -1        0  unknown 0   primary
#> 1940   feb      150        4    -1        0  unknown 0     upper
#> 1941   jun      187        1    20        1    other 1     upper
#> 1942   jul      226        1    -1        0  unknown 0     upper
#> 1943   sep      799        2    -1        0  unknown 1     upper
#> 1944   may      178        7   365        5    other 0     upper
#> 1945   nov      281        2    -1        0  unknown 0     upper
#> 1946   aug      551        2    -1        0  unknown 0     upper
#> 1947   jun      332        2    -1        0  unknown 0   unknown
#> 1948   feb      381        6   213        9  failure 0     upper
#> 1949   feb      401        2     8        3    other 0     upper
#> 1950   may      226        2    -1        0  unknown 0     upper
#> 1951   aug       99        4    -1        0  unknown 0     upper
#> 1952   may      451        3    -1        0  unknown 0   primary
#> 1953   may      381        2    -1        0  unknown 0     upper
#> 1954   may      127        1    -1        0  unknown 0     upper
#> 1955   jan      315        1    -1        0  unknown 0     upper
#> 1956   sep      112        2    24        2    other 0     upper
#> 1957   may      201        1    -1        0  unknown 0     upper
#> 1958   may      293        2    -1        0  unknown 0     upper
#> 1959   may      499        3    -1        0  unknown 0     upper
#> 1960   jul       48        2    -1        0  unknown 0     upper
#> 1961   may      494        1    -1        0  unknown 1     upper
#> 1962   feb      147        1   253        7    other 0     upper
#> 1963   nov       23        1    -1        0  unknown 0     upper
#> 1964   may      787        1    -1        0  unknown 0     upper
#> 1965   feb      605        1    -1        0  unknown 0   primary
#> 1966   jul       82        1    -1        0  unknown 0     upper
#> 1967   jul      484        1    -1        0  unknown 0     upper
#> 1968   may       61        2    -1        0  unknown 0     upper
#> 1969   may       78        5    -1        0  unknown 0     upper
#> 1970   apr      132        2    -1        0  unknown 0     upper
#> 1971   feb      642        1   167        2  failure 1     upper
#> 1972   jun        6       17    -1        0  unknown 0   primary
#> 1973   jul       53        8    -1        0  unknown 0     upper
#> 1974   may     1178        4    -1        0  unknown 0     upper
#> 1975   jan      147        1   195        1    other 0     upper
#> 1976   may      236        1    -1        0  unknown 0     upper
#> 1977   jan      978        2   189        1    other 0     upper
#> 1978   may      296        1    -1        0  unknown 0     upper
#> 1979   may      479        2    -1        0  unknown 0   primary
#> 1980   may      188        1    -1        0  unknown 0     upper
#> 1981   may      447        4    -1        0  unknown 0     upper
#> 1982   may      356        2   286        3  failure 0     upper
#> 1983   jun      136        1    -1        0  unknown 0     upper
#> 1984   may       37        9    -1        0  unknown 0   primary
#> 1985   nov       96        1    -1        0  unknown 0     upper
#> 1986   may       44        4    -1        0  unknown 0     upper
#> 1987   nov      186        2    -1        0  unknown 0     upper
#> 1988   may       95        8    -1        0  unknown 0     upper
#> 1989   aug      155        2    -1        0  unknown 0     upper
#> 1990   jul      202        5    -1        0  unknown 0     upper
#> 1991   jan      540        1     2        2    other 0     upper
#> 1992   apr      169        1   231        2  failure 0     upper
#> 1993   apr      256        5   181        2  success 1     upper
#> 1994   may      191        3    -1        0  unknown 0   primary
#> 1995   jul      151       10    -1        0  unknown 0     upper
#> 1996   nov      131        3   133        3  failure 0   primary
#> 1997   nov      131        2    -1        0  unknown 0     upper
#> 1998   feb      590        5    -1        0  unknown 0     upper
#> 1999   nov      178        1   127        7    other 0     upper
#> 2000   jun       64        2    -1        0  unknown 0   unknown
#> 2001   feb      247        5    -1        0  unknown 0   primary
#> 2002   aug      120        6    -1        0  unknown 0     upper
#> 2003   aug      108        1    99        7  failure 0     upper
#> 2004   jul      257        1    -1        0  unknown 1     upper
#> 2005   may      562        2   174        2  success 0   primary
#> 2006   apr      126        3   345        2    other 0     upper
#> 2007   jul       95        2    -1        0  unknown 0     upper
#> 2008   jun      508        2    -1        0  unknown 1     upper
#> 2009   aug      121        2    -1        0  unknown 0   primary
#> 2010   nov      166        3    -1        0  unknown 0     upper
#> 2011   jan      155        1    -1        0  unknown 0     upper
#> 2012   apr      159        3    -1        0  unknown 1     upper
#> 2013   may      212        2    -1        0  unknown 0   primary
#> 2014   aug      221        6    -1        0  unknown 0     upper
#> 2015   may      169        4    -1        0  unknown 0     upper
#> 2016   jun      442       11    -1        0  unknown 0     upper
#> 2017   may      120        1    -1        0  unknown 0     upper
#> 2018   may       85        1    -1        0  unknown 0     upper
#> 2019   may      245        1    -1        0  unknown 0     upper
#> 2020   jan      187        2   185        8  failure 0     upper
#> 2021   aug       68        2    -1        0  unknown 0     upper
#> 2022   jan      163        1    -1        0  unknown 0     upper
#> 2023   may       83        1    -1        0  unknown 0     upper
#> 2024   aug      174        1    -1        0  unknown 0   primary
#> 2025   may      214        2    -1        0  unknown 0     upper
#> 2026   jun      209        3    -1        0  unknown 0   primary
#> 2027   may      456        1   300        1  failure 1     upper
#> 2028   may      127        1    -1        0  unknown 0     upper
#> 2029   jul      817        2    -1        0  unknown 1     upper
#> 2030   oct      375        2    -1        0  unknown 0     upper
#> 2031   jun       29        1    -1        0  unknown 0     upper
#> 2032   may      219        4    -1        0  unknown 0     upper
#> 2033   may      109        2    -1        0  unknown 0     upper
#> 2034   jun      128        1    -1        0  unknown 0     upper
#> 2035   may       73        2    -1        0  unknown 0     upper
#> 2036   feb      278        4    -1        0  unknown 0   unknown
#> 2037   jul       34       32    -1        0  unknown 0   primary
#> 2038   nov      257        1    -1        0  unknown 1   primary
#> 2039   may      844        1    -1        0  unknown 1     upper
#> 2040   mar      167        1    -1        0  unknown 1     upper
#> 2041   feb       12        3    -1        0  unknown 0     upper
#> 2042   may      763        1    -1        0  unknown 1     upper
#> 2043   jun      101        1    -1        0  unknown 0     upper
#> 2044   nov      131        1    -1        0  unknown 0     upper
#> 2045   aug      148        1    -1        0  unknown 0     upper
#> 2046   feb      701        1    -1        0  unknown 0   primary
#> 2047   nov      454        1    -1        0  unknown 1     upper
#> 2048   jun      280        1    -1        0  unknown 0   primary
#> 2049   may      265        4    -1        0  unknown 0     upper
#> 2050   may      297        3    -1        0  unknown 0     upper
#> 2051   aug      153        1    -1        0  unknown 0     upper
#> 2052   feb      254        1    -1        0  unknown 0   unknown
#> 2053   may       30        4   304        2    other 0   primary
#> 2054   may      125        4    -1        0  unknown 0   primary
#> 2055   jun      114        1    -1        0  unknown 0     upper
#> 2056   feb      136       10    -1        0  unknown 1     upper
#> 2057   apr      208       12   337        1  failure 0     upper
#> 2058   nov       86        1    -1        0  unknown 0     upper
#> 2059   apr      949        2   254        6    other 1     upper
#> 2060   jun      207        1    -1        0  unknown 0   primary
#> 2061   nov      103        1    -1        0  unknown 0     upper
#> 2062   may     1052        1    -1        0  unknown 0     upper
#> 2063   apr      109        1    -1        0  unknown 0   unknown
#> 2064   jun      149        8    -1        0  unknown 0   primary
#> 2065   jun      138        5    -1        0  unknown 0     upper
#> 2066   may      341        1    -1        0  unknown 0     upper
#> 2067   apr      184        2   151        1  failure 0   primary
#> 2068   jun       75        3    -1        0  unknown 0     upper
#> 2069   apr       87        2    -1        0  unknown 0   primary
#> 2070   jan      413        2    -1        0  unknown 0     upper
#> 2071   feb       35        1    -1        0  unknown 0     upper
#> 2072   jul      104        3    -1        0  unknown 0     upper
#> 2073   jul      487        3    -1        0  unknown 0     upper
#> 2074   feb      146        1    -1        0  unknown 0     upper
#> 2075   may      483        4    87        2  success 1     upper
#> 2076   nov      248        1    -1        0  unknown 0     upper
#> 2077   feb      803        1    -1        0  unknown 1     upper
#> 2078   may       91        2    -1        0  unknown 0   primary
#> 2079   jun       94        1    -1        0  unknown 0     upper
#> 2080   may      325        3    -1        0  unknown 0     upper
#> 2081   may       22        5    -1        0  unknown 0   primary
#> 2082   may      130        2    -1        0  unknown 0     upper
#> 2083   jan      383        2   206        1    other 0     upper
#> 2084   may      207        1    -1        0  unknown 0     upper
#> 2085   may      244        1    -1        0  unknown 0     upper
#> 2086   nov       31        7    -1        0  unknown 0     upper
#> 2087   may      493       10   362        1    other 0     upper
#> 2088   jan      183        2    -1        0  unknown 0   primary
#> 2089   may      541        5    -1        0  unknown 0   primary
#> 2090   may      339        1    -1        0  unknown 0     upper
#> 2091   apr      293        2   314        2  failure 0     upper
#> 2092   apr      112        1    -1        0  unknown 0     upper
#> 2093   jun      177        8    -1        0  unknown 0   unknown
#> 2094   may      173        4    -1        0  unknown 0     upper
#> 2095   jun      258        1    -1        0  unknown 0     upper
#> 2096   may      207        1    -1        0  unknown 0     upper
#> 2097   aug      279        1   117        1  failure 0   unknown
#> 2098   jul     1148        1   276        2    other 1     upper
#> 2099   nov      182        1    -1        0  unknown 0     upper
#> 2100   aug      119        7    -1        0  unknown 0     upper
#> 2101   may      246        1    -1        0  unknown 0     upper
#> 2102   jun      137        1    -1        0  unknown 0   primary
#> 2103   jul       68        1    -1        0  unknown 0   primary
#> 2104   jan      214        1    -1        0  unknown 0     upper
#> 2105   may      155        6    -1        0  unknown 0   primary
#> 2106   jun      638       16    -1        0  unknown 0     upper
#> 2107   aug      181        2    -1        0  unknown 0     upper
#> 2108   may      103        1    -1        0  unknown 0     upper
#> 2109   aug      214        7    -1        0  unknown 0     upper
#> 2110   feb      104        3    -1        0  unknown 0     upper
#> 2111   jun       59        3    -1        0  unknown 0     upper
#> 2112   jul       33        1    -1        0  unknown 0   primary
#> 2113   jun      153        6    -1        0  unknown 0     upper
#> 2114   jul       29       10    -1        0  unknown 0     upper
#> 2115   may      113        1    -1        0  unknown 0     upper
#> 2116   feb      503        1    -1        0  unknown 1     upper
#> 2117   aug       22        2    -1        0  unknown 0     upper
#> 2118   apr      422        4    -1        0  unknown 0     upper
#> 2119   jan      177        1    -1        0  unknown 0   unknown
#> 2120   may       99        1    -1        0  unknown 0     upper
#> 2121   apr     1353        2   138        2  success 1     upper
#> 2122   aug      181        1    -1        0  unknown 0   primary
#> 2123   jul      516        1    -1        0  unknown 1     upper
#> 2124   aug      331        7    -1        0  unknown 0     upper
#> 2125   aug       44        2    -1        0  unknown 0     upper
#> 2126   aug      230        2    -1        0  unknown 0     upper
#> 2127   jul     1608       13    -1        0  unknown 1     upper
#> 2128   may      192        1    -1        0  unknown 0     upper
#> 2129   may      271        2    -1        0  unknown 0     upper
#> 2130   oct       96        1   158        1  failure 0     upper
#> 2131   jan      187        7    -1        0  unknown 1     upper
#> 2132   may      145        1    -1        0  unknown 0     upper
#> 2133   feb      771        1   171        1  success 1     upper
#> 2134   jul      559        2    -1        0  unknown 0     upper
#> 2135   may      187        3    -1        0  unknown 0     upper
#> 2136   may       65        3    -1        0  unknown 0     upper
#> 2137   aug      625        4    -1        0  unknown 1   primary
#> 2138   nov      268        3    -1        0  unknown 0     upper
#> 2139   may      128        3    -1        0  unknown 0     upper
#> 2140   nov      201        2   174        3  success 0   primary
#> 2141   may      124        1   338        2  failure 0     upper
#> 2142   feb      260        2    -1        0  unknown 0     upper
#> 2143   may       86        2    -1        0  unknown 0     upper
#> 2144   may       30        7    -1        0  unknown 0     upper
#> 2145   aug      184        3    -1        0  unknown 0     upper
#> 2146   jan       82        2    -1        0  unknown 0     upper
#> 2147   jun      223        3    -1        0  unknown 0     upper
#> 2148   nov       75        2   119        2  success 0     upper
#> 2149   jul       80        1    -1        0  unknown 0     upper
#> 2150   jul       43        2    -1        0  unknown 0     upper
#> 2151   aug      139        1    -1        0  unknown 0     upper
#> 2152   jun       82        1    -1        0  unknown 0     upper
#> 2153   may      370        2    -1        0  unknown 0   primary
#> 2154   jul      271        5    -1        0  unknown 0     upper
#> 2155   may       61        6    -1        0  unknown 0   primary
#> 2156   jul       84        6    -1        0  unknown 0     upper
#> 2157   may      513        2    -1        0  unknown 0     upper
#> 2158   oct      140        2    -1        0  unknown 0     upper
#> 2159   jul     1187        3    -1        0  unknown 1     upper
#> 2160   mar      684        4    -1        0  unknown 0     upper
#> 2161   jul      142        9    -1        0  unknown 0     upper
#> 2162   jul      115        2    -1        0  unknown 0     upper
#> 2163   jul      176        4    -1        0  unknown 0   primary
#> 2164   jul      610        1    -1        0  unknown 1     upper
#> 2165   may      261        1    -1        0  unknown 0     upper
#> 2166   jul       68        3    -1        0  unknown 0     upper
#> 2167   aug      242        5    -1        0  unknown 0     upper
#> 2168   may       59        3    -1        0  unknown 0     upper
#> 2169   nov      184        1    -1        0  unknown 0     upper
#> 2170   feb      871        4    -1        0  unknown 0     upper
#> 2171   may      777        2    -1        0  unknown 1     upper
#> 2172   jul      153        1    -1        0  unknown 0     upper
#> 2173   may       60        1    -1        0  unknown 0     upper
#> 2174   aug      129        2    -1        0  unknown 0     upper
#> 2175   jun       98        1    -1        0  unknown 0     upper
#> 2176   jul      226        1    -1        0  unknown 0   primary
#> 2177   jun      193       10    -1        0  unknown 0     upper
#> 2178   feb      150        3    -1        0  unknown 0     upper
#> 2179   jun      273        1    -1        0  unknown 0     upper
#> 2180   jun       74        2    -1        0  unknown 0     upper
#> 2181   apr      687        1     9        3  success 1     upper
#> 2182   jul       48        3    -1        0  unknown 0     upper
#> 2183   may      365        6    36        3  failure 0     upper
#> 2184   may      374        9    -1        0  unknown 0   primary
#> 2185   nov       91        2    -1        0  unknown 0     upper
#> 2186   jul       76        3    -1        0  unknown 0     upper
#> 2187   sep      337        1   186        1  success 1     upper
#> 2188   may      239        3    -1        0  unknown 0     upper
#> 2189   may      167        3    -1        0  unknown 0     upper
#> 2190   jun      118        2    81        1  success 0     upper
#> 2191   nov       48        1    -1        0  unknown 0     upper
#> 2192   aug       96        2    -1        0  unknown 0     upper
#> 2193   jun      140        1    -1        0  unknown 0     upper
#> 2194   jun      463        4    -1        0  unknown 0     upper
#> 2195   may       99        2    -1        0  unknown 0   unknown
#> 2196   may      226        2    -1        0  unknown 0     upper
#> 2197   feb     1192        3    -1        0  unknown 0     upper
#> 2198   may      243        3    -1        0  unknown 0     upper
#> 2199   may      369        1    -1        0  unknown 0   primary
#> 2200   jul      273        4    -1        0  unknown 0     upper
#> 2201   jun     1009        1    -1        0  unknown 0   primary
#> 2202   may       90        4    -1        0  unknown 0   primary
#> 2203   aug       93        1    -1        0  unknown 0     upper
#> 2204   may      233        2    -1        0  unknown 0     upper
#> 2205   jun      262        2    -1        0  unknown 0     upper
#> 2206   apr       99        1   329        4    other 0     upper
#> 2207   jul      101        3    -1        0  unknown 0     upper
#> 2208   nov       65        1    -1        0  unknown 0     upper
#> 2209   may      667        2    -1        0  unknown 1     upper
#> 2210   jun       34       31    -1        0  unknown 0     upper
#> 2211   may      160        2    -1        0  unknown 0     upper
#> 2212   apr      170        1    -1        0  unknown 0     upper
#> 2213   aug      234        2    -1        0  unknown 0   primary
#> 2214   may      354        1   370        2  failure 0     upper
#> 2215   aug      131        2    -1        0  unknown 0     upper
#> 2216   jul      606        2    -1        0  unknown 0     upper
#> 2217   aug      433        2    -1        0  unknown 0     upper
#> 2218   nov      208        3    91        4  failure 0     upper
#> 2219   jul      100        4    -1        0  unknown 0     upper
#> 2220   jun      825        1    -1        0  unknown 0     upper
#> 2221   may      172        3   173        1    other 0     upper
#> 2222   aug       71        3    -1        0  unknown 0     upper
#> 2223   may       13        5    -1        0  unknown 0     upper
#> 2224   aug      787       13    -1        0  unknown 0     upper
#> 2225   aug      110        1    -1        0  unknown 0     upper
#> 2226   may      265        1    -1        0  unknown 0     upper
#> 2227   may       62        2    -1        0  unknown 0     upper
#> 2228   feb     1052        2    -1        0  unknown 0     upper
#> 2229   nov      339        3    -1        0  unknown 0     upper
#> 2230   may      360        2    -1        0  unknown 0     upper
#> 2231   jul      126        3    -1        0  unknown 0     upper
#> 2232   nov      434        2    -1        0  unknown 0     upper
#> 2233   jul       88        1    -1        0  unknown 0     upper
#> 2234   aug       38        6    -1        0  unknown 0     upper
#> 2235   jun       73        4    -1        0  unknown 0     upper
#> 2236   aug      454        6    -1        0  unknown 0     upper
#> 2237   aug       73        4    -1        0  unknown 0     upper
#> 2238   nov       57        1    -1        0  unknown 0     upper
#> 2239   jul      422        1    -1        0  unknown 0     upper
#> 2240   may      360        1   370        1    other 0     upper
#> 2241   may       80        1    -1        0  unknown 0     upper
#> 2242   may       90        1    -1        0  unknown 0     upper
#> 2243   may      325        4    -1        0  unknown 0     upper
#> 2244   may      289        1    -1        0  unknown 0     upper
#> 2245   feb      287        1   130        1  failure 0     upper
#> 2246   jul      384        4    -1        0  unknown 0     upper
#> 2247   jun      394        1    -1        0  unknown 0     upper
#> 2248   may      390        2    -1        0  unknown 0     upper
#> 2249   may      204        2    -1        0  unknown 0     upper
#> 2250   jun      275        1    -1        0  unknown 0     upper
#> 2251   apr      815        2    -1        0  unknown 0     upper
#> 2252   mar      111        3   585        6    other 0     upper
#> 2253   nov       73        1    -1        0  unknown 0     upper
#> 2254   may      260        3    -1        0  unknown 0     upper
#> 2255   jun       77        8    -1        0  unknown 0     upper
#> 2256   may      567        2    -1        0  unknown 0     upper
#> 2257   apr      207        1    -1        0  unknown 0     upper
#> 2258   aug      150        4    -1        0  unknown 0     upper
#> 2259   jul       56        1    -1        0  unknown 0     upper
#> 2260   apr      403        1    -1        0  unknown 1     upper
#> 2261   sep      409        1   398        1  failure 1     upper
#> 2262   may      158        1   351        1  failure 0   unknown
#> 2263   jun      340        3    -1        0  unknown 0   unknown
#> 2264   may      448        1    -1        0  unknown 0     upper
#> 2265   nov      599        4   100        2  failure 0     upper
#> 2266   jul       69        2    -1        0  unknown 0     upper
#> 2267   may     1094        2    -1        0  unknown 1     upper
#> 2268   may      524        3   326        1    other 0     upper
#> 2269   jun      205        1    -1        0  unknown 0     upper
#> 2270   jun      573        1    -1        0  unknown 0   primary
#> 2271   aug       72        4    -1        0  unknown 0     upper
#> 2272   jun      157        1    -1        0  unknown 0     upper
#> 2273   apr      143        1    -1        0  unknown 0     upper
#> 2274   dec      720        5   536        5  failure 0     upper
#> 2275   jul      127        6    -1        0  unknown 0     upper
#> 2276   may      184        2    -1        0  unknown 0     upper
#> 2277   may      202        2   167        1  failure 0     upper
#> 2278   may      105        3    -1        0  unknown 0   unknown
#> 2279   jun      121        3   195        2    other 0     upper
#> 2280   jan      334        1    -1        0  unknown 0     upper
#> 2281   apr      159        2    -1        0  unknown 0     upper
#> 2282   may       85        1    -1        0  unknown 0   unknown
#> 2283   may      176        2    89        5  success 1     upper
#> 2284   apr      494        1    -1        0  unknown 0     upper
#> 2285   may       66        7    -1        0  unknown 0   primary
#> 2286   jul      526        1    -1        0  unknown 0     upper
#> 2287   apr      200        3    -1        0  unknown 0     upper
#> 2288   jul       98        5    -1        0  unknown 0     upper
#> 2289   jul       88        1    -1        0  unknown 0     upper
#> 2290   jul      162        6    -1        0  unknown 0     upper
#> 2291   may      108        1    -1        0  unknown 0   primary
#> 2292   may      401        1   336        2  failure 0     upper
#> 2293   apr      401        1    -1        0  unknown 0     upper
#> 2294   may      114        1   368        1  failure 0     upper
#> 2295   aug      100        4    -1        0  unknown 0     upper
#> 2296   may      238        1    -1        0  unknown 0   primary
#> 2297   may      125        1    -1        0  unknown 0     upper
#> 2298   aug      387        8    -1        0  unknown 0     upper
#> 2299   aug      129        2    -1        0  unknown 0     upper
#> 2300   jun      559        2    -1        0  unknown 0     upper
#> 2301   sep      658        4    95        2    other 1     upper
#> 2302   jan      219        1   246        1  failure 0     upper
#> 2303   jun       17       10    -1        0  unknown 0     upper
#> 2304   may      136        2    -1        0  unknown 0   primary
#> 2305   nov      147        2   179        3  failure 0   primary
#> 2306   apr      218        1   330        2  failure 0     upper
#> 2307   nov      766        3    -1        0  unknown 0     upper
#> 2308   jul      494        2    -1        0  unknown 0   primary
#> 2309   may      566        7    -1        0  unknown 0     upper
#> 2310   may      311        3   364        1  failure 0     upper
#> 2311   jun      166        2    -1        0  unknown 0   primary
#> 2312   aug      599        3    -1        0  unknown 0     upper
#> 2313   nov       62        6    -1        0  unknown 0     upper
#> 2314   feb      185        1    -1        0  unknown 1     upper
#> 2315   may       36        2   176        2  failure 0     upper
#> 2316   may      133        1    -1        0  unknown 0     upper
#> 2317   may      207        1   342        1  failure 0     upper
#> 2318   jul     1973        2    -1        0  unknown 1     upper
#> 2319   jul      176        4    -1        0  unknown 0     upper
#> 2320   may      162        1    -1        0  unknown 0     upper
#> 2321   aug      445        3    -1        0  unknown 0     upper
#> 2322   aug      119        2    95        3  success 0     upper
#> 2323   apr      129        2   148        4    other 0     upper
#> 2324   may      177        3    -1        0  unknown 0     upper
#> 2325   jul      125        1    -1        0  unknown 0     upper
#> 2326   aug      486        1   286        2  failure 0     upper
#> 2327   may      167        4    -1        0  unknown 0     upper
#> 2328   may      199        1    -1        0  unknown 0     upper
#> 2329   may      201        2   365        2  failure 0     upper
#> 2330   jul      142        3    -1        0  unknown 0   primary
#> 2331   may      102        2    -1        0  unknown 0   primary
#> 2332   jun      445        3    -1        0  unknown 0   unknown
#> 2333   jun      654        2    -1        0  unknown 0     upper
#> 2334   may      346        1   368        1  failure 0     upper
#> 2335   may      283        8    -1        0  unknown 0     upper
#> 2336   may      137        2    -1        0  unknown 0   primary
#> 2337   apr      487        1    -1        0  unknown 0     upper
#> 2338   may       34        1    -1        0  unknown 0     upper
#> 2339   apr      429        1    -1        0  unknown 0     upper
#> 2340   jun      231        1    -1        0  unknown 0     upper
#> 2341   may      777        3    -1        0  unknown 0     upper
#> 2342   may      240        1    -1        0  unknown 0     upper
#> 2343   nov      412        1    -1        0  unknown 1     upper
#> 2344   aug      171        6    -1        0  unknown 0     upper
#> 2345   feb      345        5    -1        0  unknown 0     upper
#> 2346   jul      280        1    -1        0  unknown 0     upper
#> 2347   aug       98        4    -1        0  unknown 0     upper
#> 2348   mar      284        2    -1        0  unknown 0     upper
#> 2349   apr      114        1    -1        0  unknown 0     upper
#> 2350   may      225        1    -1        0  unknown 0   primary
#> 2351   may       21        2    -1        0  unknown 0     upper
#> 2352   nov       89        1   145        1  failure 0     upper
#> 2353   jan      245        1    92        3  success 0     upper
#> 2354   may      187        1   367        4  failure 0     upper
#> 2355   jul      241        3    -1        0  unknown 0     upper
#> 2356   may      192        1    -1        0  unknown 0     upper
#> 2357   aug      146        9    -1        0  unknown 0     upper
#> 2358   feb       35        7   265        5    other 0     upper
#> 2359   sep      100        2    -1        0  unknown 1     upper
#> 2360   may       27        5    -1        0  unknown 0   unknown
#> 2361   aug       17       18    -1        0  unknown 0   unknown
#> 2362   may      170        2    -1        0  unknown 0   primary
#> 2363   may      182        2    -1        0  unknown 0     upper
#> 2364   jun      327        1    -1        0  unknown 0   unknown
#> 2365   jun      285        1    -1        0  unknown 0   primary
#> 2366   aug      156        2    -1        0  unknown 1     upper
#> 2367   jun      228        5    -1        0  unknown 0     upper
#> 2368   aug      226        9    -1        0  unknown 0     upper
#> 2369   oct     1246        2    -1        0  unknown 1     upper
#> 2370   may       75        4    -1        0  unknown 0     upper
#> 2371   may      218        3    -1        0  unknown 0     upper
#> 2372   sep      129        2    -1        0  unknown 0     upper
#> 2373   may      518        1    -1        0  unknown 0     upper
#> 2374   jul      222        1    -1        0  unknown 0   primary
#> 2375   sep      140        2    -1        0  unknown 1     upper
#> 2376   jun      181        2    -1        0  unknown 1     upper
#> 2377   may       49        1    -1        0  unknown 0     upper
#> 2378   jul      588        1    -1        0  unknown 0     upper
#> 2379   may      152        4   366        3  failure 0     upper
#> 2380   jul       72        9    -1        0  unknown 0     upper
#> 2381   may      643        2    -1        0  unknown 0     upper
#> 2382   oct      316        2    92        3  failure 0     upper
#> 2383   may       46        1    -1        0  unknown 0   primary
#> 2384   jun      218        2    -1        0  unknown 0   primary
#> 2385   may      300        1   370        3  failure 0     upper
#> 2386   aug      145       11    -1        0  unknown 0     upper
#> 2387   may       43        1    -1        0  unknown 0     upper
#> 2388   jul      101        3    -1        0  unknown 0     upper
#> 2389   jul      381        4    -1        0  unknown 0     upper
#> 2390   apr      245        1    -1        0  unknown 1     upper
#> 2391   jul      511        1    -1        0  unknown 0     upper
#> 2392   jul      254        2    -1        0  unknown 0     upper
#> 2393   aug      321        2    -1        0  unknown 0     upper
#> 2394   aug      281        5    -1        0  unknown 0     upper
#> 2395   jul       64        4    -1        0  unknown 0     upper
#> 2396   aug      108        3   277        1  success 1   unknown
#> 2397   may       96        3    -1        0  unknown 0     upper
#> 2398   may      206        3    -1        0  unknown 0     upper
#> 2399   may      310        1    -1        0  unknown 0     upper
#> 2400   nov      399        1    -1        0  unknown 0   primary
#> 2401   jun       92        3    -1        0  unknown 0   primary
#> 2402   may      333        1    -1        0  unknown 0     upper
#> 2403   jul      114        1    -1        0  unknown 0     upper
#> 2404   may      245        5   366        2  failure 0     upper
#> 2405   may      241        1    -1        0  unknown 0     upper
#> 2406   nov       89        1   175        1    other 0     upper
#> 2407   may      215        3    -1        0  unknown 0     upper
#> 2408   jul      165        2    -1        0  unknown 0     upper
#> 2409   may      328        1    -1        0  unknown 0     upper
#> 2410   may      157        3    -1        0  unknown 0     upper
#> 2411   may      357        1    -1        0  unknown 0   unknown
#> 2412   may      230        1    -1        0  unknown 0   primary
#> 2413   aug      670        1    -1        0  unknown 1     upper
#> 2414   apr       25        2    -1        0  unknown 0     upper
#> 2415   may      132        2   359        2  failure 0     upper
#> 2416   aug      123        2    -1        0  unknown 0   unknown
#> 2417   feb       67        2   202        1  failure 0     upper
#> 2418   may      116        2    -1        0  unknown 0     upper
#> 2419   may      157        2    -1        0  unknown 0     upper
#> 2420   apr       71        2    -1        0  unknown 0   unknown
#> 2421   may       15       10    -1        0  unknown 0     upper
#> 2422   may      565        2    -1        0  unknown 0     upper
#> 2423   aug      140        5    -1        0  unknown 0   primary
#> 2424   may      163        1    -1        0  unknown 0   primary
#> 2425   jun      375        5    -1        0  unknown 0     upper
#> 2426   apr      311        1   336        1  failure 0     upper
#> 2427   may      203        2    -1        0  unknown 0   unknown
#> 2428   may      185        3    -1        0  unknown 0     upper
#> 2429   apr      268        1    -1        0  unknown 0     upper
#> 2430   aug      142        2    -1        0  unknown 0     upper
#> 2431   may      334        3    -1        0  unknown 0     upper
#> 2432   jun     1365        4    -1        0  unknown 0     upper
#> 2433   nov      205        1    -1        0  unknown 0   primary
#> 2434   may      222        6    -1        0  unknown 0     upper
#> 2435   may      279        1    -1        0  unknown 0   primary
#> 2436   nov       79        4    -1        0  unknown 0     upper
#> 2437   may       17        7    -1        0  unknown 0   primary
#> 2438   nov      142        4   169        5  failure 0     upper
#> 2439   aug      996        2    -1        0  unknown 0     upper
#> 2440   nov      190        2    -1        0  unknown 0     upper
#> 2441   may        6        4    -1        0  unknown 0     upper
#> 2442   may     1046        3   333        2  success 1     upper
#> 2443   may       85        2    -1        0  unknown 0   primary
#> 2444   may      254        2    -1        0  unknown 0   primary
#> 2445   may      159        2    -1        0  unknown 0     upper
#> 2446   aug       76        2    -1        0  unknown 0     upper
#> 2447   may      131        1    -1        0  unknown 0     upper
#> 2448   may      145        2    -1        0  unknown 0   primary
#> 2449   jun      268        1    -1        0  unknown 0     upper
#> 2450   aug      162       13    -1        0  unknown 0     upper
#> 2451   aug      644        9    -1        0  unknown 0     upper
#> 2452   may      113        2   345        1    other 0     upper
#> 2453   jul       10        6    -1        0  unknown 0     upper
#> 2454   may      565        2    -1        0  unknown 0     upper
#> 2455   apr      389        1   266        2    other 0     upper
#> 2456   jul      557        5    -1        0  unknown 0     upper
#> 2457   may      338        4   288        2    other 0   primary
#> 2458   jan       28        1    -1        0  unknown 0     upper
#> 2459   feb      351        2    -1        0  unknown 0     upper
#> 2460   apr      154        1   182        1  success 0   primary
#> 2461   aug       11       22    -1        0  unknown 0     upper
#> 2462   jul       66        1    -1        0  unknown 0     upper
#> 2463   may      160        1    -1        0  unknown 0     upper
#> 2464   nov       85        1    -1        0  unknown 0     upper
#> 2465   aug       91        2    -1        0  unknown 0     upper
#> 2466   feb      608        1    -1        0  unknown 0     upper
#> 2467   may      160        2    -1        0  unknown 0   primary
#> 2468   may        4        2    -1        0  unknown 0     upper
#> 2469   jul      122        1    72        1  failure 0     upper
#> 2470   aug      275        1    -1        0  unknown 0     upper
#> 2471   may      266        2    -1        0  unknown 0   primary
#> 2472   aug      267        3    -1        0  unknown 0     upper
#> 2473   may      193        5    -1        0  unknown 0     upper
#> 2474   may       12        8    -1        0  unknown 0     upper
#> 2475   aug      119        1    99        3  failure 0     upper
#> 2476   may      364        2   343        4  failure 0     upper
#> 2477   jun      578        2    -1        0  unknown 1     upper
#> 2478   may        8        4    -1        0  unknown 0     upper
#> 2479   apr      164        1    -1        0  unknown 0     upper
#> 2480   may      685        1   101        1    other 1     upper
#> 2481   feb      224        1    -1        0  unknown 0     upper
#> 2482   jul      923        2    -1        0  unknown 1   primary
#> 2483   may      267        1   369        1  failure 0     upper
#> 2484   jun      159        1    -1        0  unknown 0     upper
#> 2485   jul      314        2    -1        0  unknown 0     upper
#> 2486   apr     1138        2   138        1  failure 1     upper
#> 2487   may      427        3    -1        0  unknown 0   primary
#> 2488   may      346        4    -1        0  unknown 0     upper
#> 2489   jun      539        1    -1        0  unknown 1     upper
#> 2490   may      380        3    -1        0  unknown 0     upper
#> 2491   may      227        2    -1        0  unknown 0   primary
#> 2492   apr       77        2    -1        0  unknown 0     upper
#> 2493   jun      138        1    -1        0  unknown 0   primary
#> 2494   jun      142        1    -1        0  unknown 0     upper
#> 2495   nov      697        2   184        3  failure 0     upper
#> 2496   may       84        1   282        4  failure 0     upper
#> 2497   feb       52        1   253        2  failure 0     upper
#> 2498   may      318        1    -1        0  unknown 0     upper
#> 2499   jun      100        1    -1        0  unknown 0     upper
#> 2500   may      622        1    -1        0  unknown 0     upper
#> 2501   jul      297        5    -1        0  unknown 0     upper
#> 2502   apr      300        3   302        3  failure 0   unknown
#> 2503   jun      174        1    -1        0  unknown 0     upper
#> 2504   jun      562        3    -1        0  unknown 0     upper
#> 2505   jul      658        3    -1        0  unknown 1     upper
#> 2506   jul      188        2    82        4    other 0     upper
#> 2507   sep      190        1    -1        0  unknown 1     upper
#> 2508   jun      106        4    -1        0  unknown 0     upper
#> 2509   may      101        3    -1        0  unknown 0     upper
#> 2510   may       34        1   361        7  failure 0     upper
#> 2511   feb       60        1   271        1  failure 0     upper
#> 2512   jul      221        3    -1        0  unknown 0     upper
#> 2513   jan      373        1    -1        0  unknown 0     upper
#> 2514   may      208        3    -1        0  unknown 0   primary
#> 2515   jul      356        1    -1        0  unknown 1     upper
#> 2516   may      260        1    77        9  failure 0     upper
#> 2517   aug       41        2    -1        0  unknown 0     upper
#> 2518   nov      696        2    -1        0  unknown 1     upper
#> 2519   jun      100        8    -1        0  unknown 0   primary
#> 2520   nov      360        2    -1        0  unknown 0     upper
#> 2521   jul       83        2    -1        0  unknown 0     upper
#> 2522   jul      898        5    -1        0  unknown 0     upper
#> 2523   aug      562        2    -1        0  unknown 1   primary
#> 2524   sep      204        1   365        1  success 1     upper
#> 2525   may      796        1    -1        0  unknown 0     upper
#> 2526   may      125        2   370        3  failure 0     upper
#> 2527   jun      318        3    -1        0  unknown 0     upper
#> 2528   may      207        2    -1        0  unknown 0     upper
#> 2529   jun      151        2    -1        0  unknown 0     upper
#> 2530   may      157        4    -1        0  unknown 0     upper
#> 2531   jun       17        2    -1        0  unknown 0     upper
#> 2532   sep      208        2    -1        0  unknown 1     upper
#> 2533   jun      269        1    92        2  failure 0     upper
#> 2534   may      189        1   326        5  failure 0   primary
#> 2535   nov      266        2    -1        0  unknown 0     upper
#> 2536   feb      102        4    -1        0  unknown 0     upper
#> 2537   may      202        2    -1        0  unknown 0     upper
#> 2538   jan       28        1    -1        0  unknown 0   unknown
#> 2539   jul      469        4    -1        0  unknown 0   primary
#> 2540   may      246        1    -1        0  unknown 0   primary
#> 2541   jul      297        1    -1        0  unknown 0   unknown
#> 2542   may      179        1    -1        0  unknown 0     upper
#> 2543   may      430        1    50        3  success 1     upper
#> 2544   jul      166        8    -1        0  unknown 0   primary
#> 2545   jul       11        3    -1        0  unknown 0     upper
#> 2546   aug      153        1    -1        0  unknown 0   primary
#> 2547   oct      212        2    -1        0  unknown 1     upper
#> 2548   jun      177        5   138        1  failure 0     upper
#> 2549   apr      224        2   182        1  success 1     upper
#> 2550   jul       61       14    -1        0  unknown 0     upper
#> 2551   nov      288        1    -1        0  unknown 0     upper
#> 2552   may       27        1    -1        0  unknown 0   primary
#> 2553   jun      190        2    -1        0  unknown 0     upper
#> 2554   oct       67        6   141       13  failure 0     upper
#> 2555   jul      957        3    -1        0  unknown 0     upper
#> 2556   may      306        1   262        1    other 0     upper
#> 2557   nov      183        1    -1        0  unknown 0     upper
#> 2558   nov      997        2    -1        0  unknown 0   primary
#> 2559   jul       77        5    -1        0  unknown 0     upper
#> 2560   apr     1096        1    -1        0  unknown 0   primary
#> 2561   jul       69        3    -1        0  unknown 0   primary
#> 2562   jul      262        2    -1        0  unknown 0     upper
#> 2563   jan      643        1    -1        0  unknown 0     upper
#> 2564   dec      234        1    -1        0  unknown 0     upper
#> 2565   jan     1616        1    95        2  success 1     upper
#> 2566   may      118        1    -1        0  unknown 0     upper
#> 2567   jul      652        2    -1        0  unknown 0     upper
#> 2568   feb       96        2   208        1  failure 0     upper
#> 2569   feb      410        1    -1        0  unknown 0     upper
#> 2570   feb       91        1    -1        0  unknown 0     upper
#> 2571   apr       52        1    -1        0  unknown 0     upper
#> 2572   jul      500        2    -1        0  unknown 0     upper
#> 2573   apr      417        2    57        3  failure 0     upper
#> 2574   jul      341        5    -1        0  unknown 0     upper
#> 2575   jan      155        1    -1        0  unknown 0     upper
#> 2576   apr      359        1    -1        0  unknown 0     upper
#> 2577   jun      522        1   183        2  success 1     upper
#> 2578   aug      199        1    -1        0  unknown 1     upper
#> 2579   may        9        6    -1        0  unknown 0     upper
#> 2580   jun      405        2    -1        0  unknown 0     upper
#> 2581   oct      760        1    -1        0  unknown 0     upper
#> 2582   may      532        1   358        1  failure 0     upper
#> 2583   may      302       16    -1        0  unknown 0     upper
#> 2584   jul      181        2    -1        0  unknown 0     upper
#> 2585   aug      117        4    -1        0  unknown 0     upper
#> 2586   aug       71        4    -1        0  unknown 0   primary
#> 2587   nov      190        1    -1        0  unknown 0     upper
#> 2588   may      144        1   365        1  failure 0     upper
#> 2589   feb       75        2    -1        0  unknown 0     upper
#> 2590   aug       82        2    -1        0  unknown 0     upper
#> 2591   may      246        1    -1        0  unknown 0     upper
#> 2592   aug      171        2    -1        0  unknown 0     upper
#> 2593   apr      126        3    -1        0  unknown 0     upper
#> 2594   may      280        1    -1        0  unknown 0   primary
#> 2595   nov       62        1    -1        0  unknown 0     upper
#> 2596   may       43        3   369        2  failure 0     upper
#> 2597   may       49        1    -1        0  unknown 0     upper
#> 2598   jun      227        1    -1        0  unknown 0   primary
#> 2599   may      412        1    -1        0  unknown 0     upper
#> 2600   may      480        1    -1        0  unknown 0     upper
#> 2601   aug        8       10    -1        0  unknown 0     upper
#> 2602   may      147        2    -1        0  unknown 0     upper
#> 2603   may      259        3   353        3  failure 0   primary
#> 2604   jul       49        4    -1        0  unknown 0     upper
#> 2605   may      877        2   345        5  failure 0     upper
#> 2606   feb      112        5    94       15  success 0   primary
#> 2607   jun      100        3    -1        0  unknown 0     upper
#> 2608   may      148        4    -1        0  unknown 0   primary
#> 2609   aug       61        4    -1        0  unknown 0     upper
#> 2610   aug      229        2    -1        0  unknown 0     upper
#> 2611   aug       65        6    -1        0  unknown 0     upper
#> 2612   feb      702        2   189        2  failure 0   primary
#> 2613   jul      184        3    -1        0  unknown 0     upper
#> 2614   feb       61        1   275        1  failure 0     upper
#> 2615   may      109        3    -1        0  unknown 0     upper
#> 2616   jun      453        1    -1        0  unknown 0     upper
#> 2617   may      327        2    -1        0  unknown 0     upper
#> 2618   aug      152        2    -1        0  unknown 0     upper
#> 2619   feb      430        1    -1        0  unknown 1     upper
#> 2620   nov      653        1    -1        0  unknown 1     upper
#> 2621   may       88        5    -1        0  unknown 0   unknown
#> 2622   may      354        2   335        3    other 0     upper
#> 2623   apr      124        1    -1        0  unknown 0     upper
#> 2624   may      145        1   365        2  failure 0     upper
#> 2625   nov       39        4   182        3  failure 0     upper
#> 2626   may       34        9    -1        0  unknown 0   unknown
#> 2627   nov      103        1    -1        0  unknown 0   unknown
#> 2628   nov      305        2    -1        0  unknown 0     upper
#> 2629   nov      188        1    -1        0  unknown 0     upper
#> 2630   feb       43        1   261        3  failure 0   primary
#> 2631   may      154        2   350        1  failure 0   unknown
#> 2632   jun      181        1   320        1    other 0     upper
#> 2633   may       38        7   332        6  failure 0   primary
#> 2634   feb     1019        2    -1        0  unknown 1     upper
#> 2635   may      206        2    -1        0  unknown 0     upper
#> 2636   jul      541        7    -1        0  unknown 0     upper
#> 2637   aug       82        2    -1        0  unknown 0     upper
#> 2638   aug      180        2    -1        0  unknown 0     upper
#> 2639   aug       76        8    -1        0  unknown 0   primary
#> 2640   aug      123        2    -1        0  unknown 0     upper
#> 2641   may     1059        2    -1        0  unknown 1   primary
#> 2642   jun      108        2    -1        0  unknown 0     upper
#> 2643   nov      120        1    -1        0  unknown 0     upper
#> 2644   aug      227        3    -1        0  unknown 0     upper
#> 2645   aug      239        4    -1        0  unknown 0     upper
#> 2646   may      597        3    -1        0  unknown 0   unknown
#> 2647   jan       58        1   266        1  failure 0     upper
#> 2648   nov      412        1    -1        0  unknown 0     upper
#> 2649   aug       93        9    -1        0  unknown 0     upper
#> 2650   nov      324        1   172        1  failure 0     upper
#> 2651   nov      149        4   186        1    other 0     upper
#> 2652   jun       64        1    -1        0  unknown 0     upper
#> 2653   jul      108        2    -1        0  unknown 0     upper
#> 2654   jul       44        7    -1        0  unknown 0   unknown
#> 2655   aug      151        1    -1        0  unknown 0     upper
#> 2656   jun        8        6    -1        0  unknown 0     upper
#> 2657   may       98        1    -1        0  unknown 0   primary
#> 2658   aug       79        4    -1        0  unknown 0     upper
#> 2659   may       99        1    -1        0  unknown 0     upper
#> 2660   may      276        1    -1        0  unknown 0     upper
#> 2661   nov        7        5    -1        0  unknown 0     upper
#> 2662   jun      680        2    -1        0  unknown 0     upper
#> 2663   jun      364       13    -1        0  unknown 0     upper
#> 2664   may      212        1    -1        0  unknown 0     upper
#> 2665   jun      689        3    -1        0  unknown 0     upper
#> 2666   jun      171        2    -1        0  unknown 0     upper
#> 2667   jun      102        3    -1        0  unknown 0     upper
#> 2668   aug      138        1    -1        0  unknown 0     upper
#> 2669   jul      483        2    -1        0  unknown 0     upper
#> 2670   may      467        4    -1        0  unknown 0   primary
#> 2671   nov       74        2   110        4  failure 0     upper
#> 2672   aug       88        2    -1        0  unknown 0     upper
#> 2673   feb      245        4    -1        0  unknown 0     upper
#> 2674   jun      142        2    -1        0  unknown 0     upper
#> 2675   feb      110        1    -1        0  unknown 0   primary
#> 2676   jun       20        5    -1        0  unknown 0     upper
#> 2677   jan       78        2    -1        0  unknown 0     upper
#> 2678   apr       71        2   345        2  success 0     upper
#> 2679   jun       77        5    -1        0  unknown 0     upper
#> 2680   aug       97        4    -1        0  unknown 0     upper
#> 2681   feb      206        3    -1        0  unknown 0     upper
#> 2682   jul      156        4    -1        0  unknown 0     upper
#> 2683   may      700        4    92        7  success 1   primary
#> 2684   apr      251        1    -1        0  unknown 0     upper
#> 2685   may      172        5   371        5  failure 0     upper
#> 2686   jul      161        1    -1        0  unknown 0     upper
#> 2687   may       69        1   260        6  failure 0     upper
#> 2688   dec      170        1    -1        0  unknown 0     upper
#> 2689   oct      287        1    -1        0  unknown 1     upper
#> 2690   jun      254        1    96        2  failure 0     upper
#> 2691   jun       91        2    -1        0  unknown 0     upper
#> 2692   jul       23       16    -1        0  unknown 0     upper
#> 2693   aug       90        1    91        1  failure 0     upper
#> 2694   jul      117        3    -1        0  unknown 0     upper
#> 2695   jun      304        2    -1        0  unknown 0     upper
#> 2696   nov      342        2   120        4  failure 0     upper
#> 2697   may      129        5    -1        0  unknown 0     upper
#> 2698   jul      560        1    -1        0  unknown 1   primary
#> 2699   may       75        1    -1        0  unknown 0   unknown
#> 2700   jun      245        1    -1        0  unknown 0   primary
#> 2701   feb       64        1    -1        0  unknown 0   primary
#> 2702   jul      132        3    -1        0  unknown 0     upper
#> 2703   may       20       11    -1        0  unknown 0     upper
#> 2704   may      157        5    -1        0  unknown 0     upper
#> 2705   may       67        1    -1        0  unknown 0     upper
#> 2706   oct      518        1   147        2  success 1     upper
#> 2707   apr      148        2    -1        0  unknown 0     upper
#> 2708   jan      372        1   196        2  success 1   primary
#> 2709   nov       79        1    -1        0  unknown 0     upper
#> 2710   aug      391        3   106        1  failure 1   unknown
#> 2711   jun       94        2    -1        0  unknown 0   unknown
#> 2712   nov      895        1   183        2  failure 0     upper
#> 2713   jun      356        2    -1        0  unknown 0   primary
#> 2714   jun      541        3    -1        0  unknown 1     upper
#> 2715   oct      282        2    -1        0  unknown 1     upper
#> 2716   may      480        2    -1        0  unknown 0   primary
#> 2717   may      258        9    -1        0  unknown 0   primary
#> 2718   may      105        1    -1        0  unknown 0     upper
#> 2719   may      358        2   174        1  failure 0   primary
#> 2720   nov      214        2   174        2  success 0     upper
#> 2721   aug       12       16    -1        0  unknown 0     upper
#> 2722   aug      484        4    -1        0  unknown 0     upper
#> 2723   nov       36        3    -1        0  unknown 0     upper
#> 2724   feb      475        1    -1        0  unknown 0     upper
#> 2725   aug      145        2    -1        0  unknown 0     upper
#> 2726   jun       48        1    -1        0  unknown 0     upper
#> 2727   may      233        1    -1        0  unknown 0   unknown
#> 2728   nov      342        2    -1        0  unknown 0     upper
#> 2729   nov       47        1    -1        0  unknown 0     upper
#> 2730   may      149        1    -1        0  unknown 0     upper
#> 2731   sep      679        1    -1        0  unknown 1     upper
#> 2732   feb      184        2    -1        0  unknown 0   unknown
#> 2733   jul       32        7    -1        0  unknown 0     upper
#> 2734   jun      167        1    -1        0  unknown 0     upper
#> 2735   may      290        2    -1        0  unknown 0     upper
#> 2736   jul       63        1    -1        0  unknown 0     upper
#> 2737   apr      197        1    -1        0  unknown 0     upper
#> 2738   jun      361        3    -1        0  unknown 0     upper
#> 2739   nov      191        2    -1        0  unknown 0   unknown
#> 2740   feb      637        1   183        1  success 1     upper
#> 2741   jul      658        2    -1        0  unknown 1     upper
#> 2742   may      789        3    -1        0  unknown 1     upper
#> 2743   jun      216        2    -1        0  unknown 0     upper
#> 2744   oct       78        3    -1        0  unknown 0     upper
#> 2745   aug      315        1    -1        0  unknown 0   primary
#> 2746   jul       33       31    -1        0  unknown 0     upper
#> 2747   jul      406        4    -1        0  unknown 0     upper
#> 2748   jun      139        2    -1        0  unknown 0   primary
#> 2749   feb      153        1    92       13  success 1     upper
#> 2750   oct      521        2    -1        0  unknown 0   unknown
#> 2751   jul      114        2    -1        0  unknown 0     upper
#> 2752   may       63        2    -1        0  unknown 0     upper
#> 2753   may       39        1    -1        0  unknown 0     upper
#> 2754   apr       44        1    -1        0  unknown 0     upper
#> 2755   may      126        1    -1        0  unknown 0   primary
#> 2756   jan      354        1   197        1  failure 0     upper
#> 2757   jul      117        4    -1        0  unknown 0   unknown
#> 2758   may       15        7   178        1    other 0     upper
#> 2759   aug      300        2    -1        0  unknown 0     upper
#> 2760   may     1534        2    -1        0  unknown 0     upper
#> 2761   aug      211        2    -1        0  unknown 0   unknown
#> 2762   sep      299        1    -1        0  unknown 1     upper
#> 2763   jun     1062        4    -1        0  unknown 0     upper
#> 2764   oct      280        2    97        3  success 0     upper
#> 2765   aug       58        2    -1        0  unknown 0     upper
#> 2766   jul      103        4    -1        0  unknown 0   primary
#> 2767   feb      415        2   272        2  failure 0   primary
#> 2768   nov      163        2   110       15  failure 0     upper
#> 2769   feb       71        1    -1        0  unknown 0     upper
#> 2770   jul       88        3    -1        0  unknown 0     upper
#> 2771   may      127        1    -1        0  unknown 0     upper
#> 2772   may      185        7    -1        0  unknown 0     upper
#> 2773   apr      277        2   333        1  failure 0     upper
#> 2774   aug      711        3    -1        0  unknown 0     upper
#> 2775   jun      142        3    -1        0  unknown 0   unknown
#> 2776   nov       65        3    -1        0  unknown 0   primary
#> 2777   jan      103        2    -1        0  unknown 0     upper
#> 2778   may      152        1    -1        0  unknown 0     upper
#> 2779   feb       71        1   243        3  failure 0     upper
#> 2780   aug      255        1    -1        0  unknown 0     upper
#> 2781   feb      106        4    -1        0  unknown 0   primary
#> 2782   jun      389        1    -1        0  unknown 0     upper
#> 2783   aug      160        6    -1        0  unknown 0   primary
#> 2784   aug      299        3    -1        0  unknown 0     upper
#> 2785   jun       78        7    -1        0  unknown 0     upper
#> 2786   jul      112        1    -1        0  unknown 0     upper
#> 2787   nov      133        3    89        1  failure 0     upper
#> 2788   nov       48        2    -1        0  unknown 0   primary
#> 2789   jun      106        2    -1        0  unknown 0     upper
#> 2790   may      185        4    -1        0  unknown 0     upper
#> 2791   jun       71       12    -1        0  unknown 0     upper
#> 2792   may      229        2    -1        0  unknown 0   primary
#> 2793   aug      115        1    93        2  failure 0   primary
#> 2794   aug       80       10    -1        0  unknown 0     upper
#> 2795   aug      306        4    -1        0  unknown 0     upper
#> 2796   sep      234        1   100        1  failure 1     upper
#> 2797   may      233        2    -1        0  unknown 0     upper
#> 2798   may      197        2    -1        0  unknown 0     upper
#> 2799   may      297        3    -1        0  unknown 0   primary
#> 2800   aug      169        5    -1        0  unknown 0   primary
#> 2801   nov      583        2    -1        0  unknown 0     upper
#> 2802   nov      116        2    -1        0  unknown 0     upper
#> 2803   may      227        9    -1        0  unknown 0     upper
#> 2804   nov     1258        2   122        2    other 1     upper
#> 2805   jun       87        7    -1        0  unknown 0   primary
#> 2806   aug      132        2    -1        0  unknown 0     upper
#> 2807   may      120        1    -1        0  unknown 0     upper
#> 2808   nov      173        1    -1        0  unknown 0     upper
#> 2809   jul      309        1    -1        0  unknown 0     upper
#> 2810   jul      374        3    -1        0  unknown 0   primary
#> 2811   jul      173        6    -1        0  unknown 0     upper
#> 2812   jul      136        1    -1        0  unknown 0     upper
#> 2813   jun      607        2    -1        0  unknown 0     upper
#> 2814   feb       49        6    -1        0  unknown 0     upper
#> 2815   jan      227        1    -1        0  unknown 0     upper
#> 2816   aug      195        1    -1        0  unknown 1     upper
#> 2817   may      181        6    -1        0  unknown 0   primary
#> 2818   may      434        2    -1        0  unknown 0   unknown
#> 2819   mar       59        2    -1        0  unknown 0   unknown
#> 2820   may       50        2    -1        0  unknown 0     upper
#> 2821   may      198        2    88        1    other 0     upper
#> 2822   jul      409        4    -1        0  unknown 0     upper
#> 2823   may     1576        1    -1        0  unknown 0     upper
#> 2824   may      404        1    -1        0  unknown 0     upper
#> 2825   apr       70        1   344        1  failure 0   primary
#> 2826   jun       96        1    -1        0  unknown 0     upper
#> 2827   may      131        2    -1        0  unknown 1   unknown
#> 2828   feb       68        1    -1        0  unknown 0     upper
#> 2829   jul      134        2    -1        0  unknown 0     upper
#> 2830   jul      182        1    -1        0  unknown 0     upper
#> 2831   may      181        2    -1        0  unknown 0     upper
#> 2832   nov      405        2    -1        0  unknown 0     upper
#> 2833   aug      162        3    -1        0  unknown 0     upper
#> 2834   may      186        4   358       11  failure 0     upper
#> 2835   may       96        5    -1        0  unknown 0     upper
#> 2836   may       28        1    -1        0  unknown 0     upper
#> 2837   may      143        1    -1        0  unknown 0     upper
#> 2838   jan      103        3    -1        0  unknown 0     upper
#> 2839   apr      609        2   266        2  failure 0     upper
#> 2840   aug      265       16    -1        0  unknown 0     upper
#> 2841   may      169        1   346        1  failure 0   primary
#> 2842   jun      196        2    -1        0  unknown 0     upper
#> 2843   aug      125        4    -1        0  unknown 0     upper
#> 2844   jul     1130        8    -1        0  unknown 1     upper
#> 2845   aug      295        3    -1        0  unknown 0     upper
#> 2846   aug      153        8    -1        0  unknown 0     upper
#> 2847   nov      454        1    -1        0  unknown 1     upper
#> 2848   may      212        4   312        6    other 0   unknown
#> 2849   may      107        2    -1        0  unknown 0     upper
#> 2850   aug      288        1   181        2  failure 1     upper
#> 2851   may      192        1    -1        0  unknown 0     upper
#> 2852   aug       49        7    -1        0  unknown 0     upper
#> 2853   may      224        1    -1        0  unknown 0     upper
#> 2854   jul      439        1    -1        0  unknown 0   primary
#> 2855   may      133        1    -1        0  unknown 0     upper
#> 2856   may      124        1    -1        0  unknown 0     upper
#> 2857   may      165        2    -1        0  unknown 0     upper
#> 2858   feb       87        2    -1        0  unknown 1     upper
#> 2859   aug      221       12    -1        0  unknown 0     upper
#> 2860   may      129        1    -1        0  unknown 0     upper
#> 2861   sep      175        1   184        2  success 1     upper
#> 2862   may       66        3    -1        0  unknown 0     upper
#> 2863   apr      278        3    -1        0  unknown 1   unknown
#> 2864   jul      138        3    -1        0  unknown 0     upper
#> 2865   may      359        6    -1        0  unknown 0     upper
#> 2866   may      167        1    -1        0  unknown 0     upper
#> 2867   may      341        1    -1        0  unknown 0     upper
#> 2868   apr      339        1    -1        0  unknown 0     upper
#> 2869   may      156       13    -1        0  unknown 0     upper
#> 2870   may       85       16    -1        0  unknown 0     upper
#> 2871   may      637        3    -1        0  unknown 0     upper
#> 2872   aug      129        9    -1        0  unknown 0     upper
#> 2873   aug      358        2    -1        0  unknown 0     upper
#> 2874   feb       20        1    -1        0  unknown 0     upper
#> 2875   aug      142        2    -1        0  unknown 0     upper
#> 2876   aug      141        1    -1        0  unknown 0     upper
#> 2877   jun      174        9    -1        0  unknown 0     upper
#> 2878   nov       10        3    -1        0  unknown 0     upper
#> 2879   jun      307        2    -1        0  unknown 0   unknown
#> 2880   jul     1739        7    -1        0  unknown 0     upper
#> 2881   may      360        1   173        1    other 0     upper
#> 2882   sep      169        1    -1        0  unknown 1   unknown
#> 2883   apr      122        1   338        2  failure 0   primary
#> 2884   jun      130        2    -1        0  unknown 0     upper
#> 2885   may      181        4    -1        0  unknown 0     upper
#> 2886   may      267        3    -1        0  unknown 0   primary
#> 2887   may      115        6    -1        0  unknown 0     upper
#> 2888   jul      105       10    -1        0  unknown 0     upper
#> 2889   nov      213        1    -1        0  unknown 0   primary
#> 2890   jul      195        2    91       10  success 1     upper
#> 2891   jun      131        2    -1        0  unknown 0     upper
#> 2892   aug      126        2    -1        0  unknown 0     upper
#> 2893   oct      301        1   216        2  failure 0     upper
#> 2894   feb      277        1   169        2  failure 0     upper
#> 2895   jul      551        8    -1        0  unknown 0     upper
#> 2896   jul     1127        3    -1        0  unknown 1     upper
#> 2897   aug      103        6    -1        0  unknown 0     upper
#> 2898   nov      222        2    -1        0  unknown 0     upper
#> 2899   nov      153        2   183        2  failure 0     upper
#> 2900   may      173        1    -1        0  unknown 0     upper
#> 2901   may      427        1    -1        0  unknown 1     upper
#> 2902   apr       78        1    84        1  failure 0     upper
#> 2903   jun      108        2    -1        0  unknown 0     upper
#> 2904   feb      335        1    -1        0  unknown 0     upper
#> 2905   may      160        1    -1        0  unknown 0     upper
#> 2906   jul      309        2    -1        0  unknown 0     upper
#> 2907   aug      106        2    -1        0  unknown 0     upper
#> 2908   feb      133        3     5        2    other 0     upper
#> 2909   aug       31        2    -1        0  unknown 0     upper
#> 2910   jul      711        1    -1        0  unknown 0     upper
#> 2911   jul      496        2   182       11  success 1     upper
#> 2912   jun       73        1    -1        0  unknown 0     upper
#> 2913   may       71        5    40        4  failure 0     upper
#> 2914   aug       82        2    -1        0  unknown 0     upper
#> 2915   nov      210        1    93        1  success 1   primary
#> 2916   may       43        1    -1        0  unknown 0     upper
#> 2917   may      798        2    -1        0  unknown 1     upper
#> 2918   jun      237        3    -1        0  unknown 0     upper
#> 2919   aug       82        2    -1        0  unknown 0     upper
#> 2920   may       66        1   359        1  failure 0     upper
#> 2921   feb      841        3    -1        0  unknown 0     upper
#> 2922   may      376        2    -1        0  unknown 0     upper
#> 2923   nov      217        1    70        2  failure 1     upper
#> 2924   nov       76        3    -1        0  unknown 0     upper
#> 2925   oct      216        1    57        1  failure 1     upper
#> 2926   aug       78        2    -1        0  unknown 0     upper
#> 2927   jun      243        1    -1        0  unknown 0     upper
#> 2928   apr      249        1    86        3  failure 0     upper
#> 2929   aug      190        2    -1        0  unknown 0     upper
#> 2930   jun      685        3    -1        0  unknown 1   unknown
#> 2931   jan      430        1    -1        0  unknown 0     upper
#> 2932   may      206        1    -1        0  unknown 0     upper
#> 2933   aug      272        4    -1        0  unknown 0     upper
#> 2934   may      103        3    -1        0  unknown 0     upper
#> 2935   may      123        1    -1        0  unknown 0     upper
#> 2936   may      875        5    -1        0  unknown 0     upper
#> 2937   may       66        1    -1        0  unknown 0     upper
#> 2938   may      153        2    -1        0  unknown 1     upper
#> 2939   aug      204        3   105        1  failure 1     upper
#> 2940   may      300        1    -1        0  unknown 0     upper
#> 2941   may      163        2    -1        0  unknown 0   primary
#> 2942   aug       69       17    -1        0  unknown 0     upper
#> 2943   aug      813        2    -1        0  unknown 0     upper
#> 2944   jul      991        5    -1        0  unknown 1     upper
#> 2945   feb      169        1   191        3  success 1     upper
#> 2946   feb      398        4   189       12  success 0     upper
#> 2947   may      168        1   265        2  failure 0     upper
#> 2948   jan      413        3    -1        0  unknown 0     upper
#> 2949   may       81        9    -1        0  unknown 0     upper
#> 2950   jun       61        2    -1        0  unknown 0   primary
#> 2951   may      102        3    -1        0  unknown 0     upper
#> 2952   jul       15       19    -1        0  unknown 0     upper
#> 2953   jan      404        2   251        6  failure 0     upper
#> 2954   may      239        2    -1        0  unknown 0     upper
#> 2955   jan      150        1    -1        0  unknown 0     upper
#> 2956   nov      640        1    -1        0  unknown 0     upper
#> 2957   may      523        2   363        2  failure 0     upper
#> 2958   may      254        4    -1        0  unknown 0     upper
#> 2959   feb       64        2    -1        0  unknown 0     upper
#> 2960   jul      363        1    -1        0  unknown 0     upper
#> 2961   jun      376        3    -1        0  unknown 0   unknown
#> 2962   may      202        4    -1        0  unknown 0   primary
#> 2963   may      171        1    -1        0  unknown 0     upper
#> 2964   may      333        3    -1        0  unknown 0     upper
#> 2965   jun      232        2    -1        0  unknown 1     upper
#> 2966   apr      766        3    84        3  success 1     upper
#> 2967   feb      439        2    -1        0  unknown 0     upper
#> 2968   jun       53        1    -1        0  unknown 0   primary
#> 2969   may      112        1    -1        0  unknown 0     upper
#> 2970   aug      356        1    -1        0  unknown 0     upper
#> 2971   jun      973        1    -1        0  unknown 1   primary
#> 2972   may      591        1    -1        0  unknown 1   primary
#> 2973   jun      184        1    -1        0  unknown 0     upper
#> 2974   jul      120       11    -1        0  unknown 0     upper
#> 2975   aug      147       10    -1        0  unknown 0   primary
#> 2976   may      125        1    -1        0  unknown 0     upper
#> 2977   may      179        1    -1        0  unknown 0   primary
#> 2978   dec      137        1   122        3  failure 0     upper
#> 2979   sep      961        5    -1        0  unknown 1   primary
#> 2980   may       67        2    -1        0  unknown 0     upper
#> 2981   aug      231        4    -1        0  unknown 0     upper
#> 2982   may      114        3    -1        0  unknown 0     upper
#> 2983   aug      961        4    -1        0  unknown 1     upper
#> 2984   may      171       10    -1        0  unknown 0     upper
#> 2985   aug      744        7    -1        0  unknown 0     upper
#> 2986   may      194        3    -1        0  unknown 0     upper
#> 2987   jun      255        1    -1        0  unknown 1   primary
#> 2988   apr      557        1    -1        0  unknown 0   primary
#> 2989   feb       82        1   244        1  failure 0   primary
#> 2990   may      151        8    -1        0  unknown 0     upper
#> 2991   nov      520        1    -1        0  unknown 0     upper
#> 2992   may      161        1    -1        0  unknown 0     upper
#> 2993   oct      172        1    -1        0  unknown 0   primary
#> 2994   apr       18        1    -1        0  unknown 0     upper
#> 2995   may      512        5    -1        0  unknown 0     upper
#> 2996   aug      203        1    -1        0  unknown 0     upper
#> 2997   jun      263        1    -1        0  unknown 0   primary
#> 2998   oct      112        1    -1        0  unknown 1     upper
#> 2999   jan      118        1    -1        0  unknown 0   primary
#> 3000   feb      149        2    -1        0  unknown 0     upper
#> 3001   may      230        1    -1        0  unknown 0   primary
#> 3002   nov      718        1    -1        0  unknown 0     upper
#> 3003   jun       59        4    -1        0  unknown 0     upper
#> 3004   may       61        1   298        2  failure 0     upper
#> 3005   apr      179        1   334        1    other 0     upper
#> 3006   aug      669        2    -1        0  unknown 1     upper
#> 3007   aug      343        5    -1        0  unknown 0     upper
#> 3008   jun       41        7    -1        0  unknown 0   unknown
#> 3009   jan      423        1    -1        0  unknown 1     upper
#> 3010   apr      445        1   135        3  failure 0     upper
#> 3011   apr      224        1    -1        0  unknown 0     upper
#> 3012   may      408        2   350        1  failure 0   primary
#> 3013   apr      533        1    -1        0  unknown 0     upper
#> 3014   may      444        1    -1        0  unknown 0     upper
#> 3015   oct      181        2   500        1  failure 0     upper
#> 3016   jul      158        2    -1        0  unknown 0     upper
#> 3017   may      131        1    -1        0  unknown 0   primary
#> 3018   may      588        2    -1        0  unknown 0     upper
#> 3019   apr      232        1   335        1  failure 0   primary
#> 3020   jun      212        1    -1        0  unknown 0     upper
#> 3021   jun      348        1    -1        0  unknown 0     upper
#> 3022   jan      138        2   164        4    other 0     upper
#> 3023   may       81        4    -1        0  unknown 0     upper
#> 3024   aug       34       14    -1        0  unknown 0   primary
#> 3025   jun      339        2    -1        0  unknown 0     upper
#> 3026   may       14        3   355        4    other 0     upper
#> 3027   may      349        1    -1        0  unknown 0     upper
#> 3028   feb       88        2    -1        0  unknown 0     upper
#> 3029   may      211        3    -1        0  unknown 0     upper
#> 3030   aug      139        8    -1        0  unknown 0   primary
#> 3031   may      170        2    87        1  failure 0     upper
#> 3032   jul      118        2    -1        0  unknown 0   unknown
#> 3033   apr      326        1   319        1  failure 0   primary
#> 3034   oct      509        1    -1        0  unknown 1   unknown
#> 3035   apr      232        1   147        2  failure 0     upper
#> 3036   jun      114        4    -1        0  unknown 0     upper
#> 3037   jun       87        6    -1        0  unknown 0     upper
#> 3038   jun      138        2    -1        0  unknown 0   primary
#> 3039   may      131        2    -1        0  unknown 0     upper
#> 3040   jun      170        7    -1        0  unknown 0     upper
#> 3041   aug      187        4    -1        0  unknown 0     upper
#> 3042   jul      426        4    -1        0  unknown 0     upper
#> 3043   jun      126        4    -1        0  unknown 0   primary
#> 3044   aug      159        1    -1        0  unknown 0     upper
#> 3045   may      240        2    -1        0  unknown 0   primary
#> 3046   jun       95        1    -1        0  unknown 1     upper
#> 3047   jul      605        1    -1        0  unknown 0     upper
#> 3048   may      449        1    -1        0  unknown 0     upper
#> 3049   may       24        1    -1        0  unknown 0   primary
#> 3050   aug      446        1    -1        0  unknown 0     upper
#> 3051   oct       91        2    -1        0  unknown 0     upper
#> 3052   may      193        2    -1        0  unknown 0     upper
#> 3053   apr       15        2    -1        0  unknown 0     upper
#> 3054   may       14        4    -1        0  unknown 0   primary
#> 3055   may      410        1    -1        0  unknown 0     upper
#> 3056   jun      254        1    -1        0  unknown 0     upper
#> 3057   jul       88        9    -1        0  unknown 0     upper
#> 3058   nov      246        2    -1        0  unknown 0     upper
#> 3059   jun      117        2    -1        0  unknown 0     upper
#> 3060   nov      172        3    -1        0  unknown 0     upper
#> 3061   nov       80        1    -1        0  unknown 0     upper
#> 3062   aug      119        4    -1        0  unknown 0     upper
#> 3063   nov      195        3   112        8    other 0     upper
#> 3064   jun      236        1    -1        0  unknown 0     upper
#> 3065   aug      153        1     1        7  success 0     upper
#> 3066   may      206        6   337        6  failure 0   primary
#> 3067   jan      224        2    -1        0  unknown 0     upper
#> 3068   jun       36       24    -1        0  unknown 0     upper
#> 3069   may       74        1    -1        0  unknown 0     upper
#> 3070   jul      720        2    -1        0  unknown 0     upper
#> 3071   aug     1040        6    -1        0  unknown 1     upper
#> 3072   apr      691        1    -1        0  unknown 0     upper
#> 3073   aug      384        6    -1        0  unknown 1     upper
#> 3074   may      644        1    -1        0  unknown 0     upper
#> 3075   jan      207        3    -1        0  unknown 0     upper
#> 3076   may      470        2   166        2  failure 0     upper
#> 3077   may      863        3    -1        0  unknown 1   primary
#> 3078   jun      227        1    -1        0  unknown 0     upper
#> 3079   jun      123        1    -1        0  unknown 0     upper
#> 3080   jun       85        2    -1        0  unknown 0     upper
#> 3081   nov       64        1    -1        0  unknown 0     upper
#> 3082   may      150        1    -1        0  unknown 0     upper
#> 3083   may      755        1    -1        0  unknown 0     upper
#> 3084   feb      442        2    -1        0  unknown 1     upper
#> 3085   jun      119        1    -1        0  unknown 0     upper
#> 3086   may      336        1    -1        0  unknown 0     upper
#> 3087   aug      528        2    -1        0  unknown 1     upper
#> 3088   jun       14       11    -1        0  unknown 0     upper
#> 3089   jun       90        4    -1        0  unknown 0     upper
#> 3090   jul      194        1    -1        0  unknown 0     upper
#> 3091   jun       91        1    -1        0  unknown 0     upper
#> 3092   may      243        2    -1        0  unknown 0     upper
#> 3093   nov     1031        6    -1        0  unknown 0     upper
#> 3094   jul      129        2    -1        0  unknown 0     upper
#> 3095   feb      221        2   272        1  failure 0     upper
#> 3096   jul       97        1    -1        0  unknown 0     upper
#> 3097   may      181       16    -1        0  unknown 0     upper
#> 3098   apr      280        4   287        3    other 0   primary
#> 3099   jan      706        1    -1        0  unknown 0     upper
#> 3100   apr      379        3   202        1  success 1     upper
#> 3101   aug      210        5    -1        0  unknown 0     upper
#> 3102   aug      105        4    -1        0  unknown 0     upper
#> 3103   nov      854        1    -1        0  unknown 1     upper
#> 3104   jan      196        1    -1        0  unknown 0     upper
#> 3105   may       17        3    -1        0  unknown 0   primary
#> 3106   aug      290        2    -1        0  unknown 0     upper
#> 3107   may      514        5    -1        0  unknown 0     upper
#> 3108   aug       84        4    -1        0  unknown 0     upper
#> 3109   feb      255        2   555        6  success 1     upper
#> 3110   nov      151        1    -1        0  unknown 0     upper
#> 3111   nov       73        1    -1        0  unknown 0     upper
#> 3112   apr      298        4    -1        0  unknown 1     upper
#> 3113   jul      262        3    -1        0  unknown 0     upper
#> 3114   may      455        1    -1        0  unknown 0   primary
#> 3115   may      432        2    -1        0  unknown 0     upper
#> 3116   feb      233        3    -1        0  unknown 0     upper
#> 3117   aug      122        2    -1        0  unknown 0   primary
#> 3118   jul       73        4    -1        0  unknown 0     upper
#> 3119   may       11        1    -1        0  unknown 0   primary
#> 3120   may      477        1    -1        0  unknown 0     upper
#> 3121   sep      244        1    92        3  success 1     upper
#> 3122   aug       64        7    -1        0  unknown 0     upper
#> 3123   may      352        3    -1        0  unknown 0     upper
#> 3124   nov       51        2   140       11  failure 0     upper
#> 3125   jul      330        2    -1        0  unknown 0     upper
#> 3126   nov       23        1    -1        0  unknown 0     upper
#> 3127   jun      209       12    -1        0  unknown 0     upper
#> 3128   nov      138        1    -1        0  unknown 0     upper
#> 3129   may      155        1    -1        0  unknown 0     upper
#> 3130   jun      165        2    -1        0  unknown 0   unknown
#> 3131   nov      180        3    -1        0  unknown 0     upper
#> 3132   may      278        1    -1        0  unknown 0     upper
#> 3133   may      229        2    -1        0  unknown 0   unknown
#> 3134   may      206        1    -1        0  unknown 0     upper
#> 3135   may      518        1    -1        0  unknown 0     upper
#> 3136   jan      225        1    -1        0  unknown 0   primary
#> 3137   mar      152        1   348        1  failure 0   unknown
#> 3138   aug      188        1    -1        0  unknown 0   primary
#> 3139   may      323        4    -1        0  unknown 0     upper
#> 3140   jul      803        1    -1        0  unknown 0     upper
#> 3141   may       22        1    -1        0  unknown 0   unknown
#> 3142   aug      428        2   336        6  failure 0     upper
#> 3143   nov      190        1   104        1  failure 0     upper
#> 3144   aug      390        2    -1        0  unknown 0     upper
#> 3145   may      836       12    -1        0  unknown 0     upper
#> 3146   may      231        2    -1        0  unknown 0     upper
#> 3147   may      144        2    -1        0  unknown 0     upper
#> 3148   may       57        6    -1        0  unknown 0     upper
#> 3149   may      201        2    -1        0  unknown 0   unknown
#> 3150   jun      149        8    -1        0  unknown 0     upper
#> 3151   may       17        1   365        2    other 0     upper
#> 3152   apr     1594        1   148        1  failure 1     upper
#> 3153   may      218        7    -1        0  unknown 0     upper
#> 3154   jul      246        2    -1        0  unknown 0     upper
#> 3155   may      161        1    -1        0  unknown 0     upper
#> 3156   apr      609        1   303        5  failure 0     upper
#> 3157   jul       74        2    -1        0  unknown 0     upper
#> 3158   jul      392        2    -1        0  unknown 0     upper
#> 3159   feb      170        1    -1        0  unknown 0   primary
#> 3160   aug       57        2    -1        0  unknown 0   primary
#> 3161   apr       74        2    -1        0  unknown 0     upper
#> 3162   jul      250        4   415        2  failure 1     upper
#> 3163   may      700        3    -1        0  unknown 1     upper
#> 3164   may      765        1    -1        0  unknown 0     upper
#> 3165   may      159        3    -1        0  unknown 0     upper
#> 3166   aug      104        2    -1        0  unknown 0     upper
#> 3167   may      828        3    -1        0  unknown 1   primary
#> 3168   may      899        3    -1        0  unknown 0     upper
#> 3169   nov      613        1    -1        0  unknown 0     upper
#> 3170   may      164        1    -1        0  unknown 0     upper
#> 3171   jan      517        2    -1        0  unknown 0     upper
#> 3172   jun      273       27    -1        0  unknown 0   primary
#> 3173   may      304        2   259        2  failure 0     upper
#> 3174   jun       57        2   304        1  failure 0     upper
#> 3175   may      112        4   369        2    other 0   unknown
#> 3176   apr      105        2    -1        0  unknown 0   primary
#> 3177   apr      239        3    -1        0  unknown 0     upper
#> 3178   jul      275        1    -1        0  unknown 1     upper
#> 3179   nov      325        2    -1        0  unknown 0     upper
#> 3180   nov      158        7    -1        0  unknown 0   primary
#> 3181   jul      113        1    -1        0  unknown 0   primary
#> 3182   may      185        2    -1        0  unknown 0     upper
#> 3183   may      352        1    -1        0  unknown 0     upper
#> 3184   may       57        4    -1        0  unknown 0     upper
#> 3185   oct      305        1    -1        0  unknown 1     upper
#> 3186   jul       49        2    -1        0  unknown 0     upper
#> 3187   may      266        1    -1        0  unknown 0     upper
#> 3188   may       91        1    -1        0  unknown 0     upper
#> 3189   may       19       15    -1        0  unknown 0     upper
#> 3190   may       65        2   299        3    other 0     upper
#> 3191   jul      165        1    -1        0  unknown 0     upper
#> 3192   aug     1015        1    -1        0  unknown 0     upper
#> 3193   may      453        4    -1        0  unknown 0     upper
#> 3194   jul       62        1    -1        0  unknown 0     upper
#> 3195   jan       73        1    -1        0  unknown 0     upper
#> 3196   may      104        1    -1        0  unknown 0     upper
#> 3197   jun       81        4    -1        0  unknown 0     upper
#> 3198   jun     1558        1    -1        0  unknown 1   primary
#> 3199   aug       73        3   200        2  failure 0     upper
#> 3200   oct      604        1    91        4  failure 1     upper
#> 3201   aug       61        1    84        1  failure 0     upper
#> 3202   jul      107        3    -1        0  unknown 0     upper
#> 3203   may       67        4    -1        0  unknown 0     upper
#> 3204   feb      192        4    -1        0  unknown 0     upper
#> 3205   aug      163        1    -1        0  unknown 0     upper
#> 3206   nov      722        3   175        2  failure 0     upper
#> 3207   may       30        3    -1        0  unknown 0   primary
#> 3208   may      146        4    -1        0  unknown 0     upper
#> 3209   jun      172        2    -1        0  unknown 0     upper
#> 3210   apr      473        2   339        1  failure 0   primary
#> 3211   may      440        2    -1        0  unknown 0   primary
#> 3212   jul      574        2    -1        0  unknown 1     upper
#> 3213   may      305        1    -1        0  unknown 0   primary
#> 3214   nov      304        2    -1        0  unknown 0     upper
#> 3215   apr      472        2    -1        0  unknown 0     upper
#> 3216   sep      245        3    -1        0  unknown 1   primary
#> 3217   may      265        1    -1        0  unknown 0     upper
#> 3218   sep      109        3   276        8    other 0   primary
#> 3219   may      180        1    -1        0  unknown 0   unknown
#> 3220   may      117        1    -1        0  unknown 0   primary
#> 3221   jun      352        2   122        2  failure 1     upper
#> 3222   nov      713        6    -1        0  unknown 0     upper
#> 3223   nov       88        2    -1        0  unknown 0     upper
#> 3224   jun      198        1   651        7    other 0     upper
#> 3225   aug      121        1    -1        0  unknown 0     upper
#> 3226   may       52        1    -1        0  unknown 0   primary
#> 3227   may      234       13    -1        0  unknown 0     upper
#> 3228   may      165        5    -1        0  unknown 0     upper
#> 3229   may       87        1    -1        0  unknown 0     upper
#> 3230   aug      231        3    -1        0  unknown 0     upper
#> 3231   may      629        2    -1        0  unknown 0   primary
#> 3232   jun      614        2    -1        0  unknown 1     upper
#> 3233   oct      133        2    -1        0  unknown 0     upper
#> 3234   may      155        1    -1        0  unknown 0     upper
#> 3235   may      236        1    -1        0  unknown 0     upper
#> 3236   jul       97        3    -1        0  unknown 0     upper
#> 3237   aug       13       21    -1        0  unknown 0     upper
#> 3238   oct      353        1    -1        0  unknown 1     upper
#> 3239   oct       98        1    -1        0  unknown 0     upper
#> 3240   jul      139        5    -1        0  unknown 1     upper
#> 3241   may      143        2   343        3  failure 0     upper
#> 3242   jun      230        2    -1        0  unknown 0     upper
#> 3243   jul       44        4    -1        0  unknown 0   unknown
#> 3244   may      182        2    -1        0  unknown 0   primary
#> 3245   aug      431        5    -1        0  unknown 0     upper
#> 3246   may      253        1    -1        0  unknown 0     upper
#> 3247   aug      275        4    -1        0  unknown 0     upper
#> 3248   may      160        1    -1        0  unknown 0     upper
#> 3249   feb       64        2    -1        0  unknown 0     upper
#> 3250   may       70        2    -1        0  unknown 0     upper
#> 3251   jun       40        1    -1        0  unknown 0     upper
#> 3252   aug      143        4    -1        0  unknown 0     upper
#> 3253   may      312        1    -1        0  unknown 0     upper
#> 3254   nov       51        4    -1        0  unknown 0     upper
#> 3255   jul      538        1    -1        0  unknown 0   primary
#> 3256   may       73        1    -1        0  unknown 0     upper
#> 3257   nov      690        3    -1        0  unknown 0     upper
#> 3258   nov       99        3    -1        0  unknown 0     upper
#> 3259   jun      348        6    94        6  failure 0   primary
#> 3260   may      236       10    -1        0  unknown 0   primary
#> 3261   jul      127        8    -1        0  unknown 0     upper
#> 3262   may       88        5    -1        0  unknown 0     upper
#> 3263   nov      977        3    -1        0  unknown 1     upper
#> 3264   jul      238        3    -1        0  unknown 0     upper
#> 3265   may      231        2   362        1    other 0     upper
#> 3266   may       38        4    -1        0  unknown 0   primary
#> 3267   may      193        1    -1        0  unknown 0     upper
#> 3268   nov      237        1    -1        0  unknown 0     upper
#> 3269   jul      347        4    -1        0  unknown 0     upper
#> 3270   may      133        1   353        5    other 0     upper
#> 3271   jul       81        1    -1        0  unknown 0     upper
#> 3272   aug       50        2    -1        0  unknown 0     upper
#> 3273   jun      123        1    -1        0  unknown 0   primary
#> 3274   aug      632        6    -1        0  unknown 0   unknown
#> 3275   may       44        1    -1        0  unknown 0     upper
#> 3276   may      446       12    -1        0  unknown 0     upper
#> 3277   apr      114        1   345        2  failure 0     upper
#> 3278   jun      382        3    -1        0  unknown 0     upper
#> 3279   may      167        3    -1        0  unknown 0     upper
#> 3280   mar      248        1    -1        0  unknown 0     upper
#> 3281   aug      220        4    -1        0  unknown 0     upper
#> 3282   aug      184        7    -1        0  unknown 0     upper
#> 3283   apr      582        2    -1        0  unknown 0     upper
#> 3284   may       51        7    -1        0  unknown 0     upper
#> 3285   jul       69        7    -1        0  unknown 0     upper
#> 3286   may      632        5   287        6  success 0   primary
#> 3287   may      242        7    -1        0  unknown 0   primary
#> 3288   jul       67        9    -1        0  unknown 0     upper
#> 3289   may       76        2    -1        0  unknown 0     upper
#> 3290   jun      115        1    -1        0  unknown 0     upper
#> 3291   may      360        2    -1        0  unknown 0     upper
#> 3292   may      349        1   338        1  failure 0     upper
#> 3293   nov      459        3    -1        0  unknown 0     upper
#> 3294   may       61        1    -1        0  unknown 0     upper
#> 3295   nov      175        1    -1        0  unknown 0   unknown
#> 3296   nov      316        1    -1        0  unknown 0   unknown
#> 3297   feb      136        4    -1        0  unknown 1   primary
#> 3298   jul       93        1    -1        0  unknown 0   primary
#> 3299   may       19        1    -1        0  unknown 0     upper
#> 3300   feb      620        2    -1        0  unknown 0     upper
#> 3301   may      285        1   288       17    other 0     upper
#> 3302   jun       58        1    -1        0  unknown 0     upper
#> 3303   nov      215        1    -1        0  unknown 1     upper
#> 3304   may      522        1    -1        0  unknown 0   primary
#> 3305   may       12       10   178        1  failure 0     upper
#> 3306   mar       78        2    91        1  failure 0     upper
#> 3307   nov      287        2    -1        0  unknown 0     upper
#> 3308   jul      498        1    -1        0  unknown 0     upper
#> 3309   jul      308        4    -1        0  unknown 0     upper
#> 3310   jun      717        1    -1        0  unknown 0     upper
#> 3311   jan      144        1    -1        0  unknown 0     upper
#> 3312   feb      463        2    -1        0  unknown 0     upper
#> 3313   aug      343        4    -1        0  unknown 0     upper
#> 3314   nov      584        2    -1        0  unknown 0     upper
#> 3315   jun      153        2    -1        0  unknown 0     upper
#> 3316   jun      140        2    -1        0  unknown 0     upper
#> 3317   jul      217        4    -1        0  unknown 0   primary
#> 3318   may      302        1   301        1  success 1     upper
#> 3319   may      155        2    -1        0  unknown 0   primary
#> 3320   jul      981        1    -1        0  unknown 1     upper
#> 3321   nov      174        1   195        1  failure 0   primary
#> 3322   apr      144        4   374        2  success 1     upper
#> 3323   may      477        2    -1        0  unknown 0     upper
#> 3324   nov      128        1    -1        0  unknown 0   primary
#> 3325   jun      117        5    -1        0  unknown 0     upper
#> 3326   feb       13        8   238        9    other 0     upper
#> 3327   may      299        3    -1        0  unknown 0     upper
#> 3328   jul      804        1    -1        0  unknown 1   unknown
#> 3329   jun       81        2    -1        0  unknown 0     upper
#> 3330   feb       96        6    -1        0  unknown 0     upper
#> 3331   feb       58        2    -1        0  unknown 0     upper
#> 3332   jul       81        2    -1        0  unknown 0     upper
#> 3333   feb       79        2    -1        0  unknown 0   primary
#> 3334   may       54        1   345        2  failure 0     upper
#> 3335   jul      145        2    -1        0  unknown 0     upper
#> 3336   nov       50        1    -1        0  unknown 0     upper
#> 3337   jun      205        4    -1        0  unknown 0   unknown
#> 3338   nov      197        1    -1        0  unknown 0     upper
#> 3339   aug      297        1    -1        0  unknown 0     upper
#> 3340   nov      240        1    40        2    other 0     upper
#> 3341   may       67        4   175        6  failure 0     upper
#> 3342   may      202        6    -1        0  unknown 0     upper
#> 3343   may      182        1    -1        0  unknown 0     upper
#> 3344   may      178        3    -1        0  unknown 0     upper
#> 3345   apr      129        1   322        2  failure 0     upper
#> 3346   feb      231        1    -1        0  unknown 0     upper
#> 3347   jun      364        2    -1        0  unknown 0     upper
#> 3348   jun      138        3    -1        0  unknown 0     upper
#> 3349   may      262        1    -1        0  unknown 0     upper
#> 3350   may      150        1    -1        0  unknown 0     upper
#> 3351   nov       93        1   113        2    other 0     upper
#> 3352   may      186        2   295        1  failure 0     upper
#> 3353   may      311        1   368        2  failure 1     upper
#> 3354   jun      436        1    -1        0  unknown 0     upper
#> 3355   jul      235        1    -1        0  unknown 0     upper
#> 3356   nov      405        1   139        1  failure 0   primary
#> 3357   may      582        1    -1        0  unknown 0     upper
#> 3358   jun      103        2    -1        0  unknown 0   primary
#> 3359   may      216        2   259        3    other 0   primary
#> 3360   apr      162        4   295        3  failure 0     upper
#> 3361   may      806        1    -1        0  unknown 0     upper
#> 3362   jul      102        3    -1        0  unknown 0     upper
#> 3363   jun       82        3    -1        0  unknown 0     upper
#> 3364   may      641        6    -1        0  unknown 0   primary
#> 3365   may      145        1    -1        0  unknown 0     upper
#> 3366   aug       62        2    -1        0  unknown 0     upper
#> 3367   jan      117        2    -1        0  unknown 0     upper
#> 3368   apr      321        1   449        1    other 1     upper
#> 3369   jan      156        2    -1        0  unknown 0   primary
#> 3370   nov      276        1   195        1  failure 0     upper
#> 3371   aug       90       11    -1        0  unknown 0     upper
#> 3372   may      195        5    -1        0  unknown 0     upper
#> 3373   aug      139        2    -1        0  unknown 0     upper
#> 3374   feb      297        3    -1        0  unknown 0     upper
#> 3375   jul       51        4    -1        0  unknown 0     upper
#> 3376   jun       17        5    -1        0  unknown 0     upper
#> 3377   jul       81        1    -1        0  unknown 0   primary
#> 3378   nov      623        1   175        1    other 1   primary
#> 3379   apr      158        2    -1        0  unknown 0     upper
#> 3380   jun      553        2    -1        0  unknown 0     upper
#> 3381   jun       66        4    -1        0  unknown 0     upper
#> 3382   feb      261        1   195        4  failure 1     upper
#> 3383   jul      244        3    -1        0  unknown 0     upper
#> 3384   aug      199        7    -1        0  unknown 0     upper
#> 3385   mar       92        5    -1        0  unknown 0     upper
#> 3386   may      293        1    -1        0  unknown 0     upper
#> 3387   feb       45        1    -1        0  unknown 0   primary
#> 3388   may      143        3   357        1  failure 0     upper
#> 3389   jul      369        1    -1        0  unknown 0     upper
#> 3390   may      139        2    -1        0  unknown 0     upper
#> 3391   may      280        1    -1        0  unknown 0     upper
#> 3392   feb      172        5    -1        0  unknown 0     upper
#> 3393   aug      194        2    -1        0  unknown 1   primary
#> 3394   sep      414        1    91        5    other 1   unknown
#> 3395   may      137        2    -1        0  unknown 0     upper
#> 3396   may       25        1   350        5    other 0   primary
#> 3397   jul      112        5    -1        0  unknown 0     upper
#> 3398   may      245        1    -1        0  unknown 0     upper
#> 3399   jul      188        2    -1        0  unknown 0     upper
#> 3400   apr      117        1    -1        0  unknown 0   unknown
#> 3401   jun      443        2    -1        0  unknown 0     upper
#> 3402   aug      159        4    -1        0  unknown 0     upper
#> 3403   may      267        2    -1        0  unknown 0     upper
#> 3404   jul      638        2    -1        0  unknown 1     upper
#> 3405   jul      112       10    -1        0  unknown 0     upper
#> 3406   feb      202        4    -1        0  unknown 1   primary
#> 3407   apr       70        1    84        1  failure 0     upper
#> 3408   may      196        2    -1        0  unknown 0   primary
#> 3409   may      541        2    -1        0  unknown 0     upper
#> 3410   jun       96        1    -1        0  unknown 0     upper
#> 3411   jun       94        7    -1        0  unknown 0     upper
#> 3412   may      623        1    -1        0  unknown 0     upper
#> 3413   aug       66        3    -1        0  unknown 0     upper
#> 3414   jul     1134        5    -1        0  unknown 1     upper
#> 3415   may       91        2    -1        0  unknown 0     upper
#> 3416   may       82        5   355        4  failure 0     upper
#> 3417   aug       29        3    -1        0  unknown 0   unknown
#> 3418   aug      122        2    -1        0  unknown 0     upper
#> 3419   feb      387        1   251        1  failure 0   primary
#> 3420   aug      328        2    -1        0  unknown 0     upper
#> 3421   may      115        1    -1        0  unknown 0   unknown
#> 3422   jun      154        2    -1        0  unknown 0     upper
#> 3423   jul      225        2    -1        0  unknown 0     upper
#> 3424   jun       83       10    -1        0  unknown 0     upper
#> 3425   may      130        2    -1        0  unknown 0     upper
#> 3426   jul      122        1    -1        0  unknown 0     upper
#> 3427   may      295        1    -1        0  unknown 0   primary
#> 3428   jul      482        3    -1        0  unknown 0     upper
#> 3429   may      305        1    -1        0  unknown 0   primary
#> 3430   may       92        3    -1        0  unknown 0     upper
#> 3431   jul       95        5    -1        0  unknown 0     upper
#> 3432   jul       89        5    -1        0  unknown 0     upper
#> 3433   nov       95        1    -1        0  unknown 0     upper
#> 3434   aug      784        3    94       10  failure 1     upper
#> 3435   aug      183        2    -1        0  unknown 0     upper
#> 3436   jan      127        1    -1        0  unknown 0     upper
#> 3437   aug      113        1    -1        0  unknown 0     upper
#> 3438   may       61        1    -1        0  unknown 0     upper
#> 3439   jun        7        3    -1        0  unknown 0     upper
#> 3440   may      150        1    -1        0  unknown 0     upper
#> 3441   feb      383        1    -1        0  unknown 0     upper
#> 3442   may      215        3   280        3  failure 0     upper
#> 3443   may      104        3    -1        0  unknown 0     upper
#> 3444   jun       29        1   686        2  failure 0     upper
#> 3445   jun      227        1    -1        0  unknown 0     upper
#> 3446   jan       41        1    -1        0  unknown 0   unknown
#> 3447   jul      208        2    -1        0  unknown 0   primary
#> 3448   may      280        1    -1        0  unknown 0     upper
#> 3449   aug      105        6    -1        0  unknown 0     upper
#> 3450   may      225        1    -1        0  unknown 0     upper
#> 3451   apr      504        1    -1        0  unknown 0     upper
#> 3452   jun       51        1    -1        0  unknown 0   primary
#> 3453   may      253        3    -1        0  unknown 0     upper
#> 3454   may       76        2    87        1  success 0     upper
#> 3455   may      417        2    -1        0  unknown 1     upper
#> 3456   jul       72        1    -1        0  unknown 0     upper
#> 3457   aug      255        2   104        1  success 1     upper
#> 3458   feb      542        2    -1        0  unknown 0     upper
#> 3459   may      179        3    -1        0  unknown 0     upper
#> 3460   may      653        1    -1        0  unknown 1     upper
#> 3461   may      201        2    -1        0  unknown 0   primary
#> 3462   jul       33        2    -1        0  unknown 0   primary
#> 3463   feb       48        4    -1        0  unknown 0     upper
#> 3464   may      109        2    -1        0  unknown 0     upper
#> 3465   jul       18        9    -1        0  unknown 0     upper
#> 3466   nov      159        2    -1        0  unknown 0     upper
#> 3467   feb        9        8    -1        0  unknown 0     upper
#> 3468   aug      119        2    -1        0  unknown 0     upper
#> 3469   may      508        3   173        5  failure 0     upper
#> 3470   may      207        5    -1        0  unknown 0     upper
#> 3471   may      302        1    -1        0  unknown 0   primary
#> 3472   jun       20        7    -1        0  unknown 0     upper
#> 3473   apr       97        1    -1        0  unknown 0     upper
#> 3474   jul      259        3    -1        0  unknown 0     upper
#> 3475   nov        6        6    -1        0  unknown 0     upper
#> 3476   aug      200        2    -1        0  unknown 0     upper
#> 3477   jul       90        2    -1        0  unknown 0     upper
#> 3478   may      130        1    -1        0  unknown 0   primary
#> 3479   jun      124        2    -1        0  unknown 0   primary
#> 3480   jan      314        1    -1        0  unknown 0   primary
#> 3481   may      364        1    -1        0  unknown 0     upper
#> 3482   may      158        2   350        2  failure 0     upper
#> 3483   aug      467        2    -1        0  unknown 0   unknown
#> 3484   jul       69        9    -1        0  unknown 0     upper
#> 3485   apr      137        1    -1        0  unknown 0   primary
#> 3486   may       24        1   346        1  failure 0     upper
#> 3487   may      231        1    -1        0  unknown 0   unknown
#> 3488   aug      663        3    -1        0  unknown 1   primary
#> 3489   apr      377        3   325        1  failure 0   primary
#> 3490   may      891        4    -1        0  unknown 1     upper
#> 3491   aug      603        3    -1        0  unknown 0     upper
#> 3492   jul      799        2    -1        0  unknown 1     upper
#> 3493   nov      286        3    -1        0  unknown 0     upper
#> 3494   apr      397        1    -1        0  unknown 0     upper
#> 3495   jun      284        1    -1        0  unknown 0     upper
#> 3496   aug      195        1    -1        0  unknown 0   primary
#> 3497   may      306        1    -1        0  unknown 0     upper
#> 3498   aug      194        6    -1        0  unknown 0     upper
#> 3499   may      228        2   267        1  failure 1     upper
#> 3500   oct      511        3   187        1  failure 1     upper
#> 3501   may      183        5    -1        0  unknown 0     upper
#> 3502   apr      636        3   330        1  failure 1     upper
#> 3503   may      124        2   298        1  failure 0     upper
#> 3504   nov      107        1   117        3  failure 0     upper
#> 3505   jul      334        3    -1        0  unknown 0     upper
#> 3506   jun       32        4    -1        0  unknown 0   unknown
#> 3507   aug      105        2    -1        0  unknown 0     upper
#> 3508   sep      105        2    -1        0  unknown 0     upper
#> 3509   dec      136        1    -1        0  unknown 0     upper
#> 3510   may      101        1   349        1  failure 0     upper
#> 3511   may      160        2    -1        0  unknown 0     upper
#> 3512   may       81        1    -1        0  unknown 0     upper
#> 3513   jul      320        2    -1        0  unknown 0     upper
#> 3514   aug      133        4    -1        0  unknown 0     upper
#> 3515   may      445        1    -1        0  unknown 0   primary
#> 3516   apr      115        2    -1        0  unknown 0     upper
#> 3517   jun       45        9    -1        0  unknown 0   primary
#> 3518   aug      359        2    -1        0  unknown 0     upper
#> 3519   jun      329        3    -1        0  unknown 0   primary
#> 3520   may      280        2   335        3  failure 0   primary
#> 3521   may       65        3    -1        0  unknown 0     upper
#> 3522   nov      102        1    -1        0  unknown 0     upper
#> 3523   jul      299        5    -1        0  unknown 0     upper
#> 3524   aug       15       19    -1        0  unknown 0     upper
#> 3525   aug       54        4    -1        0  unknown 0     upper
#> 3526   jun      218        1    -1        0  unknown 0     upper
#> 3527   may       10        5    -1        0  unknown 0     upper
#> 3528   jul       42        1    -1        0  unknown 0     upper
#> 3529   jul      226        2    -1        0  unknown 0     upper
#> 3530   apr       93        3   329        7  failure 0     upper
#> 3531   may      198        1    -1        0  unknown 0     upper
#> 3532   aug      479        1    -1        0  unknown 1     upper
#> 3533   apr      176        1    -1        0  unknown 1     upper
#> 3534   jun       30        1   404        2  success 0     upper
#> 3535   jun      211        2    -1        0  unknown 0     upper
#> 3536   may      487        4    -1        0  unknown 0   primary
#> 3537   nov      182        2    -1        0  unknown 0   primary
#> 3538   jun       47        3    -1        0  unknown 0     upper
#> 3539   oct      152        4    -1        0  unknown 0   unknown
#> 3540   jul      643        2    -1        0  unknown 0     upper
#> 3541   aug      104        2    -1        0  unknown 0     upper
#> 3542   may      182        2    -1        0  unknown 0     upper
#> 3543   may      301        4    -1        0  unknown 0   primary
#> 3544   jun       44        1    -1        0  unknown 0     upper
#> 3545   jan      452        3    -1        0  unknown 1     upper
#> 3546   mar      263        1   124        9    other 1     upper
#> 3547   aug      158        1   104        2  failure 0     upper
#> 3548   apr      445        1   148        2    other 0     upper
#> 3549   jun      145        1    -1        0  unknown 0     upper
#> 3550   jul      479        1    -1        0  unknown 0     upper
#> 3551   nov      902        1   133        2    other 1     upper
#> 3552   may      271        5    -1        0  unknown 0     upper
#> 3553   may      351        3    -1        0  unknown 1   unknown
#> 3554   may      437        2    -1        0  unknown 0     upper
#> 3555   feb      159        1    -1        0  unknown 1     upper
#> 3556   jul      324        1    -1        0  unknown 0   primary
#> 3557   aug       51        8    -1        0  unknown 0   primary
#> 3558   may      176        3    -1        0  unknown 0     upper
#> 3559   feb      149        3   215        1  failure 0     upper
#> 3560   may       85        1    -1        0  unknown 0     upper
#> 3561   aug      242        6    95        4  success 1     upper
#> 3562   jun      249        1    -1        0  unknown 0     upper
#> 3563   jun       92        1    -1        0  unknown 0   primary
#> 3564   nov      133        1    -1        0  unknown 0     upper
#> 3565   aug      203        7    -1        0  unknown 0     upper
#> 3566   may       23       15    -1        0  unknown 0     upper
#> 3567   jun      119        2    -1        0  unknown 0     upper
#> 3568   may       90        3    -1        0  unknown 0     upper
#> 3569   feb      678        1    -1        0  unknown 0     upper
#> 3570   may      126        5    -1        0  unknown 0     upper
#> 3571   aug      107        2    -1        0  unknown 0     upper
#> 3572   may      200        2    -1        0  unknown 0   primary
#> 3573   aug       36        2    -1        0  unknown 0     upper
#> 3574   may      110        1    -1        0  unknown 0     upper
#> 3575   jul      122       12    -1        0  unknown 0     upper
#> 3576   may      695        4    -1        0  unknown 0     upper
#> 3577   may      107        4   371        3  failure 0     upper
#> 3578   may      245        2    -1        0  unknown 0     upper
#> 3579   feb      416        2    -1        0  unknown 1     upper
#> 3580   nov      251        2    -1        0  unknown 0     upper
#> 3581   jul      604        1    -1        0  unknown 0     upper
#> 3582   jan       85        2   240        1  failure 0     upper
#> 3583   jul     1545        1    -1        0  unknown 1     upper
#> 3584   feb      113        2    -1        0  unknown 0   primary
#> 3585   jun      642        2    -1        0  unknown 1   primary
#> 3586   may      154        2   340        2  failure 0     upper
#> 3587   may      352        2   175       11    other 0     upper
#> 3588   may      798        1    -1        0  unknown 0     upper
#> 3589   aug      238        6    -1        0  unknown 0     upper
#> 3590   jul      100       16    -1        0  unknown 0     upper
#> 3591   jul       88        3    -1        0  unknown 0     upper
#> 3592   feb      181        3    -1        0  unknown 1     upper
#> 3593   sep      179        1   186        2  failure 0     upper
#> 3594   nov      230        1    -1        0  unknown 0     upper
#> 3595   may       67        2    -1        0  unknown 0     upper
#> 3596   may      210        1    -1        0  unknown 0     upper
#> 3597   jul      403        7    -1        0  unknown 0     upper
#> 3598   nov      155        1    -1        0  unknown 0     upper
#> 3599   jun       61        2    -1        0  unknown 0     upper
#> 3600   aug      168        2    -1        0  unknown 0     upper
#> 3601   apr      759        2    -1        0  unknown 0     upper
#> 3602   jun       73        1    -1        0  unknown 0     upper
#> 3603   jun      686       11    -1        0  unknown 1     upper
#> 3604   oct      219        3   372        1  failure 0     upper
#> 3605   jul      148        1    -1        0  unknown 0     upper
#> 3606   apr      228        2    -1        0  unknown 0     upper
#> 3607   aug      199        6    -1        0  unknown 0     upper
#> 3608   jun      862       11    -1        0  unknown 1     upper
#> 3609   may      500        1    -1        0  unknown 1   primary
#> 3610   nov      141        3    -1        0  unknown 0     upper
#> 3611   may      127        2   254       23    other 0     upper
#> 3612   nov      163        1   200        1  failure 0   primary
#> 3613   may      210        1    -1        0  unknown 0     upper
#> 3614   may      192        1    -1        0  unknown 0     upper
#> 3615   apr      325        1   180        7  failure 1   primary
#> 3616   jul      242        1    -1        0  unknown 0     upper
#> 3617   may      114        1    -1        0  unknown 0     upper
#> 3618   nov      187        2    -1        0  unknown 0     upper
#> 3619   may      257        1    -1        0  unknown 0     upper
#> 3620   may      128        8   324        7    other 0     upper
#> 3621   nov      301        1    -1        0  unknown 0     upper
#> 3622   jul      417        1    -1        0  unknown 0     upper
#> 3623   may      850        2    -1        0  unknown 1     upper
#> 3624   sep      500        2   228        1  failure 0     upper
#> 3625   aug     1486        1    -1        0  unknown 1     upper
#> 3626   jun      266        4    -1        0  unknown 0     upper
#> 3627   jul       36        5    -1        0  unknown 0     upper
#> 3628   feb       93        1    -1        0  unknown 0     upper
#> 3629   apr      155        1   154        2  failure 0     upper
#> 3630   nov      251        2    -1        0  unknown 0     upper
#> 3631   may      217        1    -1        0  unknown 0     upper
#> 3632   aug      108        5    -1        0  unknown 0     upper
#> 3633   jun       44        2    -1        0  unknown 0     upper
#> 3634   aug      162        2    -1        0  unknown 0     upper
#> 3635   may      106        3    -1        0  unknown 0   primary
#> 3636   apr      439        2    -1        0  unknown 1     upper
#> 3637   may      272        1   342        2    other 0     upper
#> 3638   may      131        2    -1        0  unknown 0     upper
#> 3639   feb      214        2   259        2  failure 0     upper
#> 3640   jun      154        1   124        1    other 0     upper
#> 3641   mar       83        1    -1        0  unknown 1     upper
#> 3642   jul       81        6    -1        0  unknown 0     upper
#> 3643   oct        6        1    -1        0  unknown 0     upper
#> 3644   jun       24        1    -1        0  unknown 0   primary
#> 3645   may       37        1    -1        0  unknown 0     upper
#> 3646   apr      125        2   182        1  failure 0     upper
#> 3647   jun       95        1    -1        0  unknown 0     upper
#> 3648   may      250        2    -1        0  unknown 0     upper
#> 3649   jul      136        2    -1        0  unknown 0   primary
#> 3650   nov      122        2    -1        0  unknown 0     upper
#> 3651   jun       48        2    -1        0  unknown 0     upper
#> 3652   mar      278        2    -1        0  unknown 1     upper
#> 3653   nov      769        4    -1        0  unknown 0     upper
#> 3654   jul      260        1    -1        0  unknown 0     upper
#> 3655   apr      314        1    -1        0  unknown 0   primary
#> 3656   jun      184        2    -1        0  unknown 0     upper
#> 3657   may      149        4    -1        0  unknown 0   primary
#> 3658   jul      170        1    -1        0  unknown 0     upper
#> 3659   jan       41        2   261        1  failure 0     upper
#> 3660   apr      190        2    -1        0  unknown 0   primary
#> 3661   may      143        1    -1        0  unknown 0   primary
#> 3662   may       24        1    -1        0  unknown 0     upper
#> 3663   sep      431        1   466        3  success 1     upper
#> 3664   aug       75        2    -1        0  unknown 0     upper
#> 3665   jul      285        1    -1        0  unknown 0     upper
#> 3666   aug      217        5    -1        0  unknown 0   primary
#> 3667   jun      238        3    -1        0  unknown 0     upper
#> 3668   oct       56        4    -1        0  unknown 0     upper
#> 3669   may      843        2    -1        0  unknown 1   unknown
#> 3670   mar      170        3    -1        0  unknown 1   primary
#> 3671   may      201        2   293        6    other 0     upper
#> 3672   jan      868        1    -1        0  unknown 0   primary
#> 3673   aug     1152        6    -1        0  unknown 1   primary
#> 3674   jun      160        4    -1        0  unknown 0     upper
#> 3675   aug       57        6    -1        0  unknown 0     upper
#> 3676   feb      100        1    -1        0  unknown 0     upper
#> 3677   may       71        2    -1        0  unknown 0     upper
#> 3678   aug      961        4    -1        0  unknown 0   primary
#> 3679   sep      339        1    38        1  failure 0   primary
#> 3680   may      416        4    -1        0  unknown 0     upper
#> 3681   apr      349        1    -1        0  unknown 0     upper
#> 3682   nov      185        1    -1        0  unknown 0     upper
#> 3683   aug        9        1    -1        0  unknown 0     upper
#> 3684   aug      173        3    -1        0  unknown 0     upper
#> 3685   may      158        1    -1        0  unknown 0     upper
#> 3686   jul      185        2    -1        0  unknown 0   primary
#> 3687   may       14        2   344        3    other 0   primary
#> 3688   jul       45        3    -1        0  unknown 0     upper
#> 3689   aug      201        2    -1        0  unknown 0     upper
#> 3690   jun      193        5    -1        0  unknown 0   primary
#> 3691   nov      409        2    -1        0  unknown 1     upper
#> 3692   apr      144        1    -1        0  unknown 0     upper
#> 3693   nov      279        1    -1        0  unknown 0     upper
#> 3694   may      180        1    -1        0  unknown 0     upper
#> 3695   may       18        1    -1        0  unknown 0     upper
#> 3696   dec      221        3    -1        0  unknown 1     upper
#> 3697   aug      212       15    -1        0  unknown 0     upper
#> 3698   aug      112        2    -1        0  unknown 0     upper
#> 3699   may      175        1   293        5  failure 0     upper
#> 3700   may      148        3    -1        0  unknown 0     upper
#> 3701   jul      335        3   194        2  failure 1     upper
#> 3702   jul       36        6    -1        0  unknown 0     upper
#> 3703   jul      350       15    -1        0  unknown 0     upper
#> 3704   may      182        1    90        8  failure 0     upper
#> 3705   may       90        1    -1        0  unknown 0     upper
#> 3706   may      498        4    -1        0  unknown 0   primary
#> 3707   may      423        1    -1        0  unknown 0     upper
#> 3708   aug      111        2    -1        0  unknown 0     upper
#> 3709   nov       21        1    -1        0  unknown 0   primary
#> 3710   jun      288        3    -1        0  unknown 0     upper
#> 3711   aug      148        2    -1        0  unknown 1     upper
#> 3712   jul      728        2    -1        0  unknown 1     upper
#> 3713   aug       97        6    -1        0  unknown 0     upper
#> 3714   may      241        2   349        2  failure 0     upper
#> 3715   may      138        1    -1        0  unknown 0     upper
#> 3716   may      124        2    -1        0  unknown 0     upper
#> 3717   aug      128       12    -1        0  unknown 0     upper
#> 3718   may      286        3    -1        0  unknown 0     upper
#> 3719   may      115        3    -1        0  unknown 0     upper
#> 3720   jan      458        2    -1        0  unknown 0     upper
#> 3721   jul       75        8    -1        0  unknown 0     upper
#> 3722   jul      389        5    -1        0  unknown 0     upper
#> 3723   nov      238        1    -1        0  unknown 1     upper
#> 3724   jun       45        4    -1        0  unknown 0     upper
#> 3725   nov      153        1    -1        0  unknown 0     upper
#> 3726   nov      303        4    -1        0  unknown 0   primary
#> 3727   apr      124        1    28        3  failure 0     upper
#> 3728   may      291        4    -1        0  unknown 0   primary
#> 3729   jul      122        1    -1        0  unknown 0     upper
#> 3730   nov       72        1    -1        0  unknown 0     upper
#> 3731   may      247        2    -1        0  unknown 0     upper
#> 3732   may      129        1    -1        0  unknown 0     upper
#> 3733   aug     1364        4    -1        0  unknown 0   primary
#> 3734   dec      390        1    -1        0  unknown 0     upper
#> 3735   may      423        2    -1        0  unknown 0   primary
#> 3736   feb       38        8    -1        0  unknown 0     upper
#> 3737   nov      114        1   183        3    other 0   primary
#> 3738   nov      158        2    -1        0  unknown 0     upper
#> 3739   may      315        1    -1        0  unknown 0     upper
#> 3740   jun      171        1    -1        0  unknown 0     upper
#> 3741   nov       28        3   158        3  failure 0     upper
#> 3742   apr      594        4   331        1  failure 0   primary
#> 3743   may      430        1    -1        0  unknown 0     upper
#> 3744   jun       10        4    -1        0  unknown 0     upper
#> 3745   aug       63        2    -1        0  unknown 0     upper
#> 3746   may      219        1    -1        0  unknown 0   primary
#> 3747   nov      150        1    -1        0  unknown 0   primary
#> 3748   may       78        5   292        3  failure 0     upper
#> 3749   feb      170        2    -1        0  unknown 0     upper
#> 3750   may       92        1    -1        0  unknown 0     upper
#> 3751   jul       84        1    -1        0  unknown 0     upper
#> 3752   jan      276        2    -1        0  unknown 0     upper
#> 3753   may      119        3    -1        0  unknown 0     upper
#> 3754   sep     2055        1    -1        0  unknown 0     upper
#> 3755   may      185        1    -1        0  unknown 0     upper
#> 3756   jul      227        4    -1        0  unknown 0     upper
#> 3757   jun       94        1    -1        0  unknown 0     upper
#> 3758   may      235        2    -1        0  unknown 0     upper
#> 3759   feb      244        3    -1        0  unknown 0   primary
#> 3760   jun      169        2    -1        0  unknown 0     upper
#> 3761   jan      270        1    -1        0  unknown 0     upper
#> 3762   sep      224        2   444        1  failure 1     upper
#> 3763   jul      293        2    -1        0  unknown 0     upper
#> 3764   may      174        1    -1        0  unknown 0     upper
#> 3765   may      550        2    -1        0  unknown 0     upper
#> 3766   jun      331        4    -1        0  unknown 0     upper
#> 3767   may      488        1    -1        0  unknown 0     upper
#> 3768   nov      366        3    -1        0  unknown 1     upper
#> 3769   may       53        1    -1        0  unknown 0     upper
#> 3770   jun       29        4    -1        0  unknown 0   primary
#> 3771   mar      191        2    -1        0  unknown 1     upper
#> 3772   apr      135        1    -1        0  unknown 1     upper
#> 3773   may      101        2    -1        0  unknown 0     upper
#> 3774   jul      186        4    -1        0  unknown 0     upper
#> 3775   jul      335        2    -1        0  unknown 0     upper
#> 3776   jun      108        1    -1        0  unknown 0     upper
#> 3777   may       96        2    -1        0  unknown 0     upper
#> 3778   aug      218        2    -1        0  unknown 0     upper
#> 3779   apr      164        2    -1        0  unknown 0   primary
#> 3780   may      128        4    -1        0  unknown 0     upper
#> 3781   apr      359        3    -1        0  unknown 0     upper
#> 3782   aug       67        4    -1        0  unknown 0     upper
#> 3783   may      195        2   301        3  failure 0     upper
#> 3784   nov      418        3    -1        0  unknown 0     upper
#> 3785   aug      183       20    -1        0  unknown 0     upper
#> 3786   jun       53        1    -1        0  unknown 0     upper
#> 3787   aug      499        2    -1        0  unknown 0     upper
#> 3788   feb       58        1   269        2  failure 0     upper
#> 3789   aug      127        5    -1        0  unknown 0     upper
#> 3790   jun      218        1    -1        0  unknown 0     upper
#> 3791   may      455        2    -1        0  unknown 0     upper
#> 3792   jun      160        2    -1        0  unknown 0     upper
#> 3793   may      247        2    -1        0  unknown 0   unknown
#> 3794   may      231        4    -1        0  unknown 0     upper
#> 3795   jun      393       11    -1        0  unknown 0     upper
#> 3796   may      371        2    -1        0  unknown 0     upper
#> 3797   nov      255        1    -1        0  unknown 1     upper
#> 3798   jun      384        1    -1        0  unknown 0     upper
#> 3799   nov      508        4    -1        0  unknown 0     upper
#> 3800   may      252        4    -1        0  unknown 0     upper
#> 3801   feb      128        1    -1        0  unknown 0     upper
#> 3802   nov      273        2    96        4  failure 0   primary
#> 3803   may       28        2   306        1  failure 0     upper
#> 3804   jul      815        2   407        3  success 1     upper
#> 3805   may      166        9    -1        0  unknown 0     upper
#> 3806   jul      117        2    -1        0  unknown 0     upper
#> 3807   may       20        8   350        9  failure 0     upper
#> 3808   jun      135        1    -1        0  unknown 0     upper
#> 3809   may      460        1    95        2  success 1   unknown
#> 3810   may      125        2   304        2  failure 0     upper
#> 3811   jun      140        3    -1        0  unknown 0     upper
#> 3812   nov      182        2    91        2  success 1     upper
#> 3813   jun       49        1    -1        0  unknown 0     upper
#> 3814   aug      196        1    -1        0  unknown 0     upper
#> 3815   jul       72        3    -1        0  unknown 0     upper
#> 3816   aug       77        4    -1        0  unknown 0     upper
#> 3817   jul      249        3    -1        0  unknown 0     upper
#> 3818   oct      526        1    -1        0  unknown 1     upper
#> 3819   apr      106        1    -1        0  unknown 0     upper
#> 3820   oct      174        2    -1        0  unknown 0     upper
#> 3821   jun      174        8    -1        0  unknown 0     upper
#> 3822   nov      372        1    -1        0  unknown 1     upper
#> 3823   feb      360        1    -1        0  unknown 0     upper
#> 3824   may      496        2   345        3  failure 1     upper
#> 3825   may      184        1    -1        0  unknown 0     upper
#> 3826   may      317        1    -1        0  unknown 0     upper
#> 3827   may      209        3    -1        0  unknown 0     upper
#> 3828   may      544        1    -1        0  unknown 0     upper
#> 3829   jul       67        5   252        1  failure 0     upper
#> 3830   oct      427        1    -1        0  unknown 1     upper
#> 3831   nov       94        1   170        1    other 0     upper
#> 3832   aug      186        1    -1        0  unknown 1     upper
#> 3833   aug       62        2   104        2  success 0     upper
#> 3834   jun      237        3    -1        0  unknown 0     upper
#> 3835   may      252        1    85        6  failure 0     upper
#> 3836   jun      188        1    -1        0  unknown 0     upper
#> 3837   jul      354        1    -1        0  unknown 0     upper
#> 3838   jun       67        4    -1        0  unknown 0   primary
#> 3839   jun       54        1    -1        0  unknown 0     upper
#> 3840   nov      295        1   124        2  failure 0     upper
#> 3841   may      408        2    -1        0  unknown 0   unknown
#> 3842   jun       53       11    -1        0  unknown 0     upper
#> 3843   jun      219        2    -1        0  unknown 0   primary
#> 3844   jul      185        1    -1        0  unknown 0     upper
#> 3845   may       94        1    -1        0  unknown 0   primary
#> 3846   jul       90        5    -1        0  unknown 0     upper
#> 3847   nov      107        3    -1        0  unknown 0     upper
#> 3848   may     1185        3    -1        0  unknown 0     upper
#> 3849   may      447        1    -1        0  unknown 0     upper
#> 3850   may      542        2    -1        0  unknown 0     upper
#> 3851   jun      235        3    -1        0  unknown 1     upper
#> 3852   apr      335        1   334        3  failure 0     upper
#> 3853   may      184        1    -1        0  unknown 0     upper
#> 3854   jan      146        2   262        2  failure 0     upper
#> 3855   jun       78        1    -1        0  unknown 0     upper
#> 3856   oct       10        1    -1        0  unknown 0     upper
#> 3857   jun       93        1    -1        0  unknown 0   primary
#> 3858   feb      204        1    -1        0  unknown 1   unknown
#> 3859   jul      246        1    -1        0  unknown 0     upper
#> 3860   may      451        1   350        1    other 0     upper
#> 3861   aug      113        8    -1        0  unknown 0     upper
#> 3862   jun       94        2    -1        0  unknown 1     upper
#> 3863   jun      485        2   227        4  failure 1     upper
#> 3864   jun      940        1    -1        0  unknown 1   primary
#> 3865   jul       31        3    -1        0  unknown 0     upper
#> 3866   feb      147        1    -1        0  unknown 1     upper
#> 3867   may      132        2    -1        0  unknown 0     upper
#> 3868   aug       14       15    -1        0  unknown 0     upper
#> 3869   feb       83        1    -1        0  unknown 0     upper
#> 3870   nov      121        1    -1        0  unknown 0     upper
#> 3871   nov      240        3    -1        0  unknown 0     upper
#> 3872   jan      821        1    -1        0  unknown 0     upper
#> 3873   jul      235        1   287        1  failure 0   primary
#> 3874   may      161        4    -1        0  unknown 0   primary
#> 3875   may      209        2    -1        0  unknown 0   primary
#> 3876   may      923        3    -1        0  unknown 1     upper
#> 3877   jun      202        2    -1        0  unknown 0   primary
#> 3878   jan      158        2   153       12  failure 0     upper
#> 3879   jan       87        2    -1        0  unknown 0     upper
#> 3880   aug       81        3    -1        0  unknown 0     upper
#> 3881   aug      150        2    -1        0  unknown 0     upper
#> 3882   apr      216        3   370        1  failure 1   unknown
#> 3883   jul      553        1    -1        0  unknown 1     upper
#> 3884   feb       32        4   225        3  failure 0     upper
#> 3885   apr       80        1    -1        0  unknown 0     upper
#> 3886   jul      464        1    -1        0  unknown 0     upper
#> 3887   sep        9        1    -1        0  unknown 0     upper
#> 3888   feb      102        1   264        1  failure 0     upper
#> 3889   nov       57        1    -1        0  unknown 0     upper
#> 3890   jul       49        1    -1        0  unknown 0   unknown
#> 3891   jul      184        2    -1        0  unknown 0     upper
#> 3892   aug       85        1    -1        0  unknown 0     upper
#> 3893   aug      130        2    -1        0  unknown 0     upper
#> 3894   may       97        1   370        1  failure 0     upper
#> 3895   may      551        1   371        2  failure 1   primary
#> 3896   may      114        1   287        8  failure 0     upper
#> 3897   jun      240        9    -1        0  unknown 0   unknown
#> 3898   may        7       11   360        2    other 0     upper
#> 3899   may      335        1    -1        0  unknown 0     upper
#> 3900   aug      124        2    -1        0  unknown 0     upper
#> 3901   jul       71        6    -1        0  unknown 0     upper
#> 3902   may       54        5    -1        0  unknown 0   primary
#> 3903   aug      239        2    -1        0  unknown 0     upper
#> 3904   jun      211        2    -1        0  unknown 0     upper
#> 3905   may      290        1    -1        0  unknown 0   unknown
#> 3906   sep      173        1    -1        0  unknown 0     upper
#> 3907   jun      156        4    -1        0  unknown 0     upper
#> 3908   nov       83        1    -1        0  unknown 0     upper
#> 3909   jun      422        6    -1        0  unknown 1   primary
#> 3910   jul       81        2    -1        0  unknown 0     upper
#> 3911   may      145        1   337        4  failure 0     upper
#> 3912   aug      183        8    -1        0  unknown 0     upper
#> 3913   may      177        1    -1        0  unknown 0   primary
#> 3914   mar      194        2   181        3  failure 0     upper
#> 3915   feb      118        1    -1        0  unknown 0     upper
#> 3916   feb      188        1   247        4    other 0     upper
#> 3917   may      213        1    -1        0  unknown 0     upper
#> 3918   jun      396        1    -1        0  unknown 0     upper
#> 3919   jun      817        2    -1        0  unknown 1     upper
#> 3920   jan      244        3    -1        0  unknown 0     upper
#> 3921   aug       33        2    -1        0  unknown 0     upper
#> 3922   may      183        1    -1        0  unknown 0     upper
#> 3923   aug      273        2    -1        0  unknown 0     upper
#> 3924   nov      459        3    -1        0  unknown 1     upper
#> 3925   may     1044        5    -1        0  unknown 1     upper
#> 3926   apr      334        1    -1        0  unknown 0     upper
#> 3927   may      173        1   274        3  failure 0     upper
#> 3928   jul       54       16    -1        0  unknown 0     upper
#> 3929   jun      196        1    -1        0  unknown 0     upper
#> 3930   aug      127        4    -1        0  unknown 0     upper
#> 3931   jun       64        1    -1        0  unknown 0     upper
#> 3932   may      373        3    -1        0  unknown 0   primary
#> 3933   may       60        1    -1        0  unknown 0   primary
#> 3934   aug      671        2    -1        0  unknown 1     upper
#> 3935   may      216        1    -1        0  unknown 0   primary
#> 3936   aug      114        7    -1        0  unknown 0     upper
#> 3937   may      246        1    -1        0  unknown 0   primary
#> 3938   aug       47       20    -1        0  unknown 0   primary
#> 3939   feb      223        7    -1        0  unknown 0     upper
#> 3940   jun       74        2    -1        0  unknown 0     upper
#> 3941   jun      922        2    -1        0  unknown 1   primary
#> 3942   may      746        1    -1        0  unknown 0     upper
#> 3943   may      337        4    -1        0  unknown 0     upper
#> 3944   may       88        2    -1        0  unknown 0     upper
#> 3945   aug      169        1    -1        0  unknown 0     upper
#> 3946   may      106        3    -1        0  unknown 0     upper
#> 3947   jul      173        1    -1        0  unknown 0     upper
#> 3948   feb       67        2   207        2  failure 0     upper
#> 3949   jul       19        2    -1        0  unknown 0   primary
#> 3950   may      116        2    -1        0  unknown 0   primary
#> 3951   aug      293        1   104        1  success 1   unknown
#> 3952   may       20        6   291        2    other 0     upper
#> 3953   may     1237        2   361        2  failure 0     upper
#> 3954   jul      396        2    -1        0  unknown 0     upper
#> 3955   oct       92        1   336        1  failure 0     upper
#> 3956   may      153        1    -1        0  unknown 0   primary
#> 3957   may      146        4    -1        0  unknown 0     upper
#> 3958   sep      113        5    97        3    other 0   primary
#> 3959   oct      541        1   204        3  failure 0     upper
#> 3960   may      174        2    -1        0  unknown 0     upper
#> 3961   nov       90        2    -1        0  unknown 0     upper
#> 3962   jul       91        2    -1        0  unknown 0   unknown
#> 3963   apr       71        2   317        1  failure 0     upper
#> 3964   nov      525        3    -1        0  unknown 1     upper
#> 3965   may      162        5    -1        0  unknown 0     upper
#> 3966   feb      324        1    -1        0  unknown 0     upper
#> 3967   nov      239        1    -1        0  unknown 0     upper
#> 3968   oct      275        1    -1        0  unknown 0     upper
#> 3969   apr      125        4    -1        0  unknown 0     upper
#> 3970   aug       73        2    -1        0  unknown 0     upper
#> 3971   may       77        2    -1        0  unknown 0   unknown
#> 3972   may      273        4    -1        0  unknown 0     upper
#> 3973   may      103        8    -1        0  unknown 0     upper
#> 3974   jul      638        3    -1        0  unknown 1     upper
#> 3975   may      142        3    -1        0  unknown 0     upper
#> 3976   jun     3183        2    -1        0  unknown 1     upper
#> 3977   nov       79        1   129        2  failure 0     upper
#> 3978   may      111       11    -1        0  unknown 0     upper
#> 3979   aug      111        2    -1        0  unknown 0     upper
#> 3980   may      115        1    -1        0  unknown 0     upper
#> 3981   jul      303        1    -1        0  unknown 0   unknown
#> 3982   may      299        1    -1        0  unknown 0     upper
#> 3983   nov       89        4    -1        0  unknown 0     upper
#> 3984   nov       63        2    -1        0  unknown 0   primary
#> 3985   nov     1816        1    -1        0  unknown 0     upper
#> 3986   may      242        1   212        1  success 1     upper
#> 3987   may      954        2   293        4  success 1     upper
#> 3988   jun      271        2    -1        0  unknown 0   primary
#> 3989   jul      674        3    -1        0  unknown 0     upper
#> 3990   may      111        1    -1        0  unknown 0     upper
#> 3991   may      144        2    -1        0  unknown 0     upper
#> 3992   jun      422        1    -1        0  unknown 0   primary
#> 3993   aug      733        6    -1        0  unknown 0     upper
#> 3994   may       11        8    -1        0  unknown 0     upper
#> 3995   sep       74        1    -1        0  unknown 0     upper
#> 3996   may      245        1    -1        0  unknown 0     upper
#> 3997   may      268        3    -1        0  unknown 0     upper
#> 3998   jan      918        1    93        1  success 1     upper
#> 3999   mar      119        1    -1        0  unknown 0   primary
#> 4000   may       17        7   287       13    other 0     upper
#> 4001   jun      326        1    -1        0  unknown 0     upper
#> 4002   aug      138        2    69        3  failure 0     upper
#> 4003   jan      142        1   238        3    other 1     upper
#> 4004   aug       29       28    -1        0  unknown 0     upper
#> 4005   may      147        1    40        1  failure 0   unknown
#> 4006   jan      385        3   197        1    other 0     upper
#> 4007   jul      901        1    -1        0  unknown 1     upper
#> 4008   may      129        2    -1        0  unknown 0     upper
#> 4009   jun       45        1    -1        0  unknown 0     upper
#> 4010   feb      206        2   188        6  failure 0   primary
#> 4011   feb       70        3   265        4    other 0   primary
#> 4012   jun      399        8    -1        0  unknown 0     upper
#> 4013   nov      273        5    -1        0  unknown 0     upper
#> 4014   may      148        1    -1        0  unknown 0     upper
#> 4015   apr      222        5    -1        0  unknown 0   primary
#> 4016   may      138        1    -1        0  unknown 0     upper
#> 4017   jul       50       20    -1        0  unknown 0     upper
#> 4018   may      102        2    -1        0  unknown 0     upper
#> 4019   mar      144        2   124        1  failure 0     upper
#> 4020   may      157        1   299        3  failure 0     upper
#> 4021   nov      120        2   187        2  failure 0     upper
#> 4022   nov       22        5    -1        0  unknown 0     upper
#> 4023   oct      135        2    91       13  failure 0     upper
#> 4024   may       72        2    -1        0  unknown 0     upper
#> 4025   may      394        1    -1        0  unknown 1     upper
#> 4026   jun      194        1    -1        0  unknown 1     upper
#> 4027   dec      154        1    97        2  failure 1     upper
#> 4028   may       45        1    -1        0  unknown 0     upper
#> 4029   may      178        2    -1        0  unknown 0   primary
#> 4030   jul      150        4    -1        0  unknown 0     upper
#> 4031   jun      394        1    -1        0  unknown 0   primary
#> 4032   jul      335        1    -1        0  unknown 0     upper
#> 4033   jul      444        2    -1        0  unknown 0     upper
#> 4034   may       90        2    -1        0  unknown 0     upper
#> 4035   jul      298        2    -1        0  unknown 0     upper
#> 4036   jun      367        1    -1        0  unknown 0     upper
#> 4037   jul      182        6    -1        0  unknown 0     upper
#> 4038   nov       57        1    -1        0  unknown 0     upper
#> 4039   may      207        1    -1        0  unknown 0   primary
#> 4040   may      132        1    -1        0  unknown 0     upper
#> 4041   jun       78        1    -1        0  unknown 0     upper
#> 4042   feb      337        4    -1        0  unknown 0     upper
#> 4043   may      154        1    -1        0  unknown 0   primary
#> 4044   aug      112        2    -1        0  unknown 0     upper
#> 4045   jul      820        4    -1        0  unknown 1     upper
#> 4046   jun      247        1    -1        0  unknown 0     upper
#> 4047   may      102        1    -1        0  unknown 0     upper
#> 4048   may      530        2    -1        0  unknown 0     upper
#> 4049   may      379        2   169        1  failure 0     upper
#> 4050   feb      114        1   208        1  failure 0   primary
#> 4051   nov      160        2    -1        0  unknown 0     upper
#> 4052   aug      152        2    -1        0  unknown 0     upper
#> 4053   jun       74        1    -1        0  unknown 0     upper
#> 4054   aug      275       12    -1        0  unknown 0     upper
#> 4055   jun      140        2    -1        0  unknown 0     upper
#> 4056   aug      310        2    -1        0  unknown 0     upper
#> 4057   nov      758        1    -1        0  unknown 1     upper
#> 4058   jul     1083        2    -1        0  unknown 0     upper
#> 4059   nov       47        1   133        1  failure 0     upper
#> 4060   aug      181        2    -1        0  unknown 0   primary
#> 4061   jul      401        1    -1        0  unknown 0     upper
#> 4062   nov       78        1    -1        0  unknown 0     upper
#> 4063   may      146        1   370        1  failure 0     upper
#> 4064   may       12        2    -1        0  unknown 0     upper
#> 4065   may      228        1    -1        0  unknown 0   primary
#> 4066   may       57        1    -1        0  unknown 0     upper
#> 4067   apr       96        2    -1        0  unknown 0     upper
#> 4068   aug       84        4    -1        0  unknown 0     upper
#> 4069   jun       22       12    -1        0  unknown 0     upper
#> 4070   may       54        2   371        1  failure 0     upper
#> 4071   jun      407        1    -1        0  unknown 0   primary
#> 4072   apr       82        6    -1        0  unknown 0     upper
#> 4073   apr      259        1    -1        0  unknown 0     upper
#> 4074   jan      164        1    -1        0  unknown 0     upper
#> 4075   jul      462        1    -1        0  unknown 0     upper
#> 4076   feb      616        5    -1        0  unknown 0     upper
#> 4077   may      118        4    -1        0  unknown 0     upper
#> 4078   may       75        4    -1        0  unknown 0     upper
#> 4079   feb      171        3   277        4    other 0   primary
#> 4080   may       16        6   351        1  failure 0     upper
#> 4081   may      945        2    -1        0  unknown 1   primary
#> 4082   jul       49        6    -1        0  unknown 0     upper
#> 4083   aug      114        3    -1        0  unknown 0     upper
#> 4084   apr       90       10    -1        0  unknown 0     upper
#> 4085   aug      205        4    -1        0  unknown 0     upper
#> 4086   sep       11        1   490        5    other 0     upper
#> 4087   nov      146        2    -1        0  unknown 0     upper
#> 4088   aug      272        4    -1        0  unknown 0     upper
#> 4089   feb      168        2   203        7  failure 0     upper
#> 4090   may      109        1    -1        0  unknown 0   primary
#> 4091   may      199        1    -1        0  unknown 0     upper
#> 4092   may       60        1   343        7  failure 0     upper
#> 4093   may       75        2    -1        0  unknown 0   primary
#> 4094   sep        6        1   838        3    other 0     upper
#> 4095   jul      924        4    -1        0  unknown 0   primary
#> 4096   aug       59        2    -1        0  unknown 0     upper
#> 4097   jul      278        3    -1        0  unknown 0     upper
#> 4098   may      205        2    -1        0  unknown 0     upper
#> 4099   nov      353        1    -1        0  unknown 0     upper
#> 4100   oct      246        2   420        2    other 1     upper
#> 4101   may      422        1   363        1  failure 0   unknown
#> 4102   sep      199        4    -1        0  unknown 0     upper
#> 4103   jun      305       10    -1        0  unknown 0     upper
#> 4104   may      637        2    -1        0  unknown 0     upper
#> 4105   may      264        3    -1        0  unknown 0     upper
#> 4106   jul       87        3    -1        0  unknown 0     upper
#> 4107   mar      248        4    -1        0  unknown 1     upper
#> 4108   may      209        2    -1        0  unknown 0   primary
#> 4109   apr       24        1   152        3  failure 0     upper
#> 4110   may      182        2    -1        0  unknown 0     upper
#> 4111   jul      188        6    -1        0  unknown 0   primary
#> 4112   feb      152        1    -1        0  unknown 1     upper
#> 4113   may      187        3    -1        0  unknown 0     upper
#> 4114   may      337        1    -1        0  unknown 0     upper
#> 4115   may       53        7    -1        0  unknown 0   primary
#> 4116   aug      168        4    -1        0  unknown 0   primary
#> 4117   jul      416        4    -1        0  unknown 1     upper
#> 4118   jan       11        4    -1        0  unknown 0     upper
#> 4119   aug      219        2    -1        0  unknown 0     upper
#> 4120   oct      534        1    -1        0  unknown 0     upper
#> 4121   jul      283        1    -1        0  unknown 0     upper
#> 4122   aug      160        4    -1        0  unknown 0     upper
#> 4123   may      214        1    -1        0  unknown 0     upper
#> 4124   jul      249        3    -1        0  unknown 0     upper
#> 4125   jun      295        1    -1        0  unknown 1     upper
#> 4126   may      431        1    -1        0  unknown 0     upper
#> 4127   jul      239        4    -1        0  unknown 0     upper
#> 4128   jun      119        3    -1        0  unknown 0   primary
#> 4129   jan      553        2    -1        0  unknown 0     upper
#> 4130   may      140        1    -1        0  unknown 0     upper
#> 4131   may       89        7    -1        0  unknown 0     upper
#> 4132   may      112        1   370        1  failure 0     upper
#> 4133   jun      218        1    -1        0  unknown 0     upper
#> 4134   may      135        1    -1        0  unknown 0   primary
#> 4135   mar      237        3    -1        0  unknown 1     upper
#> 4136   mar      164        1    -1        0  unknown 0     upper
#> 4137   aug      228        6    -1        0  unknown 0   primary
#> 4138   may      237        3    -1        0  unknown 0   primary
#> 4139   may      396        1    -1        0  unknown 0   primary
#> 4140   aug      197        2    -1        0  unknown 0     upper
#> 4141   jul      258        1    -1        0  unknown 0     upper
#> 4142   jun       14       25    -1        0  unknown 0     upper
#> 4143   jun      351        3    -1        0  unknown 0     upper
#> 4144   may       37        1    -1        0  unknown 0     upper
#> 4145   aug      142        5    -1        0  unknown 0     upper
#> 4146   jun      249        2    -1        0  unknown 0     upper
#> 4147   nov       69        1    -1        0  unknown 0     upper
#> 4148   apr      318        2   332        6    other 0     upper
#> 4149   feb      174        1   267        2    other 0     upper
#> 4150   may      246        3    -1        0  unknown 0   unknown
#> 4151   may     1713        1    -1        0  unknown 0     upper
#> 4152   aug      119        3    -1        0  unknown 0     upper
#> 4153   oct      102        3    96        3  success 0     upper
#> 4154   may      345        1    -1        0  unknown 0     upper
#> 4155   may      149        6    -1        0  unknown 0     upper
#> 4156   jun       78        2    -1        0  unknown 0   unknown
#> 4157   jul      936        4    -1        0  unknown 0     upper
#> 4158   nov      198        1    -1        0  unknown 0     upper
#> 4159   may      179        1    -1        0  unknown 0   primary
#> 4160   jun      486        2    -1        0  unknown 0     upper
#> 4161   jul       72        1    -1        0  unknown 0     upper
#> 4162   jun      818        1    -1        0  unknown 0     upper
#> 4163   nov      209        5    -1        0  unknown 0     upper
#> 4164   jun      800        2    -1        0  unknown 0     upper
#> 4165   feb      213        2    -1        0  unknown 0     upper
#> 4166   may      191        1    -1        0  unknown 0     upper
#> 4167   nov       90        3    93        6  success 1     upper
#> 4168   aug      491        1    -1        0  unknown 0     upper
#> 4169   apr      422        1    -1        0  unknown 0   primary
#> 4170   nov      298        2   112        2    other 0     upper
#> 4171   sep      167        1    93        3  success 0     upper
#> 4172   feb     1294        2    -1        0  unknown 1     upper
#> 4173   jan      131        2   206        6    other 0     upper
#> 4174   jul      207        2    -1        0  unknown 0   primary
#> 4175   jul      214        1    -1        0  unknown 0   primary
#> 4176   nov       54        1    -1        0  unknown 0     upper
#> 4177   aug       43        5    -1        0  unknown 0     upper
#> 4178   may      229        5   268        4  failure 0     upper
#> 4179   apr      693        2    -1        0  unknown 0     upper
#> 4180   feb      215        1    80        1    other 0     upper
#> 4181   may       50        1   352        1  failure 0     upper
#> 4182   may       62        2    -1        0  unknown 0     upper
#> 4183   may      160        3    -1        0  unknown 0     upper
#> 4184   may       53        3    -1        0  unknown 0     upper
#> 4185   oct      371        1   495        1  failure 1     upper
#> 4186   nov      577        1    -1        0  unknown 0     upper
#> 4187   nov      134        1    92        8  success 0     upper
#> 4188   aug       99        4    -1        0  unknown 0     upper
#> 4189   may      224        2    -1        0  unknown 0     upper
#> 4190   jul       15        2    -1        0  unknown 0     upper
#> 4191   may      609        1    -1        0  unknown 0     upper
#> 4192   may      247        1   261        4  failure 0     upper
#> 4193   may       24        1    -1        0  unknown 0     upper
#> 4194   may      124        1    -1        0  unknown 0     upper
#> 4195   jul      134        1    -1        0  unknown 0     upper
#> 4196   jun      583        1    -1        0  unknown 0     upper
#> 4197   jul       61        3    -1        0  unknown 0     upper
#> 4198   may      238        3    -1        0  unknown 0     upper
#> 4199   may       47        1    -1        0  unknown 0     upper
#> 4200   aug      965        4    -1        0  unknown 1     upper
#> 4201   jun       83        1    -1        0  unknown 0     upper
#> 4202   may      203        1    -1        0  unknown 0     upper
#> 4203   may      706        3    -1        0  unknown 0   primary
#> 4204   aug      123        2    -1        0  unknown 0     upper
#> 4205   aug      196        2    -1        0  unknown 0     upper
#> 4206   jul      302        1    -1        0  unknown 0   primary
#> 4207   jul        5        3    -1        0  unknown 0     upper
#> 4208   jun      269        1   104        1  success 1     upper
#> 4209   nov      286        1    -1        0  unknown 0     upper
#> 4210   aug       87        5    -1        0  unknown 0     upper
#> 4211   apr      108        1    -1        0  unknown 0   primary
#> 4212   may      114        1    -1        0  unknown 0     upper
#> 4213   may      176        1    -1        0  unknown 0     upper
#> 4214   jan      259        1    -1        0  unknown 0     upper
#> 4215   aug       73        2    -1        0  unknown 0     upper
#> 4216   jun       84        2    -1        0  unknown 0     upper
#> 4217   may       66        3    -1        0  unknown 0     upper
#> 4218   jun       55       25    -1        0  unknown 0     upper
#> 4219   apr      370        3   282        2  failure 0   primary
#> 4220   may      123        2    -1        0  unknown 0     upper
#> 4221   aug      425        6    -1        0  unknown 0     upper
#> 4222   may       83        7    -1        0  unknown 0     upper
#> 4223   aug      217        1    99        7  success 1     upper
#> 4224   aug       96       11    -1        0  unknown 0     upper
#> 4225   jun       70        5    -1        0  unknown 0     upper
#> 4226   aug      101        1    -1        0  unknown 0     upper
#> 4227   may       27        2    -1        0  unknown 0     upper
#> 4228   sep      211        1   216        7  success 1     upper
#> 4229   may      225        1   364        1  failure 0     upper
#> 4230   jul      119        2    -1        0  unknown 0     upper
#> 4231   may      686        2    -1        0  unknown 1     upper
#> 4232   may      254        1    -1        0  unknown 0     upper
#> 4233   mar      105        1   182        1  failure 0     upper
#> 4234   jun      534        3    -1        0  unknown 0     upper
#> 4235   aug      229        2    -1        0  unknown 0   primary
#> 4236   jul      544        1    -1        0  unknown 0     upper
#> 4237   nov       73        2    -1        0  unknown 0   primary
#> 4238   aug       67        6    -1        0  unknown 0     upper
#> 4239   jun      136        1    -1        0  unknown 0   primary
#> 4240   may      188        1    -1        0  unknown 0     upper
#> 4241   feb      388        1    -1        0  unknown 0     upper
#> 4242   jul       93        1    -1        0  unknown 0     upper
#> 4243   jul      183        2    -1        0  unknown 0   primary
#> 4244   nov       57        1    -1        0  unknown 0     upper
#> 4245   jul      271        1    -1        0  unknown 0   primary
#> 4246   jul      305        6    -1        0  unknown 0   primary
#> 4247   jul      652        2    -1        0  unknown 0     upper
#> 4248   may      163        4    -1        0  unknown 0     upper
#> 4249   jun      585        2    -1        0  unknown 0     upper
#> 4250   may      183        3    -1        0  unknown 0     upper
#> 4251   aug      238        1    -1        0  unknown 0     upper
#> 4252   aug       78        4    -1        0  unknown 0   primary
#> 4253   apr      804        2   262        5  failure 0     upper
#> 4254   jun      361        1    -1        0  unknown 0     upper
#> 4255   aug      114        2    -1        0  unknown 0     upper
#> 4256   sep      121        3   100        5    other 1     upper
#> 4257   jun      177        2    -1        0  unknown 0     upper
#> 4258   jun      107        1    -1        0  unknown 0     upper
#> 4259   may       87        1    -1        0  unknown 0     upper
#> 4260   jul      631        1    -1        0  unknown 0     upper
#> 4261   aug      144        4    -1        0  unknown 0     upper
#> 4262   nov       50        1    -1        0  unknown 0     upper
#> 4263   jan      205        1    -1        0  unknown 0     upper
#> 4264   jun      219        1    -1        0  unknown 0     upper
#> 4265   jun      197        1    -1        0  unknown 0     upper
#> 4266   feb       90        2    -1        0  unknown 0     upper
#> 4267   jul      517        5    -1        0  unknown 0     upper
#> 4268   aug      459        2    -1        0  unknown 1   primary
#> 4269   jul      196        1    -1        0  unknown 0     upper
#> 4270   jul       87        5    -1        0  unknown 0   primary
#> 4271   aug       64        2    -1        0  unknown 0     upper
#> 4272   aug      219        1    84        2  failure 0     upper
#> 4273   nov      159        1    -1        0  unknown 0     upper
#> 4274   aug      192        1    -1        0  unknown 0   primary
#> 4275   may      151        1    -1        0  unknown 0     upper
#> 4276   aug       91        1     1        6    other 0     upper
#> 4277   aug      179        6    -1        0  unknown 0     upper
#> 4278   may       54        4    -1        0  unknown 0   primary
#> 4279   jul       69        1    -1        0  unknown 0     upper
#> 4280   jul      106        3    -1        0  unknown 0   primary
#> 4281   may      370        3    -1        0  unknown 0     upper
#> 4282   may      180        2    -1        0  unknown 0     upper
#> 4283   aug       81        4    -1        0  unknown 0     upper
#> 4284   aug      342        5    -1        0  unknown 0     upper
#> 4285   may      132        1    -1        0  unknown 0     upper
#> 4286   feb       80        2   268        1  failure 0   primary
#> 4287   nov       95        1    -1        0  unknown 0     upper
#> 4288   may      554        1    -1        0  unknown 0     upper
#> 4289   apr      267        2   294        3  failure 0     upper
#> 4290   feb       82        3    -1        0  unknown 0     upper
#> 4291   may      214        2    -1        0  unknown 0     upper
#> 4292   aug      212        2    -1        0  unknown 0     upper
#> 4293   jul      127       10    -1        0  unknown 0     upper
#> 4294   nov       42        1    -1        0  unknown 0     upper
#> 4295   nov       39        9    -1        0  unknown 0     upper
#> 4296   aug      219        2    -1        0  unknown 0     upper
#> 4297   jul      270        2    -1        0  unknown 0     upper
#> 4298   oct      376        1    81        3  failure 0     upper
#> 4299   may      289        1    -1        0  unknown 0   primary
#> 4300   jun      128        1    -1        0  unknown 0     upper
#> 4301   nov       78        2   193        2  failure 0   primary
#> 4302   jul      250        1    -1        0  unknown 0     upper
#> 4303   apr      875        2    -1        0  unknown 1     upper
#> 4304   may      148        2    -1        0  unknown 0     upper
#> 4305   may      556        3    -1        0  unknown 0     upper
#> 4306   jul       81        6    -1        0  unknown 0     upper
#> 4307   may      556        1    -1        0  unknown 0     upper
#> 4308   may      106        1   101        2  failure 0     upper
#> 4309   may      250        1    -1        0  unknown 0     upper
#> 4310   nov      135        4    -1        0  unknown 0     upper
#> 4311   may      827        2    -1        0  unknown 1   primary
#> 4312   may      314        2    -1        0  unknown 0     upper
#> 4313   may      144        2   352        1    other 0     upper
#> 4314   may      428        3    -1        0  unknown 0     upper
#> 4315   aug      141        2    -1        0  unknown 0     upper
#> 4316   jul       84        2    -1        0  unknown 0     upper
#> 4317   feb       20        2   256        1  failure 0     upper
#> 4318   aug       95        6    -1        0  unknown 0     upper
#> 4319   aug      209        3    -1        0  unknown 0     upper
#> 4320   jun       87        3    -1        0  unknown 0     upper
#> 4321   may      328        2    -1        0  unknown 0   unknown
#> 4322   sep        6        1    -1        0  unknown 0     upper
#> 4323   jun      184        2    -1        0  unknown 0   primary
#> 4324   aug      946        4    -1        0  unknown 1     upper
#> 4325   jun       87        6    -1        0  unknown 0   primary
#> 4326   aug      545        2    -1        0  unknown 1     upper
#> 4327   may      210        1    -1        0  unknown 0     upper
#> 4328   jun      281        3   186        6    other 1     upper
#> 4329   jul      316        2    -1        0  unknown 0     upper
#> 4330   may      565        1    -1        0  unknown 0     upper
#> 4331   jun      199        4    -1        0  unknown 0     upper
#> 4332   oct      187        1    91       12  success 1     upper
#> 4333   feb      131        1    -1        0  unknown 0     upper
#> 4334   may      475        3    -1        0  unknown 0     upper
#> 4335   apr      160        1    -1        0  unknown 0     upper
#> 4336   jul      168        5    -1        0  unknown 0     upper
#> 4337   may      371        2    -1        0  unknown 0     upper
#> 4338   jul      122        2    -1        0  unknown 0     upper
#> 4339   jul       54        2    -1        0  unknown 0     upper
#> 4340   apr      125        1    -1        0  unknown 0     upper
#> 4341   may       68        2    -1        0  unknown 0   primary
#> 4342   apr       37        2    -1        0  unknown 0     upper
#> 4343   jul       92        1    -1        0  unknown 0     upper
#> 4344   mar      101        1    -1        0  unknown 0     upper
#> 4345   may      372       14    -1        0  unknown 0     upper
#> 4346   may       67        7   177        1    other 0     upper
#> 4347   jul      327        6    -1        0  unknown 0     upper
#> 4348   jul      272        1    -1        0  unknown 1   unknown
#> 4349   jun       84        2    -1        0  unknown 0     upper
#> 4350   may       91        1   356        2    other 0     upper
#> 4351   jun       39        3    -1        0  unknown 0   unknown
#> 4352   may      181        1    -1        0  unknown 0     upper
#> 4353   apr       72        3   341        1    other 0     upper
#> 4354   jul      175        1    -1        0  unknown 0     upper
#> 4355   jun      136        6    -1        0  unknown 0     upper
#> 4356   feb     1226        1    -1        0  unknown 1     upper
#> 4357   may     1521        1    -1        0  unknown 0     upper
#> 4358   may       58        6    -1        0  unknown 0     upper
#> 4359   aug      345        3    -1        0  unknown 0     upper
#> 4360   jul      425        2    -1        0  unknown 0     upper
#> 4361   nov      190        3    91       11  failure 0   unknown
#> 4362   jul      118        1    -1        0  unknown 0   primary
#> 4363   jun      157        1    -1        0  unknown 0     upper
#> 4364   jun       94       18    -1        0  unknown 0     upper
#> 4365   may      148        2    -1        0  unknown 0     upper
#> 4366   aug      120        4    -1        0  unknown 0     upper
#> 4367   apr      237        3   150        3  failure 0   primary
#> 4368   jul      165       23    -1        0  unknown 0     upper
#> 4369   may       70        2    -1        0  unknown 0     upper
#> 4370   mar      103        3    -1        0  unknown 0     upper
#> 4371   may      275        3    -1        0  unknown 0     upper
#> 4372   jul        7        5    -1        0  unknown 0     upper
#> 4373   apr      204        1    -1        0  unknown 1     upper
#> 4374   may      128        5    -1        0  unknown 0   primary
#> 4375   apr       54        1   273        3  failure 0     upper
#> 4376   jul      362        1    -1        0  unknown 0     upper
#> 4377   may      186        4    -1        0  unknown 0     upper
#> 4378   apr      555        2    -1        0  unknown 1     upper
#> 4379   aug      411        1    -1        0  unknown 1     upper
#> 4380   feb      210        2   274        6  failure 0     upper
#> 4381   jun      183        2    -1        0  unknown 0   primary
#> 4382   aug      334        5    -1        0  unknown 0     upper
#> 4383   jul      259       12    -1        0  unknown 0     upper
#> 4384   jul      135        2    -1        0  unknown 0     upper
#> 4385   may      145        1    -1        0  unknown 0     upper
#> 4386   feb      318        1   388        1  success 1     upper
#> 4387   jan      123        2    -1        0  unknown 0     upper
#> 4388   jul      107        5    -1        0  unknown 0   primary
#> 4389   aug      120        6    -1        0  unknown 0     upper
#> 4390   may      212        1    -1        0  unknown 0     upper
#> 4391   may       53        1    -1        0  unknown 0   primary
#> 4392   aug       83        2    -1        0  unknown 0     upper
#> 4393   jun      110        2    -1        0  unknown 0     upper
#> 4394   nov       14        7    -1        0  unknown 0     upper
#> 4395   nov      180        1   186        6  failure 0     upper
#> 4396   nov       33        1    -1        0  unknown 0   primary
#> 4397   may      153        1    -1        0  unknown 0     upper
#> 4398   may      139        1    -1        0  unknown 0     upper
#> 4399   nov      709        2    -1        0  unknown 1     upper
#> 4400   may      359        1    -1        0  unknown 0     upper
#> 4401   jun      126        2    -1        0  unknown 0     upper
#> 4402   aug      299        4    -1        0  unknown 0   primary
#> 4403   feb       41        3    -1        0  unknown 0     upper
#> 4404   apr      462        1   648        1  failure 1     upper
#> 4405   may      296        1    -1        0  unknown 0     upper
#> 4406   may      190        1    -1        0  unknown 0     upper
#> 4407   jul       57        5    -1        0  unknown 0     upper
#> 4408   feb      134        2   203        1  success 0     upper
#> 4409   nov       62        2   136        3  failure 0     upper
#> 4410   jun       48       10    -1        0  unknown 0   primary
#> 4411   jun      302        1    -1        0  unknown 0   primary
#> 4412   may      550        1    -1        0  unknown 1     upper
#> 4413   aug      197        5    -1        0  unknown 0     upper
#> 4414   apr      386        2   234        4  failure 0   primary
#> 4415   apr      184        2    -1        0  unknown 0     upper
#> 4416   jan      653        3    -1        0  unknown 0     upper
#> 4417   may       92        2    -1        0  unknown 0     upper
#> 4418   nov      101        1    -1        0  unknown 0     upper
#> 4419   may      338        4    -1        0  unknown 0     upper
#> 4420   may       84        1   343        1    other 0     upper
#> 4421   feb       82        2    -1        0  unknown 0     upper
#> 4422   may      411        3    -1        0  unknown 0     upper
#> 4423   jul      495        1    -1        0  unknown 0     upper
#> 4424   aug      308        6    -1        0  unknown 0     upper
#> 4425   apr      437        1    80        1  success 1     upper
#> 4426   may      272        6    -1        0  unknown 0     upper
#> 4427   jul      244        1    -1        0  unknown 0     upper
#> 4428   may      302        8    -1        0  unknown 0   primary
#> 4429   jun      266        3    -1        0  unknown 0     upper
#> 4430   aug      104        2    -1        0  unknown 0   unknown
#> 4431   apr      204        1    -1        0  unknown 0     upper
#> 4432   jul      654        2    -1        0  unknown 1     upper
#> 4433   may      297        1    -1        0  unknown 0     upper
#> 4434   jul      313        1    -1        0  unknown 0     upper
#> 4435   aug      106        2    -1        0  unknown 0   unknown
#> 4436   aug      582        1    -1        0  unknown 1     upper
#> 4437   jul       27       17    -1        0  unknown 0     upper
#> 4438   may      249        2    -1        0  unknown 0   unknown
#> 4439   may      157        2   351        5  failure 0     upper
#> 4440   may      463        1   175        4  failure 0   primary
#> 4441   feb      429        1    -1        0  unknown 1   primary
#> 4442   may      597        6    -1        0  unknown 1     upper
#> 4443   feb     1776        2    -1        0  unknown 1     upper
#> 4444   aug      726        1    -1        0  unknown 0     upper
#> 4445   aug      155        2    -1        0  unknown 0     upper
#> 4446   may      588        3    -1        0  unknown 1     upper
#> 4447   jul      247        2    -1        0  unknown 0     upper
#> 4448   nov        8        5   137        1  failure 0     upper
#> 4449   jan      103        1    -1        0  unknown 0     upper
#> 4450   aug      163        2    -1        0  unknown 0     upper
#> 4451   jan       91        1   223        3  failure 0   primary
#> 4452   may      127        1    -1        0  unknown 0   primary
#> 4453   nov      658        3   169        2  failure 0     upper
#> 4454   aug       56        2    -1        0  unknown 0     upper
#> 4455   aug       77        6    -1        0  unknown 0   primary
#> 4456   may      122        1   368        2  failure 0     upper
#> 4457   aug      156       12    -1        0  unknown 0     upper
#> 4458   feb      293        6    -1        0  unknown 0     upper
#> 4459   feb       75        1   208        1  failure 0     upper
#> 4460   jul       63        2    -1        0  unknown 0     upper
#> 4461   jun      103        1    -1        0  unknown 0     upper
#> 4462   aug      122        1   109        1    other 0     upper
#> 4463   may      480        2    -1        0  unknown 0     upper
#> 4464   jul      171       13    -1        0  unknown 0   primary
#> 4465   nov       59        2    -1        0  unknown 0     upper
#> 4466   jul      115        1    -1        0  unknown 0     upper
#> 4467   aug      734        4    -1        0  unknown 1     upper
#> 4468   jul      244        7    -1        0  unknown 0     upper
#> 4469   jul       85        1    -1        0  unknown 0   primary
#> 4470   feb      129        4    -1        0  unknown 0     upper
#> 4471   may       98        1   170        2  failure 0     upper
#> 4472   feb      308        1    94        4  success 1     upper
#> 4473   apr       74        2    -1        0  unknown 0     upper
#> 4474   may      116        4   365        1  failure 0   primary
#> 4475   jul      106        4    -1        0  unknown 0     upper
#> 4476   may      310        2    -1        0  unknown 0     upper
#> 4477   jun      750        2    -1        0  unknown 1     upper
#> 4478   aug      701        1    -1        0  unknown 0   primary
#> 4479   may      209        3    -1        0  unknown 0     upper
#> 4480   may      293        6    -1        0  unknown 0     upper
#> 4481   jul      270        3    -1        0  unknown 1     upper
#> 4482   aug      112        7    -1        0  unknown 0     upper
#> 4483   jul      116        1    -1        0  unknown 0     upper
#> 4484   aug       83        3    -1        0  unknown 0     upper
#> 4485   aug       67        3   280        4  failure 0     upper
#> 4486   may      922        4    -1        0  unknown 1     upper
#> 4487   jul       73        1    -1        0  unknown 0   primary
#> 4488   oct      169        1   134        1    other 0     upper
#> 4489   nov      902        2    -1        0  unknown 0   primary
#> 4490   may       57        4    -1        0  unknown 0     upper
#> 4491   dec      221        1    -1        0  unknown 0   primary
#> 4492   aug       87        2    -1        0  unknown 0     upper
#> 4493   aug      628        1   182        2  failure 1   unknown
#> 4494   apr      431        2    -1        0  unknown 0     upper
#> 4495   aug      356        1   364        1    other 1     upper
#> 4496   aug       35       14    -1        0  unknown 0     upper
#> 4497   aug      201        1   103        1  failure 0     upper
#> 4498   apr      792        2    -1        0  unknown 0   primary
#> 4499   may      478        1    -1        0  unknown 0     upper
#> 4500   jun      781        1    -1        0  unknown 1     upper
#> 4501   jun      544        1    -1        0  unknown 1     upper
#> 4502   jul      155        3    -1        0  unknown 0   primary
#> 4503   feb      226        2    -1        0  unknown 0     upper
#> 4504   jun      251        4    -1        0  unknown 0     upper
#> 4505   jul      143        1    -1        0  unknown 0     upper
#> 4506   jun      133        1    -1        0  unknown 0     upper
#> 4507   may      422        2    -1        0  unknown 0   primary
#> 4508   jul       71        2    -1        0  unknown 0     upper
#> 4509   may      304        4    -1        0  unknown 0   primary
#> 4510   may      264        1    -1        0  unknown 0     upper
#> 4511   jul      230        1    -1        0  unknown 0     upper
#> 4512   aug      117        3    -1        0  unknown 0     upper
#> 4513   may      242        1    -1        0  unknown 0     upper
#> 4514   may      339        1    -1        0  unknown 0     upper
#> 4515   mar      217        1   184        7    other 0     upper
#> 4516   aug      209        2    -1        0  unknown 0     upper
#> 4517   jul       13       11    -1        0  unknown 0     upper
#> 4518   feb      161        4   212        3  failure 0     upper
#> 4519   may      246        2    -1        0  unknown 0     upper
#> 4520   jul      110        4    -1        0  unknown 0   primary
#> 4521   feb      489        2   271        2  success 0     upper
#>      education_upper education_unknown education_primary
#> 1                  1                 0                 0
#> 2                  1                 0                 0
#> 3                  1                 0                 0
#> 4                  1                 0                 0
#> 5                  1                 0                 0
#> 6                  1                 0                 0
#> 7                  1                 0                 0
#> 8                  0                 0                 1
#> 9                  1                 0                 0
#> 10                 1                 0                 0
#> 11                 1                 0                 0
#> 12                 0                 0                 1
#> 13                 1                 0                 0
#> 14                 0                 0                 1
#> 15                 1                 0                 0
#> 16                 1                 0                 0
#> 17                 0                 0                 1
#> 18                 0                 1                 0
#> 19                 1                 0                 0
#> 20                 1                 0                 0
#> 21                 1                 0                 0
#> 22                 1                 0                 0
#> 23                 0                 1                 0
#> 24                 1                 0                 0
#> 25                 1                 0                 0
#> 26                 1                 0                 0
#> 27                 1                 0                 0
#> 28                 1                 0                 0
#> 29                 1                 0                 0
#> 30                 1                 0                 0
#> 31                 1                 0                 0
#> 32                 0                 0                 1
#> 33                 1                 0                 0
#> 34                 1                 0                 0
#> 35                 1                 0                 0
#> 36                 1                 0                 0
#> 37                 0                 0                 1
#> 38                 1                 0                 0
#> 39                 0                 0                 1
#> 40                 0                 0                 1
#> 41                 0                 0                 1
#> 42                 1                 0                 0
#> 43                 1                 0                 0
#> 44                 1                 0                 0
#> 45                 1                 0                 0
#> 46                 1                 0                 0
#> 47                 1                 0                 0
#> 48                 0                 0                 1
#> 49                 0                 0                 1
#> 50                 0                 0                 1
#> 51                 0                 1                 0
#> 52                 1                 0                 0
#> 53                 1                 0                 0
#> 54                 1                 0                 0
#> 55                 1                 0                 0
#> 56                 1                 0                 0
#> 57                 1                 0                 0
#> 58                 1                 0                 0
#> 59                 1                 0                 0
#> 60                 1                 0                 0
#> 61                 0                 0                 1
#> 62                 1                 0                 0
#> 63                 1                 0                 0
#> 64                 1                 0                 0
#> 65                 1                 0                 0
#> 66                 1                 0                 0
#> 67                 1                 0                 0
#> 68                 1                 0                 0
#> 69                 1                 0                 0
#> 70                 0                 0                 1
#> 71                 1                 0                 0
#> 72                 1                 0                 0
#> 73                 0                 0                 1
#> 74                 0                 0                 1
#> 75                 1                 0                 0
#> 76                 1                 0                 0
#> 77                 1                 0                 0
#> 78                 1                 0                 0
#> 79                 0                 0                 1
#> 80                 1                 0                 0
#> 81                 1                 0                 0
#> 82                 1                 0                 0
#> 83                 0                 0                 1
#> 84                 1                 0                 0
#> 85                 0                 0                 1
#> 86                 1                 0                 0
#> 87                 1                 0                 0
#> 88                 1                 0                 0
#> 89                 1                 0                 0
#> 90                 1                 0                 0
#> 91                 1                 0                 0
#> 92                 0                 1                 0
#> 93                 1                 0                 0
#> 94                 0                 0                 1
#> 95                 0                 0                 1
#> 96                 1                 0                 0
#> 97                 1                 0                 0
#> 98                 1                 0                 0
#> 99                 0                 0                 1
#> 100                1                 0                 0
#> 101                1                 0                 0
#> 102                1                 0                 0
#> 103                1                 0                 0
#> 104                1                 0                 0
#> 105                0                 0                 1
#> 106                1                 0                 0
#> 107                0                 0                 1
#> 108                1                 0                 0
#> 109                1                 0                 0
#> 110                1                 0                 0
#> 111                0                 0                 1
#> 112                1                 0                 0
#> 113                1                 0                 0
#> 114                0                 1                 0
#> 115                1                 0                 0
#> 116                0                 0                 1
#> 117                1                 0                 0
#> 118                1                 0                 0
#> 119                1                 0                 0
#> 120                1                 0                 0
#> 121                1                 0                 0
#> 122                1                 0                 0
#> 123                1                 0                 0
#> 124                0                 0                 1
#> 125                1                 0                 0
#> 126                1                 0                 0
#> 127                1                 0                 0
#> 128                1                 0                 0
#> 129                1                 0                 0
#> 130                1                 0                 0
#> 131                1                 0                 0
#> 132                1                 0                 0
#> 133                1                 0                 0
#> 134                1                 0                 0
#> 135                1                 0                 0
#> 136                0                 0                 1
#> 137                1                 0                 0
#> 138                1                 0                 0
#> 139                1                 0                 0
#> 140                1                 0                 0
#> 141                1                 0                 0
#> 142                1                 0                 0
#> 143                1                 0                 0
#> 144                1                 0                 0
#> 145                1                 0                 0
#> 146                0                 0                 1
#> 147                1                 0                 0
#> 148                1                 0                 0
#> 149                1                 0                 0
#> 150                1                 0                 0
#> 151                1                 0                 0
#> 152                1                 0                 0
#> 153                1                 0                 0
#> 154                1                 0                 0
#> 155                1                 0                 0
#> 156                1                 0                 0
#> 157                1                 0                 0
#> 158                0                 0                 1
#> 159                0                 0                 1
#> 160                1                 0                 0
#> 161                1                 0                 0
#> 162                1                 0                 0
#> 163                1                 0                 0
#> 164                0                 1                 0
#> 165                1                 0                 0
#> 166                1                 0                 0
#> 167                1                 0                 0
#> 168                0                 0                 1
#> 169                1                 0                 0
#> 170                1                 0                 0
#> 171                0                 0                 1
#> 172                0                 0                 1
#> 173                1                 0                 0
#> 174                1                 0                 0
#> 175                1                 0                 0
#> 176                1                 0                 0
#> 177                0                 0                 1
#> 178                1                 0                 0
#> 179                1                 0                 0
#> 180                0                 1                 0
#> 181                1                 0                 0
#> 182                0                 0                 1
#> 183                1                 0                 0
#> 184                1                 0                 0
#> 185                1                 0                 0
#> 186                0                 0                 1
#> 187                1                 0                 0
#> 188                1                 0                 0
#> 189                1                 0                 0
#> 190                1                 0                 0
#> 191                0                 0                 1
#> 192                1                 0                 0
#> 193                1                 0                 0
#> 194                1                 0                 0
#> 195                1                 0                 0
#> 196                0                 0                 1
#> 197                1                 0                 0
#> 198                1                 0                 0
#> 199                1                 0                 0
#> 200                0                 1                 0
#> 201                0                 0                 1
#> 202                1                 0                 0
#> 203                1                 0                 0
#> 204                1                 0                 0
#> 205                1                 0                 0
#> 206                1                 0                 0
#> 207                1                 0                 0
#> 208                0                 0                 1
#> 209                1                 0                 0
#> 210                1                 0                 0
#> 211                1                 0                 0
#> 212                1                 0                 0
#> 213                1                 0                 0
#> 214                1                 0                 0
#> 215                1                 0                 0
#> 216                1                 0                 0
#> 217                1                 0                 0
#> 218                1                 0                 0
#> 219                1                 0                 0
#> 220                1                 0                 0
#> 221                1                 0                 0
#> 222                0                 0                 1
#> 223                1                 0                 0
#> 224                1                 0                 0
#> 225                0                 0                 1
#> 226                1                 0                 0
#> 227                1                 0                 0
#> 228                0                 0                 1
#> 229                1                 0                 0
#> 230                0                 0                 1
#> 231                0                 1                 0
#> 232                0                 0                 1
#> 233                0                 0                 1
#> 234                1                 0                 0
#> 235                1                 0                 0
#> 236                0                 0                 1
#> 237                1                 0                 0
#> 238                1                 0                 0
#> 239                1                 0                 0
#> 240                1                 0                 0
#> 241                0                 0                 1
#> 242                0                 0                 1
#> 243                0                 1                 0
#> 244                1                 0                 0
#> 245                1                 0                 0
#> 246                1                 0                 0
#> 247                1                 0                 0
#> 248                1                 0                 0
#> 249                0                 0                 1
#> 250                1                 0                 0
#> 251                1                 0                 0
#> 252                1                 0                 0
#> 253                1                 0                 0
#> 254                1                 0                 0
#> 255                1                 0                 0
#> 256                1                 0                 0
#> 257                1                 0                 0
#> 258                1                 0                 0
#> 259                1                 0                 0
#> 260                0                 0                 1
#> 261                0                 0                 1
#> 262                0                 0                 1
#> 263                1                 0                 0
#> 264                1                 0                 0
#> 265                1                 0                 0
#> 266                1                 0                 0
#> 267                0                 1                 0
#> 268                0                 0                 1
#> 269                0                 0                 1
#> 270                1                 0                 0
#> 271                0                 0                 1
#> 272                1                 0                 0
#> 273                1                 0                 0
#> 274                1                 0                 0
#> 275                1                 0                 0
#> 276                1                 0                 0
#> 277                0                 0                 1
#> 278                1                 0                 0
#> 279                1                 0                 0
#> 280                0                 0                 1
#> 281                1                 0                 0
#> 282                1                 0                 0
#> 283                1                 0                 0
#> 284                0                 1                 0
#> 285                1                 0                 0
#> 286                0                 0                 1
#> 287                1                 0                 0
#> 288                1                 0                 0
#> 289                1                 0                 0
#> 290                0                 0                 1
#> 291                1                 0                 0
#> 292                1                 0                 0
#> 293                1                 0                 0
#> 294                1                 0                 0
#> 295                1                 0                 0
#> 296                1                 0                 0
#> 297                0                 0                 1
#> 298                1                 0                 0
#> 299                1                 0                 0
#> 300                1                 0                 0
#> 301                1                 0                 0
#> 302                1                 0                 0
#> 303                1                 0                 0
#> 304                1                 0                 0
#> 305                1                 0                 0
#> 306                1                 0                 0
#> 307                0                 0                 1
#> 308                1                 0                 0
#> 309                1                 0                 0
#> 310                1                 0                 0
#> 311                1                 0                 0
#> 312                0                 0                 1
#> 313                1                 0                 0
#> 314                1                 0                 0
#> 315                1                 0                 0
#> 316                1                 0                 0
#> 317                1                 0                 0
#> 318                1                 0                 0
#> 319                1                 0                 0
#> 320                1                 0                 0
#> 321                0                 0                 1
#> 322                1                 0                 0
#> 323                1                 0                 0
#> 324                0                 0                 1
#> 325                1                 0                 0
#> 326                1                 0                 0
#> 327                1                 0                 0
#> 328                1                 0                 0
#> 329                1                 0                 0
#> 330                0                 0                 1
#> 331                0                 0                 1
#> 332                1                 0                 0
#> 333                0                 0                 1
#> 334                0                 0                 1
#> 335                1                 0                 0
#> 336                1                 0                 0
#> 337                1                 0                 0
#> 338                0                 0                 1
#> 339                0                 0                 1
#> 340                1                 0                 0
#> 341                1                 0                 0
#> 342                1                 0                 0
#> 343                1                 0                 0
#> 344                1                 0                 0
#> 345                1                 0                 0
#> 346                1                 0                 0
#> 347                1                 0                 0
#> 348                1                 0                 0
#> 349                1                 0                 0
#> 350                0                 0                 1
#> 351                1                 0                 0
#> 352                1                 0                 0
#> 353                1                 0                 0
#> 354                1                 0                 0
#> 355                1                 0                 0
#> 356                1                 0                 0
#> 357                1                 0                 0
#> 358                1                 0                 0
#> 359                1                 0                 0
#> 360                1                 0                 0
#> 361                1                 0                 0
#> 362                1                 0                 0
#> 363                1                 0                 0
#> 364                0                 0                 1
#> 365                1                 0                 0
#> 366                1                 0                 0
#> 367                1                 0                 0
#> 368                1                 0                 0
#> 369                1                 0                 0
#> 370                1                 0                 0
#> 371                1                 0                 0
#> 372                0                 0                 1
#> 373                1                 0                 0
#> 374                0                 0                 1
#> 375                1                 0                 0
#> 376                1                 0                 0
#> 377                1                 0                 0
#> 378                1                 0                 0
#> 379                1                 0                 0
#> 380                1                 0                 0
#> 381                1                 0                 0
#> 382                1                 0                 0
#> 383                1                 0                 0
#> 384                1                 0                 0
#> 385                0                 0                 1
#> 386                1                 0                 0
#> 387                1                 0                 0
#> 388                1                 0                 0
#> 389                1                 0                 0
#> 390                1                 0                 0
#> 391                1                 0                 0
#> 392                0                 0                 1
#> 393                1                 0                 0
#> 394                1                 0                 0
#> 395                0                 1                 0
#> 396                1                 0                 0
#> 397                1                 0                 0
#> 398                1                 0                 0
#> 399                1                 0                 0
#> 400                1                 0                 0
#> 401                1                 0                 0
#> 402                1                 0                 0
#> 403                1                 0                 0
#> 404                0                 0                 1
#> 405                0                 0                 1
#> 406                1                 0                 0
#> 407                1                 0                 0
#> 408                1                 0                 0
#> 409                1                 0                 0
#> 410                1                 0                 0
#> 411                1                 0                 0
#> 412                1                 0                 0
#> 413                1                 0                 0
#> 414                0                 1                 0
#> 415                1                 0                 0
#> 416                0                 1                 0
#> 417                1                 0                 0
#> 418                0                 1                 0
#> 419                1                 0                 0
#> 420                1                 0                 0
#> 421                1                 0                 0
#> 422                0                 1                 0
#> 423                1                 0                 0
#> 424                0                 1                 0
#> 425                1                 0                 0
#> 426                1                 0                 0
#> 427                0                 1                 0
#> 428                1                 0                 0
#> 429                1                 0                 0
#> 430                1                 0                 0
#> 431                0                 0                 1
#> 432                1                 0                 0
#> 433                1                 0                 0
#> 434                1                 0                 0
#> 435                0                 0                 1
#> 436                1                 0                 0
#> 437                1                 0                 0
#> 438                1                 0                 0
#> 439                0                 0                 1
#> 440                0                 0                 1
#> 441                1                 0                 0
#> 442                1                 0                 0
#> 443                1                 0                 0
#> 444                1                 0                 0
#> 445                0                 0                 1
#> 446                1                 0                 0
#> 447                1                 0                 0
#> 448                1                 0                 0
#> 449                1                 0                 0
#> 450                1                 0                 0
#> 451                1                 0                 0
#> 452                1                 0                 0
#> 453                1                 0                 0
#> 454                1                 0                 0
#> 455                1                 0                 0
#> 456                1                 0                 0
#> 457                0                 0                 1
#> 458                1                 0                 0
#> 459                1                 0                 0
#> 460                1                 0                 0
#> 461                0                 0                 1
#> 462                1                 0                 0
#> 463                0                 1                 0
#> 464                1                 0                 0
#> 465                1                 0                 0
#> 466                1                 0                 0
#> 467                0                 0                 1
#> 468                1                 0                 0
#> 469                1                 0                 0
#> 470                1                 0                 0
#> 471                1                 0                 0
#> 472                0                 0                 1
#> 473                0                 0                 1
#> 474                1                 0                 0
#> 475                1                 0                 0
#> 476                1                 0                 0
#> 477                1                 0                 0
#> 478                0                 0                 1
#> 479                1                 0                 0
#> 480                1                 0                 0
#> 481                0                 0                 1
#> 482                1                 0                 0
#> 483                0                 0                 1
#> 484                1                 0                 0
#> 485                1                 0                 0
#> 486                1                 0                 0
#> 487                1                 0                 0
#> 488                1                 0                 0
#> 489                1                 0                 0
#> 490                1                 0                 0
#> 491                1                 0                 0
#> 492                1                 0                 0
#> 493                1                 0                 0
#> 494                1                 0                 0
#> 495                0                 0                 1
#> 496                1                 0                 0
#> 497                1                 0                 0
#> 498                1                 0                 0
#> 499                1                 0                 0
#> 500                1                 0                 0
#> 501                1                 0                 0
#> 502                1                 0                 0
#> 503                1                 0                 0
#> 504                1                 0                 0
#> 505                0                 0                 1
#> 506                1                 0                 0
#> 507                0                 0                 1
#> 508                1                 0                 0
#> 509                1                 0                 0
#> 510                0                 0                 1
#> 511                1                 0                 0
#> 512                1                 0                 0
#> 513                1                 0                 0
#> 514                1                 0                 0
#> 515                1                 0                 0
#> 516                0                 0                 1
#> 517                1                 0                 0
#> 518                1                 0                 0
#> 519                1                 0                 0
#> 520                0                 0                 1
#> 521                0                 0                 1
#> 522                1                 0                 0
#> 523                1                 0                 0
#> 524                1                 0                 0
#> 525                1                 0                 0
#> 526                1                 0                 0
#> 527                1                 0                 0
#> 528                0                 0                 1
#> 529                1                 0                 0
#> 530                1                 0                 0
#> 531                1                 0                 0
#> 532                0                 0                 1
#> 533                0                 0                 1
#> 534                1                 0                 0
#> 535                1                 0                 0
#> 536                1                 0                 0
#> 537                1                 0                 0
#> 538                1                 0                 0
#> 539                1                 0                 0
#> 540                1                 0                 0
#> 541                1                 0                 0
#> 542                0                 1                 0
#> 543                1                 0                 0
#> 544                1                 0                 0
#> 545                1                 0                 0
#> 546                1                 0                 0
#> 547                1                 0                 0
#> 548                0                 0                 1
#> 549                1                 0                 0
#> 550                1                 0                 0
#> 551                1                 0                 0
#> 552                1                 0                 0
#> 553                1                 0                 0
#> 554                1                 0                 0
#> 555                0                 0                 1
#> 556                1                 0                 0
#> 557                1                 0                 0
#> 558                1                 0                 0
#> 559                1                 0                 0
#> 560                1                 0                 0
#> 561                1                 0                 0
#> 562                1                 0                 0
#> 563                1                 0                 0
#> 564                1                 0                 0
#> 565                1                 0                 0
#> 566                1                 0                 0
#> 567                1                 0                 0
#> 568                1                 0                 0
#> 569                1                 0                 0
#> 570                1                 0                 0
#> 571                1                 0                 0
#> 572                1                 0                 0
#> 573                1                 0                 0
#> 574                1                 0                 0
#> 575                1                 0                 0
#> 576                1                 0                 0
#> 577                1                 0                 0
#> 578                1                 0                 0
#> 579                0                 0                 1
#> 580                1                 0                 0
#> 581                1                 0                 0
#> 582                0                 0                 1
#> 583                1                 0                 0
#> 584                0                 0                 1
#> 585                1                 0                 0
#> 586                1                 0                 0
#> 587                1                 0                 0
#> 588                1                 0                 0
#> 589                0                 0                 1
#> 590                1                 0                 0
#> 591                1                 0                 0
#> 592                1                 0                 0
#> 593                1                 0                 0
#> 594                0                 0                 1
#> 595                1                 0                 0
#> 596                1                 0                 0
#> 597                1                 0                 0
#> 598                1                 0                 0
#> 599                1                 0                 0
#> 600                1                 0                 0
#> 601                1                 0                 0
#> 602                1                 0                 0
#> 603                1                 0                 0
#> 604                0                 0                 1
#> 605                1                 0                 0
#> 606                1                 0                 0
#> 607                1                 0                 0
#> 608                1                 0                 0
#> 609                1                 0                 0
#> 610                1                 0                 0
#> 611                1                 0                 0
#> 612                1                 0                 0
#> 613                1                 0                 0
#> 614                1                 0                 0
#> 615                1                 0                 0
#> 616                0                 0                 1
#> 617                1                 0                 0
#> 618                0                 0                 1
#> 619                1                 0                 0
#> 620                1                 0                 0
#> 621                1                 0                 0
#> 622                1                 0                 0
#> 623                1                 0                 0
#> 624                1                 0                 0
#> 625                0                 1                 0
#> 626                1                 0                 0
#> 627                1                 0                 0
#> 628                1                 0                 0
#> 629                1                 0                 0
#> 630                1                 0                 0
#> 631                1                 0                 0
#> 632                1                 0                 0
#> 633                1                 0                 0
#> 634                1                 0                 0
#> 635                1                 0                 0
#> 636                1                 0                 0
#> 637                1                 0                 0
#> 638                0                 0                 1
#> 639                1                 0                 0
#> 640                1                 0                 0
#> 641                1                 0                 0
#> 642                1                 0                 0
#> 643                1                 0                 0
#> 644                1                 0                 0
#> 645                1                 0                 0
#> 646                1                 0                 0
#> 647                1                 0                 0
#> 648                1                 0                 0
#> 649                1                 0                 0
#> 650                1                 0                 0
#> 651                1                 0                 0
#> 652                1                 0                 0
#> 653                1                 0                 0
#> 654                1                 0                 0
#> 655                1                 0                 0
#> 656                1                 0                 0
#> 657                1                 0                 0
#> 658                1                 0                 0
#> 659                1                 0                 0
#> 660                0                 1                 0
#> 661                1                 0                 0
#> 662                1                 0                 0
#> 663                1                 0                 0
#> 664                1                 0                 0
#> 665                1                 0                 0
#> 666                1                 0                 0
#> 667                1                 0                 0
#> 668                1                 0                 0
#> 669                1                 0                 0
#> 670                1                 0                 0
#> 671                1                 0                 0
#> 672                1                 0                 0
#> 673                1                 0                 0
#> 674                1                 0                 0
#> 675                1                 0                 0
#> 676                1                 0                 0
#> 677                1                 0                 0
#> 678                1                 0                 0
#> 679                0                 0                 1
#> 680                1                 0                 0
#> 681                0                 0                 1
#> 682                1                 0                 0
#> 683                1                 0                 0
#> 684                1                 0                 0
#> 685                1                 0                 0
#> 686                1                 0                 0
#> 687                0                 1                 0
#> 688                1                 0                 0
#> 689                1                 0                 0
#> 690                1                 0                 0
#> 691                1                 0                 0
#> 692                1                 0                 0
#> 693                1                 0                 0
#> 694                1                 0                 0
#> 695                1                 0                 0
#> 696                1                 0                 0
#> 697                0                 0                 1
#> 698                1                 0                 0
#> 699                1                 0                 0
#> 700                1                 0                 0
#> 701                1                 0                 0
#> 702                1                 0                 0
#> 703                1                 0                 0
#> 704                1                 0                 0
#> 705                1                 0                 0
#> 706                1                 0                 0
#> 707                1                 0                 0
#> 708                1                 0                 0
#> 709                1                 0                 0
#> 710                0                 1                 0
#> 711                1                 0                 0
#> 712                1                 0                 0
#> 713                1                 0                 0
#> 714                0                 0                 1
#> 715                1                 0                 0
#> 716                1                 0                 0
#> 717                1                 0                 0
#> 718                1                 0                 0
#> 719                1                 0                 0
#> 720                1                 0                 0
#> 721                1                 0                 0
#> 722                0                 0                 1
#> 723                1                 0                 0
#> 724                1                 0                 0
#> 725                1                 0                 0
#> 726                0                 1                 0
#> 727                1                 0                 0
#> 728                1                 0                 0
#> 729                1                 0                 0
#> 730                1                 0                 0
#> 731                1                 0                 0
#> 732                0                 0                 1
#> 733                1                 0                 0
#> 734                0                 0                 1
#> 735                0                 0                 1
#> 736                1                 0                 0
#> 737                1                 0                 0
#> 738                1                 0                 0
#> 739                1                 0                 0
#> 740                1                 0                 0
#> 741                0                 0                 1
#> 742                1                 0                 0
#> 743                1                 0                 0
#> 744                1                 0                 0
#> 745                1                 0                 0
#> 746                1                 0                 0
#> 747                1                 0                 0
#> 748                1                 0                 0
#> 749                1                 0                 0
#> 750                0                 0                 1
#> 751                1                 0                 0
#> 752                1                 0                 0
#> 753                1                 0                 0
#> 754                1                 0                 0
#> 755                1                 0                 0
#> 756                1                 0                 0
#> 757                1                 0                 0
#> 758                1                 0                 0
#> 759                1                 0                 0
#> 760                1                 0                 0
#> 761                1                 0                 0
#> 762                1                 0                 0
#> 763                1                 0                 0
#> 764                1                 0                 0
#> 765                1                 0                 0
#> 766                1                 0                 0
#> 767                1                 0                 0
#> 768                0                 0                 1
#> 769                1                 0                 0
#> 770                0                 1                 0
#> 771                1                 0                 0
#> 772                1                 0                 0
#> 773                0                 0                 1
#> 774                0                 1                 0
#> 775                1                 0                 0
#> 776                1                 0                 0
#> 777                1                 0                 0
#> 778                1                 0                 0
#> 779                1                 0                 0
#> 780                1                 0                 0
#> 781                0                 0                 1
#> 782                1                 0                 0
#> 783                1                 0                 0
#> 784                1                 0                 0
#> 785                0                 0                 1
#> 786                1                 0                 0
#> 787                1                 0                 0
#> 788                1                 0                 0
#> 789                1                 0                 0
#> 790                1                 0                 0
#> 791                1                 0                 0
#> 792                1                 0                 0
#> 793                1                 0                 0
#> 794                1                 0                 0
#> 795                1                 0                 0
#> 796                1                 0                 0
#> 797                1                 0                 0
#> 798                1                 0                 0
#> 799                1                 0                 0
#> 800                1                 0                 0
#> 801                0                 0                 1
#> 802                1                 0                 0
#> 803                1                 0                 0
#> 804                1                 0                 0
#> 805                1                 0                 0
#> 806                0                 1                 0
#> 807                1                 0                 0
#> 808                1                 0                 0
#> 809                1                 0                 0
#> 810                1                 0                 0
#> 811                1                 0                 0
#> 812                1                 0                 0
#> 813                1                 0                 0
#> 814                1                 0                 0
#> 815                1                 0                 0
#> 816                1                 0                 0
#> 817                1                 0                 0
#> 818                1                 0                 0
#> 819                1                 0                 0
#> 820                1                 0                 0
#> 821                1                 0                 0
#> 822                1                 0                 0
#> 823                1                 0                 0
#> 824                1                 0                 0
#> 825                1                 0                 0
#> 826                0                 0                 1
#> 827                1                 0                 0
#> 828                1                 0                 0
#> 829                1                 0                 0
#> 830                1                 0                 0
#> 831                1                 0                 0
#> 832                1                 0                 0
#> 833                1                 0                 0
#> 834                1                 0                 0
#> 835                1                 0                 0
#> 836                1                 0                 0
#> 837                1                 0                 0
#> 838                1                 0                 0
#> 839                1                 0                 0
#> 840                0                 1                 0
#> 841                1                 0                 0
#> 842                0                 0                 1
#> 843                1                 0                 0
#> 844                1                 0                 0
#> 845                0                 0                 1
#> 846                1                 0                 0
#> 847                1                 0                 0
#> 848                1                 0                 0
#> 849                1                 0                 0
#> 850                0                 0                 1
#> 851                1                 0                 0
#> 852                0                 1                 0
#> 853                1                 0                 0
#> 854                1                 0                 0
#> 855                1                 0                 0
#> 856                1                 0                 0
#> 857                1                 0                 0
#> 858                0                 0                 1
#> 859                1                 0                 0
#> 860                1                 0                 0
#> 861                1                 0                 0
#> 862                1                 0                 0
#> 863                0                 0                 1
#> 864                1                 0                 0
#> 865                1                 0                 0
#> 866                0                 0                 1
#> 867                1                 0                 0
#> 868                1                 0                 0
#> 869                1                 0                 0
#> 870                1                 0                 0
#> 871                1                 0                 0
#> 872                0                 0                 1
#> 873                1                 0                 0
#> 874                1                 0                 0
#> 875                1                 0                 0
#> 876                0                 0                 1
#> 877                1                 0                 0
#> 878                1                 0                 0
#> 879                0                 1                 0
#> 880                1                 0                 0
#> 881                1                 0                 0
#> 882                1                 0                 0
#> 883                1                 0                 0
#> 884                0                 0                 1
#> 885                1                 0                 0
#> 886                1                 0                 0
#> 887                1                 0                 0
#> 888                1                 0                 0
#> 889                1                 0                 0
#> 890                1                 0                 0
#> 891                1                 0                 0
#> 892                1                 0                 0
#> 893                1                 0                 0
#> 894                1                 0                 0
#> 895                0                 0                 1
#> 896                1                 0                 0
#> 897                1                 0                 0
#> 898                1                 0                 0
#> 899                0                 0                 1
#> 900                1                 0                 0
#> 901                1                 0                 0
#> 902                1                 0                 0
#> 903                1                 0                 0
#> 904                1                 0                 0
#> 905                0                 1                 0
#> 906                1                 0                 0
#> 907                1                 0                 0
#> 908                0                 0                 1
#> 909                1                 0                 0
#> 910                0                 0                 1
#> 911                1                 0                 0
#> 912                1                 0                 0
#> 913                1                 0                 0
#> 914                0                 0                 1
#> 915                1                 0                 0
#> 916                0                 0                 1
#> 917                1                 0                 0
#> 918                1                 0                 0
#> 919                1                 0                 0
#> 920                1                 0                 0
#> 921                1                 0                 0
#> 922                1                 0                 0
#> 923                1                 0                 0
#> 924                0                 0                 1
#> 925                1                 0                 0
#> 926                1                 0                 0
#> 927                1                 0                 0
#> 928                1                 0                 0
#> 929                0                 1                 0
#> 930                1                 0                 0
#> 931                1                 0                 0
#> 932                1                 0                 0
#> 933                1                 0                 0
#> 934                1                 0                 0
#> 935                1                 0                 0
#> 936                1                 0                 0
#> 937                0                 0                 1
#> 938                1                 0                 0
#> 939                1                 0                 0
#> 940                1                 0                 0
#> 941                1                 0                 0
#> 942                1                 0                 0
#> 943                1                 0                 0
#> 944                1                 0                 0
#> 945                1                 0                 0
#> 946                1                 0                 0
#> 947                0                 0                 1
#> 948                1                 0                 0
#> 949                1                 0                 0
#> 950                0                 0                 1
#> 951                1                 0                 0
#> 952                1                 0                 0
#> 953                1                 0                 0
#> 954                0                 0                 1
#> 955                1                 0                 0
#> 956                1                 0                 0
#> 957                1                 0                 0
#> 958                1                 0                 0
#> 959                0                 0                 1
#> 960                0                 1                 0
#> 961                0                 0                 1
#> 962                1                 0                 0
#> 963                1                 0                 0
#> 964                1                 0                 0
#> 965                1                 0                 0
#> 966                1                 0                 0
#> 967                0                 0                 1
#> 968                0                 0                 1
#> 969                1                 0                 0
#> 970                1                 0                 0
#> 971                0                 0                 1
#> 972                1                 0                 0
#> 973                0                 0                 1
#> 974                1                 0                 0
#> 975                1                 0                 0
#> 976                1                 0                 0
#> 977                0                 0                 1
#> 978                1                 0                 0
#> 979                1                 0                 0
#> 980                1                 0                 0
#> 981                0                 0                 1
#> 982                1                 0                 0
#> 983                1                 0                 0
#> 984                1                 0                 0
#> 985                1                 0                 0
#> 986                1                 0                 0
#> 987                1                 0                 0
#> 988                1                 0                 0
#> 989                1                 0                 0
#> 990                1                 0                 0
#> 991                1                 0                 0
#> 992                1                 0                 0
#> 993                1                 0                 0
#> 994                1                 0                 0
#> 995                1                 0                 0
#> 996                1                 0                 0
#> 997                0                 0                 1
#> 998                1                 0                 0
#> 999                0                 0                 1
#> 1000               1                 0                 0
#> 1001               0                 0                 1
#> 1002               1                 0                 0
#> 1003               0                 0                 1
#> 1004               1                 0                 0
#> 1005               0                 0                 1
#> 1006               1                 0                 0
#> 1007               1                 0                 0
#> 1008               1                 0                 0
#> 1009               1                 0                 0
#> 1010               1                 0                 0
#> 1011               1                 0                 0
#> 1012               1                 0                 0
#> 1013               1                 0                 0
#> 1014               1                 0                 0
#> 1015               1                 0                 0
#> 1016               0                 0                 1
#> 1017               1                 0                 0
#> 1018               1                 0                 0
#> 1019               1                 0                 0
#> 1020               1                 0                 0
#> 1021               1                 0                 0
#> 1022               0                 1                 0
#> 1023               1                 0                 0
#> 1024               0                 1                 0
#> 1025               1                 0                 0
#> 1026               1                 0                 0
#> 1027               1                 0                 0
#> 1028               1                 0                 0
#> 1029               1                 0                 0
#> 1030               1                 0                 0
#> 1031               1                 0                 0
#> 1032               1                 0                 0
#> 1033               1                 0                 0
#> 1034               0                 0                 1
#> 1035               1                 0                 0
#> 1036               1                 0                 0
#> 1037               1                 0                 0
#> 1038               0                 1                 0
#> 1039               1                 0                 0
#> 1040               1                 0                 0
#> 1041               1                 0                 0
#> 1042               1                 0                 0
#> 1043               1                 0                 0
#> 1044               1                 0                 0
#> 1045               1                 0                 0
#> 1046               1                 0                 0
#> 1047               1                 0                 0
#> 1048               1                 0                 0
#> 1049               1                 0                 0
#> 1050               1                 0                 0
#> 1051               1                 0                 0
#> 1052               0                 0                 1
#> 1053               0                 0                 1
#> 1054               0                 1                 0
#> 1055               1                 0                 0
#> 1056               1                 0                 0
#> 1057               0                 1                 0
#> 1058               1                 0                 0
#> 1059               1                 0                 0
#> 1060               1                 0                 0
#> 1061               1                 0                 0
#> 1062               1                 0                 0
#> 1063               1                 0                 0
#> 1064               1                 0                 0
#> 1065               0                 0                 1
#> 1066               1                 0                 0
#> 1067               1                 0                 0
#> 1068               1                 0                 0
#> 1069               0                 0                 1
#> 1070               1                 0                 0
#> 1071               1                 0                 0
#> 1072               1                 0                 0
#> 1073               1                 0                 0
#> 1074               1                 0                 0
#> 1075               1                 0                 0
#> 1076               1                 0                 0
#> 1077               1                 0                 0
#> 1078               0                 0                 1
#> 1079               1                 0                 0
#> 1080               0                 0                 1
#> 1081               1                 0                 0
#> 1082               1                 0                 0
#> 1083               1                 0                 0
#> 1084               1                 0                 0
#> 1085               1                 0                 0
#> 1086               1                 0                 0
#> 1087               0                 0                 1
#> 1088               1                 0                 0
#> 1089               0                 0                 1
#> 1090               1                 0                 0
#> 1091               1                 0                 0
#> 1092               1                 0                 0
#> 1093               1                 0                 0
#> 1094               1                 0                 0
#> 1095               1                 0                 0
#> 1096               0                 1                 0
#> 1097               1                 0                 0
#> 1098               1                 0                 0
#> 1099               1                 0                 0
#> 1100               1                 0                 0
#> 1101               1                 0                 0
#> 1102               1                 0                 0
#> 1103               1                 0                 0
#> 1104               0                 0                 1
#> 1105               0                 0                 1
#> 1106               0                 0                 1
#> 1107               1                 0                 0
#> 1108               1                 0                 0
#> 1109               1                 0                 0
#> 1110               0                 0                 1
#> 1111               1                 0                 0
#> 1112               1                 0                 0
#> 1113               0                 0                 1
#> 1114               1                 0                 0
#> 1115               1                 0                 0
#> 1116               1                 0                 0
#> 1117               1                 0                 0
#> 1118               1                 0                 0
#> 1119               0                 0                 1
#> 1120               1                 0                 0
#> 1121               1                 0                 0
#> 1122               1                 0                 0
#> 1123               1                 0                 0
#> 1124               1                 0                 0
#> 1125               0                 0                 1
#> 1126               1                 0                 0
#> 1127               1                 0                 0
#> 1128               1                 0                 0
#> 1129               1                 0                 0
#> 1130               1                 0                 0
#> 1131               1                 0                 0
#> 1132               0                 0                 1
#> 1133               0                 0                 1
#> 1134               1                 0                 0
#> 1135               0                 1                 0
#> 1136               1                 0                 0
#> 1137               1                 0                 0
#> 1138               1                 0                 0
#> 1139               1                 0                 0
#> 1140               1                 0                 0
#> 1141               1                 0                 0
#> 1142               1                 0                 0
#> 1143               0                 0                 1
#> 1144               1                 0                 0
#> 1145               1                 0                 0
#> 1146               1                 0                 0
#> 1147               1                 0                 0
#> 1148               1                 0                 0
#> 1149               1                 0                 0
#> 1150               0                 0                 1
#> 1151               1                 0                 0
#> 1152               1                 0                 0
#> 1153               1                 0                 0
#> 1154               1                 0                 0
#> 1155               1                 0                 0
#> 1156               1                 0                 0
#> 1157               1                 0                 0
#> 1158               1                 0                 0
#> 1159               1                 0                 0
#> 1160               1                 0                 0
#> 1161               1                 0                 0
#> 1162               1                 0                 0
#> 1163               0                 1                 0
#> 1164               0                 0                 1
#> 1165               1                 0                 0
#> 1166               1                 0                 0
#> 1167               1                 0                 0
#> 1168               1                 0                 0
#> 1169               1                 0                 0
#> 1170               1                 0                 0
#> 1171               0                 0                 1
#> 1172               1                 0                 0
#> 1173               1                 0                 0
#> 1174               1                 0                 0
#> 1175               1                 0                 0
#> 1176               1                 0                 0
#> 1177               0                 0                 1
#> 1178               0                 1                 0
#> 1179               1                 0                 0
#> 1180               1                 0                 0
#> 1181               1                 0                 0
#> 1182               1                 0                 0
#> 1183               1                 0                 0
#> 1184               0                 1                 0
#> 1185               0                 0                 1
#> 1186               0                 0                 1
#> 1187               1                 0                 0
#> 1188               0                 1                 0
#> 1189               1                 0                 0
#> 1190               0                 1                 0
#> 1191               1                 0                 0
#> 1192               1                 0                 0
#> 1193               1                 0                 0
#> 1194               1                 0                 0
#> 1195               1                 0                 0
#> 1196               1                 0                 0
#> 1197               1                 0                 0
#> 1198               1                 0                 0
#> 1199               1                 0                 0
#> 1200               1                 0                 0
#> 1201               1                 0                 0
#> 1202               1                 0                 0
#> 1203               1                 0                 0
#> 1204               0                 0                 1
#> 1205               1                 0                 0
#> 1206               0                 1                 0
#> 1207               1                 0                 0
#> 1208               1                 0                 0
#> 1209               1                 0                 0
#> 1210               1                 0                 0
#> 1211               1                 0                 0
#> 1212               1                 0                 0
#> 1213               1                 0                 0
#> 1214               1                 0                 0
#> 1215               1                 0                 0
#> 1216               1                 0                 0
#> 1217               1                 0                 0
#> 1218               1                 0                 0
#> 1219               1                 0                 0
#> 1220               1                 0                 0
#> 1221               1                 0                 0
#> 1222               1                 0                 0
#> 1223               1                 0                 0
#> 1224               1                 0                 0
#> 1225               0                 0                 1
#> 1226               1                 0                 0
#> 1227               0                 0                 1
#> 1228               1                 0                 0
#> 1229               1                 0                 0
#> 1230               1                 0                 0
#> 1231               0                 0                 1
#> 1232               1                 0                 0
#> 1233               1                 0                 0
#> 1234               1                 0                 0
#> 1235               1                 0                 0
#> 1236               1                 0                 0
#> 1237               0                 1                 0
#> 1238               1                 0                 0
#> 1239               0                 0                 1
#> 1240               1                 0                 0
#> 1241               1                 0                 0
#> 1242               0                 0                 1
#> 1243               1                 0                 0
#> 1244               1                 0                 0
#> 1245               0                 0                 1
#> 1246               1                 0                 0
#> 1247               1                 0                 0
#> 1248               1                 0                 0
#> 1249               1                 0                 0
#> 1250               0                 1                 0
#> 1251               1                 0                 0
#> 1252               1                 0                 0
#> 1253               1                 0                 0
#> 1254               1                 0                 0
#> 1255               1                 0                 0
#> 1256               1                 0                 0
#> 1257               1                 0                 0
#> 1258               0                 1                 0
#> 1259               0                 0                 1
#> 1260               1                 0                 0
#> 1261               1                 0                 0
#> 1262               0                 0                 1
#> 1263               1                 0                 0
#> 1264               0                 0                 1
#> 1265               1                 0                 0
#> 1266               1                 0                 0
#> 1267               0                 0                 1
#> 1268               1                 0                 0
#> 1269               1                 0                 0
#> 1270               1                 0                 0
#> 1271               1                 0                 0
#> 1272               1                 0                 0
#> 1273               1                 0                 0
#> 1274               1                 0                 0
#> 1275               1                 0                 0
#> 1276               1                 0                 0
#> 1277               1                 0                 0
#> 1278               1                 0                 0
#> 1279               1                 0                 0
#> 1280               1                 0                 0
#> 1281               1                 0                 0
#> 1282               1                 0                 0
#> 1283               1                 0                 0
#> 1284               1                 0                 0
#> 1285               1                 0                 0
#> 1286               0                 0                 1
#> 1287               1                 0                 0
#> 1288               1                 0                 0
#> 1289               1                 0                 0
#> 1290               1                 0                 0
#> 1291               1                 0                 0
#> 1292               1                 0                 0
#> 1293               0                 1                 0
#> 1294               1                 0                 0
#> 1295               0                 0                 1
#> 1296               0                 1                 0
#> 1297               1                 0                 0
#> 1298               1                 0                 0
#> 1299               1                 0                 0
#> 1300               1                 0                 0
#> 1301               1                 0                 0
#> 1302               1                 0                 0
#> 1303               1                 0                 0
#> 1304               1                 0                 0
#> 1305               1                 0                 0
#> 1306               1                 0                 0
#> 1307               1                 0                 0
#> 1308               1                 0                 0
#> 1309               1                 0                 0
#> 1310               1                 0                 0
#> 1311               1                 0                 0
#> 1312               1                 0                 0
#> 1313               1                 0                 0
#> 1314               1                 0                 0
#> 1315               1                 0                 0
#> 1316               1                 0                 0
#> 1317               1                 0                 0
#> 1318               1                 0                 0
#> 1319               0                 0                 1
#> 1320               1                 0                 0
#> 1321               1                 0                 0
#> 1322               1                 0                 0
#> 1323               0                 1                 0
#> 1324               1                 0                 0
#> 1325               1                 0                 0
#> 1326               1                 0                 0
#> 1327               0                 0                 1
#> 1328               1                 0                 0
#> 1329               0                 1                 0
#> 1330               1                 0                 0
#> 1331               1                 0                 0
#> 1332               1                 0                 0
#> 1333               1                 0                 0
#> 1334               1                 0                 0
#> 1335               0                 0                 1
#> 1336               1                 0                 0
#> 1337               1                 0                 0
#> 1338               0                 0                 1
#> 1339               1                 0                 0
#> 1340               1                 0                 0
#> 1341               1                 0                 0
#> 1342               1                 0                 0
#> 1343               1                 0                 0
#> 1344               1                 0                 0
#> 1345               1                 0                 0
#> 1346               1                 0                 0
#> 1347               1                 0                 0
#> 1348               0                 1                 0
#> 1349               1                 0                 0
#> 1350               1                 0                 0
#> 1351               0                 1                 0
#> 1352               0                 0                 1
#> 1353               1                 0                 0
#> 1354               1                 0                 0
#> 1355               1                 0                 0
#> 1356               1                 0                 0
#> 1357               1                 0                 0
#> 1358               1                 0                 0
#> 1359               1                 0                 0
#> 1360               1                 0                 0
#> 1361               1                 0                 0
#> 1362               1                 0                 0
#> 1363               1                 0                 0
#> 1364               0                 0                 1
#> 1365               0                 0                 1
#> 1366               1                 0                 0
#> 1367               0                 0                 1
#> 1368               1                 0                 0
#> 1369               0                 0                 1
#> 1370               1                 0                 0
#> 1371               1                 0                 0
#> 1372               1                 0                 0
#> 1373               1                 0                 0
#> 1374               1                 0                 0
#> 1375               1                 0                 0
#> 1376               0                 0                 1
#> 1377               1                 0                 0
#> 1378               1                 0                 0
#> 1379               1                 0                 0
#> 1380               1                 0                 0
#> 1381               1                 0                 0
#> 1382               1                 0                 0
#> 1383               1                 0                 0
#> 1384               1                 0                 0
#> 1385               1                 0                 0
#> 1386               1                 0                 0
#> 1387               1                 0                 0
#> 1388               1                 0                 0
#> 1389               1                 0                 0
#> 1390               1                 0                 0
#> 1391               1                 0                 0
#> 1392               1                 0                 0
#> 1393               1                 0                 0
#> 1394               1                 0                 0
#> 1395               1                 0                 0
#> 1396               1                 0                 0
#> 1397               1                 0                 0
#> 1398               1                 0                 0
#> 1399               0                 0                 1
#> 1400               1                 0                 0
#> 1401               1                 0                 0
#> 1402               1                 0                 0
#> 1403               1                 0                 0
#> 1404               1                 0                 0
#> 1405               1                 0                 0
#> 1406               1                 0                 0
#> 1407               1                 0                 0
#> 1408               1                 0                 0
#> 1409               1                 0                 0
#> 1410               1                 0                 0
#> 1411               1                 0                 0
#> 1412               1                 0                 0
#> 1413               1                 0                 0
#> 1414               1                 0                 0
#> 1415               1                 0                 0
#> 1416               1                 0                 0
#> 1417               1                 0                 0
#> 1418               1                 0                 0
#> 1419               1                 0                 0
#> 1420               1                 0                 0
#> 1421               1                 0                 0
#> 1422               1                 0                 0
#> 1423               1                 0                 0
#> 1424               1                 0                 0
#> 1425               1                 0                 0
#> 1426               1                 0                 0
#> 1427               0                 0                 1
#> 1428               1                 0                 0
#> 1429               0                 0                 1
#> 1430               0                 0                 1
#> 1431               1                 0                 0
#> 1432               0                 0                 1
#> 1433               1                 0                 0
#> 1434               1                 0                 0
#> 1435               1                 0                 0
#> 1436               1                 0                 0
#> 1437               1                 0                 0
#> 1438               1                 0                 0
#> 1439               1                 0                 0
#> 1440               0                 1                 0
#> 1441               1                 0                 0
#> 1442               1                 0                 0
#> 1443               1                 0                 0
#> 1444               1                 0                 0
#> 1445               1                 0                 0
#> 1446               1                 0                 0
#> 1447               1                 0                 0
#> 1448               1                 0                 0
#> 1449               1                 0                 0
#> 1450               1                 0                 0
#> 1451               1                 0                 0
#> 1452               1                 0                 0
#> 1453               1                 0                 0
#> 1454               1                 0                 0
#> 1455               1                 0                 0
#> 1456               1                 0                 0
#> 1457               1                 0                 0
#> 1458               1                 0                 0
#> 1459               1                 0                 0
#> 1460               1                 0                 0
#> 1461               1                 0                 0
#> 1462               1                 0                 0
#> 1463               1                 0                 0
#> 1464               1                 0                 0
#> 1465               0                 1                 0
#> 1466               0                 0                 1
#> 1467               1                 0                 0
#> 1468               1                 0                 0
#> 1469               1                 0                 0
#> 1470               0                 0                 1
#> 1471               1                 0                 0
#> 1472               0                 0                 1
#> 1473               1                 0                 0
#> 1474               1                 0                 0
#> 1475               1                 0                 0
#> 1476               1                 0                 0
#> 1477               0                 0                 1
#> 1478               1                 0                 0
#> 1479               1                 0                 0
#> 1480               1                 0                 0
#> 1481               0                 0                 1
#> 1482               1                 0                 0
#> 1483               1                 0                 0
#> 1484               1                 0                 0
#> 1485               1                 0                 0
#> 1486               1                 0                 0
#> 1487               1                 0                 0
#> 1488               1                 0                 0
#> 1489               1                 0                 0
#> 1490               1                 0                 0
#> 1491               1                 0                 0
#> 1492               1                 0                 0
#> 1493               1                 0                 0
#> 1494               1                 0                 0
#> 1495               0                 0                 1
#> 1496               0                 0                 1
#> 1497               0                 0                 1
#> 1498               1                 0                 0
#> 1499               1                 0                 0
#> 1500               1                 0                 0
#> 1501               1                 0                 0
#> 1502               1                 0                 0
#> 1503               1                 0                 0
#> 1504               1                 0                 0
#> 1505               1                 0                 0
#> 1506               0                 0                 1
#> 1507               1                 0                 0
#> 1508               1                 0                 0
#> 1509               1                 0                 0
#> 1510               1                 0                 0
#> 1511               0                 0                 1
#> 1512               1                 0                 0
#> 1513               1                 0                 0
#> 1514               1                 0                 0
#> 1515               1                 0                 0
#> 1516               1                 0                 0
#> 1517               1                 0                 0
#> 1518               1                 0                 0
#> 1519               1                 0                 0
#> 1520               1                 0                 0
#> 1521               0                 0                 1
#> 1522               1                 0                 0
#> 1523               0                 1                 0
#> 1524               1                 0                 0
#> 1525               1                 0                 0
#> 1526               1                 0                 0
#> 1527               0                 0                 1
#> 1528               0                 0                 1
#> 1529               1                 0                 0
#> 1530               1                 0                 0
#> 1531               0                 1                 0
#> 1532               1                 0                 0
#> 1533               1                 0                 0
#> 1534               1                 0                 0
#> 1535               0                 0                 1
#> 1536               1                 0                 0
#> 1537               1                 0                 0
#> 1538               1                 0                 0
#> 1539               0                 0                 1
#> 1540               1                 0                 0
#> 1541               0                 0                 1
#> 1542               1                 0                 0
#> 1543               1                 0                 0
#> 1544               1                 0                 0
#> 1545               1                 0                 0
#> 1546               1                 0                 0
#> 1547               0                 0                 1
#> 1548               0                 0                 1
#> 1549               1                 0                 0
#> 1550               1                 0                 0
#> 1551               1                 0                 0
#> 1552               0                 0                 1
#> 1553               1                 0                 0
#> 1554               1                 0                 0
#> 1555               0                 0                 1
#> 1556               1                 0                 0
#> 1557               1                 0                 0
#> 1558               0                 0                 1
#> 1559               0                 0                 1
#> 1560               0                 0                 1
#> 1561               1                 0                 0
#> 1562               1                 0                 0
#> 1563               0                 0                 1
#> 1564               1                 0                 0
#> 1565               1                 0                 0
#> 1566               0                 1                 0
#> 1567               1                 0                 0
#> 1568               0                 0                 1
#> 1569               0                 0                 1
#> 1570               0                 0                 1
#> 1571               1                 0                 0
#> 1572               0                 0                 1
#> 1573               1                 0                 0
#> 1574               1                 0                 0
#> 1575               0                 0                 1
#> 1576               1                 0                 0
#> 1577               0                 1                 0
#> 1578               0                 0                 1
#> 1579               1                 0                 0
#> 1580               1                 0                 0
#> 1581               1                 0                 0
#> 1582               0                 1                 0
#> 1583               0                 0                 1
#> 1584               1                 0                 0
#> 1585               1                 0                 0
#> 1586               1                 0                 0
#> 1587               0                 0                 1
#> 1588               1                 0                 0
#> 1589               0                 0                 1
#> 1590               0                 0                 1
#> 1591               1                 0                 0
#> 1592               1                 0                 0
#> 1593               1                 0                 0
#> 1594               1                 0                 0
#> 1595               0                 0                 1
#> 1596               1                 0                 0
#> 1597               1                 0                 0
#> 1598               0                 0                 1
#> 1599               1                 0                 0
#> 1600               1                 0                 0
#> 1601               1                 0                 0
#> 1602               1                 0                 0
#> 1603               1                 0                 0
#> 1604               1                 0                 0
#> 1605               1                 0                 0
#> 1606               1                 0                 0
#> 1607               0                 0                 1
#> 1608               1                 0                 0
#> 1609               1                 0                 0
#> 1610               1                 0                 0
#> 1611               0                 0                 1
#> 1612               1                 0                 0
#> 1613               1                 0                 0
#> 1614               1                 0                 0
#> 1615               1                 0                 0
#> 1616               1                 0                 0
#> 1617               1                 0                 0
#> 1618               1                 0                 0
#> 1619               1                 0                 0
#> 1620               1                 0                 0
#> 1621               1                 0                 0
#> 1622               0                 0                 1
#> 1623               1                 0                 0
#> 1624               1                 0                 0
#> 1625               1                 0                 0
#> 1626               1                 0                 0
#> 1627               1                 0                 0
#> 1628               1                 0                 0
#> 1629               1                 0                 0
#> 1630               1                 0                 0
#> 1631               1                 0                 0
#> 1632               1                 0                 0
#> 1633               1                 0                 0
#> 1634               1                 0                 0
#> 1635               1                 0                 0
#> 1636               0                 1                 0
#> 1637               0                 0                 1
#> 1638               1                 0                 0
#> 1639               1                 0                 0
#> 1640               1                 0                 0
#> 1641               0                 1                 0
#> 1642               1                 0                 0
#> 1643               1                 0                 0
#> 1644               1                 0                 0
#> 1645               0                 0                 1
#> 1646               1                 0                 0
#> 1647               0                 0                 1
#> 1648               0                 0                 1
#> 1649               1                 0                 0
#> 1650               1                 0                 0
#> 1651               1                 0                 0
#> 1652               1                 0                 0
#> 1653               1                 0                 0
#> 1654               1                 0                 0
#> 1655               1                 0                 0
#> 1656               1                 0                 0
#> 1657               1                 0                 0
#> 1658               1                 0                 0
#> 1659               1                 0                 0
#> 1660               1                 0                 0
#> 1661               0                 0                 1
#> 1662               0                 0                 1
#> 1663               0                 0                 1
#> 1664               1                 0                 0
#> 1665               1                 0                 0
#> 1666               0                 1                 0
#> 1667               1                 0                 0
#> 1668               1                 0                 0
#> 1669               1                 0                 0
#> 1670               1                 0                 0
#> 1671               1                 0                 0
#> 1672               1                 0                 0
#> 1673               1                 0                 0
#> 1674               1                 0                 0
#> 1675               1                 0                 0
#> 1676               1                 0                 0
#> 1677               1                 0                 0
#> 1678               1                 0                 0
#> 1679               1                 0                 0
#> 1680               1                 0                 0
#> 1681               1                 0                 0
#> 1682               1                 0                 0
#> 1683               1                 0                 0
#> 1684               1                 0                 0
#> 1685               1                 0                 0
#> 1686               1                 0                 0
#> 1687               1                 0                 0
#> 1688               0                 0                 1
#> 1689               1                 0                 0
#> 1690               1                 0                 0
#> 1691               1                 0                 0
#> 1692               1                 0                 0
#> 1693               1                 0                 0
#> 1694               0                 1                 0
#> 1695               1                 0                 0
#> 1696               1                 0                 0
#> 1697               1                 0                 0
#> 1698               1                 0                 0
#> 1699               1                 0                 0
#> 1700               1                 0                 0
#> 1701               1                 0                 0
#> 1702               1                 0                 0
#> 1703               1                 0                 0
#> 1704               0                 0                 1
#> 1705               1                 0                 0
#> 1706               1                 0                 0
#> 1707               1                 0                 0
#> 1708               0                 0                 1
#> 1709               1                 0                 0
#> 1710               1                 0                 0
#> 1711               0                 0                 1
#> 1712               0                 0                 1
#> 1713               1                 0                 0
#> 1714               1                 0                 0
#> 1715               1                 0                 0
#> 1716               1                 0                 0
#> 1717               1                 0                 0
#> 1718               1                 0                 0
#> 1719               0                 0                 1
#> 1720               1                 0                 0
#> 1721               1                 0                 0
#> 1722               1                 0                 0
#> 1723               1                 0                 0
#> 1724               1                 0                 0
#> 1725               1                 0                 0
#> 1726               1                 0                 0
#> 1727               0                 0                 1
#> 1728               1                 0                 0
#> 1729               1                 0                 0
#> 1730               1                 0                 0
#> 1731               1                 0                 0
#> 1732               1                 0                 0
#> 1733               0                 0                 1
#> 1734               1                 0                 0
#> 1735               1                 0                 0
#> 1736               1                 0                 0
#> 1737               0                 0                 1
#> 1738               1                 0                 0
#> 1739               1                 0                 0
#> 1740               1                 0                 0
#> 1741               1                 0                 0
#> 1742               1                 0                 0
#> 1743               1                 0                 0
#> 1744               1                 0                 0
#> 1745               1                 0                 0
#> 1746               1                 0                 0
#> 1747               1                 0                 0
#> 1748               1                 0                 0
#> 1749               1                 0                 0
#> 1750               0                 0                 1
#> 1751               1                 0                 0
#> 1752               1                 0                 0
#> 1753               1                 0                 0
#> 1754               1                 0                 0
#> 1755               1                 0                 0
#> 1756               1                 0                 0
#> 1757               1                 0                 0
#> 1758               1                 0                 0
#> 1759               1                 0                 0
#> 1760               1                 0                 0
#> 1761               1                 0                 0
#> 1762               1                 0                 0
#> 1763               0                 0                 1
#> 1764               1                 0                 0
#> 1765               1                 0                 0
#> 1766               1                 0                 0
#> 1767               1                 0                 0
#> 1768               0                 0                 1
#> 1769               1                 0                 0
#> 1770               1                 0                 0
#> 1771               1                 0                 0
#> 1772               1                 0                 0
#> 1773               1                 0                 0
#> 1774               0                 1                 0
#> 1775               1                 0                 0
#> 1776               0                 0                 1
#> 1777               1                 0                 0
#> 1778               1                 0                 0
#> 1779               1                 0                 0
#> 1780               1                 0                 0
#> 1781               0                 0                 1
#> 1782               1                 0                 0
#> 1783               1                 0                 0
#> 1784               1                 0                 0
#> 1785               1                 0                 0
#> 1786               1                 0                 0
#> 1787               1                 0                 0
#> 1788               0                 0                 1
#> 1789               1                 0                 0
#> 1790               1                 0                 0
#> 1791               1                 0                 0
#> 1792               1                 0                 0
#> 1793               1                 0                 0
#> 1794               1                 0                 0
#> 1795               1                 0                 0
#> 1796               1                 0                 0
#> 1797               1                 0                 0
#> 1798               1                 0                 0
#> 1799               1                 0                 0
#> 1800               1                 0                 0
#> 1801               1                 0                 0
#> 1802               1                 0                 0
#> 1803               1                 0                 0
#> 1804               1                 0                 0
#> 1805               1                 0                 0
#> 1806               1                 0                 0
#> 1807               0                 1                 0
#> 1808               1                 0                 0
#> 1809               1                 0                 0
#> 1810               0                 0                 1
#> 1811               1                 0                 0
#> 1812               1                 0                 0
#> 1813               1                 0                 0
#> 1814               1                 0                 0
#> 1815               1                 0                 0
#> 1816               0                 0                 1
#> 1817               1                 0                 0
#> 1818               0                 1                 0
#> 1819               1                 0                 0
#> 1820               0                 1                 0
#> 1821               1                 0                 0
#> 1822               1                 0                 0
#> 1823               1                 0                 0
#> 1824               1                 0                 0
#> 1825               0                 0                 1
#> 1826               1                 0                 0
#> 1827               1                 0                 0
#> 1828               1                 0                 0
#> 1829               1                 0                 0
#> 1830               1                 0                 0
#> 1831               1                 0                 0
#> 1832               1                 0                 0
#> 1833               1                 0                 0
#> 1834               1                 0                 0
#> 1835               1                 0                 0
#> 1836               1                 0                 0
#> 1837               1                 0                 0
#> 1838               1                 0                 0
#> 1839               0                 0                 1
#> 1840               0                 0                 1
#> 1841               1                 0                 0
#> 1842               1                 0                 0
#> 1843               1                 0                 0
#> 1844               1                 0                 0
#> 1845               1                 0                 0
#> 1846               1                 0                 0
#> 1847               1                 0                 0
#> 1848               1                 0                 0
#> 1849               1                 0                 0
#> 1850               0                 0                 1
#> 1851               1                 0                 0
#> 1852               0                 1                 0
#> 1853               1                 0                 0
#> 1854               1                 0                 0
#> 1855               0                 0                 1
#> 1856               1                 0                 0
#> 1857               1                 0                 0
#> 1858               1                 0                 0
#> 1859               1                 0                 0
#> 1860               1                 0                 0
#> 1861               0                 1                 0
#> 1862               1                 0                 0
#> 1863               0                 0                 1
#> 1864               1                 0                 0
#> 1865               1                 0                 0
#> 1866               1                 0                 0
#> 1867               1                 0                 0
#> 1868               1                 0                 0
#> 1869               0                 0                 1
#> 1870               0                 0                 1
#> 1871               0                 1                 0
#> 1872               1                 0                 0
#> 1873               1                 0                 0
#> 1874               1                 0                 0
#> 1875               1                 0                 0
#> 1876               0                 0                 1
#> 1877               1                 0                 0
#> 1878               1                 0                 0
#> 1879               0                 0                 1
#> 1880               1                 0                 0
#> 1881               1                 0                 0
#> 1882               0                 0                 1
#> 1883               1                 0                 0
#> 1884               1                 0                 0
#> 1885               1                 0                 0
#> 1886               1                 0                 0
#> 1887               1                 0                 0
#> 1888               1                 0                 0
#> 1889               1                 0                 0
#> 1890               0                 1                 0
#> 1891               1                 0                 0
#> 1892               1                 0                 0
#> 1893               1                 0                 0
#> 1894               0                 0                 1
#> 1895               1                 0                 0
#> 1896               0                 0                 1
#> 1897               0                 1                 0
#> 1898               0                 0                 1
#> 1899               1                 0                 0
#> 1900               0                 1                 0
#> 1901               0                 0                 1
#> 1902               1                 0                 0
#> 1903               1                 0                 0
#> 1904               1                 0                 0
#> 1905               0                 0                 1
#> 1906               0                 0                 1
#> 1907               1                 0                 0
#> 1908               0                 0                 1
#> 1909               1                 0                 0
#> 1910               1                 0                 0
#> 1911               1                 0                 0
#> 1912               1                 0                 0
#> 1913               1                 0                 0
#> 1914               1                 0                 0
#> 1915               1                 0                 0
#> 1916               1                 0                 0
#> 1917               1                 0                 0
#> 1918               1                 0                 0
#> 1919               0                 0                 1
#> 1920               0                 0                 1
#> 1921               1                 0                 0
#> 1922               0                 0                 1
#> 1923               1                 0                 0
#> 1924               1                 0                 0
#> 1925               1                 0                 0
#> 1926               1                 0                 0
#> 1927               0                 0                 1
#> 1928               1                 0                 0
#> 1929               1                 0                 0
#> 1930               1                 0                 0
#> 1931               1                 0                 0
#> 1932               1                 0                 0
#> 1933               1                 0                 0
#> 1934               1                 0                 0
#> 1935               1                 0                 0
#> 1936               1                 0                 0
#> 1937               1                 0                 0
#> 1938               0                 0                 1
#> 1939               0                 0                 1
#> 1940               1                 0                 0
#> 1941               1                 0                 0
#> 1942               1                 0                 0
#> 1943               1                 0                 0
#> 1944               1                 0                 0
#> 1945               1                 0                 0
#> 1946               1                 0                 0
#> 1947               0                 1                 0
#> 1948               1                 0                 0
#> 1949               1                 0                 0
#> 1950               1                 0                 0
#> 1951               1                 0                 0
#> 1952               0                 0                 1
#> 1953               1                 0                 0
#> 1954               1                 0                 0
#> 1955               1                 0                 0
#> 1956               1                 0                 0
#> 1957               1                 0                 0
#> 1958               1                 0                 0
#> 1959               1                 0                 0
#> 1960               1                 0                 0
#> 1961               1                 0                 0
#> 1962               1                 0                 0
#> 1963               1                 0                 0
#> 1964               1                 0                 0
#> 1965               0                 0                 1
#> 1966               1                 0                 0
#> 1967               1                 0                 0
#> 1968               1                 0                 0
#> 1969               1                 0                 0
#> 1970               1                 0                 0
#> 1971               1                 0                 0
#> 1972               0                 0                 1
#> 1973               1                 0                 0
#> 1974               1                 0                 0
#> 1975               1                 0                 0
#> 1976               1                 0                 0
#> 1977               1                 0                 0
#> 1978               1                 0                 0
#> 1979               0                 0                 1
#> 1980               1                 0                 0
#> 1981               1                 0                 0
#> 1982               1                 0                 0
#> 1983               1                 0                 0
#> 1984               0                 0                 1
#> 1985               1                 0                 0
#> 1986               1                 0                 0
#> 1987               1                 0                 0
#> 1988               1                 0                 0
#> 1989               1                 0                 0
#> 1990               1                 0                 0
#> 1991               1                 0                 0
#> 1992               1                 0                 0
#> 1993               1                 0                 0
#> 1994               0                 0                 1
#> 1995               1                 0                 0
#> 1996               0                 0                 1
#> 1997               1                 0                 0
#> 1998               1                 0                 0
#> 1999               1                 0                 0
#> 2000               0                 1                 0
#> 2001               0                 0                 1
#> 2002               1                 0                 0
#> 2003               1                 0                 0
#> 2004               1                 0                 0
#> 2005               0                 0                 1
#> 2006               1                 0                 0
#> 2007               1                 0                 0
#> 2008               1                 0                 0
#> 2009               0                 0                 1
#> 2010               1                 0                 0
#> 2011               1                 0                 0
#> 2012               1                 0                 0
#> 2013               0                 0                 1
#> 2014               1                 0                 0
#> 2015               1                 0                 0
#> 2016               1                 0                 0
#> 2017               1                 0                 0
#> 2018               1                 0                 0
#> 2019               1                 0                 0
#> 2020               1                 0                 0
#> 2021               1                 0                 0
#> 2022               1                 0                 0
#> 2023               1                 0                 0
#> 2024               0                 0                 1
#> 2025               1                 0                 0
#> 2026               0                 0                 1
#> 2027               1                 0                 0
#> 2028               1                 0                 0
#> 2029               1                 0                 0
#> 2030               1                 0                 0
#> 2031               1                 0                 0
#> 2032               1                 0                 0
#> 2033               1                 0                 0
#> 2034               1                 0                 0
#> 2035               1                 0                 0
#> 2036               0                 1                 0
#> 2037               0                 0                 1
#> 2038               0                 0                 1
#> 2039               1                 0                 0
#> 2040               1                 0                 0
#> 2041               1                 0                 0
#> 2042               1                 0                 0
#> 2043               1                 0                 0
#> 2044               1                 0                 0
#> 2045               1                 0                 0
#> 2046               0                 0                 1
#> 2047               1                 0                 0
#> 2048               0                 0                 1
#> 2049               1                 0                 0
#> 2050               1                 0                 0
#> 2051               1                 0                 0
#> 2052               0                 1                 0
#> 2053               0                 0                 1
#> 2054               0                 0                 1
#> 2055               1                 0                 0
#> 2056               1                 0                 0
#> 2057               1                 0                 0
#> 2058               1                 0                 0
#> 2059               1                 0                 0
#> 2060               0                 0                 1
#> 2061               1                 0                 0
#> 2062               1                 0                 0
#> 2063               0                 1                 0
#> 2064               0                 0                 1
#> 2065               1                 0                 0
#> 2066               1                 0                 0
#> 2067               0                 0                 1
#> 2068               1                 0                 0
#> 2069               0                 0                 1
#> 2070               1                 0                 0
#> 2071               1                 0                 0
#> 2072               1                 0                 0
#> 2073               1                 0                 0
#> 2074               1                 0                 0
#> 2075               1                 0                 0
#> 2076               1                 0                 0
#> 2077               1                 0                 0
#> 2078               0                 0                 1
#> 2079               1                 0                 0
#> 2080               1                 0                 0
#> 2081               0                 0                 1
#> 2082               1                 0                 0
#> 2083               1                 0                 0
#> 2084               1                 0                 0
#> 2085               1                 0                 0
#> 2086               1                 0                 0
#> 2087               1                 0                 0
#> 2088               0                 0                 1
#> 2089               0                 0                 1
#> 2090               1                 0                 0
#> 2091               1                 0                 0
#> 2092               1                 0                 0
#> 2093               0                 1                 0
#> 2094               1                 0                 0
#> 2095               1                 0                 0
#> 2096               1                 0                 0
#> 2097               0                 1                 0
#> 2098               1                 0                 0
#> 2099               1                 0                 0
#> 2100               1                 0                 0
#> 2101               1                 0                 0
#> 2102               0                 0                 1
#> 2103               0                 0                 1
#> 2104               1                 0                 0
#> 2105               0                 0                 1
#> 2106               1                 0                 0
#> 2107               1                 0                 0
#> 2108               1                 0                 0
#> 2109               1                 0                 0
#> 2110               1                 0                 0
#> 2111               1                 0                 0
#> 2112               0                 0                 1
#> 2113               1                 0                 0
#> 2114               1                 0                 0
#> 2115               1                 0                 0
#> 2116               1                 0                 0
#> 2117               1                 0                 0
#> 2118               1                 0                 0
#> 2119               0                 1                 0
#> 2120               1                 0                 0
#> 2121               1                 0                 0
#> 2122               0                 0                 1
#> 2123               1                 0                 0
#> 2124               1                 0                 0
#> 2125               1                 0                 0
#> 2126               1                 0                 0
#> 2127               1                 0                 0
#> 2128               1                 0                 0
#> 2129               1                 0                 0
#> 2130               1                 0                 0
#> 2131               1                 0                 0
#> 2132               1                 0                 0
#> 2133               1                 0                 0
#> 2134               1                 0                 0
#> 2135               1                 0                 0
#> 2136               1                 0                 0
#> 2137               0                 0                 1
#> 2138               1                 0                 0
#> 2139               1                 0                 0
#> 2140               0                 0                 1
#> 2141               1                 0                 0
#> 2142               1                 0                 0
#> 2143               1                 0                 0
#> 2144               1                 0                 0
#> 2145               1                 0                 0
#> 2146               1                 0                 0
#> 2147               1                 0                 0
#> 2148               1                 0                 0
#> 2149               1                 0                 0
#> 2150               1                 0                 0
#> 2151               1                 0                 0
#> 2152               1                 0                 0
#> 2153               0                 0                 1
#> 2154               1                 0                 0
#> 2155               0                 0                 1
#> 2156               1                 0                 0
#> 2157               1                 0                 0
#> 2158               1                 0                 0
#> 2159               1                 0                 0
#> 2160               1                 0                 0
#> 2161               1                 0                 0
#> 2162               1                 0                 0
#> 2163               0                 0                 1
#> 2164               1                 0                 0
#> 2165               1                 0                 0
#> 2166               1                 0                 0
#> 2167               1                 0                 0
#> 2168               1                 0                 0
#> 2169               1                 0                 0
#> 2170               1                 0                 0
#> 2171               1                 0                 0
#> 2172               1                 0                 0
#> 2173               1                 0                 0
#> 2174               1                 0                 0
#> 2175               1                 0                 0
#> 2176               0                 0                 1
#> 2177               1                 0                 0
#> 2178               1                 0                 0
#> 2179               1                 0                 0
#> 2180               1                 0                 0
#> 2181               1                 0                 0
#> 2182               1                 0                 0
#> 2183               1                 0                 0
#> 2184               0                 0                 1
#> 2185               1                 0                 0
#> 2186               1                 0                 0
#> 2187               1                 0                 0
#> 2188               1                 0                 0
#> 2189               1                 0                 0
#> 2190               1                 0                 0
#> 2191               1                 0                 0
#> 2192               1                 0                 0
#> 2193               1                 0                 0
#> 2194               1                 0                 0
#> 2195               0                 1                 0
#> 2196               1                 0                 0
#> 2197               1                 0                 0
#> 2198               1                 0                 0
#> 2199               0                 0                 1
#> 2200               1                 0                 0
#> 2201               0                 0                 1
#> 2202               0                 0                 1
#> 2203               1                 0                 0
#> 2204               1                 0                 0
#> 2205               1                 0                 0
#> 2206               1                 0                 0
#> 2207               1                 0                 0
#> 2208               1                 0                 0
#> 2209               1                 0                 0
#> 2210               1                 0                 0
#> 2211               1                 0                 0
#> 2212               1                 0                 0
#> 2213               0                 0                 1
#> 2214               1                 0                 0
#> 2215               1                 0                 0
#> 2216               1                 0                 0
#> 2217               1                 0                 0
#> 2218               1                 0                 0
#> 2219               1                 0                 0
#> 2220               1                 0                 0
#> 2221               1                 0                 0
#> 2222               1                 0                 0
#> 2223               1                 0                 0
#> 2224               1                 0                 0
#> 2225               1                 0                 0
#> 2226               1                 0                 0
#> 2227               1                 0                 0
#> 2228               1                 0                 0
#> 2229               1                 0                 0
#> 2230               1                 0                 0
#> 2231               1                 0                 0
#> 2232               1                 0                 0
#> 2233               1                 0                 0
#> 2234               1                 0                 0
#> 2235               1                 0                 0
#> 2236               1                 0                 0
#> 2237               1                 0                 0
#> 2238               1                 0                 0
#> 2239               1                 0                 0
#> 2240               1                 0                 0
#> 2241               1                 0                 0
#> 2242               1                 0                 0
#> 2243               1                 0                 0
#> 2244               1                 0                 0
#> 2245               1                 0                 0
#> 2246               1                 0                 0
#> 2247               1                 0                 0
#> 2248               1                 0                 0
#> 2249               1                 0                 0
#> 2250               1                 0                 0
#> 2251               1                 0                 0
#> 2252               1                 0                 0
#> 2253               1                 0                 0
#> 2254               1                 0                 0
#> 2255               1                 0                 0
#> 2256               1                 0                 0
#> 2257               1                 0                 0
#> 2258               1                 0                 0
#> 2259               1                 0                 0
#> 2260               1                 0                 0
#> 2261               1                 0                 0
#> 2262               0                 1                 0
#> 2263               0                 1                 0
#> 2264               1                 0                 0
#> 2265               1                 0                 0
#> 2266               1                 0                 0
#> 2267               1                 0                 0
#> 2268               1                 0                 0
#> 2269               1                 0                 0
#> 2270               0                 0                 1
#> 2271               1                 0                 0
#> 2272               1                 0                 0
#> 2273               1                 0                 0
#> 2274               1                 0                 0
#> 2275               1                 0                 0
#> 2276               1                 0                 0
#> 2277               1                 0                 0
#> 2278               0                 1                 0
#> 2279               1                 0                 0
#> 2280               1                 0                 0
#> 2281               1                 0                 0
#> 2282               0                 1                 0
#> 2283               1                 0                 0
#> 2284               1                 0                 0
#> 2285               0                 0                 1
#> 2286               1                 0                 0
#> 2287               1                 0                 0
#> 2288               1                 0                 0
#> 2289               1                 0                 0
#> 2290               1                 0                 0
#> 2291               0                 0                 1
#> 2292               1                 0                 0
#> 2293               1                 0                 0
#> 2294               1                 0                 0
#> 2295               1                 0                 0
#> 2296               0                 0                 1
#> 2297               1                 0                 0
#> 2298               1                 0                 0
#> 2299               1                 0                 0
#> 2300               1                 0                 0
#> 2301               1                 0                 0
#> 2302               1                 0                 0
#> 2303               1                 0                 0
#> 2304               0                 0                 1
#> 2305               0                 0                 1
#> 2306               1                 0                 0
#> 2307               1                 0                 0
#> 2308               0                 0                 1
#> 2309               1                 0                 0
#> 2310               1                 0                 0
#> 2311               0                 0                 1
#> 2312               1                 0                 0
#> 2313               1                 0                 0
#> 2314               1                 0                 0
#> 2315               1                 0                 0
#> 2316               1                 0                 0
#> 2317               1                 0                 0
#> 2318               1                 0                 0
#> 2319               1                 0                 0
#> 2320               1                 0                 0
#> 2321               1                 0                 0
#> 2322               1                 0                 0
#> 2323               1                 0                 0
#> 2324               1                 0                 0
#> 2325               1                 0                 0
#> 2326               1                 0                 0
#> 2327               1                 0                 0
#> 2328               1                 0                 0
#> 2329               1                 0                 0
#> 2330               0                 0                 1
#> 2331               0                 0                 1
#> 2332               0                 1                 0
#> 2333               1                 0                 0
#> 2334               1                 0                 0
#> 2335               1                 0                 0
#> 2336               0                 0                 1
#> 2337               1                 0                 0
#> 2338               1                 0                 0
#> 2339               1                 0                 0
#> 2340               1                 0                 0
#> 2341               1                 0                 0
#> 2342               1                 0                 0
#> 2343               1                 0                 0
#> 2344               1                 0                 0
#> 2345               1                 0                 0
#> 2346               1                 0                 0
#> 2347               1                 0                 0
#> 2348               1                 0                 0
#> 2349               1                 0                 0
#> 2350               0                 0                 1
#> 2351               1                 0                 0
#> 2352               1                 0                 0
#> 2353               1                 0                 0
#> 2354               1                 0                 0
#> 2355               1                 0                 0
#> 2356               1                 0                 0
#> 2357               1                 0                 0
#> 2358               1                 0                 0
#> 2359               1                 0                 0
#> 2360               0                 1                 0
#> 2361               0                 1                 0
#> 2362               0                 0                 1
#> 2363               1                 0                 0
#> 2364               0                 1                 0
#> 2365               0                 0                 1
#> 2366               1                 0                 0
#> 2367               1                 0                 0
#> 2368               1                 0                 0
#> 2369               1                 0                 0
#> 2370               1                 0                 0
#> 2371               1                 0                 0
#> 2372               1                 0                 0
#> 2373               1                 0                 0
#> 2374               0                 0                 1
#> 2375               1                 0                 0
#> 2376               1                 0                 0
#> 2377               1                 0                 0
#> 2378               1                 0                 0
#> 2379               1                 0                 0
#> 2380               1                 0                 0
#> 2381               1                 0                 0
#> 2382               1                 0                 0
#> 2383               0                 0                 1
#> 2384               0                 0                 1
#> 2385               1                 0                 0
#> 2386               1                 0                 0
#> 2387               1                 0                 0
#> 2388               1                 0                 0
#> 2389               1                 0                 0
#> 2390               1                 0                 0
#> 2391               1                 0                 0
#> 2392               1                 0                 0
#> 2393               1                 0                 0
#> 2394               1                 0                 0
#> 2395               1                 0                 0
#> 2396               0                 1                 0
#> 2397               1                 0                 0
#> 2398               1                 0                 0
#> 2399               1                 0                 0
#> 2400               0                 0                 1
#> 2401               0                 0                 1
#> 2402               1                 0                 0
#> 2403               1                 0                 0
#> 2404               1                 0                 0
#> 2405               1                 0                 0
#> 2406               1                 0                 0
#> 2407               1                 0                 0
#> 2408               1                 0                 0
#> 2409               1                 0                 0
#> 2410               1                 0                 0
#> 2411               0                 1                 0
#> 2412               0                 0                 1
#> 2413               1                 0                 0
#> 2414               1                 0                 0
#> 2415               1                 0                 0
#> 2416               0                 1                 0
#> 2417               1                 0                 0
#> 2418               1                 0                 0
#> 2419               1                 0                 0
#> 2420               0                 1                 0
#> 2421               1                 0                 0
#> 2422               1                 0                 0
#> 2423               0                 0                 1
#> 2424               0                 0                 1
#> 2425               1                 0                 0
#> 2426               1                 0                 0
#> 2427               0                 1                 0
#> 2428               1                 0                 0
#> 2429               1                 0                 0
#> 2430               1                 0                 0
#> 2431               1                 0                 0
#> 2432               1                 0                 0
#> 2433               0                 0                 1
#> 2434               1                 0                 0
#> 2435               0                 0                 1
#> 2436               1                 0                 0
#> 2437               0                 0                 1
#> 2438               1                 0                 0
#> 2439               1                 0                 0
#> 2440               1                 0                 0
#> 2441               1                 0                 0
#> 2442               1                 0                 0
#> 2443               0                 0                 1
#> 2444               0                 0                 1
#> 2445               1                 0                 0
#> 2446               1                 0                 0
#> 2447               1                 0                 0
#> 2448               0                 0                 1
#> 2449               1                 0                 0
#> 2450               1                 0                 0
#> 2451               1                 0                 0
#> 2452               1                 0                 0
#> 2453               1                 0                 0
#> 2454               1                 0                 0
#> 2455               1                 0                 0
#> 2456               1                 0                 0
#> 2457               0                 0                 1
#> 2458               1                 0                 0
#> 2459               1                 0                 0
#> 2460               0                 0                 1
#> 2461               1                 0                 0
#> 2462               1                 0                 0
#> 2463               1                 0                 0
#> 2464               1                 0                 0
#> 2465               1                 0                 0
#> 2466               1                 0                 0
#> 2467               0                 0                 1
#> 2468               1                 0                 0
#> 2469               1                 0                 0
#> 2470               1                 0                 0
#> 2471               0                 0                 1
#> 2472               1                 0                 0
#> 2473               1                 0                 0
#> 2474               1                 0                 0
#> 2475               1                 0                 0
#> 2476               1                 0                 0
#> 2477               1                 0                 0
#> 2478               1                 0                 0
#> 2479               1                 0                 0
#> 2480               1                 0                 0
#> 2481               1                 0                 0
#> 2482               0                 0                 1
#> 2483               1                 0                 0
#> 2484               1                 0                 0
#> 2485               1                 0                 0
#> 2486               1                 0                 0
#> 2487               0                 0                 1
#> 2488               1                 0                 0
#> 2489               1                 0                 0
#> 2490               1                 0                 0
#> 2491               0                 0                 1
#> 2492               1                 0                 0
#> 2493               0                 0                 1
#> 2494               1                 0                 0
#> 2495               1                 0                 0
#> 2496               1                 0                 0
#> 2497               1                 0                 0
#> 2498               1                 0                 0
#> 2499               1                 0                 0
#> 2500               1                 0                 0
#> 2501               1                 0                 0
#> 2502               0                 1                 0
#> 2503               1                 0                 0
#> 2504               1                 0                 0
#> 2505               1                 0                 0
#> 2506               1                 0                 0
#> 2507               1                 0                 0
#> 2508               1                 0                 0
#> 2509               1                 0                 0
#> 2510               1                 0                 0
#> 2511               1                 0                 0
#> 2512               1                 0                 0
#> 2513               1                 0                 0
#> 2514               0                 0                 1
#> 2515               1                 0                 0
#> 2516               1                 0                 0
#> 2517               1                 0                 0
#> 2518               1                 0                 0
#> 2519               0                 0                 1
#> 2520               1                 0                 0
#> 2521               1                 0                 0
#> 2522               1                 0                 0
#> 2523               0                 0                 1
#> 2524               1                 0                 0
#> 2525               1                 0                 0
#> 2526               1                 0                 0
#> 2527               1                 0                 0
#> 2528               1                 0                 0
#> 2529               1                 0                 0
#> 2530               1                 0                 0
#> 2531               1                 0                 0
#> 2532               1                 0                 0
#> 2533               1                 0                 0
#> 2534               0                 0                 1
#> 2535               1                 0                 0
#> 2536               1                 0                 0
#> 2537               1                 0                 0
#> 2538               0                 1                 0
#> 2539               0                 0                 1
#> 2540               0                 0                 1
#> 2541               0                 1                 0
#> 2542               1                 0                 0
#> 2543               1                 0                 0
#> 2544               0                 0                 1
#> 2545               1                 0                 0
#> 2546               0                 0                 1
#> 2547               1                 0                 0
#> 2548               1                 0                 0
#> 2549               1                 0                 0
#> 2550               1                 0                 0
#> 2551               1                 0                 0
#> 2552               0                 0                 1
#> 2553               1                 0                 0
#> 2554               1                 0                 0
#> 2555               1                 0                 0
#> 2556               1                 0                 0
#> 2557               1                 0                 0
#> 2558               0                 0                 1
#> 2559               1                 0                 0
#> 2560               0                 0                 1
#> 2561               0                 0                 1
#> 2562               1                 0                 0
#> 2563               1                 0                 0
#> 2564               1                 0                 0
#> 2565               1                 0                 0
#> 2566               1                 0                 0
#> 2567               1                 0                 0
#> 2568               1                 0                 0
#> 2569               1                 0                 0
#> 2570               1                 0                 0
#> 2571               1                 0                 0
#> 2572               1                 0                 0
#> 2573               1                 0                 0
#> 2574               1                 0                 0
#> 2575               1                 0                 0
#> 2576               1                 0                 0
#> 2577               1                 0                 0
#> 2578               1                 0                 0
#> 2579               1                 0                 0
#> 2580               1                 0                 0
#> 2581               1                 0                 0
#> 2582               1                 0                 0
#> 2583               1                 0                 0
#> 2584               1                 0                 0
#> 2585               1                 0                 0
#> 2586               0                 0                 1
#> 2587               1                 0                 0
#> 2588               1                 0                 0
#> 2589               1                 0                 0
#> 2590               1                 0                 0
#> 2591               1                 0                 0
#> 2592               1                 0                 0
#> 2593               1                 0                 0
#> 2594               0                 0                 1
#> 2595               1                 0                 0
#> 2596               1                 0                 0
#> 2597               1                 0                 0
#> 2598               0                 0                 1
#> 2599               1                 0                 0
#> 2600               1                 0                 0
#> 2601               1                 0                 0
#> 2602               1                 0                 0
#> 2603               0                 0                 1
#> 2604               1                 0                 0
#> 2605               1                 0                 0
#> 2606               0                 0                 1
#> 2607               1                 0                 0
#> 2608               0                 0                 1
#> 2609               1                 0                 0
#> 2610               1                 0                 0
#> 2611               1                 0                 0
#> 2612               0                 0                 1
#> 2613               1                 0                 0
#> 2614               1                 0                 0
#> 2615               1                 0                 0
#> 2616               1                 0                 0
#> 2617               1                 0                 0
#> 2618               1                 0                 0
#> 2619               1                 0                 0
#> 2620               1                 0                 0
#> 2621               0                 1                 0
#> 2622               1                 0                 0
#> 2623               1                 0                 0
#> 2624               1                 0                 0
#> 2625               1                 0                 0
#> 2626               0                 1                 0
#> 2627               0                 1                 0
#> 2628               1                 0                 0
#> 2629               1                 0                 0
#> 2630               0                 0                 1
#> 2631               0                 1                 0
#> 2632               1                 0                 0
#> 2633               0                 0                 1
#> 2634               1                 0                 0
#> 2635               1                 0                 0
#> 2636               1                 0                 0
#> 2637               1                 0                 0
#> 2638               1                 0                 0
#> 2639               0                 0                 1
#> 2640               1                 0                 0
#> 2641               0                 0                 1
#> 2642               1                 0                 0
#> 2643               1                 0                 0
#> 2644               1                 0                 0
#> 2645               1                 0                 0
#> 2646               0                 1                 0
#> 2647               1                 0                 0
#> 2648               1                 0                 0
#> 2649               1                 0                 0
#> 2650               1                 0                 0
#> 2651               1                 0                 0
#> 2652               1                 0                 0
#> 2653               1                 0                 0
#> 2654               0                 1                 0
#> 2655               1                 0                 0
#> 2656               1                 0                 0
#> 2657               0                 0                 1
#> 2658               1                 0                 0
#> 2659               1                 0                 0
#> 2660               1                 0                 0
#> 2661               1                 0                 0
#> 2662               1                 0                 0
#> 2663               1                 0                 0
#> 2664               1                 0                 0
#> 2665               1                 0                 0
#> 2666               1                 0                 0
#> 2667               1                 0                 0
#> 2668               1                 0                 0
#> 2669               1                 0                 0
#> 2670               0                 0                 1
#> 2671               1                 0                 0
#> 2672               1                 0                 0
#> 2673               1                 0                 0
#> 2674               1                 0                 0
#> 2675               0                 0                 1
#> 2676               1                 0                 0
#> 2677               1                 0                 0
#> 2678               1                 0                 0
#> 2679               1                 0                 0
#> 2680               1                 0                 0
#> 2681               1                 0                 0
#> 2682               1                 0                 0
#> 2683               0                 0                 1
#> 2684               1                 0                 0
#> 2685               1                 0                 0
#> 2686               1                 0                 0
#> 2687               1                 0                 0
#> 2688               1                 0                 0
#> 2689               1                 0                 0
#> 2690               1                 0                 0
#> 2691               1                 0                 0
#> 2692               1                 0                 0
#> 2693               1                 0                 0
#> 2694               1                 0                 0
#> 2695               1                 0                 0
#> 2696               1                 0                 0
#> 2697               1                 0                 0
#> 2698               0                 0                 1
#> 2699               0                 1                 0
#> 2700               0                 0                 1
#> 2701               0                 0                 1
#> 2702               1                 0                 0
#> 2703               1                 0                 0
#> 2704               1                 0                 0
#> 2705               1                 0                 0
#> 2706               1                 0                 0
#> 2707               1                 0                 0
#> 2708               0                 0                 1
#> 2709               1                 0                 0
#> 2710               0                 1                 0
#> 2711               0                 1                 0
#> 2712               1                 0                 0
#> 2713               0                 0                 1
#> 2714               1                 0                 0
#> 2715               1                 0                 0
#> 2716               0                 0                 1
#> 2717               0                 0                 1
#> 2718               1                 0                 0
#> 2719               0                 0                 1
#> 2720               1                 0                 0
#> 2721               1                 0                 0
#> 2722               1                 0                 0
#> 2723               1                 0                 0
#> 2724               1                 0                 0
#> 2725               1                 0                 0
#> 2726               1                 0                 0
#> 2727               0                 1                 0
#> 2728               1                 0                 0
#> 2729               1                 0                 0
#> 2730               1                 0                 0
#> 2731               1                 0                 0
#> 2732               0                 1                 0
#> 2733               1                 0                 0
#> 2734               1                 0                 0
#> 2735               1                 0                 0
#> 2736               1                 0                 0
#> 2737               1                 0                 0
#> 2738               1                 0                 0
#> 2739               0                 1                 0
#> 2740               1                 0                 0
#> 2741               1                 0                 0
#> 2742               1                 0                 0
#> 2743               1                 0                 0
#> 2744               1                 0                 0
#> 2745               0                 0                 1
#> 2746               1                 0                 0
#> 2747               1                 0                 0
#> 2748               0                 0                 1
#> 2749               1                 0                 0
#> 2750               0                 1                 0
#> 2751               1                 0                 0
#> 2752               1                 0                 0
#> 2753               1                 0                 0
#> 2754               1                 0                 0
#> 2755               0                 0                 1
#> 2756               1                 0                 0
#> 2757               0                 1                 0
#> 2758               1                 0                 0
#> 2759               1                 0                 0
#> 2760               1                 0                 0
#> 2761               0                 1                 0
#> 2762               1                 0                 0
#> 2763               1                 0                 0
#> 2764               1                 0                 0
#> 2765               1                 0                 0
#> 2766               0                 0                 1
#> 2767               0                 0                 1
#> 2768               1                 0                 0
#> 2769               1                 0                 0
#> 2770               1                 0                 0
#> 2771               1                 0                 0
#> 2772               1                 0                 0
#> 2773               1                 0                 0
#> 2774               1                 0                 0
#> 2775               0                 1                 0
#> 2776               0                 0                 1
#> 2777               1                 0                 0
#> 2778               1                 0                 0
#> 2779               1                 0                 0
#> 2780               1                 0                 0
#> 2781               0                 0                 1
#> 2782               1                 0                 0
#> 2783               0                 0                 1
#> 2784               1                 0                 0
#> 2785               1                 0                 0
#> 2786               1                 0                 0
#> 2787               1                 0                 0
#> 2788               0                 0                 1
#> 2789               1                 0                 0
#> 2790               1                 0                 0
#> 2791               1                 0                 0
#> 2792               0                 0                 1
#> 2793               0                 0                 1
#> 2794               1                 0                 0
#> 2795               1                 0                 0
#> 2796               1                 0                 0
#> 2797               1                 0                 0
#> 2798               1                 0                 0
#> 2799               0                 0                 1
#> 2800               0                 0                 1
#> 2801               1                 0                 0
#> 2802               1                 0                 0
#> 2803               1                 0                 0
#> 2804               1                 0                 0
#> 2805               0                 0                 1
#> 2806               1                 0                 0
#> 2807               1                 0                 0
#> 2808               1                 0                 0
#> 2809               1                 0                 0
#> 2810               0                 0                 1
#> 2811               1                 0                 0
#> 2812               1                 0                 0
#> 2813               1                 0                 0
#> 2814               1                 0                 0
#> 2815               1                 0                 0
#> 2816               1                 0                 0
#> 2817               0                 0                 1
#> 2818               0                 1                 0
#> 2819               0                 1                 0
#> 2820               1                 0                 0
#> 2821               1                 0                 0
#> 2822               1                 0                 0
#> 2823               1                 0                 0
#> 2824               1                 0                 0
#> 2825               0                 0                 1
#> 2826               1                 0                 0
#> 2827               0                 1                 0
#> 2828               1                 0                 0
#> 2829               1                 0                 0
#> 2830               1                 0                 0
#> 2831               1                 0                 0
#> 2832               1                 0                 0
#> 2833               1                 0                 0
#> 2834               1                 0                 0
#> 2835               1                 0                 0
#> 2836               1                 0                 0
#> 2837               1                 0                 0
#> 2838               1                 0                 0
#> 2839               1                 0                 0
#> 2840               1                 0                 0
#> 2841               0                 0                 1
#> 2842               1                 0                 0
#> 2843               1                 0                 0
#> 2844               1                 0                 0
#> 2845               1                 0                 0
#> 2846               1                 0                 0
#> 2847               1                 0                 0
#> 2848               0                 1                 0
#> 2849               1                 0                 0
#> 2850               1                 0                 0
#> 2851               1                 0                 0
#> 2852               1                 0                 0
#> 2853               1                 0                 0
#> 2854               0                 0                 1
#> 2855               1                 0                 0
#> 2856               1                 0                 0
#> 2857               1                 0                 0
#> 2858               1                 0                 0
#> 2859               1                 0                 0
#> 2860               1                 0                 0
#> 2861               1                 0                 0
#> 2862               1                 0                 0
#> 2863               0                 1                 0
#> 2864               1                 0                 0
#> 2865               1                 0                 0
#> 2866               1                 0                 0
#> 2867               1                 0                 0
#> 2868               1                 0                 0
#> 2869               1                 0                 0
#> 2870               1                 0                 0
#> 2871               1                 0                 0
#> 2872               1                 0                 0
#> 2873               1                 0                 0
#> 2874               1                 0                 0
#> 2875               1                 0                 0
#> 2876               1                 0                 0
#> 2877               1                 0                 0
#> 2878               1                 0                 0
#> 2879               0                 1                 0
#> 2880               1                 0                 0
#> 2881               1                 0                 0
#> 2882               0                 1                 0
#> 2883               0                 0                 1
#> 2884               1                 0                 0
#> 2885               1                 0                 0
#> 2886               0                 0                 1
#> 2887               1                 0                 0
#> 2888               1                 0                 0
#> 2889               0                 0                 1
#> 2890               1                 0                 0
#> 2891               1                 0                 0
#> 2892               1                 0                 0
#> 2893               1                 0                 0
#> 2894               1                 0                 0
#> 2895               1                 0                 0
#> 2896               1                 0                 0
#> 2897               1                 0                 0
#> 2898               1                 0                 0
#> 2899               1                 0                 0
#> 2900               1                 0                 0
#> 2901               1                 0                 0
#> 2902               1                 0                 0
#> 2903               1                 0                 0
#> 2904               1                 0                 0
#> 2905               1                 0                 0
#> 2906               1                 0                 0
#> 2907               1                 0                 0
#> 2908               1                 0                 0
#> 2909               1                 0                 0
#> 2910               1                 0                 0
#> 2911               1                 0                 0
#> 2912               1                 0                 0
#> 2913               1                 0                 0
#> 2914               1                 0                 0
#> 2915               0                 0                 1
#> 2916               1                 0                 0
#> 2917               1                 0                 0
#> 2918               1                 0                 0
#> 2919               1                 0                 0
#> 2920               1                 0                 0
#> 2921               1                 0                 0
#> 2922               1                 0                 0
#> 2923               1                 0                 0
#> 2924               1                 0                 0
#> 2925               1                 0                 0
#> 2926               1                 0                 0
#> 2927               1                 0                 0
#> 2928               1                 0                 0
#> 2929               1                 0                 0
#> 2930               0                 1                 0
#> 2931               1                 0                 0
#> 2932               1                 0                 0
#> 2933               1                 0                 0
#> 2934               1                 0                 0
#> 2935               1                 0                 0
#> 2936               1                 0                 0
#> 2937               1                 0                 0
#> 2938               1                 0                 0
#> 2939               1                 0                 0
#> 2940               1                 0                 0
#> 2941               0                 0                 1
#> 2942               1                 0                 0
#> 2943               1                 0                 0
#> 2944               1                 0                 0
#> 2945               1                 0                 0
#> 2946               1                 0                 0
#> 2947               1                 0                 0
#> 2948               1                 0                 0
#> 2949               1                 0                 0
#> 2950               0                 0                 1
#> 2951               1                 0                 0
#> 2952               1                 0                 0
#> 2953               1                 0                 0
#> 2954               1                 0                 0
#> 2955               1                 0                 0
#> 2956               1                 0                 0
#> 2957               1                 0                 0
#> 2958               1                 0                 0
#> 2959               1                 0                 0
#> 2960               1                 0                 0
#> 2961               0                 1                 0
#> 2962               0                 0                 1
#> 2963               1                 0                 0
#> 2964               1                 0                 0
#> 2965               1                 0                 0
#> 2966               1                 0                 0
#> 2967               1                 0                 0
#> 2968               0                 0                 1
#> 2969               1                 0                 0
#> 2970               1                 0                 0
#> 2971               0                 0                 1
#> 2972               0                 0                 1
#> 2973               1                 0                 0
#> 2974               1                 0                 0
#> 2975               0                 0                 1
#> 2976               1                 0                 0
#> 2977               0                 0                 1
#> 2978               1                 0                 0
#> 2979               0                 0                 1
#> 2980               1                 0                 0
#> 2981               1                 0                 0
#> 2982               1                 0                 0
#> 2983               1                 0                 0
#> 2984               1                 0                 0
#> 2985               1                 0                 0
#> 2986               1                 0                 0
#> 2987               0                 0                 1
#> 2988               0                 0                 1
#> 2989               0                 0                 1
#> 2990               1                 0                 0
#> 2991               1                 0                 0
#> 2992               1                 0                 0
#> 2993               0                 0                 1
#> 2994               1                 0                 0
#> 2995               1                 0                 0
#> 2996               1                 0                 0
#> 2997               0                 0                 1
#> 2998               1                 0                 0
#> 2999               0                 0                 1
#> 3000               1                 0                 0
#> 3001               0                 0                 1
#> 3002               1                 0                 0
#> 3003               1                 0                 0
#> 3004               1                 0                 0
#> 3005               1                 0                 0
#> 3006               1                 0                 0
#> 3007               1                 0                 0
#> 3008               0                 1                 0
#> 3009               1                 0                 0
#> 3010               1                 0                 0
#> 3011               1                 0                 0
#> 3012               0                 0                 1
#> 3013               1                 0                 0
#> 3014               1                 0                 0
#> 3015               1                 0                 0
#> 3016               1                 0                 0
#> 3017               0                 0                 1
#> 3018               1                 0                 0
#> 3019               0                 0                 1
#> 3020               1                 0                 0
#> 3021               1                 0                 0
#> 3022               1                 0                 0
#> 3023               1                 0                 0
#> 3024               0                 0                 1
#> 3025               1                 0                 0
#> 3026               1                 0                 0
#> 3027               1                 0                 0
#> 3028               1                 0                 0
#> 3029               1                 0                 0
#> 3030               0                 0                 1
#> 3031               1                 0                 0
#> 3032               0                 1                 0
#> 3033               0                 0                 1
#> 3034               0                 1                 0
#> 3035               1                 0                 0
#> 3036               1                 0                 0
#> 3037               1                 0                 0
#> 3038               0                 0                 1
#> 3039               1                 0                 0
#> 3040               1                 0                 0
#> 3041               1                 0                 0
#> 3042               1                 0                 0
#> 3043               0                 0                 1
#> 3044               1                 0                 0
#> 3045               0                 0                 1
#> 3046               1                 0                 0
#> 3047               1                 0                 0
#> 3048               1                 0                 0
#> 3049               0                 0                 1
#> 3050               1                 0                 0
#> 3051               1                 0                 0
#> 3052               1                 0                 0
#> 3053               1                 0                 0
#> 3054               0                 0                 1
#> 3055               1                 0                 0
#> 3056               1                 0                 0
#> 3057               1                 0                 0
#> 3058               1                 0                 0
#> 3059               1                 0                 0
#> 3060               1                 0                 0
#> 3061               1                 0                 0
#> 3062               1                 0                 0
#> 3063               1                 0                 0
#> 3064               1                 0                 0
#> 3065               1                 0                 0
#> 3066               0                 0                 1
#> 3067               1                 0                 0
#> 3068               1                 0                 0
#> 3069               1                 0                 0
#> 3070               1                 0                 0
#> 3071               1                 0                 0
#> 3072               1                 0                 0
#> 3073               1                 0                 0
#> 3074               1                 0                 0
#> 3075               1                 0                 0
#> 3076               1                 0                 0
#> 3077               0                 0                 1
#> 3078               1                 0                 0
#> 3079               1                 0                 0
#> 3080               1                 0                 0
#> 3081               1                 0                 0
#> 3082               1                 0                 0
#> 3083               1                 0                 0
#> 3084               1                 0                 0
#> 3085               1                 0                 0
#> 3086               1                 0                 0
#> 3087               1                 0                 0
#> 3088               1                 0                 0
#> 3089               1                 0                 0
#> 3090               1                 0                 0
#> 3091               1                 0                 0
#> 3092               1                 0                 0
#> 3093               1                 0                 0
#> 3094               1                 0                 0
#> 3095               1                 0                 0
#> 3096               1                 0                 0
#> 3097               1                 0                 0
#> 3098               0                 0                 1
#> 3099               1                 0                 0
#> 3100               1                 0                 0
#> 3101               1                 0                 0
#> 3102               1                 0                 0
#> 3103               1                 0                 0
#> 3104               1                 0                 0
#> 3105               0                 0                 1
#> 3106               1                 0                 0
#> 3107               1                 0                 0
#> 3108               1                 0                 0
#> 3109               1                 0                 0
#> 3110               1                 0                 0
#> 3111               1                 0                 0
#> 3112               1                 0                 0
#> 3113               1                 0                 0
#> 3114               0                 0                 1
#> 3115               1                 0                 0
#> 3116               1                 0                 0
#> 3117               0                 0                 1
#> 3118               1                 0                 0
#> 3119               0                 0                 1
#> 3120               1                 0                 0
#> 3121               1                 0                 0
#> 3122               1                 0                 0
#> 3123               1                 0                 0
#> 3124               1                 0                 0
#> 3125               1                 0                 0
#> 3126               1                 0                 0
#> 3127               1                 0                 0
#> 3128               1                 0                 0
#> 3129               1                 0                 0
#> 3130               0                 1                 0
#> 3131               1                 0                 0
#> 3132               1                 0                 0
#> 3133               0                 1                 0
#> 3134               1                 0                 0
#> 3135               1                 0                 0
#> 3136               0                 0                 1
#> 3137               0                 1                 0
#> 3138               0                 0                 1
#> 3139               1                 0                 0
#> 3140               1                 0                 0
#> 3141               0                 1                 0
#> 3142               1                 0                 0
#> 3143               1                 0                 0
#> 3144               1                 0                 0
#> 3145               1                 0                 0
#> 3146               1                 0                 0
#> 3147               1                 0                 0
#> 3148               1                 0                 0
#> 3149               0                 1                 0
#> 3150               1                 0                 0
#> 3151               1                 0                 0
#> 3152               1                 0                 0
#> 3153               1                 0                 0
#> 3154               1                 0                 0
#> 3155               1                 0                 0
#> 3156               1                 0                 0
#> 3157               1                 0                 0
#> 3158               1                 0                 0
#> 3159               0                 0                 1
#> 3160               0                 0                 1
#> 3161               1                 0                 0
#> 3162               1                 0                 0
#> 3163               1                 0                 0
#> 3164               1                 0                 0
#> 3165               1                 0                 0
#> 3166               1                 0                 0
#> 3167               0                 0                 1
#> 3168               1                 0                 0
#> 3169               1                 0                 0
#> 3170               1                 0                 0
#> 3171               1                 0                 0
#> 3172               0                 0                 1
#> 3173               1                 0                 0
#> 3174               1                 0                 0
#> 3175               0                 1                 0
#> 3176               0                 0                 1
#> 3177               1                 0                 0
#> 3178               1                 0                 0
#> 3179               1                 0                 0
#> 3180               0                 0                 1
#> 3181               0                 0                 1
#> 3182               1                 0                 0
#> 3183               1                 0                 0
#> 3184               1                 0                 0
#> 3185               1                 0                 0
#> 3186               1                 0                 0
#> 3187               1                 0                 0
#> 3188               1                 0                 0
#> 3189               1                 0                 0
#> 3190               1                 0                 0
#> 3191               1                 0                 0
#> 3192               1                 0                 0
#> 3193               1                 0                 0
#> 3194               1                 0                 0
#> 3195               1                 0                 0
#> 3196               1                 0                 0
#> 3197               1                 0                 0
#> 3198               0                 0                 1
#> 3199               1                 0                 0
#> 3200               1                 0                 0
#> 3201               1                 0                 0
#> 3202               1                 0                 0
#> 3203               1                 0                 0
#> 3204               1                 0                 0
#> 3205               1                 0                 0
#> 3206               1                 0                 0
#> 3207               0                 0                 1
#> 3208               1                 0                 0
#> 3209               1                 0                 0
#> 3210               0                 0                 1
#> 3211               0                 0                 1
#> 3212               1                 0                 0
#> 3213               0                 0                 1
#> 3214               1                 0                 0
#> 3215               1                 0                 0
#> 3216               0                 0                 1
#> 3217               1                 0                 0
#> 3218               0                 0                 1
#> 3219               0                 1                 0
#> 3220               0                 0                 1
#> 3221               1                 0                 0
#> 3222               1                 0                 0
#> 3223               1                 0                 0
#> 3224               1                 0                 0
#> 3225               1                 0                 0
#> 3226               0                 0                 1
#> 3227               1                 0                 0
#> 3228               1                 0                 0
#> 3229               1                 0                 0
#> 3230               1                 0                 0
#> 3231               0                 0                 1
#> 3232               1                 0                 0
#> 3233               1                 0                 0
#> 3234               1                 0                 0
#> 3235               1                 0                 0
#> 3236               1                 0                 0
#> 3237               1                 0                 0
#> 3238               1                 0                 0
#> 3239               1                 0                 0
#> 3240               1                 0                 0
#> 3241               1                 0                 0
#> 3242               1                 0                 0
#> 3243               0                 1                 0
#> 3244               0                 0                 1
#> 3245               1                 0                 0
#> 3246               1                 0                 0
#> 3247               1                 0                 0
#> 3248               1                 0                 0
#> 3249               1                 0                 0
#> 3250               1                 0                 0
#> 3251               1                 0                 0
#> 3252               1                 0                 0
#> 3253               1                 0                 0
#> 3254               1                 0                 0
#> 3255               0                 0                 1
#> 3256               1                 0                 0
#> 3257               1                 0                 0
#> 3258               1                 0                 0
#> 3259               0                 0                 1
#> 3260               0                 0                 1
#> 3261               1                 0                 0
#> 3262               1                 0                 0
#> 3263               1                 0                 0
#> 3264               1                 0                 0
#> 3265               1                 0                 0
#> 3266               0                 0                 1
#> 3267               1                 0                 0
#> 3268               1                 0                 0
#> 3269               1                 0                 0
#> 3270               1                 0                 0
#> 3271               1                 0                 0
#> 3272               1                 0                 0
#> 3273               0                 0                 1
#> 3274               0                 1                 0
#> 3275               1                 0                 0
#> 3276               1                 0                 0
#> 3277               1                 0                 0
#> 3278               1                 0                 0
#> 3279               1                 0                 0
#> 3280               1                 0                 0
#> 3281               1                 0                 0
#> 3282               1                 0                 0
#> 3283               1                 0                 0
#> 3284               1                 0                 0
#> 3285               1                 0                 0
#> 3286               0                 0                 1
#> 3287               0                 0                 1
#> 3288               1                 0                 0
#> 3289               1                 0                 0
#> 3290               1                 0                 0
#> 3291               1                 0                 0
#> 3292               1                 0                 0
#> 3293               1                 0                 0
#> 3294               1                 0                 0
#> 3295               0                 1                 0
#> 3296               0                 1                 0
#> 3297               0                 0                 1
#> 3298               0                 0                 1
#> 3299               1                 0                 0
#> 3300               1                 0                 0
#> 3301               1                 0                 0
#> 3302               1                 0                 0
#> 3303               1                 0                 0
#> 3304               0                 0                 1
#> 3305               1                 0                 0
#> 3306               1                 0                 0
#> 3307               1                 0                 0
#> 3308               1                 0                 0
#> 3309               1                 0                 0
#> 3310               1                 0                 0
#> 3311               1                 0                 0
#> 3312               1                 0                 0
#> 3313               1                 0                 0
#> 3314               1                 0                 0
#> 3315               1                 0                 0
#> 3316               1                 0                 0
#> 3317               0                 0                 1
#> 3318               1                 0                 0
#> 3319               0                 0                 1
#> 3320               1                 0                 0
#> 3321               0                 0                 1
#> 3322               1                 0                 0
#> 3323               1                 0                 0
#> 3324               0                 0                 1
#> 3325               1                 0                 0
#> 3326               1                 0                 0
#> 3327               1                 0                 0
#> 3328               0                 1                 0
#> 3329               1                 0                 0
#> 3330               1                 0                 0
#> 3331               1                 0                 0
#> 3332               1                 0                 0
#> 3333               0                 0                 1
#> 3334               1                 0                 0
#> 3335               1                 0                 0
#> 3336               1                 0                 0
#> 3337               0                 1                 0
#> 3338               1                 0                 0
#> 3339               1                 0                 0
#> 3340               1                 0                 0
#> 3341               1                 0                 0
#> 3342               1                 0                 0
#> 3343               1                 0                 0
#> 3344               1                 0                 0
#> 3345               1                 0                 0
#> 3346               1                 0                 0
#> 3347               1                 0                 0
#> 3348               1                 0                 0
#> 3349               1                 0                 0
#> 3350               1                 0                 0
#> 3351               1                 0                 0
#> 3352               1                 0                 0
#> 3353               1                 0                 0
#> 3354               1                 0                 0
#> 3355               1                 0                 0
#> 3356               0                 0                 1
#> 3357               1                 0                 0
#> 3358               0                 0                 1
#> 3359               0                 0                 1
#> 3360               1                 0                 0
#> 3361               1                 0                 0
#> 3362               1                 0                 0
#> 3363               1                 0                 0
#> 3364               0                 0                 1
#> 3365               1                 0                 0
#> 3366               1                 0                 0
#> 3367               1                 0                 0
#> 3368               1                 0                 0
#> 3369               0                 0                 1
#> 3370               1                 0                 0
#> 3371               1                 0                 0
#> 3372               1                 0                 0
#> 3373               1                 0                 0
#> 3374               1                 0                 0
#> 3375               1                 0                 0
#> 3376               1                 0                 0
#> 3377               0                 0                 1
#> 3378               0                 0                 1
#> 3379               1                 0                 0
#> 3380               1                 0                 0
#> 3381               1                 0                 0
#> 3382               1                 0                 0
#> 3383               1                 0                 0
#> 3384               1                 0                 0
#> 3385               1                 0                 0
#> 3386               1                 0                 0
#> 3387               0                 0                 1
#> 3388               1                 0                 0
#> 3389               1                 0                 0
#> 3390               1                 0                 0
#> 3391               1                 0                 0
#> 3392               1                 0                 0
#> 3393               0                 0                 1
#> 3394               0                 1                 0
#> 3395               1                 0                 0
#> 3396               0                 0                 1
#> 3397               1                 0                 0
#> 3398               1                 0                 0
#> 3399               1                 0                 0
#> 3400               0                 1                 0
#> 3401               1                 0                 0
#> 3402               1                 0                 0
#> 3403               1                 0                 0
#> 3404               1                 0                 0
#> 3405               1                 0                 0
#> 3406               0                 0                 1
#> 3407               1                 0                 0
#> 3408               0                 0                 1
#> 3409               1                 0                 0
#> 3410               1                 0                 0
#> 3411               1                 0                 0
#> 3412               1                 0                 0
#> 3413               1                 0                 0
#> 3414               1                 0                 0
#> 3415               1                 0                 0
#> 3416               1                 0                 0
#> 3417               0                 1                 0
#> 3418               1                 0                 0
#> 3419               0                 0                 1
#> 3420               1                 0                 0
#> 3421               0                 1                 0
#> 3422               1                 0                 0
#> 3423               1                 0                 0
#> 3424               1                 0                 0
#> 3425               1                 0                 0
#> 3426               1                 0                 0
#> 3427               0                 0                 1
#> 3428               1                 0                 0
#> 3429               0                 0                 1
#> 3430               1                 0                 0
#> 3431               1                 0                 0
#> 3432               1                 0                 0
#> 3433               1                 0                 0
#> 3434               1                 0                 0
#> 3435               1                 0                 0
#> 3436               1                 0                 0
#> 3437               1                 0                 0
#> 3438               1                 0                 0
#> 3439               1                 0                 0
#> 3440               1                 0                 0
#> 3441               1                 0                 0
#> 3442               1                 0                 0
#> 3443               1                 0                 0
#> 3444               1                 0                 0
#> 3445               1                 0                 0
#> 3446               0                 1                 0
#> 3447               0                 0                 1
#> 3448               1                 0                 0
#> 3449               1                 0                 0
#> 3450               1                 0                 0
#> 3451               1                 0                 0
#> 3452               0                 0                 1
#> 3453               1                 0                 0
#> 3454               1                 0                 0
#> 3455               1                 0                 0
#> 3456               1                 0                 0
#> 3457               1                 0                 0
#> 3458               1                 0                 0
#> 3459               1                 0                 0
#> 3460               1                 0                 0
#> 3461               0                 0                 1
#> 3462               0                 0                 1
#> 3463               1                 0                 0
#> 3464               1                 0                 0
#> 3465               1                 0                 0
#> 3466               1                 0                 0
#> 3467               1                 0                 0
#> 3468               1                 0                 0
#> 3469               1                 0                 0
#> 3470               1                 0                 0
#> 3471               0                 0                 1
#> 3472               1                 0                 0
#> 3473               1                 0                 0
#> 3474               1                 0                 0
#> 3475               1                 0                 0
#> 3476               1                 0                 0
#> 3477               1                 0                 0
#> 3478               0                 0                 1
#> 3479               0                 0                 1
#> 3480               0                 0                 1
#> 3481               1                 0                 0
#> 3482               1                 0                 0
#> 3483               0                 1                 0
#> 3484               1                 0                 0
#> 3485               0                 0                 1
#> 3486               1                 0                 0
#> 3487               0                 1                 0
#> 3488               0                 0                 1
#> 3489               0                 0                 1
#> 3490               1                 0                 0
#> 3491               1                 0                 0
#> 3492               1                 0                 0
#> 3493               1                 0                 0
#> 3494               1                 0                 0
#> 3495               1                 0                 0
#> 3496               0                 0                 1
#> 3497               1                 0                 0
#> 3498               1                 0                 0
#> 3499               1                 0                 0
#> 3500               1                 0                 0
#> 3501               1                 0                 0
#> 3502               1                 0                 0
#> 3503               1                 0                 0
#> 3504               1                 0                 0
#> 3505               1                 0                 0
#> 3506               0                 1                 0
#> 3507               1                 0                 0
#> 3508               1                 0                 0
#> 3509               1                 0                 0
#> 3510               1                 0                 0
#> 3511               1                 0                 0
#> 3512               1                 0                 0
#> 3513               1                 0                 0
#> 3514               1                 0                 0
#> 3515               0                 0                 1
#> 3516               1                 0                 0
#> 3517               0                 0                 1
#> 3518               1                 0                 0
#> 3519               0                 0                 1
#> 3520               0                 0                 1
#> 3521               1                 0                 0
#> 3522               1                 0                 0
#> 3523               1                 0                 0
#> 3524               1                 0                 0
#> 3525               1                 0                 0
#> 3526               1                 0                 0
#> 3527               1                 0                 0
#> 3528               1                 0                 0
#> 3529               1                 0                 0
#> 3530               1                 0                 0
#> 3531               1                 0                 0
#> 3532               1                 0                 0
#> 3533               1                 0                 0
#> 3534               1                 0                 0
#> 3535               1                 0                 0
#> 3536               0                 0                 1
#> 3537               0                 0                 1
#> 3538               1                 0                 0
#> 3539               0                 1                 0
#> 3540               1                 0                 0
#> 3541               1                 0                 0
#> 3542               1                 0                 0
#> 3543               0                 0                 1
#> 3544               1                 0                 0
#> 3545               1                 0                 0
#> 3546               1                 0                 0
#> 3547               1                 0                 0
#> 3548               1                 0                 0
#> 3549               1                 0                 0
#> 3550               1                 0                 0
#> 3551               1                 0                 0
#> 3552               1                 0                 0
#> 3553               0                 1                 0
#> 3554               1                 0                 0
#> 3555               1                 0                 0
#> 3556               0                 0                 1
#> 3557               0                 0                 1
#> 3558               1                 0                 0
#> 3559               1                 0                 0
#> 3560               1                 0                 0
#> 3561               1                 0                 0
#> 3562               1                 0                 0
#> 3563               0                 0                 1
#> 3564               1                 0                 0
#> 3565               1                 0                 0
#> 3566               1                 0                 0
#> 3567               1                 0                 0
#> 3568               1                 0                 0
#> 3569               1                 0                 0
#> 3570               1                 0                 0
#> 3571               1                 0                 0
#> 3572               0                 0                 1
#> 3573               1                 0                 0
#> 3574               1                 0                 0
#> 3575               1                 0                 0
#> 3576               1                 0                 0
#> 3577               1                 0                 0
#> 3578               1                 0                 0
#> 3579               1                 0                 0
#> 3580               1                 0                 0
#> 3581               1                 0                 0
#> 3582               1                 0                 0
#> 3583               1                 0                 0
#> 3584               0                 0                 1
#> 3585               0                 0                 1
#> 3586               1                 0                 0
#> 3587               1                 0                 0
#> 3588               1                 0                 0
#> 3589               1                 0                 0
#> 3590               1                 0                 0
#> 3591               1                 0                 0
#> 3592               1                 0                 0
#> 3593               1                 0                 0
#> 3594               1                 0                 0
#> 3595               1                 0                 0
#> 3596               1                 0                 0
#> 3597               1                 0                 0
#> 3598               1                 0                 0
#> 3599               1                 0                 0
#> 3600               1                 0                 0
#> 3601               1                 0                 0
#> 3602               1                 0                 0
#> 3603               1                 0                 0
#> 3604               1                 0                 0
#> 3605               1                 0                 0
#> 3606               1                 0                 0
#> 3607               1                 0                 0
#> 3608               1                 0                 0
#> 3609               0                 0                 1
#> 3610               1                 0                 0
#> 3611               1                 0                 0
#> 3612               0                 0                 1
#> 3613               1                 0                 0
#> 3614               1                 0                 0
#> 3615               0                 0                 1
#> 3616               1                 0                 0
#> 3617               1                 0                 0
#> 3618               1                 0                 0
#> 3619               1                 0                 0
#> 3620               1                 0                 0
#> 3621               1                 0                 0
#> 3622               1                 0                 0
#> 3623               1                 0                 0
#> 3624               1                 0                 0
#> 3625               1                 0                 0
#> 3626               1                 0                 0
#> 3627               1                 0                 0
#> 3628               1                 0                 0
#> 3629               1                 0                 0
#> 3630               1                 0                 0
#> 3631               1                 0                 0
#> 3632               1                 0                 0
#> 3633               1                 0                 0
#> 3634               1                 0                 0
#> 3635               0                 0                 1
#> 3636               1                 0                 0
#> 3637               1                 0                 0
#> 3638               1                 0                 0
#> 3639               1                 0                 0
#> 3640               1                 0                 0
#> 3641               1                 0                 0
#> 3642               1                 0                 0
#> 3643               1                 0                 0
#> 3644               0                 0                 1
#> 3645               1                 0                 0
#> 3646               1                 0                 0
#> 3647               1                 0                 0
#> 3648               1                 0                 0
#> 3649               0                 0                 1
#> 3650               1                 0                 0
#> 3651               1                 0                 0
#> 3652               1                 0                 0
#> 3653               1                 0                 0
#> 3654               1                 0                 0
#> 3655               0                 0                 1
#> 3656               1                 0                 0
#> 3657               0                 0                 1
#> 3658               1                 0                 0
#> 3659               1                 0                 0
#> 3660               0                 0                 1
#> 3661               0                 0                 1
#> 3662               1                 0                 0
#> 3663               1                 0                 0
#> 3664               1                 0                 0
#> 3665               1                 0                 0
#> 3666               0                 0                 1
#> 3667               1                 0                 0
#> 3668               1                 0                 0
#> 3669               0                 1                 0
#> 3670               0                 0                 1
#> 3671               1                 0                 0
#> 3672               0                 0                 1
#> 3673               0                 0                 1
#> 3674               1                 0                 0
#> 3675               1                 0                 0
#> 3676               1                 0                 0
#> 3677               1                 0                 0
#> 3678               0                 0                 1
#> 3679               0                 0                 1
#> 3680               1                 0                 0
#> 3681               1                 0                 0
#> 3682               1                 0                 0
#> 3683               1                 0                 0
#> 3684               1                 0                 0
#> 3685               1                 0                 0
#> 3686               0                 0                 1
#> 3687               0                 0                 1
#> 3688               1                 0                 0
#> 3689               1                 0                 0
#> 3690               0                 0                 1
#> 3691               1                 0                 0
#> 3692               1                 0                 0
#> 3693               1                 0                 0
#> 3694               1                 0                 0
#> 3695               1                 0                 0
#> 3696               1                 0                 0
#> 3697               1                 0                 0
#> 3698               1                 0                 0
#> 3699               1                 0                 0
#> 3700               1                 0                 0
#> 3701               1                 0                 0
#> 3702               1                 0                 0
#> 3703               1                 0                 0
#> 3704               1                 0                 0
#> 3705               1                 0                 0
#> 3706               0                 0                 1
#> 3707               1                 0                 0
#> 3708               1                 0                 0
#> 3709               0                 0                 1
#> 3710               1                 0                 0
#> 3711               1                 0                 0
#> 3712               1                 0                 0
#> 3713               1                 0                 0
#> 3714               1                 0                 0
#> 3715               1                 0                 0
#> 3716               1                 0                 0
#> 3717               1                 0                 0
#> 3718               1                 0                 0
#> 3719               1                 0                 0
#> 3720               1                 0                 0
#> 3721               1                 0                 0
#> 3722               1                 0                 0
#> 3723               1                 0                 0
#> 3724               1                 0                 0
#> 3725               1                 0                 0
#> 3726               0                 0                 1
#> 3727               1                 0                 0
#> 3728               0                 0                 1
#> 3729               1                 0                 0
#> 3730               1                 0                 0
#> 3731               1                 0                 0
#> 3732               1                 0                 0
#> 3733               0                 0                 1
#> 3734               1                 0                 0
#> 3735               0                 0                 1
#> 3736               1                 0                 0
#> 3737               0                 0                 1
#> 3738               1                 0                 0
#> 3739               1                 0                 0
#> 3740               1                 0                 0
#> 3741               1                 0                 0
#> 3742               0                 0                 1
#> 3743               1                 0                 0
#> 3744               1                 0                 0
#> 3745               1                 0                 0
#> 3746               0                 0                 1
#> 3747               0                 0                 1
#> 3748               1                 0                 0
#> 3749               1                 0                 0
#> 3750               1                 0                 0
#> 3751               1                 0                 0
#> 3752               1                 0                 0
#> 3753               1                 0                 0
#> 3754               1                 0                 0
#> 3755               1                 0                 0
#> 3756               1                 0                 0
#> 3757               1                 0                 0
#> 3758               1                 0                 0
#> 3759               0                 0                 1
#> 3760               1                 0                 0
#> 3761               1                 0                 0
#> 3762               1                 0                 0
#> 3763               1                 0                 0
#> 3764               1                 0                 0
#> 3765               1                 0                 0
#> 3766               1                 0                 0
#> 3767               1                 0                 0
#> 3768               1                 0                 0
#> 3769               1                 0                 0
#> 3770               0                 0                 1
#> 3771               1                 0                 0
#> 3772               1                 0                 0
#> 3773               1                 0                 0
#> 3774               1                 0                 0
#> 3775               1                 0                 0
#> 3776               1                 0                 0
#> 3777               1                 0                 0
#> 3778               1                 0                 0
#> 3779               0                 0                 1
#> 3780               1                 0                 0
#> 3781               1                 0                 0
#> 3782               1                 0                 0
#> 3783               1                 0                 0
#> 3784               1                 0                 0
#> 3785               1                 0                 0
#> 3786               1                 0                 0
#> 3787               1                 0                 0
#> 3788               1                 0                 0
#> 3789               1                 0                 0
#> 3790               1                 0                 0
#> 3791               1                 0                 0
#> 3792               1                 0                 0
#> 3793               0                 1                 0
#> 3794               1                 0                 0
#> 3795               1                 0                 0
#> 3796               1                 0                 0
#> 3797               1                 0                 0
#> 3798               1                 0                 0
#> 3799               1                 0                 0
#> 3800               1                 0                 0
#> 3801               1                 0                 0
#> 3802               0                 0                 1
#> 3803               1                 0                 0
#> 3804               1                 0                 0
#> 3805               1                 0                 0
#> 3806               1                 0                 0
#> 3807               1                 0                 0
#> 3808               1                 0                 0
#> 3809               0                 1                 0
#> 3810               1                 0                 0
#> 3811               1                 0                 0
#> 3812               1                 0                 0
#> 3813               1                 0                 0
#> 3814               1                 0                 0
#> 3815               1                 0                 0
#> 3816               1                 0                 0
#> 3817               1                 0                 0
#> 3818               1                 0                 0
#> 3819               1                 0                 0
#> 3820               1                 0                 0
#> 3821               1                 0                 0
#> 3822               1                 0                 0
#> 3823               1                 0                 0
#> 3824               1                 0                 0
#> 3825               1                 0                 0
#> 3826               1                 0                 0
#> 3827               1                 0                 0
#> 3828               1                 0                 0
#> 3829               1                 0                 0
#> 3830               1                 0                 0
#> 3831               1                 0                 0
#> 3832               1                 0                 0
#> 3833               1                 0                 0
#> 3834               1                 0                 0
#> 3835               1                 0                 0
#> 3836               1                 0                 0
#> 3837               1                 0                 0
#> 3838               0                 0                 1
#> 3839               1                 0                 0
#> 3840               1                 0                 0
#> 3841               0                 1                 0
#> 3842               1                 0                 0
#> 3843               0                 0                 1
#> 3844               1                 0                 0
#> 3845               0                 0                 1
#> 3846               1                 0                 0
#> 3847               1                 0                 0
#> 3848               1                 0                 0
#> 3849               1                 0                 0
#> 3850               1                 0                 0
#> 3851               1                 0                 0
#> 3852               1                 0                 0
#> 3853               1                 0                 0
#> 3854               1                 0                 0
#> 3855               1                 0                 0
#> 3856               1                 0                 0
#> 3857               0                 0                 1
#> 3858               0                 1                 0
#> 3859               1                 0                 0
#> 3860               1                 0                 0
#> 3861               1                 0                 0
#> 3862               1                 0                 0
#> 3863               1                 0                 0
#> 3864               0                 0                 1
#> 3865               1                 0                 0
#> 3866               1                 0                 0
#> 3867               1                 0                 0
#> 3868               1                 0                 0
#> 3869               1                 0                 0
#> 3870               1                 0                 0
#> 3871               1                 0                 0
#> 3872               1                 0                 0
#> 3873               0                 0                 1
#> 3874               0                 0                 1
#> 3875               0                 0                 1
#> 3876               1                 0                 0
#> 3877               0                 0                 1
#> 3878               1                 0                 0
#> 3879               1                 0                 0
#> 3880               1                 0                 0
#> 3881               1                 0                 0
#> 3882               0                 1                 0
#> 3883               1                 0                 0
#> 3884               1                 0                 0
#> 3885               1                 0                 0
#> 3886               1                 0                 0
#> 3887               1                 0                 0
#> 3888               1                 0                 0
#> 3889               1                 0                 0
#> 3890               0                 1                 0
#> 3891               1                 0                 0
#> 3892               1                 0                 0
#> 3893               1                 0                 0
#> 3894               1                 0                 0
#> 3895               0                 0                 1
#> 3896               1                 0                 0
#> 3897               0                 1                 0
#> 3898               1                 0                 0
#> 3899               1                 0                 0
#> 3900               1                 0                 0
#> 3901               1                 0                 0
#> 3902               0                 0                 1
#> 3903               1                 0                 0
#> 3904               1                 0                 0
#> 3905               0                 1                 0
#> 3906               1                 0                 0
#> 3907               1                 0                 0
#> 3908               1                 0                 0
#> 3909               0                 0                 1
#> 3910               1                 0                 0
#> 3911               1                 0                 0
#> 3912               1                 0                 0
#> 3913               0                 0                 1
#> 3914               1                 0                 0
#> 3915               1                 0                 0
#> 3916               1                 0                 0
#> 3917               1                 0                 0
#> 3918               1                 0                 0
#> 3919               1                 0                 0
#> 3920               1                 0                 0
#> 3921               1                 0                 0
#> 3922               1                 0                 0
#> 3923               1                 0                 0
#> 3924               1                 0                 0
#> 3925               1                 0                 0
#> 3926               1                 0                 0
#> 3927               1                 0                 0
#> 3928               1                 0                 0
#> 3929               1                 0                 0
#> 3930               1                 0                 0
#> 3931               1                 0                 0
#> 3932               0                 0                 1
#> 3933               0                 0                 1
#> 3934               1                 0                 0
#> 3935               0                 0                 1
#> 3936               1                 0                 0
#> 3937               0                 0                 1
#> 3938               0                 0                 1
#> 3939               1                 0                 0
#> 3940               1                 0                 0
#> 3941               0                 0                 1
#> 3942               1                 0                 0
#> 3943               1                 0                 0
#> 3944               1                 0                 0
#> 3945               1                 0                 0
#> 3946               1                 0                 0
#> 3947               1                 0                 0
#> 3948               1                 0                 0
#> 3949               0                 0                 1
#> 3950               0                 0                 1
#> 3951               0                 1                 0
#> 3952               1                 0                 0
#> 3953               1                 0                 0
#> 3954               1                 0                 0
#> 3955               1                 0                 0
#> 3956               0                 0                 1
#> 3957               1                 0                 0
#> 3958               0                 0                 1
#> 3959               1                 0                 0
#> 3960               1                 0                 0
#> 3961               1                 0                 0
#> 3962               0                 1                 0
#> 3963               1                 0                 0
#> 3964               1                 0                 0
#> 3965               1                 0                 0
#> 3966               1                 0                 0
#> 3967               1                 0                 0
#> 3968               1                 0                 0
#> 3969               1                 0                 0
#> 3970               1                 0                 0
#> 3971               0                 1                 0
#> 3972               1                 0                 0
#> 3973               1                 0                 0
#> 3974               1                 0                 0
#> 3975               1                 0                 0
#> 3976               1                 0                 0
#> 3977               1                 0                 0
#> 3978               1                 0                 0
#> 3979               1                 0                 0
#> 3980               1                 0                 0
#> 3981               0                 1                 0
#> 3982               1                 0                 0
#> 3983               1                 0                 0
#> 3984               0                 0                 1
#> 3985               1                 0                 0
#> 3986               1                 0                 0
#> 3987               1                 0                 0
#> 3988               0                 0                 1
#> 3989               1                 0                 0
#> 3990               1                 0                 0
#> 3991               1                 0                 0
#> 3992               0                 0                 1
#> 3993               1                 0                 0
#> 3994               1                 0                 0
#> 3995               1                 0                 0
#> 3996               1                 0                 0
#> 3997               1                 0                 0
#> 3998               1                 0                 0
#> 3999               0                 0                 1
#> 4000               1                 0                 0
#> 4001               1                 0                 0
#> 4002               1                 0                 0
#> 4003               1                 0                 0
#> 4004               1                 0                 0
#> 4005               0                 1                 0
#> 4006               1                 0                 0
#> 4007               1                 0                 0
#> 4008               1                 0                 0
#> 4009               1                 0                 0
#> 4010               0                 0                 1
#> 4011               0                 0                 1
#> 4012               1                 0                 0
#> 4013               1                 0                 0
#> 4014               1                 0                 0
#> 4015               0                 0                 1
#> 4016               1                 0                 0
#> 4017               1                 0                 0
#> 4018               1                 0                 0
#> 4019               1                 0                 0
#> 4020               1                 0                 0
#> 4021               1                 0                 0
#> 4022               1                 0                 0
#> 4023               1                 0                 0
#> 4024               1                 0                 0
#> 4025               1                 0                 0
#> 4026               1                 0                 0
#> 4027               1                 0                 0
#> 4028               1                 0                 0
#> 4029               0                 0                 1
#> 4030               1                 0                 0
#> 4031               0                 0                 1
#> 4032               1                 0                 0
#> 4033               1                 0                 0
#> 4034               1                 0                 0
#> 4035               1                 0                 0
#> 4036               1                 0                 0
#> 4037               1                 0                 0
#> 4038               1                 0                 0
#> 4039               0                 0                 1
#> 4040               1                 0                 0
#> 4041               1                 0                 0
#> 4042               1                 0                 0
#> 4043               0                 0                 1
#> 4044               1                 0                 0
#> 4045               1                 0                 0
#> 4046               1                 0                 0
#> 4047               1                 0                 0
#> 4048               1                 0                 0
#> 4049               1                 0                 0
#> 4050               0                 0                 1
#> 4051               1                 0                 0
#> 4052               1                 0                 0
#> 4053               1                 0                 0
#> 4054               1                 0                 0
#> 4055               1                 0                 0
#> 4056               1                 0                 0
#> 4057               1                 0                 0
#> 4058               1                 0                 0
#> 4059               1                 0                 0
#> 4060               0                 0                 1
#> 4061               1                 0                 0
#> 4062               1                 0                 0
#> 4063               1                 0                 0
#> 4064               1                 0                 0
#> 4065               0                 0                 1
#> 4066               1                 0                 0
#> 4067               1                 0                 0
#> 4068               1                 0                 0
#> 4069               1                 0                 0
#> 4070               1                 0                 0
#> 4071               0                 0                 1
#> 4072               1                 0                 0
#> 4073               1                 0                 0
#> 4074               1                 0                 0
#> 4075               1                 0                 0
#> 4076               1                 0                 0
#> 4077               1                 0                 0
#> 4078               1                 0                 0
#> 4079               0                 0                 1
#> 4080               1                 0                 0
#> 4081               0                 0                 1
#> 4082               1                 0                 0
#> 4083               1                 0                 0
#> 4084               1                 0                 0
#> 4085               1                 0                 0
#> 4086               1                 0                 0
#> 4087               1                 0                 0
#> 4088               1                 0                 0
#> 4089               1                 0                 0
#> 4090               0                 0                 1
#> 4091               1                 0                 0
#> 4092               1                 0                 0
#> 4093               0                 0                 1
#> 4094               1                 0                 0
#> 4095               0                 0                 1
#> 4096               1                 0                 0
#> 4097               1                 0                 0
#> 4098               1                 0                 0
#> 4099               1                 0                 0
#> 4100               1                 0                 0
#> 4101               0                 1                 0
#> 4102               1                 0                 0
#> 4103               1                 0                 0
#> 4104               1                 0                 0
#> 4105               1                 0                 0
#> 4106               1                 0                 0
#> 4107               1                 0                 0
#> 4108               0                 0                 1
#> 4109               1                 0                 0
#> 4110               1                 0                 0
#> 4111               0                 0                 1
#> 4112               1                 0                 0
#> 4113               1                 0                 0
#> 4114               1                 0                 0
#> 4115               0                 0                 1
#> 4116               0                 0                 1
#> 4117               1                 0                 0
#> 4118               1                 0                 0
#> 4119               1                 0                 0
#> 4120               1                 0                 0
#> 4121               1                 0                 0
#> 4122               1                 0                 0
#> 4123               1                 0                 0
#> 4124               1                 0                 0
#> 4125               1                 0                 0
#> 4126               1                 0                 0
#> 4127               1                 0                 0
#> 4128               0                 0                 1
#> 4129               1                 0                 0
#> 4130               1                 0                 0
#> 4131               1                 0                 0
#> 4132               1                 0                 0
#> 4133               1                 0                 0
#> 4134               0                 0                 1
#> 4135               1                 0                 0
#> 4136               1                 0                 0
#> 4137               0                 0                 1
#> 4138               0                 0                 1
#> 4139               0                 0                 1
#> 4140               1                 0                 0
#> 4141               1                 0                 0
#> 4142               1                 0                 0
#> 4143               1                 0                 0
#> 4144               1                 0                 0
#> 4145               1                 0                 0
#> 4146               1                 0                 0
#> 4147               1                 0                 0
#> 4148               1                 0                 0
#> 4149               1                 0                 0
#> 4150               0                 1                 0
#> 4151               1                 0                 0
#> 4152               1                 0                 0
#> 4153               1                 0                 0
#> 4154               1                 0                 0
#> 4155               1                 0                 0
#> 4156               0                 1                 0
#> 4157               1                 0                 0
#> 4158               1                 0                 0
#> 4159               0                 0                 1
#> 4160               1                 0                 0
#> 4161               1                 0                 0
#> 4162               1                 0                 0
#> 4163               1                 0                 0
#> 4164               1                 0                 0
#> 4165               1                 0                 0
#> 4166               1                 0                 0
#> 4167               1                 0                 0
#> 4168               1                 0                 0
#> 4169               0                 0                 1
#> 4170               1                 0                 0
#> 4171               1                 0                 0
#> 4172               1                 0                 0
#> 4173               1                 0                 0
#> 4174               0                 0                 1
#> 4175               0                 0                 1
#> 4176               1                 0                 0
#> 4177               1                 0                 0
#> 4178               1                 0                 0
#> 4179               1                 0                 0
#> 4180               1                 0                 0
#> 4181               1                 0                 0
#> 4182               1                 0                 0
#> 4183               1                 0                 0
#> 4184               1                 0                 0
#> 4185               1                 0                 0
#> 4186               1                 0                 0
#> 4187               1                 0                 0
#> 4188               1                 0                 0
#> 4189               1                 0                 0
#> 4190               1                 0                 0
#> 4191               1                 0                 0
#> 4192               1                 0                 0
#> 4193               1                 0                 0
#> 4194               1                 0                 0
#> 4195               1                 0                 0
#> 4196               1                 0                 0
#> 4197               1                 0                 0
#> 4198               1                 0                 0
#> 4199               1                 0                 0
#> 4200               1                 0                 0
#> 4201               1                 0                 0
#> 4202               1                 0                 0
#> 4203               0                 0                 1
#> 4204               1                 0                 0
#> 4205               1                 0                 0
#> 4206               0                 0                 1
#> 4207               1                 0                 0
#> 4208               1                 0                 0
#> 4209               1                 0                 0
#> 4210               1                 0                 0
#> 4211               0                 0                 1
#> 4212               1                 0                 0
#> 4213               1                 0                 0
#> 4214               1                 0                 0
#> 4215               1                 0                 0
#> 4216               1                 0                 0
#> 4217               1                 0                 0
#> 4218               1                 0                 0
#> 4219               0                 0                 1
#> 4220               1                 0                 0
#> 4221               1                 0                 0
#> 4222               1                 0                 0
#> 4223               1                 0                 0
#> 4224               1                 0                 0
#> 4225               1                 0                 0
#> 4226               1                 0                 0
#> 4227               1                 0                 0
#> 4228               1                 0                 0
#> 4229               1                 0                 0
#> 4230               1                 0                 0
#> 4231               1                 0                 0
#> 4232               1                 0                 0
#> 4233               1                 0                 0
#> 4234               1                 0                 0
#> 4235               0                 0                 1
#> 4236               1                 0                 0
#> 4237               0                 0                 1
#> 4238               1                 0                 0
#> 4239               0                 0                 1
#> 4240               1                 0                 0
#> 4241               1                 0                 0
#> 4242               1                 0                 0
#> 4243               0                 0                 1
#> 4244               1                 0                 0
#> 4245               0                 0                 1
#> 4246               0                 0                 1
#> 4247               1                 0                 0
#> 4248               1                 0                 0
#> 4249               1                 0                 0
#> 4250               1                 0                 0
#> 4251               1                 0                 0
#> 4252               0                 0                 1
#> 4253               1                 0                 0
#> 4254               1                 0                 0
#> 4255               1                 0                 0
#> 4256               1                 0                 0
#> 4257               1                 0                 0
#> 4258               1                 0                 0
#> 4259               1                 0                 0
#> 4260               1                 0                 0
#> 4261               1                 0                 0
#> 4262               1                 0                 0
#> 4263               1                 0                 0
#> 4264               1                 0                 0
#> 4265               1                 0                 0
#> 4266               1                 0                 0
#> 4267               1                 0                 0
#> 4268               0                 0                 1
#> 4269               1                 0                 0
#> 4270               0                 0                 1
#> 4271               1                 0                 0
#> 4272               1                 0                 0
#> 4273               1                 0                 0
#> 4274               0                 0                 1
#> 4275               1                 0                 0
#> 4276               1                 0                 0
#> 4277               1                 0                 0
#> 4278               0                 0                 1
#> 4279               1                 0                 0
#> 4280               0                 0                 1
#> 4281               1                 0                 0
#> 4282               1                 0                 0
#> 4283               1                 0                 0
#> 4284               1                 0                 0
#> 4285               1                 0                 0
#> 4286               0                 0                 1
#> 4287               1                 0                 0
#> 4288               1                 0                 0
#> 4289               1                 0                 0
#> 4290               1                 0                 0
#> 4291               1                 0                 0
#> 4292               1                 0                 0
#> 4293               1                 0                 0
#> 4294               1                 0                 0
#> 4295               1                 0                 0
#> 4296               1                 0                 0
#> 4297               1                 0                 0
#> 4298               1                 0                 0
#> 4299               0                 0                 1
#> 4300               1                 0                 0
#> 4301               0                 0                 1
#> 4302               1                 0                 0
#> 4303               1                 0                 0
#> 4304               1                 0                 0
#> 4305               1                 0                 0
#> 4306               1                 0                 0
#> 4307               1                 0                 0
#> 4308               1                 0                 0
#> 4309               1                 0                 0
#> 4310               1                 0                 0
#> 4311               0                 0                 1
#> 4312               1                 0                 0
#> 4313               1                 0                 0
#> 4314               1                 0                 0
#> 4315               1                 0                 0
#> 4316               1                 0                 0
#> 4317               1                 0                 0
#> 4318               1                 0                 0
#> 4319               1                 0                 0
#> 4320               1                 0                 0
#> 4321               0                 1                 0
#> 4322               1                 0                 0
#> 4323               0                 0                 1
#> 4324               1                 0                 0
#> 4325               0                 0                 1
#> 4326               1                 0                 0
#> 4327               1                 0                 0
#> 4328               1                 0                 0
#> 4329               1                 0                 0
#> 4330               1                 0                 0
#> 4331               1                 0                 0
#> 4332               1                 0                 0
#> 4333               1                 0                 0
#> 4334               1                 0                 0
#> 4335               1                 0                 0
#> 4336               1                 0                 0
#> 4337               1                 0                 0
#> 4338               1                 0                 0
#> 4339               1                 0                 0
#> 4340               1                 0                 0
#> 4341               0                 0                 1
#> 4342               1                 0                 0
#> 4343               1                 0                 0
#> 4344               1                 0                 0
#> 4345               1                 0                 0
#> 4346               1                 0                 0
#> 4347               1                 0                 0
#> 4348               0                 1                 0
#> 4349               1                 0                 0
#> 4350               1                 0                 0
#> 4351               0                 1                 0
#> 4352               1                 0                 0
#> 4353               1                 0                 0
#> 4354               1                 0                 0
#> 4355               1                 0                 0
#> 4356               1                 0                 0
#> 4357               1                 0                 0
#> 4358               1                 0                 0
#> 4359               1                 0                 0
#> 4360               1                 0                 0
#> 4361               0                 1                 0
#> 4362               0                 0                 1
#> 4363               1                 0                 0
#> 4364               1                 0                 0
#> 4365               1                 0                 0
#> 4366               1                 0                 0
#> 4367               0                 0                 1
#> 4368               1                 0                 0
#> 4369               1                 0                 0
#> 4370               1                 0                 0
#> 4371               1                 0                 0
#> 4372               1                 0                 0
#> 4373               1                 0                 0
#> 4374               0                 0                 1
#> 4375               1                 0                 0
#> 4376               1                 0                 0
#> 4377               1                 0                 0
#> 4378               1                 0                 0
#> 4379               1                 0                 0
#> 4380               1                 0                 0
#> 4381               0                 0                 1
#> 4382               1                 0                 0
#> 4383               1                 0                 0
#> 4384               1                 0                 0
#> 4385               1                 0                 0
#> 4386               1                 0                 0
#> 4387               1                 0                 0
#> 4388               0                 0                 1
#> 4389               1                 0                 0
#> 4390               1                 0                 0
#> 4391               0                 0                 1
#> 4392               1                 0                 0
#> 4393               1                 0                 0
#> 4394               1                 0                 0
#> 4395               1                 0                 0
#> 4396               0                 0                 1
#> 4397               1                 0                 0
#> 4398               1                 0                 0
#> 4399               1                 0                 0
#> 4400               1                 0                 0
#> 4401               1                 0                 0
#> 4402               0                 0                 1
#> 4403               1                 0                 0
#> 4404               1                 0                 0
#> 4405               1                 0                 0
#> 4406               1                 0                 0
#> 4407               1                 0                 0
#> 4408               1                 0                 0
#> 4409               1                 0                 0
#> 4410               0                 0                 1
#> 4411               0                 0                 1
#> 4412               1                 0                 0
#> 4413               1                 0                 0
#> 4414               0                 0                 1
#> 4415               1                 0                 0
#> 4416               1                 0                 0
#> 4417               1                 0                 0
#> 4418               1                 0                 0
#> 4419               1                 0                 0
#> 4420               1                 0                 0
#> 4421               1                 0                 0
#> 4422               1                 0                 0
#> 4423               1                 0                 0
#> 4424               1                 0                 0
#> 4425               1                 0                 0
#> 4426               1                 0                 0
#> 4427               1                 0                 0
#> 4428               0                 0                 1
#> 4429               1                 0                 0
#> 4430               0                 1                 0
#> 4431               1                 0                 0
#> 4432               1                 0                 0
#> 4433               1                 0                 0
#> 4434               1                 0                 0
#> 4435               0                 1                 0
#> 4436               1                 0                 0
#> 4437               1                 0                 0
#> 4438               0                 1                 0
#> 4439               1                 0                 0
#> 4440               0                 0                 1
#> 4441               0                 0                 1
#> 4442               1                 0                 0
#> 4443               1                 0                 0
#> 4444               1                 0                 0
#> 4445               1                 0                 0
#> 4446               1                 0                 0
#> 4447               1                 0                 0
#> 4448               1                 0                 0
#> 4449               1                 0                 0
#> 4450               1                 0                 0
#> 4451               0                 0                 1
#> 4452               0                 0                 1
#> 4453               1                 0                 0
#> 4454               1                 0                 0
#> 4455               0                 0                 1
#> 4456               1                 0                 0
#> 4457               1                 0                 0
#> 4458               1                 0                 0
#> 4459               1                 0                 0
#> 4460               1                 0                 0
#> 4461               1                 0                 0
#> 4462               1                 0                 0
#> 4463               1                 0                 0
#> 4464               0                 0                 1
#> 4465               1                 0                 0
#> 4466               1                 0                 0
#> 4467               1                 0                 0
#> 4468               1                 0                 0
#> 4469               0                 0                 1
#> 4470               1                 0                 0
#> 4471               1                 0                 0
#> 4472               1                 0                 0
#> 4473               1                 0                 0
#> 4474               0                 0                 1
#> 4475               1                 0                 0
#> 4476               1                 0                 0
#> 4477               1                 0                 0
#> 4478               0                 0                 1
#> 4479               1                 0                 0
#> 4480               1                 0                 0
#> 4481               1                 0                 0
#> 4482               1                 0                 0
#> 4483               1                 0                 0
#> 4484               1                 0                 0
#> 4485               1                 0                 0
#> 4486               1                 0                 0
#> 4487               0                 0                 1
#> 4488               1                 0                 0
#> 4489               0                 0                 1
#> 4490               1                 0                 0
#> 4491               0                 0                 1
#> 4492               1                 0                 0
#> 4493               0                 1                 0
#> 4494               1                 0                 0
#> 4495               1                 0                 0
#> 4496               1                 0                 0
#> 4497               1                 0                 0
#> 4498               0                 0                 1
#> 4499               1                 0                 0
#> 4500               1                 0                 0
#> 4501               1                 0                 0
#> 4502               0                 0                 1
#> 4503               1                 0                 0
#> 4504               1                 0                 0
#> 4505               1                 0                 0
#> 4506               1                 0                 0
#> 4507               0                 0                 1
#> 4508               1                 0                 0
#> 4509               0                 0                 1
#> 4510               1                 0                 0
#> 4511               1                 0                 0
#> 4512               1                 0                 0
#> 4513               1                 0                 0
#> 4514               1                 0                 0
#> 4515               1                 0                 0
#> 4516               1                 0                 0
#> 4517               1                 0                 0
#> 4518               1                 0                 0
#> 4519               1                 0                 0
#> 4520               0                 0                 1
#> 4521               1                 0                 0
```
