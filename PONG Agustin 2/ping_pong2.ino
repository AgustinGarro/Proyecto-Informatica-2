
int btn1 = A0;
int btn2 = A1;
int btn3 = A2;
int btn4 = A3;
int val; 
int paletaXL=10;
int paletaYL=600/2;
int paletaXR=600-10;
int paletaYR=600/2;
int paletaH=120;
int paletaW=20;
int paletaS=5;
int actualL=300;
int actualR=300;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
 pinMode(btn1,INPUT);
 pinMode(btn2,INPUT);
 pinMode(btn3,INPUT);
 pinMode(btn4,INPUT);
 pinMode(13,OUTPUT);
 digitalWrite(13,LOW);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(btn1) == 0){
     paletaYL=paletaYL-paletaS;
       digitalWrite(13,HIGH);
       }
  else if(digitalRead(btn2) == 0){
     paletaYL=paletaYL+paletaS;
       digitalWrite(13,HIGH);
       }
  else if(digitalRead(btn3) == 0){
      paletaYR=paletaYR-paletaS;
     digitalWrite(13,HIGH); 
       }
  else if(digitalRead(btn4) == 0){
    paletaYR=paletaYR+paletaS;
       digitalWrite(13,HIGH);
      }
  if(paletaYL - paletaH/2 < 0){
  paletaYL = paletaYL + paletaS;
  }
  if(paletaYL + paletaH/2 > 600){
  paletaYL = paletaYL - paletaS;
  }
  if(paletaYR - paletaH/2 < 0){
  paletaYR = paletaYR + paletaS;
  }
  if(paletaYR + paletaH/2 > 600){
  paletaYR = paletaYR - paletaS;
  }
 // if(actualL!=paletaYL){
    Serial.write(paletaYL);
    Serial.println(paletaYL);
   // actualL=paletaYL;
 // }
 /* if(actualR!=paletaYR){
    Serial.write(paletaYR);
    Serial.println(paletaYR);
    actualR=paletaYR;
  }
  /*Serial.write(paletaYL);
  Serial.println(paletaYL);
  Serial.write(paletaYR);
  Serial.println(paletaYR);*/
   digitalWrite(13,LOW);
   delay(20);
}
