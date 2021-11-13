int x = 250;      // x position of pie chart center
int y = 280;      // y position of pie chart center
int r = 300;      // radius of pie chart

float[] results = {0.4, 0.5, 0.99, 0.68, 0.57};

void setup() {
  size(500, 500);
  background(255);
  noStroke();

  for (int i=0; i<results.length; i++){
    float stop = ((results[i])*360);        // calculate how much of 360 degrees is the value
    fill(random(255), random(255), random(255));        
    arc(x, y, r, r, radians(0)-HALF_PI, radians(stop)-HALF_PI);  // draw arc converting to radians
    r = r - 20;            // width of each line is 20
    fill(255);
    ellipse(x,y,r,r);      // draw ellipse to fill arc
  }
}


