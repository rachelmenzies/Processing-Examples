void setup(){
  size(300,300);
  Table table = loadTable("text.csv","header");
  float x, y;
  x=30; y=30;
  
  for (TableRow row : table.rows()) {
    String n = row.getString("name");
    text(n,x,y);
    y+=20;
  }

}


void draw(){
  
}


