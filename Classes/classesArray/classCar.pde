class Car {

  float x;
  float y;
  int w;
  int h;
  color c;
  float speed;
  int wheel_size;

  // create a car and set initial values
  Car() {
    x = 0;
    y = random(0,height);
    w = 120;
    h = 50;
    //c = color(random(255), random(255), random(255));
    speed = random(1, 3);
    wheel_size=30;
  }

  // BEHAVIORS
  void display() {
    fill(c);
    rect(x,y,w,h);
    fill(255);
    rect(x+80,y+10,30,20);
    fill(100);
    ellipse(x+25,y+h,wheel_size,wheel_size);
    ellipse(x+95,y+h,wheel_size,wheel_size);
  }

  void drive() {
    x = x+speed;
    if (x>width) {
      x = -w;
    }
  }
  
  void setSpeed(float s){
    speed = s;
  }
  
  float getSpeed(){
    return speed;
  }
  
  void setColor(color col){
    c = col;
  }
}