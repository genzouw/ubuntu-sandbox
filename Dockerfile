FROM ubuntu:22.10

LABEL maintainer "genzouw <genzouw@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Tokyo
ENV LANG ja_JP.UTF-8
ENV MANPAGER less

RUN apt-get update \
  && apt -y install \
    --no-install-recommends \
    gcc \
    curl \
    git \
    golang \
    language-pack-ja \
    libicu-dev \
    liblua5.3-dev \
    libpq-dev \
    locales \
    make \
    man \
    mercurial \
    procps \
    python3-dev \
    unixodbc-dev \
    unzip \
    vim \
    w3m \
    zlib1g-dev \
    less \
  && apt reinstall ca-certificates -y \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
  && update-locale LANG=ja_JP.UTF-8 \
  && update-ca-certificates \
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
  echo "\$ head -n 3 /etc/os-release"\n\
  head -n 3 /etc/os-release\n\
  echo\n\
  echo "\$ bash -version | head -n 1"\n\
  bash -version | head -n 1\n\
  echo '----------'\n\
}\n\
' >> /root/.bashrc

ENTRYPOINT ["/bin/bash"]
