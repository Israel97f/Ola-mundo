void muve(char dir);
int adcCon(char ch);

void setup() {
    //pinMode
    DDRB = 0x0F;    // Configura PB1, PB2 PB3 e PB4 como saidas
    PORTB &= ~(0x0F);

    //Configura o PWM
    TCCR1A = 0xA2;    // Configura os pinos OSC1A e OSC1B para o modo fast PWM
    TCCR1B = 0x0C;    // Configura o prescale para 1:1024
    OCR1A = 0xFF;    //Configura o ciclo de trabalho do PWM 
    OCR1B = 0xFF;    //Configura o ciclo de trabalho do PWM 

    // Configura o covesor AD do atmega
    ADMUX |= (1 << REFS0);    // Seleciona atensão de referenci AVcc
    ADCSRA |= (1 << ADEN) | (1 << ADIF) | (1 << ADPS1) | (1 << ADPS0);    // Habilita o ADC e define o prescaler para 128


    //Loop
    while(1){
        if ((adcCon(0) >= 867) & (adcCon(2) >= 867)) {
            //pass
        }
    }
}

void loop() {
  // put your main code here, to run repeatedly:
}

void muve(char dir) {
    switch (dir) {
    case 'f':
        PORTB &= ~(1 << 4);     // Seta PB3 para LOW
        PORTB &= ~(1 << 1);     // Seta PB1 para LOW
        OCR1AH = 0x01;
        OCR1BH = 0x01;
        OCR1AL = 0x80;
        OCR1BL = 0x80;
        break;

    case 'r':
        PORTB |= (1 << 4);     // Seta PB3 para HIGH
        PORTB |= (1 << 1);     // Seta PB1 para HIGH
        OCR1AH = 0x00;
        OCR1BH = 0x00;
        OCR1AL = 0x80;
        OCR1BL = 0x80;
        break;

    case 'd':
        PORTB |= (1 << 4);     // Seta PB3 para HIGH
        PORTB &= ~(1 << 1);     // Seta PB1 para LOW
        OCR1AH = 0x01;
        OCR1BH = 0x00;
        OCR1AL = 0x80;
        OCR1BL = 0x80;
        break;

    case 'e':
        PORTB &= ~(1 << 4);     // Seta PB3 para LOW
        PORTB |= (1 << 1);     // Seta PB1 para HIGH
        OCR1AH = 0x00;
        OCR1BH = 0x01;
        OCR1AL = 0x80;
        OCR1BL = 0x80;
        break;

    case 'p':
        PORTB &= ~(1 << 5);     // Seta PB4 para Low
        PORTB &= ~(1 << 1);     // Seta PB1 para Low
        OCR1AH = 0x00;
        OCR1BH = 0x00;
        OCR1AL = 0x00;
        OCR1BL = 0x00;
        break;
    }
}

int adcCon(char ch){
	static int analogH, analogL, analog;
  ADMUX =(ADMUX & 0xF8) | (ch & 0x07);
  ADCSRA |= (1<<ADSC); 
  while (!(ADCSRA & (1<<ADIF)));  // Aguarda a conversão terminar
  ADCSRA |= (1<<ADIF);              // limpa a ADIF com trasição LOW para HIGH
    
  analogL = ADCL;
  analogH = ADCH;
    
  analog = (analogH << 8) | analogL;

  return analog;

}
