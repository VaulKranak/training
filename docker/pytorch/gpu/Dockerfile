FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu16.04

RUN apt update && apt -y upgrade

ARG CONDAPATH = /opt/conda

RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p $CONDAPATH && \
     rm ~/miniconda.sh

ENV PATH $CONDAPATH/bin:$PATH

# Install basic dependencies
RUN $CONDAPATH install numpy pyyaml mkl mkl-include setuptools cmake cffi typing && \
	$CONDAPATH install -c mingfeima mkldnn

# Add LAPACK support for the GPU
RUN $CONDAPATH install -c pytorch magma-cuda90 # [magma-cuda<ver>] depending on your cuda version

RUN apt install git && \
	git clone --recursive https://github.com/pytorch/pytorch && \
	cd /pytorch  && \
	python setup.py install

ENV PYTHONPATH=/packages/pytorch/build:$PYTHONPATH
