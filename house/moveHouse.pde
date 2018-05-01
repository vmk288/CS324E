class moveHouse {
  float x, y, z, x1, y1, z1, s, s1, velocity;
  color col1, col2;
  int index;
  House h1, h2;
  
  public moveHouse(float x, float y, float z, float x1, float y1, float z1, float s, float s1, float velocity, color col1, color col2) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.x1 = x1;
    this.y1 = y1;
    this.z1 = z1;
    this.s = s;
    this.s1 = s1;
    this.velocity = velocity;
    this.col1 = col1;
    this.col2 = col2;
    h1 = new House(s1 + x, y, z, 0, 0, 0, s, col1);
    h2 = new House(-s1 + x, y, z, 0, 0, 0, s, col2);
    index = 0;
  }
  
  void update() {
    index++;
    h1.move(x+s1*sin(velocity*index), y+s1*sin(cos(velocity*index)), z-s1*cos(velocity*index), 0.05/(1+velocity*velocity)*index, 0.05/(1+velocity*velocity)*index, 0.05/(1+velocity*velocity)*index);
    h2.move(x-s1*cos(velocity*index), y-s1*cos(sin(velocity*index)), z+s1*sin(velocity*index), -0.05/(1+velocity*velocity)*index, -0.05/(1+velocity*velocity)*index, -0.05/(1+velocity*velocity)*index);
  }
  
  void twirl() {
    h1.twirl();
    h2.twirl();
  }

}