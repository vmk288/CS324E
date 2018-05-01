PImage img;
Bubble bub1;
Bubble bub2;
Bubble[][] bubbles; 
int interval = 10000;
int lastRecordedTime = 0;
float counter = 50;
Bubble[][] poppedBubbles; 
boolean wonGame = true;

Arrow b1;
int arwTime = 0;
int arwIntvl = 500;
boolean sht = false;
int spd = 0;
int arwLoc = 9;
int shootLoc = 0;
int rows = 9;
int tally;

Player blast = new Player(); 
int location = 0;

void setup() {
  stroke(#BCE6FF);
  rectMode(CENTER);
  size(600,550);
  background(#BCE6FF);
  frameRate(5);
  
  poppedBubbles = new Bubble[10][10];
  bubbles = new Bubble[10][10];
  
  b1 = new Arrow();
  
  for (int i = 0; i < 10; i = i+1) {
      for (int j = 0; j < 10; j = j+1) {
       bub1 = new Bubble(25+i*60,25+j*50,25,false);
       bubbles[i][j] = bub1;
      } 
    }
  for (int i = 0; i < 10; i = i+1) {
     for (int j = 0; j < 3; j = j+1) {
       bubbles[i][j].notPopped = true;
     }
  }
  
  for (int i = 0; i < 10; i = i+1) {
     for (int j = 0; j < 5; j = j+1) {
       bubbles[i][j].notPopped();
     }
  }

}

void draw(){
  textSize(24);
  textAlign(LEFT);
  fill(255);
  text("Score: "+tally,10,540);
  
  blast.move();

  if(millis()-lastRecordedTime>interval){
      poppedBubbles = bubbles;
      
      for (int j = 0; j < 10; j = j+1) {
        //this is when the game should end/ user has won
        for (int k = 0; k < 10; k = k+1) {
          if (bubbles[k][j].notPopped){
            wonGame = false;
          }
         }
          if (wonGame == true){
            background(#BCE6FF);
            textSize(50);
            fill(255);
            textAlign(CENTER);
            text("Game Over", 300,100);
            text("You Won", 300,150);
            text("Final Score: "+tally, 300,200);
            noLoop();
          }
      //this is when the game should end/ user has lost
        for (int k = 0; k < 10; k = k+1) {
          if (bubbles[k][9].notPopped){
            background(#BCE6FF);
            textSize(50);
            fill(255);
            textAlign(CENTER);
            text("Game Over", 300,100);
            text("You Lose", 300,150);
            text("Final Score: "+tally, 300,200);
            noLoop();
          }
         } 
      
       //move the rest of the rows down
       for (int i = 9; i >= 0; i = i-1) {
          if(i>0){
            bubbles[j][i].notPopped = poppedBubbles[j][i-1].notPopped;
          } 
       }
        
       for (int i = 0; i < 10; i = i+1) {
          if(i>0){
            bubbles[j][i].notPopped();
          }
        }
      
       //add new row at top  
       for (int i = 0; i < 10; i = i+1) {
          if(i==0){
            bubbles[j][i].notPopped = true;
            bubbles[j][i].notPopped();
          }
        }
      }
    lastRecordedTime = millis(); 
  }
  
  if (millis() - arwTime > arwIntvl){
    if (sht) {
      arwLoc -= 1;
      b1.sht(shootLoc*60);
      
     if (bubbles[shootLoc][arwLoc].notPopped){
       bubbles[shootLoc][arwLoc].pop();
       fill(#BCE6FF);
       rect(20,540,200,50);
       
       tally += 10;
       textSize(24);
       textAlign(LEFT);
       fill(255);
       text("Score: "+tally,10,540);
       b1.shot(shootLoc*60);
       arwLoc = rows;
       sht = false;
     }
      
      if (arwLoc > rows){
        b1.shot(shootLoc*60);
        arwLoc = rows;
      }
    }
    arwTime = millis();
  }
}

// Interactivity 
void keyPressed() {
  if (key == 's'){
    if (sht == false) {
      b1.display(location*60);
      sht = true;
      shootLoc = location;
      b1.sht(shootLoc*60);
    } else {
      textSize(20);
      fill(255);
      textAlign(CENTER);
      text("Error: Player can only fire one bullet at a time.",375,540);
    }
  } else if (key == '1'){
    arwIntvl = 100;
  } else if (key == '2'){
    arwIntvl = 10;
  }

    if (key == CODED) {
      if(keyCode == LEFT) {
        blast.x-=60;
        location -= 1;
        if (location < 0){
          location = 0;  
        }
        fill(#BCE6FF); 
        rect(blast.x+60,blast.y,100,100);
        if(blast.x<0) {
          blast.x=0;
        }
      }
    }
    if (key == CODED) {
      if(keyCode == RIGHT) {
        location += 1;
        if (location > 9){
          location = 9;  
        }
        blast.x+=60;
        fill(#BCE6FF); 
        rect(blast.x-60,blast.y,100,100);
        if(blast.x>=560) { 
          blast.x = 560;
        }

      }
    }
}