FROM pytorch/cpu

ARG A_NO_CUDA=1
ENV NO_CUDA=$A_NO_CUDA

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ADD . /workspace/pytorch
ADD ./cpu /workspace/pytorch

RUN python -m pip install --upgrade pip
RUN pip install -r /workspace/pytorch/requirements.txt

WORKDIR /workspace/pytorch
