void emviaMsg(String msg);
bool butao(int pino);
String comando = " ";

void setup() {
    Serial.begin(1200);  // Cria a comunicação serial (<2000 baud)
    
    DDRD &= ~((1 << DDD4) | (1 << DDD5) | (1 << DDD6) | (1 << DDD7));    // Configura as portas RD4 - RD7 como entradas
    PORTD &= ~((1 << DDD4) | (1 << DDD5) | (1 << DDD6) | (1 << DDD7));   // desativa os pul ups de RD4 - RD7 
}

void loop() {
    if ((butao(DDD4) | butao(DDD5) | butao(DDD6) | butao(DDD7))){                      // algum botão precionado ?
        if (butao(DDD4)) {
            comando = "A1";
        }

        if (butao(DDD5)) {
            comando = "A2";
        }

        if (butao(DDD6)) {
            comando = "A3";
        }

        if (butao(DDD7)) {
            comando = "A4";
        }

        emviaMsg(comando);
        
    } else {
        emviaMsg("A0");
        delay(100);
    }
    
}

void emviaMsg(String msg) {
    byte checksum = 0;

    for (int i = 0; i < msg.length(); i++) {
        checksum ^= msg[i];  // XOR simples
    }

    Serial.write('$');  // início
    Serial.write(msg.c_str());
    Serial.write('#');       // fim
    Serial.write(checksum);  // checksum
    Serial.flush();
}

bool butao(int pino){
    return !(PIND & (1 << pino));
}
