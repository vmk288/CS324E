Spot s1;
ColoredSpot s2;

void setup(){
  PVector p = new PVector(30,20);
  s1 = new Spot(0,0,50,p);
  s2 = new ColoredSpot(50,50,50,p,color(200,30,100));
  
}

void draw(){
  s1.display();
  s2.display();
}