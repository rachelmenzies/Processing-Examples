// Rachel Menzies
// Create a grid based on size of screen and size of box

int boxSize = 50;            // set size of gridlines
color grey = color(225);


void setup(){
  fullScreen();
}

void draw(){
  background(255);
  drawGrid(); 
}

void drawGrid(){
  // make sure lines are drawn
  strokeWeight(1);
  stroke(grey);
  
  // lines down the screen
  for(int i=0; i<width; i+=boxSize){
    line(i,0,i,height);
  }
  
  // lines across the screen
  for(int i=0; i<height; i+=boxSize){
    line(0,i,width,i);
  }
}
