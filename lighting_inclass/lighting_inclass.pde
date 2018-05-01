void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);
}

void draw() {
  noStroke(); 
  background(0); 
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  //directionalLight(99, 99, 99, -dirX, -dirY, -1);
  //ambientLight(14, 120, 120, 360, 0, 0);
  spotLight(255, 255, 255, mouseX, mouseY, 600, 0, 0, -1, PI, 600); 
  pointLight(255, 255, 255, 320, 180, 0);
  translate(width/2 - 100, height/2, 0);
  fill(169, 43, 1);
  sphere(80); 
  translate(200, 0, 0); 
  fill(14, 123, 69);
  sphere(80); 
}