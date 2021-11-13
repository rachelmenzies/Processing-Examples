import processing.serial.*;

Serial port;
int val;

void setup(){
  size(600,600);
  
   println(Serial.list());
  
  // get [x] from printed list, set to 9600 to match Arduino
  port = new Serial(this, Serial.list()[1], 9600);
  
  // keep data from serial until a new line
  // once the new line arrives, program will be something with the data
  port.bufferUntil('\n');
  
}

void draw(){
  background(val);
  
  if(port.available() > 0){
    val = port.read();
    println(val);
  }
  else{
   // println("no port available");
  }
  

  
  
  
}