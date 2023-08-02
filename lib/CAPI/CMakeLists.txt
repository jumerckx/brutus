add_mlir_public_c_api_library(BRUTUSCAPI
  Beaver.cpp
  LINK_LIBS PUBLIC
  MLIRIR
  MLIRTransforms
  MLIRRewrite
)