#!/bin/bash

PROCESSOR=gpu
IMAGE=mlperf/translation:$PROCESSOR
SEED=1
NOW=`date "+%F-%T"`
sudo nvidia-docker run -v $HOME/reference/translation/raw_data:/raw_data -it $IMAGE "./run_and_time.sh" $SEED | tee benchmark-$PROCESSOR-$NOW.log
