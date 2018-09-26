#!/bin/bash

SEED=1
NOW='date "+%F-%T"'
PROCESSOR=gpu

sudo nvidia-docker run -i -t --rm --ipc=host \
    --mount "type=bind,source=$(pwd),destination=/mlperf/experiment" \
    mlperf/recommendation:$PROCESSOR $SEED | tee benchmark-$PROCESSOR-$NOW.log
