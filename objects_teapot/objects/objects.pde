PShape teapot;
float rotation = 0;

void setup() {
  size(500, 500, P3D); 
  teapot = loadShape("teapot.obj");
  teapot.scale(200, 200, 200);
}
void draw() {
  background(0);
  lights();
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateZ(PI);
  rotateY(rotation);
  rotation += 2*PI/60;
  shape(teapot, 0, 0, teapot.width, teapot.height);
  popMatrix();
}