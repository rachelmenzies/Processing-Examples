ArrayList<String> myAL = new ArrayList();

void setup(){
  
  size (400, 400);
  
  // add Strings to the array
  myAL.add("Hello");
  myAL.add("World");
  
  textSize(40);
  // use text.size() instead of array.length
  // use text.get(i) instead of array[i]
  for(int i=0; i<myAL.size(); i++){
    text(myAL.get(i), 50, i*50+50);        
  }
  
}
