#include "brutus/brutus.h"
#include "brutus/brutus_internal.h"
#include "brutus/Dialect/Julia/JuliaOps.h"
#include "mlir/CAPI/IR.h"

#include "mlir/InitAllDialects.h"

using namespace mlir;
using namespace mlir::jlir;

extern "C"
{
    jl_sym_t *call_sym;
    jl_sym_t *invoke_sym;
    jl_value_t *argument_type;
    jl_value_t *const_type;
    jl_value_t *gotoifnot_type;
    jl_value_t *return_node_type;
    jl_function_t *getindex_func;

    jl_unionall_t *sizedarray_type;

    void brutus_init(jl_module_t *brutus_module)
    {
        // lookup session static data
        invoke_sym = jl_symbol("invoke");
        call_sym = jl_symbol("call");
        jl_module_t *compiler_module = (jl_module_t *)jl_get_global(
            jl_core_module, jl_symbol("Compiler"));
        assert(compiler_module);
        argument_type = jl_get_global(compiler_module, jl_symbol("Argument"));
        const_type = jl_get_global(compiler_module, jl_symbol("Const"));
        gotoifnot_type = jl_get_global(compiler_module, jl_symbol("GotoIfNot"));
        return_node_type = jl_get_global(compiler_module, jl_symbol("ReturnNode"));
        getindex_func = (jl_function_t *)jl_get_global(
            jl_base_module, jl_symbol("getindex"));

        mlir::DialectRegistry registry;
        registry.insert<mlir::jlir::JLIRDialect>();
        mlir::registerAllDialects(registry);
    }

    MlirType brutus_get_jlirtype(MlirContext Context,
                                 jl_datatype_t *datatype)
    {
        mlir::MLIRContext *ctx = unwrap(Context);
        mlir::Type type = JuliaType::get(ctx, datatype);
        return wrap(type);
    };

    jl_datatype_t *brutus_get_julia_type(MlirType v)
    {
        mlir::Type type = unwrap(v);
        return (jl_datatype_t *)type.cast<JuliaType>().getDatatype();
    }

    MlirAttribute brutus_get_jlirattr(MlirContext Context,
                                      jl_value_t *value)
    {
        mlir::MLIRContext *ctx = unwrap(Context);
        mlir::Attribute val = JuliaValueAttr::get(ctx, value);
        return wrap(val);
    };

} // extern "C"
