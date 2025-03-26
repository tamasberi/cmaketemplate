#!/bin/bash
pwd=$(pwd)
cmake_build_type=Release
image=cmaketemplate
./build_project.sh $cmake_build_type || exit 1
rm -rf $pwd/docker/runtime/*.deb
cp $pwd/build/$cmake_build_type/*.deb $pwd/docker/runtime
docker build -t $image:runtime $pwd/docker/runtime || exit 1
docker run -it --rm $image:runtime || exit 1
exit 0
