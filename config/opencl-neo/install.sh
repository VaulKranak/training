#!/bin/bash

CALLDIR="$(pwd)"
cd "$(dirname "$0")"
SCRIPTDIR="$(pwd)"


PACKAGENAME=intel-opencl_18.26.10987_amd64.deb
PACKAGEPATH=$SCRIPTDIR/$PACKAGENAME

echo "*** checking if intel opencl package exists ***"

if [[ ! -f $PACKAGEPATH ]] ; then
	echo $PACKAGEPATH missing
	echo "cloudpeca001.fm.intel.com\HDXPRT_Outbox\Ml-xBench" 
	exit
fi

echo "*** installing intel opencl package ***"
sudo apt-get remove intel-opencl
sudo dpkg -i intel-opencl_18.26.10987_amd64.deb

cd $CALLDIR
