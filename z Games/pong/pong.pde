// ball
int xBall;
int yBall;
int xSpeed;
int ySpeed;

// position of paddles
int xPaddle;
int yPaddle;

// use to prevent paddles going off screen
boolean left_OK;
boolean right_OK;

// scrores
int bounceCount;

// everything in here happens once at runtime
void setup(){
  
  size(800,500);
  background(255);
  
  bounceCount = 0;
  
  // set ball position
  xBall = width/2;
  yBall = 100;
  
  // set paddle position
  // 30 pixels from bottom and centre horizontally
  xPaddle = width/2-30;  
  yPaddle = height-40;  

  // set paddle boundaries
  left_OK = true;
  right_OK = true;
  
  // ball movement
  xSpeed = 3;
  ySpeed = 3;
  
 
}

// everything in here happens whenever the screen is 
// updated by the operating system
void draw(){
 
 // include in draw function cover up old rect when moved
 background(255);
 smooth();
 
 // draw ball
 fill(0);
 xBall = xBall + xSpeed;
 yBall = yBall + ySpeed;
 ellipse(xBall, yBall, 50, 50);
 
 // draw paddle
 rect(xPaddle, yPaddle, 60, 10);
 
 screenBoundaryPaddle();
 screenBoundaryBall();  
 movePaddle();
 paddleBounce();
 resetScreenBoundary();
 
 textSize(40);
 text("hits: "+bounceCount, 10, 50);

}


// does not let paddle move off the screen
// holds it as left and right boundaries
void screenBoundaryPaddle(){
 if(keyPressed){
  if(keyCode == LEFT && xPaddle > 0){
    xPaddle = xPaddle - 5;
  }
  if(xPaddle <= 0)
  {
    left_OK = false;
  }
  if(keyCode == RIGHT && xPaddle+60 < width){
    xPaddle = xPaddle + 5;
  } 
  if(xPaddle+60 >= width){
    right_OK = false;
  }
 }  
}


// check if the ball goes outside the screen boundary
// bounce back into play unless out the bottom of screen
void screenBoundaryBall(){
 if (yBall-25<=0){          
   ySpeed =- ySpeed;  // reset to zero when ball hits top
 }
 if (xBall-25<=0){          
   xSpeed =- xSpeed;  // reset to zero when ball hits left
 } 
 if (xBall+25>=width){          
   xSpeed =- xSpeed;  // reset to zero when ball hits right
 } 
 if (yBall+25>=height){
   // remove a life
 }
}


// move the paddle left and right
void movePaddle(){
 if(keyPressed){
  if(keyCode == LEFT && left_OK == true){
    xPaddle = xPaddle - 5;
  }
  if(keyCode == RIGHT && right_OK == true){
    xPaddle = xPaddle + 5;
  }
 }   
}



 // check if the ball is in range, bounce off paddle// bounce off paddle
 // below paddle and within x co-ordinate range
void paddleBounce(){
 if (yBall+25 >= yPaddle && (xBall >= xPaddle && xBall <= xPaddle+60)){
  ySpeed =- ySpeed;
  bounceCount = bounceCount + 1;
 } 
}


// reset screen boundary for next draw execute
void resetScreenBoundary(){
 left_OK = true;
 right_OK = true; 
}

