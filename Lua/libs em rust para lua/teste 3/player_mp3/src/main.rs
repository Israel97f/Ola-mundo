use rodio::{Decoder, OutputStream, Sink};
use std::fs::File;
use std::io::BufReader;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Cria uma saída de áudio padrão
    let (_stream, stream_handle) = OutputStream::try_default()?;

    // Cria um reprodutor
    let sink = Sink::try_new(&stream_handle)?;

    // Abre o arquivo MP3
    let file = File::open("/home/israel/Música/Saveiro.mp3")?;
    let source = Decoder::new(BufReader::new(file))?;

    // Toca o áudio
    sink.append(source);
    sink.sleep_until_end(); // Espera até o fim da reprodução

    Ok(())
}
