Blob blobby;

float x;
float y = 350;
float delay = 10.0;
float change;

void setup() {
  size(800, 400);
  background(255);
  frameRate(15);
  blobby = new Blob("right_", 4);
}

void draw() { 
  background(255);
  change = mouseX - x;
  x = (change/delay) + x;

 // if (mousePressed) {
    blobby.display(x, y);
 // }
}