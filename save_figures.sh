#!/bin/bash

set -x

outdir=figures
mkdir -p $outdir

map=output/sub-${sub}/activation_map_MNI.nii.gz
t1=output/sub-${sub}/$taskname/sub-${sub}_t1_aligned_mni_nonlinear.nii
epi=output/sub-${sub}/$taskname/sub-${sub}_epi_aligned_mni_nonlinear.nii

# render overlay t1 and map
fsleyes render -ds "world" -hc -hl -c 2 -ad -xz 500 -yz 500 -zz 500 -vl 45 52 45 --outfile ${outdir}/t1_map_mni.png $t1 $map -ot volume -a 75 --cmap red-yellow

# render overlay epi and map
fsleyes render -ds "world" -hc -hl -c 2 -ad -xz 500 -yz 500 -zz 500 -vl 45 52 45 --outfile ${outdir}/epi_map_mni.png $epi -b 40 $map -ot volume -a 75 --cmap red-yellow
