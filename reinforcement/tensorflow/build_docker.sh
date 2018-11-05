#!/bin/bash

Dockerfiles=( cpu gpu )

for Dockerfile in "${Dockerfiles[@]}"
do
    docker build -t reinforcement/$Dockerfile -f Dockerfile_$Dockerfile . 
done

