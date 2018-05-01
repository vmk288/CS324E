PImage img;
int idx=0;

void setup(){
  surface.setResizable(true);
  img=loadImage("tint.png");
  surface.setSize(img.width,img.height);
  frameRate(30);
}

void draw(){
  //int[] colors = {blah,blah,blah);
  //int[][] kernel = {{blh},{blah},{blah}}
  //fill(colors[0]);
  /////////////////////colorMode(RGB,255,255,255);
  image(img,0,0);
  img.loadPixels();
  // tint method
  for(int i=0;i<img.width;i++){
    for(int j=0;j<img.height;j++){
      idx=i+img.height*j;
      float red = red(img.pixels[idx]);
      float green = green(img.pixels[idx]);
      float blue = blue(img.pixels[idx]);
      img.pixels[idx]=color(red,green,blue+100,25);
      }
    }
    img.updatePixels();
    image(img,0,0);
    noLoop();
}