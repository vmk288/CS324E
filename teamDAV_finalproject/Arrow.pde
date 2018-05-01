class Arrow{
  PShape arrow;
  int i = 0;
  
  //Display Method 
  void display(float loc){
    fill(245,50,41);
    arrow = createShape(RECT,loc+30,495,5,15);
    shape(arrow);
  }
  
  //Shoot Method 
  void sht(int loc){
    fill(#BCE6FF);
    rect(loc+30, 495-(50*i),5,15);
    
    fill(245,50,41);
    arrow.translate(0,-(50+0*60));
    shape(arrow);
    i += 1;
  }
  
  void shot(int loc){
    fill(#BCE6FF);
    rect(loc+30, 495-(50*i),5,15);
    
    arrow.translate(0,1000);
    i = 0;
  }
}