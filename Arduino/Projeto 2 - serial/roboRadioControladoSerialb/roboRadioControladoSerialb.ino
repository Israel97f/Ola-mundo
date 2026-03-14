
String msg = " ";
bool temSinal = false;

void muve(int velo, char dir);

void setup() {
    Serial.begin(1200);
    attachInterrupt(digitalPinToInterrupt(2), mirrorSignal, CHANGE);

     //pinMode
    DDRD |= (1 << DDD4);                                                    // define D4 como saida
    DDRD &= ~(1 << DDD2);                                                    // define D2 como entrada
    PORTD |= (1 << DDD2);                                                    // ativa pull-up interdo de D2

    DDRB |= ((1 << DDB0) | (1 << DDB1) | (1 << DDB2) | (1 << DDB4) | (1 << DDB5));        // define B0,B1,B2,B4 e B5 como saidas
    PORTB &= ~((1 << DDB0) | (1 << DDB1) | (1 << DDB2) | (1 << DDB4));      // inicia em low

    // configurar PWM nas portas PB1 e PB2
    TCCR1A = (1 << COM1A1) | (1 << COM1B1) | (1 << WGM11);  
    TCCR1B = (1 << WGM12) | (1 << WGM13) | (1 << CS11);   // Prescaler = 8
    ICR1 = 399; // define a frequecia do PWM

    sei();      // Habilita as interrupções globais
}

void loop() {
    // Aqui o loop fica livre para só reagir à mensagem pronta
    if (temSinal){
        if (msg == "A1"){
            muve(0, 'a');
        }
        if (msg == "A2"){
            muve(0, 'b');
        }
        if (msg == "A3"){
            muve(0, 'c');
        }
        if (msg == "A4"){
            muve(0, 'd');
        }
    } else {
        muve(0, 's');
    }
    delay(10);
}

// Essa função é chamada automaticamente quando chegam dados pela UART
void serialEvent() {
    static String buf = "";
    static bool receiving = false;

    temSinal = false;

    while (Serial.available()) {
        char a = Serial.read();

        if (a == '$') {
            buf = "";
            receiving = true;
        } else if (a == '#') {
            receiving = false;
        } else if (!receiving && buf.length() > 0) {
            byte checksum = 0;
            for (int i = 0; i < buf.length(); i++) {
                checksum ^= buf[i];
            }
            if (checksum == (byte)a) {
                //Serial.println("Mensagem válida: " + buf);
                msg = buf;
                temSinal = true;
            } else {
                Serial.println("Erro de checksum!");
            }
            buf = "";
        } else if (receiving) {
            buf += a;
        }
    }
}

// Interrupção para espelhar o sinal do RF
void mirrorSignal() {
    int rxSignal = digitalRead(2);
    digitalWrite(4, rxSignal ? HIGH : LOW);
}

// fução de movimento do carro
void muve(int velo, char dir) {
    static bool primeraVez = 1;
    static int instanteAnterior = 0;
    static int duty = 0;

    Serial.println(duty);
    switch (dir) {
        case 'a':
            // Frente
            if (primeraVez) {
                duty = ICR1 * 0.75;
                primeraVez = 0;
            }
            
            duty >= ICR1 ? ICR1 : duty ++;

            OCR1A = duty;
            OCR1B = duty;

            PORTB &= ~(1 << 4);
            PORTB &= ~(1 << 0);

            break;
        case 'b':
            // Ré
            if (primeraVez) {
                duty = ICR1 * 0.65;
                primeraVez = 0;
            }
            
            duty <= 0 ? 0 : duty --;

            OCR1A = duty;
            OCR1B = duty;

            PORTB |= (1 << 4);
            PORTB |= (1 << 0);

            break;
        case 'c':
            // Direita
            OCR1A = ICR1 * 0.25;
            OCR1B = ICR1 * 0.75;
            PORTB &= ~(1 << 4);
            PORTB |= (1 << 0);
            break;
        case 'd':
            // Esquerda
            OCR1A = ICR1 * 0.75;
            OCR1B = ICR1 * 0.25;
            PORTB |= (1 << 4);
            PORTB &= ~(1 << 0);
            break;
        case 's':
            // Parar
            PORTB &= ~(1 << 4);
            PORTB &= ~(1 << 0);

            duty = 0;
            OCR1A = duty;
            OCR1B = duty;

            if (millis() - instanteAnterior >= 500){
                primeraVez = 1;
                instanteAnterior = millis();
            }

            break;
    }
}
