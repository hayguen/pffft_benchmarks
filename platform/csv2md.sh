#!/bin/bash

# usage:
# 1- create suitably name subfolder in the platform directory,
# 2- unpack the compressed result of bench_all.sh (in pffft) in this new folder
# 3- cd into each folder with .csv files: run '../../plots.sh'
# 4- run '../csv2md.sh' from that new folder

P=$(pwd)
N=$(basename "$P")
R=$(realpath "$P/..")
RB=$(basename "$R")

echo $N

if [ ! "$RB" = "platform" ]; then
  echo "please call from directly below 'platform'"
  exit 1
fi

F="../../$N.md"

if [ -f "$F" ]; then
  echo "warning: $F already exists"
  if [ ! "$1" = "-f" ]; then
    echo "exiting cause exists"
    exit 0
  fi
fi


echo "" >"$F"
echo "## $N" >>"$F"
echo "" >>"$F"

for S in $(echo "." "float" "double") ; do
    if [ "$S" = "." ]; then
        SS=""
    else
        SS="$S/"
    fi
    if [ ! -d "$S" ]; then
        continue
    fi
    C=$(ls -1 ${SS}*.csv 2>/dev/null |wc -l)
    if [ $C -le 0 ]; then
        echo "$C .csv files in $S"
        continue
    fi
    echo "$C .csv files in $S : $S -> $SS"
    if [ "$S" = "double" ]; then
        PRECTXT="Double precision"
    elif [ "$S" = "float" ]; then
        PRECTXT="Single precision"
    else
        PRECTXT="Single precision"
    fi

    L="simd-cplx-pow2-6-mflops"
    if [ -f ${SS}${L}.png ] || [ -f ${SS}${L}.csv ]; then
        echo "### ${PRECTXT}, complex data for powers of 2, utilizing SIMD" >>"$F"
        echo "" >>"$F"
        echo "Showing Millions of Operations Per Second (MFLOPS). More is better." >>"$F"
        echo "" >>"$F"
        if [ -f ${SS}${L}.png ]; then
            echo "![gnuplot figure](https://raw.githubusercontent.com/hayguen/pffft_benchmarks/master/platform/${N}/${SS}${L}.png)" >>"$F"
            echo "" >>"$F"
        fi
        if [ -f ${SS}${L}.csv ]; then
            head -n 1 ${SS}${L}.csv |sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
            NCOLS=$(head -n 1 ${SS}${L}.csv |sed 's/,/,\n/g' | grep -c ",")
            echo -n "|" >>"$F"
            for k in $(seq 1 ${NCOLS}) ; do
                echo -n "--------:|" >>"$F"
            done
            echo "" >>"$F"
            tail -n +2 ${SS}${L}.csv | sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
            echo "" >>"$F"
        fi
    fi

    L="simd-real-pow2-6-mflops"
    if [ -f ${SS}${L}.png ] || [ -f ${SS}${L}.csv ]; then
        echo "### ${PRECTXT}, real data for powers of 2, utilizing SIMD" >>"$F"
        echo "" >>"$F"
        echo "Showing Millions of Operations Per Second (MFLOPS). More is better." >>"$F"
        echo "" >>"$F"
        if [ -f ${SS}${L}.png ]; then
            echo "![gnuplot figure](https://raw.githubusercontent.com/hayguen/pffft_benchmarks/master/platform/${N}/${SS}${L}.png)" >>"$F"
            echo "" >>"$F"
        fi
        if [ -f ${SS}${L}.csv ]; then
            head -n 1 ${SS}${L}.csv |sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
            NCOLS=$(head -n 1 ${SS}${L}.csv |sed 's/,/,\n/g' | grep -c ",")
            echo -n "|" >>"$F"
            for k in $(seq 1 ${NCOLS}) ; do
                echo -n "--------:|" >>"$F"
            done
            echo "" >>"$F"
            tail -n +2 ${SS}${L}.csv | sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
            echo "" >>"$F"
        fi
    fi

    L="simd-cplx-pow2-4-rel-pffft"
    if [ -f ${SS}${L}.png ] || [ -f ${SS}${L}.csv ]; then
        echo "### ${PRECTXT}, complex data for powers of 2, utilizing SIMD" >>"$F"
        echo "" >>"$F"
        echo "Showing Duration relative to ordered PFFFT. Less is better." >>"$F"
        echo "" >>"$F"
        if [ -f ${SS}${L}.png ]; then
          echo "![gnuplot figure](https://raw.githubusercontent.com/hayguen/pffft_benchmarks/master/platform/${N}/${SS}${L}.png)" >>"$F"
          echo "" >>"$F"
        fi
        if [ -f ${SS}${L}.csv ]; then
          head -n 1 ${SS}${L}.csv |sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
          NCOLS=$(head -n 1 ${SS}${L}.csv |sed 's/,/,\n/g' | grep -c ",")
          echo -n "|" >>"$F"
          for k in $(seq 1 ${NCOLS}) ; do
            echo -n "--------:|" >>"$F"
          done
          echo "" >>"$F"
          tail -n +2 ${SS}${L}.csv | sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
          echo "" >>"$F"
        fi
    fi

    L="simd-real-pow2-4-rel-pffft"
    if [ -f ${SS}${L}.png ] || [ -f ${SS}${L}.csv ]; then
        echo "### ${PRECTXT}, real data for powers of 2, utilizing SIMD" >>"$F"
        echo "" >>"$F"
        echo "Showing Duration relative to ordered PFFFT. Less is better." >>"$F"
        echo "" >>"$F"
        if [ -f ${SS}${L}.png ]; then
          echo "![gnuplot figure](https://raw.githubusercontent.com/hayguen/pffft_benchmarks/master/platform/${N}/${SS}${L}.png)" >>"$F"
          echo "" >>"$F"
        fi
        if [ -f ${SS}${L}.csv ]; then
          head -n 1 ${SS}${L}.csv |sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
          NCOLS=$(head -n 1 ${SS}${L}.csv |sed 's/,/,\n/g' | grep -c ",")
          echo -n "|" >>"$F"
          for k in $(seq 1 ${NCOLS}) ; do
            echo -n "--------:|" >>"$F"
          done
          echo "" >>"$F"
          tail -n +2 ${SS}${L}.csv | sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
          echo "" >>"$F"
        fi
    fi

done
