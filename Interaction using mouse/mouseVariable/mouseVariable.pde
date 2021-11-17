void setup(){
  size(600,600);
  background(255);
}

void draw(){

  strokeWeight(10);
  stroke(random(255),random(255),random(255));
  line(0,0,mouseX,mouseY);
  save("myImg.png"); 
  
}