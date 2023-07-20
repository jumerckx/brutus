#! /bin/bash

rootpath=$(pwd)

rm -rf $rootpath/build
mkdir $rootpath/build && cd $rootpath/build

cmake .. -G Ninja \
    -DMLIR_DIR="/home/jumerckx/julia/build/debug/usr/lib/cmake/mlir" \
    -DLLVM_EXTERNAL_LIT="/home/jumerckx/julia/build/debug/usr/tools/lit/lit.py" \
    -DJulia_EXECUTABLE="/home/jumerckx/julia/build/debug/julia" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
ninja

readelf -Ws $rootpath/build/lib/libStandaloneCAPITestLib.so | awk '$8 !~ /^_/ {print $8}' > $rootpath/symbols_brutus.txt
