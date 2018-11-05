#/bin/bash
# runs benchmark and reports time to convergence
# to use the script:
#   run_and_time.sh <random seed 1-5>


seed=${1:-1}
ACCURACY=${2:-0.03}
PARALEL_SELFPLAY=${3:-16}

Params=( seed ACCURACY PARALEL_SELFPLAY )
for Param in "${Params[@]}"
do
    echo $Param = ${!Param}
done


sed -i "s/.TERMINATION_ACCURACY.: ..../\"TERMINATION_ACCURACY\": $ACCURACY/g" minigo/params/final.json 
sed -i "s/\"NUM_PARALLEL_SELFPLAY\":.*,/\"NUM_PARALLEL_SELFPLAY\": $PARALEL_SELFPLAY,/g" minigo/params/final.json 

set -e

# start timing
start=$(date +%s)
start_fmt=$(date +%Y-%m-%d\ %r)
echo "STARTING TIMING RUN AT $start_fmt"


# run benchmark
./run.sh $seed
sleep 3
ret_code=$?; if [[ $ret_code != 0 ]]; then exit $ret_code; fi


# end timing
end=$(date +%s)
end_fmt=$(date +%Y-%m-%d\ %r)
echo "ENDING TIMING RUN AT $end_fmt"


# report result
result=$(( $end - $start ))
result_name="reinforcement"


echo "RESULT,$result_name,$seed,$result,$USER,$start_fmt"
