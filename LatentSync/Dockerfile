FROM nvidia/cuda:12.5.1-cudnn-runtime-ubuntu22.04

# set bash env
SHELL ["/bin/bash", "-c"]
ENV BASH_ENV="/etc/bash_env" \
    TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive


# fix sources.list
RUN set -e && \
    sed -i 's|http://archive.ubuntu.com/ubuntu/|https://mirrors.ustc.edu.cn/ubuntu/|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com/ubuntu/|https://mirrors.ustc.edu.cn/ubuntu/|g' /etc/apt/sources.list && \
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
RUN --mount=type=cache,target=/root/.cache/pyenv,sharing=locked \ 
    set -e &&\
    pyenv install ${PYTHON_VERSION} &&\
    pyenv global ${PYTHON_VERSION} &&\
    pyenv rehash
# link python and pip
RUN set -e && \
    ln -sf $(pyenv which python) /usr/local/bin/python && \
    ln -sf $(pyenv which pip) /usr/local/bin/pip

