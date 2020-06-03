#!/bin/bash
#set -x
# This is the DELPHI program entrance
# Usage: ./run_DELPHI.sh [INPUT_FN]

export PRO_DIR=$PWD
export INPUT_FN=$1
OUT_DIR=out_DS72
# export TMP_DIR=${PRO_DIR}/tmp-$(date +%Y-%m-%d-%H-%M-%S)
export TMP_DIR=${PRO_DIR}/tmp_DS72
echo "PRO_DIR: $PRO_DIR"
echo "TMP_DIR: $TMP_DIR"

#####################
#check PSSM database#
#####################
# TODO:
# 1. add a fasta file, built a dic {seq, id}
# 2. put all pssm file in PSSM_database/
# 3.1. need build_PSSM_DB.py that output a dictionary file
# 3.2. check_pssm_database.py, to cp all konwn pssm file to $pssm_dir 
# argv[2]: PSSM_DIR=${TMP_DIR}/PSSM_raw/1/
python3 utils/load_PSSM_DB.py ${INPUT_FN} ${TMP_DIR}/PSSM_raw/1

####################
# compute features#
####################
bash feature_computation/compute_features.sh $INPUT_FN

####################
#    run DELPHI    #
####################
python3 predict.py -i $INPUT_FN -d $TMP_DIR -o $OUT_DIR -c 1
if [ $? -ne 0 ]
then
   echo "[Error:] DELPHI returns 1!"
fi