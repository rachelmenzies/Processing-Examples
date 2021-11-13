import controlP5.*;
ControlP5 input;

String txt = "";
int num1 = 0;
int num2 = 0;
int final_num = 0;

void setup(){
  size(600,600);
  input = new ControlP5(this);
  
  input.addTextfield("number 1")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(createFont("arial",20))
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
   
  input.addTextfield("number 2")
     .setPosition(20,170)
     .setSize(200,40)
     .setFont(createFont("arial",20))
     .setColor(color(255,0,0))
     ;  
     
     
     
}



void draw(){
  
  background(0);
  fill(255);
  
  num1 = int(input.get(Textfield.class,"number 1").getText());
  num2 = int(input.get(Textfield.class,"number 2").getText());
  
  final_num = (num1 * num2);
  
  fill(0,0,255);
  textSize(30);
  text(final_num,350,200);
    
}
  