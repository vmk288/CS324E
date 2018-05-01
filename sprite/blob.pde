class Blob {
  PImage[] imgs;
  int imgCt;
  int frame;
  
  Blob(String folder, int ct) {
    imgCt = ct;
    imgs = new PImage[imgCt];

    for (int i = 0; i < imgCt; i++) {
      String file = folder + nf(i, 1) + ".png";
      imgs[i] = loadImage(file);
    }
  }

  void display(float x, float y) {
    frame = (frame + 1) % imgCt;
    image(imgs[frame], x, y);
  }
}