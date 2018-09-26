#!/bin/bash

sed -i "s/.TERMINATION_ACCURACY.: ..../\"TERMINATION_ACCURACY\": ${1:-0.03}/g" minigo/params/final.json 
sed -i "s/\"NUM_PARALLEL_SELFPLAY\":.*,/\"NUM_PARALLEL_SELFPLAY\": ${2:-16},/g" minigo/params/final.json 
sed -i "s/install tensorflow.*/install tensorflow-gpu/g" Dockerfile



IMAGE=`sudo docker build . | tail -n 1 | awk '{print $3}'`
SEED=1
NOW=`date "+%F-%T"`
sudo docker run --runtime=nvidia -t -i $IMAGE "./run_and_time.sh" $SEED | tee benchmark-gpu-$NOW.log
