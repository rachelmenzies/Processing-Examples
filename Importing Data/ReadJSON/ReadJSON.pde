import java.util.*; 

//JSON object
JSONArray values;
//Image object
PImage img;
//array which will hold the URL for each chart
String [] swellUrl;
//holds one chart url
String swellUrls;
int counter;

//A swell, in the context of an ocean, sea or lake, is a series of mechanical waves that propagate along the interface between water and air and so they are often referred to as surface gravity waves.

void setup() 
{
  size(600,600);
  
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  
  //lorne - 522
  //Costa-da-Caparica-Surf-Report - 874
  //Lunan - 39
  values = loadJSONArray("http://magicseaweed.com/api/mMrEbBtOF4h5vsaIB731iko77w0B41HW/forecast/?spot_id=39&fields=timestamp,charts.*,swell.maxBreakingHeight");
}

void draw()
{
  //loop through our charts if the counter is less than the number of charts
  if (counter < values.size()-1)
  {
    counter++;
    //get the JSON object at this position
    JSONObject temp = values.getJSONObject(counter); 
    //get the timestamp of this object
    int t = temp.getInt("timestamp");
    Date date = new Date(t*1000);
    println(date);
    //grab the charts object from this object
    JSONObject temps = temp.getJSONObject("charts");
    //grab the string for the swell chart and load this as an image
    img = loadImage(temps.getString("swell"));
    //draw the image
    image(img, 0, 0, width, height);
    
  }
  else
  {
    counter=0;
  }
}
