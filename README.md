# cmake-llvm-docker

This repository contains a builder for Docker image which contains CMake and LLVM. You are free to set any CMake and LLVM version via build arguments; `CMAKE_VERSION` and `LLVM_VERSION` respectively. Default CMake version is 3.15.5 and default LLVM version is 9.

# Building

Procedure of building the image:

```bash
git clone git@github.com:oinuar/cmake-llvm-docker.git
cd cmake-llvm-docker
docker build -t oinuar/cmake-llvm:latest .
```
