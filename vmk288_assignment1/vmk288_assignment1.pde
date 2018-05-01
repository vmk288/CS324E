void setup() {
  size(1100,1600);
  background(255);
  noStroke();
}

void draw() {
  // yellow sun
  fill(#E8F016);
  arc(0, 0, 300, 300, 0, PI / 2.0);
  // middle yellow horizontal rectangle 
  stroke(0);
  strokeWeight(3);
  fill(#E8F016);
  rect(250,335,400,250);
  // blue vertical rectangle 
  strokeWeight(5);
  fill(#0D16FA);
  rect(650,100,250,485);
  // small yellow rectangle inside blue rectangle
  fill(#E8F016);
  rect(700,150,150,100);
  // red triangle
  fill(#FA0D28);
  triangle(250,340,250,585,50,585);
  // green circles
  strokeWeight(8);
  fill(#53FA0D);
  ellipse(300,600,200,200);
  ellipse(600,600,200,200);
  // long red rectangle 
  strokeWeight(5);
  fill(#FA0D28);
  rect(300,600,300,50);
  // small blue rectangle
  fill(#0D16FA);
  rect(350,185,75,150);
  // gray smoke circles
  strokeWeight(3);
  fill(#60675E);
  ellipse(387,150,50,50);
  ellipse(387,100,50,50);
  ellipse(387,50,50,50);
  // sin wave for train tracks
  for (float x = -TWO_PI; x < 6*TWO_PI; x+=0.02) {
   // Calculate value
    float y = sin(x);
   // Render wave using ellipse
    ellipse(x*30,height/2+y*50,10,10);

  }
}
  