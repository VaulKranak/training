FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

# python 3 and python 2 are pre-installed in 16.04
RUN apt update && apt -y upgrade

RUN apt-get install -y python3-pip 
RUN python3 -m pip install --upgrade pip

RUN pip3 install tensorflow-gpu
#RUN python -c "import tensorflow as tf; print(tf.__version__)"
