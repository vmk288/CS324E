void setup (){
  size(600,550);
}

void draw () {
  fill(0);
  noStroke();
  rectMode(CORNER);
  rect(0,0,600,550);
  fill(255,255,0);
  textSize(50);
  text("GAME OVER", 150, 150); 
  noFill();
  stroke(255,255,0);
  strokeWeight(4);
  rect(150,175,285,75);
  rect(150,275,285,75);
  rect(150,375,285,75);
}