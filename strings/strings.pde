String[] lines; // global var
PrintWriter output;

void setup(){
  lines=loadStrings("text.txt");
  output=createWriter("words.txt");
}
  
void task(){ // or could do int task
  // loop through whole file
  for (String line : lines){
    String[] words = line.split(" ");
    // loops through whole line
    for (String word : words){
      output.println(word); // prints to file buffer
    }
  }
  output.flush();
  output.close();
}

void draw(){
  task();
  noLoop();
}