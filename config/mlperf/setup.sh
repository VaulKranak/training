#!/bin/bash

SCRIPTDIR="$(dirname "$0")"
CALLDIR="$(pwd)"

DEPENDACIES=(bridge-utils docker nvidia-docker proxy cuda)

cd SCRIPTDIR

for dir in DEPENDACIES
do
	echo installing $dir
	../"$dir"/install.sh
done

cd CALLDIR
