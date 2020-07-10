#!/bin/bash

database=${hhblits_db}
hhblits="hhblits"
inputpath=$1
outpath=$2

if [ ! -f ${outpath} ]; then
	mkdir ${outpath}
fi


for file in ${inputpath}/*.fasta;
do
	echo  ${outpath}/"$(basename "$file")"
	if [ ! -f ${outpath}/"$(basename "$file")" ]; then
		echo "ECO file for $file doesn't exist, running hhblits"
		${hhblits} -i $file -ohhm ${outpath}/"$(basename "$file")"  -d ${blast_nr_db}  -hide_cons -hide_pred -hide_dssp -v 0  -neffmax 1 -n 1 -cpu 10
	else
		echo "ECO file for $file exists, skip hhblits"
	fi
done
