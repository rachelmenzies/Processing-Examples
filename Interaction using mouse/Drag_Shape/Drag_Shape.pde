// Click and Drag an object
// Daniel Shiffman 

Draggable d;

void setup() {
  size(600,600);
  smooth();
  drawLines();
  d = new Draggable(50,50,100,100);
}

void draw() {
  background(255);
  drawLines();
  drawBackgroundShapes();
  d.rollover(mouseX,mouseY);
  d.drag(mouseX,mouseY);
  d.display();
}

void mousePressed() {
  d.clicked(mouseX,mouseY);
}

void mouseReleased() {
  d.stopDragging();
}

void drawLines(){
 
 int positionX = 20;
 int positionY = 0;
 int lineHeight = height;
 int lineWidth = width;
 int lineSpacing = 20;
 
 for (int i=0; i<width; i++){
   line (positionX, positionY, positionX, positionY + lineHeight);
   positionX = positionX + lineSpacing;
 }
 
 positionX = 0;
 positionY = 20;
 
 for (int i=0; i<height; i++){
   line (positionX, positionY, positionX + lineWidth, positionY);
   positionY = positionY + lineSpacing;
 }
 
}


void drawBackgroundShapes(){
  fill(255,0,0);
  rect(100,100,100,100);
}
