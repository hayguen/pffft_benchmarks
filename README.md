# Benchmark results for a pretty fast FFT (PFFFT)

## PFFFT?

Basis for the PFFFT benchmarks are here: [https://github.com/hayguen/pffft](https://github.com/hayguen/pffft).
This separate `pffft_benchmarks` git-repository has the purpose of keeping the sources small.


## Benchmark results

The benchmark shows the performance of various fft implementations measured in 
MFlops, with the number of floating point operations being defined as 5Nlog2(N)
for a length N complex fft, and 2.5*Nlog2(N) for a real fft.
See [here](http://www.fftw.org/speed/method.html) for an explanation of these formulas.

Actual results have additional duration, relative to pffft's ordered duration.


## Benchmarking with GnuPlot figures

On Linux systems, you can execute the shell script `bench_all.sh` to
generate all benchmarks on one platform. If available it also generates the gnuplot
figures and creates the archive `pffft_bench_${HOSTNAME}.tar.gz` including
the generated .csv tables and also the .png plot files.

`bench_all.sh` accepts command line options: first optional argument
is `ON` or `OFF` to switch usage of FFTW. Other arguments are forwarded
into a text file, which is added to the archive file.

On ARM platform one has to activate NEON support explicitly inside the
`bench_all.sh` file.


## Platforms

