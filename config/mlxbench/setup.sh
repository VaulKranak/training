#!/bin/bash

CALLDIR="$(pwd)"
cd "$(dirname "$0")"
SCRIPTDIR="$(pwd)"
PROCESSOR=${1:-cpu}

PACKAGENAME=MLxBench_DeepLearning_Intel_DL_SDK.deb
PACKAGEPATH=$SCRIPTDIR/$PACKAGENAME


DEPENDANCIES_CPU=(opencl-neo)
DEPENDANCIES_GPU=(tensorrt) #cuda/cuda-9.2 tensorrt)

[$PROCESSOR == "cpu"] && DEPENDANCIES=$DEPENDANCIES_CPU || DEPENDANCIES=$DEPENDANCIES_GPU

echo "*** checking if mlxbench package exists ***"

if [[ ! -f $PACKAGEPATH ]] ; then
	echo $PACKAGEPATH missing
	echo "cloudpeca001.fm.intel.com\\HDXPRT_Outbox\\Ml-xBench" 
	exit
fi

echo "*** Installing DEPENDANCIES ***"

for dependfolder in ${DEPENDANCIES[@]}
do
	echo "*** installing $dependfolder ***"
	[ -f ../"$dependfolder"/install.sh ] \
		&& ../"$dependfolder"/install.sh \
		|| echo "*** missing dependancy $dependfolder ***"
done

exit 1

echo installing opencl tool
echo type clinfo to see the opencl proccessor and information on the system
sudo apt-get install clinfo

echo "*** Installing MLxBench ***"

sudo dpkg -i $PACKAGEPATH
sudo apt-get -f install -y
sudo apt-get update

echo "*** setting up permissions ***"

sudo chmod -R 777 ~/MLxBench
sudo chown -R $USER:$USER ~/MLxBench
export MLX_HOME=$HOME/MLxBench/

echo "**** copy run config files ***"
sudo rm "$MLX_HOME"Config/*
cp $SCRIPTDIR/Config/* $MLX_HOME/Config/

cd $CALLDIR

