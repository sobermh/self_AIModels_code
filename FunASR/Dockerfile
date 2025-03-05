FROM nvidia/cuda:12.5.1-cudnn-runtime-ubuntu22.04

# set bash env
SHELL ["/bin/bash", "-c"]
ENV BASH_ENV="/etc/bash_env" \
    TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive


# fix sources.list
RUN set -e && \
    sed -i 's|http://archive.ubuntu.com/ubuntu/|https://mirrors.aliyun.com/ubuntu/|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com/ubuntu/|https://mirrors.aliyun.com/ubuntu/|g' /etc/apt/sources.list && \
    apt-get update

# install ffmpeg6
RUN set -e &&\
    apt-get install -y software-properties-common && \
    add-apt-repository -y -n ppa:ubuntuhandbook1/ffmpeg6 &&\
    apt-get update &&\
    apt-get install -yq --no-install-recommends ffmpeg libavutil58



RUN set -e && \
  apt-get install -yq --no-install-recommends \
  aria2 git git-lfs curl wget && \
  git lfs install

# python depends
RUN set -e && \
  apt-get install -yq --no-install-recommends \
  build-essential gdb lcov pkg-config \
  libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
  libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
  lzma lzma-dev tk-dev uuid-dev zlib1g-dev libmpdec-dev


# install pyenv
RUN set -e &&\
    git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv &&\
    cd $HOME/.pyenv && src/configure && make -C src && \ 
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /etc/bash_env &&\
    echo 'export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"' >> /etc/bash_env



ARG PYTHON_VERSION=3.10.14
ARG PYTHON_VERSION_MINMAX=3.10
# install python
RUN --mount=type=cache,target=/root/.pyenv/cache,sharing=locked \ 
    set -e &&\
    pyenv install ${PYTHON_VERSION} &&\
    pyenv global ${PYTHON_VERSION} &&\
    pyenv rehash

#install poetry
ENV POETRY_VIRTUALENVS_CREATE=false \
  PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring \
  POETRY_CACHE_DIR='/var/cache/pypoetry' \
  POETRY_HOME='/usr/local'
RUN set -e &&\
  curl -sSL https://install.python-poetry.org | python


# Create the following directory in the container and make it the container's current working directory.
WORKDIR /workspace
ARG PROJECT_ROOT=.

COPY ${PROJECT_ROOT}/pyproject.toml  ${PROJECT_ROOT}/LICENSE ./
RUN --mount=type=cache,target=$POETRY_CACHE_DIR,sharing=locked \
  set -e &&\
  poetry install --no-root --no-interaction --no-ansi --only=main

