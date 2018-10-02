#!/bin/bash

sudo docker build -t paddle/cpu -f paddle/cpu/Dockerfile .
sudo docker build -t paddle/gpu -f paddle/gpu/Dockerfile .
sudo docker build -t pytorch/cpu -f pytorch/cpu/Dockerfile .
sudo docker build -t pytorch/gpu -f pytorch/gpu/Dockerfile .
sudo docker build -t tensorflow/cpu -f tensorflow/cpu/Dockerfile .
sudo docker build -t tensorflow/gpu -f tensorflow/gpu/Dockerfile .
