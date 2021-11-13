
import processing.video.*;
Capture cam;
boolean video = true;            // default is to show video

void setup() {
  size(1280, 720);
  println("precam");
  String[] cameras = Capture.list();
  println("postcam");
  if (cameras.length == 0) {
    println("No cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an 
    // element from the array returned by list():

    cam = new Capture(this, cameras[0]);
    //cam = new Capture(this, 640, 360, "FaceTime HD Camera");
    cam.start();
  }
}

void draw() {

  // if video is to be played, get the frame from the camera
  // and display it as an image
  
  if (video==true) {
    if (cam.available() == true) {
      cam.read();
    }
    image(cam, 0, 0);
  }
  
  // otherwise, if the video is false, display the static image
  // do not need to read from camera any more
  else{
    fill(0);              // black background
    rect(0,0,width,75);
    
    fill(255);            // white text
    textAlign(CENTER);
    textSize(20);
    text("IMAGE CAPTURED",width/2,50);
  }
    


  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}



// function for when a key is pressed
// if space, set video to false
// then the draw function will stop streaming the frames and will leave the 
// current frame on the screen
void keyPressed(){
  if(key==' '){
    video = false;
    println("IMAGE CAPTURED");
  }
}
