import processing.sound.*; 
SoundFile file;

int startValue = 0;  // used to set the time to start the sound & show image
PImage photo;        

void setup() {
  size(509, 339);
  background(0);
  
  // set a random start value based on the no of frames
  // random gives a float value so cast as int
  startValue = int(random(150,300));
 
  // image of ghost, store in data folder
  // ensure size of window matches photo size
  photo = loadImage("ghostImage.jpeg");
}      


void draw() {
  
  // only start sound when the random time has passed
  // frameCount is built in variable the counts how many times draw has run
  if(frameCount==startValue){
    file = new SoundFile(this,"ghostvoice.mp3");  // store in data folder
    file.play();
  }
  
  // only show the image and credits once the sound starts
  if(frameCount>startValue){
    image(photo,0,0);
    stroke(255,0);
    text("Creator: helfman, Credit: Getty Images/iStockphoto", 100,300);
  }
  
  // once the sound has played stop the loop running
  // +250 gives time for sound
  // stopping the loop as no longer needed - would just keep redrawing photo and text
  if(frameCount > startValue+250){
    noLoop();
  }
  
  println(frameCount);
  
}
