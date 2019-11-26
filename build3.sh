#!/usr/bin/env bash
# ******************************************************
# DESC    : pika-port3 build script
# AUTHOR  : Alex Stocks
# VERSION : 1.0
# LICENCE : Apache License 2.0
# EMAIL   : alexstocks@foxmail.com
# MOD     : 2019-01-22 19:54
# FILE    : build.sh
# ******************************************************

# install gflags-devel
# sudo yum install -y glags-devel

# install compression lib
#sudo yum install -y snappy snappy-devel
#sudo yum install -y zlib zlib-devel
#sudo yum install -y bzip2 bzip2-devel
#sudo yum install -y lz4-devel
#sudo yum install -y gflags-devel

# download third libs
# pls wait for about 30 minutes
git submodule update --init --recursive --force

# compile pika-port for pika 3.0.x
cd pika_port_3
make
#export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
./pika_port
