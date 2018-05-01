void setup() {
  size(340,480);
  fill(255);
  stroke(0);
}

void draw() {
  rect(0,0,50,50);
  fill(0);
  strokeWeight(4);
  stroke(255);
  rect(50,50,50,50);
  
  //noFill(); doesn't fill the ellipse
  //noStroke(); doesn't outline the ellipse
  
  //ellipseMode(RADIUS);
  ellipse(250,250,50,100);
  
  //rectMode(CORNERS);
  rect(250,250,50,50);
  fill(255);
  strokeWeight(4);
  stroke(0);
  //rectMode(CENTER);
  rect(100,100,50,50);
}