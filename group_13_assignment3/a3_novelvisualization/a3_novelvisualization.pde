String[] uniqueWords;
PFont r;

// set up the canvas
void setup(){
  size(700,600);
  uniqueWords=loadStrings("uniquewords.txt");
  noLoop();
}

// create function for clicking the canvas and changing words
void mouseClicked(){
  redraw();
}

// creating word cloud 
public void createCloud(){
  // initiating font 
  r=createFont("Rancho-Regular.ttf",32);
  int w_width=3;
  int space=34;
  int new_line=1;
  fill(0);
  textFont(r);
  
  // creating array to add words from uniquewords.txt based on their starting char 
  ArrayList<Integer> exceptions = new ArrayList<Integer>();
  while (space*new_line<=600){
    int idx=(int)random(0,uniqueWords.length);
    if (exceptions.contains(idx)){
      continue;
    }
    exceptions.add(idx);
    
    String word=uniqueWords[idx];
    char firstWord;
    try{
      firstWord=word.charAt(0);
    } catch (StringIndexOutOfBoundsException e){
      continue;
    }
    // words starting with a-h
    if ((int)firstWord >=97 && (int)firstWord<=104){
      fill(#990088);
    // words starting with i-q
    }else if ((int)word.charAt(0)>104 && (int)word.charAt(0)<=113){
      fill(#FF4499);
    // words starting with r-z
    }else {
      fill(#FFD3FC);
    }
    
    // making sure words don't bleed over 
    if (w_width+textWidth(word)>697){
      new_line+=1;
      w_width=3;
    }else {
      text(word,w_width,space*new_line);
      w_width+=textWidth(word)+7;
    }
  }
}


void draw(){
  background(#DDAABB);
  createCloud();
}
      
  