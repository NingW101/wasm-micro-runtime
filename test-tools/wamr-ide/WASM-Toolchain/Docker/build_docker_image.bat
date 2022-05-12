@REM Copyright (C) 2019 Intel Corporation.  All rights reserved.
@REM SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

@echo off

@REM pull gcc and ubuntu image firstly no matter whether exist or not.
docker pull gcc:9.3.0
docker pull ubuntu:20.04
docker build --build-arg http_proxy=http://child-prc.intel.com:913 ^
             --build-arg https_proxy=http://child-prc.intel.com:913 ^
             --build-arg ftp_proxy=http://child-prc.intel.com:913 ^
             --build-arg socks_proxy=http://child-prc.intel.com:913 ^
             -t wasm-toolchain:1.0 .

@REM delete intermediate docker image
docker image prune -f
