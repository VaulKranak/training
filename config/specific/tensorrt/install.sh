#!/bin/bash

#sudo wget https://developer.nvidia.com/compute/machine-learning/tensorrt/5.0/rc/nv-tensorrt-repo-ubuntu1604-cuda9.0-trt5.0.0.10-rc-20180906_1-1_amd64
sudo dpkg -i nv-tensorrt-repo-ubuntu1604-cuda9.2-ga-trt4.0.1.6-20180612_1-1_amd64.deb
#sudo apt-key add /var/nv-tensorrt-repo-cuda9.0-trt5.0.0.10-rc-20180906/7fa2af80.pub

sudo apt update
sudo apt install -y tensorrt

sudo apt install -y python-libnvinfer-dev python3-libnvinfer-dev
sudo apt install -y uff-converter-tf

dpkg -l | grep TensorRT
