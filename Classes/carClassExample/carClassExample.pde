Car myCar;
int road_x = 0;
int road_y = 465;

void setup(){
  size(600,600);
  myCar = new Car();
  drawBackground();
  myCar.display();
}

void draw(){
  
}

void drawBackground(){
  fill(255);
  rect(0,0,width,height);
  fill(0);
  rect(road_x,road_y,width,height-road_y);
}

void keyPressed(){
  if(keyCode==RIGHT){
    drawBackground();
    myCar.driveCar();
  }
  if(keyCode==LEFT){
    drawBackground();
    myCar.reverseCar();
  }
}