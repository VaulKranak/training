#!/bin/bash

sudo wget https://developer.nvidia.com/compute/machine-learning/tensorrt/5.0/rc/nv-tensorrt-repo-ubuntu1604-cuda9.0-trt5.0.0.10-rc-20180906_1-1_amd64
sudo dpkg -i nv-tensorrt-repo-ubuntu1604-cuda9.0-trt5.0.0.10-rc-20180906_1-1_amd64.deb
sudo apt update
