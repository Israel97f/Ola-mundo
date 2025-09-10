use mlua::prelude::*;
use rodio::{Decoder, OutputStream, Sink};
use std::fs::File;
use std::io::BufReader;
use std::sync::Arc;

fn tocador_de_sons(_: &Lua, str_: LuaString) -> LuaResult<()> {
    // Converte LuaString para &str
    let path = str_.to_str()?.to_owned(); // transforma &str em String

    // Cria uma saída de áudio padrão
    let (_stream, stream_handle) = OutputStream::try_default()
        .map_err(|e| LuaError::ExternalError(Arc::new(e)))?;

    // Cria um reprodutor
    let sink = Sink::try_new(&stream_handle)
        .map_err(|e| LuaError::ExternalError(Arc::new(e)))?;

    // Abre o arquivo MP3
    let file = File::open(path)
        .map_err(|e| LuaError::ExternalError(Arc::new(e)))?;

    let source = Decoder::new(BufReader::new(file))
        .map_err(|e| LuaError::ExternalError(Arc::new(e)))?;

    // Toca o áudio
    sink.append(source);
    sink.sleep_until_end();

    Ok(())
}


#[mlua::lua_module]
fn toca_som (lua: &Lua) -> LuaResult<LuaTable>{
    let exports = lua.create_table()?;
    exports.set("rode", lua.create_function(tocador_de_sons)?)?;
    Ok(exports)
}
