int state = 1; //current state
final int MAIN_MENU =  1;
final int GAME = 2;
final int GAME_OVER = 3;
final int HIGH_SCR = 4;

void setup() 
{
  stroke(#BCE6FF);
  rectMode(CENTER);
  size(600,550);
  background(#BCE6FF);
  frameRate(5);

}

void draw()
{
  switch(state)
  {
  case MAIN_MENU:
    //Main Menu Stuff
    fill(0);
    rect(20,100,100,100);
    break;
  case GAME:
    //Game stuff
    break;
  case GAME_OVER:
    //Game over stuff
    break;
  case HIGH_SCR:
    //Highscore stuff
    break;
  }  
}