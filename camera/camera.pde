float angle;
void setup() {
  size(500, 500, P3D);
  angle = 0;
}

void draw() {
  lights();
  background(110);
  beginCamera();
  camera(mouseX, mouseY, 120.0, 
          0.0, 0.0, 0.0, 
          0.0, 1.0, 0.0);
  rotateX(angle);
  endCamera();
  angle += 0.05;
  box(100);
}