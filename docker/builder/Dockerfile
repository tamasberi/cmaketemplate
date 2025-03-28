FROM cmaketemplate:base

ARG cmake_version=3.31.6
ARG gcovr_version=8.3
ARG cppcheck_version=2.17.0
ARG doxygen_version=1.13.2

RUN apt update && apt upgrade -y && apt install -y \
 build-essential \
 curl \
 libgmock-dev \
 libgtest-dev \
 pip \
 valgrind \
 && rm -rf /var/lib/apt/lists/*

RUN cd /opt \
 && curl -fkSL https://github.com/Kitware/CMake/releases/download/v$cmake_version/cmake-$cmake_version-linux-x86_64.tar.gz -o cmake-$cmake_version-linux-x86_64.tar.gz \
 && tar xzf cmake-$cmake_version-linux-x86_64.tar.gz \
 && rm cmake-$cmake_version-linux-x86_64.tar.gz
ENV PATH="$PATH:/opt/cmake-$cmake_version-linux-x86_64/bin"

RUN pip install --break-system-packages --trusted-host files.pythonhosted.org gcovr==$gcovr_version

RUN cd /opt \
 && curl -fkSL https://github.com/danmar/cppcheck/archive/$cppcheck_version.tar.gz -o cppcheck-$cppcheck_version.tar.gz \
 && tar xzf cppcheck-$cppcheck_version.tar.gz \
 && cd /opt/cppcheck-$cppcheck_version \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make -j$(nproc) \
 && make install \
 && cd /opt \
 && rm -rf /opt/cppcheck-$cppcheck_version.tar.gz \
 && rm -rf /opt/cppcheck-$cppcheck_version

RUN cd /opt \
 && curl -fkSL https://www.doxygen.nl/files/doxygen-$doxygen_version.linux.bin.tar.gz -o doxygen-$doxygen_version.linux.bin.tar.gz \
 && tar xzf doxygen-$doxygen_version.linux.bin.tar.gz \
 && rm doxygen-$doxygen_version.linux.bin.tar.gz
ENV PATH="$PATH:/opt/doxygen-$doxygen_version/bin"
