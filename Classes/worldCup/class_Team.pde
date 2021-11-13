class Team{
  
  // 
  // VARIABLES
  //
  
  PImage imgFlag;
  PImage imgManager;
  ArrayList x;
  ArrayList y;
  int w;
  int h;
  String name;
  String manager;
  int ranking;
  boolean displayMore;
  
  // 
  // CONSTRUCTOR
  //
  
  // width and height are set for each one at this point
  // no need for this to be defined in the main program as all are the same size
  
  Team(String n, String m, int r, String img, String img2){
    x = new ArrayList();
    y = new ArrayList();
    w = 100;
    h = 50;
    name = n;
    manager = m;
    ranking = r;
    imgFlag = loadImage(img);
    imgManager = loadImage(img2);
    displayMore = false;
  }
  
  
  //
  // METHODS
  //
  
  // go through each of the x and y values for this object 
  // for each one, draw a rectangle and overlay the name of the team as text
  
  void display(){
    for(int i=0; i<x.size(); i++){
      fill(white);
      stroke(blue);
      rect((Integer)x.get(i),(Integer)y.get(i),w,h);
      fill(blue);
      textAlign(LEFT);
      textSize(12);
      text(name, (Integer)x.get(i)+20, (Integer)y.get(i)+30);
    }
  }
  
  // check each location of the team using the ArrayList
  // if the mouse has been pressed on that display of the team then return true to the main program
  // this is then used to set the boolean displayMore to decide what country is shown on the right
  
  boolean onMousePressed(){
    int xPos;
    int yPos;
    boolean bool = false;
    
    for(int i=0; i<x.size(); i++){
      xPos = (Integer)x.get(i);
      yPos = (Integer)y.get(i);
      if(mouseX>xPos && mouseX<xPos+w && mouseY>yPos && mouseY<yPos+h){
        return true;
      }
      else{
        bool =  false;
      }
    }
    return bool;
  }
  
 
  // if the displayMoreInfo boolean is true then display further info on right hand side
  // display a flag, manager name and image, and FIFA ranking during world cup
  
  void displayMoreInfo(){
    
    if(displayMore == true){
      fill(0);
      noStroke();
      rect(627,25,3,130);       // flag pole
      ellipse(628,25,10,5);     // flag pole
      rect(629,29,137,92);      // flag border
      image(imgFlag,630,30);    // flag image
      textAlign(CENTER);
      text("Manager", 700,180);
      text(manager,700,210);      // manager name
      rect(638,248,124,174);
      image(imgManager,640,250);  // manager image
      text("FIFA World Ranking",700,470);
      text("5th june 2014",700,500);
      textSize(40);
      text(ranking,700,550);        // ranking during world cup
    }
    
  }
  
  
  // 
  // SET METHODS
  //
  void setX(ArrayList xPosition){
    x = xPosition;
  }
  
  void setY(ArrayList yPosition){
    y = yPosition;
  }
  
   void setDisplay(boolean bool){
    displayMore = bool;
  }
  
}
