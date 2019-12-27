#!/bin/bash

P=$(pwd)
N=$(basename "$P")

echo $N

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


echo "### Single precision, complex data for powers of 2, utilizing SIMD" >>"$F"
L="simd-cplx-pow2-6-mflops"
echo "" >>"$F"
echo "Showing Millions of Operations Per Second (MFLOPS). More is better." >>"$F"
echo "" >>"$F"
if [ -f ${L}.png ]; then
  echo "![gnuplot figure](https://raw.githubusercontent.com/hayguen/pffft_benchmarks/master/platform/${N}/${L}.png)" >>"$F"
  echo "" >>"$F"
fi

if [ -f ${L}.csv ]; then
  head -n 1 ${L}.csv |sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
  NCOLS=$(head -n 1 ${L}.csv |sed 's/,/,\n/g' | grep -c ",")
  echo -n "|" >>"$F"
  for k in $(seq 1 ${NCOLS}) ; do
    echo -n "--------:|" >>"$F"
  done
  echo "" >>"$F"
  tail -n +2 ${L}.csv | sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
  echo "" >>"$F"
fi

echo "### Single precision, real data for powers of 2, utilizing SIMD" >>"$F"
L="simd-real-pow2-6-mflops"
echo "" >>"$F"
echo "Showing Millions of Operations Per Second (MFLOPS). More is better." >>"$F"
echo "" >>"$F"
if [ -f ${L}.png ]; then
  echo "![gnuplot figure](https://raw.githubusercontent.com/hayguen/pffft_benchmarks/master/platform/${N}/${L}.png)" >>"$F"
  echo "" >>"$F"
fi

if [ -f ${L}.csv ]; then
  head -n 1 ${L}.csv |sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
  NCOLS=$(head -n 1 ${L}.csv |sed 's/,/,\n/g' | grep -c ",")
  echo -n "|" >>"$F"
  for k in $(seq 1 ${NCOLS}) ; do
    echo -n "--------:|" >>"$F"
  done
  echo "" >>"$F"
  tail -n +2 ${L}.csv | sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
  echo "" >>"$F"
fi



echo "### Single precision, complex data for powers of 2, utilizing SIMD" >>"$F"
L="simd-cplx-pow2-4-rel-pffft"
echo "" >>"$F"
echo "Showing Duration relative to ordered PFFFT. Less is better." >>"$F"
echo "" >>"$F"
if [ -f ${L}.png ]; then
  echo "![gnuplot figure](https://raw.githubusercontent.com/hayguen/pffft_benchmarks/master/platform/${N}/${L}.png)" >>"$F"
  echo "" >>"$F"
fi

if [ -f ${L}.csv ]; then
  head -n 1 ${L}.csv |sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
  NCOLS=$(head -n 1 ${L}.csv |sed 's/,/,\n/g' | grep -c ",")
  echo -n "|" >>"$F"
  for k in $(seq 1 ${NCOLS}) ; do
    echo -n "--------:|" >>"$F"
  done
  echo "" >>"$F"
  tail -n +2 ${L}.csv | sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
  echo "" >>"$F"
fi

echo "### Single precision, real data for powers of 2, utilizing SIMD" >>"$F"
L="simd-real-pow2-4-rel-pffft"
echo "" >>"$F"
echo "Showing Duration relative to ordered PFFFT. Less is better." >>"$F"
echo "" >>"$F"
if [ -f ${L}.png ]; then
  echo "![gnuplot figure](https://raw.githubusercontent.com/hayguen/pffft_benchmarks/master/platform/${N}/${L}.png)" >>"$F"
  echo "" >>"$F"
fi

if [ -f ${L}.csv ]; then
  head -n 1 ${L}.csv |sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
  NCOLS=$(head -n 1 ${L}.csv |sed 's/,/,\n/g' | grep -c ",")
  echo -n "|" >>"$F"
  for k in $(seq 1 ${NCOLS}) ; do
    echo -n "--------:|" >>"$F"
  done
  echo "" >>"$F"
  tail -n +2 ${L}.csv | sed 's/^/|/g' |sed 's/,/|/g' >>"$F"
  echo "" >>"$F"
fi

