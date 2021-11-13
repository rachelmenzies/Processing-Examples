XML xml; //xml object
int boxWidth = 250;
int boxHeight = 400;
XML[] titleXMLElements;
//http://open.live.bbc.co.uk/weather/feeds/en/2650752/3dayforecast.rss

void setup() 
{
  size(750,400);
  //load the xml from the BBC weather RSS feed
  xml = loadXML("https://weather-broker-cdn.api.bbci.co.uk/en/forecast/rss/3day/2650752");
  
  //fill our XML object array with descriptions from each item
  titleXMLElements = xml.getChildren("channel/item/description");  
  noLoop();
}

void draw()
{
  //loop through each item
  for (int i = 0; i < titleXMLElements.length; i++) 
  {
    //grab the title
    titleXMLElements = xml.getChildren("channel/item/title"); 
    
    //set a string to the content of the title tag
    String title = titleXMLElements[i].getContent();

    //grab the title
    titleXMLElements = xml.getChildren("channel/item/description"); 
    
    String[] data;
    
    //set a string to the content of the title tag
    String description = titleXMLElements[i].getContent();
    
    //split the descritpion string into individuals items based on commas
    data = split(description,',');

    //draw some boxes
    fill(255);
    rect(i*boxWidth, 0, boxWidth, boxHeight);
    fill(0);
    
    //draw the title
    text(title, i*boxWidth, 0, boxWidth, 100);
    
    //draw each item in our data array
    for(int j=0; j<data.length; j++)
    {
      text(data[j],i*boxWidth,25*j+100);
    }
    
    
  }   
  
}
