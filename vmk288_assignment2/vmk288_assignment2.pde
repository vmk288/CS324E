PImage img1, img2;
float red, green, blue;

void setup(){
  surface.setResizable(true);
  img1=loadImage("tree.jpg");
  surface.setSize(img1.width,img1.height);
  
  img2=createImage(img1.width,img1.height,ARGB);
  img2.copy(img1,0,0,img1.width,img1.height,0,0,img2.width,img2.height);
}

// Original image
void OG(){
  img1.loadPixels(); 
  img2.loadPixels();
  for (int x=0;x<img2.height;x++){
    for (int y=0;y<img2.height;y++){
      int idx=x+y*img2.width;
      img2.pixels[idx]=img1.pixels[idx];
    }
  }
  img2.updatePixels();
  image(img2,0,0);
}

// Gray-Scale filter
void grayScale(){
  img1.loadPixels(); 
  img2.loadPixels();
  for (int x=0;x<img2.width;x++){
    for (int y=0;y<img2.height;y++){
      int idx=x+y*img2.width;
      red=red(img1.pixels[idx]);
      blue=blue(img1.pixels[idx]);
      green=green(img1.pixels[idx]);
      img2.pixels[idx]=color((red+blue+green)/3);
    }
    img2.updatePixels();
  }
  //img2.updatePixels();
  image(img2,0,0);
}

// Contrast filter
void contrast(){
  img1.loadPixels(); 
  img2.loadPixels();
  int threshold = 100;
  for (int x=0;x<img2.width;x++){
    for (int y=0;y<img2.width;y++){
      int idx=x+y*img2.width;
      if (brightness(img1.pixels[idx])>threshold){
        img2.pixels[idx]=color(255);
      }else{
        img2.pixels[idx]=color(0);
      }
    }
  }
  //img1.updatePixels();
  img2.updatePixels();
  image(img2,0,0);
}

// tint convolutions
color changeTint(int x, int y, float[][] kernel, int kernel_size){
  red = 0;
  green = 0;
  blue = 0;
  colorMode(RGB);
  int change = kernel_size/2;
  for (int i=0; i<kernel_size; i++){
    for (int j=0; j<kernel_size; j++){
      int index = (x+i-change)+img1.width*(y+j-change);
      index = constrain(index,0,img1.pixels.length-1);
      red+= red(img1.pixels[index])*kernel[i][j];
      blue+= blue(img1.pixels[index])*kernel[i][j];
      green+= green(img1.pixels[index])*kernel[i][j];
    }
  }
  red=constrain(abs(red),0,255);
  blue=constrain(abs(blue),0,255);
  green=constrain(abs(green),0,255);
  return color(red,green,blue);
}
      
// Gaussian blur approximation filter
void gaussian(){
  float[][] kernel = {{0.0625,0.125,0.0625}, {0.125,0.25,0.125}, {0.0625,0.125,0.0625}};
  OG();
  img1.loadPixels(); 
  img2.loadPixels();
  loadPixels();
  for (int x=0;x<img2.width;x++){
    for (int y=0;y<img2.height;y++){
      color c = changeTint(x,y,kernel,kernel[0].length);
      int idx = x+y*img2.width;
      img2.pixels[idx]=c;
    }
  }
  updatePixels();
  //img1.updatePixels();
  img2.updatePixels();
  image(img2,0,0);
}

// edge detection filter
void edgeDetection(){
  float[][] x_sobel = {{-1, 0, 1}, {-2,0,2}, {-1,0,1}};
  float[][] y_sobel = {{-1,-2,-1},{0,0,0},{1,2,1}};
  int kernel_size = 3;  
  img1.loadPixels();
  img2.loadPixels();
  for (int x = 0; x < img2.width; x++){
     for (int y = 0; y<img2.height;y++){
       int index = x+y*img2.width;
       img2.pixels[index] = sobel(x,y,x_sobel,y_sobel,kernel_size);
     }
   }
    //img1.updatePixels();
    img2.updatePixels();
    image(img2,0,0);
}

// initialize Sobel color function
color sobel(int x,int y, float[][] x_sobel, float[][] y_sobel,int kernel_size){
  float xr = 0;
  float xg = 0;
  float xb = 0;
  float yr = 0;
  float yg = 0;
  float yb = 0;
  int change = kernel_size / 2;
  for (int i = 0; i < kernel_size; i++){
    for (int j = 0; j < kernel_size; j++){
      int idx = (x+i-change) + img1.width*(y+j-change);
      idx = constrain(idx,0,img1.pixels.length-1);
      xr += red(img1.pixels[idx])*x_sobel[i][j];
      xg += green(img1.pixels[idx])*x_sobel[i][j];
      xb += blue(img1.pixels[idx])*x_sobel[i][j];
      yr += red(img1.pixels[idx])*y_sobel[i][j];
      yg += green(img1.pixels[idx])*y_sobel[i][j];
      yb += blue(img1.pixels[idx])*y_sobel[i][j];
    }
  }
  float r = sqrt(xr*xr + yr*yr);
  float g = sqrt(xg*xg + yg*yg);
  float b = sqrt(xb*xb + yb*yb);
  
  r = constrain(r,0,255);
  g = constrain(g,0,255);
  b = constrain(b,0,255);
  return color(r,g,b);
}
  
// Draw loop
int input=0;
void draw(){
  image(img1,0,0);
  //if (keyPressed){
    if (key=='0'){
      OG();
      image(img2,0,0);
    }else if (key=='1'){
      grayScale();
      image(img2,0,0);
    }else if (key=='2'){
      contrast();
      image(img2,0,0);
    }else if (key=='3'){
      gaussian();
      image(img2,0,0);
    }else if (key=='4'){
      edgeDetection();
      image(img2,0,0);
    }else{
      OG();
      image(img2,0,0);
    }
  }
//}
    