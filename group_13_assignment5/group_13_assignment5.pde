PImage img;
PImage img2;
PImage imgM;
int cnt1 = 0;
int cnt2 = 0;
Spaceship spcShip1;
Spaceship spcShip2;

Planet earth;
Planet mars;
moveHouse house1, house2, house3;
//float offset = 0;
//float easing = 0.05;

void setup(){
  size(600,600,P3D);
  background(0);
  house1 = new moveHouse(300, 250, 300, 0, 0, 0, 20, 60, 0.01*2, color(#D83B5B), color(#3CEDE9));
  house2 = new moveHouse(300, 300, 300, 0, 0, 0, 20, 60, 0.01*3, color(#C33BD8), color(#6FD88C));
  house3 = new moveHouse(300, 350, 300, 0, 0, 0, 20, 60, 0.01*5, color(#5B3CED), color(#E59F2C));
  earth = new Planet(100);
  mars = new Planet(35);
  spcShip1 = new Spaceship(1,50,14,45);
  spcShip2 = new Spaceship(1.5,500,22,30);
}
void draw(){
  background(0);
  //tint(255,127);
  fill(0,10);
  rect(0,0,width,height);
  fill(random(255),random(255),random(255));
  ellipse(random(width),random(height), 10,10);
  house1.update();
  house1.twirl();
  house2.update();
  house2.twirl();
  house3.update();
  house3.twirl();
  
    //Spaceship1 
  spcShip1.display();
  spcShip1.launch();
  spcShip1.engine();
  
  //Spaceship2
  spcShip2.display();
  spcShip2.launch();
  spcShip2.engine();
  
  
  //Getting spaceships back to bottom to start loop over again
  cnt1 += 1;
  cnt2 += 1;
  if (cnt1 > 45) {
    spcShip1.spaceshipReturn();
    cnt1 = 0;
  }
  if (cnt2 > 30) {
    spcShip2.spaceshipReturn();
    cnt2 = 0;
  }
  
  translate(width/2, height/2);
  lights();
  earth.show();
  translate(-130, -130);
  mars.show2();
  
}