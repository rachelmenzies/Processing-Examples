
// http://www.szynalski.com/tone-generator/
// generate tones with this to see the sketch indicate different pitches in the spectrum

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int w;  
int threshold = 9;

void setup(){
  size(648,488);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,512);
  fft = new FFT(in.bufferSize(),in.sampleRate());
  fft.logAverages(60,7);  //
  stroke(255);
  strokeCap(SQUARE);
  
  // divide width of sketch by number of bands in the sketch
  // this is width of line
  w = width/fft.avgSize();
  strokeWeight(w);
}

void draw(){
  background(0);
  
  // get values from fft
  fft.forward(in.mix);
  
  // move through the bands in the spectrum
  // you can make a decision - if value is above a set value - do something
  // you can change the start value (for i) if you only want higher pitch sounds
  
  for(int i=0; i<fft.avgSize(); i++){
    
    //println(fft.getBand(i));
    if(fft.getBand(i) > threshold){          // if a value is above 9
      background(255,0,0);          // flash red background
      //println("********" + i);
    }
    
    // draw line from bottom of sketch
    // use i*w to set the beginning of first line at left of screen 
    //(stroke increases to left and right)
                                                  
    line(i*w+w/2,height, i*w+w/2,height-fft.getAvg(i)*8); 
    
  }
  // end for loop
  
}