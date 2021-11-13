class Mole{
  
  // button
  int x_button;
  int y_button;
  int w_button;
  int h_button;
  
  // led
  int x_led;
  int y_led;
  
  boolean isLit;
    
  Mole(int x1, int y1){
    w_button = 50;
    h_button = 50;
    x_button = x1-(w_button/2);
    y_button = y1-(h_button/2);
    
    isLit = false;
  }
  
  void display(){
    if(isLit){
      fill(250,222,83);
    }
    else{
      fill(255);
    }
    rect(x_button,y_button,w_button,h_button);
  }
  
  boolean click(int xPos,int yPos){
    
    if(xPos > x_button && xPos < x_button + w_button &&
      yPos > y_button && yPos < y_button + h_button){
        if(isLit){
          isLit = false;
          fill(255);
        }
        return true;
      }
     else{return false;}
    
  }
  
  
  void setLit(){
    isLit = true;
  }
  
  boolean getLit(){
    return isLit;
  }
  
  
}
