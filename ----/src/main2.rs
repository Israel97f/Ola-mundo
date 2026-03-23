use krpc_client::Client;
use krpc_client::services::space_center::SpaceCenter;

#[tokio::main]
async fn main() {
    // Conectar ao servidor kRPC
    let client = Client::new("kRPC TEST", "127.0.0.1", 50000, 50001)
        .await
        .expect("Erro ao conectar");

    let space_center = SpaceCenter::new(client.clone());

    // Abrir stream do tempo universal
    let mut ut_stream = space_center.get_ut_stream()
        .await
        .expect("Erro ao abrir stream");

    // Configurar taxa de atualização
    ut_stream.set_rate(1.0).await.expect("Erro ao configurar taxa");

    // Loop para imprimir valores
    for _ in 0..10 {
        // Espera próxima atualização (não retorna nada, só bloqueia)
        ut_stream.wait().await;

        // Agora sim, pega o valor atualizado
        let ut = ut_stream.get().await.expect("Erro ao ler stream");
        println!("It's {} o'clock", ut);
    }
}

