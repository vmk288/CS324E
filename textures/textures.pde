PImage tex;
PShape sphere;
float angle;

void setup() {
  size(500, 500, P3D);
  noStroke();
  tex = loadImage("pups_small.jpg");
  sphere = createShape(SPHERE, 50);
  sphere.setTexture(tex);
  angle = 0;
  textureMode(NORMAL);
  textureWrap(REPEAT);
}

void draw() {
  background(0);
  
  translate(100, 200, 0);
  
  beginShape(QUADS);
  texture(tex);
  vertex(0, 0, 0, 0, 0);
  vertex(350, 0, 0, 1, 0);
  vertex(350, 200, 0, 1, 1);
  vertex(0, 200, 0, 0, 1);
  endShape();
  
  pushMatrix();
  rotateY(angle);
  angle += 0.05;
  shape(sphere);
  popMatrix();
}