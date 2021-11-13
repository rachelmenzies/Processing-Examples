// *******************************************************
//                    CLASS: BRICK
// *******************************************************

class Brick{
  
 float xPos;
 float yPos;
 float width_of_brick;
 float height_of_brick;
 float speed;

 Brick(){
    xPos = random(width);
    yPos = random(height-200);
    width_of_brick = 30;
    height_of_brick = 30;
    speed = random(2,5);
    //println(speed);
    // add void brick - show using println to debug
 } 
  
  void display(){
    fill(100);
    noStroke();
    rect(xPos, yPos, width_of_brick, height_of_brick);
    
  }
  
  void move(){
    yPos = yPos + speed;
    if (yPos>height){
      yPos = 0;
      xPos = random(width);
    }
  }
  
  float get_brick_x(){ return xPos; }
  
  float get_brick_y(){ return yPos; }
  
  float get_brick_width(){ return width_of_brick; }
  
  float get_brick_height(){ return height_of_brick;}
}