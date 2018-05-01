Spot sp1;

void setup(){
  size(200,200);
  sp1 = new Spot(75,80,15,2);
}

void draw(){
  background(255);
  sp1.display();
  sp1.move();
}