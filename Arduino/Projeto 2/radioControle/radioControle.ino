// C++ code
//

int multiplier(int freq);
void readButton ();
int cont = 0;
int tcnt1 = (0xFF << 8)|(0xE7);                  // 65511
bool stbut = 0x00;
int mult = 0x00;

//*
ISR(TIMER1_OVF_vect) {
    cont ++;

    if (cont >= mult){
        cont = 0;
        PORTB ^= (1 << DDB0);
    } 
  
  	TCNT1 = tcnt1;
}
//*/

void setup(){
    //Serial.begin(9600);
    //*
    cli();
    TCCR1A = 0;                                   // Modo normal
    TCCR1B = 0x03;//(1 << CS11) | (1 << CS10) ;   // Prescaler 64

    TCNT1 = tcnt1;

    TIMSK1 |= (1 << TOIE1);

    sei();                                        // Ativa interrupção global
    //*/

    DDRB |= (1 << DDB0);                           // Configura PB0 como Saida
    PORTB &= ~(1 << DDB0);

    DDRD &= ~(DDD7) & ~(DDD6) & ~(DDD5) & ~(DDD4);
    PORTD &= ~(DDD7) & ~(DDD6) & ~(DDD5) & ~(DDD4);
}

void loop(){
  	readButton ();
}

int multiplier(int freq){
  	int multiplier = (500 /freq) / 0.1 ;
	return (multiplier);
}

void readButton (){
    
    if (!(PIND & (1 << DDD7))){
     	mult = 50;
    }

    if (!(PIND & (1 << DDD6))){
     	mult = 25;
    }

    if (!(PIND & (1 << DDD5))){
      	mult = 16;
    }

    if (!(PIND & (1 << DDD4))){
      	mult = 12;
    }

    if ((PIND & 0xF0) == 0xF0){
     	mult = 100;
    }
}
