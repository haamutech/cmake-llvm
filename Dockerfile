FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ARG LLVM_VERSION=9

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
                                               make \
                                               python-pip &&\
    (apt-get install --no-install-recommends -y libomp-dev || true) &&\
# Install LLVM
    wget -O llvm.sh https://apt.llvm.org/llvm.sh &&\
    chmod +x llvm.sh &&\
    ./llvm.sh ${LLVM_VERSION} &&\
# Install CMake
    pip install --upgrade cmake && \
# Cleanup
    rm -f llvm.sh &&\
    apt-get remove -y wget \
                      ca-certificates \
                      lsb-core \
                      gnupg \
                      software-properties-common \
                      python-pip &&\
    apt-get -y autoremove &&\
    apt-get -y autoclean
