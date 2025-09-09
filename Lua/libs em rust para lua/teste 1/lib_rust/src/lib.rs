use mlua::prelude::*;


fn hello_world(_: &Lua, _: ()) -> LuaResult<()>{
    println!("Ola mundo");
    Ok(())
}


#[mlua::lua_module]
fn minha_lib(lua: &Lua) -> LuaResult<LuaTable>{
    let exports = lua.create_table()?;
    exports.set("hello_world", lua.create_function(hello_world)?)?;
    Ok(exports)
}