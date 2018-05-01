void setup() {
  size(350,350);
}

void draw(){
  if (mousePressed == true){
    if (mouseButton == RIGHT){
      background(#BC1E1E);
    } else {
      background(#1E7EBC);
    }
  }
}

void mouseMoved(){
  point(mouseX, mouseY);
}

void keyPressed(){  
  textSize(16);
  text(key,100,100);
  noLoop();
  
}