add_mlir_library(
  BRUTUSCodegen
  Brutus.cpp
  # Codegen.cpp

  ADDITIONAL_HEADER_DIRS
  ${BRUTUS_INCLUDE_DIR}/JuliaOps

  LINK_LIBS PUBLIC
  MLIR
  MLIRCAPIDebug
  MLIRCAPIIR
  MLIRCAPIRegisterEverything

  # Dialects
  MLIRExecutionEngine
  MLIRTargetLLVMIRExport

)
llvm_update_compile_flags(BRUTUSCodegen)
