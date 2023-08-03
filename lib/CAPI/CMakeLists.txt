add_mlir_public_c_api_library(BRUTUSCAPI
  Beaver.cpp
  SHARED
  LINK_LIBS PUBLIC
  MLIRDialectUtils
  MLIRCAPIIR
  MLIRTransforms
  MLIRRewrite
)