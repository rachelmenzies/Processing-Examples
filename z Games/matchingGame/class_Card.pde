class Card {

  // -------------------------------------------------
  // Variables
  // -------------------------------------------------

  int id;
  int x;
  int y;
  int w;
  int h;
  color borderColor;
  int borderWeight;
  int value;
  Boolean faceUp;   // determines whether you can see the card face
  Boolean complete;  // determines whether you have already selected the card
  PImage img;

  // -------------------------------------------------
  // Constructor
  // -------------------------------------------------
  
  Card(int _id, int _x, int _y, int _v) {
    id = _id;
    x = _x;
    y = _y;
    w = 180;
    h = 280;
    value = _v;
    faceUp = false;
    complete = false;
    if(value==1){
      img = loadImage("Images/Oor-Classic.png");
    }
    else if(value==2){
      img = loadImage("Images/Scrub-Wullie.png");
    }
    else if(value==3){
      img = loadImage("Images/Full-O-Beans.png");
    }
  }
  
  // -------------------------------------------------
  // display based on face up / face down / complete
  // -------------------------------------------------

  void display() {
    

    // face down - red
    if (!faceUp) {
      stroke(color(255, 0, 0));
      strokeWeight(3);
      fill(100);
      rect(x, y, w, h);
      fill(255);
      textSize(20);
      //text(value+" Face Down", textX, textY);
    }

    // face up - blue
    if (faceUp) {
      stroke(color(0, 0, 255));
      strokeWeight(8);
      fill(100);
      rect(x, y, w, h);
      image(img,x,y);   
      //fill(255);
      //textSize(40);
      //text(value, textX, textY);
    }

    // face up and matched
    if (complete) {
      stroke(color(0, 0, 255));
      strokeWeight(8);
      fill(100);
      rect(x, y, w, h);
      image(img,x,y);  
    }
  }

  // -------------------------------------------------
  // check whether click happened inside a card
  // -------------------------------------------------
  
  Boolean isClicked() {
    if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h && !faceUp) {
      return(true);
    } else {
      return false;
    }
  }


  // -------------------------------------------------
  // GET functions
  // -------------------------------------------------
  
  int getValue() {
    return value;
  }

  int getID() {
    return id;
  }
  
  Boolean getComplete() {
    return complete;
  }


  // -------------------------------------------------
  // SET functions
  // -------------------------------------------------
  
  void setFaceUp() {
    faceUp = true;
  }
  void setFaceDown() {
    faceUp = false;
  }
  void setComplete() {
    complete = true;
  }
}
