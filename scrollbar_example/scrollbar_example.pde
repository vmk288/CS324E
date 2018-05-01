PImage img;
Slider s;

void setup() {
  size(400, 400);
  img = loadImage("pups.png");
  
  s = new Slider(0, 0, width-10, 10, 0, img.width-400);
}

void draw() {
  int x = int(s.getVal());

  image(img, -x, 0);
  
  s.update(mouseX, mouseY);
  s.display();
}

void mousePressed() {
  s.pressed(mouseX, mouseY);
}

void mouseReleased() {
  s.released();
}