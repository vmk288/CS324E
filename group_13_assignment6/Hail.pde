class Hail{
  PShape singleHail = loadShape("hail.svg");
  
  float size = 0;
  float acc = 0;
  float hght = 0;
  float loc = 0;
  int vel = 2;
  int vars = 20;
  boolean stop = false;
  
  //constructor
  Hail(float size, float acc, float hght, float loc){
    this.size = size;
    this.acc = acc;
    this.hght = hght;
    this.loc = loc;
  }
  
  //hail dropping 
  void drop(){
    shape(singleHail,this.loc,vars,100*this.size,100*this.size);
    vel += this.acc; 
    vel *= hght;
    vars += vel;
    
    if (vars > height-(100*this.size)/2){
      vel = -vel;
    }
    
    if (vars > height+10){
      vars = 20;
    }
  }
}
