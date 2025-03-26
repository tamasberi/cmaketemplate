FROM cmaketemplate:base

ARG cmake_version=3.31.6

RUN apt update && apt upgrade && apt install --yes \
 build-essential \
 curl \
 && rm -rf /var/lib/apt/lists/*

RUN cd /opt \
 && curl -fkSL https://github.com/Kitware/CMake/releases/download/v$cmake_version/cmake-$cmake_version-linux-x86_64.tar.gz -o cmake-$cmake_version-linux-x86_64.tar.gz \
 && tar xzf cmake-$cmake_version-linux-x86_64.tar.gz \
 && rm cmake-$cmake_version-linux-x86_64.tar.gz
ENV PATH="$PATH:/opt/cmake-$cmake_version-linux-x86_64/bin"
