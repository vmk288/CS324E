class Bullet{
  PShape bullet;
  int i = 0;
  
  //Constructor Method 
  Bullet(){
  }
  
  //Display Method 
  void display(float location){
    fill(150);
    bullet = createShape(RECT,location+25,495,5,15);
    shape(bullet);
  }
  
  //Shoot Method 
  void shoot(int location){
    fill(#BCE6FF);
    rect(location+25, 495-(50*i),5,15);
    
    fill(150);
    bullet.translate(0,-(50+0*60));
    shape(bullet);
    i += 1;
  }
  
  void shot(int location){
    fill(#BCE6FF);
    rect(location+25, 495-(50*i),5,15);
    
    bullet.translate(0,1000);
    i = 0;
  }
}
