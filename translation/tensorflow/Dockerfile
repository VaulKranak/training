FROM tensorflow/gpu

ENV HOME /research
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Mount data into the docker
ADD . /research/transformer
WORKDIR /research/transformer
ENTRYPOINT ["/bin/bash"]
