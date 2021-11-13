// online at https://www.openprocessing.org/sketch/452041

int w;
int h;
int x;
int y;
int text_x;
int text_y;
color red = color(240,145,153);
color green = color(145,240,190);
boolean top = false;
boolean left = false;
boolean bottom = false;
boolean right = false;

String condition = "FALSE";


void setup(){
  size(600,600);
  w = 175;
  h = 50;
  x = width/2 - w/2;
  y = height/2 - h/2;
  background(255);
}

void draw(){
  background(255);
  
  
  
  // set if each side is true
  if(mouseX > x){      // left
    left = true;
  }
  else{
    left = false;
  }
  
  if(mouseX < x+w){    // right
    right = true;
  }
  else{
    right = false;
  }
  
  if(mouseY > y){      // top
    top = true;
  }
  else{
    top = false;
  }
  
  if(mouseY < y+h){      // bottom
    bottom = true;
  }
  else{
    bottom = false;
  }
  
  
  
  
  
  
  
  // DRAW RECTANGLES WITH TEXT AROUND BUTTON
  // draw all green then replace with red as necessary
  
  // ----- draw all the "true" rectangles -----
  
  stroke(green);        
  fill(green);
  rect(0,0,x,height);              // left
  rect(x+w,0,width-(x+w),height);  // right
  rect(0,0,width,y);               // top
  rect(0,y+h,width,width-(y+h));   // bottom
  
  
  // ----- left side ------
  
  if(left == false){
    stroke(red);
    fill(red);
    rect(0,0,x,height);
  }
 
  text_x = 100;
  fill(0);
  text("mouseX:" + mouseX + " rectangle x:" + x, text_x,width/2+5);
  text("mouseX > x", text_x,width/2+35);
  text(mouseX + " > " + x, text_x, width/2+50);
  if(mouseX>x){condition = "TRUE";} else {condition = "FALSE";}
  text(condition, text_x,width/2+65);
  
  // ----- right side ------
  
  if(right == false){
    stroke(red);
    fill(red);
    rect(x+w,0,width-(x+w),height);
  }
  
  text_x = 500;
  fill(0);
  int temp = x+w;
  text("mouseX:" + mouseX + " rectangle x+w:" + temp, text_x,width/2+5);
  text("mouseX < x + w", text_x,width/2+35);
  text(mouseX + " < " + temp, text_x, width/2+50);
  if(mouseX<x+w){condition = "TRUE";} else {condition = "FALSE";}
  text(condition, text_x,width/2+65);
  
  // ----- top side ------
  
  if(top == false){
    stroke(red);
    fill(red);
    rect(0,0,width,y);
  }
  
  text_x = width/2;
  text_y = 180;
  fill(0);
  text("mouseY:" + mouseY + " rectangle y:" + y, text_x,text_y);
  text("mouseY > y", text_x,text_y+30);
  text(mouseY + " > " + y, text_x, text_y+45);
  if(mouseY>y){condition = "TRUE";} else {condition = "FALSE";}
  text(condition, text_x,text_y+60);
  
  // ----- bottom side ------
  
  if(bottom == false){
    stroke(red);
    fill(red);
    rect(0,y+h,width,width-(y+h));
  }
  
  text_x = width/2;
  text_y = 400;
  fill(0);
  temp = y+h;
  text("mouseY:" + mouseY + " rectangle y+h:" + temp, text_x,text_y);
  text("mouseY < y+h", text_x,text_y+30);
  text(mouseY + " < " + temp, text_x, text_y+45);
  if(mouseY<temp){condition = "TRUE";} else {condition = "FALSE";}
  text(condition, text_x,text_y+60);
  
  
  // DRAW RECTANGLE BUTTON
  stroke(0);              
  fill(124,192,245);        
  rect(x,y,w,h);
  fill(0);
  textAlign(CENTER);
  text("x:"+x+" y:"+y+" w:"+w+" h:"+h , width/2,height/2+5);
  
  
}


  
  