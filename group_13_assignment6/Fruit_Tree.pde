class fruit_tree {
  int location = 0;
  float y = 400.0;
  float r = 15.0;
  float vel = 2.0;
  float accel= 0.08;
  float friction = 0.995;
  
  PShape tree;
  PShape treeL;
  PShape treeM;
  PShape treeR;
  PShape treeT;


  fruit_tree(int location){
    
    this.location = location;
  
    noStroke();
    fill(#643910);
    treeT = createShape(RECT, (this.location + 30), 550, 25, 150);
    noStroke();
    fill(#10460C);
    tree = createShape(GROUP);
    treeL = createShape(ELLIPSE, this.location, 475, 80, 60);
    treeM = createShape(ELLIPSE, (this.location + 40), 475, 80, 80);
    treeR = createShape(ELLIPSE, (this.location + 80), 475, 80, 60);
    
   tree.addChild(treeT);
   tree.addChild(treeL);
   tree.addChild(treeM);
   tree.addChild(treeR);
    
  }
  
  //show
  void show(){
   shape(tree);
  
  }
  
  void orange1(){
    fill(#E59010);
    stroke(#E88400);
    ellipse(this.location + 50, y + 30, r, r);
    ellipse(this.location + 110, y + 70, r, r);
    ellipse(this.location - 30, y + 80, r, r);
    strokeWeight(2);
    stroke(#6C440E);
    vel += accel;
    vel *= friction;
    y += vel;
    if (y > (height - 70)){
    vel =- vel;
    }
 }
 
 void orange2(){
    fill(#E59010);
    stroke(#E88400);
    ellipse(this.location + 70, y + 30, r, r);
    ellipse(this.location, y + 100, r, r);
    strokeWeight(2);
    stroke(#6C440E);
    vel += accel;
    vel *= friction;
    y += vel;
    if (y > (height - 80) && vel > 0) {
    vel =- vel;
    
    }
  
  }
 }
