#!/bin/bash
pwd=$(pwd)
image=cmaketemplate
docker build -t $image:base $pwd/docker/base
docker build -t $image:builder $pwd/docker/builder
docker build -t $image:runtime $pwd/docker/runtime
