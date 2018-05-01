void setup() {
  size(340,480);
}

void draw() {
  color green = color(#27981D);
  color red = color(#982E1D);
  color c = color(green(red));
  fill(#431D98); //blueish-purple
  stroke(green); //green
  strokeWeight(4);
  rect(100,100,50,50);
  fill(c); //dark red
  stroke(green);
  strokeWeight(4);
  ellipse(50,50,100,100);
  blendMode(BLEND);
  
}