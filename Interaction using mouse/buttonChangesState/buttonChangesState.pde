// Rachel Menzies
// This program changes from one state to another when the mouse is pressed ona white button
// Allows you have have different screens for users to select things
// or to have an introduction screen / animation before the main program


String state = "blueState";  // this can be an integer or a String
                             // a String lets to give meaningful names to each state

int x = 100;  // position of the "button"
int y = 100;
int w = 200;
int h = 100;

void setup() {
  size(600, 600);  
}

void draw() {

  // depending on the current state use a different background colour
  // the initial state is "blueState"
  
  if (state == "blueState") {
    background(0, 0, 255);
    fill(255);
    rect(x, y, w, h);
    println("state is blue");
  }
  else if (state == "redState") {
    background(255, 0, 0);
    fill(255);
    rect(x, y, w, h);
  }
  
}



//
// whenever the mouse is pressed check if it is within the boundaries of the white "button"
// if yes then change the state to a different one
// the change in state will change the background colour used in the draw function
//

void mousePressed(){
  if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h) {
    if (state=="blueState") {
      state = "redState";
    }
    else if (state=="redState") {
      state = "blueState";
    }
  }
}
