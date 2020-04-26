FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ARG LLVM_VERSION=9
ARG CMAKE_VERSION=3.17.1

ENV CC=clang-${LLVM_VERSION}
ENV CXX=clang++-${LLVM_VERSION}

# System packages
RUN apt-get update &&\
    apt-get install --no-install-recommends -y wget \
                                               ca-certificates \
                                               lsb-core \
                                               gnupg \
                                               software-properties-common \
                                               pkg-config \
                                               libssl-dev \
                                               libcurl4-openssl-dev \
                                               libexpat-dev \
                                               libz-dev \
                                               libbz2-dev \
                                               liblzma-dev \
                                               librhash-dev \
                                               libzstd-dev \
                                               make &&\
    (apt-get install --no-install-recommends -y libomp-dev || true) &&\
# Install LLVM
    wget -O llvm.sh https://apt.llvm.org/llvm.sh &&\
    chmod +x llvm.sh &&\
    ./llvm.sh ${LLVM_VERSION} &&\
# Install CMake
    wget -qO- https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz | tar xz &&\
    cd cmake-${CMAKE_VERSION} &&\
    ./bootstrap --parallel=`nproc` --system-libs --no-system-jsoncpp --no-system-libuv --no-system-libarchive -- -DCMAKE_BUILD_TYPE:STRING=Release &&\
    make -j`nproc` &&\
    make install &&\
    cd .. &&\
# Cleanup
    rm -f llvm.sh &&\
    rm -rf cmake-${CMAKE_VERSION} &&\
    apt-get remove -y wget \
                      ca-certificates \
                      lsb-core \
                      gnupg \
                      software-properties-common &&\
    apt-get -y autoremove &&\
    apt-get -y autoclean
