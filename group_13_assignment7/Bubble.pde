class Bubble{  
    PImage bubble;
    float size = 0;
    float vx = 0;
    float vy = 0;
    boolean notPopped = true;
    // Constructor Method
    
  Bubble(float vx, float vy, float size, boolean notPopped){
      this.size = size; 
      this.vx = vx;
      this.vy = vy;
      this.notPopped = notPopped;
      bubble = loadImage("bubble.png");
      if(notPopped==false){
        fill(#BCE6FF);
        rect(vx, vy, size, size);
      }
      if (notPopped==true){
        image(bubble, vx, vy);
      }
       
    }
  
  void move(){
      image(bubble, vx, vy, size, size);
      print(counter); 
  }
  
  void pop(){
      fill(#BCE6FF);
      rect(vx,vy+20, 65,65);
      this.notPopped = false;
  }
  
  void notPopped(){
      if(this.notPopped){
        image(bubble, vx, vy, size, size);
      }
  }
}
