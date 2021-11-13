int x = 300;
int y = 400;
int d = 500;
int stripe = 30;


void setup(){
  size(600,600);
  background(255);
  noStroke();
  
  fill(237,45,45);            // R
  arc(x,y,d,d,PI,TWO_PI);
  
  d = d-stripe;
  fill(247,191,35);          // O
  arc(x,y,d,d,PI,TWO_PI);
  
  d = d-stripe;
  fill(250,250,10);          // Y
  arc(x,y,d,d,PI,TWO_PI);
  
  d = d-stripe;
  fill(19,206,60);          // G
  arc(x,y,d,d,PI,TWO_PI);
  
  d = d-stripe;
  fill(48,147,250);          // B
  arc(x,y,d,d,PI,TWO_PI);
  
  d = d-stripe;
  fill(145,48,250);          // I
  arc(x,y,d,d,PI,TWO_PI);
  
  d = d-stripe;
  fill(226,48,250);          // V
  arc(x,y,d,d,PI,TWO_PI);
  
  d = d-stripe;
  fill(255);          // White inset
  arc(x,y,d,d,PI,TWO_PI);
}


void draw(){
 
}