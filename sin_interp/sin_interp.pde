float x=1000;
float y=1000;

void setup(){
  size(500,500);
}

void draw(){
  background(200);
  
  fill(230,0,0);
  ellipse(100+sin(x),100,50,50);
  
  //phase
  //ellipses(100+sin(y)*50, 160,50,50);
  
  //circle
  //ellipse(200+sin(x)*50,400+cos(x)*50,50,50);
  
  x+=PI/16;
  y+=PI/32;
  
}