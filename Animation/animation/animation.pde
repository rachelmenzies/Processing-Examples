float x = 0;
int y = 0;

void setup(){
  size(600,600);
  y = 100;
  frameRate(10);
}

void draw(){
  background(255);
  //x = getRandom();
  //ellipse(x,y,30,30);
  drawShape();
}


float getRandom(){
  float rand = random(0,600);
  return rand; 
}

void drawShape(){
  ellipse(x,y,30,30);
  if(x<600){
    x=x+5;
  }
}