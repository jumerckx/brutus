add_mlir_public_c_api_library(BRUTUSCAPI
  Dialects.cpp
  Beaver.cpp
  LINK_LIBS PUBLIC
  MLIRJulia
  MLIRIR
  MLIRDialectUtils
  MLIRCAPIIR
  MLIRTransforms
  MLIRRewrite
)