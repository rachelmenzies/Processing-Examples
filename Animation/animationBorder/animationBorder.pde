int x = 50;
int y = 50;
int d = 30;

void setup(){
  size(600,600);
  background(255);
  
}

void draw(){
  
  if(x<550 && y==50){
    ellipse(x,y,d,d);
    x = x + 1;
  }
  
  if(x==550 && y<=550){
    ellipse(x,y,d,d);
    y = y + 1;
  }
  
  if(x>=50 && y==550){
    ellipse(x,y,d,d);
    x = x - 1;
  }
  
  if(x==50 && y>=51){
    ellipse(x,y,d,d);
    y = y - 1;
  }
  
  
}
  
