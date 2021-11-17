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
}

void keyPressed() {

   if(firstTime==true){
    if (keyCode==UP) {
      y = y-5;
      firstTime = false;
    }
    if (keyCode==DOWN) {
      y=y+5;
      firstTime = false;
    }
   }

}

// use this function to set an artificial note of whether 
// it is a repeated key press
// some OS will read a press and hold as multiple presses
// beware!
void keyReleased(){
  firstTime = true;
}