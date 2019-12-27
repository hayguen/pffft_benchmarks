
### NVIDIA Jetson TK1 board, gcc-4.8.2. The cpu is a 2.3GHz cortex A15 (Tegra K1).

Built with:

```
gcc -O3 -march=armv7-a -mtune=native -mfloat-abi=hard -mfpu=neon -ffast-math test_pffft.c pffft.c -o test_pffft_arm fftpack.c -lm
```

| input len |real FFTPack| real PFFFT |cplx FFTPack| cplx PFFFT |
|----------:|-----------:|-----------:|-----------:|-----------:|
|       64  |     1735   |     3308   |     1994   |     3744   |
|       96  |     1596   |     3448   |     1987   |     3572   |
|      128  |     1807   |     4076   |     2255   |     3960   |
|      160  |     1769   |     4083   |     2071   |     3845   |
|      192  |     1990   |     4233   |     2017   |     3939   |
|      256  |     2191   |     4882   |     2254   |     4346   |
|      384  |     1878   |     4492   |     2073   |     4012   |
|      480  |     1748   |     4398   |     1923   |     3951   |
|      512  |     2030   |     5064   |     2267   |     4195   |
|      640  |     1918   |     4756   |     2094   |     4184   |
|      768  |     2099   |     4907   |     2048   |     4297   |
|      800  |     1822   |     4555   |     1880   |     4063   |
|     1024  |     2232   |     5355   |     2187   |     4420   |
|     2048  |     2176   |     4983   |     2027   |     3602   |
|     2400  |     1741   |     4256   |     1710   |     3344   |
|     4096  |     1816   |     3914   |     1851   |     3349   |
|     8192  |     1716   |     3481   |     1700   |     3255   |
|     9216  |     1735   |     3589   |     1653   |     3094   |
|    16384  |     1567   |     3483   |     1637   |     3244   |
|    32768  |     1624   |     3240   |     1655   |     3156   |
|   262144  |     1012   |     1898   |      983   |     1503   |
|  1048576  |      876   |     1154   |      868   |     1341   |

The performance on the tegra K1 is pretty impressive. I'm not
including the FFTW numbers as they as slightly below the scalar
fftpack numbers, so something must be wrong (however it seems to be
correctly configured and is using neon simd instructions).

When using clang 3.4 the pffft version is even a bit faster, reaching
5.7 GFlops for real ffts of size 1024.

