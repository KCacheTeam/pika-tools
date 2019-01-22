#!/usr/bin/env bash
# ******************************************************
# DESC    : pika port build script
# AUTHOR  : Alex Stocks
# VERSION : 1.0
# LICENCE : Apache License 2.0
# EMAIL   : alexstocks@foxmail.com
# MOD     : 2019-01-22 19:54
# FILE    : build.sh
# ******************************************************

# pls wait for about 30 minutes
git submodule update --init --recursive --force
cd pika_port && make
