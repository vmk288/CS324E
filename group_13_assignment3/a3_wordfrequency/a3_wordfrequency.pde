//Danish Tharvani
//Assignment 3 Part 4
//Visualization of Word Frequencies

String[] wordfreq;
int[] num;
int colorCntBlue = 0;
int colorCntGreen = 0;

void setup() {
  //background,size,string array
  background(0);
  size(1000,600);
  String[] line = loadStrings("wordfrequency.txt");
  int size = line.length;
  wordfreq = new String[size];
  num = new int[size];
  
  //array of frequency values
  for (int i = 0; i < size; i++) {
    String[] list = split(line[i], ':');
    wordfreq[i] =list[0];
    String val = list[1];
    val = trim(val);
    num[i] =int(val);

  }
}
void draw() 
{
  int cnt = 0;
  color a = color(150,colorCntGreen,colorCntBlue,50);
  colorCntGreen +=2;
  colorCntBlue += 1;
  fill(a);
  
  //creating bar graph
  for (int i = 0; i < wordfreq.length; i = i+1) 
  {
    fill(a);
    strokeWeight(2);
    int rad = num[i];  
    int disRad = rad/4;
    if (rad<10 && rad>5)
    {
      disRad = 3;
    }
    else if (rad<6)
    {
      disRad = 2;
    }
    rectMode(RADIUS);
    rect(cnt+4, 300, 4, disRad); 
    
    cnt = cnt + 8;
  
  }
  
}