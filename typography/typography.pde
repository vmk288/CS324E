//String[] fontlist = PFont.list();
//printArray(fontlist);

PFont Papyrus;
void setup(){
  size(500,500);
  Papyrus=createFont("Papyrus",64);
  textFont(Papyrus);
}

void draw(){
  text("Hello",100,100);
}