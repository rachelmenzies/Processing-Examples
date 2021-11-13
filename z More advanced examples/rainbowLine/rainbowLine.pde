import java.util.*;

final static short maxRainbows = 02000;
final static Queue<Rainbow> rainbows = new ArrayDeque(maxRainbows);
 
boolean isFull;
short numRainbows;
color shades;
 
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
  frameRate(50);
  smooth();
  strokeWeight(16);
}
 
void draw() {
  background(360);
  shades = (shades+1) % 360;
  for (Rainbow bow: rainbows)   bow.display();
}
 
void keyPressed() {
  rainbows.clear();
  isFull = false;
  numRainbows = 0;
}
 
void mouseDragged() {
  if (isFull)                              rainbows.remove();
  else if (++numRainbows == maxRainbows)   isFull = true;
 
  rainbows.add( new Rainbow() );
 
  print(rainbows.size() + "\t");
}
 
final class Rainbow {
  final int x, y, px, py;
  final color colour;
 
  Rainbow() {
    x  = mouseX;
    y  = mouseY;
 
    px = pmouseX;
    py = pmouseY;
 
    colour = shades;
  }
 
  void display() {
    stroke( (shades+colour) % 360, 95, 100 );
    line(x, y, px, py);
  }
}
 
