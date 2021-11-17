void setup(){
  size (600,600);

  drawGrid();
  
}




void drawGrid(){
 
 int positionX = 0;
 int positionY = 0;
 int lineHeight = height;
 int lineWidth = width;
 int lineSpacing = 50;
 
 // draw vertical lines
 for (int i=0; i<width; i++){
   line (positionX, positionY, positionX, positionY + lineHeight);
   positionX = positionX + lineSpacing;
 }
 
 positionX = 0;
 positionY = 0;
 
 // draw horizontal lines
 for (int i=0; i<height; i++){
   line (positionX, positionY, positionX + lineWidth, positionY);
   positionY = positionY + lineSpacing;
 }
  
}
