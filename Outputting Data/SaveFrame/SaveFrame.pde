// Rachel Menzies
// Click the mouse to save the frame as an image

void setup(){
  
  size(600,600);
  
  // day
  color daySky = color(81,217,250);
  color sun = color(251,251,28);
  int sunDiameter = 100;
  int sunX = width/4;
  int sunY = 200;
  int sunLineWeight = 20;
  int sunLineRadius = 85;
  int eyeDiameter = 10;
  
  // night
  color nightSky = color(29,5,103);
  color star = color(255);
  int num_stars = 150;
  
  // borders
  int border = 10;  // width of border
  
  
  // *******************
  //      Day
  // *******************
 
  noStroke();
  fill(daySky);
  rect(0,0,width/2, height);

  // lines behind main sun
  // for 45 degree lines, adjust the radius to avoid square shape
  stroke(sun);
  strokeWeight(sunLineWeight);
  line(sunX,sunY-sunLineRadius,sunX,sunY+sunLineRadius);
  line(sunX-sunLineRadius,sunY,sunX+sunLineRadius,sunY);
  sunLineRadius = sunLineRadius-23;
  line(sunX-sunLineRadius,sunY-sunLineRadius,sunX+sunLineRadius,sunY+sunLineRadius);
  line(sunX-sunLineRadius,sunY+sunLineRadius,sunX+sunLineRadius,sunY-sunLineRadius);
  
  // draw sun on top of lines
  fill(sun);
  ellipse(sunX,sunY,sunDiameter,sunDiameter);
  
  // face - position around sunX and sunY
  noStroke();
  fill(0);
  ellipse(sunX-15,sunY-15,eyeDiameter, eyeDiameter);
  ellipse(sunX+15,sunY-15,eyeDiameter, eyeDiameter);
  arc(sunX, sunY+10,45,35,0,PI); 
  
  // *******************
  //      Night
  // *******************
  
  noStroke();
  fill(nightSky);
  rect(width/2,0,width, height);
  
  // stars - draw points at random positions within square
  strokeWeight(2);
  stroke(star);
  for(int i=0; i<num_stars; i++){
    point(random(width/2,width),random(0,height));
  }
  
  // *******************
  //      Borders
  // *******************
  
  noStroke();
  fill(0);
  
  // divider
  rect(width/2-border/2,0,border,height);
  
  // border - top, right, bottom, left
  rect(0,0,width,border);
  rect(width-border,0,border,height);
  rect(0,height-border,width,border);
  rect(0,0,border,height);
  
}

// use draw() to make mouseClicked work
void draw(){}
