// Rachel Menzies
// Colour Gradient

int weight = 5;
int col = 0;
int x = 0;

void setup()
{
  size(1275, 600);
  strokeWeight(weight);
}

//goes on forever!
void draw()
{
  // create a for loop
  // runs 255 times because 255 'colours' in grayscale
  for (int i=0; i<255; i++) {
    stroke(col);            // set stroke colour
                            // change to (0,0,col) to see something else
    line(x, 0, x, height);  // draw vertical line
    
    //change variables
    x = x + weight;  // change x position based on weight of line
    col++;           // increase colour by one
  }
}
