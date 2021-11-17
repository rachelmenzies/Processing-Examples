int x = 300;
int y = 300;
int w = 50;
int h = 50;
boolean firstTime = true;

void setup() { 
  size(600, 600);
}

void draw() {
  background(0);
  rect(x, y, w, h);
  
  if(keyPressed){
    if (keyCode==UP) {
      y = y-5;
    }
    if (keyCode==DOWN) {
      y = y+5;
    }
  }
}