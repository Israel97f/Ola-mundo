#include <RH_ASK.h>
#include <SPI.h>

RH_ASK driver;

String comand = " ";

void setup() {
    Serial.begin(9600); // Para visualizar no Monitor Serial
    if (!driver.init()) {
        Serial.println("Erro ao iniciar receptor");
    }

    pinMode(13, OUTPUT);
}

void loop() {
    uint8_t buf[12];   // Buffer para armazenar mensagem recebida
    uint8_t buflen = sizeof(buf);

    if (driver.recv(buf, &buflen)) {
        buf[buflen] = '\0'; // Finaliza string
        Serial.print("Recebido: ");
        Serial.println((char*)buf);
        comand = (const char*) buf;
        
    }
    if (comand == "A1")
    {
        digitalWrite(13, 1);
    }
    else
    {
        digitalWrite(13, 0);
    }
}
