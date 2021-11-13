int sketch_width = 800;
int sketch_height = 600;

Team[] teams = new Team[8];
Table temp;

color green = color(19,167,44);
color grey = color(200);
color white = color(255);
color blue = color(48,55,160);

int display_x = 600;
int display_y = 0;
int display_w = 200;
int display_h = sketch_height;

PImage cup;
int cup_x = 450;
int cup_y = 20;


// 
// setup - executes once
// used for inital setup of the variables and objects of type Team
//

void setup() {

  size(800, 600);
  cup = loadImage("cup.png");
  
  // go through the .csv file
  // inport as a table
  // use the data to create instances of Team and put them into array

  String name, place, manager, flagFile, managerFile;
  int ranking;
  int i = 0;
  temp = loadTable("last16.csv", "header");
  for (TableRow row : temp.rows()) {
    name = row.getString("name");
    manager = row.getString("manager");
    ranking = int(row.getString("ranking"));
    flagFile = row.getString("flag");
    managerFile = row.getString("managerPhoto");
    teams[i] = new Team(name, manager, ranking, flagFile, managerFile);
    i++;
  }

  // add the x and y co-ordinates for each team
  // I know where each team is in the array based on the csv file
  addPositions();


}


// 
// draw - executes over and over
//

void draw() {
  
  background(white);
  
   // right side area that displays further info
  fill(grey);
  noStroke();
  rect(display_x, display_y,display_w,display_h);
  
  // display the score for the final game
  textSize(30);
  fill(green);
  text("1",445,290);  
  text("0",445,340);
  
  // display the image of the world cup next to Germany
  image(cup,cup_x,cup_y);
  
  //display the lines that link up the counties
  displayLines();
   
  // display the teams
  for (int i=0; i<teams.length; i++) {
    teams[i].display();
    teams[i].displayMoreInfo();
  }
  
  
 
  
}


//
// every time the mouse is pressed use the onHover function to check if pressed on a team
// if on a team (onMousePressed returns true) then select that team as current display team
// then go through teams array and set the appropriate team's setDisplay as true
// this is used in the displayMoreInfo() function in draw()
//

void mousePressed(){
  int team_to_be_displayed=0;
  
  for (int i=0; i<teams.length; i++) {
    if(teams[i].onMousePressed() == true){
      team_to_be_displayed = i;
    }
  }
  for (int i=0; i<teams.length; i++) {
    if(team_to_be_displayed == i){
      teams[i].setDisplay(true);
    }
    else{
      teams[i].setDisplay(false);
    }
  }
  
}



//
// Add the x and y positions as an arraylist for each team
// This is done manually isntead of using a file input
// Ideally the x and y positions would be calculated somehow but this is ok
//

void addPositions() {

  ArrayList xPos = new ArrayList();
  ArrayList yPos = new ArrayList();

  // Germany
  //xPos.add(475); yPos.add(275);  // winner
  xPos.add(325); yPos.add(250);  // final
  xPos.add(175); yPos.add(160);  // semi
  xPos.add(25); yPos.add(180);   // quarter
  teams[0].setX(xPos);
  teams[0].setY(yPos);
  
  // Argentina
  xPos = new ArrayList();
  yPos = new ArrayList();
  xPos.add(325); yPos.add(300);  // final
  xPos.add(175); yPos.add(390);  // semi
  xPos.add(25); yPos.add(320);   // quarter
  teams[1].setX(xPos);
  teams[1].setY(yPos);
 
  // France
  xPos = new ArrayList();
  yPos = new ArrayList();
  xPos.add(175); yPos.add(110);  // semi
  xPos.add(25); yPos.add(40);    // quarter
  teams[2].setX(xPos);
  teams[2].setY(yPos);
  
  // Belgium
  xPos = new ArrayList();
  yPos = new ArrayList();
  xPos.add(175); yPos.add(440);  // semi
  xPos.add(25); yPos.add(460);   // quarter
  teams[3].setX(xPos);
  teams[3].setY(yPos);
  
  // Nigeria
  xPos = new ArrayList();
  yPos = new ArrayList();
  xPos.add(25); yPos.add(90);  // quarter
  teams[4].setX(xPos);
  teams[4].setY(yPos);
  
  // Algeria
  xPos = new ArrayList();
  yPos = new ArrayList();
  xPos.add(25); yPos.add(230);  // quarter
  teams[5].setX(xPos);
  teams[5].setY(yPos);
  
  // Switzerland
  xPos = new ArrayList();
  yPos = new ArrayList();
  xPos.add(25); yPos.add(370);  // quarter
  teams[6].setX(xPos);
  teams[6].setY(yPos);
  
  // USA
  xPos = new ArrayList();
  yPos = new ArrayList();
  xPos.add(25); yPos.add(510);  // quarter
  teams[7].setX(xPos);
  teams[7].setY(yPos);
}



// 
// displays the lines between each round to show where the winners progress to
// manually drawn because there is no model of how teams move to the next round in the code.
//

void displayLines(){
  
  stroke(grey);
  
  // quarters to semis
  
  line(130,40,130,140);
  line(130,90,170,135);
  line(130,180,130,280);
  line(130,230,170,185);
  line(130,320,130,420);
  line(130,370,170,415);
  line(130,460,130,560);
  line(130,510,170,465);
  
  // semis to final
  
  line(280,110,280,210);
  line(280,160,320,275);
  line(280,390,280,490);
  line(280,440,320,325);
}