// Rachel Menzies

// This sketch is to show how the drawing area can be
//    rotated around the (0,0) point when the area is
//    both translated to a new position and rotated 
//    around (0,0).

// Move the x and y positions to see how this affects the 
//    position of the drawing area.

HScrollbar horizontal, vertical;
float posX = 0;
float posY = 0;
int xSlider_xPos = 75;
int xSlider_yPos = 500;
int ySlider_xPos = 400;
int ySlider_yPos = 500;


int transX = 200;
int transY = 200;
int bgX = 200;
int bgY = 200;
int deg = 0;
int w = 100;
int h = 100;
color c = color(150, 222, 247);

boolean rotate = true;
int btnX = 500;
int btnY = 20;
int btnW = 80;
int btnH = 80;





void setup() {
  size(600, 600);
     
  horizontal = new HScrollbar(xSlider_xPos, xSlider_yPos, 150, 40,1);
  vertical = new HScrollbar(ySlider_xPos, ySlider_yPos, 150, 40,1);
}

void draw() {
  background(255);  

  // RED SQUARE IN BACKGROUND
  pushMatrix();
  translate(bgX, bgY);
  noFill();
  strokeWeight(10);
  stroke(255, 0, 0);
  rect(0, 0, w, h);
  ellipse(0, 0, 10, 10);
  popMatrix();
  
  // GET POSITIONS OF X AND Y FOR ROTATING SQUARE
  horizontal.update();
  horizontal.display();
  posX = horizontal.getPos();
  posX = map(posX,100,250,0,100); // from 100-250 (center of rect) to 0-100
  
  vertical.update();
  vertical.display();
  posY = vertical.getPos();
  posY = map(posY,545,695,0,100); // from 545-695 (center of rect) to 0-100
  println(posY);
  
  
  // DRAW ROTATING SQUARE
  pushMatrix();
  translate(transX, transY);
  translate(posX,posY);
  rotate(radians(deg));
  strokeWeight(1);
  stroke(0);
  fill(c,150);
  rect(0, 0, w, h);
  fill(0);
  ellipse(0,0,10,10);
  if(rotate){deg=deg+1;}
  popMatrix();
  
  // DRAW SLIDER LABELS
  textSize(20);
  text("x position",100,470);
  text("y position",430,470);
  
  // DRAW PLAY / PAUSE BUTTON
  fill(130,222,92);
  rect(btnX,btnY,btnW,btnH);

  fill(0);
  if(rotate){
    rect(515,40,20,40);
    rect(545,40,20,40);
  }
  else{
    triangle(520,40,520,80,560,60);
  }

}

void mouseClicked(){
  if(mouseX>btnX && mouseY>btnY && mouseX<btnX+btnW && mouseY<btnY+btnH){
    if(rotate){
      rotate=false;
    }
    else{
      rotate=true;
    }
  }
}
  
  
  
  
  
  
  
class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
  

}
