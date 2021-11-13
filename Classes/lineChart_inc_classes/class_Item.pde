class Item {

  int value;
  float x;
  float y;  
  float diameter;
  float radius;
  float dist;
  color c;

  Item(int v, float xPos, float yPos, float s) {
    value = v;
    x = xPos;
    y = yPos;
    diameter = s;
    radius = diameter/2;
    c = color(68, 106, 240);
  }

  int getValue() {
    return value;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }



  //
  // display the ellipse to show the data value
  //
  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
  // end function


  //
  // changes the colour of the ellipse
  // the ellipse is not displayed in this function
  // display() is called in the main program
  //
  void onHover() {
    // Use Pythagorus Theorum to check the distance from 
    // mouse pointer to centre of the circle
    dist = (mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y);
    dist = sqrt(dist);

    // change the colour of the 'button' if the mouse hovers over it
    if (dist < radius) {
      c = color(6, 23, 82);
      displayInfo();
    }
    else {
      c = color(68, 106, 240);
    }
  }
  // end function


  //
  // display the value in a rectangle above the ellipse
  // this function is called from onHover()
  //
  void displayInfo() {
    fill(255);
    stroke(0);
    strokeWeight(2);
    rect(x-40, y-65, 80, 35);    // rectangle
    textAlign(CENTER);
    textSize(20);
    fill(255, 0, 0);
    text(value, x, y-40);      // text displayed inside rectangle
  }
  // end function
}

