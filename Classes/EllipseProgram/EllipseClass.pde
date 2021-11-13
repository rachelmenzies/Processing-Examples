// definition of the Ellipse class
class Ellipse
{
  // define fields relevant to an Ellipse
  float x, y, width, height;
  color fillColor;
  
  // default constructor - initialise fields to default values
  Ellipse()
  {
    x = y = 100;
    width = 200;
    height = 40;
    fillColor = color(0, 113, 114);
  }
  
  // alternative constructor - initialise fields to values given as inputs
  Ellipse(float newX, float newY, float newWidth, float newHeight, color newFillColor)
  {
    x = newX;
    y = newY;
    width = newWidth;
    height = newHeight;
    fillColor = newFillColor;
  }
  
  // ## getters and setters for all of the fields in the class ##  
  float getX()
  {
    return x;
  }
  
  void setX(float newX)
  {
    x = newX;
  }
  
  float getY()
  {
    return y;
  }
  
  void setY(float newY)
  {
    y = newY;
  }
  
  float getwidth()
  {
    return width;
  }
  
  void setWidth(float newWidth)
  {
    width = newWidth;
  }
  
  float getHeight()
  {
    return height;
  }
  
  void setHeight(float newHeight)
  {
    height = newHeight;
  }
  
  color getFillColor()
  {
    return fillColor;
  }
  
  void setFillColor(color newFillColor)
  {
    fillColor = newFillColor;
  }
  
  // display the ellipse
  void display()
  {
    fill(fillColor);
    ellipse(x, y, width, height);
  }  
}
