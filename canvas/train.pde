int time = millis();

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
    rectMode(CORNER);
    
    // adding blinking light on trains 
    int pass = millis() - time; 
    if(pass >= 300){
      time = millis();
      fill(#0C34F5);  
    }
    fill(255);
    ellipse(x_axis,y_axis,20,20);
    arc(x_axis,y_axis, 20, 20, 0, TWO_PI/40.0 * pass,PIE);

    fill(255); 
    ellipse(x_axis,y_axis,20,20);
    
    fill(#0C34F5);  
    arc(x_axis,y_axis, 20, 20, 0, TWO_PI/40.0 * pass,PIE);
  }

  void drive() {
    x_axis = x_axis + speed;
    if (x_axis > width) {
      x_axis = 0;
    }
  }
}