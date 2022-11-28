// credit to https://openprocessing.org/user/318194

void setup() {
  size(600, 500);
  background(0, 155, 155);
}


void draw() {

  strokeWeight(5);
  stroke(0);
  fill(255, 0, 0);
  rect(100, 300, 400, 200);


  fill(120, 2, 0);
  rect(150, 120, 75, 150);
  
  fill(0);
  triangle(80, 300, 520, 300, 300, 100);
  
  fill(255);
  rect(150, 350, 75, 75);
  line(187, 350, 187, 425);
  line(150, 387, 225, 387);
  
  fill(120);
  rect(350, 330, 80, 170);
  
  fill(240, 255, 20);
  noStroke();
  ellipse(365, 420, 10, 10);
}
