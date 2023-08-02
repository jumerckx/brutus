#! /bin/bash

rootpath=$(pwd)

rm -rf $rootpath/build
mkdir $rootpath/build && cd $rootpath/build

cmake .. -G Ninja \
    -DMLIR_DIR="/storage/jumerckx/llvm_build/lib/cmake/mlir" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
ninja

readelf -Ws $rootpath/build/lib/libStandaloneCAPITestLib.so | awk '$8 !~ /^_/ {print $8}' > $rootpath/symbols_brutus.txt
