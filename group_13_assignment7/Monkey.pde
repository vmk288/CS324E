class Player
{
  PImage img;
  float x; 
  float y; 
  float w; 
  float h; 
  
  //Paddle constructor
  Player()
  {
    x = width/2 - 20;
    y = 450;

    w = 100;
    h = 10;    
  }

  void move()
  {
    img = loadImage("50Monkey.png");
    image(img, x-30, y);
  }
  
}
