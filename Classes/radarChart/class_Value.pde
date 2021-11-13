class Value{
  
  float val;
  float x;
  float y;
  float w;
  float h;
  
  Value(float _val, float _x, float _y){
    val = _val;
    x = _x;
    y = _y;
    w = 8;
    h = 8;

  }
  
  void display(){
    fill(23,45,23);
    ellipse(x,y,w,h);
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  
  
}