#!/bin/bash


dir=../FASTQ


echo "#SWARM -g 4 --time 2:00:00" >count_barcodes.sw

FILES=($(ls $dir/*R1.fastq.gz | grep -v Undetermined))

for i in ${!FILES[@]}
do
    r1=${FILES[$i]}
    echo "./SNAP-CUTANA_K-MetStat_Panel_ShellScript.v3.sh $r1;">>count_barcodes.sw
done


swarm count_barcodes.sw

