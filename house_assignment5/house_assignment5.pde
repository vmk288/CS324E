float rotation = 0;

void setup(){
  size(800, 800, P3D);
  noStroke();
}

void draw(){
  background(0);
  lights();
  translate(400, 400, 0);
  //Sets the house to a nice magenta color
  tint(255, 126);
  fill(255, 0, 255);
  rotateY(rotation);
  rotation += 2*PI/60;
  
  //Creates the house(the reason i used TRIANGLE is because i had squares and pentagons in the same model(NOTE: you can do it with QUADS this is just easier to understand))
  beginShape(TRIANGLE);
  //Front
  vertex(0, 0, 0);
  vertex(0, 50, 0);
  vertex(50, 50, 0);
  vertex(0, 0, 0);
  vertex(50, 0, 0);
  vertex(50, 50, 0);
  //Left-side
  vertex(0, 0, 0);
  vertex(0, 50, 0);
  vertex(0, 50, -50);
  vertex(0, 0, 0);
  vertex(0, 0, -50);
  vertex(0, 50, -50);
  vertex(0, 0, 0);
  vertex(0, -25, -25);
  vertex(0, 0, -25);
  //back
  vertex(0, 0, -50);
  vertex(0, 50, -50);
  vertex(50, 50, 50);
  vertex(0, 0, 50);
  vertex(50, 0, 50);
  vertex(50, 50, 50);
  //Right-side
  vertex(100, 0, 0);
  vertex(100, 100, 0);
  vertex(100, 100, -100);
  vertex(100, 0, 0);
  vertex(100, 0, -100);
  vertex(100, 100, -100);
  vertex(100, 0, 0);
  vertex(100, -50, -50);
  vertex(100, 0, -100);
  //Top-Front
  vertex(0, 0, 0);
  vertex(100, 0, 0);
  vertex(0, -50, -50);
  vertex(100, 0, 0);
  vertex(100, -50, -50);
  vertex(0, -50, -50);
  //Top-Back
  vertex(0, 0, -100);
  vertex(100, 0, -100);
  vertex(0, -50, -50);
  vertex(100, 0, -100);
  vertex(100, -50, -50);
  vertex(0, -50, -50);
  //Bottom
  vertex(0, 100, 0);
  vertex(100, 100, 0);
  vertex(100, 100, -100);
  vertex(0, 100, 0);
  vertex(0, 100, -100);
  vertex(100, 100, -100);
  endShape();
}