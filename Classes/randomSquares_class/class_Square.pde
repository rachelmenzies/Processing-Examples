class Square {

  float x;
  float y;  
  float w_square;
  float h_square;
  color c;

  Square(float w, float h) {
    w_square = w;
    h_square = h;
    x = random(0, width-h_square);  // make sure you can see the square
    y = random(0, width-w_square);
    c = color(random(0, 255), random(0, 255), random(0, 255));  // set a random colour
  }


  //
  // display the square 
  //
  void display() {
    fill(c);
    rect(x, y, w_square, h_square);
  }
  // end function


  //
  // changes the colour of the square when clicked on
  // checks that the mouse click is within the boundaries of the box
  // if it is, then change to a random colour
  //
  void onClick() {
    if (mouseX > x && mouseX < x + w_square && mouseY > y && mouseY < y + h_square) {
      c = color(random(0, 255), random(0, 255), random(0, 255));
    }
    display(); // call the display function to make sure that the new colour
               // is displayed immediately
  } 
  // end function
}

