FROM ubuntu:16.04

# python 3 and python 2 are pre-installed in 16.04
RUN apt update && apt -y upgrade

RUN apt install python-pip
RUN python -m pip install --upgrade pip

RUN pip install paddlepaddle-gpu
