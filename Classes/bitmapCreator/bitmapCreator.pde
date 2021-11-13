Square[][] grid;    

int row = 16;      // make 64x64 layout
int col = 16;

int x=0;            // start positions of top left square
int y=0;

int w=40;    // account for 64x64 layout
int h=40;



void setup(){
   size (640,640);
  
  grid = new Square[row][col];
  println(w);
  // adjust x, y values when creating squares of the grid
   for(int i = 0; i < row; i++){
    for(int j = 0; j < col; j++){
      grid[i][j] = new Square(x, y, w, h);
      x += w;  // adjust x for width
    }
    y += h;    // after each row, ajust for height
    x = 0;    // reset to same x as row above
  }
  
}


void draw(){
   background(200);
    for(int i = 0; i < row; i++){
      for(int j = 0; j < col; j++){
        grid[i][j].display();
      }
    }
  
  
}


// if mouse press load the click function
void mousePressed(){
  for(int i = 0; i < row; i++){
    for(int j = 0; j < col; j++){
      grid[i][j].click(mouseX, mouseY);
    }
  }
}