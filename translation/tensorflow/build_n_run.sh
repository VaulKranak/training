#!/bin/bash

IMAGE=`sudo docker build . | tail -n 1 | awk '{print $3}'`
SEED=1
NOW=`date "+%F-%T"`
sudo docker run -v $HOME/reference/translation/raw_data:/raw_data --runtime=nvidia -t -i $IMAGE "./run_and_time.sh" $SEED | tee benchmark-$NOW.log

