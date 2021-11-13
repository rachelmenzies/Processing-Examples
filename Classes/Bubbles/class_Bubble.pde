/*************************************
  CLASS BUBBLES
*************************************/

class Bubble{
  
  float x, y, diameter;
  float radius;
  float new_x, new_y;
  int id;
  
  Bubble(float _x, float _y, int _id){
    x = _x;
    y = _y;
    diameter = random(50,150);
    noStroke();
    fill(255,204);
    println("test");
    new_x = random(width);
    new_y = random(height);
    radius = diameter/2;
  }
  
  void run(){
    move();
    display();
  }
  
  void display(){
    ellipse(x, y, diameter, diameter);
  }
  
  void move(){
    if(new_x == x || new_y == y){
      x = new_x;
      new_x = random(width);
      y = new_y;
      new_y = random(height);
    }
    
    // move bubbles
      if(x > new_x){
        x--;
      }
      if(new_x > x){
        x++;
      }
      if(y > new_y){
        y--;
      }
      if(new_y > y){
        y++;
      }
      
      // if they reach new position before being clicked
      if(x == new_x){
        new_x = random(width);
      }
      if(y == new_y){
        new_y = random(height);
      }

  }
  
  
  
  boolean click(){
   
    // Use Pythagorus Theorum to check the distance from 
    // mouse pointer to centre of the circle
    float dist = (mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y);
    dist = sqrt(dist);
  
    // if clicked on a button
    if (dist < radius){
      return true;
    }
    else{
      return false;
    }
    
    //display();
    
  }
  
 // void resetButton(int _id){
    
  
  
  
}
