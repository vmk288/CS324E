class Spot{
  float y;
  float x;
  float r;
  float speed;
  Spot(float x, float y, float r, float speed){
    this.x=x;
    this.y=y;
    this.r=r;
    this.speed=speed;
  }
  
  void display(){
    ellipse(x,y,r,r);
  }
  
  void move(){
    if (this.x<width && this.y<height){
      this.x+=speed;
      this.y+=speed;
    }
  }
}