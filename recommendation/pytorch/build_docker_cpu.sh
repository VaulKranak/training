#!/bin/bash

sudo docker build --build-arg A_NO_CUDA=1 -t mlperf/recommendation:cpu .