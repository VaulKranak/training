FROM ubuntu:16.04

# python 3 and python 2 are pre-installed in 16.04
RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y python3-pip 
RUN pip3 install --upgrade pip

#cuda
RUN apt-get install wget -y
RUN wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install cuda -y --no-install-recommends

RUN pip3 install --upgrade tensorflow-gpu && python3 -c "import tensorflow as tf; print(tf.__version__)"

ENV HOME /research
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Mount data into the docker
ADD . /research/transformer
WORKDIR /research/transformer
ENTRYPOINT ["/bin/bash"]
