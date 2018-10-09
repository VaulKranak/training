#!/bin/bash

sudo nvidia-docker build -t mlperf/rnn-translator:gpu . -f gpu/Dockerfile

