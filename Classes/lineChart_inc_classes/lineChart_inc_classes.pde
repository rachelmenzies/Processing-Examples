// Rachel Menzies
// Draw a line chart
// Creates objects of type Item
// Draws these objects as ellipses
// Connect ellipses with lines

// the values to be plotted on the line chart
// the chart is dynamic so you can change these values and the chart will resize
int values[] = {
  100, 20, 40, 30, 120, 90, 80, 10
};
int no_of_items = values.length;
Item[] item = new Item[no_of_items]; 

// variables needed for the line chart
int max_value = max(values);            // used to set the position of each line
int x_range = 500;                      // the max width of the chart
int y_range = 500;                      // the max height of the chart
int base_x = 50;                        // bottom-left position of the chart
int base_y = 600;                       // bottom-left position of the chart
float gap = x_range/(values.length-1);  // how far to move the x position for each line end

float size_of_point = 40;               // how big should each point be?

float xPos;                             // the x and y position for each item
float yPos;


/*
SETUP - RUNS ONCE
 */
void setup() {

  size(600, 650);
  background(255);

  // create the items in the array
  // set x and y positions
  for (int i=0; i<item.length; i++) {
    if (i==0) {              // set the first x position
      xPos = base_x;
    }
    else {                  // then add onto it each time
      xPos = xPos + gap;
    }
    yPos = base_y - map(values[i], 0, max_value, 0, y_range);
    item[i] = new Item(values[i], xPos, yPos, size_of_point);
  }
}



/*
DRAW - RUNS OVER AND OVER
 */
void draw() {

  background(255);

  // line to show bottom of line chart (a value of zero)
  strokeWeight(1);
  stroke(0);
  line(base_x, base_y, base_x+x_range, base_y);

  stroke(68, 106, 240);    // make the chart use a blue line

  // draw the lines first as these display under the ellipse (point)
  // use strokeWeight 10 
  strokeWeight(10);
  for (int i=1; i<item.length; i++) {
    line(item[i-1].getX(), item[i-1].getY(), item[i].getX(), item[i].getY());
  }

  // check if the mouse is over each point in the chart
  for (int i=0; i<item.length; i++) {
    item[i].onHover();
  }

  // display the points after the line so that they are on top
  // use strokeWeight 1 - if not then there will be a border that is not detected with onHover()
  strokeWeight(1);
  for (int i=0; i<item.length; i++) {
    item[i].display();
  }
}

