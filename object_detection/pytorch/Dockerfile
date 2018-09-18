FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04

ARG A_NO_CUDA=1
ENV NO_CUDA=$A_NO_CUDA

# Pytorch depends
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      git \
      libgoogle-glog-dev \
      libgtest-dev \
      libiomp-dev \
      libleveldb-dev \
      liblmdb-dev \
      libopencv-dev \
      libopenmpi-dev \
      libsnappy-dev \
      libprotobuf-dev \
      openmpi-bin \
      openmpi-doc \
      protobuf-compiler \
      python-dev \
      python-pip
RUN apt-get install -y --no-install-recommends libgflags-dev
RUN pip install setuptools
RUN pip install --upgrade pip
RUN pip install \
      future \
      numpy \
      protobuf

# Detectron depends
RUN pip install \
     numpy pyyaml matplotlib opencv-python>=3.2 setuptools Cython mock scipy

# Hidden dependancies
RUN pip install networkx enum typing

# Build and install pytorch
WORKDIR /packages
RUN git clone --recursive https://github.com/pytorch/pytorch
WORKDIR /packages/pytorch
RUN python setup.py install

ENV PYTHONPATH=/packages/pytorch/build:$PYTHONPATH

# Build and install the COCO API
WORKDIR /packages
RUN git clone https://github.com/cocodataset/cocoapi.git
WORKDIR /packages/cocoapi/PythonAPI
RUN make install

# Build detectron
WORKDIR /packages
RUN git clone https://github.com/ddkang/Detectron.git detectron
WORKDIR /packages/detectron
RUN git checkout benchmarking
WORKDIR /packages/detectron/lib
RUN make
WORKDIR /packages/detectron/lib/datasets/data

# RUN ln -s /data coco/
WORKDIR /packages/detectron 


