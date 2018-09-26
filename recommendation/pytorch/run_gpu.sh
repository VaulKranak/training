#!/bin/bash

SEED=1
NOW=date "+%F-%T"

sudo nvidia-docker run -i -t --rm --ipc=host \
    --mount "type=bind,source=$(pwd),destination=/mlperf/experiment" \
    mlperf/recommendation:gpu $SEED | tee benchmark-gpu-$NOW.log
