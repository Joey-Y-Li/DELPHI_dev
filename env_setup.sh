#!/bin/bash
# This script sets up the PATH for feature computation programs
export PRO_DIR="/home/j00492398/test_joey/DELPHI_dev"
cd ${PRO_DIR}
################################################################
#######[please modify the path for your environment]############
################################################################
export PATH=$PATH:/home/j00492398/test_joey/blast/ncbi-blast-2.6.0+/bin
export PATH=$PATH:/home/j00492398/test_joey/raw_features/ECO/hh-suite/build/bin
export PATH=$PATH:/home/j00492398/test_joey/interface-pred/tools/ANCHOR
export PATH=$PATH:/home/j00492398/test_joey/SPRINT/bin
export hhblits_db="/home/j00492398/test_joey/raw_features/ECO/uniprotDB/uniprot20_2015_06"
export blast_nr_db="${PRO_DIR}/../blastDB/nr"

