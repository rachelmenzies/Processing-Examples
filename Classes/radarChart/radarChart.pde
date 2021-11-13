
float size = 90;
float temp;
int how_many = 8;

int min = 0; 
int max = 100;                    // scale for map function

float[] xPos = {150, 400};                         // position of the radar charts
float[] yPos = {400, 400};

float data_1[] = {100, 50, 75, 22, 100, 40, 100, 100};    // dataset 1
float[] new_data_1 = new float[how_many];

float data_2[] = {100, 100, 100, 100, 100, 100, 50, 50};      // dataset 2
float[] new_data_2 = new float[how_many];

int eWidth = 10;

// contains the values
Value[] positions_1 = new Value[how_many]; 
Value[] positions_2 = new Value[how_many]; 

void setup() {
  size(600, 600);
}


void draw() {

  background(255);

  println("first");
  drawChart(size, xPos[0], yPos[0], data_1, new_data_1, positions_1);

  println("second");
  drawChart(size, xPos[1], yPos[1], data_2, new_data_2, positions_2);
}


void drawChart(float s, float x, float y, float[] val, float[] new_val, Value[] display_data) {

  // line setup 
  // lines drawn at end (so they are on top)
  temp = s*s;            // calculate x and y movement for new end of line
  temp = temp/2;         // (Pythagorus)
  temp = sqrt(temp);


  // setup values

  // val 0 is 12 o'clock position then move round to the right
  new_val[0] = map(val[0], min, max, 0, s);
  display_data[0] = new Value(val[0], x, y-new_val[0]);

  new_val[1] = map(val[1], min, max, 0, temp);
  display_data[1] = new Value(val[1], x+new_val[1], y-new_val[1]);

  new_val[2] = map(val[2], min, max, 0, s);
  display_data[2] = new Value(val[2], x+new_val[2], y);

  new_val[3] = map(val[3], min, max, 0, temp);
  display_data[3] = new Value(val[3], x+new_val[3], y+new_val[3]);

  new_val[4] = map(val[4], min, max, 0, s);
  display_data[4] = new Value(val[4], x, y+new_val[4]);

  new_val[5] = map(val[5], min, max, 0, temp);
  display_data[5] = new Value(val[5], x-new_val[5], y+new_val[5]);

  new_val[6] = map(val[6], min, max, 0, s);
  display_data[6] = new Value(val[6], x-new_val[6], y);

  new_val[7] = map(val[7], min, max, 0, temp);
  display_data[7] = new Value(val[7], x-new_val[7], y-new_val[7]);


  // display chart

  // TRIANGLES
  pushStyle();  
  noStroke();
  for (int i = 0; i<display_data.length; i++) {
    // triangles
    if (i<display_data.length-1) {
      fill(157, 189, 240);
      triangle(x, y, display_data[i].getX(), display_data[i].getY(), display_data[i+1].getX(), display_data[i+1].getY() );
    }
    if (i==display_data.length-1) {
      fill(157, 189, 240);
      triangle(x, y, display_data[0].getX(), display_data[0].getY(), display_data[i].getX(), display_data[i].getY());
    }
  }
  popStyle();

  // LINES
  stroke(100);
  line(x-s, y, x+s, y);                  // horiz
  line(x, y-s, x, y+s);                  // vert
  line(x-temp, y-temp, x+temp, y+temp);  // diagonal
  line(x-temp, y+temp, x+temp, y-temp);

  // ELLIPSES
  pushStyle();  
  noStroke();
  for (int i = 0; i<display_data.length; i++) {
    display_data[i].display();
  }
  popStyle();
}