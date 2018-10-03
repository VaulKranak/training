#!/bin/bash

CALLDIR="$(pwd)"
cd $(dirname "$0")
SCRIPTDIR="$(pwd)"

DEPENDACIES=("docker" "nvidia-docker" "proxy" "cuda" "bridge-utils")

cd $SCRIPTDIR

for dependPath in ${DEPENDACIES[@]}
do
	echo "*** installing $dependPath ***" 
	../"$dependPath"/install.sh
done

cd $CALLDIR
