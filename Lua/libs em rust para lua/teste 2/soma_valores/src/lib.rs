use mlua::prelude::*;
use mlua::Value;

fn soma_va_tabela (_: &Lua, tabela: LuaTable) -> LuaResult<f64>{
    let mut soma = 0.0;
    for pares in tabela.pairs::<Value, Value>() {
        let (_, valor) = pares?;
        if let Value::Number(n) = valor {
            soma += n;
        } 
        else if let Value::Integer(i) = valor {
            soma += i as f64;
        } 
    }

    Ok(soma)
}

#[mlua::lua_module]
fn soma_valores (lua: &Lua) -> LuaResult<LuaTable>{
    let exports = lua.create_table()?;
    exports.set("soma_t", lua.create_function(soma_va_tabela)?)?;
    Ok(exports)
}
