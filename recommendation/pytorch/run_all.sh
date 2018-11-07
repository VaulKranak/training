#!/bin/bash

SEED=${1:-1}
PROCESSORS=( cpu gpu )

PROCESSOR=${2:-cpu} # cpu or gpu
for PROCESSOR in "${PROCESSORS[@]}"
do
   ./run_docker.sh $SEED $PROCESSOR 
done
