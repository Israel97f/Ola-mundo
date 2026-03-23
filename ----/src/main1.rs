use krpc_client::Client;
use krpc_client::services::space_center::SpaceCenter;
use krpc_client::stream::Stream;

#[tokio::main]
async fn main() {
    // Conectar ao servidor kRPC
    let client = Client::new("Launch Script", "127.0.0.1", 50000, 50001)
        .await
        .expect("Erro ao conectar");

    let space_center = SpaceCenter::new(client.clone());
    let vessel = space_center.get_active_vessel().await.unwrap();
    let control = vessel.get_control().await.unwrap();

    // Configurar throttle para 100%
    control.set_throttle(1.0).await.unwrap();

    // Ativar próximo estágio (ligar motores)
    control.activate_next_stage().await.unwrap();
    println!("Motores acionados!");

    // Abrir stream do apoastro
    let orbit = vessel.get_orbit().await.unwrap();
    let mut apoapsis_stream: Stream<f64> =
        orbit.get_apoapsis_altitude_stream().await.unwrap();
    apoapsis_stream.set_rate(1.0).await.unwrap();

    // Subir até 100 km de apoastro
    let target_altitude = 100_000.0;
    loop {
        apoapsis_stream.wait().await;
        let apoapsis = apoapsis_stream.get().await.unwrap();
        println!("Apoastro atual: {:.2} m", apoapsis);

        if apoapsis >= target_altitude {
            println!("Atingiu apoastro alvo! Cortando motores...");
            control.set_throttle(0.0).await.unwrap();
            break;
        }
    }

    println!("Lançamento concluído!");
}
