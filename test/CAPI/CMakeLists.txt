# Here we create a single aggregate shared library with the parts of the CAPI
# that we want to bundle together. Then we link a simple C executable
# against it to demonstrate that it does have the fully self contained
# core MLIR library and our own standalone dialect.
add_mlir_aggregate(StandaloneCAPITestLib
  SHARED
  PUBLIC_LIBS
  ${Julia_LIBRARY}
  ${Julia_Internal_LIBRARY}
  brutus
  EMBED_LIBS
  MLIRCAPIIR
  MLIRCAPIRegisterEverything
  BRUTUSCAPI

  MLIRCAPIConversion
  MLIRCAPIDebug
  MLIRCAPIExecutionEngine
  MLIRCAPIInterfaces
  MLIRCAPITransforms

  MLIRCAPIAsync
  MLIRCAPIControlFlow
  MLIRCAPIGPU
  MLIRCAPILLVM
  MLIRCAPILinalg
  MLIRCAPISCF
  MLIRCAPIShape
  MLIRCAPISparseTensor
  MLIRCAPIFunc
  MLIRCAPITensor
  MLIRCAPIQuant
  MLIRCAPIPDL
)
