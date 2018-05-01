void setup() {
  size(800,600,P3D);
  background(240);
}

void draw(){
  lights();
  color cool_blue = color(#0024FF);
  fill(cool_blue);
  //beginCamera();
  
  //camera(70.0,35.0,120.0, 400.0, 300.0, 10.0, 0.0, 1.0, 0.0);
  //camera(400.0,35.0,120.0, 400.0, 300.0, 10.0, 0.0, 1.0, 0.0);
  //camera(400.0,200.0,120.0, 400.0, 300.0, 10.0, 0.0, 1.0, 0.0);
  //camera(400.0,35.0,400.0, 400.0, 300.0, 10.0, 0.0, 1.0, 0.0);
  translate(400,300);
  // Draw a cube
  box(50);
  
  translate(50,100);
  //rotateX(-PI/6);
  // Draw a box
  box(200, 100, 100);
  
  translate(-150,-100);
  //rotateY(PI/6);
  //Draw a sphere
  sphere(40);
  //sphereDetail(6);
  //sphereDetail(6, 18);  
  
 //endCamera();

}