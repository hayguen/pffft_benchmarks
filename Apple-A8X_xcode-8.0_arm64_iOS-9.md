
### iPad Air 2 with iOS9, xcode 8.0, arm64. The cpu is an Apple A8X, supposedly running at 1.5GHz.

| input len |real FFTPack|  real vDSP | real PFFFT |cplx FFTPack|  cplx vDSP | cplx PFFFT |
|----------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|
|       64  |     2517   |     7995   |     6086   |     2725   |    13006   |     8495   |
|       96  |     2442   |      n/a   |     6691   |     2256   |      n/a   |     7991   |
|      128  |     2664   |    10186   |     7877   |     2575   |    15115   |     9115   |
|      160  |     2638   |      n/a   |     8283   |     2682   |      n/a   |     8806   |
|      192  |     2903   |      n/a   |     9083   |     2634   |      n/a   |     8980   |
|      256  |     3184   |    11452   |    10039   |     3026   |    15410   |    10199   |
|      384  |     2665   |      n/a   |    10100   |     2275   |      n/a   |     9247   |
|      480  |     2546   |      n/a   |     9863   |     2341   |      n/a   |     8892   |
|      512  |     2832   |    12197   |    10989   |     2547   |    16768   |    10154   |
|      640  |     2755   |      n/a   |    10461   |     2569   |      n/a   |     9666   |
|      768  |     2998   |      n/a   |    11355   |     2585   |      n/a   |     9813   |
|      800  |     2516   |      n/a   |    10332   |     2433   |      n/a   |     9164   |
|     1024  |     3109   |    12965   |    12114   |     2869   |    16448   |    10519   |
|     2048  |     3027   |    12996   |    12023   |     2648   |    17304   |    10307   |
|     2400  |     2515   |      n/a   |    10372   |     2355   |      n/a   |     8443   |
|     4096  |     3204   |    13603   |    12359   |     2814   |    16570   |     9780   |
|     8192  |     2759   |    13422   |    10824   |     2153   |    15652   |     7884   |
|     9216  |     2700   |      n/a   |     9938   |     2241   |      n/a   |     7900   |
|    16384  |     2280   |    13057   |     7976   |      593   |     4272   |     2534   |
|    32768  |      768   |     4269   |     2882   |      606   |     4405   |     2604   |
|   262144  |      724   |     3527   |     2630   |      534   |     2418   |     2157   |
|  1048576  |      674   |     1467   |     2135   |      530   |     1621   |     2055   |

I double-checked to make sure I did not make a mistake in the time
measurements, as the numbers are much higher than what I initially
expected. They are in fact higher than the number I get on the 2.8GHz
Xeon of my 2008 mac pro.. (except for FFT lengths >= 32768 where
having a big cache is useful). A good surprise is also that the perf
is not too far from apple's vDSP (at least for the real FFT).


