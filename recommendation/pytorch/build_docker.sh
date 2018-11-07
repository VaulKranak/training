#!/bin/bash

Dockerfiles=( cpu gpu )

for Dockerfile in "${Dockerfiles[@]}"
do
    docker build -t recommendation/$Dockerfile -f Dockerfile_$Dockerfile . 
done


