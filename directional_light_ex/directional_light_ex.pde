float x;
PImage tex;
void setup(){
  
  size(500,500,P3D);
  PImage tex = loadImage("desert-texture.jpg");
  noStroke();
  camera(0,0,300,0,100,0,0,1,0);
  shininess(200);
  specular(255, 255, 255);
  lightSpecular(255, 255, 255);
  
  
}

void draw(){
  background(0);/*
  beginCamera();
  camera(0,0,300,0,100,0,0,1,0);
  rotateX(x+=PI/1000);
  rotateZ(x+=PI/5000);
  endCamera();*/
  
  beginShape();
  texture(tex);
  vertex(0, 0, 0, 0, 0);
  vertex(10, 0, 0, .5, 0);
  vertex(10, 10, 0, .5, 1);
  vertex(0, 10, 0, 0, 1);
  endShape();
  
  directionalLight(255,255,255,1,1,0);
  pointLight(255,255,255,0,100,0);
  spotLight(100,255,100,
  100, 100,0,
  -1,0,0,
  PI/4, 1);
  pushMatrix();
  translate(0,height/2,0);
  sphere(50);
  translate(0,-height/2,0);
  rotateX(PI/4);
  rotateY(PI/4);
  box(50);
  
  popMatrix();
  
  
}