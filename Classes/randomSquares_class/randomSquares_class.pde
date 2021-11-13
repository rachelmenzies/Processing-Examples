// Rachel Menzies
// Displays objects of type Square
// Clicking on a square will change the colour

int num = 10;
Square[] boxes = new Square[num]; 

float width_of_square = 40;
float height_of_square = 40;


/*
SETUP - RUNS ONCE
 */
void setup() {

  size(600, 650);
  background(255);

  // create boxes in the array
  for (int i=0; i<boxes.length; i++) {
    boxes[i] = new Square(width_of_square, height_of_square);
  }
}




/*
DRAW - RUNS OVER AND OVER
 */
void draw() {

  background(255);  

  // go through the array of boxes and display each one
  for (int i=0; i<boxes.length; i++) {
    boxes[i].display();
  }
}


// 
// runs whenever the mouse is clicked
//
void mousePressed() {

  // go through the boxes array and check each box
  // onClick function checks if mouse click is withint the boundaries of the box
  for (int i=0; i<boxes.length; i++) {
    boxes[i].onClick();
  }
}



