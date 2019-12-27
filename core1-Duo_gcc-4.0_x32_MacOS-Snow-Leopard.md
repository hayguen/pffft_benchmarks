
### MacOS Snow Leopard, gcc 4.0, 32-bit, fftw 3.3 on a 1.83 GHz core 1 duo

Built with:

```
gcc -o test_pffft -DHAVE_FFTW -DHAVE_VECLIB -O3 -Wall -W pffft.c test_pffft.c fftpack.c -L/usr/local/lib -I/usr/local/include/ -lfftw3f -framework veclib
```

| input len |real FFTPack|  real vDSP |  real FFTW | real PFFFT |cplx FFTPack|  cplx vDSP |  cplx FFTW | cplx PFFFT |
|----------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|
|      64   |      745   |     2145   |     1706   |     2028   |      961   |     3356   |     3313   |     2300   |
|      96   |      877   |      n/a   |     1976   |     1978   |     1059   |      n/a   |     3333   |     2233   |
|     128   |      951   |     2808   |     2213   |     2279   |     1202   |     3803   |     3739   |     2494   |
|     192   |     1002   |      n/a   |     2456   |     2429   |     1186   |      n/a   |     3701   |     2508   |
|     256   |     1065   |     3205   |     2641   |     2793   |     1302   |     4013   |     3912   |     2663   |
|     384   |      845   |      n/a   |     2759   |     2499   |      948   |      n/a   |     3729   |     2504   |
|     512   |      900   |     3476   |     2956   |     2759   |      974   |     4057   |     3954   |     2645   |
|     768   |      910   |      n/a   |     2912   |     2737   |      975   |      n/a   |     3837   |     2614   |
|    1024   |      936   |     3583   |     3107   |     3009   |     1006   |     4124   |     3821   |     2697   |
|    2048   |     1057   |     3585   |     3091   |     2837   |     1089   |     3889   |     3701   |     2513   |
|    4096   |     1083   |     3524   |     3092   |     2733   |     1039   |     3617   |     3462   |     2364   |
|    8192   |      874   |     3252   |     2967   |     2363   |      911   |     3106   |     2789   |     2302   |
|    9216   |      898   |      n/a   |     2420   |     2290   |      865   |      n/a   |     2676   |     2204   |
|   16384   |      903   |     2892   |     2506   |     2421   |      899   |     3026   |     2797   |     2289   |
|   32768   |      965   |     2837   |     2550   |     2358   |      920   |     2922   |     2763   |     2240   |
|  262144   |      738   |     2422   |     1589   |     1708   |      610   |     2038   |     1436   |     1091   |
| 1048576   |      528   |     1207   |      845   |      880   |      606   |     1020   |      669   |     1036   |
