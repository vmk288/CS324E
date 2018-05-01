Train Train1;
Train Train2;

void setup() {
  size (1200, 900);
  Train1 = new Train(color(#1CE5C9), 100, 630, 1.5); 
  Train2 = new Train(color(#E5811C), 100, 570, 1);
}

void draw() {
  //sky
  noStroke();
  fill(71, 166, 242);
  rect(600, 0, 600, 700);
  
  //nightsky
  noStroke();
  fill(24, 82, 160);
  rect(0, 0, 600, 700);
  
  //sun
  strokeWeight(3);
  stroke(255, 245, 149);
  fill(255, 235, 49);
  ellipse(750, 120, 90, 90);
  
  //sun rays
  strokeWeight(8);
  stroke(255, 147, 5);
  line(750, 20, 750, 60);
  line(798, 80, 828, 45);
  line(655, 50, 700, 75);
  line(750, 180, 750, 220);
  line(685, 210, 712, 170);
  line(640, 125, 690, 125);
  line(810, 125, 855, 125);
  line(790, 170, 825, 205);
  
  //moon
  strokeWeight(3);
  stroke(255, 235, 49);
  fill(255, 245, 149);
  ellipse(450, 120, 90, 90);
  
  
  //ground
  noStroke();
  fill(82, 198, 72);
  rect(600, 600, 600, 400);
  
  //night ground
  noStroke();
  fill(30, 124, 24);
  rect(0, 600, 600, 400);
  
  //night road
  noStroke();
  fill(50);
  rect(0, 600, 600, 125);
  
  //day road
  noStroke();
  fill(110);
  rect(600, 600, 600, 125);
  
  Train1.drive();
  Train1.display();
  Train2.drive();
  Train2.display();
}