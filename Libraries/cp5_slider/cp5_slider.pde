import controlP5.*;
ControlP5 cp5;

float initialBackground = 50;  // intial value for the slider
int slider1;                   // used to hold the value of "slider1"

void setup() {
  size(400, 600);
  cp5=new ControlP5(this);

  // create slider
  // slider has blue background colour, red active
  // you need an integer of the same name, i.e. "slider1"
  cp5.addSlider("slider1")                  
    .setPosition(100, 100)       
    .setSize(200, 19)
    .setRange(0,255)
    .setColorBackground(color(130,190,242))   // initial background colour 
    .setColorForeground(color(255, 0, 0))     // on hover colour
    .setColorActive(color(255,0,0))           // when pressed colour
    .setColorCaptionLabel(color(255, 0, 0))   // label text colour
    .setColorValueLabel(color(255, 0, 0))     // numbers text colour
    .setLabel("Set Background Colour")        // text for on button
    .setValue(initialBackground)              // set initial value
    ;
    
    // reposition the numbers to bottom left
    cp5.getController("slider1").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    
    // reposition the label to top left
    cp5.getController("slider1").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

}

// draw loop is used as normal
// cp5 controllers are drawn on top of everything else

void draw() {
  background(255);
  
  fill(slider1);
  stroke(slider1);
  rect(0,400,width,200);

}