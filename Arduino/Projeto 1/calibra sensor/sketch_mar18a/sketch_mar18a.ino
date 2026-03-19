int media(int passos);
void setup() {
  // put your setup code here, to run once:

  Serial.begin(1200);
  //pinMode("A0", INPUT);


}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println("Valor lido: " + String(media(10)));
  delay(300);

}

int media(int passos){
  int soma = 0;
  int i;
  for (i = 0; i <= passos; i++){
    soma = soma + analogRead(A0);
    delay(10);
  }
  return soma/passos;
}
