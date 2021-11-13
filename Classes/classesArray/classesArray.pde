// main screen
Car mycar;
Car yourcar;

int numbers[] = {
  1, 2, 3, 4, 5
};
Car[] cars = new Car[3];

void setup() {
  size(600, 600);

  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car();
    cars[i].setColor(color(random(255),random(255),random(255)));
  }
}

void draw() {
  background(255);
  
  for (int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }

}


void keyPressed(){
  cars[0].setSpeed(random(0,10));
}