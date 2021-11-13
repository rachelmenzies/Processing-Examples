

int no_of_moles = 4;
Mole[] moles = new Mole[no_of_moles];

int score = 0;

void setup(){
  size(600,600);
  
  for(int i=0; i<no_of_moles; i++){
    int tempX = ((width/4)*i+1)+(width/4)/2;
    moles[i] = new Mole(tempX,400); 
  }
  moles[int(random(0,4))].setLit();
}


void draw(){
  background(100);
  for(int i=0; i<no_of_moles; i++){
   moles[i].display();
   }
   printScore();
}


void mousePressed(){
  for(int i=0; i<no_of_moles; i++){
    if(moles[i].click(mouseX, mouseY) == true){
      addScore();
      moles[int(random(0,4))].setLit();
    }
  }
}


void printScore(){
  fill(255);
  text(score,200,200);
}

void addScore(){
  score++;
}