

void setup() {

  size(800, 800);
  strokeWeight(30);
  int xPos;
  int yPos;

  int num_rows = 8;
  int num_cols = 8;




  // top right

  yPos = 400;
  for (int y=0; y<num_rows; y++) {
    xPos = 400;
    for (int x=num_cols; x>0; x--) {
      point(xPos, yPos);
      xPos = xPos + 40;
    } 
    num_cols = num_cols - 1;
    yPos = yPos + 40;
  }
}
