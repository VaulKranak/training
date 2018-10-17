#!/bin/bash

# Install conda 
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
bash Anaconda3-5.2.0-Linux-x86_64.sh -b -p ~/anaconda
export PATH=$PATH:~/anaconda/bin
echo 'export PATH=$PATH:~/anaconda/bin' >> ~/.bashrc 

