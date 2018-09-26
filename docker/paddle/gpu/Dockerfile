FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

# python 3 and python 2 are pre-installed in 16.04
RUN apt update && apt -y upgrade

RUN apt install python-pip && pip install --upgrade pip

RUN pip install paddlepaddle-gpu
