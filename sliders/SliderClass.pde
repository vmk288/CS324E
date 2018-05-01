class SliderClass{
  
  int upperLeftX, upperLeftY;
  int sliderWidth, sliderHeight;
  int sliderMinValue, sliderMaxValue;
  
  int sliderElementYPosition;
  int sliderElementThickness = 15;
  
  //constructor
  SliderClass(int _upperLeftX,int _upperLeftY,int _sliderWidth,int _sliderHeight,int _sliderMinValue,int _sliderMaxValue) {
  upperLeftX = _upperLeftX;
  upperLeftY= _upperLeftY;
  
  sliderWidth = _sliderWidth;
  sliderHeight = _sliderHeight;
  
  sliderMinValue = _sliderMinValue;
  sliderMaxValue = _sliderMaxValue;
  
  sliderElementYPosition = upperLeftY + sliderHeight;
    
  }
  
  //display it
  void display() {
    fill(122);
    rectMode(CORNER);
    rect(upperLeftX, upperLeftY, sliderWidth, sliderHeight);
    
    fill(0);
    rectMode(CENTER);
    rect(upperLeftX + sliderWidth/2, sliderElementYPosition, sliderWidth, sliderElementThickness);
   
  }
  
  //this gets called when the mouse is dragged - want to update y position of slider element if needed
  void checkIfMouseOnSliderAndMoveSliderAccordingly() {
    boolean mouseIsWithinSliderElement = mouseX >= upperLeftX & mouseX <= upperLeftX + sliderWidth 
                                     & mouseY >= sliderElementYPosition - sliderElementThickness/2  
                                     & mouseY <= sliderElementYPosition + sliderElementThickness/2;
                                     
    if (mouseIsWithinSliderElement) {
      
      sliderElementYPosition = constrain(mouseY,upperLeftY +sliderElementThickness/2 , upperLeftY + sliderHeight - sliderElementThickness/2);
      
    }
    
  }
  
  void changeTheBackground() {
    background(sliderElementYPosition/2);
  }
  
}