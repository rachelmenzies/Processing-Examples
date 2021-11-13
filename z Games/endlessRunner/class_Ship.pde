// *******************************************************
//                    CLASS: SHIP
// *******************************************************

class Ship{
  
  float xPos;
  float yPos;
  int width_of_ship;
  
  Ship(){
    width_of_ship = 40;
    xPos = width/2;
    yPos = height - (width_of_ship) - 10;
    
    //println("created ship");
   
  }
  
  void displayShip(){
    //stroke(255,0,0);
    //strokeWeight(width_of_ship);
    fill(255,0,0);
    xPos = mouseX-(width_of_ship/2);
    rect(xPos, yPos, width_of_ship, width_of_ship);
    //point(mouseX, yPos);
    //println(radius);
  }
    
  float get_ship_x(){ return xPos; }
  
  float get_ship_y(){ return yPos; }
  
  float get_ship_width(){ return width_of_ship; }
}