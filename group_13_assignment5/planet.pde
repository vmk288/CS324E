class Planet {
  float radius;
  float angle;
  
  PShape globe;
  PShape moon;
  PShape mMoon;
  
  Planet(float r) {
    img = loadImage("earth.jpg");
    img2 = loadImage("mars.jpg");
    imgM = loadImage("moon.jpg");
    radius = r;
    
    }
    
   void show() {
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
    rotateY(frameCount/500.0*TWO_PI);
    shape(globe);
    
    //creates moon
    moon = createShape(SPHERE, 15);
    moon.setTexture(imgM);
    translate(150, 100);
    rotateY(frameCount/360.0*TWO_PI);
    shape(moon);
   
 }
 
   void show2() {
   translate(-150, -100);
   noStroke();
   noFill();
   globe = createShape(SPHERE, radius);
   globe.setTexture(img2);
   //rotateX(float(mouseX) / width * 2 * PI);
   //rotateY(float(frameCount/200));
   rotateY(frameCount/300.0*TWO_PI);
   shape(globe);
   
   //creates moon for mars
   mMoon = createShape(SPHERE, 10);
   mMoon.setTexture(imgM);
   translate(30, -50);
   rotateY(frameCount/360.0*TWO_PI);
   shape(mMoon);
   }
   
}