FROM tensorflow/gpu

ENV HOME /research
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Mount data into the docker
ADD . /research/transformer
WORKDIR /research/transformer
ENTRYPOINT ["/bin/bash"]
