# RUN: julia -e "import Brutus; Brutus.lit(:emit_lowered)" --startup-file=no %s 2>&1 | FileCheck %s

symbol() = :testing
emit(symbol)



# CHECK: module {
# CHECK-NEXT:   func @"Tuple{typeof(Main.symbol)}"(%arg0: !jlir<"typeof(Main.symbol)">) -> !jlir.Symbol attributes {llvm.emit_c_interface} {
# CHECK-NEXT:     %0 = "jlir.constant"() {value = #jlir<":testing">} : () -> !jlir.Symbol
# CHECK-NEXT:     return %0 : !jlir.Symbol
# CHECK-NEXT:   }
# CHECK-NEXT: }

# CHECK: module {
# CHECK-NEXT:   llvm.func @"Tuple{typeof(Main.symbol)}"(%arg0: !llvm.ptr<struct<()>>) -> !llvm.ptr<struct<()>> attributes {llvm.emit_c_interface} {
# CHECK-NEXT:     %0 = llvm.mlir.constant({{[0-9]+}} : i64) : !llvm.i64
# CHECK-NEXT:     %1 = llvm.inttoptr %0 : !llvm.i64 to !llvm.ptr<struct<()>>
# CHECK-NEXT:     llvm.return %1 : !llvm.ptr<struct<()>>
# CHECK-NEXT:   }
# CHECK-NEXT:   llvm.func @"_mlir_ciface_Tuple{typeof(Main.symbol)}"(%arg0: !llvm.ptr<struct<()>>) -> !llvm.ptr<struct<()>> attributes {llvm.emit_c_interface} {
# CHECK-NEXT:     %0 = llvm.call @"Tuple{typeof(Main.symbol)}"(%arg0) : (!llvm.ptr<struct<()>>) -> !llvm.ptr<struct<()>>
# CHECK-NEXT:     llvm.return %0 : !llvm.ptr<struct<()>>
# CHECK-NEXT:   }
# CHECK-NEXT: }
