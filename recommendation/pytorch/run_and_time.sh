#!/bin/bash
set -e

# runs benchmark and reports time to convergence
# to use the script:
#   run_and_time.sh <seed 1-5> <threshold 0.##> <process ##>

BASEDIR=$(dirname -- "$0")

# start timing
start=$(date +%s)
start_fmt=$(date +%Y-%m-%d\ %r)
echo "STARTING TIMING RUN AT $start_fmt"

# command line
seed=${1:-1}
threshold=${2:-0.635}
processes=${3:-10}
epochs=${4:-20}
batch_size=${5:-2048}
workers=${6:-8}
factor=${7:-64}
learning_rate=${8:-0.0005}
layers=${9:-"256 256 128 64"}

echo "unzip ml-20m.zip"
if unzip -uo ml-20m.zip
then
    echo "Start processing ml-20m/ratings.csv"
	echo python $BASEDIR/convert.py ml-20m/ratings.csv ml-20m --negatives 999
    t0=$(date +%s)
	python $BASEDIR/convert.py ml-20m/ratings.csv ml-20m --negatives 999
    t1=$(date +%s)
	delta=$(( $t1 - $t0 ))
    echo "Finish processing ml-20m/ratings.csv in $delta seconds"

    echo "Start training"
	echo python $BASEDIR/ncf.py ml-20m \
            --layers $layers \
	    --seed $seed \
            --threshold $threshold \
            --processes $processes \
            --epochs $epochs \
            --batch-size $batch_size \
            --workers $workers \
            --factor $factor \
            --learning-rate $learning_rate 
    t0=$(date +%s)
	python $BASEDIR/ncf.py ml-20m \
            --layers $layers \
	    --seed $seed \
            --threshold $threshold \
            --processes $processes \
            --epochs $epochs \
            --batch-size $batch_size \
            --workers $workers \
            --factor $factor \
            --learning-rate $learning_rate 
    t1=$(date +%s)
	delta=$(( $t1 - $t0 ))
    echo "Finish training in $delta seconds"

	# end timing
	end=$(date +%s)
	end_fmt=$(date +%Y-%m-%d\ %r)
	echo "ENDING TIMING RUN AT $end_fmt"


	# report result
	result=$(( $end - $start ))
	result_name="recommendation"


	echo "RESULT,$result_name,$seed,$result,$USER,$start_fmt"
else
	echo "Problem unzipping ml-20.zip"
	echo "Please run 'download_data.sh && verify_datset.sh' first"
fi

