int x = 0;
int y = 0;

void setup(){
  size(600,600);
  strokeWeight(2);
  
  translate(width/2, height/2);
  
  for(int i=0; i<360; i++){
    rotate(radians(1));
    stroke(random(0,255), random(0,255),random(0,255));
    line(x,y,width,x);
  }
}

void draw(){
  
  
}
