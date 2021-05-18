#!/bin/bash

set -x

outdir=figures
mkdir -p $outdir

map=$1
t1=$2
epi=$3

# render overlay t1 and map
fsleyes render -ds "world" -hc -hl -c 2 -ad -xz 500 -yz 500 -zz 500 -vl 45 52 45 --outfile ${outdir}/t1_map_mni.png $t1 $map -ot volume -a 75 --cmap red-yellow

# render overlay epi and map
fsleyes render -ds "world" -hc -hl -c 2 -ad -xz 500 -yz 500 -zz 500 -vl 45 52 45 --outfile ${outdir}/epi_map_mni.png $epi -b 40 $map -ot volume -a 75 --cmap red-yellow
