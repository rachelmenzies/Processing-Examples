// Loops
// Benjamin Gorman 2015
// Week 4 Tutorial

int angle = 5;

void setup()
{
  size(800,800);
  strokeWeight(5);
}

//goes on forever!
void draw()
{
   //center everything based on our sketch width/height
   translate(width/2, height/2);
   
   //rotate around 5 degrees center point of screen
   rotate(radians(angle = angle + 1));
   
   //fill a random colour
   stroke(random(255), random(255), random(255));
   
   //draw a line at the current loop, x position
   line(0,0,random(300),0);

   
}

void keyPressed(){
  
  //set background a random greyscale value
  background(random(255));
  
  // create a 360 degree example
  for(int d=0;d<360;d++){
     rotate(radians(d));
     stroke(random(255),random(255),random(255));
     line(0,0,width,0);
   }
   
   // return to executing draw function
}
