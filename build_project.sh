#!/bin/bash

cmake_build_type=$1

if [ -z "$cmake_build_type" ]; then
 cmake_build_type=Debug
 echo "Variable cmake_build_type not defined, using default: $cmake_build_type"
else
 echo "Using variable cmake_build_type: $cmake_build_type"
fi

docker run -it --rm --entrypoint sh -v $(pwd):/work -w /work cmaketemplate:builder -c \
 "mkdir -p /work/build/$cmake_build_type && cd /work/build/$cmake_build_type && cmake -DCMAKE_BUILD_TYPE=$cmake_build_type ../.. && make && make test && make gcovr && make cppcheck && make valgrind && make package" \
 || exit 1

exit 0
