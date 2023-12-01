import processing.serial.*; 
Serial myPort; 
int x, y, h, w, velocidadX, velocidadY;
int val1,val2, paletaXL, paletaYL, paletaH, paletaW, paletaS; 
int paletaXR, paletaYR; 
int actualL, actualR;
boolean upL, downL, upR, downR; 
int scoreL=0; 
int scoreR=0; 
int winScore=4; 
color colorL=color(255, 0, 0);
color colorR=color(0);
PImage bg;
void setup(){
  myPort = new Serial(this, Serial.list()[0], 9600);
  size(600,600);
  textSize(30);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  paletaXL=10;
  paletaYL=height/2;
  paletaXR=width-10;
  paletaYR=height/2;
  paletaH=120;
  paletaW=20;
  paletaS=5;
  actualL=300;
  x=width/2; 
  y=height/2; 
  h=50; 
  w=50; 
  velocidadX=2;
  velocidadY=3;
  bg = loadImage("fondo.png");
  println(Serial.list());
}

void draw(){
 
 background(bg);
  if(myPort.available()>0){
  val1 = myPort.read(); 
 }
 
  moverBOLA();
  rebote();
  moverPaleta();
  contactoPaleta();
  puntaje();
  gameOver();
}

void moverBOLA(){
 fill(255,0,0);
 ellipse(x,y,w,h);
 x=x+velocidadX;
 y=y+velocidadY;
 }
 
 
void rebote(){
 if(x > width-w/3){
 reStart();
 velocidadX = -velocidadX;
 scoreL=scoreL+1;}
 else if(x<0+w/3){
 scoreR=scoreR+1;
 reStart();
 }
 else if(y>height-h/3){
 velocidadY=-velocidadY;
 }
 else if(y<0+h/3){
 velocidadY=-velocidadY;
 }
 } 
 
void moverPaleta(){
 
  paletaYL=val1;
 fill(colorL);
 rect(paletaXL,paletaYL,paletaW,paletaH);
 fill(colorR);
 rect(paletaXR,paletaYR,paletaW,paletaH);

 /* if(val==1){
  paletaYL=paletaYL-paletaS;
  }
  if(val==2){
  paletaYL=paletaYL+paletaS;
  }
  if(val==3){
  paletaYR=paletaYR-paletaS;
  }
  if(val==4){
  paletaYR=paletaYR+paletaS;
  }
  if(paletaYL - paletaH/2 < 0){
  paletaYL = paletaYL + paletaS;
  }
  if(paletaYL + paletaH/2 > height){
  paletaYL = paletaYL - paletaS;
  }
  if(paletaYR - paletaH/2 < 0){
  paletaYR = paletaYR + paletaS;
  }
  if(paletaYR + paletaH/2 > height){
  paletaYR = paletaYR - paletaS;
  }
  */
}


void contactoPaleta(){
if(x-w/2<paletaXL+paletaW/2 && y-h/2 < paletaYL+paletaH/2 && y+h/2 > paletaYL-paletaH/2){
 if(velocidadX < 0){
 velocidadX = -velocidadX;} 
}
 if(x+w/2 > paletaXR - paletaW/2 && y+h/2 > paletaYR - paletaH/2 && y-h/2 < paletaYR + paletaH/2){
 if(velocidadX > 0){
   velocidadX=-velocidadX;}
}
}

 void puntaje(){
 fill(colorL);
 text("PLAYER 1",100,15);
 fill(colorR);
 text("PLAYER 2",width-100,15);
 fill(250,0,0);
 text(scoreL,100,40);
 text(scoreR,width-100,40);
 }
 
 void gameOver(){
 if(scoreL == winScore){
 gameOverPage("Player 1 GANADOR",colorL);
 }
 if(scoreR == winScore){
 gameOverPage("Player 2 GANADOR",colorR);
 }
 }
 
 void gameOverPage(String msg, color c){
 velocidadX=0;
 velocidadY=0;
 text("GAME OVER",width/2,height/3-40);
 text("CLICK PARA RESTART",width/2,height/3-80);
 text(msg,width/2,height/3);
 if(mousePressed){
 scoreR=0;
 scoreL=0;
 velocidadX=2;
 velocidadY=3;
 }
 }
 
 void reStart(){
 x=width/2;
 y=height/2;
 h=50;
 w=50;
 velocidadX=2;
 velocidadY=3;
 }
 
 
