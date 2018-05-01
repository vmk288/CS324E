class Spaceship {
  float size = 1;
  int lctn = 0;
  int spd = 0;
  int eng = 545;
  int flightLen = 0;
  
  int i = 0;
  PShape spaceship;
  PShape spcshipTop;
  PShape spcshipMed;
  PShape spcshipBot;

  
  //Constructor Method
  Spaceship(float size, int lctn, int spd, int flightLen){
    this.size = size;
    this.lctn = lctn;
    this.spd = spd;
    this.flightLen = flightLen;
    
    fill(150);
    noStroke();
    spcshipTop = createShape(BOX, 18*(this.size),36*(this.size),18*(this.size));
    noStroke();
    fill(255,170,0);
    spcshipBot = createShape(BOX, 7*(this.size),20*(this.size),7*(this.size));

  }
  
  //Display Method
  void display() {
    pushMatrix();
    translate(this.lctn,500,0);
    shape(spcshipTop);
    popMatrix();
  }

  //Launch Method 
  void launch(){
    spcshipTop.translate(0,-this.spd);
    eng -= (this.spd);
    i += 1;
  }
  
  //Return Method 
  void spaceshipReturn(){
    fill(0);
    noStroke();
    
    pushMatrix();
    spcshipTop.translate(0,this.spd*this.flightLen);
    popMatrix();
    
    eng = 520;
    i = 0;
  }
  
  //Thrust Engine Method
  void engine(){
    fill(255,170,0);
    noStroke();
    
    if (i % 2 == 0){
      pushMatrix();
      translate(this.lctn,eng,0);
      scale(1,3,1);
      shape(spcshipBot);
      popMatrix();
    } else {
      pushMatrix();
      translate(this.lctn,eng,0);
      scale(1,1.5,1);
      shape(spcshipBot);
      popMatrix();
    }
  }

}