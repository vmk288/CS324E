String[] scores = new String[5];  
String fileName = "scores.txt";  
String score;   
 
TextBox tbox;
 
final int stateNormal   = 0;
final int stateInputBox = 1;
final int stateAfterInputBox = 2;
int state=stateNormal; 
 
String result="/"; 
 
void setup() {
  size(1260, 720);
 
  // init highscore 
  initHighscore();
 
  // init the input box for the name 
  instantiateBox();
  tbox.isFocused = true;
}//func
 
void draw() {
  // state tells how the program works: 
  if (state==stateNormal) {
    // normal state = show high score 
    background(0);
    showHighscore();
    // show help text (white line of text) 
    textAlign(CENTER);
    fill(255); 
    textSize(17);
    text("Press space bar to add a score; q to save and quit", width/2, 200);
    textAlign(LEFT);
  } 
  // -------------------
  else  if (state==stateInputBox) {
    // state for the Input Box 
    background(0);
    tbox.display();
  }// else if
  // ------------------
  else if (state==stateAfterInputBox) {
    // state After the Input Box
    score += " "+result; 
    println(score); 
    result="/";
    addNewScore(score);
    saveHighscore();
    state=stateNormal;
  }
}
 
void initHighscore() {

  for (int i=0; i<scores.length; i++) {
    scores[i] = str(0);
  }
  
  String[] scoresAsStrings=null;
  scoresAsStrings = loadStrings(fileName);
  
  if (scoresAsStrings!=null) {
    // load was successful
    for (int i=0; i<scores.length; i++) {
      // put strings into scores as int 
      scores[i] = (scoresAsStrings[i]);
    }
  } else {
    println("New Score initialized - first run\n");
  }
} 
 
void instantiateBox() {
  // init the Input Box 
  tbox = new TextBox(
    "Please enter your name: ", 
    width/2-width/3, height/4 + height/16, // x, y
    width/3, height/2 - height/4 - height/8, // w, h
    215, // lim
    0300 << 030, color(-1, 040), // textC, baseC
    color(-1, 0100), color(#FF00FF, 0200)); // bordC, slctC
}
 
void keyPressed() {
  if (state==stateNormal) {
    //
    keyPressedForStateNormal();
  } else if (state==stateInputBox) {
    //
    tbox.tKeyPressed();
  }
}//func
 
void keyPressedForStateNormal() {
  // keyboard input 
  if (key==' ') {
    // add one element to high scores
    score = str(int(random(100)));
    println(score); 
    if (highEnoughForHighScore(score)) {
      state=stateInputBox;
    }
  } 
  else if (key=='q') {
    // save and quit 
    saveHighscore();
    // quit program
    exit();
  }//else if
  else if (key==ESC) {
    key=0; // kill esc
  }
}//func
 
void keyTyped() {
  if (state==stateNormal) {
    // do nothing
  } else if (state==stateInputBox) {
    //
    tbox.tKeyTyped();
  }
}
void showHighscore() {
  // displays the high score 
  textSize(80);
  fill(255, 0, 0, 255);
  textAlign(CENTER);
  text("Highscores ", width/2, 160);
  for (int i=0; i<scores.length; i++) {
    textSize(60);  
    text(scores[i], width/2, 300+80*i);
  }
  textAlign(LEFT);
}
 
void addNewScore(String score) {
  // adds element when its high enough and sorts high score list. 
  for (int i=0; i<scores.length; i++) {
    if (score.compareTo(scores[i])>0) {
      for (int j=scores.length-1; j>=max(i, 1); j--) {
        scores[j] = scores[j-1];
      }
      scores[i] = score;
      break;
    }
  }
} 
 
void saveHighscore() {
  // convert to string array
  String[] scoresAsStrings = new String[scores.length];
  for (int i=0; i<scores.length; i++) {
    scoresAsStrings[i]=(scores[i]);
  }
  // save
  saveStrings(fileName, scoresAsStrings);
}//func
 
boolean highEnoughForHighScore(String score) {
  // test whether new score is high enough to get into the highscore 
  for (int i=0; i<scores.length; i++) {
    if (score.compareTo(scores[i])>0) {
      return true; // high enough
    }//if
  }//for
  return false; // NOT high enough
}
 
class TextBox { // credit gotoloop
 
  // demands rectMode(CORNER)
 
  color textC, baseC, bordC, slctC;
  short x, y, w, h, xw, yh, lim;
 
  boolean isFocused = true;
  String txt = "";
  String title = "";
 
  boolean blinkIsOn=true; 
 
  // construrctor
  TextBox(
    String tt, 
    int xx, int yy, 
    int ww, int hh, 
    int li, 
    color te, color ba, color bo, color se) {
 
    title=tt;
 
    x = (short) xx;
    y = (short) yy;
    w = (short) ww;
    h = (short) hh;
 
    lim = (short) li;
 
    xw = (short) (xx + ww);
    yh = (short) (yy + hh);
 
    textC = te;
    baseC = ba;
    bordC = bo;
    slctC = se;
  } // construrctor
 
  void display() {
    stroke(isFocused? slctC : bordC);
 
    // outer 
    fill(baseC);
    rect(x-10, y-90, w+20, h+100);
 
    fill(0); 
    text(title, x, y-90+20);
 
    // main / inner
    fill(baseC);
    rect(x, y, w, h);
 
 
    fill(textC);
    text(txt + blinkChar(), x, y, w, h);
  }
 
  void tKeyTyped() {
 
    char k = key;
 
    if (k == ESC) {
      // println("esc 2");
      // state=stateNormal; 
      key=0;
      return;
    } 
 
    if (k == CODED)  return;
 
    final int len = txt.length();
 
    if (k == BACKSPACE)  
      txt = txt.substring(0, max(0, len-1));
    else if (len >= lim)  
      return;
    else if (k == ENTER || k == RETURN) {
      // this ends the entering 
      println("RETURN ");
      state  = stateAfterInputBox; // close input box 
      result = txt;
      txt="";
    } else if (k == TAB & len < lim-3)  txt += "    ";
    else if (k == DELETE)  txt = "";
    else if (k >= ' ')     txt += str(k);
  }
 
  void tKeyPressed() {
    if (key == ESC) {
      // println("esc pressed");
      // state=stateNormal;
      key=0;
    }
 
    if (key != CODED)  
      return;
 
    final int k = keyCode;
 
    final int len = txt.length();
 
    if (k == LEFT) 
      txt = txt.substring(0, max(0, len-1));
    else if (k == RIGHT & len < lim-3) 
      txt += "    ";
  }
 
  String blinkChar() {
    if (frameCount%12==0)
      blinkIsOn=!blinkIsOn; 
 
    if (!isFocused) 
      return ""; 
 
    if (blinkIsOn) 
      return "|";
    else return "";
  }
 
  boolean checkFocus() {
    return isFocused = 
      mouseX > x & mouseX < xw & 
      mouseY > y & mouseY < yh;
  }//method
}//class 
//
