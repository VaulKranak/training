#!/bin/bash

$IMAGE=mlperf/translation:cpu
SEED=1
NOW=`date "+%F-%T"`
sudo docker run -v $HOME/reference/translation/raw_data:/raw_data -it $IMAGE "./run_and_time.sh" $SEED | tee benchmark-$NOW.log
