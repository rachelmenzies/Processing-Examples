int no_of_bubbles = 6;
Bubble[] bubbles = new Bubble[no_of_bubbles];

void setup(){
  size(displayWidth, displayHeight);
  for(int i=0; i<no_of_bubbles; i++){
    bubbles[i] = new Bubble(random(width), random(height), i);
    println(i);
  }
}

void draw(){
  background(0);
  for(int i=0; i<no_of_bubbles; i++){
    bubbles[i].run();
  }
}


void mousePressed(){
  for(int i = 0; i < no_of_bubbles; i++){
    bubbles[i].click();
  }
}

