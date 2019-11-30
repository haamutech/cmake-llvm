# cmake-llvm-docker

This repository contains a builder for Docker image which contains CMake and LLVM. You are free to set any CMake and LLVM version via build arguments; `CMAKE_VERSION` and `LLVM_VERSION` respectively. Default CMake version is 3.15.5 and default LLVM version is 9. There is also a built-in OpenMP support that can be enabled in `CMakeLists.txt`:

```
find_package(OpenMP)

if (OpenMP_CXX_FOUND)
   target_link_libraries(yourExecutable PUBLIC OpenMP::OpenMP_CXX)
endif()
```


# Building

Procedure of building the image:

```bash
git clone git@github.com:haamutech/cmake-llvm-docker.git
cd cmake-llvm-docker
docker build -t haamutech/cmake-llvm:latest .
```


# Ready made Docker image

You are free to use Docker image that is automatically built by Docker Hub:

https://hub.docker.com/r/haamutech/cmake-llvm
