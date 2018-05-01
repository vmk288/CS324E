class Train { 
  color col;
  float x_axis;
  float y_axis;
  float speed;
  int[] xPos = new int[3];
  int[] yPos = new int[3];
  color[] light = new color[3];
  
  
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
  }

  void drive() {
    x_axis = x_axis + speed;
    if (x_axis > width) {
      x_axis = 0;
    }
  }
  
  void twinkle() { 
    for(int star = 0; star < 2000; star++){
      if(random(10) < 1) {
        light[star] = (int)random(90,250);
        }
        fill(light[star]);
        ellipse(xPos[star], yPos[star], 5, 5);
    }
  }
}