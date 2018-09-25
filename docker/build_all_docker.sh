#!/bin/bash

sudo docker build -t paddle/cpu -f paddle/cpu .
sudo docker build -t paddle/gpu -f paddle/gpu .
sudo docker build -t pytorch/cpu -f pytorch/cpu .
sudo docker build -t pytorch/gpu -f pytorch/gpu .
sudo docker build -t tensorflow/cpu -f tensorflow/cpu .
sudo docker build -t tensorflow/gpu -f tensorflow/gpu .
