// C++ code
//
int adcCon(char ch);
void muve(int velo, char dir);
bool est = 0;
float periodo = 0;
int freque = 0;
long int tempoAnterio = 0;

ISR (INT0_vect){ 
	if(est){
    freque = (micros() - periodo);
    //periodo = 0;
    est = !est;
  } else {
    periodo = micros();
    est = !est;
  }
  
}

void setup(){
  //pinMode
  DDRB = 0x2F;
  PORTB |= (1 << 5);

  DDRD &= ~(1 << DDD2);  // entrada
  PORTD |= (1 << DDD2);  // ativa pull up

  DDRD |= (1 << DDD3);    //Pd3 como saida
  PORTD &= ~(1 << DDD3);

  // configurar PWM
  TCCR2A = 0b10100011;		 		  // Modo fast PWM, interrupção por comparação
  TCCR2B = 0b00000101;				  // Prescaling em 1:1024
  OCR2B = 255;                          // Valor entre 0 e 255 (50% de ciclo de trabalho)
  // configura as interupções
  EICRA |= (1 << ISC01) | (1 << ISC00); // Interrupção externa 0 como borda de subida
  EIMSK |= (1 << INT0);                 // Interrupção externa 0 habilitada
  sei();                                // liga as interupções globais

  // Configura o covesor AD do atmega
  ADMUX |= (1 << REFS0); // Seleciona atensão de referenci AVcc
  ADCSRA |= (1 << ADEN) | (1 << ADIF) | (1 << ADPS1) | (1 << ADPS0); // Habilita o ADC e define o prescaler para 128

  Serial.begin(9600);
  while(1){
    
    //Serial.println(adcCon(0));
    //Serial.println(adcCon(1));
    if (1000000 / freque > 1500 & 1000000 / freque <= 70){
      Serial.println("Sem sinal!");
    }
    if (micros() - periodo >= 50000){
      Serial.println("Sem sinal!");
    }else {
      Serial.print(1000000 / freque);
      Serial.println(" Hz");
    }

    if (millis() - tempoAnterio >= 300){
      PORTB ^= (1 << DDB5);
      tempoAnterio = millis();
    }
      
    if ((adcCon(0) >= 867) & (adcCon(2) >= 867)) {
      if (1000000 / freque > 70 & 1000000 / freque <= 180){
        muve(0, 's');
      }
      if (1000000 / freque > 180 & 1000000 / freque <= 220){
        muve(0, 'a');
      }
      if (1000000 / freque > 220 & 1000000 / freque <= 440){
        muve(0, 'b');
      }
      if (1000000 / freque > 440 & 1000000 / freque <= 660){
        muve(0, 'c');
      }
      if (1000000 / freque > 660 & 1000000 / freque <= 880){
        muve(0, 'd');
      }
    }else {
      muve(10, 's');
    }
    delay(10);
  }
}

void loop(){}

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

void muve(int velo, char dir){
  if (OCR2B < 256 * 0.98){
    OCR2B ++;
  }else (OCR2B = 256 * 0.98);

	switch (dir){
    case 'a': 
      // Frente
      PORTB |= (1 << 4);
      PORTB &= ~(1 << 2);
      PORTB |= (1 << 1);
      PORTB &= ~(1 << 0);
      break;
    case 'b':
      // Ré
      PORTB &= ~(1 << 4);
      PORTB |= (1 << 2);
      PORTB &= ~(1 << 1);
      PORTB |= (1 << 0);
      break;
    case 'c':
      // Direita
      PORTB |= (1 << 4);
      PORTB &= ~(1 << 2);
      PORTB &= ~(1 << 1);
      PORTB |= (1 << 0);
      break;
    case 'd':
      // Esquerda
      PORTB &= ~(1 << 4);
      PORTB |= (1 << 2);
      PORTB |= (1 << 1);
      PORTB &= ~(1 << 0);
      break;
    case 's':
      // Parar
      PORTB &= ~(1 << 4);
      PORTB &= ~(1 << 2);
      PORTB &= ~(1 << 1);
      PORTB &= ~(1 << 0);
      OCR2B = 0x66;
      break;
  	}
}
