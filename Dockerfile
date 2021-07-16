FROM ubuntu:21.10

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    --no-install-recommends \
    gcc \
    git \
    golang \
    libicu-dev \
    libpq-dev \
    locales \
    liblua5.3-dev \
    make \
    procps \
    python3-dev \
    unixodbc-dev \
    unzip \
    vim \
    w3m \
    zlib1g-dev \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN echo -e $'\n\
export PS1="\[\e[1;33m\]\$ \[\e[m\]"\n\

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
