#!/bin/bash
pwd=$(pwd)
image=cmaketemplate
docker build -t $image:base $pwd/docker/base || exit 1
docker build -t $image:builder $pwd/docker/builder || exit 1
exit 0
