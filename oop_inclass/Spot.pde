class Spot{
  float x,y,r;
  PVector speed;
  
  Spot(float x, float y, float r, PVector speed){
    this.x = x; // x value(in class) will be local x(in spot constructor)
    this.y = y;
    this.r = r;
    this.speed = speed;
  }
  
  void display(){
    fill(0);
    ellipse(x,y,r,r);
  }
  
  void move(){
    speed.x++;
    speed.y++
  }
}

  