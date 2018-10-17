#!/bin/bash

SCRIPTDIR="$(dirname "$0")"
PACKAGENAME=cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
KEYNAME=7fa2af80.pub
ADDRESS=http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/

PACKAGEPATH=$SCRIPTDIR/$PACKAGENAME

if [ ! -f $PACKAGEPATH ] ; then
    wget $ADDRESS$PACKAGENAME
fi


# Install CUDA
sudo apt remove --purge cuda -y
sudo dpkg -i $PACKAGENAME 
sudo apt-key adv --fetch-keys $ADDRESS$KEYNAME
sudo apt update
sudo apt upgrade -y
sudo apt install cuda-9.2 -y

