class Car{
  
  // fields
  int w;
  int h;
  color c;
  int wheel_size;
  int x;
  int y;
  
  // constructor
  Car(){
    w = 120;
    h = 50;
    c = color(255,0,0);
    wheel_size = 30;
    x = 200;  // needed to position car on screen
    y = 400;
  }
  
  void display(){
    fill(c);
    rect(x,y,w,h);
    fill(255);
    rect(x+80,y+10,30,20);
    fill(100);
    ellipse(x+25,y+h,wheel_size,wheel_size);
    ellipse(x+95,y+h,wheel_size,wheel_size);
  }
  
  // move to right
  void driveCar(){
    x = x + 5;
    display();
  }
  
  // move to left
  void reverseCar(){
    x = x - 5;
    display();
  }
}