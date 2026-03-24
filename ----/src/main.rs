use krpc_client::Client;
use krpc_client::services::space_center::SpaceCenter;
use krpc_client::stream::Stream;
use std::io::Write;

struct Telemetria {
    altitude: Stream<f64>,
    massa: Stream<f32>,
    gravidade_superficial: f64,
    apoastro: Stream<f64>,
    trust_maximo: f32,
    parametro_gravitacional: f64,
    raio_equatorial: f64,
    velocidade_orbital: Stream<f64>,
}

#[tokio::main]
async fn main() {
    let client = Client::new("Obitar", "127.0.0.1", 50000, 50001).await.expect("Erro ao conectar");
    println!("Conectado ao kRPC!");

    let space_center = SpaceCenter::new(client.clone());

    let vessel = space_center.get_active_vessel().await.expect("Erro ao obter nave ativa");
    let telemetria = telemetria(&vessel).await;

    let control = vessel.get_control().await.expect("Erro ao definir throttle");
    control.set_throttle(1.0).await.expect("Erro ao definir throttle");
    control.set_sas(true).await.expect("Erro ao ativar SAS");
    control.activate_next_stage().await.expect("Erro ao ativar próximo estágio");

    let auto_pilot = vessel.get_auto_pilot().await.expect("Erro ao obter auto pilot");
    auto_pilot.engage().await.expect("Erro ao engajar auto pilot");

    loop {
        let altitude = telemetria.altitude.get().await.unwrap_or(0.0);
        if altitude > 100_000.0 {
            println!("Atingiu 100 km de altitude! Cortando motores...");
            control.set_throttle(0.0).await.expect("Erro ao cortar motores");
            auto_pilot.disengage().await.expect("Erro ao desengajar auto pilot");
            break;
        }
        println!("Altitude: {:.2} m", altitude);
        tokio::time::sleep(std::time::Duration::from_secs(1)).await;
    }

    // iniciando protocolo de órbita

    let valor_de_throttle = 
    telemetria.massa.get().await.unwrap_or(0.0) * (telemetria.gravidade_superficial as f32) * 1.5 /
    telemetria.trust_maximo;

    control.set_throttle(valor_de_throttle).await.expect("Erro ao ajustar throttle para órbita");
    control.set_sas(false).await.expect("Erro ao desativar SAS para órbita");
    auto_pilot.engage().await.expect("Erro ao engajar auto pilot para órbita");
    auto_pilot.target_pitch_and_heading(90.0, 90.0).await.expect("Erro ao definir alvo de pitch e heading para órbita");

    loop {
        //*
        print!("\x1B[2J\x1B[H"); // Limpa a tela e move o cursoR para o início
        std::io::stdout().flush().unwrap();
        
        println!("Altitude: {:.2} m", telemetria.altitude.get().await.unwrap_or(0.0));
        println!("Massa: {:.2} kg", telemetria.massa.get().await.unwrap_or(0.0));
        println!("Gravidade Superficial: {:.2} m/s²", telemetria.gravidade_superficial);
        println!("Apoastro: {:.2} m", telemetria.apoastro.get().await.unwrap_or(0.0));
        println!("Trust Máximo: {:.2} N", telemetria.trust_maximo);
        println!("Parâmetro Gravitacional: {:.2}", telemetria.parametro_gravitacional);
        println!("Raio Equatorial: {:.2} m", telemetria.raio_equatorial);
        println!("Velocidade Orbital: {:.2} m/s", telemetria.velocidade_orbital.get().await.unwrap_or(0.0));
        // */
        tokio::time::sleep(std::time::Duration::from_secs(1)).await;
    }
}

async fn telemetria (vessel: &krpc_client::services::space_center::Vessel) -> Telemetria {
    // stream de altitude
    let flight = vessel.flight(None).await.expect("Erro ao obter flight");
    let orbit = vessel.get_orbit().await.expect("Erro ao obter órbita");
    let body = orbit.get_body().await.expect("Erro ao obter corpo celeste");
    let veloref_flight = body.get_reference_frame().await.expect("Erro ao obter referência de velocidade da superficie");
    let veloref_orbit = body.get_orbital_reference_frame().await.expect("Erro ao obter referência do corpo celeste");


    let altitude_stream = flight.get_mean_altitude_stream().await.expect("Erro ao abrir stream de altitude");
    altitude_stream.set_rate(3.0).await.expect("Erro ao configurar taxa de atualização");

    let mass_stream = vessel.get_mass_stream().await.expect("Erro ao abrir stream de massa");
    mass_stream.set_rate(3.0).await.expect("Erro ao configurar taxa de atualização");

    let gravitational_parameter = body.get_gravitational_parameter().await.expect("Erro ao obter parâmetro gravitacional");
    let equatorial_radius = body.get_equatorial_radius().await.expect("Erro ao obter raio equatorial");

    let apoapsis_stream = orbit.get_apoapsis_altitude_stream().await.expect("Erro ao abrir stream de apoastro");
    apoapsis_stream.set_rate(3.0).await.unwrap();

    let surface_gravity = body.get_surface_gravity().await.expect("Erro ao abrir gravidade superficial");
    let max_trust = vessel.get_max_thrust().await.expect("Erro ao obter max trust");

    let speed_orbit_stream = vessel.flight(Some(&veloref_orbit)).await.expect("Erro ao obter flight orbital").get_speed_stream().await.expect("Erro ao abrir stream de velocidade orbital");

    //max_trust

    // Aguarda um pouco para as streams serem populadas
    tokio::time::sleep(std::time::Duration::from_millis(100)).await;

    Telemetria {
        altitude: altitude_stream,
        massa: mass_stream,
        gravidade_superficial: surface_gravity,
        apoastro: apoapsis_stream,
        trust_maximo: max_trust,
        parametro_gravitacional: gravitational_parameter,  
        raio_equatorial: equatorial_radius,
        velocidade_orbital: speed_orbit_stream,
    }
}
