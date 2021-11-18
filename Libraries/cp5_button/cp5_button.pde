import controlP5.*;
ControlP5 cp5;
float bg = random(255);
int scene = 1;

void setup() {
  size(400, 600);
  cp5=new ControlP5(this);

  // button is pink when not in use
  // button is red when mouse is over it
  // button is white when pressed (active)
  cp5.addButton("btn1")                  
    .setPosition(100, 100)       
    .setSize(200, 19)
    .setColorBackground(color(255,50,135))  // initial background colour 
    .setColorForeground(color(255, 0, 0))   // on hover colour
    .setColorActive(color(255,255,255))     // when pressed colour
    .setColorCaptionLabel(color(0, 0, 0))   // text colour
    .setLabel("Set Scene 1")                // text for on button
    ;
    

  cp5.addButton("btn2")                  
    .setPosition(100, 300)       
    .setSize(200, 19)
    .setColorBackground(color(255,50,135))  
    .setColorForeground(color(255, 0, 0))   
    .setColorActive(color(255,255,255))     
    .setColorCaptionLabel(color(0, 0, 0))   
    .setLabel("Set Scene 2")
    ;
}

// draw loop is used as normal
// cp5 controllers are drawn on top of everything else

void draw() {
  background(bg);
  
  // Do this when btn1 is pressed
  // scene was initialised as 1 so this is default 
  // will appear when sketch is first loaded
  if(scene==1){
    fill(0);
    rect(120,120,160,80);
    fill(255);
    textSize(15);
    text("THIS IS SCENE 1",140,140);
  }
  
  // Do this when btn2 is pressed and scene is set to 2
  if(scene==2){
    fill(0);
    rect(120,320,160,80);
    fill(255);
    textSize(15);
    text("THIS IS SCENE 2",140,360);
  }

}

// Function for when btn1 is pressed
// Same function name as name defined when you created it
// Set global variable bg when it is activated
// bg is used in draw function to set background colour
// set scene number
// scene number is used to select what to draw within draw function

public void btn1() {  
  //println("pressed " + millis());
  bg = random(255);
  scene = 1;
}

public void btn2() {  
  //println("pressed " + millis());
  bg = random(255);
  scene = 2;
}

// Function for all buttons
// Passes the 'event' (you clicked on something) to the function
// uses information in that event to get the controller you clicked on
// from that, it gets the name of the controller

public void controlEvent(ControlEvent theEvent) {  
  println(theEvent.getController().getName() + " " + scene);
}