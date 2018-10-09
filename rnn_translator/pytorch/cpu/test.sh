#!/bin/bash

SEED=1
PROCESSOR=cpu
NOW=`date "+%F-%T"`
sudo docker run -it --rm --ipc=host -v $HOME/training/rnn_translator/data:/data mlperf/rnn-translator:$PROCESSOR "./run_and_time.sh" $SEED $PROCESSOR |tee benchmark-$PROCESSOR-$NOW.log
