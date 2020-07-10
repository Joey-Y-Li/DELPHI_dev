#!/bin/bash
#set -x
# This is the DELPHI program entrance
# Usage: ./run_DELPHI.sh [INPUT_FN]
which python
export INPUT_FN=$1
# OUT_DIR=${PRO_DIR}/tmp_human_pssm_last1000
# export TMP_DIR=${PRO_DIR}/tmp-$(date +%Y-%m-%d-%H-%M-%S)

export TMP_DIR=${PRO_DIR}/tmp_test
mkdir -p $TMP_DIR
echo "PRO_DIR: $PRO_DIR"
echo "TMP_DIR: $TMP_DIR"

#copy all feature files

#cp /home/j00492398/test_joey/interface-pred/Features/Anchor/survey_train.txt $TMP_DIR/Anchor.txt
#cp /home/j00492398/test_joey/interface-pred/Features/ECO/survey_train.txt $TMP_DIR/ECO.txt
#cp /home/j00492398/test_joey/interface-pred/Features/RAA/survey_train.txt $TMP_DIR/RAA.txt
#cp /home/j00492398/test_joey/interface-pred/Features/RSA/survey_train.txt $TMP_DIR/RSA.txt
#cp /home/j00492398/test_joey/interface-pred/Features/Anchor/survey_train.txt $TMP_DIR/Anchor.txt
#cp /home/j00492398/test_joey/interface-pred/Features/HYD/survey_train.txt $TMP_DIR/HYD.txt
#cp /home/j00492398/test_joey/interface-pred/Features/PKA/survey_train.txt $TMP_DIR/PKA.txt
#cp /home/j00492398/test_joey/interface-pred/Features/Pro2Vec_1D/survey_train.txt $TMP_DIR/Pro2Vec_1D.txt
#cp /home/j00492398/test_joey/interface-pred/Features/HSP/survey_train.txt $TMP_DIR/HSP.txt
#cp /home/j00492398/test_joey/interface-pred/Features/POSITION/survey_train.txt $TMP_DIR/POSITION.txt
#for i in {1..3}; do
#  cp /home/j00492398/test_joey/interface-pred/Features/PHY_Char/survey_train_${i}.txt $TMP_DIR/PHY_Char${i}.txt
#done
#for i in {1..7}; do
#  cp /home/j00492398/test_joey/interface-pred/Features/PHY_Prop/survey_train_${i}.txt $TMP_DIR/PHY_Prop${i}.txt
#done
#for i in {1..20}; do
#  cp /home/j00492398/test_joey/interface-pred/Features/PSSM/survey_train_${i}.txt $TMP_DIR/PSSM${i}.txt
#done




#####################
#check PSSM database#
#####################
# argv[2]: PSSM_DIR=${TMP_DIR}/PSSM_raw/1/
echo "load_PSSM_DB"
python3 utils/load_PSSM_DB.py ${INPUT_FN} ${TMP_DIR}/PSSM_raw/1

####################
# compute features#
####################
#bash feature_computation/compute_features.sh $INPUT_FN

# ####################
# #    run DELPHI    #
# ####################
python3 train.py -i $INPUT_FN -d $TMP_DIR -c 1
if [ $? -ne 0 ]
then
   echo "[Error:] DELPHI training returns error!"
fi