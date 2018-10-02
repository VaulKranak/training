#!/bin/bash

DEPENDANCIES=(cuda/cuda-9.2 tensorrt)


echo checking if mlxbench package exists
SCRIPTDIR="$(dirname "$0")"
PACKAGENAME=nv-tensorrt-repo-ubuntu1604-cuda9.2-ga-trt4.0.1.6-20180612_1-1_amd64.deb
PACKAGEPATH=$SCRIPTDIR/$PACKAGENAME

if [[ -f $PACKAGEPATH ]] ; then
	echo $PACKAGEPATH missing
	echo "cloudpeca001.fm.intel.com\HDXPRT_Outbox\Ml-xBench" 
	exit
fi

cd SCRIPTDIR

echo Installing DEPENDANCIES

for dir in $DEPENDANCIES
do
	echo installing $dir
	../"$dir"/install.sh
done

echo installing opencl tool
echo type clinfo to see the opencl proccessor and information on the system
sudo apt-get install clinfo

echo Installing MLxBench

sudo dpkg -i MLxBench_DeepLearning_Intel_DL_SDK.deb
sudo apt-get -f install
sudo apt-get update

echo setting up permissions

sudo chmod -R 777 ~/MLxBench
sudo chown -R $USER:$USER ~/MLxBench
export MLX_HOME=$HOME/MLxBench/
cd $MLX_HOME

