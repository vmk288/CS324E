ButtonCircle circle;
ButtonRect rect;

boolean circlePressed = false;
boolean rectPressed = false;

Radio[] radioButtons = new Radio[5];

void setup() {
  size(500, 500);
  circle = new ButtonCircle(100, 100, 30, color(110), color(200));
  rect = new ButtonRect(300, 100, 80, 60, color(110), color(200));
  noStroke();
  
  for (int i = 0; i < radioButtons.length; i++) {
    int x = 20 + i*50;
    radioButtons[i] = new Radio(x, 250, 10, color(255), color(0), i, radioButtons);
  }

}

void draw() {
  if (circlePressed) {
    background(0);
  } else if (rectPressed) {
    background(255);
  } else {
    background(220);
  }
 
  circle.update(mouseX, mouseY);
  circle.display();
  
  rect.update(mouseX, mouseY);
  rect.display();
  
  for (Radio r : radioButtons) {
    r.display();
  }

}

void mousePressed() {
  if (circle.isPressed()) {
   circlePressed = !circlePressed; 
  }
  if (rect.isPressed()) {
   rectPressed = !rectPressed;
  }
  
  for (Radio r : radioButtons) {
    r.isPressed(mouseX, mouseY);
  }
 
}

void mouseReleased() {
  circle.isReleased();
  rect.isReleased();
}