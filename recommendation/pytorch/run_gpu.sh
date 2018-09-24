#!/bin/bash

sudo nvidia-docker run -i -t --rm --ipc=host \
    --mount "type=bind,source=$(pwd),destination=/mlperf/experiment" \
    mlperf/recommendation:gpu 1
