PImage img; PImage buffer;
int index=0; int idx=0;
int x=1;int y=1;

void changeTint(PImage img, float r, float g, float b, float a){
  img.loadPixels();
  for (int x=0;x<img.width;x++){
    for (int y=0;y<img.height;y++){
      int index=x+y*height;
      red(img.pixels[index])/255;
      float red=constrain(red(img.pixels[index])/255*r,0,255);
      float green=constrain(green(img.pixels[index])/255*g,0,255);
      float blue=constrain(blue(img.pixels[index])/255*b,0,255);
      img.pixels[index]=color(red,green,blue,a);
    }
  }
  img.updatePixels();
}