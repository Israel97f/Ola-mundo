use krpc_client::Client;
use krpc_client::services::space_center::SpaceCenter;
use krpc_client::stream::Stream;

struct Telemetria {
    altitude: Stream<f64>,
}

#[tokio::main]
async fn main() {
    let client = Client::new("Obitar", "127.0.0.1", 50000, 50001).await.expect("Erro ao conectar");
    println!("Conectado ao kRPC!");

    let space_center = SpaceCenter::new(client.clone());

    let vessel = space_center.get_active_vessel().await.expect("Erro ao obter nave ativa");
    let telemetria = telemetria(vessel).await;

    loop {
        println!("Telemetria: {:?}", telemetria.altitude.get().await.unwrap_or(0.0));
    }
}

async fn telemetria (vessel: krpc_client::services::space_center::Vessel) -> Telemetria {
    // stream de altitude
    let flight = vessel.flight(None).await.expect("Erro ao obter flight");
    let altitude_stream = flight.get_mean_altitude_stream().await.expect("Erro ao abrir stream de altitude");
    altitude_stream.set_rate(3.0).await.expect("Erro ao configurar taxa de atualização");

    Telemetria {
        altitude: altitude_stream,
    }
}
