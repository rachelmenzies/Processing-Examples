void setup()
{
  size(400,400);
  String words = "test bear cat dog test world hello world";
  //splits the String words based on spaces
  String[] list = split(words, ' ');
  // Writes the strings to a file, each on a separate line
  saveStrings("data.txt", list);
}

void draw()
{

}