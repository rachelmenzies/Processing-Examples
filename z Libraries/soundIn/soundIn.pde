// Rachel Menzies
// Day 9 Heartbeat
// Audio input
// Based on http://learningprocessing.com/examples/chp20/example-20-09-mic-input

import processing.sound.*;

AudioIn input;
Amplitude analyzer;

float x;
float y;    
float w;
float h;  // ellipse position, set from audio input
color red = color(255,0,0);
PImage heart;


void setup(){
  size(600,600);
  x = width/2;
  y = height/2;
  
  imageMode(CENTER);
  
  // create input from first channel
  // you can change 0 to other channels
  input = new AudioIn(this, 0);
  
  // create new amplitude analyser
  analyzer = new Amplitude(this);  

  // start input from AudioIn and use it in amplitude analyser
  input.start();
  analyzer.input(input);
}


void draw(){
  background(255);
  float vol = analyzer.analyze();  // get volume (between 0 and 1.0)
  
  // re-map number from 0-1 to 200-400
  // smallest width is 200, largest is 400
  w = map(vol,0,1,200,400);
  h = w*0.75;  // set height based on width
  
  // re-load the image each time so that the size calculation is done on original size 
  heart=loadImage("heart.png");
  
  // re-size based on new w and h
  // w and h must be int
  heart.resize(int(w),int(h));

  // draw on screen
  image(heart,x,y);
}
