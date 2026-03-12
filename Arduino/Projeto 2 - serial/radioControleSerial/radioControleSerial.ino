#include <RH_ASK.h>
#include <SPI.h> // Necessário para RadioHead, mesmo sem usar SPI diretamente

RH_ASK driver;

void setup() {
    pinMode(7, INPUT);
    if (!driver.init()) {
        // Se der erro na inicialização
        pinMode(13, OUTPUT);
        digitalWrite(13, HIGH);
    }
}

void loop() {
    const char *msg = "00";
    if(!digitalRead(7))
    {
        msg = "A1";
    }
    else
    {
        msg = "A2";
    }

    driver.send((uint8_t *)msg, strlen(msg));
    driver.waitPacketSent();
}

