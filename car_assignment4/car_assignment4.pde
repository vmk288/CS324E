//import processing.sound.*;
//SoundFile file;

Train Train1;
Train Train2; 
int time = millis();

void setup() {
  size(1200, 900);
  Train1 = new Train(color(#1CE5C9), 100, 700, 2); 
  Train2 = new Train(color(#E5811C), 100, 600, 1);
  
  //file = new SoundFile(this, "Train.mp3");
  //file.play();
}

void draw() {

  Train1.drive();
  Train1.display();
  Train2.drive();
  Train2.display();
}

class Train { 
  color col;
  float x_axis;
  float y_axis;
  float speed;
  Train(color c, float xpos, float ypos, float s) { 
    col = c;
    x_axis = xpos;
    y_axis = ypos;
    speed = s;
  }

  void display() {
    stroke(0);
    fill(col);
    rectMode(CENTER);
    rect(x_axis, y_axis, 100, 50);
    
    // adding blinking light on trains 
    int pass = millis() - time; 
    if(pass >= 100){
      time = millis();
      fill(#F7220A);  
    }
    fill(255);
    ellipse(x_axis,y_axis,20,20);
    arc(x_axis,y_axis, 20, 20, 0, TWO_PI/20.0 * pass,PIE);

    fill(255); 
    ellipse(x_axis,y_axis,20,20);
 
    fill(#F7220A);  
    arc(x_axis,y_axis, 20, 20, 0, TWO_PI/40.0 * pass,PIE);
  }
  

  void drive() {
    x_axis = x_axis + speed;
    if (x_axis > width) {
      x_axis = 0;
    }
  }
}