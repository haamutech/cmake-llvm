# cmake-llvm

![CI](https://github.com/haamutech/cmake-llvm/workflows/CI/badge.svg)

This repository contains a builder for Docker image which contains CMake and LLVM. You are free to set any CMake and LLVM version via build arguments; `CMAKE_VERSION` and `LLVM_VERSION` respectively. Default CMake version is 3.17.1 and default LLVM version is 10. There is also a built-in OpenMP support that can be enabled in `CMakeLists.txt`:

```
find_package(OpenMP)

if (OpenMP_CXX_FOUND)
   target_link_libraries(yourExecutable PUBLIC OpenMP::OpenMP_CXX)
endif()
```


# Building

Procedure of building the image:

```bash
git clone git@github.com:haamutech/cmake-llvm.git
cd cmake-llvm
docker build -t haamutech/cmake-llvm:latest .
```

This will build the image for your host platform.

# Ready made Docker image

You can grab a ready made Docker image for your platform from [Docker Hub](https://hub.docker.com/r/haamutech/cmake-llvm).
