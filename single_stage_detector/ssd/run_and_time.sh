#!/bin/bash
# runs benchmark and reports time to convergence
# to use the script:
#   run_and_time.sh <random seed> <target threshold>
THRESHOLD=0.635
BASEDIR=$(dirname -- "$0")

# start timing
start=$(date +%s)
start_fmt=$(date +%Y-%m-%d\ %r)
echo "STARTING TIMING RUN AT $start_fmt"

# Get command line seed
SEED=${1:-1}
TARGET=${2:-0.212}

time stdbuf -o 0 \
  python3 train.py --seed $SEED --threshold $TARGET | tee run.log.$SEED

# end timing
end=$(date +%s)
end_fmt=$(date +%Y-%m-%d\ %r)
echo "ENDING TIMING RUN AT $end_fmt"


# report result
result=$(( $end - $start ))
result_name="single_stage_detector"

echo "RESULT,$result_name,$SEED,$result,$USER,$start_fmt"
