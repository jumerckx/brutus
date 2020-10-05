# RUN: julia -e "import Brutus; Brutus.lit(:emit_lowered)" --startup-file=no %s 2>&1 | FileCheck %s

sle_int(x, y) = Base.sle_int(x, y)
emit(sle_int, Int64, Int64)
# CHECK: func @"Tuple{typeof(Main.sle_int), Int64, Int64}"(%arg0: !jlir<"typeof(Main.sle_int)">, %arg1: i64, %arg2: i64) -> i1
# CHECK:   %0 = cmpi "sle", %arg1, %arg2 : i64
# CHECK:   return %0 : i1
# CHECK: llvm.func @"Tuple{typeof(Main.sle_int), Int64, Int64}"(%arg0: !llvm<"%jl_value_t*">, %arg1: !llvm.i64, %arg2: !llvm.i64) -> !llvm.i1
# CHECK:   %0 = llvm.icmp "sle" %arg1, %arg2 : !llvm.i64
# CHECK:   llvm.return %0 : !llvm.i1