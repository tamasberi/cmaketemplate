#!/bin/bash
pwd=$(pwd)
docker build -t cmaketemplate:base $pwd/docker/base
docker build -t cmaketemplate:builder --secret id=auth_conf,src=/etc/apt/auth.conf.d/mini_dinstall.conf $pwd/docker/builder
docker build -t cmaketemplate:builder $pwd/docker/runtime
