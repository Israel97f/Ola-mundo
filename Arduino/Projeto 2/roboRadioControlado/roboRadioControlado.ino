// C++ code
//
int adcCon(char ch);
void muve(int velo, char dir);
bool est = 0;
float instante = 0;
int freque = 0;
int itera = 1;
int duty = 0;
bool primeraVez = 1;

ISR (INT0_vect){ 
	if(est){
    freque = 1000000 / (micros() - instante);
    est = !est;
  } else {
    instante = micros();
    est = !est;
  }
  
}

void setup(){
  //pinMode
  DDRB = 0x37;
  PORTB |= (1 << 5);

  DDRD &= ~(1 << DDD2);  // entrada
  PORTD |= (1 << DDD2);  // ativa pull up

  DDRD |= (1 << DDD3);    //Pd3 como saida
  PORTD &= ~(1 << DDD3);

  // configurar PWM nas portas PB1 e PB2
  TCCR1A = (1 << COM1A1) | (1 << COM1B1) | (1 << WGM11);  
  TCCR1B = (1 << WGM12) | (1 << WGM13) | (1 << CS11);   // Prescaler = 8
  ICR1 = 399; // define a frequecia do PWM

  // configurar PWM PD3 e PB3
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
    if (freque > 1500 | freque <= 70){
      Serial.print(freque);
      Serial.println("Sem sinal!---");
    }
    else if (micros() - instante >= 50000){
      Serial.println("Sem sinal!-");
    }else {
      //Serial.print(freque);
      //Serial.println(" Hz");
    }

      
    if ((adcCon(0) >= 867) & (adcCon(2) >= 867)) {
      if (freque > 80 & freque <= 120){
        muve(0, 's');
      }
      if (freque > 180 & freque <= 220){
        muve(0, 'a');
      }
      if (freque > 1230 & freque <= 1270){ // frequencia de ~294 Hz estava sofrendo muita interferencia, não sei porque.
        muve(0, 'b');
      }
      if (freque > 480 & freque <= 520){
        muve(0, 'c');
      }
      if (freque > 694 & freque <= 734){
        muve(0, 'd');
      }
      PORTB &= ~(1 << DDB5);
    }else {
      muve(10, 's');
      PORTB |= (1 << DDB5);
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

  if(itera > 0){
    if ((duty < ICR1) & (duty >= 0)){
    duty = duty + itera;
    } else {
      if (duty >= ICR1){
        duty = ICR1;
      } else{
        duty = 0;
      }
    }
  } else {
      if ((duty <= ICR1) & (duty > 0)){
      duty = duty + itera;
      } else {
        if (duty >= ICR1){
          duty = ICR1;
        } else{
          duty = 0;
        }
      }
  }

  OCR1A = duty;
  OCR1B = duty;
  Serial.println(duty);
	switch (dir){
    case 'a': 
      // Frente
      if (primeraVez) {duty = ICR1 * 0.75; primeraVez = 0;} 
      PORTB &= ~(1 << 4);
      //PORTB &= ~(1 << 2);
      //PORTB |= (1 << 1);
      PORTB &= ~(1 << 0);
      itera = 1;
      break;
    case 'b':
      // Ré
      if (primeraVez) {duty = ICR1 * 0.5; primeraVez = 0;} 
      PORTB |= (1 << 4);
      //PORTB |= (1 << 2);
      //PORTB &= ~(1 << 1);
      PORTB |= (1 << 0);
      itera = -1;
      break;
    case 'c':
      // Direita
      duty = ICR1 * 0.75;
      PORTB &= ~(1 << 4);
      //PORTB &= ~(1 << 2);
      //PORTB &= ~(1 << 1);
      PORTB |= (1 << 0);
      break;
    case 'd':
      // Esquerda
      duty = ICR1 * 0.75;
      PORTB |= (1 << 4);
      //PORTB |= (1 << 2);
      //PORTB |= (1 << 1);
      PORTB &= ~(1 << 0);
      break;
    case 's':
      // Parar
      PORTB &= ~(1 << 4);
      //PORTB &= ~(1 << 2);
      //PORTB &= ~(1 << 1);
      PORTB &= ~(1 << 0);
      duty = 0;
      primeraVez = 1;
      break;
  	}

}
