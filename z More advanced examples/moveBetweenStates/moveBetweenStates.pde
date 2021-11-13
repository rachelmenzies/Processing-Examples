int xLeft = 100;
int yLeft = 100;
int xRight = 400;
int yRight = 100;
int w = 100;
int h = 75;
int state = 1;


void setup() {
  textAlign(CENTER, CENTER);
  textSize(20);
  size(600, 600);
}

void draw() {

  if (state==1) {
    background(237, 146, 189);    // pink
    fill(255);                  // button backgrounds
    rect(xLeft, yLeft, w, h);
    rect(xRight, yRight, w, h);
    fill(0);                    // text on buttons
    text("LEFT", xLeft+w/2, yLeft+h/2);
    text("RIGHT", xRight+w/2, yRight+h/2);
  }

  if (state==2) {
    background(103, 146, 237);    // blue
    fill(255);                  // button backgrounds
    rect(xLeft, yLeft, w, h);
    rect(xRight, yRight, w, h);
    fill(0);                    // text on buttons
    text("LEFT", xLeft+w/2, yLeft+h/2);
    text("RIGHT", xRight+w/2, yRight+h/2);
    text("This is only displayed on state=2",width/2,550);
  }

  // display the current state
  fill(0);
  text("Current state = "+state, width/2, 400);
}


// mouse event handler
// check where the mouse is clicked
// if over the left button, state-1
// if over the right button, state+1
// if statements prevent state being <1 or >2
void mouseClicked() {

  // check left button
  // if state = 2, set it to 1
  if (mouseX>xLeft && mouseX<xLeft+w && 
    mouseY>yLeft && mouseY<yLeft+h) {
    if (state==2) {
      state=1;
    }
  }
  
  // check right button
  // if state is 1, set it to 2
  if (mouseX>xRight && mouseX<xRight+w && 
    mouseY>yRight && mouseY<yRight+h) {
    if (state==1) {
      state=2;
    }
  }
  
}
