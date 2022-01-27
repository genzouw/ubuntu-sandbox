FROM ubuntu:21.04

LABEL maintainer "genzouw <genzouw@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Tokyo
ENV LANG ja_JP.UTF-8

RUN apt-get update \
  && apt -y install \
    --no-install-recommends \
    gcc \
    git \
    golang \
    libicu-dev \
    liblua5.3-dev \
    libpq-dev \
    locales \
    make \
    man \
    mercurial \
    procps \
    python3-dev \
    language-pack-ja \
    unixodbc-dev \
    unzip \
    vim \
    w3m \
    zlib1g-dev \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
  && update-locale LANG=ja_JP.UTF-8 \
  ;

RUN sh -c "yes | unminimize"

RUN echo '\n\
export PS1="\n\[\e[1;33m\]\$ \[\e[m\]"\n\

alias vi='vim'\n\
set -o vi\n\
\n\
{\n\
  echo '----------'\n\
  echo "\$ uname -moi"\n\
  uname -moi\n\
  echo\n\
  echo "\$ head -n 2 /etc/os-release"\n\
  head -n 2 /etc/os-release\n\
  echo\n\
  echo "\$ bash -version | head -n 1"\n\
  bash -version | head -n 1\n\
  echo '----------'\n\
}\n\
' >> /root/.bashrc

ENTRYPOINT ["/bin/bash"]
