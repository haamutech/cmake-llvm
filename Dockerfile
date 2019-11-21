FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ARG CMAKE_VERSION=3.15.5
ARG LLVM_VERSION=9

# System packages
RUN apt-get update &&\
    apt-get install --no-install-recommends -y wget \
                                               ca-certificates \
                                               lsb-core \
                                               gnupg \
                                               software-properties-common \
                                               make &&\
# Install LLVM
    wget -O llvm.sh https://apt.llvm.org/llvm.sh &&\
    chmod +x llvm.sh &&\
    ./llvm.sh ${LLVM_VERSION} &&\
# Install CMake
    wget -O cmake.sh https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh &&\
    chmod +x cmake.sh &&\
    ./cmake.sh --skip-license &&\
# Cleanup
    rm -f cmake.sh llvm.sh &&\
    apt-get remove -y wget \
                      ca-certificates \
                      lsb-core \
                      gnupg \
                      software-properties-common &&\
    apt-get -y autoremove &&\
    apt-get -y autoclean

ENV CC=clang-${LLVM_VERSION}
ENV CXX=clang++-${LLVM_VERSION}
