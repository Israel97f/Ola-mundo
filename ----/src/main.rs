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
    tempo_para_apoastro: Stream<f64>,
    altitude_nivel_mar: Stream<f64>,
    periastro: Stream<f64>,
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let client = Client::new("Obitar", "127.0.0.1", 50000, 50001).await?;
    println!("Conectado ao kRPC!");

    let space_center = SpaceCenter::new(client.clone());

    let vessel = space_center.get_active_vessel().await?;
    let telemetria = telemetria(&vessel).await?;

    let control = vessel.get_control().await?;
    control.set_throttle(1.0).await?;
    control.set_sas(true).await?;

    println!("iniciando lançamento...");
    for s in 0..10 {
        println!("Lançamento em: {} segundos", 10 -s);
        tokio::time::sleep(std::time::Duration::from_secs(1)).await;
    }


    control.activate_next_stage().await?;

    let auto_pilot = vessel.get_auto_pilot().await?;
    auto_pilot.engage().await?;

    loop {
        let apoastro = telemetria.apoastro.get().await.unwrap_or(0.0);
        if apoastro > 100_000.0 {
            println!("Atingiu 100 km de altitude! Cortando motores...");
            control.set_throttle(0.0).await?;
            auto_pilot.disengage().await?;
            break;
        }
        println!("Altitude: {:.2} m", apoastro);
        tokio::time::sleep(std::time::Duration::from_secs(1)).await;
    }

    // iniciando protocolo de órbita
    let _height_taguet = 100_000.0; // Altitude alvo para órbita (100 km)

    let valor_de_throttle = 
    telemetria.massa.get().await.unwrap_or(0.0) * (telemetria.gravidade_superficial as f32) * 1.5 /
    telemetria.trust_maximo;

    control.set_throttle(valor_de_throttle).await?;
    control.set_sas(false).await?;
    auto_pilot.engage().await?;
    auto_pilot.target_pitch_and_heading(90.0, 90.0).await?;


    loop {
        let orbital_speed_taguet = (telemetria.parametro_gravitacional / (telemetria.raio_equatorial + _height_taguet)).sqrt();
        let time_burn = (orbital_speed_taguet - telemetria.velocidade_orbital.get().await.unwrap_or(0.0)) / 
        ((telemetria.trust_maximo / telemetria.massa.get().await.unwrap_or(1.0)) as f64);

        let curva = ((telemetria.altitude.get().await.unwrap_or(0.0) - _height_taguet) / _height_taguet) as f32;
        auto_pilot.target_pitch_and_heading(90.0 - (90.0 * curva), 90.0).await?;


        if _height_taguet > telemetria.apoastro.get().await.unwrap_or(0.0) &&
        telemetria.apoastro.get().await.unwrap_or(0.0) > _height_taguet * 0.9 {

            let throttle_slow = telemetria.massa.get().await.unwrap_or(0.0) * (telemetria.gravidade_superficial as f32) * 1.2 /
            telemetria.trust_maximo;

            control.set_throttle(throttle_slow).await?;
        } else if telemetria.apoastro.get().await.unwrap_or(0.0) > _height_taguet{
            control.set_throttle(0.0).await?;
        }


        if time_burn / 2.0 < telemetria.tempo_para_apoastro.get().await.unwrap_or(0.0) &&
        _height_taguet - telemetria.altitude_nivel_mar.get().await.unwrap_or(0.0) > 4_000.0 {
            println!("Iniciando queima de inserção orbital...");
            control.set_throttle(1.0).await?;
            break;
        }

        print_telemetria(&telemetria).await;
        tokio::time::sleep(std::time::Duration::from_millis(300)).await;
    }

    loop{
        if (telemetria.apoastro.get().await.unwrap_or(0.0) - telemetria.periastro.get().await.unwrap_or(0.0)).abs() < 2_000.0
        || telemetria.apoastro.get().await.unwrap_or(0.0) < _height_taguet * 1.05 {
            println!("Órbita estabilizada!");
            control.set_throttle(0.0).await?;
            auto_pilot.disengage().await?;
            break;
        }


        print_telemetria(&telemetria).await;
    }


    Ok(())
}

async fn telemetria (vessel: &krpc_client::services::space_center::Vessel) -> Result<Telemetria, Box<dyn std::error::Error>> {
    // stream de altitude
    let flight = vessel.flight(None).await?;
    let orbit = vessel.get_orbit().await?;
    let body = orbit.get_body().await?;
    let veloref_flight = body.get_reference_frame().await?;
    let veloref_orbit = body.get_orbital_reference_frame().await?;


    let altitude_stream = flight.get_mean_altitude_stream().await?;
    altitude_stream.set_rate(3.0).await?;

    let mass_stream = vessel.get_mass_stream().await?;
    mass_stream.set_rate(3.0).await?;

    let gravitational_parameter = body.get_gravitational_parameter().await?;
    let equatorial_radius = body.get_equatorial_radius().await?;

    let apoapsis_stream = orbit.get_apoapsis_altitude_stream().await?;
    apoapsis_stream.set_rate(3.0).await?;

    let periapsis_stream = orbit.get_periapsis_altitude_stream().await?;
    periapsis_stream.set_rate(3.0).await?;

    let surface_gravity = body.get_surface_gravity().await?;
    let max_trust = vessel.get_max_thrust().await?;

    let speed_orbit_stream = vessel.flight(Some(&veloref_orbit)).await?.get_speed_stream().await?;

    let time_apoapsis_stream = orbit.get_time_to_apoapsis_stream().await?;
    time_apoapsis_stream.set_rate(3.0).await?;

    let height_seia_level_stream = vessel.flight(Some(&veloref_flight)).await?.get_mean_altitude_stream().await?;

    // Aguarda um pouco para as streams serem populadas
    tokio::time::sleep(std::time::Duration::from_millis(100)).await;

    Ok(Telemetria {
        altitude: altitude_stream,
        massa: mass_stream,
        gravidade_superficial: surface_gravity,
        apoastro: apoapsis_stream,
        trust_maximo: max_trust,
        parametro_gravitacional: gravitational_parameter,  
        raio_equatorial: equatorial_radius,
        periastro: periapsis_stream,
        velocidade_orbital: speed_orbit_stream,
        tempo_para_apoastro: time_apoapsis_stream,
        altitude_nivel_mar: height_seia_level_stream,

    })
}

async fn print_telemetria(telemetria: &Telemetria) {
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
}
