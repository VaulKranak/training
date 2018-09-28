FROM ubuntu:16.04

# python 3 and python 2 are pre-installed in 16.04
RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y python3-pip 
RUN pip3 install --upgrade pip

RUN pip3 install --upgrade tensorflow && python3 -c "import tensorflow as tf; print(tf.__version__)"

ENV HOME /research
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Mount data into the docker
ADD . /research/transformer
WORKDIR /research/transformer
ENTRYPOINT ["/bin/bash"]
