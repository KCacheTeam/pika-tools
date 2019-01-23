#!/usr/bin/env bash
# ******************************************************
# DESC    : glog build script
# AUTHOR  : Alex Stocks
# VERSION : 1.0
# LICENCE : Apache License 2.0
# EMAIL   : alexstocks@foxmail.com
# MOD     : 2019-01-22 19:54
# FILE    : build.sh
# ******************************************************


##############
### install cmake3 && automake for compiling glog
##############

# wget https://cmake.org/files/v3.10/cmake-3.10.3.tar.gz
# tar -zxvf cmake-3.10.3.tar.gz
# cd cmake-3.10.3 && ./bootstrap  && gmake && sudo gmake install && cd ..
# rm -f /usr/bin/cmake
# ln -s /usr/local/bin/cmake /usr/bin/cmake

yum install -y automake 
autoreconf -ivf  

##############
### compile libunwind
##############

mkdir -p deps
cd deps

if [ ! -d "./libunwind-1.1" ]; then
  wget http://download.savannah.gnu.org/releases/libunwind/libunwind-1.1.tar.gz
  tar -xf libunwind-1.1.tar.gz
fi

mkdir libunwind
cd libunwind-1.1
./configure --prefix=`pwd`/../libunwind
make
make install
cd ..

##############
### compile gflags
##############

# 卸载系统的gflags
# sudo yum remove -y gflags-devel
# 下载编译gflags
if [ ! -d "./gflags-2.2.1" ]; then
  wget -O gflags-2.2.1.tar.gz https://github.com/gflags/gflags/archive/v2.2.1.tar.gz
  tar zxvf gflags-2.2.1.tar.gz
fi
cd gflags-2.2.1
rm -rf build && mkdir -p build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../../gflags
make
make install
cd ../..

##############
### compile glog
##############

cd third/glog
./configure --includedir=../../gflags/include
rm -rf build && mkdir -p build && cd build
export CXXFLAGS="-fPIC" && cmake .. -DCMAKE_INSTALL_PREFIX=../../../glog && make VERBOSE=1 && make install
cd ../../..

cd ..
