#!/bin/bash

for majorDir in */
do
	for minorDir in $majorDir*/
	do
		sudo nvidia-docker build -t $(dirname "$minorDir"Dockerfile) -f "$minorDir"Dockerfile .
	done
done
