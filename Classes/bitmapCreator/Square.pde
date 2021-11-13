class Square{
  
 float x, y, w, h;    // used to draw the square
 boolean isFilled;                            
 
 Square(float _x, float _y, float _w, float _h){
   x = _x;
   y = _y;
   w = _w;
   h = _h;
   isFilled = false;       // default value, use later to check if square is empty
 }
 
 // display the square
 // use different fill colour - depends on isFilled
 void display(){
   if(isFilled==true){
     fill(0);
   }
   else{
     fill(255);
   }
   rect(x, y, w, h);
   
 }
 
 // called on mouse click
 // change state of isFilled
 void click(float m_X, float m_Y){
   
   float mX = m_X;
   float mY = m_Y;
   
   // only do this if the mouse has clicked in a square
   if(mX > x && mX < x + w &&
      mY > y && mY < y + h){
      
      if(isFilled==true){
        isFilled=false;
      }
      else{
        isFilled=true;
      }
    }   
 }

 



}