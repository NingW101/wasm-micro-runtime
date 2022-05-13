# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#!/bin/bash

AoT_Binary_Name=$1
Host_OS=$2

docker run --name=wasm-toolchain-ctr \
                -it -v $(pwd):$(pwd) \
                -w $(pwd) \
                wasm-toolchain:1.0  \
                /bin/bash -c "/root/build_wasm.sh $AoT_Binary_Name $Host_OS"

docker stop wasm-toolchain-ctr>/dev/null
docker rm wasm-toolchain-ctr>/dev/null