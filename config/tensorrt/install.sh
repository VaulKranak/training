#!/bin/bash

SCRIPTDIR="$(dirname "$0")"
PACKAGENAME=nv-tensorrt-repo-ubuntu1604-cuda9.2-ga-trt4.0.1.6-20180612_1-1_amd64.deb
PACKAGEPATH=$SCRIPTDIR/$PACKAGENAME

if [ ! -f $PACKAGEPATH ]; then
	echo $PACKAGEPATH missing
	echo download tensor rt package from nvidia
	echo https://developer.nvidia.com/nvidia-tensorrt-4x-download
	exit
fi

sudo dpkg -i $PACKAGEPATH

sudo apt update
sudo apt install -y tensorrt

sudo apt install -y python-libnvinfer-dev python3-libnvinfer-dev
sudo apt install -y uff-converter-tf

dpkg -l | grep TensorRT
