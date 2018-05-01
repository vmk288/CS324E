
SliderClass mySlider;

void setup() {
  size(500,500);
  mySlider = new SliderClass(450,10,40,480,0,255);
  background(255);
}

void draw() {
  mySlider.display();
}

void mouseDragged() {
  mySlider.checkIfMouseOnSliderAndMoveSliderAccordingly();
  mySlider.changeTheBackground();
  mySlider.display();
}