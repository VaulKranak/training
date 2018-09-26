#!/bin/bash

sudo docker build --build-arg A_NO_CUDA=0 -t mlperf/recommendation:gpu .
