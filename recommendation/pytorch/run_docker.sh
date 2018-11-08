#!/bin/bash

# command arguments
SEED=${1:-1}
PROCESSOR=${2:-cpu} # cpu or gpu

NOW=`date "+%F-%T"`

echo sudo nvidia-docker run -i -t --rm --ipc=host \
    --mount "type=bind,source=$(pwd),destination=/mlperf/experiment" \
    recommendation/$PROCESSOR $SEED | tee recommendation-${PROCESSOR}-$NOW.log
