Ellipse e1, e2; // variables for ellipse objects
Ellipse ellipses[]; // an array of ellipses

// set up the sketch
void setup() {
  // set the size
  size(600, 600);

  // create instance of ellipse object using default constructor
  e1 = new Ellipse();

  // set fields
  e1.setX(200);
  e1.setY(200);
  e1.setWidth(50);
  e1.setHeight(50);
  e1.setFillColor(color(115, 0, 0));

  // display it
  e1.display();

  // create instance of ellipse object using alternative constructor
  e2 = new Ellipse(400, 400, 75, 75, color(0, 115, 0));

  // display it
  e2.display();

  // create array of 5 ellipses
  ellipses = new Ellipse[5];

  // initialise them
  for (int i=0; i<5; i++) {
    ellipses[i] = new Ellipse(i*10, i*10, 5, 5, color(0, 0, 115));
  }

  // display them  
  for (int i=0; i<5; i++) {
    ellipses[i].display();
  }
}
