BufferedReader reader;    // buffer the file input
ArrayList array_list;     // holds multiple circle objects
String line;              // each line of the file

void setup() {
  size(600, 600);

  reader = createReader("list.csv");  // use the file name
  // store file in data folder

    array_list = new ArrayList();       // new arrayList

    boolean done = false;               // the end of the array

  while (!done) {                       // while not reached the end
    try {
      line = reader.readLine();         // bring in a line from the file
    }
    catch(IOException e) {              // catch (error handling) allows program to fail gracefully
      line = null;
    }

    if (line == null) {                 // if no line has been brought in from the file
      done = true;                      // reached the end
    }
    else {          

      String[] pieces = split(line, ',');     // string array holds individual characters
      // split up with comma
      for (int i=0; i<pieces.length; i++) {     
        int temp = int(pieces[i]);            // convert from a character within the string to a number
        array_list.add(new Circle(temp));      // use the int as a parameter - add a new circle to the list
        println(pieces[i]);
      }
    }
  }
}

void draw() {
  for (int i=0; i<array_list.size();i++) {      
    Circle tempCircle = (Circle)array_list.get(i);  // get the object from the array as a circle
    tempCircle.display();                          // display the object
  }
}


class Circle {

  float x;
  float y;
  float w;
  float h;

  Circle(float t_x) {
    x = t_x;            // the x value comes from the file and is passed into the constructor
    y = 100;
    w = 50;
    h = 50;
  }

  void display() {
    ellipse(x, y, w, h);
  }
}

