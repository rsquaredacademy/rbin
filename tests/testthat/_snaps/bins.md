# output from rbin_print is as expected

    Code
      rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
    Output
      Binning Summary
      ---------------------------
      Method               Manual 
      Response             y 
      Predictor            age 
      Bins                 10 
      Count                4521 
      Goods                517 
      Bads                 4004 
      Entropy              0.5 
      Information Value    0.12 
      
      
         cut_point bin_count good bad          woe           iv   entropy
      1       < 29       410   71 339 -0.483686036 2.547353e-02 0.6649069
      2       < 31       313   41 272 -0.154776266 1.760055e-03 0.5601482
      3       < 34       567   55 512  0.183985174 3.953685e-03 0.4594187
      4       < 36       396   45 351  0.007117468 4.425063e-06 0.5107878
      5       < 39       519   47 472  0.259825118 7.008270e-03 0.4383322
      6       < 42       431   33 398  0.442938178 1.575567e-02 0.3899626
      7       < 46       449   47 402  0.099298221 9.423907e-04 0.4836486
      8       < 51       521   40 481  0.439981550 1.881380e-02 0.3907140
      9       < 56       445   49 396  0.042587647 1.756117e-04 0.5002548
      10     >= 56       470   89 381 -0.592843261 4.564428e-02 0.7001343

# output from rbin_print_custom  is as expected

    Code
      rbin_factor(mbank, y, education)
    Output
      Binning Summary
      ---------------------------
      Method               Custom 
      Response             y 
      Predictor            education 
      Levels               4 
      Count                4521 
      Goods                517 
      Bads                 4004 
      Entropy              0.51 
      Information Value    0.05 
      
      
            level bin_count good  bad        woe          iv   entropy
      1  tertiary      1299  195 1104 -0.3133106 0.031785905 0.6101292
      2 secondary      2352  231 2121  0.1702190 0.014113157 0.4633093
      3   primary       691   66  625  0.2010906 0.005717878 0.4546110
      4   unknown       179   25  154 -0.2289295 0.002265111 0.5833603

