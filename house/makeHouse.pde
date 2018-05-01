class House {
  float x, y, z;
  float x1, y1, z1;
  float s;
  color col;
  
  public House(float x, float y, float z, float x1, float y1, float z1, float s, color col) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.x1 = x1;
    this.y1 = y1;
    this.z1 = z1;
    this.s = s;
    this.col = col;
  }
  
  void move(float x2, float y2, float z2, float a, float b, float c) {
    x = x2;
    y = y2;
    z = z2;
    x1 = a;
    y1 = b;
    z1 = c;
  }
  
  void twirl() {
    fill(col,175); //adding a bit of transparency to show 3D
    stroke(2.5);
    pushMatrix();
      translate(x, y, z);
      rotateZ(z1);
      rotateY(y1);
      rotateX(x1);
      beginShape(TRIANGLE);
  //Front
        vertex(0, 0, 0);
        vertex(0, s/2, 0);
        vertex(s/2, s/2, 0);
        vertex(0, 0, 0);
        vertex(s/2, 0, 0);
        vertex(s/2, s/2, 0);
      endShape();
  //Left-side
      beginShape(TRIANGLE);
        vertex(0, 0, 0);
        vertex(0, s/2, 0);
        vertex(0, s/2, -s/2);
        vertex(0, 0, 0);
        vertex(0, 0, -s/2);
        vertex(0, s/2, -s/2);
        vertex(0, 0, 0);
        vertex(0, -s/4, -s/4);
        vertex(0, 0, -s/2);
      endShape();
  //back
      beginShape(TRIANGLE);
        vertex(0, 0, -s/2);
        vertex(0, s/2, -s/2);
        vertex(s/2, s/2, -s/2);
        vertex(0, 0, -s/2);
        vertex(s/2, 0, -s/2);
        vertex(s/2, s/2, -s/2);
      endShape();
  //Right-side
      beginShape(TRIANGLE);
        vertex(s/2, 0, 0);
        vertex(s/2, s/2, 0);
        vertex(s/2, s/2, -s/2);
        vertex(s/2, 0, 0);
        vertex(s/2, 0, -s/2);
        vertex(s/2, s/2, -s/2);
        vertex(s/2, 0, 0);
        vertex(s/2, -s/4, -s/4);
        vertex(s/2, 0, -s/2);
      endShape();
  //Top-Front
      beginShape(TRIANGLE);
        vertex(0, 0, 0);
        vertex(s/2, 0, 0);
        vertex(0, -s/4, -s/4);
        vertex(s/2, 0, 0);
        vertex(s/2, -s/4, -s/4);
        vertex(0, -s/4, -s/4);
      endShape();
  //Top-Back
      beginShape(TRIANGLE);
        vertex(0, 0, -s/2);
        vertex(s/2, 0, -s/2);
        vertex(0, -s/4, -s/4);
        vertex(s/2, 0, -s/2);
        vertex(s/2, -s/4, -s/4);
        vertex(0, -s/4, -s/4);
      endShape();
  //Bottom
      beginShape(TRIANGLE);
        vertex(0, s/2, 0);
        vertex(s/2, s/2, 0);
        vertex(s/2, s/2, -s/2);
        vertex(0, s/2, 0);
        vertex(0, s/2, -s/2);
        vertex(s/2, s/2, -s/2);
      endShape();
  popMatrix();
  }
}