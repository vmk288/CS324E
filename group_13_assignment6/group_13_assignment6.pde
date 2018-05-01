ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
int frame;

Hail hailL;
Hail hailL2;
Hail hailM;
Hail hailR2;
Hail hailR;
fruit_tree tree1;
fruit_tree tree2;

public void setup() {
  size(1000, 780);
  ellipseMode(RADIUS);
  
  hailL = new Hail(0.75,2,0.99,random(780));
  hailL2 = new Hail(0.6,2,0.96,random(780));
  hailM = new Hail(0.9,2,0.93,random(780));
  hailR2 = new Hail(0.67,2,0.97,random(780));
  hailR = new Hail(0.8,2,0.94,random(780));
  tree1 = new fruit_tree(200);
  tree2 = new fruit_tree(750);

}

public void draw(){
  fill(#07122E);
  noStroke();
  rect(0, 0, 1000, 680);
  fill(#0A2E07);
  rect(0, 680, 1000, 780);
  
  if (frame % 10 == 0) {
    float offset = (float) (Math.random() - 0.5) * 300;
    bubbles.add(new Bubble(500 + offset, 780));
  }
  
  colorMode(RGB, 100);
  for (Bubble bubz : bubbles) {
    bubz.update();
  }
  
  frame++;
  
  tree1.show();
  hailL.drop();
  hailL2.drop();
  hailM.drop();
  hailR2.drop();
  hailR.drop();
  tree2.show();
  tree1.orange1();
  tree2.orange2();
  
  if (mousePressed == true){
    setup();
  }
  
  }
